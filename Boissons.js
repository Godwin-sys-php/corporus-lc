const fs = require('fs');
const csv = require('csv-parser');

const sqlFile = fs.createWriteStream('boissons.sql');

fs.createReadStream('change_bois_dep.csv')
  .pipe(csv({separator: ';'}))
  .on('data', (row) => {
    // Créer la requête INSERT pour chaque ligne

      const insertQuery = `UPDATE products SET depotStock = ${Number(row.depot)} where id=${Number(row.id)};\n`;
      
      // Écrire la requête dans le fichier SQL
      sqlFile.write(insertQuery);
  })
  .on('end', () => {
    console.log('CSV file successfully processed. SQL queries written to boissons.sql');
  });
