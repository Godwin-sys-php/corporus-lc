const fs = require('fs');
const csv = require('csv-parser');

const sqlFile = fs.createWriteStream('boissons.sql');

fs.createReadStream('Boissons.csv')
  .pipe(csv({separator: ';'}))
  .on('data', (row) => {
    // Créer la requête INSERT pour chaque ligne

      //const insertQuery = `UPDATE products SET inStock = ${Number(row.quantity)}, barStock = ${Number(row.quantity)} where name='${name.replace("'", "\'")}';\n`;

      const name=  row[Object.keys(row)[0]]

      const insertQuery = `INSERT INTO products SET categoryId=1, categoryName='Boissons', name='${name}', unit='-', isSellable = 1, isVersatile = 0, price = ${row.Prix}, buyPrice = 0, inStock = ${Number(row.Real)}, depotStock = ${Number(row.Depot)}, timestamp = 1709475989;\n`;
      
      // Écrire la requête dans le fichier SQL
      sqlFile.write(insertQuery);
  })
  .on('end', () => {
    console.log('CSV file successfully processed. SQL queries written to boissons.sql');
  });
