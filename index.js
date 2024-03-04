const express = require('express');
const morgan = require('morgan');
const bodyParser = require('body-parser')
const cors = require('cors')
const limit = require("express-rate-limit")
const SocketService = require("./Utils/socket");
const path = require('path');

require('dotenv').config();

const app = express()
const port = 4000


const server = require('http').Server(app);

app.set("socketService", new SocketService(server));

app.use(bodyParser.urlencoded({limit: '50mb', extended: true}));
app.use(bodyParser.json({limit: '50mb', extended: true}));
app.use(morgan('dev'))
app.use(cors())

app.use(limit({
  windowMs: 10 * 60 * 1000, // 10 minutes
  max: 5000, // 200 request
  message: {
    toManyRequest: true,
  }
}))


app.use(
  "/assets",
  express.static(path.join(__dirname, "dist", "assets"))
);

app.use(
  "/Invoices",
  express.static(path.join(__dirname, "Invoices"))
);


app.use(
  "/Vouchers",
  express.static(path.join(__dirname, "Invoices", "Vouchers"))
);

app.use('/api/users', require('./Routes/Users'))
app.use('/api/clients', require('./Routes/Clients'))
app.use('/api/products-category', require('./Routes/ProductsCategory'))
app.use('/api/products', require('./Routes/Products'))
app.use('/api/pt-category', require('./Routes/PTCategory'))
app.use('/api/transactions', require('./Routes/Transactions'))
app.use('/api/d-transactions', require('./Routes/DTransactions'))
app.use('/api/m-category', require('./Routes/MCategory'))
app.use('/api/m-transactions', require('./Routes/MTransactions'))
app.use('/api/m-account', require('./Routes/MAccount'))
app.use('/api/sessions', require('./Routes/Sessions'))

app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "dist", "index.html"));
});

server.listen(port, function () {
  console.debug(`listening on port ${port}`);
});