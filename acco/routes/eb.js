var express = require('express');
var router = express.Router();
const con = require('../dbconfig');
var authcheck = require('./authentication')
var sprintf = require('sprintf-js').sprintf;
const moment = require('moment');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const { resume } = require('pdfkit');

//st update eb 
router.post('/updateebreading',(req,res)=>{
    try{
console.log("Welcome to Update  EB Reading ");

var command = sprintf('UPDATE ebreading SET closingunit='+req.body.closingunit+' ,totalunit='+req.body.totalunit+',price='+req.body.price+', totalamount='+req.body.totalamount+',closingdate="'+req.body.closingdate+'" WHERE bookingid=' + req.body.bookingid+'');


console.log("after", command);

con.query(command, function (err, result) {
if(result.affectedRows>=1){
//   console.log("Error", err);
//   if (err) {
//     console.log("Error", err);
//     res.send({ status: false, message: err });
//   }
//   else {
    console.log("Update Succeess");
    res.status(200).send({ "message": "EB Reading Update Successfully"});
}
else
{
    console.log("Error", err);
    res.send({ status: false, message: err });

}
})

}
    catch (e) {
        console.log("Catch");
        const statusCode = e.statusCoderes || 500;
        res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
    
      }
    })


//end update eb


router.post('/addebreading',(req,res)=>{
    try{
console.log("Welcome to EB Reading ");

var command = sprintf('INSERT INTO ebreading (bookingid,openingunit,openingdate,status) VALUES   (%d,%d,"%s",%d)', req.body.bookingid, req.body.openingunit, req.body.openingdate,1);

console.log("after", command);

con.query(command, function (err, result) {

  console.log("Error", err);
  if (err) {
    console.log("Error", err);
    res.send({ status: false, message: err });
  }
  else {
    res.status(200).send({ "message": "EB Reading added Successfully"});
}
})

}
    catch (e) {
        console.log("Catch");
        const statusCode = e.statusCoderes || 500;
        res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
    
      }
    })

    router.get('/getebdata',(req,res)=>{
        try{
            console.log("Welcome to Get EB Data");
            cmd='SELECT * FROM ebmaster';
            con.query(cmd,function(err,result){
                if(err)
                {
                    console.log(err);
                    res.send({"Error":err})
                }
                else
                {
                    console.log("Get Eb Data");
                    res.send(result);
                }
            });

        }
        catch (e) {
            console.log("Catch");
            const statusCode = e.statusCoderes || 500;
            res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
        
          }
    
    })


router.get('/getebreading',(req,res)=>{
    try{
        cmd='select * from ebreading where bookingid='+req.query.bookingid+'';
        con.query(cmd, function (error, result) {
            console.log(result.length)
            if (result.length>=1) {
                res.send(result);

            }
            else {
                res.send({ "Message": "Unable to get Date " });

            }
          })
    }
    catch (e) {
        console.log("Catch");
        const statusCode = e.statusCoderes || 500;
        res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
    
      }

})


module.exports = router;
