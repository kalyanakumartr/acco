  var express = require('express');
var router = express.Router();
const con = require('../dbconfig');
const moment = require('moment');
var sprintf = require('sprintf');
const nodemailer = require("nodemailer");


router.get('/generateOTP', (req, res) => {

    // var email = req.body;
    var otpCode = Math.floor(100000 + Math.random() * 900000);
    console.log("otpcode", otpCode);
    var ctime = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
    var tentime = moment(Date.now()).add(10, 'minutes').format('YYYY-MM-DD HH:mm:ss');
    console.log("ten", tentime);
    console.log("ctime",ctime)
    var cmd='UPDATE otpstore SET otpno="'+otpCode+'",otpctime="'+ctime+'",otpetime="'+tentime+'" WHERE email="'+req.query.email+'"';
    console.log(cmd);
    let data = [true, 1];
    con.query(cmd,data,async function(err,result){
    
            var inputto=req.query.email;  
            var inputsubject="Otp ";
            var inputtext="Otp "+otpCode
            if (result.affectedRows <= 0) {
        res.send({ status: false, message: "No Email Pls check" });
        console.log("err",err);
        }
      else {
        try{
          const transporter = nodemailer.createTransport({
            host: process.env.HOST,
            service: process.env.SERVICE,
            port: 465,
            secure: true,
            auth: {
                user: process.env.USER,
                pass: process.env.PASS,
            },
        });
           await transporter.sendMail({
            from: process.env.USER,
              to: inputto,
              subject:inputsubject,
              text:inputtext
        });   
        console.log("email sent sucessfully",err);
        // res.send("email sent sucessfully");
        res.status(200).send({message:"Successfully update and send email "});
  
        }
        catch (error) {
          console.log(error, "email not sent")
      }
        // });
      
        // }
      }
  })
  }
  );
  
  
  //st verify otp
  
  
  router.post('/verifyOTP',  (req, res) => {
    try {
      // var inputotp = req.body.inputotp;
      // console.log(req.body);
      // var cmd = ('select count(otp,otpetime from otpstore where userid=' + req.body.userid);
      // usrid = req.body.userid;
      // console.log(usrid);
      ctime = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
      console.log(ctime);
      otp = req.body.inputotp
      console.log("otp", otp);
      // console.log(userid);
      var cmmd = ('select count(otpno) as counting from otpstore where email="' + req.body.email +'" AND otpetime>"' + ctime + '" AND otpno=' + otp + '');
      console.log("cmd", cmmd);
      con.query(cmmd, function (error, result) {
        console.log("count", result[0].counting);
        if (result[0].counting >= 1) {
          res.send({ status: true, message: "Successfully Verify " });
        }
        else {
          console.log("Error", error)
          // res.send({ "Message": "Unable to get Date " });
          res.send({ status: false, message: "Expired OTP Or Unable to get data" });
        }
      })
    }
    catch (err) {
      console.log("Catch");
      const statusCode = e.statusCoderes || 500;
      res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  
    }
  
  })
  
  
  
  // end verify otp
  
  //end otp verify
  module.exports = router;
