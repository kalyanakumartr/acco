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
  



module.exports = router;
