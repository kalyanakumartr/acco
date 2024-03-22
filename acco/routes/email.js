var express = require('express');
var router = express.Router();
const con = require('../dbconfig');
const moment = require('moment');
// var sprintf = require('sprintf');
const nodemailer = require("nodemailer");



//st new email

router.get('/generateOTP', (req, res) => {
  console.log("Welcome to create OTP");
  var otpCode = Math.floor(100000 + Math.random() * 900000);
  var ctime = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
  var tentime = moment(Date.now()).add(10, 'minutes').format('YYYY-MM-DD HH:mm:ss');
  var commd = 'select userid from user where email="' + req.query.email + '"';
  con.query(commd, function (gererr, getres) {
    console.log("len",getres.length);
    console.log(commd);
    if(getres.length>=1){
      var uid = getres[0].userid;
      console.log("userid", getres[0].userid);
      console.log(uid);
      var cmd = 'UPDATE otpstore SET otp="' + otpCode + '",otpctime="' + ctime + '",otpetime="' + tentime + '" WHERE userid=' + uid + '';
      console.log(cmd);
      let data = [true, 1];
      con.query(cmd, data, async function (err, result) {
  
        var inputto = req.query.email;
        var inputsubject = "Otp ";
        var inputtext = "Otp " + otpCode
        // if (result.affectedRows <= 0) {
        //   res.send({ status: false, message: "No Email Pls check" });
        //   console.log("err", err);
        // }
        // else 
        // {
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
              to: inputto,
              subject: inputsubject,
              text: inputtext
            });
            console.log("email sent sucessfully", err);
            // res.send("email sent sucessfully");
            res.status(200).send({ message: "Successfully update and send email " });
  
          }
            catch (error) {
            console.log(error, "email not sent")
          }
          // });
  
          // }
        // }
      })
      
    }
    else
    {
      console.log("Pls check Email id ")
          res.send("Pls check  Mail id");
    }
    // console.log(getres[0].userid);
    
  })
}
);



//end new email

//not use will del 
router.get('/oldgenerateOTP', (req, res) => {
  console.log("Welcome to create OTP");
  // var email = req.body;
  var otpCode = Math.floor(100000 + Math.random() * 900000);
  console.log("otpcode", otpCode);
  var ctime = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
  var tentime = moment(Date.now()).add(10, 'minutes').format('YYYY-MM-DD HH:mm:ss');
  console.log("ten", tentime);
  console.log("ctime", ctime)
  // SELECT userid FROM user WHERE email=
  var commd = 'select userid from user where email="' + req.query.email + '"';
  con.query(commd, function (gererr, getres) {
    console.log("len",getres.length);
    console.log(commd);
    // console.log(getres[0].userid);
    var uid = getres[0].userid;
    console.log("userid", getres[0].userid);
    console.log(uid);
    var cmd = 'UPDATE otpstore SET otp="' + otpCode + '",otpctime="' + ctime + '",otpetime="' + tentime + '" WHERE userid=' + uid + '';
    console.log(cmd);
    let data = [true, 1];
    con.query(cmd, data, async function (err, result) {

      var inputto = req.query.email;
      var inputsubject = "Otp ";
      var inputtext = "Otp " + otpCode
      if (result.affectedRows <= 0) {
        res.send({ status: false, message: "No Email Pls check" });
        console.log("err", err);
      }
      else {
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
            to: inputto,
            subject: inputsubject,
            text: inputtext
          });
          console.log("email sent sucessfully", err);
          // res.send("email sent sucessfully");
          res.status(200).send({ message: "OTP send successfully! please check your email " });

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


router.post('/verifyOTP', (req, res) => {
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
    var commd = 'select userid from user where email="' + req.body.email + '"';
    con.query(commd, function (gererr, getres) {
      console.log(commd);
      // console.log(getres[0].userid);
      var uid = getres[0].userid;
      console.log("userid", getres[0].userid);
      console.log(uid);

      var cmmd = ('select count(otp) as counting from otpstore where userid="' + uid + '" AND otpetime>"' + ctime + '" AND otp=' + otp + '');
      console.log("cmd", cmmd);
      con.query(cmmd, function (error, result) {
        console.log("count", result[0].counting);
        if (result[0].counting >= 1) {
          res.send({ status: true, message: "OTP verified successfully " });
        }
        else {
          console.log("Error", error)
          // res.send({ "Message": "Unable to get Date " });
          res.send({ status: false, message: "Expired OTP Or  Invalid OTP Unable to get data" });
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
router.get('/emailverify', function (req, res) {
  var cmd = 'select * from user  where phonenumber=' + req.query.phonenumber + '';
  console.log("cmd", cmd);
  con.query(cmd, function (err, result) {
    if (result.length >= 1) {
      if (err) {
        console.log("Error");
        res.send("No Data");
      }
      else {
        console.log(result);

        res.send(result);
      }
    }

    else {
      //   console.log("Error pls check Email");
      res.send("Pls check Email");
    }
  }

  )
})



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









// //otp gen st



// router.post('/generateOTP', authcheck, (req, res) => {
//   // var email = req.body;
//   var otpCode = Math.floor(100000 + Math.random() * 900000);
//   console.log("otpcode", otpCode);
//   var mysqlTimestamp = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
//   var tensqlTimestamp = moment(Date.now()).add(10, 'minutes').format('YYYY-MM-DD HH:mm:ss');
//   console.log("ten", tensqlTimestamp);


//   con.query("select userid,count(email) count from user where email=?", [req.body.email], async (error, result) => {
//     console.log("Error", error, result[0].count, result[0].userid);
//     if (result[0].count > 0) {
//       //   res.send({ status: true, message: "Already email id exist giv e correct email id " })
//       //   return;
//       console.log("Already email id exist give correct email id", result[0].userid)
//       user = result[0].userid;
//       console.log(user);
//       // res.send(userid);
//       // return;
//       var comm = sprintf('INSERT INTO otpstore (userid,name,phonenumber,otp,otptype,otpctime,otpetime,status) VALUES (%d, "%s","%s",%d,"%s","%s","%s",%d)', user, req.body.name, req.body.phonenumber, otpCode, req.body.otptype, mysqlTimestamp, tensqlTimestamp, 1);
//       console.log("before", comm);
//       con.query(comm, function (err, result) {
//         if (err) {
//           // console.log(err);
//           res.send({ status: false, message: err });
//         }
//         else {

//           res.send({ result, user });
//           res.end();
//         }
//       })
//     }
//     else {
//       var otpn = otpGenerator.generate(8, { upperCaseAlphabets: true, lowerCaseAlphabets: true, specialChars: true });
//       console.log("newotp : ", otpn);
//       fname = req.body.name;
//       email = req.body.email;
//       pno = req.body.phonenumber;
//       var cmdate = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
//       var cd = sprintf('INSERT INTO user (firstname,modifieddate,phoneNumber,email,createddate,username,status) values ("%s","%s","%s","%s","%s","%s",%d)', fname, cmdate, pno, email, cmdate, fname, 1);

//       console.log("after in", cd);
//       con.query(cd, function (erro, inseruser) {
//         // con.query("select userid,count(email) count from user where email=?", [req.body.email], async (error, result) => {
//         // var suser=('select userid from user where email='+req.body.email);
//         // con.query(suser,function(error, afterresult)  {
//         con.query("select userid,count(email) count from user where email=?", [req.body.email], async (error, afterresult) => {
//           var user = afterresult[0].userid
//           console.log("after user", user);
//           var comm = sprintf('INSERT INTO otpstore (userid,name,phonenumber,otp,otptype,otpctime,otpetime,status) VALUES (%d, "%s","%s",%d,"%s","%s","%s",%d)', user, req.body.name, req.body.phonenumber, otpCode, req.body.otptype, mysqlTimestamp, tensqlTimestamp, 1);

//           console.log("after email ", comm);
//           con.query(comm, function (err, result) {
//             if (err) {
//               // console.log(err);
//               res.send({ status: false, message: err });
//             }
//             else {

//               res.send(result);
//               res.end();
//             }
//           })
//         })
//       })
//     }
//   });
// });
// //otp gen en st

// router.post('/verifyOTP', authcheck, (req, res) => {
//   try {
//     // var inputotp = req.body.inputotp;
//     // console.log(req.body);
//     // var cmd = ('select count(otp,otpetime from otpstore where userid=' + req.body.userid);
//     usrid = req.body.userid;
//     console.log(usrid);
//     ctime = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
//     console.log(ctime);
//     otp = req.body.inputotp
//     console.log("otp", otp);
//     // console.log(userid);
//     var cmmd = ("select count(otp) as count from otpstore where userid=" + req.body.userid + " AND otpetime>'" + ctime + "' AND otp='" + otp + "'");
//     console.log("cmd", cmmd);
//     con.query(cmmd, function (error, result) {
//       console.log("count", result);
//       if (result[0].count > 0) {
//         res.send({ status: true, message: "Successfully Verify " });
//       }
//       else {
//         console.log("Error", error)
//         // res.send({ "Message": "Unable to get Date " });
//         res.send({ status: false, message: "Expired OTP Or Unable to get data" });
//       }
//     })
//   }
//   catch (err) {
//     console.log("Catch");
//     const statusCode = e.statusCoderes || 500;
//     res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });

//   }

// })

// //otp gen en end


// //otp very




// //send email st

// router.post('/sendemail',async function(req,res){
// const{ from,to,subject,text}=req.body;
// const data={from,to,subject,text}

// const r=await nodemailer.send(data);
// // const data={
// //   "from":"stashook2020@gmail.com",
// //     "to": "muthu@stashook.com",
// //     "subject": "Hellow world!",
// //     "text": "test"

// // }


// })
// var sender=nodemailer.createTransport({
//   service:"gmail",
//   host: "smtp.gmail.com",
//   port:587,
//   secure: false,

//   auth:{
//       // type: "login", // default
//       Username:'
//       Password:'
//   },
// });


// res.send(r);

// //send email stop

//auth login
