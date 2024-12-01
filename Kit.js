const fs = require('fs');
const csv = require('csv-parser');

const sqlFile = fs.createWriteStream('new.sql');

fs.createReadStream('Classeur1.csv')
  .pipe(csv({separator: ';'}))
  .on('data', (row) => {
    // Créer la requête INSERT pour chaque ligne
    const namef = Object.values(row)[0];
    const stock = Object.values(row)[2];
    
    const escapedName = namef.replace(/'/g, "''"); // Double l'apostrophe
      const insertQuery = `UPDATE products SET inStock = ${stock} where name='${(escapedName)}';\n`;
      
      // Écrire la requête dans le fichier SQL
      sqlFile.write(insertQuery);
  })
  .on('end', () => {
    console.log('CSV file successfully processed. SQL queries written to boissons.sql');
  });
