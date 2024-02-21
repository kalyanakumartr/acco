
const fs = require("fs");
const PDFDocument = require("pdfkit");
var express = require('express');
const con = require('../dbconfig');

var router = express.Router();
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


function invoice2(req,res){
    var cmd=`CALL getbookingdetailwithbookingid(?)`;
    bookid= req.query.bookid;
    con.query(cmd, [bookid], function (err, result) {
     if(err)
     {
         res.send("Some Error");
     }
     else{
     console.log(result);
     "Firstname", result.firstname,
     "LastName",result.lastname 
         //  address: "1234 Main Street",
    //  city: "San Francisco",
     }
 
})
}









// router.get('/getpdf',function createInvoice(invoice) {
   
router.get('/getpdf',function (req,res) {

    var cmd=`CALL getbookingdetailwithbookingid(?)`;
   bookid= req.query.bookid;
   con.query(cmd, [bookid], function (err, result) {
    if(err)
    {
        res.send("Some Error");
    }
    else{
    console.log(result);
    // console.log("res",res);
    console.log("Welcome to PDF Create");
    let doc = new PDFDocument({ size: "A4", margin: 50 });
        // result[0].bookingid;
        head(doc,invoice2);
    generateHeader(doc);
    generateCustomerInformation(doc, invoice);
    generateInvoiceTable(doc, invoice);
    generateFooter(doc);
// res.send("Done")
 
    doc.end();  
    
    // doc.pipe(fs.createWriteStream('storehere'));
    doc.pipe(fs.createWriteStream(`/invoice/${Date.now()}`+'Invoice.pdf'));
    res.send("Done");
    // router.();
    }
})
});
function head(doc){
    var cmd=`CALL getbookingdetailwithbookingid(?)`;
//    bookid= reqq.query.bookid;
console.log(bookid);
   con.query(cmd, [bookid], function (err, result) {
    console.log(bookid);
    // if(err)
    // {
        // ress.send("Some Error");
    // }
    // else{
        console.log("Else part",invoice2.firstname);
        // ress.send(result);
        doc
        .text(invoice2.firstname, 60, 40, { align: 'right' });
        
        // .moveDown();

    // }
})
}

function generateHeader(doc) {
    doc
        .image("D:\\acco\\acco\\acco\\img\\index_logo.jpg", 50, 45, { width: 200 })
        // .fillColor("#444444")
        // .fontSize(20)
        // .text("ACME Inc.", 110, 57)
        // .fontSize(10)
        // .text('No.37,Bharathi St', 60, 40, { align: 'right' })
        .text('Thiruvaikovil', 70, 55, { align: 'right' })
        .text('(near TST bus co)', 70, 70, { align: 'right' })
        .text('Trichy-620005', 80, 85, { align: 'right' })
        .text('Ph-7373826373', 90, 100, { align: 'right' })

        .moveDown();
}

function generateCustomerInformation(doc, invoice) {
    doc
        .fillColor("#444444")
        .fontSize(20)
        .text("Invoice", 50, 160);

    generateHr(doc, 185);

    const customerInformationTop = 200;

    doc
        .fontSize(10)
        .text("Invoice Number:", 50, customerInformationTop)
        
        .font("Helvetica-Bold")
        .text(invoice.invoice_nr, 150, customerInformationTop)
        .font("Helvetica")  
        .text("Invoice Date:", 50, customerInformationTop + 15)
        .text(formatDate(new Date()), 150, customerInformationTop + 15)
        // .text("Balance Due:", 50, customerInformationTop + 30)
        // .text(
        //     formatCurrency(invoice.subtotal - invoice.paid),
        // 150,
        // customerInformationTop + 30


        .font("Helvetica-Bold")
        .text(invoice.name, 300, customerInformationTop)
        // .text(invoice.shipping.name, 300, customerInformationTop)
        .font("Helvetica")
        .text(invoice.address,300, customerInformationTop + 15)
        // .text(invoice.shipping.address, 300, customerInformationTop + 15)
        .text(
            // invoice.shipping.city +
            invoice.city +
            ", " +
            // invoice.shipping.state +
            invoice.state +
            ", " +
            // invoice.shipping.country,
            invoice.country,
            300,
            customerInformationTop + 30
        )
        .moveDown();

    generateHr(doc, 252);
}

function generateInvoiceTable(doc, invoice) {
    let i;
    const invoiceTableTop = 300;

    doc.font("Helvetica-Bold");
    generateTableRow(
        doc,
        invoiceTableTop,
        "Checkin",
        "Checkout",
        "2BHK",
        "3BHK",
        "Extra Bed",
        "Total Days",
        "Sub-total",
    );
    generateHr(doc, invoiceTableTop + 20);
    doc.font("Helvetica");
// invoice.items
    const item = invoice.items;
    const position = invoiceTableTop + 40;
    generateTableRow(

        doc,
        position,
        
        
        // Checkin,
        // result[0].checkin,
        // item.Checkin,
        item.Checkout,
        item.flat2BHK,
        item.flat3BHK,
        item.extrabed,
        item.TotalDays,
        item.Subtotal

        // invoice.Checkin,
        // invoice.Checkout,
        // invoice.flat2BHK,
        // invoice.flat3BHK,
        // invoice.extrabed,
        // invoice.TotalDays,
        // invoice.Subtotal




        //   formatCurrency(item.amount),

    );

    generateHr(doc, position + 20);


    const subtotalPosition = invoiceTableTop + 70;
    doc.font("Helvetica-Bold");
    generateTableRow(
        doc,
        subtotalPosition + 10,
        "",
        "",
        "Subtotal",
        "",
        invoice.subtotal
    );

    const paidToDatePosition = subtotalPosition + 35;
    doc.font("Helvetica-Bold");
    generateTableRow(
        doc,
        paidToDatePosition,
        "",
        "",
        "Maintenance",
        "",
        invoice.maintenance
    );

    const duePosition = paidToDatePosition + 25;
    doc.font("Helvetica-Bold");
    generateTableRow(
        doc,
        duePosition,
        "",
        "",
        "Discount",
        "",
       invoice.discount
    );

    const GstPosition = duePosition + 20;
    generateTableRow(
        doc,
        GstPosition,
        "",
        "",
        "GST",
        "",
        invoice.GST
    );

    const totalPosition = GstPosition + 20;
    generateTableRow(
        doc,
        totalPosition,
        "",
        "",
        "Total",
        "",
        formatCurrency((invoice.subtotal + invoice.maintenance + invoice.GST) - invoice.discount)
    );
    doc.font("Helvetica");
}

function generateFooter(doc) {
    doc
        .fontSize(10)
        .text(
            "Thanks for choosing Maduraa Services,Good day.",
            50,
            780,
            { align: "center", width: 500 }
        );
}

function generateTableRow(
    doc,
    y,
    Checkin,
    Checkout,
    Description,
    TotalDays,
    Discount,
    Maintenance,
    Subtotal
) {
    doc
        .fontSize(10)
        .text(Checkin, 70, y)
        .text(Checkout, 140, y)
        .text(Description, 210, y)
        .text(TotalDays, 280, y)
        .text(Discount, 350, y)
        .text(Maintenance, 420, y)
        .text(Subtotal, 500, y);

}

function generateHr(doc, y) {
    doc
        .strokeColor("#aaaaaa")
        .lineWidth(1)
        .moveTo(50, y)
        .lineTo(550, y)
        .stroke();
}

function formatCurrency(cents) {
    return "INR " + (cents);
}

function formatDate(date) {
    const day = date.getDate();
    const month = date.getMonth() + 1;
    const year = date.getFullYear();

    return year + "/" + month + "/" + day;
}

// module.exports = {
//     createInvoice
// };

module.exports=router;













// const fs = require("fs");
// const PDFDocument = require("pdfkit");

// function createInvoice(invoice) {
//     let doc = new PDFDocument({ size: "A4", margin: 50 });

//     generateHeader(doc);
//     generateCustomerInformation(doc, invoice);
//     generateInvoiceTable(doc, invoice);
//     generateFooter(doc);

//     doc.end();
//     doc.pipe(fs.createWriteStream('storehere'));
// }

// function generateHeader(doc) {
//     doc
//         .image("C:/backendAcco/acco/acco/img/index_logo.jpg", 50, 45, { width: 200 })
//         // .fillColor("#444444")
//         // .fontSize(20)
//         // .text("ACME Inc.", 110, 57)
//         // .fontSize(10)
//         .text('No.37,Bharathi St', 60, 40, { align: 'right' })
//         .text('Thiruvaikovil', 70, 55, { align: 'right' })
//         .text('(near TST bus co)', 70, 70, { align: 'right' })
//         .text('Trichy-620005', 80, 85, { align: 'right' })
//         .text('Ph-7373826373', 90, 100, { align: 'right' })

//         .moveDown();
// }

// function generateCustomerInformation(doc, invoice) {
//     doc
//         .fillColor("#444444")
//         .fontSize(20)
//         .text("Invoice", 50, 160);

//     generateHr(doc, 185);

//     const customerInformationTop = 200;

//     doc
//         .fontSize(10)
//         .text("Invoice Number:", 50, customerInformationTop)
//         .font("Helvetica-Bold")
//         .text(invoice.invoice_nr, 150, customerInformationTop)
//         .font("Helvetica")
//         .text("Invoice Date:", 50, customerInformationTop + 15)
//         .text(formatDate(new Date()), 150, customerInformationTop + 15)
//         // .text("Balance Due:", 50, customerInformationTop + 30)
//         // .text(
//         //     formatCurrency(invoice.subtotal - invoice.paid),
//         // 150,
//         // customerInformationTop + 30


//         .font("Helvetica-Bold")
//         .text(invoice.shipping.name, 300, customerInformationTop)
//         .font("Helvetica")
//         .text(invoice.shipping.address, 300, customerInformationTop + 15)
//         .text(
//             invoice.shipping.city +
//             ", " +
//             invoice.shipping.state +
//             ", " +
//             invoice.shipping.country,
//             300,
//             customerInformationTop + 30
//         )
//         .moveDown();

//     generateHr(doc, 252);
// }

// function generateInvoiceTable(doc, invoice) {
//     let i;
//     const invoiceTableTop = 300;

//     doc.font("Helvetica-Bold");
//     generateTableRow(
//         doc,
//         invoiceTableTop,
//         "Checkin",
//         "Checkout",
//         "2BHK",
//         "3BHK",
//         "Extra Bed",
//         "Total Days",
//         "Sub-total",
//     );
//     generateHr(doc, invoiceTableTop + 20);
//     doc.font("Helvetica");

//     const item = invoice.items;
//     const position = invoiceTableTop + 40;
//     generateTableRow(
//         doc,
//         position,
//         item.Checkin,
//         item.Checkout,
//         item.flat2BHK,
//         item.flat3BHK,
//         item.extrabed,
//         item.TotalDays,
//         item.Subtotal




//         //   formatCurrency(item.amount),

//     );

//     generateHr(doc, position + 20);


//     const subtotalPosition = invoiceTableTop + 70;
//     doc.font("Helvetica-Bold");
//     generateTableRow(
//         doc,
//         subtotalPosition + 10,
//         "",
//         "",
//         "Subtotal",
//         "",
//         invoice.subtotal
//     );

//     const paidToDatePosition = subtotalPosition + 35;
//     doc.font("Helvetica-Bold");
//     generateTableRow(
//         doc,
//         paidToDatePosition,
//         "",
//         "",
//         "Maintenance",
//         "",
//         invoice.maintenance
//     );

//     const duePosition = paidToDatePosition + 25;
//     doc.font("Helvetica-Bold");
//     generateTableRow(
//         doc,
//         duePosition,
//         "",
//         "",
//         "Discount",
//         "",
//        invoice.discount
//     );

//     const GstPosition = duePosition + 20;
//     generateTableRow(
//         doc,
//         GstPosition,
//         "",
//         "",
//         "GST",
//         "",
//         invoice.GST
//     );

//     const totalPosition = GstPosition + 20;
//     generateTableRow(
//         doc,
//         totalPosition,
//         "",
//         "",
//         "Total",
//         "",
//         formatCurrency((invoice.subtotal + invoice.maintenance + invoice.GST) - invoice.discount)
//     );
//     doc.font("Helvetica");
// }

// function generateFooter(doc) {
//     doc
//         .fontSize(10)
//         .text(
//             "Thanks for choosing Maduraa Services,Good day.",
//             50,
//             780,
//             { align: "center", width: 500 }
//         );
// }

// function generateTableRow(
//     doc,
//     y,
//     Checkin,
//     Checkout,
//     Description,
//     TotalDays,
//     Discount,
//     Maintenance,
//     Subtotal
// ) {
//     doc
//         .fontSize(10)
//         .text(Checkin, 70, y)
//         .text(Checkout, 140, y)
//         .text(Description, 210, y)
//         .text(TotalDays, 280, y)
//         .text(Discount, 350, y)
//         .text(Maintenance, 420, y)
//         .text(Subtotal, 500, y);

// }

// function generateHr(doc, y) {
//     doc
//         .strokeColor("#aaaaaa")
//         .lineWidth(1)
//         .moveTo(50, y)
//         .lineTo(550, y)
//         .stroke();
// }

// function formatCurrency(cents) {
//     return "INR " + (cents);
// }

// function formatDate(date) {
//     const day = date.getDate();
//     const month = date.getMonth() + 1;
//     const year = date.getFullYear();

//     return year + "/" + month + "/" + day;
// }

// module.exports = {
//     createInvoice
// };



