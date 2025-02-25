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
    var cmd = 'select * from logic where roomtypeid='+req.query.roomtypeid+' and adult=' + req.query.adult + '';
    console.log(cmd);
    cin = req.query.cin;
    cout = req.query.cout;
    con.query(cmd, function (getbooerr, getboores) {
      console.log("Data Length", getboores.length);
      if (getboores.length >= 1) {
        adultcount = getboores[0].adult;
        roomtypeids=getboores[0].roomtypeid;
        console.log("adul", adultcount);
        command = 'CALL spandroomlist (?,?,?,?)';
        console.log("command", cin, cout, adultcount)
        con.query(command, [cin, cout, adultcount,roomtypeids], function (err, result) {
          // console.log("len",result.length);
          // console.log("aa",result.affectedRows)
          if (err) {
            console.log("err", err);
            // res.send("We are Sorry! currently all rooms are occupied s.");
            res.send({message:"No Rooms "})
          }
          else {
            // console.log(result);
            res.send(result);
          }
        });
      }
      else {
        res.send("We are Sorry! currently all rooms are occupied .");
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
router.post('/addadult',function(req,res){
  try{
    console.log("Weolcom to Add Adult");
    console.log(req.body);
    console.log("RoomTypeId",req.body.roomtypeid);
    var command = sprintf('INSERT INTO logic(adult,roomtypeid,optiontype,bhktype1,bhktype2,bhktype3,noofrooms,bed,price,totalamount,status) values(%d,%d,"%s",%d,%d,%d,%d,%.2f,%.2f,%.2f,%d)',req.body.adult, req.body.roomtypeid, req.body.optiontype,req.body.bhktype1,req.body.bhktype2,req.body.bhktype3,req.body.noofrooms,req.body.bed,req.body.price,req.body.price,1);
      // bhktype1,,,noofrooms,bed,Price,totalamount,status)VALUES (%d,%d"%s",%d,%d,%d,%d,%.2f,%.2f,%.2f,%d)',req.body.adult,req.body.roomtypeid,req.body.optiontype, req.body.bhktype1, req.body.bhktype2, req.body.bhktype3,req.body.noofrooms,req.body.bed,req.body.Price,req.body.Price,1);
      // ,optiontype,bhktype1,bhktype2,bhktype3,noofrooms,bed,Price,totalamount,status) VALUES (%d,%d,"%s",%d,%d,%d,%d,%.2f,%.2f,%.2f,%d)' 
      // , req.body.adult, req.body.roomtypeid, req.body.optiontype, req.body.bhktype1, req.body.bhktype2, req.body.bhktype3,req.body.noofrooms,req.body.bed,req.body.Price,req.body.Price,1);
    console.log(command);
    con.query(command, function (err, result) {
      if (err) {
        console.log(err);
        res.status(401).send({ "message": err });
      }
      else {
        // console.log(err);
        res.status(200).send({ message: "Successfully Add Adult" });
        res.end();
      }

  })
}
  catch (e) {
    console.log("Catch",e);
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });

  }

})




router.get('/getlogicall', function (req, res) {
  try {
    var cmd = 'select * from logic';
    console.log(cmd);
    con.query(cmd, function (err, result) {
      console.log("Data Length", result.length);
          if (err) {
            console.log("err", err);
            // res.send("We are Sorry! currently all rooms are occupied s.");
            res.send({message:"No Logic "})
          }
          else {
            // console.log(result);
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

module.exports = router;
