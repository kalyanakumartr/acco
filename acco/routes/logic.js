var express = require('express');
var router = express.Router();
const con = require('../dbconfig');
var authcheck = require('./authentication')
var sprintf = require('sprintf-js').sprintf;
const moment = require('moment');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const nodemailer = require("nodemailer");



//st new logic

router.get('/getlogic', function (req, res) {
    try {
        var cmd = 'select * from logic where adult=' + req.query.adult +  ' ' ;
      console.log(cmd);
      cin=req.query.cin;
      cout=req.query.cout;
      con.query(cmd, function (getbooerr, getboores) {
        console.log("Data Length", getboores.length);
        if (getboores.length >= 1) {
  
      adultcount=getboores[0].adult;
      console.log("adul",adultcount);
         command = 'CALL spandroomlist (?,?,?)';
          console.log("command", cin, cout,adultcount)
          con.query(command, [cin, cout,adultcount], function (err, result) {
            if (err) {
              console.log("err",err);
              res.send("err");
            }
            else {
              console.log(result);
              res.send(result);
            }
          });
        }
        else {
          res.send("Check booking id");
          console.log("Not Booking id");
  
        }
      })
    }
    catch (e) {
      console.log("Catch");
      const statusCode = e.statusCoderes || 500;
      res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  
    }
  
  })
  
  //end new logic
  
// router.get('/getlogicnew',function(req,res){
//   try{
//   console.log("welcome to new logic");
// var command='select sum(bhk1count) AS bhk1 , sum(bhk2count) as bhk2, sum(bhk3count) AS bhk3 from booking WHERE (checkin BETWEEN "'+req.query.cin+'" AND "'+req.query.cout+'" OR checkout BETWEEN "'+req.query.cin+'" AND "'+req.query.cout+'") ';
// // var cmmd ='select bhk1count,bhk2count,bhk3count from where checkin='+req.query.cin+'between checkout='+req.query.cout+'';
// con.query(command,function(getbookingerr,getbookingresult)
// {

//   if(getbookingerr){
//     console.log("Err",getbookingerr);
//     res.send({message:"Something Error"});
//   }
//   else
//   {
//     var logicquery='select * from logic where adult='+req.query.adult+'';
//     console.log("bookingbhk1",getbookingresult);
//     var getbhk1=getbookingresult[0].bhk1;
//     var getbhk2=getbookingresult[0].bhk2;
//     var getbhk3=getbookingresult[0].bhk3;
//     console.log(getbhk1,getbhk2,getbhk3);

//   // res.send({"Result":getbookingresult});
//   // res.send(getbookingresult);
//     con.query(logicquery,function(logicerr,logicresult){
//       if(logicerr)
//       {

//         console.log("Logic Err");
//         res.send("Get Login Err");
//       }
//       else
//       {
//         console.log("cmd",command);
//         console.log("bookingbhk1",getbhk1);

//         console.log("logic bhk1",logicresult[0].bhktype1);
    
//         // console.log("Logic Result",logicresult);
//         res.send({"messange":logicresult});
//       }
//     })
// }
// });
// }
// catch (e) {
//   console.log("Catch");
//   const statusCode = e.statusCoderes || 500;
//   res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });

// }

// })

// //   var cmd = 'select * from logic where adult=' + req.query.adult +  ' ' ;
// //   console.log(cmd);
// //   cin=req.query.cin;
// //   cout=req.query.cout;
// //   con.query(cmd, function (getbooerr, getboores) {
// //     console.log("Data Length", getboores.length);
// //     if (getboores.length >= 1) {
// //       adultcount=getboores[0].adult;
// //       console.log("adul",adultcount);
// //       res.send(adultcount);
// //     }
// //     else{
// // res.send("Err")
// //     }
// //   })



module.exports = router;
