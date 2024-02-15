const fs = require("fs");
const PDFDocument = require("pdfkit");

function createInvoice(invoice) {
    let doc = new PDFDocument({ size: "A4", margin: 50 });

    generateHeader(doc);
    generateCustomerInformation(doc, invoice);
    generateInvoiceTable(doc, invoice);
    generateFooter(doc);

    doc.end();
    doc.pipe(fs.createWriteStream('storehere'));
}

function generateHeader(doc) {
    doc
        .image("D:\\acco\\acco\\acco\\img\\index_logo.jpg", 50, 45, { width: 200 })
        // .fillColor("#444444")
        // .fontSize(20)
        // .text("ACME Inc.", 110, 57)
        // .fontSize(10)
        .text('No.37,Bharathi St', 60, 40, { align: 'right' })
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
        .text(invoice.shipping.name, 300, customerInformationTop)
        .font("Helvetica")
        .text(invoice.shipping.address, 300, customerInformationTop + 15)
        .text(
            invoice.shipping.city +
            ", " +
            invoice.shipping.state +
            ", " +
            invoice.shipping.country,
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
        "Description",
        "Total Days",
        "Discount",
        "Maintenance",
        "Sub-total",
    );
    generateHr(doc, invoiceTableTop + 20);
    doc.font("Helvetica");

    for (i = 0; i < invoice.items.length; i++) {
        const item = invoice.items[i];
        const position = invoiceTableTop + (i + 1) * 30;
        generateTableRow(
            doc,
            position,
            item.Checkin,
            item.Checkout,
            item.Description,
            //   formatCurrency(item.amount / item.quantity),
            item.TotalDays,
            item.Discount,
            item.Maintenance,
            item.Subtotal




            //   formatCurrency(item.amount),

        );

        generateHr(doc, position + 20);
    }

    const subtotalPosition = invoiceTableTop + (i + 1) * 30;
    generateTableRow(
        doc,
        subtotalPosition,
        "",
        "",
        "Subtotal",
        "",
        formatCurrency(invoice.subtotal)
    );

    const paidToDatePosition = subtotalPosition + 20;
    generateTableRow(
        doc,
        paidToDatePosition,
        "",
        "",
        "GST",
        "",
        formatCurrency(invoice.GST)
    );

    const duePosition = paidToDatePosition + 25;
    doc.font("Helvetica-Bold");
    generateTableRow(
        doc,
        duePosition,
        "",
        "",
        "Total",
        "",
        formatCurrency(invoice.subtotal + invoice.GST)
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
        .text(Checkin, 50, y)
        .text(Checkout, 100, y)
        .text(Description, 180, y )
        .text(TotalDays, 310, y )
        .text(Discount, 370, y )
        .text(Maintenance, 430, y)
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

module.exports = {
    createInvoice
};