  var express = require('express');
var router = express.Router();
const con = require('../dbconfig');
const moment = require('moment');
// var sprintf = require('sprintf');
const nodemailer = require("nodemailer");


router.get('/generateOTP', (req, res) => {
console.log("Welcome to create OTP");
    // var email = req.body;
    var otpCode = Math.floor(100000 + Math.random() * 900000);
    console.log("otpcode", otpCode);
    var ctime = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
    var tentime = moment(Date.now()).add(10, 'minutes').format('YYYY-MM-DD HH:mm:ss');
    console.log("ten", tentime);
    console.log("ctime",ctime)
    // SELECT userid FROM user WHERE email=
    var commd='select userid from user where email="'+req.query.email+'"';
    con.query(commd,function(gererr,getres){
      console.log(commd);
      // console.log(getres[0].userid);
      var uid=getres[0].userid;
      console.log("userid",getres[0].userid);
      console.log(uid);
    var cmd='UPDATE otpstore SET otp="'+otpCode+'",otpctime="'+ctime+'",otpetime="'+tentime+'" WHERE userid='+uid+'';
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
      var commd='select userid from user where email="'+req.body.email+'"';
      con.query(commd,function(gererr,getres){
        console.log(commd);
        // console.log(getres[0].userid);
        var uid=getres[0].userid;
        console.log("userid",getres[0].userid);
        console.log(uid);
  
      var cmmd = ('select count(otp) as counting from otpstore where userid="' + uid +'" AND otpetime>"' + ctime + '" AND otp=' + otp + '');
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

//st email verify
router.get('/emailverify',function(req,res){
  var cmd='select * from user  where phonenumber='+req.query.phonenumber+'';
  console.log("cmd",cmd);
  con.query(cmd,function(err,result){
    if (result.length >= 1) {
    if(err)
    {
      console.log("Error");
      res.send("No Data");
    }
    else
    {
      console.log(result);
      
      res.send(result);
    }
  }

 else
      {
        //   console.log("Error pls check Email");
        res.send("Pls check Email");
      }
    }
  
)})



//end email verify

router.post('/sendEmail', async function (req, res) {

  try {

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
      to: ["muthu@stashook.com", "balajiabiksha@gmail.com"],
      // to: +req.body.email+,
      subject: "Test",
      text: "Subject"
    });

    console.log("email sent sucessfully");
    res.send("email sent sucessfully");
    // res.end();
  }
  catch (error) {
    console.log(error, "email not sent")
  }
});



  module.exports = router;
