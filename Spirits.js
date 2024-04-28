const fs = require('fs');
const csv = require('csv-parser');

const sqlFile = fs.createWriteStream('spirits.sql');

fs.createReadStream('s_28_avr.csv')
  .pipe(csv({separator: ';'}))
  .on('data', (row) => {
    // Créer la requête INSERT pour chaque ligne

      const insertQuery = `UPDATE products SET inStock = ${Number(row["reel"])} where id=${Number(row.id)};\n`;
      
      // Écrire la requête dans le fichier SQL
      sqlFile.write(insertQuery);
  })
  .on('end', () => {
    console.log('CSV file successfully processed. SQL queries written to boissons.sql');
  });
