const fs = require('fs');
const csv = require('csv-parser');

const sqlFile = fs.createWriteStream('kit.sql');

fs.createReadStream('plats_7avr.csv')
  .pipe(csv({separator: ';'}))
  .on('data', (row) => {
    // Créer la requête INSERT pour chaque ligne
      if (Number(row.reel) > 0) {
        const insertQuery = `UPDATE products SET inStock = ${Number(row.reel)} where id=${Number(row.id)};\n`;
        
        // Écrire la requête dans le fichier SQL
        sqlFile.write(insertQuery);
      } else {
        const insertQuery = `UPDATE products SET inStock = 0 where id=${Number(row.id)};\n`;
        
        // Écrire la requête dans le fichier SQL
        sqlFile.write(insertQuery);
      }
  })
  .on('end', () => {
    console.log('CSV file successfully processed. SQL queries written to boissons.sql');
  });
