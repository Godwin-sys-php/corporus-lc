const Sessions = require("../Models/Sessions");
const moment = require("moment");
const SessionItems = require("../Models/SessionItems");
const Products = require("../Models/Products");
const Transactions = require("../Models/Transactions");
const MTransactions = require("../Models/MTransactions");
const MCategory = require("../Models/MCategory");
const Clients = require("../Models/Clients");
const Users = require("../Models/Users");
const PTCategory = require("../Models/PTCategory");
const MAccount = require("../Models/MAccount");
const Debts = require("../Models/Debts");
const fs = require("fs");
const path = require("path");
const ejs = require("ejs");
const pdf = require("html-pdf");

function setAt6AM(timestamp) {
  // Crée un objet moment à partir du timestamp en secondes
  let momentObject = moment.unix(timestamp).utcOffset('+01:00');
  
  // Remet l'heure à 6h du matin du même jour en GMT+1
  momentObject.set({ hour: 6, minute: 0, second: 0, millisecond: 0 });
  
  // Retourner le nouveau timestamp en secondes
  return momentObject.unix();
}

function setAt00AM(timestamp) {
  // Crée un objet moment à partir du timestamp en secondes
  let momentObject = moment.unix(timestamp).utcOffset('+01:00');
  
  // Remet l'heure à 00h00 du même jour en GMT+1
  momentObject.set({ hour: 0, minute: 0, second: 0, millisecond: 0 });
  
  // Retourner le nouveau timestamp en secondes
  return momentObject.unix();
}

require("dotenv").config();

exports.startNewSession = async (req, res) => {
  try {
    const now = moment();
    const toInsert = {
      clientId: req._client.id,
      clientName: req._client.name,
      userId: req.user.id,
      userName: req.user.name,
      serverName: req.body.fromMobile ? req.user.name : req.body.serverName,
      total: 0,
      reduction: 0,
      isDone: 0,
      isPaid: 0,
      invoice: null,
      timestamp: now.unix(),
    };

    const inserted = await Sessions.insertOne(toInsert);

    const sessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 0 OR (isPaid = 0 AND isDebt = 0)",
      []
    );
    const clients = await Clients.customQuery("SELECT * FROM clients", []);
    const servers = await Users.customQuery(
      "SELECT * FROM users WHERE type = ?",
      ["serveur"]
    );

    req.app
      .get("socketService")
      .broadcastEmiter(JSON.stringify(sessions), "new-session");

    return res.status(200).json({
      success: true,
      message: "Session créée",
      data: inserted.insertId,
      sessions,
      clients,
      servers,
    });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.addItem = async (req, res) => {
  try {
    if (req._product.inStock - req.body.quantity < 0) {
      return res
        .status(400)
        .json({ error: true, message: "Stock insuffisant" });
    }
    const now = moment();
    const defaultCategory = await PTCategory.customQuery(
      "SELECT * FROM ptCategory WHERE id = 1"
    );
    const toInsert = {
      userId: req.user.id,
      userName: req.user.name,
      sessionId: req.params.id,
      productId: req._product.id,
      productName: req._product.name,
      quantity: Number(req.body.quantity),
      price: req._product.price,
      timestamp: now.unix(),
    };
    const toInsertTransactions = {
      sessionId: req.params.id,
      categoryId: defaultCategory[0].id,
      productId: req._product.id,
      userId: req.user.id,
      categoryName: defaultCategory[0].name,
      productName: req._product.name,
      userName: req.user.name,
      enter: 0,
      outlet: Number(req.body.quantity),
      after: req._product.inStock - Number(req.body.quantity),
      description: `Vente de ${req._product.name}`,
      timestamp: now.unix(),
    };

    await SessionItems.insertOne(toInsert);
    await Products.update(
      { inStock: Number(req._product.inStock) - Number(req.body.quantity) },
      { id: req._product.id }
    );
    await Transactions.insertOne(toInsertTransactions);
    await Sessions.update(
      { total: req._session.total + req._product.price * req.body.quantity },
      { id: req.params.id }
    );

    const sessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 0 OR (isPaid = 0 AND isDebt = 0)",
      []
    );
    const session = await Sessions.find({ id: req.params.id });
    const items = await SessionItems.customQuery(
      "SELECT * FROM sessionItems WHERE sessionId = ?",
      [req.params.id]
    );

    req.app
      .get("socketService")
      .broadcastEmiter(JSON.stringify(sessions), "new-session");
    req.app.get("socketService").broadcastEmiter(
      JSON.stringify({
        id: req.params.id,
        session: session[0],
        items: items,
      }),
      "edit-session"
    );

    return res.status(200).json({
      success: true,
      message: "Article ajouté",
      sessions,
      session: session[0],
      items,
    });
  } catch (error) {
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.removeItem = async (req, res) => {
  try {
    const now = moment();
    const defaultCategory = await PTCategory.customQuery(
      "SELECT * FROM ptCategory WHERE id = 3"
    );
    const toInsertTransactions = {
      sessionId: req.params.id,
      categoryId: defaultCategory[0].id,
      productId: req._item.productId,
      userId: req.user.id,
      categoryName: defaultCategory[0].name,
      productName: req._item.productName,
      userName: req.user.name,
      enter: Number(req._item.quantity),
      outlet: 0,
      after: req._product.inStock + Number(req._item.quantity),
      description: `Retour de ${req._item.productName}`,
      timestamp: now.unix(),
    };

    await SessionItems.delete({ id: req._item.id });
    await Products.update(
      { inStock: req._product.inStock + req._item.quantity },
      { id: req._item.productId }
    );
    await Transactions.insertOne(toInsertTransactions);
    await Sessions.update(
      { total: req._session.total - req._item.price * req._item.quantity },
      { id: req.params.id }
    );

    const sessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 0 OR (isPaid = 0 AND isDebt = 0)",
      []
    );
    const session = await Sessions.find({ id: req.params.id });
    const items = await SessionItems.customQuery(
      "SELECT * FROM sessionItems WHERE sessionId = ?",
      [req.params.id]
    );

    req.app
      .get("socketService")
      .broadcastEmiter(JSON.stringify(sessions), "new-session");
    req.app.get("socketService").broadcastEmiter(
      JSON.stringify({
        id: req.params.id,
        session: session[0],
        items: items,
      }),
      "edit-session"
    );

    return res.status(200).json({
      success: true,
      message: "Article retiré",
      sessions,
      session: session[0],
      items,
    });
  } catch (error) {
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.increaseQuantity = async (req, res) => {
  try {
    console.log("hey");
    const now = moment();
    const productData = await Products.find({ id: req._item.productId });
    const quantityToSet = req._item.quantity + 1;
    console.log(quantityToSet);
    console.log(req._item);

    if (productData[0].inStock - 1 < 0) {
      return res
        .status(400)
        .json({ error: true, message: "Stock insuffisant" });
    }

    const defaultCategoryForOutlet = await PTCategory.customQuery(
      "SELECT * FROM ptCategory WHERE id = 3"
    );

    const toInsertTransactions = {
      sessionId: req.params.id,
      categoryId: defaultCategoryForOutlet[0].id,
      productId: req._item.productId,
      userId: req.user.id,
      categoryName: defaultCategoryForOutlet[0].name,
      productName: req._item.productName,
      userName: req.user.name,
      enter: 0,
      outlet: 1,
      after: productData[0].inStock - 1,
      description: `Retrait de 1 ${req._item.productName}`,
      timestamp: now.unix(),
    };

    let falseTotal = req._session.total - req._item.price * req._item.quantity;
    let newTotal = falseTotal + req._item.price * quantityToSet;

    await Transactions.insertOne(toInsertTransactions);
    await SessionItems.update(
      { quantity: quantityToSet },
      { id: req.params.idItem }
    );
    await Products.update(
      { inStock: productData[0].inStock - 1 },
      { id: req._item.productId }
    );
    await Sessions.update({ total: newTotal }, { id: req.params.id });

    const sessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 0 OR (isPaid = 0 AND isDebt = 0)",
      []
    );
    const session = await Sessions.find({ id: req.params.id });
    const items = await SessionItems.customQuery(
      "SELECT * FROM sessionItems WHERE sessionId = ?",
      [req.params.id]
    );

    req.app
      .get("socketService")
      .broadcastEmiter(JSON.stringify(sessions), "new-session");
    req.app.get("socketService").broadcastEmiter(
      JSON.stringify({
        id: req.params.id,
        session: session[0],
        items: items,
      }),
      "edit-session"
    );

    return res.status(200).json({
      success: true,
      message: "Quantité augmentée",
      sessions,
      session: session[0],
      items,
    });
  } catch (error) {
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.decreaseQuantity = async (req, res) => {
  try {
    const now = moment();
    const productData = await Products.find({ id: req._item.productId });
    const quantityToSet = req._item.quantity - 1;

    if (quantityToSet < 1) {
      return res
        .status(400)
        .json({ error: true, message: "Quantité minimale atteinte" });
    }

    if (quantityToSet > productData[0].inStock) {
      return res
        .status(400)
        .json({ error: true, message: "Stock insuffisant" });
    }

    const defaultCategoryForEnter = await PTCategory.customQuery(
      "SELECT * FROM ptCategory WHERE id = 2"
    );

    const toInsertTransactions = {
      sessionId: req.params.id,
      categoryId: defaultCategoryForEnter[0].id,
      productId: req._item.productId,
      userId: req.user.id,
      categoryName: defaultCategoryForEnter[0].name,
      productName: req._item.productName,
      userName: req.user.name,
      enter: 1,
      outlet: 0,
      after: productData[0].inStock + 1,
      description: `Ajout de 1 ${req._item.productName}`,
      timestamp: now.unix(),
    };

    let falseTotal = req._session.total - req._item.price * req._item.quantity;
    let newTotal = falseTotal + req._item.price * quantityToSet;

    await Transactions.insertOne(toInsertTransactions);
    await SessionItems.update(
      { quantity: quantityToSet },
      { id: req.params.idItem }
    );
    await Products.update(
      { inStock: productData[0].inStock + 1 },
      { id: req._item.productId }
    );
    await Sessions.update({ total: newTotal }, { id: req.params.id });

    const sessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 0 OR (isPaid = 0 AND isDebt = 0)",
      []
    );
    const session = await Sessions.find({ id: req.params.id });
    const items = await SessionItems.customQuery(
      "SELECT * FROM sessionItems WHERE sessionId = ?",
      [req.params.id]
    );

    req.app
      .get("socketService")
      .broadcastEmiter(JSON.stringify(sessions), "new-session");
    req.app.get("socketService").broadcastEmiter(
      JSON.stringify({
        id: req.params.id,
        session: session[0],
        items: items,
      }),
      "edit-session"
    );

    return res.status(200).json({
      success: true,
      message: "Quantité baissée",
      sessions,
      session: session[0],
      items,
    });
  } catch (error) {
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

// exports.changeQuantity = async (req, res) => {
//   try {
//     const now = moment();
//     const productData = await Products.find({ id: req._item.productId });
//     const quantityToSet = Number(req.body.quantity);
//     const quantityDifference = quantityToSet - req._item.quantity;

//     if (quantityDifference === 0) {
//       return res.status(400).json({ error: true, message: "Quantité identique" });
//     }
//     if (quantityToSet > productData[0].inStock) {
//       return res.status(400).json({ error: true, message: "Stock insuffisant" });
//     }

//     const defaultCategoryForEnter = await PTCategory.customQuery("SELECT * FROM ptCategory WHERE id = 2");
//     const defaultCategoryForOutlet = await PTCategory.customQuery("SELECT * FROM ptCategory WHERE id = 3");

//     const toInsertTransactions = {
//       sessionId: req.params.id,
//       categoryId: quantityDifference < 0 ? defaultCategoryForEnter[0].id : defaultCategoryForOutlet[0].id,
//       productId: req._item.productId,
//       userId: req.user.id,
//       categoryName: quantityDifference < 0 ? defaultCategoryForEnter[0].name : defaultCategoryForOutlet[0].name,
//       productName: req._item.productName,
//       userName: req.user.name,
//       enter: quantityDifference < 0 ? Math.abs(quantityDifference) : 0,
//       outlet: quantityDifference > 0 ? quantityDifference : 0,
//       after: productData[0].inStock - quantityDifference,
//       description: quantityDifference < 0 ? `Ajout de ${quantityDifference} ${req._item.productName}` : `Retrait de ${Math.abs(quantityDifference)} ${req._item.productName}`,
//       timestamp: now.unix(),
//     };

//     let falseTotal = req._session.total - (req._item.price * req._item.quantity);
//     let newTotal = falseTotal + (req._item.price * quantityToSet);

//     await Transactions.insertOne(toInsertTransactions);
//     await SessionItems.update({ quantity: quantityToSet }, { id: req.params.itemId });
//     await Products.update({ inStock: productData[0].inStock - quantityDifference }, { id: req._item.productId });
//     await Sessions.update({ total: newTotal }, { id: req.params.id });

//
//    const sessions = await Sessions.customQuery("SELECT * FROM sessions WHERE isDone = 0 OR (isPaid = 0 AND isDebt = 0)", []);
//     const session = await Sessions.find({ id: req.params.id });
//     const items = await SessionItems.customQuery("SELECT * FROM sessionItems WHERE sessionId = ?", [req.params.id]);

//     return res.status(200).json({ success: true, message: "Quantité modifiée", sessions, session: session[0], items });
//   } catch (error) {
//     return res.status(500).json({ error: true, message: "Une erreur inconnue a eu lieu" });
//   }
// }

exports.addReduction = async (req, res) => {
  try {
    if (req.body.amount > req._session.total) {
      return res
        .status(400)
        .json({ error: true, message: "Réduction supérieure au total" });
    }

    await Sessions.update(
      { reduction: req.body.amount },
      { id: req.params.id }
    );

    const sessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 0 OR (isPaid = 0 AND isDebt = 0)",
      []
    );
    const session = await Sessions.find({ id: req.params.id });
    const items = await SessionItems.customQuery(
      "SELECT * FROM sessionItems WHERE sessionId = ?",
      [req.params.id]
    );

    req.app
      .get("socketService")
      .broadcastEmiter(JSON.stringify(sessions), "new-session");
    req.app.get("socketService").broadcastEmiter(
      JSON.stringify({
        id: req.params.id,
        session: session[0],
        items: items,
      }),
      "edit-session"
    );

    return res.status(200).json({
      success: true,
      message: "Réduction ajoutée",
      sessions,
      session: session[0],
      items,
    });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.removeReduction = async (req, res) => {
  try {
    await Sessions.update({ reduction: 0 }, { id: req.params.id });

    const sessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 0 OR (isPaid = 0 AND isDebt = 0)",
      []
    );
    const session = await Sessions.find({ id: req.params.id });
    const items = await SessionItems.customQuery(
      "SELECT * FROM sessionItems WHERE sessionId = ?",
      [req.params.id]
    );

    req.app
      .get("socketService")
      .broadcastEmiter(JSON.stringify(sessions), "new-session");
    req.app.get("socketService").broadcastEmiter(
      JSON.stringify({
        id: req.params.id,
        session: session[0],
        items: items,
      }),
      "edit-session"
    );

    return res.status(200).json({
      success: true,
      message: "Réduction retirée",
      sessions,
      session: session[0],
      items,
    });
  } catch (error) {
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.debtSession = async (req, res) => {
  try {
    const now = moment();
    const client = await Clients.find({ id: req._session.clientId });
    await Sessions.update({ isDebt: 1 }, { id: req.params.id });

    const toInsertDebt = {
      userId: req.user.id,
      clientId: req._session.clientId,
      sessionId: req.params.id,
      accountId: null,
      userName: req.user.name,
      clientName: req._session.clientName,
      enter: req._session.total - req._session.reduction,
      outlet: 0,
      note: "Dette",
      timestamp: now.unix(),
    };

    await Debts.insertOne(toInsertDebt);
    await Clients.update(
      { debt: client[0].debt + (req._session.total - req._session.reduction) },
      { id: client[0].id }
    );

    const sessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 0 OR (isPaid = 0 AND isDebt = 0)",
      []
    );
    const session = await Sessions.find({ id: req.params.id });
    const items = await SessionItems.customQuery(
      "SELECT * FROM sessionItems WHERE sessionId = ?",
      [req.params.id]
    );

    req.app
      .get("socketService")
      .broadcastEmiter(JSON.stringify(sessions), "new-session");
    req.app.get("socketService").broadcastEmiter(
      JSON.stringify({
        id: req.params.id,
        session: session[0],
        items: items,
      }),
      "edit-session"
    );

    return res.status(200).json({
      success: true,
      message: "Session mise en dette",
      sessions,
      session: session[0],
      items,
    });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.endSession = async (req, res, next) => {
  try {
    await Sessions.update({ isDone: 1 }, { id: req.params.id });

    return next();
  } catch (error) {
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.paySession = async (req, res) => {
  try {
    const now = moment();
    const defaultCategory = await MCategory.customQuery(
      "SELECT * FROM mCategory WHERE id = 1"
    );
    const accountData = await MAccount.find({ id: req.body.accountId });
    if (accountData === undefined || accountData.length === 0) {
      return res
        .status(400)
        .json({ error: true, message: "Compte inexistant" });
    }

    const toInsert = {
      categoryId: defaultCategory[0].id,
      accountId: accountData[0].id,
      userId: req.user.id,
      categoryName: defaultCategory[0].name,
      userName: req.user.name,
      accountName: accountData[0].name,
      enter: req._session.total - req._session.reduction,
      outlet: 0,
      after:
        accountData[0].amount + (req._session.total - req._session.reduction),
      description: `Paiement facture ; ID: ${req.params.id}`,
      timestamp: now.unix(),
    };
    await MTransactions.insertOne(toInsert);
    await MAccount.update(
      { amount: toInsert.after },
      { id: accountData[0].id }
    );

    await Sessions.update(
      {
        isPaid: 1,
        accountName: accountData[0].name,
        accountId: accountData[0].id,
      },
      { id: req.params.id }
    );

    const sessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 0 OR (isPaid = 0 AND isDebt = 0)",
      []
    );
    const session = await Sessions.find({ id: req.params.id });
    const items = await SessionItems.customQuery(
      "SELECT * FROM sessionItems WHERE sessionId = ?",
      [req.params.id]
    );

    req.app
      .get("socketService")
      .broadcastEmiter(JSON.stringify(sessions), "new-session");
    req.app.get("socketService").broadcastEmiter(
      JSON.stringify({
        id: req.params.id,
        session: session[0],
        items: items,
      }),
      "edit-session"
    );

    return res.status(200).json({
      success: true,
      message: "Session payée",
      sessions,
      session: session[0],
      items,
    });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.removeIsDone = async (req, res) => {
  try {
    await Sessions.update({ isDone: 0 }, { id: req.params.id });
    const sessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 0 OR (isPaid = 0 AND isDebt = 0)",
      []
    );
    const session = await Sessions.find({ id: req.params.id });
    const items = await SessionItems.customQuery(
      "SELECT * FROM sessionItems WHERE sessionId = ?",
      [req.params.id]
    );

    req.app
      .get("socketService")
      .broadcastEmiter(JSON.stringify(sessions), "new-session");
    req.app.get("socketService").broadcastEmiter(
      JSON.stringify({
        id: req.params.id,
        session: session[0],
        items: items,
      }),
      "edit-session"
    );

    return res.status(200).json({
      success: true,
      message: "Annulation facture",
      sessions,
      session: session[0],
      items,
    });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.removePayment = async (req, res) => {
  try {
    const now = moment();
    const defaultCategory = await MCategory.customQuery(
      "SELECT * FROM mCategory WHERE id = 1"
    );
    const accountData = await MAccount.find({ id: req._session.accountId });
    if (accountData === undefined || accountData.length === 0) {
      return res
        .status(400)
        .json({ error: true, message: "Compte inexistant" });
    }

    const toInsert = {
      categoryId: defaultCategory[0].id,
      accountId: accountData[0].id,
      userId: req.user.id,
      categoryName: defaultCategory[0].name,
      userName: req.user.name,
      accountName: accountData[0].name,
      enter: 0,
      outlet: req._session.total - req._session.reduction,
      after:
        accountData[0].amount - (req._session.total - req._session.reduction),
      description: `Annulation paiement facture ; ID: ${req.params.id}`,
      timestamp: now.unix(),
    };
    await MTransactions.insertOne(toInsert);
    await MAccount.update(
      { amount: toInsert.after },
      { id: accountData[0].id }
    );

    await Sessions.update(
      { isPaid: 0, accountName: null, accountId: null },
      { id: req.params.id }
    );

    const sessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 0 OR (isPaid = 0 AND isDebt = 0)",
      []
    );
    const session = await Sessions.find({ id: req.params.id });
    const items = await SessionItems.customQuery(
      "SELECT * FROM sessionItems WHERE sessionId = ?",
      [req.params.id]
    );

    req.app
      .get("socketService")
      .broadcastEmiter(JSON.stringify(sessions), "new-session");
    req.app.get("socketService").broadcastEmiter(
      JSON.stringify({
        id: req.params.id,
        session: session[0],
        items: items,
      }),
      "edit-session"
    );

    return res.status(200).json({
      success: true,
      message: "Annulation paiement",
      sessions,
      session: session[0],
      items,
    });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.getNotDoneSessions = async (req, res) => {
  try {
    const sessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 0 OR (isPaid = 0 AND isDebt = 0)",
      []
    );
    const clients = await Clients.customQuery("SELECT * FROM clients", []);
    const servers = await Users.customQuery(
      "SELECT * FROM users WHERE type = ?",
      ["serveur"]
    );

    return res.status(200).json({ success: true, sessions, clients, servers });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.getNotDoneSessionsFromUser = async (req, res) => {
  try {
    const sessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE (isDone = 0 OR (isPaid = 0 AND isDebt = 0)) AND serverName = ?",
      [req.user.name]
    );
    const clients = await Clients.customQuery("SELECT * FROM clients", []);
    const servers = await Users.customQuery(
      "SELECT * FROM users WHERE type = ?",
      ["serveur"]
    );

    return res.status(200).json({ success: true, sessions, clients, servers });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.getClientsInDebt = async (req, res) => {
  try {
    const clients = await Clients.customQuery(
      "SELECT * FROM clients WHERE debt > 0",
      []
    );
    return res.status(200).json({ success: true, clients });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.getOneSession = async (req, res) => {
  try {
    const session = await Sessions.find({ id: req.params.id });
    const items = await SessionItems.customQuery(
      "SELECT * FROM sessionItems WHERE sessionId = ?",
      [req.params.id]
    );
    const accounts = await MAccount.findAll();

    return res
      .status(200)
      .json({ success: true, session: session[0], items, accounts });
  } catch (error) {
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.getReportOfADay = async (req, res) => {
  try {
    const begin = setAt6AM(Number(req.params.timestamp));
    console.log(begin);
    const end = setAt6AM(Number(req.params.timestamp) + 86400); // marge de 4 heures en plus
    console.log(end);

    const revenue = await Sessions.customQuery(
      "SELECT SUM(total-reduction) as total FROM sessions WHERE isDone = 1 AND isPaid = 1 AND timestamp > ? AND timestamp < ?",
      [begin, end]
    );
    const revenueForEachAccount = await Sessions.customQuery(
      "SELECT accountId, accountName, SUM(total-reduction) as total FROM sessions WHERE isDone = 1 AND isPaid = 1 AND timestamp > ? AND timestamp < ? GROUP BY accountId",
      [begin, end]
    );
    const revenueForEachCategorie = await Sessions.customQuery(`
      SELECT 
    pc.name AS category_name,
    SUM(si.price * si.quantity) AS category_revenue
FROM 
    sessions s
JOIN 
    sessionItems si ON s.id = si.sessionId
JOIN 
    products p ON si.productId = p.id
JOIN 
    productsCategory pc ON p.categoryId = pc.id
WHERE 
    s.isPaid = 1
    AND s.timestamp BETWEEN ? AND ?
GROUP BY 
    pc.name;
`, [begin, end]);

    const debtTaken = await Sessions.customQuery(
      "SELECT SUM(total-reduction) as total FROM sessions WHERE isDone = 1 AND isDebt = 1 AND timestamp > ? AND timestamp < ?",
      [begin, end]
    );

    const paidSessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 1 AND isPaid = 1 AND timestamp > ? AND timestamp < ?",
      [begin, end]
    );
    const debtSessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 1 AND isPaid = 0 AND isDebt = 1 AND timestamp > ? AND timestamp < ?",
      [begin, end]
    );
    const notPaidSessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 1 AND isPaid = 0 AND isDebt = 0 AND timestamp > ? AND timestamp < ?",
      [begin, end]
    );

    const selledItems = await SessionItems.customQuery(
      "SELECT SUM(si.quantity) AS quantity, si.productName, si.id, p.categoryName FROM sessionItems si JOIN products p ON si.productId = p.id WHERE si.timestamp > ? AND si.timestamp < ? GROUP BY si.productId, si.productName, p.categoryName",
      [begin, end]
    );

    const sessions = await Sessions.customQuery("SELECT * FROM sessions WHERE timestamp > ? AND timestamp < ?", [begin, end]);
    
    const cumulClients = await Sessions.customQuery("SELECT clientName, SUM(total - reduction) AS total FROM sessions WHERE timestamp > ? AND timestamp < ? AND isDone = 1 AND isPaid = 1 GROUP BY clientName", [begin, end]);

    return res
      .status(200)
      .json({
        success: true,
        revenue: revenue[0].total,
        debtTaken: debtTaken[0].total,
        paidSessions,
        debtSessions,
        notPaidSessions,
        revenueForEachAccount,
        selledItems,
        revenueForEachCategorie,
        sessions,
        cumulClients,
      });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.getReportOfAPeriod = async (req, res) => {
  try {
    const begin = setAt6AM(Number(req.params.begin));
    console.log(begin);
    const end = setAt6AM(Number(req.params.end) + 86400);
    console.log(end);

    const revenue = await Sessions.customQuery(
      "SELECT SUM(total-reduction) as total FROM sessions WHERE isDone = 1 AND isPaid = 1 AND timestamp > ? AND timestamp < ?",
      [begin, end]
    );
    const revenueForEachAccount = await Sessions.customQuery(
      "SELECT accountId, accountName, SUM(total-reduction) as total FROM sessions WHERE isDone = 1 AND isPaid = 1 AND timestamp > ? AND timestamp < ? GROUP BY accountId",
      [begin, end]
    );
    const revenueForEachCategorie = await Sessions.customQuery(`
      SELECT 
    pc.name AS category_name,
    SUM(si.price * si.quantity) AS category_revenue
FROM 
    sessions s
JOIN 
    sessionItems si ON s.id = si.sessionId
JOIN 
    products p ON si.productId = p.id
JOIN 
    productsCategory pc ON p.categoryId = pc.id
WHERE 
    s.isPaid = 1
    AND s.timestamp BETWEEN ? AND ?
GROUP BY 
    pc.name;
`, [begin, end]);

    const debtTaken = await Sessions.customQuery(
      "SELECT SUM(total-reduction) as total FROM sessions WHERE isDone = 1 AND isDebt = 1 AND timestamp > ? AND timestamp < ?",
      [begin, end]
    );

    const paidSessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 1 AND isPaid = 1 AND timestamp > ? AND timestamp < ?",
      [begin, end]
    );
    const debtSessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 1 AND isPaid = 0 AND isDebt = 1 AND timestamp > ? AND timestamp < ?",
      [begin, end]
    );
    const notPaidSessions = await Sessions.customQuery(
      "SELECT * FROM sessions WHERE isDone = 1 AND isPaid = 0 AND isDebt = 0 AND timestamp > ? AND timestamp < ?",
      [begin, end]
    );

    const selledItems = await SessionItems.customQuery(
      "SELECT SUM(si.quantity) AS quantity, si.productName, si.id, p.categoryName FROM sessionItems si JOIN products p ON si.productId = p.id WHERE si.timestamp > ? AND si.timestamp < ? GROUP BY si.productId, si.productName, p.categoryName",
      [begin, end]
    );
    
    const cumulClients = await Sessions.customQuery("SELECT clientName, SUM(total - reduction) AS total FROM sessions WHERE timestamp > ? AND timestamp < ? AND isDone = 1 AND isPaid = 1 GROUP BY clientName", [begin, end]);

    const sessions = await Sessions.customQuery("SELECT * FROM sessions WHERE timestamp > ? AND timestamp < ?", [begin, end]);

    return res
      .status(200)
      .json({
        success: true,
        revenue: revenue[0].total,
        debtTaken: debtTaken[0].total,
        paidSessions,
        debtSessions,
        notPaidSessions,
        revenueForEachAccount,
        selledItems,
        revenueForEachCategorie,
        cumulClients,
        sessions,
      });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};

exports.generateVoucherForDrinks = async (req, res) => {
  try {
    console.log("SCUMMMMMMM");
    const now = moment().utcOffset(1);
    const items = await Sessions.customQuery(
      "SELECT i.productName as productName, i.quantity-taken as quantity2print, i.price as price from sessionItems i left join products p on p.id = i.productId WHERE i.quantity != taken AND i.sessionId = ? AND (p.categoryId = 1 OR p.categoryId=2 OR p.categoryId=4)",
      [req.params.id]
    );

    console.log(items);
    await Sessions.customQuery(
      "UPDATE sessionItems i left join products p on p.id = i.productId SET i.taken = i.quantity WHERE i.sessionId = ? AND (p.categoryId = 1 OR p.categoryId=2 OR p.categoryId=4)",
      [req.params.id]
    );

    const number = fs.readFileSync(
      path.join(__dirname, "../Assets/", "number-voucher.txt"),
      "utf-8"
    );

    const nameOfTemplate = "voucher.ejs";
    const data = {
      data: {
        items: items,
        date: now.format("DD/MM/yyyy"),
        hours: now.format("H:mm"),
        number: number,
        serverName: req._session.serverName,
        client: req._session.clientName,
      },
    };

    ejs.renderFile(
      path.join(__dirname, "../Assets/", nameOfTemplate),
      data,
      (err, data) => {
        if (err) {
          console.log(err);
        } else {
          let options = {
            childProcessOptions: {
              env: {
                OPENSSL_CONF: "/dev/null",
              },
            },
            width: "7.5cm",
            localUrlAccess: true,
          };

          const nameOfFile = `Bon_${number}_${req._session.clientName}.pdf`;
          pdf
            .create(data, options)
            .toFile(`Invoices/Vouchers/${nameOfFile}`, (err, data) => {
              if (err) {
                console.log(err);
              } else {
                Sessions.customQuery("INSERT INTO vouchers SET ?", {
                  voucherUrl: `${process.env.URL}/Vouchers/${nameOfFile}`,
                  serverName: req._session.serverName,
                  clientName: req._session.clientName,
                  timestamp: now.unix(),
                })
                  .then(() => {
                    fs.writeFile(
                      path.join(__dirname, "../Assets/", "number-voucher.txt"),
                      `${Number(number) + 1}`,
                      "utf8",
                      () => {
                        req.app
                          .get("socketService")
                          .broadcastEmiter(
                            `${process.env.URL}/Vouchers/${nameOfFile}`,
                            "print-session"
                          );
                        res.status(200).json({ success: true });
                      }
                    );
                  })
                  .catch((error) => {
                    console.log(error);
                    res.status(500).json({ error: true, errorMessage: error });
                  });
              }
            });
        }
      }
    );
  } catch (error) {
    console.log(error);
    return res.status(500).json({ error: true });
  }
};

exports.generateVoucherForFoods = async (req, res) => {
  try {
    console.log("SCUMMMMMMM");
    const now = moment().utcOffset(1);
    const items = await Sessions.customQuery(
      "SELECT i.productName as productName, i.quantity-taken as quantity2print, i.price as price from sessionItems i left join products p on p.id = i.productId WHERE i.quantity != taken AND i.sessionId = ? AND p.categoryId = 3",
      [req.params.id]
    );

    console.log(items);
    await Sessions.customQuery(
      "UPDATE sessionItems i left join products p on p.id = i.productId SET i.taken = i.quantity WHERE i.sessionId = ? AND p.categoryId = 3",
      [req.params.id]
    );

    const number = fs.readFileSync(
      path.join(__dirname, "../Assets/", "number-voucher.txt"),
      "utf-8"
    );

    const nameOfTemplate = "voucher.ejs";
    const data = {
      data: {
        items: items,
        date: now.format("DD/MM/yyyy"),
        hours: now.format("H:mm"),
        number: number,
        serverName: req._session.serverName,
        client: req._session.clientName,
      },
    };

    ejs.renderFile(
      path.join(__dirname, "../Assets/", nameOfTemplate),
      data,
      (err, data) => {
        if (err) {
          console.log(err);
        } else {
          let options = {
            childProcessOptions: {
              env: {
                OPENSSL_CONF: "/dev/null",
              },
            },
            width: "7.5cm",
            localUrlAccess: true,
          };

          const nameOfFile = `Bon_${number}_${req._session.clientName}.pdf`;
          pdf
            .create(data, options)
            .toFile(`Invoices/Vouchers/${nameOfFile}`, (err, data) => {
              if (err) {
                console.log(err);
              } else {
                Sessions.customQuery("INSERT INTO vouchers SET ?", {
                  voucherUrl: `${process.env.URL}/Vouchers/${nameOfFile}`,
                  serverName: req._session.serverName,
                  clientName: req._session.clientName,
                  timestamp: now.unix(),
                })
                  .then(() => {
                    fs.writeFile(
                      path.join(__dirname, "../Assets/", "number-voucher.txt"),
                      `${Number(number) + 1}`,
                      "utf8",
                      () => {
                        req.app
                          .get("socketService")
                          .broadcastEmiter(
                            `${process.env.URL}/Vouchers/${nameOfFile}`,
                            "print-session"
                          );
                        res.status(200).json({ success: true });
                      }
                    );
                  })
                  .catch((error) => {
                    console.log(error);
                    res.status(500).json({ error: true, errorMessage: error });
                  });
              }
            });
        }
      }
    );
  } catch (error) {
    console.log(error);
    return res.status(500).json({ error: true });
  }
};

exports.getVouchersPrintWork = async (req, res) => {
  try {
    const vouchers = await Sessions.customQuery(
      "SELECT * FROM vouchers WHERE timestamp >= ? ORDER BY id DESC",
      [moment().startOf("day").unix()]
    );

    return res.status(200).json({ success: true, vouchers: vouchers });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: true, message: "Une erreur inconnue a eu lieu" });
  }
};