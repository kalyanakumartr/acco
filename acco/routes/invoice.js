
const fs = require("fs");
const PDFDocument = require("pdfkit");
var express = require('express');
const con = require('../dbconfig');
var sprintf = require('sprintf-js').sprintf;
const moment = require('moment');

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
        flat2BHK: 1,
        flat3BHK: 2,
        extrabed: 1,
        Subtotal: 2000

    },

    subtotal: 2000,
    Maintenance: 200,
    discount: 24,
    GST: 23,
    invoice_nr: 1234
};


function invoice2(req, res) {
    var cmd = `CALL getbookingdetailwithbookingid(?)`;
    bookid = req.query.bookid;
    con.query(cmd, [bookid], function (err, result) {
        if (err) {
            res.send("Some Error");
        }
        else {
            console.log(result);
            "Firstname", result.firstname,
                "LastName", result.lastname
            //  address: "1234 Main Street",
            //  city: "San Francisco",
        }

    })
}


router.get('/muthugetpdf', function (req, res) {
    try {
        console.log("Welcome to Create PDF");
        cmd = ('SELECT *,(SELECT roomno FROM room WHERE booking.roomid=room.roomid) AS roomno,(SELECT roomname FROM room WHERE booking.roomid=room.roomid) AS roomname FROM booking WHERE bookingid=' + req.query.bookingid + '');
        con.query(cmd, (err, result) => {
            console.log("len", result.length);
            if (result.length >= 1) {
                if (err) {
                    console.log("Error", err);
                    res.send("Pls Check Booking Id");
                } else {
                    console.log(cmd);
                    console.log(result);
                    res.send({ result });
                    const { writeFile } = require('fs');
                    // const storagespace = multer.diskStorage({
                    //     destination: 'C:/accouserimage/proof',
                    //     filee: (req1, file, cb) => {
                    //       return cb(null, `${file.fieldname}_${Date.now()}${path.extname(file.originalname)}`)
                    //     }
                    //   })
                    // doc.pipe(fs.createWriteStream(`/invoice/${Date.now()}` + 'Invoice.pdf'));
                    const path = `./invoice_${req.query.bookingid}_${Date.now()}.json`;
                    // const config = JSON.stringify(result);
                    const config = (result);
                    writeFile(path, JSON.stringify(config, null, 2), (error) => {
                        if (error) {
                            console.log(error);
                            return;
                        }
                        else {
                            var cmdinsert = sprintf('INSERT INTO invoicedata(bookingid,data,status)values(%d,%j,%d)', req.query.bookingid, config, 1);
                            con.query(cmdinsert, (inerror, inresult) => {
                                console.log("cmdinser", cmdinsert);
                                if (inerror) {
                                    console.log("Some Error");
                                    // res.send({result});
                                } else {
                                    console.log("Insert Done");
                                    res.send("Inser t done");

                                }
                            });
                        }
                    })
                }
            } else {
                console.log("Pls check Booking Id");
                res.send("Pls Check Booking Id");
            }
        })
    }
    catch (e) {
        console.log("Catch", e);
        const statusCode = e.statusCoderes || 500;
        res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
    }
})


    // add1 = req.query.address1;
    // add2 = req.query.address2;
    // city = req.query.city;
    // state = req.query.state;
    // country = req.query.country;
    // phone = req.query.phonenumber;
    // pincode = req.query.pincode;

    // bookid = req.query.bookid;
    // bookingdate = req.query.date;
    // cin = req.query.checkin;
    // cout = req.query.Checkout;
    // cintime = req.query.checkintime;
    // couttime = req.query.checkouttime;
    // flatno = req.query.flatnumber;
    // flattype = req.query.flattype;
    // noofdays = req.query.noofdays;

    // subtotal = req.query.subtotal;
    // maintenance = req.query.maintenance;
    // discount = req.query.discount;
    // total = req.query.total;
    // gst = req.query.gst;
    // nettotal = req.query.nettotal;





router.get('/getpdf',function (req,res) {
    cmdd = ('SELECT *,(SELECT roomno FROM room WHERE booking.roomid=room.roomid) AS roomno,(SELECT roomname FROM room WHERE booking.roomid=room.roomid) AS roomname FROM booking WHERE bookingid=' + req.query.bookingid + '');
    
    con.query(cmdd, (err, resultt) => {
        console.log("len", resultt.length);
        if (resultt.length >= 1) {
            console.log(cmdd);
            if (err) {
                console.log( err);
                res.send("Pls Check Booking Id");
            } else {
                console.log(cmd);
                console.log(resultt);
                // res.send({ result });
  
    cname = resultt[0].firstname;
    // console.log("cname",cname);
        add1 = resultt[0].address1;
    add2 = resultt[0].address2;
    city = resultt[0].city;
    state = resultt[0].state;
    country = resultt[0].country;
    phone = resultt[0].phonenumber;
    pincode = resultt[0].pincode;
    
    bookid =  resultt[0].bookingid;
    // cdatetime = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
    bookingdate =  resultt[0].bookingid;
    cin =  resultt[0].checkin;
    cout =  resultt[0].Checkout;
    cintime =  resultt[0].checkintime;
    couttime =  resultt[0].checkouttime;
    flatno =  resultt[0].roomno;
    flattype =  resultt[0].roomtype;
    noofdays =  resultt[0].noofdays;


        subtotal =  resultt[0].subtotal;
    maintenance =  resultt[0].maintenance;
    discount =  resultt[0].discount;
    total =  resultt[0].total;
    gst =  resultt[0].gst;
    nettotal =  resultt[0].nettotal;



var cmd=`CALL getbookingdetailwithbookingid(?)`;
    con.query(cmd, [req.query.bookingid], function (err, result) {
        if (err) {
            res.send({"Some Error":err});
        }
        else {
            // console.log(result);
            // console.log("res",res);
            console.log("Welcome to PDF Create");
            let doc = new PDFDocument({ size: "A4", margin: 50 });
            // result[0].bookingid;
            // head(doc,invoice2);
            generateHeader(doc);
            generateCustomerInformation(doc, invoice);
            generateInvoiceTable(doc, invoice);
            generateFooter(doc);
            //  res.send("Done")

            doc.end();

            //  doc.pipe(fs.createWriteStream('storehere'));
            doc.pipe(fs.createWriteStream(`c:/invoice/${Date.now()}_${req.query.bookingid}` + 'Invoice.pdf'));
            res.send("Done");
            // router.();
        }
    })
}
}
});
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
    // D:\acco\acco\acco\img\index_logo.jpg
        .image("D:/acco/acco/acco/img/index_logo.jpg", 190, 35, { width: 200 }, { align: 'center' })
    doc.text('No.37,Bharathi St,Thiruvaikovil,near TST bus co,Trichy-620005,Ph-7373826373', 28, 100, { align: 'center' })
        // .fillColor("#444444")
        // .fontSize(20)
        // .text("ACME Inc.", 110, 57)
        // .fontSize(10)
        // .text('No.37,Bharathi St', 60, 40, { align: 'right' })
        // .text('Thiruvaikovil', 70, 55, { align: 'right' })
        // .text('(near TST bus co)', 70, 70, { align: 'right' })
        // .text('Trichy-620005', 80, 85, { align: 'right' })
        // .text('Ph-7373826373', 90, 100, { align: 'right' })

        .moveDown();
}

function generateCustomerInformation(doc,) {
    doc
        .fillColor("#964B00")
        .fontSize(20)
        .text("HEMA HOLDING", 50, 125, { align: 'center' });
    doc.fillColor("#444444")
        .fontSize(20)
        .text("Invoice", 50, 150, { align: 'center' });

    generateHr(doc, 185);

    const customerInformationTop = 200;

    doc
        .fontSize(10)
        .text("Customer Name", 50, customerInformationTop)
        .font("Helvetica")
        .text(cname, 100, customerInformationTop)
        .font("Helvetica")

        .text("address", 50, customerInformationTop + 15)
        .font("Helvetica")
        .text(add1, 100, customerInformationTop + 15)
        .font("Helvetica")

        .text("address2", 50, customerInformationTop + 30)
        .font("Helvetica")
        .text(add2, 100, customerInformationTop + 30)
        .font("Helvetica")

        .text("city", 50, customerInformationTop + 45)
        .font("Helvetica")
        .text(city, 100, customerInformationTop + 45)
        .font("Helvetica")

        .text("state-pincode", 50, customerInformationTop + 60)
        .font("Helvetica")
        .text(state - pincode, 100, customerInformationTop + 60)
        .font("Helvetica")

        .text("country", 50, customerInformationTop + 75)
        .font("Helvetica")
        .text(country, 100, customerInformationTop + 75)
        .font("Helvetica")

        .text("Phone number", 50, customerInformationTop + 90)
        .font("Helvetica")
        .text(phone, 100, customerInformationTop + 90)
        .font("Helvetica")

        .text("PV CardNo.", 50, customerInformationTop + 105)
        .font("Helvetica")
        // .text(formatDate(new Date()), 150, customerInformationTop + 15)
        // .text("Balance Due:", 50, customerInformationTop + 30)
        // .text(
        //     formatCurrency(invoice.subtotal - invoice.paid),
        // 150,
        // customerInformationTop + 30


        .font("Helvetica")
        .text("Bill No.:  ", bookid, 350, customerInformationTop)
        .font("Helvetica")
        .text("Bill Date:  ", bookingdate, 350, customerInformationTop + 15)
        .font("Helvetica")
        .text("Check-in time:", cintime, 350, customerInformationTop + 30)
        .font("Helvetica")
        .text("Check-in Date:", cin, 350, customerInformationTop + 45)
        .font("Helvetica")
        .text("Check-out time:", couttime, 350, customerInformationTop + 60)
        .font("Helvetica")
        .text("Check-out Date:", cout, 350, customerInformationTop + 75)
        .font("Helvetica")
        .text("No.of pax", 350, customerInformationTop + 90)
        .font("Helvetica")
        .text("Flat no.  ", flatno, 350, customerInformationTop + 105)
        .font("Helvetica")
        .text("Flat type:  ", flattype, 350, customerInformationTop + 120)
        .font("Helvetica")
        .text("No.of days: ", noofdays, 350, customerInformationTop + 135)

        // .text(
        //     invoice.shipping.city +
        //     ", " +
        //     invoice.shipping.state +
        //     ", " +
        //     invoice.shipping.country,
        //     300,
        //     customerInformationTop + 30
        // )
        .moveDown();

    generateHr(doc, 360);
}

function generateInvoiceTable(doc,) {
    let i;
    const invoiceTableTop = 370;

    doc.font("Helvetica-Bold");
    generateTableRow(
        doc,
        invoiceTableTop,
        "Particulars",
        "Tariff",
        "No.of days",
        "Total",

    );
    generateHr(doc, invoiceTableTop + 20);
    doc.font("Helvetica");

    const position = invoiceTableTop + 35;
    generateTableRow(
        doc,
        position,
        "Subtotal",
        subtotal,
        noofdays,
        'main*days'

    );
    generateTableRow(
        doc,
        position + 20,
        'Maintenance',
        maintenance,
        noofdays,
        'main*days'

    );
    generateTableRow(
        doc,
        position + 40,
        'Discount',
        discount,
        noofdays,
        'dis*days'

    );


    generateHr(doc, position + 60);


    const subtotalPosition = position + 80;
    doc.font("Helvetica-Bold");
    generateTableRow(
        doc,
        subtotalPosition,
        "",
        "",
        "Total",
        "",
        total
    );

    const paidToDatePosition = subtotalPosition + 20;
    doc.font("Helvetica-Bold");
    generateTableRow(
        doc,
        paidToDatePosition,
        "",
        "",
        "GST",
        "",
        gst
    );
    const totalPosition = paidToDatePosition + 20;
    generateTableRow(
        doc,
        totalPosition,
        "",
        "",
        "Net-Total",
        "",
        nettotal
    );
    doc.font("Helvetica");
    generateHr(doc, position + 60);

}

function generateFooter(doc) {
    doc
        .font("Helvetica-Bold")
        .text("Guest's Signature", 50, 650)
    doc
        .font("Helvetica-Bold")
        .text("Guest Relation Co-ordinator", 400, 650)
    doc
        .font("Helvetica-Bold")
        .text("For Hema Holdings", 420, 670)
    doc
        .fontSize(10)
        .text(
            "Thanks for choosing Maduraa Services,Good day.",
            50,
            775,
            { align: "center", width: 500 }
        );
}

function generateTableRow(
    doc,
    y,
    Particulars,
    Tariff,
    NoofDays,
    Total,

) {
    doc
        .fontSize(10)
        .text(Particulars, 90, y)
        .text(Tariff, 210, y)
        .text(NoofDays, 330, y)
        .text(Total, 450, y)

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

module.exports = router;













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



