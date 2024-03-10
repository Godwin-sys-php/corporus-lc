const fs = require('fs');
const csv = require('csv-parser');

const sqlFile = fs.createWriteStream('cigg.sql');

fs.createReadStream('change_cigg_dep.csv')
  .pipe(csv({separator: ';'}))
  .on('data', (row) => {
    // Créer la requête INSERT pour chaque ligne

      const insertQuery = `UPDATE products SET depotStock = ${Number(row.depotStock)} where id=${Number(row.id)};\n`;
      
      // Écrire la requête dans le fichier SQL
      sqlFile.write(insertQuery);
  })
  .on('end', () => {
    console.log('CSV file successfully processed. SQL queries written to boissons.sql');
  });
