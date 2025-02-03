
exports.sessionCreation = (ID, clientName, userName) => `Création de la session ${ID} pour ${clientName} par ${userName}`;

exports.addItem = (ID, itemName, quantity, userName, transactionID) => `Ajout de ${quantity} ${itemName} à la session ${ID} par ${userName} (${transactionID})`;

exports.removeItem = (ID, itemName, quantity, userName, transactionID) => `Suppression de ${quantity} ${itemName} de la session ${ID} par ${userName} (ID de transaction: ${transactionID})`;

exports.increaseQuantity = (ID, itemName, quantity, userName, transactionID) => `Augmentation de la quantité de ${itemName} de ${quantity} dans la session ${ID} par ${userName} (ID de transaction: ${transactionID})`;

exports.decreaseQuantity = (ID, itemName, quantity, userName, transactionID) => `Diminution de la quantité de ${itemName} de ${quantity} dans la session ${ID} par ${userName} (ID de transaction: ${transactionID})`;

exports.addReduction = (ID, amount, userName) => `Ajout d'une réduction de ${amount} à la session ${ID} par ${userName}`;

exports.removeReduction = (ID, amount, userName) => `Suppression de la réduction de ${amount} de la session ${ID} par ${userName}`;

exports.paySession = (ID, userName, amount, paymentMethod, transactionID) => `Paiement de la session ${ID} par ${userName} de ${amount} par ${paymentMethod} (ID de transaction: ${transactionID})`;

exports.debtSession = (ID, userName, amount) => `Mise en dette de la session ${ID} par ${userName} de ${amount}`;

exports.printDrinksVoucher = (ID, voucherId, userName, items) => {
  let str = `Emission d'un bon de bar (ID: ${voucherId}) pour la session ${ID} par ${userName} pour `;
  items.forEach(item => {
    str += `${item.quantity2print} - ${item.productName} ; `;
  });
  return str;
}

exports.printFoodsVoucher = (ID, voucherId, userName, items) => {
  let str = `Emission d'un bon de cuisine (ID: ${voucherId}) pour la session ${ID} par ${userName} pour `;
  items.forEach(item => {
    str += `${item.quantity2print} - ${item.productName} ; `;
  });
  return str;
}

exports.removePayment = (ID, userName, amount, transactionID) => `Annulation du paiement de la session ${ID} par ${userName} de ${amount} (ID de transaction: ${transactionID})`;

exports.removeIsDone = (ID, userName) => `Annulation de la facturation de la session ${ID} par ${userName}`;

exports.endSession = (ID, userName) => `Facturation de la session ${ID} par ${userName}`;

exports.deleteSession = (ID, userName) => `Suppression de la session ${ID} par ${userName}`;