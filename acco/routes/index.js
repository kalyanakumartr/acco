var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});



const { createInvoice } = require("./invoice.js");

const invoice = {
  shipping: {
    name: "John Doe",
    address: "1234 Main Street",
    city: "San Francisco",
    state: "CA",
    country: "US",
    postal_code: 94111
  },
  items: 
    {
      Checkin: "2024-8-2",
      Checkout: "2024-8-4",
      Description: "Toner Cartridge",
      TotalDays: 2,
      flat2BHK:1,
      flat3BHK:2,
      extrabed:1,
      Subtotal:2000

    },
  
  subtotal: 2000,
  Maintenance:200,
  discount:24,
  GST: 23,
  invoice_nr: 1234
};

createInvoice(invoice);

module.exports = router;




// const corsOptions ={
//     origin:'http://localhost:3001', 
//     credentials:true,            //access-control-allow-credentials:true
//     optionSuccessStatus:200
// }
// app.use(cors(corsOptions));

// app.use(Headers ;
// const corsOpts = {
  
//   origin: '*',

//   methods: [
//     'GET',
//     'POST',
//   ],

//   allowedHeaders: [
//     {'Content-Type':'application/json'}
//   ],
// };

// app.use(cors(corsOpts));
// ALLOW CORS

// const allowedOrigins = ['http://localhost:3001' ];
// const options=cors.CorsOptions= {  origin: allowedOrigins};
// app.use(cors(options));
// app.use(cors({
//   origin: '*'
  
// }));

// app.use(cors({
//   origin: 'http://localhost:4200'
// }));

// app.use(cors());
// // SET CORS for PREFLIGHT OPTIONS
// app.options('*', cors());


// const allowedOrigins = ['http://localhost:3001' ];
// const options=cors.CorsOptions= {  origin: allowedOrigins};
// app.use(cors(options));
// app.use(cors({
//   origin: ['http://localhost:3001','http://localhost:4200']
  
// }));

