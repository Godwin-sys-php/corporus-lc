const Sessions = require("./Models/Sessions");
const xlsx = require('xlsx');

const util = require('util');

const getData = async () => {
  let data = [];
  const sessions = await Sessions.customQuery("SELECT * FROM sessions WHERE timestamp > ? AND timestamp < ?", [1732849200, 1732935600]);

  for (let index in sessions) {
    const items = await Sessions.customQuery("SELECT * FROM sessionItems WHERE sessionId = ?", [sessions[index].id]);

    data.push({ ...sessions[index], items });
  }

  return data;
}


getData().then((data) => {
  const invoices = data;
  const formatDate = (timestamp) => {
    const date = new Date(timestamp * 1000); // Multiplier par 1000 car timestamp est en secondes
    return date.toLocaleString("fr-FR", {
      year: "numeric",
      month: "2-digit",
      day: "2-digit",
      hour: "2-digit",
      minute: "2-digit",
    });
  };
  
  // Générer l'URL de la facture
  const generateInvoiceUrl = (invoice) =>
    invoice ? `http://143.198.59.223/invoices/${invoice}` : "Non disponible";
  
  // Fonction pour s'assurer que les lignes existent
  const ensureRowExists = (rows, index) => {
    if (!rows[index]) {
      rows[index] = [];
    }
  };
  
  // Fonction principale pour générer Excel
  function generateExcel(invoices) {
    const workbook = xlsx.utils.book_new();
  
    // Grouper les factures par tranches de 10
    for (let i = 0; i < invoices.length; i += 10) {
      const slice = invoices.slice(i, i + 10);
      const sheetName = `${slice[0].id}-${slice[slice.length - 1].id}`;
  
      // Créer une feuille
      const rows = [];
      const columnSpacing = 5; // Espacement horizontal entre les factures
  
      slice.forEach((invoice, index) => {
        const colOffset = index * (4 + columnSpacing); // Décalage horizontal avec espacement
  
        // Initialiser les lignes si elles n'existent pas
        ensureRowExists(rows, 0); rows[0][colOffset] = "Numéro de facture";
        ensureRowExists(rows, 1); rows[1][colOffset] = "Client";
        ensureRowExists(rows, 2); rows[2][colOffset] = "Serveur";
        ensureRowExists(rows, 3); rows[3][colOffset] = "Date & heure";
        ensureRowExists(rows, 4); rows[4][colOffset] = "Liens facture ?";
        ensureRowExists(rows, 5); rows[5][colOffset] = "Terminé ?";
        ensureRowExists(rows, 6); rows[6][colOffset] = "Produit";
        rows[6][colOffset + 1] = "Quantité";
        rows[6][colOffset + 2] = "Total";
        rows[6][colOffset + 3] = "Utilisateur";
  
        // Ajouter les données
        rows[0][colOffset + 1] = invoice.id;
        rows[1][colOffset + 1] = invoice.clientName || "Non spécifié";
        rows[2][colOffset + 1] = invoice.serverName || "Non spécifié";
        rows[3][colOffset + 1] = formatDate(invoice.timestamp);
        rows[4][colOffset + 1] = generateInvoiceUrl(invoice.invoice);
        rows[5][colOffset + 1] = invoice.isDone ? "Oui" : "Non";
  
        // Ajouter les produits
        let lastProductRow = 7; // Commence à la ligne 7
        invoice.items.forEach((item, idx) => {
          const productRow = 7 + idx;
          ensureRowExists(rows, productRow); // Initialiser la ligne si elle n'existe pas
          rows[productRow][colOffset] = item.productName;
          rows[productRow][colOffset + 1] = item.quantity;
          rows[productRow][colOffset + 2] = `${item.price * item.quantity}`;
          rows[productRow][colOffset + 3] = item.userName;
          lastProductRow = productRow;
        });
  
        // Ajouter le résumé de la facture après les produits avec un espace de 3 lignes maximum
        const summaryStartRow = lastProductRow + 3;
  
        ensureRowExists(rows, summaryStartRow); rows[summaryStartRow][colOffset] = "Total";
        ensureRowExists(rows, summaryStartRow + 1); rows[summaryStartRow + 1][colOffset] = "Réduction";
        ensureRowExists(rows, summaryStartRow + 2); rows[summaryStartRow + 2][colOffset] = "Total général";
        ensureRowExists(rows, summaryStartRow + 3); rows[summaryStartRow + 3][colOffset] = "Payé ?";
        ensureRowExists(rows, summaryStartRow + 4); rows[summaryStartRow + 4][colOffset] = "Dette ?";
        ensureRowExists(rows, summaryStartRow + 5); rows[summaryStartRow + 5][colOffset] = "Moyen de paiement ?";
  
        rows[summaryStartRow][colOffset + 1] = `${invoice.total}`;
        rows[summaryStartRow + 1][colOffset + 1] = `${invoice.reduction}`;
        rows[summaryStartRow + 2][colOffset + 1] = `${invoice.total - invoice.reduction}`;
        rows[summaryStartRow + 3][colOffset + 1] = invoice.isPaid ? "Oui" : "Non";
        rows[summaryStartRow + 4][colOffset + 1] = invoice.isDebt ? "Oui" : "Non";
        rows[summaryStartRow + 5][colOffset + 1] = invoice.accountName || "Non spécifié";
      });
  
      // Ajouter les lignes à la feuille
      const worksheet = xlsx.utils.aoa_to_sheet(rows);
      xlsx.utils.book_append_sheet(workbook, worksheet, sheetName);
    }
  
    // Enregistrer le fichier Excel
    xlsx.writeFile(workbook, "factures_horizontales_corrigées.xlsx");
    console.log("Fichier généré : factures_horizontales_corrigées.xlsx");
  }
  
  // Appeler la fonction avec vos données
  generateExcel(invoices);
  
})

