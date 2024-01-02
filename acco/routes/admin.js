var express = require('express');
var router = express.Router();
const con = require('../dbconfig');
var authcheck = require('./authentication')
var sprintf = require('sprintf-js').sprintf;

router.post('/updatetariff',function(req,res){
    try{
        
    console.log(req.body);
    id=req.query.tariffid;
    // name1=req.body.name;
    var command = sprintf('update tariffdetail set name="'+req.body.name +'", price='+ req.body.price + ',tax=' + req.body.tax + ',discount=' + req.body.discount + ',totalamount=' + req.body.totalamount + ' WHERE tariffid=' + id);
    // lastname,email,phonenumber,address1,address2,city,state,country,pincode,checkin,checkout,adults,child,roomtype,status) VALUES ("%s", "%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%d)', req.body.firstname, req.body.lastname, req.body.email, req.body.phonenumber, req.body.address1, req.body.address2, req.body.city, req.body.state, req.body.country, req.body.pincode, req.body.checkin, req.body.checkout, req.body.adult, req.body.child, req.body.roomtype, 1);

    console.log("after", command);
    let data = [true, 1];
    con.query(command, data,function (err, result) {
    //   if (err) {
        console.log(result.affectedRows);
        if (result.affectedRows <= 0) {
        console.log(err);
        res.send({ status: false, message: "Pls check Tariff ID"});
      }
      else {
        res.status(200).send({ "message": "Traiff  Update Successfully" });
        res.end();
      }
    })

    }
    catch{
        console.log("Catch");
        const statusCode = e.statusCoderes || 500;
        res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
      }
    
})


router.post('/addtraiff',authcheck,function(req,res){
    console.log("Welcome to Add Traiff");   
    try
    {
        console.log("Welcome to Product");

    console.log("body", req.body);
    //  var command=sprintf('INSERT INTO tariffdetail(name,price,tax,discount,totalamount,status) values ("%s",%0.2f,%0.2f,%0.2f,%0.2f,%b)', req.body.name, req.body.price, req.body.tax, req.body.discount, req.body.totalamount,1);
     var command=sprintf('INSERT INTO tariffdetail(name,price,tax,discount,totalamount,status) values ("%s",%0.2f,%0.2f,%0.2f,%0.2f,%b)', req.body.name, req.body.price, req.body.tax, req.body.discount, req.body.totalamount,1);
   
    console.log(command);
    con.query(command, function (err, result) {
      if (err){ 
      throw err;
      console.log("Error", err);
        res.send("Error");
    }
    else{
      res.status(200).send({ message: "Successfully Add Product" });
      res.end();
    }
  });
    }
    catch (e) {
      console.log("Catch");
      const statusCode = e.statusCoderes || 500;
      res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
    }
  })
  

    // try {
    //     console.log("Body", req.body);
        
    //     var command = sprintf('INSERT INTO tariffdetail(name,price,tax,discount,totalamount,status) VALUES ("%s",%0.2f,%0.2f,%0.2f,%0.2f,%b)', req.body.name, req.body.price, req.body.tax, req.body.discount, req.body.totalamount,1);
    
    
    //     console.log("after", command);
    //     con.query(command, function (err, result) {
    //       if (err) {
    //         console.log(err);
    //         res.send({ status: false, message: err });
    //       }
    //       else {
    //         res.status(200).send({ "message": "Traiff added Successfully" });
    //         res.end();
    //       }
    //     })
    //   }
    //   catch (e) {
    //     console.log("Catch", e);
    //     const statusCode = e.statusCoderes || 500;
    //     res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
    //   }
    // // res.end();
// })




module.exports = router;
