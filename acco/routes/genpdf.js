
var express = require('express');
var router = express.Router();
const fs = require("fs");
const PDFDocument = require("pdfkit");


//     // console.log("Welcome create pdf invoice ");
   
//     const storage = multer.diskStorage({
//         destination: 'C:/invoice/',
      
//         filename: (req1, file, cb) => {
//           // console.log("Request name ",req1.params.id);
//           return cb(null, `${file.fieldname}_${Date.now()}${path.extname("pdf")}`)
//           // return cb(null,`${file.fieldname}_`+req1.params.id+`${path.extname(file.originalname)}`)
//         }
//       })
//    console.log(storage);   
//       const upload = multer({
//         storage: storage
//       })

//     // const authcheck = (req, res, next) => {
//     //     headers = {
   
//     const invoice = {
//         shipping: {
//           name: "John Doe",
//           address: "1234 Main Street",
//           city: "San Francisco",
//           state: "CA",
//           country: "US",
//           postal_code: 94111
//         },
//         items: [
//           {
//             Checkin: "2024-8-2",
//             Checkout: "2024-8-4",
//             Description: "Toner Cartridge",
//             TotalDays: 2,
//             Discount:0,
//             Maintenance:0,
//             Subtotal:2000
      
//           }
//         ],
//         subtotal: 2000,
//         GST: 23,
//         invoice_nr: 1234
//       };
      
    

// const createInvoice=(invoice)=> {
//     let doc = new PDFDocument({ size: "A4", margin: 50 });

//     // generateHeader(doc);
//     // generateCustomerInformation(doc, invoice);
//     // generateInvoiceTable(doc, invoice);
//     // generateFooter(doc);

//     doc.pipe(fs.createWriteStream('C:\invoice\invoice'));   

//     doc.end();
// }
// // res.end();
// // })
// router.get('/getinvoice',


module.exports = router;
