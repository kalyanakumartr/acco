var express = require('express');
var router = express.Router();
var sprintf = require('sprintf-js').sprintf;
const bcrypt = require('bcryptjs');
const nodemailer = require("nodemailer");
const jsonwebtoken = require('jsonwebtoken');
const con = require('../dbconfig');
const Country = require('country-state-city').Country;
const State = require('country-state-city').State;
const multer = require('multer');
const path = require('path');
// const otpgen=require('otp-generator');
const { error, Console } = require('console');
const moment = require('moment');
const otpGenerator = require('otp-generator');


//st auth multiple
router.post('/auth', async function (request, response) {
  // Capture the input fields
  let username = request.body.username;
  let password = request.body.password;
  if (username && password) {
    con.query('SELECT *FROM user as usr, userrolemap as urm WHERE usr.userid=urm.userid AND username = ?  ', [request.body.username], function (error, results) {
      if (results.length > 0) {
        // console.log("Error", error, results[0]);
        // console.log("Error", error);
        // console.log(results, "check", results[0].password);
        // bcrypt
        //   .compare(request.body.password, results[0].password)
        //   .then(res => {
            // console.log("res", res) // return true
            if (results.length > 0) {
              const accesstoken = jsonwebtoken.sign({ username, password }, process.env.ACCESS_TOKEN);
              // console.log("token", accesstoken);
              var type = '';
              if (results[0].roleid == 1) {

                type = "Admin"
                // var appoiid = 0;
                // var statusId = 0;

                response.status(200).send({accesstoken: accesstoken, usertype: type, username: results[0].username, userid: results[0].userid, email: results[0].email});
                response.end();
              }
              else if (results[0].roleid == 2) {

                type = "Manager"
                // var appoiid = 0;
                // var statusId = 0;
                response.status(200).send({ accesstoken: accesstoken, usertype: type, username: results[0].username, userid: results[0].userid, email: results[0].email });
                response.end();
              }
              else {
                type = "Customer"
                if (type == "Customer") {
                  // comm = "SELECT * FROM appointment app WHERE app.appPatientId=" + results[0].userId + " AND appStatusId=4";
                  // con.query(comm, function (req, res) {
                    // var appoiid = 0;
                    // var statusId = 0;
                    // if (res.length > 0) {
                      // appoiid = res[0].id;
                      // statusId = res[0].appStatusId;
                    
                    // else{}
                    response.status(200).send({ accesstoken: accesstoken, usertype: type, username: results[0].username, userid: results[0].userid, email: results[0].email});
                    response.end();
                  }
                  // );
                // }
              }
              //
            }
            else {
              response.status(401).send('Incorrect Username and/or Password!');
              response.end();
            }
            //  response.end();
          // })
          // .catch(err => console.error(err.message))
      } else {
        response.status(401).send('Incorrect Username and/or Password!');
        response.end();
      }
    }
    );
  } else {
    response.status(401).send('Please enter Username and Password!');
    response.end();
  }
});




//end multiple



//otp gen st



router.post('/generateOTP', (req, res) => {
  // var email = req.body;
  var otpCode = Math.floor(100000 + Math.random() * 900000);
  console.log("otpcode", otpCode);
  var mysqlTimestamp = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
  var tensqlTimestamp = moment(Date.now()).add(10, 'minutes').format('YYYY-MM-DD HH:mm:ss');
  console.log("ten", tensqlTimestamp);


  con.query("select userid,count(email) count from user where email=?", [req.body.email], async (error, result) => {
    console.log("Error", error, result[0].count,result[0].userid);
    if (result[0].count > 0) {
    //   res.send({ status: true, message: "Already email id exist give correct email id " })
    //   return;
    console.log("Already email id exist give correct email id",result[0].userid)
    user=result[0].userid;
    console.log(user);
    // res.send(userid);
    // return;
    var comm = sprintf('INSERT INTO otpstore (userid,name,phonenumber,otp,otptype,otpctime,otpetime,status) VALUES (%d, "%s","%s",%d,"%s","%s","%s",%d)', user, req.body.name, req.body.phonenumber, otpCode, req.body.otptype, mysqlTimestamp, tensqlTimestamp, 1);
    console.log("before",comm);
    con.query(comm, function (err, result) {
      if (err) {
        // console.log(err);
        res.send({ status: false, message: err });
      }
      else {
  
        res.send({result,user});
        res.end();
      }
    }) 
    }
    else{
  var otpn = otpGenerator.generate(8, { upperCaseAlphabets: true, lowerCaseAlphabets: true, specialChars: true });
  console.log("newotp : ", otpn);
  fname=req.body.name;
  email=req.body.email;
  pno=req.body.phonenumber;
  var cmdate = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
var cd=sprintf('INSERT INTO user (firstname,modifieddate,phoneNumber,email,createddate,username,status) values ("%s","%s","%s","%s","%s","%s",%d)',fname,cmdate,pno,email,cmdate,fname,1);

console.log("after in",cd);
con.query(cd,function(erro,inseruser){
  // con.query("select userid,count(email) count from user where email=?", [req.body.email], async (error, result) => {
  // var suser=('select userid from user where email='+req.body.email);
  // con.query(suser,function(error, afterresult)  {
    con.query("select userid,count(email) count from user where email=?", [req.body.email], async (error, afterresult) => {
  var user=afterresult[0].userid
  console.log("after user",user);
  var comm = sprintf('INSERT INTO otpstore (userid,name,phonenumber,otp,otptype,otpctime,otpetime,status) VALUES (%d, "%s","%s",%d,"%s","%s","%s",%d)', user, req.body.name, req.body.phonenumber, otpCode, req.body.otptype, mysqlTimestamp, tensqlTimestamp, 1);
  
  console.log("after email ",comm);
  con.query(comm, function (err, result) {
    if (err) {
      // console.log(err);
      res.send({ status: false, message: err });
    }
    else {

      res.send(result);
      res.end();
    }
  })
})
    })
  }
});
});
//otp gen en st

router.post('/verifyOTP', (req, res) => {
  try {
    // var inputotp = req.body.inputotp;
    // console.log(req.body);
    // var cmd = ('select count(otp,otpetime from otpstore where userid=' + req.body.userid);
    usrid=req.body.userid;
    console.log(usrid);
    ctime=moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
    console.log(ctime);
    otp=req.body.inputotp
    console.log("otp",otp);
    // console.log(userid);
    var cmmd=("select count(otp) as count from otpstore where userid=" + req.body.userid + " AND otpetime>'"+ctime+"' AND otp='"+otp+"'");
    console.log("cmd",cmmd);
    con.query(cmmd, function (error, result) {
      console.log("count",result);
      if(result[0].count > 0){
              res.send({message:"Successfully Verify "});
      }
      else {
        console.log("Error",error)
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

//otp gen en end


//otp very


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

const authcheck = (req, res, next) => {
  headers = {

    'Content-Type': 'application/json',
    "Access-Control-Allow-Origin": ' <origin>',
    "Access-Control-Allow-Credentials": true
  };
  // console.log(headers);
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(" ")[1];
  // console.log(token);
  if (!token) return res.sendStatus(401);
  jsonwebtoken.verify(token, process.env.ACCESS_TOKEN, (err, obj) => {

    if (err) {
      console.log("error", err);
      return res.sendStatus(403);
    }
    req.userName = obj.username;
    req.password = obj.password;
    next();

  })
}


//get room split
router.get('/getroomsplit', authcheck, function (req, res) {
  try {
    command = 'SELECT * FROM room  WHERE roomsplit=1';
    con.query(command, function (error, results) {
      if (error) {
        res.send({ "Message": "Unable to get Date " });
      }
      else {
        res.send(results);
      }
    })
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})

//end get room

//st get room list
router.get('/getroomlist', function (req, res) {
  //  var cmmd=sprintf("select * from room where basecount<="+req.query.adults + " OR basecount<=4");
  var cmmd = sprintf("select * from room where (basecount<='" + req.query.adults + "' OR basecount<=4) and roomid NOT IN (SELECT roomid from confirmbooking WHERE (checkin  BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "' OR checkout BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "'))");
  con.query(cmmd, function (err, result) {
    console.log("cmd", cmmd);
    if (err) {
      console.log(err);
      res.send(err);
    }
    else {

      console.log(result);
      res.send(result);
      
    }
  })
  // res.send(result);
});
//end get room list

//confirmbooking
router.post('/confirmbooking', function (req, res) {
  try {
    console.log(req.body);
    var command = sprintf('INSERT INTO confirmbooking (roomid,checkin,checkout,roombhk,noofdays,adults,name,phonenumber,email,price,totalprice,verificationstatus,status) VALUES ("%s", "%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%d)', req.body.roomid, req.body.checkin, req.body.checkout, req.body.roombhk, req.body.noofdays, req.body.adults, req.body.name, req.body.phonenumber, req.body.email, req.body.price, req.body.totalprice,req.body.verificationstatus,  1);

    console.log("after", command);
    con.query(command, function (err, result) {
      if (err) {
        console.log(err);
        res.send({ status: false, message: err });
      }
      else {
        res.status(200).send({ "message": "Booking added Successfully" });
        res.end();
      }
    })
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})


//to get roomnumber and bhk when floornumber given
router.get('/getroom', function (req, res) {
  console.log("getroom")
  var getroom = "SELECT * FROM floorroommapping"
  con.query(getroom, function (error, result) {
    if (error) {
      console.log(error);
      res.send("Unable to get data");
    }
    else {
      res.send(result);
    }
  });
});

// get room in room tbl
// end get room


// router.get('/findroom',function(req,res){
// var get = "SELECT roomno FROM floorroommapping"
// getroom.find()
// .then(roomno=>{
//   res.json(roomno)
// })
// .catch(error=>{
//   res.json({error})
// })
// })

// //
// st extra bill 



// end extra bill


//placetovisit


router.get('/getplacetovisit', authcheck, function (req, res) {
  try {
    command = 'select * from placetovisit';
    con.query(command, function (error, results) {
      if (error) {
        res.send({ "Message": "Unable to get Date " });
      }
      else {
        res.send(results);
      }
    })
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})






//get food item
router.get('/getfooditem', authcheck, function (req, res) {
  try {
    command = 'select * from fooditem';

    con.query(command, function (error, results) {
      if (error) {
        res.send({ "Message": "Unable to get Date " });
      }
      else {
        res.send(results);
        // console.log("Done");
      }
    })
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})

//get role 

router.get('/getrole', authcheck, function (req, res) {
  try {
    command = 'select * from role ';
    console.log(command);
    con.query(command, function (error, results) {
      if (error) {
        res.send({ "Message": "Unable to get Date " });
      }
      else {
        res.send(results);
        // console.log("Done");
      }
    })
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }





})

//idproof 

//update image

//storage

const storagespace = multer.diskStorage({
  destination: 'C:/accouserimage/proof',
  filee: (req1, file, cb) => {
    return cb(null, `${file.fieldname}_${Date.now()}${path.extname(file.originalname)}`)
  }
})

//end storage

//create image 
const userproofimage = async (req, res, next) => {

  var data1 = {
    idproof: req.file.filename,
  }
  console.log("Filename", req.file.filename);

  let result = await con.query("update user set idproof='" + req.file.filename + "' WHERE proofid=" + req.body.idproof, function (err, rows) {
    if (err) {
      console.log(err);
      res.send({
        message: "error", err
      })
    }
    else {
      res.send({ message: "save" })
    }
  })
}

//end create image 
//upload
const proofupload = multer({
  storage: storagespace
})
//end upload

router.post('/userproof', proofupload.single('images'), userproofimage)

//cancelroombook
router.post('cancelroombook/:id', function (req, res) {
  console.log("Welcome to cancel Room Book");
  var id = req.params.id;
  var cmd = 'SELECT * FROM booking WHERE  bookedstatusid=2 AND id=' + id;
  con.query(cmd, function (error, getresult) {
    if (getresult = true) {
      var command = 'UPDATE booking SET bookedstatusid=2 WHERE bookingid=' + id + ' ';
      let data = [true, 1];
      con.query(command, data, function (error, result) {
        if (error) {
          res.send({ status: false, message: error });
          console.log(error);
          throw error;
        }
        else {
          res.status(200).send("Successfully Booking Cancel");
        };
      });
    }
  })
});



//booked
router.post('/roombooked', authcheck, function (req, res) {
  console.log("Welcome to Book page");
  // console.log(req.body);

  var getdetails = "SELECT *,false as roombooked FROM booking WHERE bookingid=" + req.body.bookingid;

  con.query(getdetails, function (request, result) {
    console.log("resu", result[0].adults);

    if (result[0].adults <= 4) {

      console.log("2 bed room Booked");
      res.send({ "Message": "2 Bed Room Booked" })
    }
    else if (result[0].adults >= 4 && result[0].adults <= 6) {
      console.log("3 bed room Booked");
      res.send({ "Message": "3 Bed Room Booked" })

    }

    else {
      console.log("Not Booked");
      res.send({ "Message": " Not Booked" })
      res.end();
    }

    // 
    // res.end();

  })
  // console.log(cin);
  // var gerorderwise= "SELECT * FROM room ORDER BY roomname";
  // c=con.query(gerorderwise,function(reqq,ress){})
  // console.log("cin",cin,"c",res[0].roomname,"order",gerorderwise);


});


/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send('respond with a resource');
  res.status(200).send(Country.getAllCountries());
  // console.log(Country.getAllCountries())
  // console.log(State.getAllStates())
});

router.get('/home', authcheck, function (req, res, next) {
  res.status(200).send(Country.getAllCountries());
}
);

//add booking
router.post('/addbooking', authcheck, function (req, res) {
  try {
    console.log(req.body);
    var command = sprintf('INSERT INTO booking (firstname,lastname,email,phonenumber,address1,address2,city,state,country,pincode,checkin,checkout,adults,child,roomtype,status) VALUES ("%s", "%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%d)', req.body.firstname, req.body.lastname, req.body.email, req.body.phonenumber, req.body.address1, req.body.address2, req.body.city, req.body.state, req.body.country, req.body.pincode, req.body.checkin, req.body.checkout, req.body.adult, req.body.child, req.body.roomtype, 1);

    console.log("after", command);
    con.query(command, function (err, result) {
      if (err) {
        console.log(err);
        res.send({ status: false, message: err });
      }
      else {
        res.status(200).send({ "message": "Booking added Successfully" });
        res.end();
      }
    })
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})
//end add booking

//st update booking
router.post('/updatebooking', function (req, res) {
  try {
    console.log(req.body);
    var command = sprintf('update booking set checkin=' + req.body.checkin + ',checkout=' + req.body.checkout + ' WHERE bookingid=' + req.body.bookingid);
    // lastname,email,phonenumber,address1,address2,city,state,country,pincode,checkin,checkout,adults,child,roomtype,status) VALUES ("%s", "%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%d)', req.body.firstname, req.body.lastname, req.body.email, req.body.phonenumber, req.body.address1, req.body.address2, req.body.city, req.body.state, req.body.country, req.body.pincode, req.body.checkin, req.body.checkout, req.body.adult, req.body.child, req.body.roomtype, 1);

    console.log("after", command);
    con.query(command, function (err, result) {
      if (err) {
        console.log(err);
        res.send({ status: false, message: err });
      }
      else {
        res.status(200).send({ "message": "Booking Update Successfully" });
        res.end();
      }
    })
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})
//end update booking

// st cancel booking

// router.post('/bookingcancel/:id', (req, res) => {
//   console.log("Welcomce to cancel");
//   var id = req.params.id;
//   var cmd = 'SELECT * FROM booking WHERE  bookedstatusid=2 AND bookingid=' + id;
//   console.log(cmd);
//   con.query(cmd, function (error, getresult) {
//     // if (getresult.length > 0 && getresult[0].bookedstatusid == 2) {
//       if(getresult=true){
//         var command = 'UPDATE booking SET bookedstatusid=2 WHERE bookingid=' +id;
//         let data=[true,1];
//         con.query(command, data, function (error, result){
//     // console.log(getresult[0]);
//     if (error) {
//       res.send({ status: false, message: error });
//       console.log(error);
//       throw error;
//     }
//     else {     
//       res.status(200).send("Successfully Booking Cancel");               }
        
//       });
//     }
//   })
// });



//end cancel booking


//update image

//storage

const storage = multer.diskStorage({
  destination: 'C:/accouserimage/user',

  filename: (req1, file, cb) => {
    return cb(null, `${file.fieldname}_${Date.now()}${path.extname(file.originalname)}`)
  }
})

//end storage

//create image 
const createimage = async (req, res, next) => {

  var data = {

    imageurl: req.file?.filename,

  }
  // console.log("Filename",req.file.filename);
  let result = await con.query("update user set imageurl='" + req.file.filename + "' WHERE userid=" + req.body.userid, function (err, rows) {
    if (err) {
      console.log(err);
      res.send({
        message: "errpr", err
      })
    }
    else {
      res.send({ message: "save" })
    }
  })
}

//end create image 
//upload
const upload = multer({
  storage: storage
})
//end upload
router.post('/updateuserimage', upload.single('images'), createimage)


//end updateuser image


//add user

router.post('/adduser', async function (req, res) {
  try {
    console.log("body", req.body);
    let hashedPassword = await bcrypt.hash(req.body.password, 8);
    let hashedCPassword = await bcrypt.hash(req.body.cpassword, 8);
    console.log(hashedPassword);
    //datetime st
    // var datetime=new  GETDATE();
    // console.log("date",datetime);
    var date_ob = new Date();
    var day = ("0" + date_ob.getDate()).slice(-2);
    var month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
    var year = date_ob.getFullYear();

    // var date = year + "-" + month + "-" + day;
    // console.log(date);

    var hours = date_ob.getHours();
    var minutes = date_ob.getMinutes();
    var seconds = date_ob.getSeconds();

    var dateTime = year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
    console.log(dateTime);



    //end datetime 
    console.log(hashedPassword);
    var command = sprintf('INSERT INTO user (firstname,lastname,address1,address2,city,state,country,modifieddate,phoneNumber,email,createddate,username,password,cpassword,status) VALUES ("%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%b)', req.body.firstname, req.body.lastname, req.body.address1, req.body.address2, req.body.city, req.body.state, req.body.country, dateTime, req.body.phonenumber, req.body.email, dateTime, req.body.username, hashedPassword, hashedCPassword, 1);
    console.log(command);
    con.query(command, function (err, mysqlres1) {
      // console.log(v);
      if (err) throw err;
      console.log("Error", err);
      userid = mysqlres1.insertId
      console.log(userid);
      // console.log(mysqlres1, 'Last insert ID in User:', mysqlres1.insertId);  
      var command = sprintf('INSERT INTO userrolemap (userid ,roleid,status) VALUES (%d,%d,%b)', userid, req.body.roleid, 1);
      // var command1=sprintf('INSERT INTO idproof (userid,status) VALUES (%d  ,%b)',  userid,1);
      con.query(command, function (err, mysqlres2) {
        console.log("role", command);
        // console.log("proof",command1);
        if (err) {
          res.status(401).send({ "message": err });
        }
        else {
          if (req.body.roleid = 4)
            res.status(200).send({ message: "Successfully Register" });
          res.end();
        }
      })
    })
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})

//get booking detail
router.get('/getbooking', authcheck, function (req, res) {
  try {
    command = 'select * from booking ';
    con.query(command, function (error, results) {
      if (error) {
        res.send("Unable to get Date ")
      }
      else {
        res.send(results);
      }
    })
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }

})

//get user detail
router.get('/getuser', function (req, res) {
  try {
    command = 'select * from user';
    con.query(command, function (error, results) {
      if (error) {
        res.send("Unable to get Date ")
      }
      else {
        res.send(results);
      }
    })
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }

})

//auth
router.post('/auth', function (request, response) {
  let username = request.body.userName;
  let password = request.body.password;
  // console.log("Check", username, password);
  // console.log("Check", username, password);
  // response.setHeader({'Content-Type': 'application/json'});
  // response.header ({'Content-Type': 'application/json'});
  if (username && password) {
    con.query('SELECT *FROM user WHERE username = ?  ', [request.body.userName], function (error, results) {
      if (results.length > 0) {
        // console.log("test3");
        bcrypt
          .compare(request.body.password, results[0].password)
          .then(res => {
            // console.log("test1");
            if (res && results.length > 0) {
              const accesstoken = jsonwebtoken.sign({ username, password }, process.env.ACCESS_TOKEN);
              console.log("token", accesstoken);
              response.status(200).send({ "message": "Successfully Login", accesstoken: accesstoken, username: results[0].username });
              // response.send({"message"success to login");
              response.end();

            }
            else {
              response.status(401).send({ "message": "Incorrect Username and/or Password!" });
              response.end();
            }
          })
          .catch(err => console.error(err.message))


      } else {
        // console.log("test2");
        response.status(401).send({ "message": "Incorrect Username and/or Password!" });
        // response.end();
      }
    }
    );
  }
})

//anupama code 

router.get('/getfloor', function (req, res) {
  console.log("getfloor");
  var tablelist = "SELECT floornumber FROM floor ";
  con.query(tablelist, function (error, result) {
    if (error) {
      console.log(error);
      res.send("Unable to get data");
    }
    else {
      res.send(result);
    }
  });
});

//to get roomnumber and bhk when floornumber given
router.get('/getroom/:floornumber', authcheck, function (req, res) {
  console.log("getroom")
  var getroom = "SELECT * FROM floorroommapping WHERE floornumber=" + req.params.floornumber + '';
  con.query(getroom, function (error, result) {
    if (error) {
      console.log(error);
      res.send("Unable to get data");
    }
    else {
      res.send(result);
    }
  });
});

router.get('/getbhk/:noofbhk', authcheck, function (req, res) {
  console.log("getbhk")
  var getroom = "SELECT * FROM floorroommapping WHERE noofbhk=" + req.params.noofbhk + '';
  con.query(getroom, function (error, result) {
    if (error) {
      console.log(error);
      res.send("Unable to get data");
    }
    else {
      res.send(result);
    }
  });
});

router.get('/getChargedAmenities', authcheck, function (req, res) {
  console.log("getchargedAmenities")
  var getroom = "SELECT * FROM facilitycharges WHERE facilitycategory='Charged Amenities'";
  con.query(getroom, function (error, result) {
    if (error) {
      console.log(error);
      res.send("Unable to get data");
    }
    else {
      res.send(result);
    }
  });
});


module.exports = router;



module.exports = router;
