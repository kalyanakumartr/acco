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
const color=require('colors');


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

                response.status(200).send({accesstoken: accesstoken, usertype: type, username: results[0].username, userid: results[0].userid, email: results[0].email,phonenumber:results[0].phonenumber,firstname:results[0].firstname});
                response.end();
              }
              else if (results[0].roleid == 2) {

                type = "Manager"
                // var appoiid = 0;
                // var statusId = 0;
                response.status(200).send({ accesstoken: accesstoken, usertype: type, username: results[0].username, userid: results[0].userid, email: results[0].email,phonenumber:results[0].phonenumber,firstname:results[0].firstname });
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
                    // console.log("gggg".bgRed);
                    response.status(200).send({ accesstoken: accesstoken ,usertype: type, username: results[0].username, userid: results[0].userid, email: results[0].email,phonenumber:results[0].phonenumber,firstname:results[0].firstname});
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

//st change password
router.post('/changepassword/:id', (req, res) => {
  var id = req.params.id;
  var password = req.body.password;
  

  var command = 'UPDATE user SET password="' + password +'" WHERE userid = ' + id + '';
  let data = [true, 1];
  con.query(command, data, function (error, result) {
    if (error) {
      res.send({ status: false, message: error });

      console.log(error);
      throw error;
    }
    else {
      console.log("Done");
      res.status(200).send("Successfully password  Update");
    }
  });

});


// router.post('/changepassword/:userid',authcheck, function (req, res) {
//   try {
//     // console.log(req.body);
//     var command = sprintf('update user set password=' + req.body.password +' WHERE userid=' + req.params.userid);
//     // lastname,email,phonenumber,address1,address2,city,state,country,pincode,checkin,checkout,adults,child,roomtype,status) VALUES ("%s", "%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%d)', req.body.firstname, req.body.lastname, req.body.email, req.body.phonenumber, req.body.address1, req.body.address2, req.body.city, req.body.state, req.body.country, req.body.pincode, req.body.checkin, req.body.checkout, req.body.adult, req.body.child, req.body.roomtype, 1);

//     console.log("after", command);
//     con.query(command, function (err, result) {
//       if (err) {
//         // console.log(err);
//         res.send({ status: false, message: err });
//       }
//       else {
//         res.status(200).send({ "message": "Change Password Successfully" });
//         res.end();
//       }
//     })
//   }
//   catch (e) {
//     console.log("Catch");
//     const statusCode = e.statusCoderes || 500;
//     res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
//   }
// })
// //end update booking

//end change password


//st frontoff a checkin

router.post('/actualcheckin',authcheck,(req,res)=>{
  try {
        var command = sprintf('update booking set acheckin='+"'" + req.body.acheckin +"'"+  ' WHERE email='+'"'+ req.body.email+'"');
    
let data = [true, 1];
    console.log("after", command);
    con.query(command, data,function (error, result) {
      console.log("affectedRows",result.affectedRows);
      if (result.affectedRows<=0) {
    
        // res.send({ status: false, message: error });
        res.send("Check Mail Id");
      console.log("Check Mail Id");
      // console.log(error);
      // throw error;
      }
      else {
        // res.send(result);
      res.status(200).send("Successfully Actual chekin Update");
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

//end frontoff a checkin



//st room type get

router.get('/roomtype',function(req,res){
  console.log("Welcome to room type");
  try {
    command = 'SELECT * FROM roomtype';
    con.query(command, function (error, result) {
      if (error) {
        res.send({ "Message": "Unable to get Date " });
      }
      else {
        res.send(result);
      }
    })
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
  
})


//end room type get



//otp gen st



router.post('/generateOTP', authcheck,(req, res) => {
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

router.post('/verifyOTP', authcheck,(req, res) => {
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
              res.send({status:true,message:"Successfully Verify "});
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
router.get('/getroomlist',authcheck, function (req, res) {
  //  var cmmd=sprintf("select * from room where basecount<="+req.query.adults + " OR basecount<=4");
  // var cmmd = sprintf("select * from room where (basecount<='" + req.query.adults + "' OR basecount<=4) and roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "' OR checkout BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "'))");
  // var cmmd = sprintf("select * from room where (basecount<='" + req.query.adults + "' OR basecount<=4) and roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "' OR checkout BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "'))");
var cmmd=sprintf("select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT('[',GROUP_CONCAT(roomno),']') AS roomnos,CONCAT('[',GROUP_CONCAT(roomid),']') AS roomids from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "' OR checkout BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "')) GROUP BY rtype,price,roomname");
 
  con.query(cmmd, function (err, result) {
    console.log("cmd", cmmd);
    if (err) {
      console.log(err);
      res.send(err);
    }
    else {

      console.log(result);
      res.send(JSON.stringify(result));
      
    }
  })
  // res.send(result);
});
//end get room list

//confirmbooking
// router.post('/confirmbooking', function (req, res) {
//   try {
//     console.log(req.body);
//     var command = sprintf('INSERT INTO confirmbooking (roomid,checkin,checkout,roombhk,noofdays,adults,name,phonenumber,email,price,totalprice,verificationstatus,status) VALUES ("%s", "%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%d)', req.body.roomid, req.body.checkin, req.body.checkout, req.body.roombhk, req.body.noofdays, req.body.adults, req.body.name, req.body.phonenumber, req.body.email, req.body.price, req.body.totalprice,req.body.verificationstatus,  1);

//     console.log("after", command);
//     con.query(command, function (err, result) {
//       if (err) {
//         console.log(err);
//         res.send({ status: false, message: err });
//       }
//       else {
//         res.status(200).send({ "message": "Booking added Successfully" });
//         res.end();
//       }
//     })
//   }
//   catch (e) {
//     console.log("Catch");
//     const statusCode = e.statusCoderes || 500;
//     res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
//   }
// })


//to get roomnumber and bhk when floornumber given
router.get('/getroom', authcheck, function (req, res) {
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


router.get('/getplacetovisit', function (req, res) {
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

//st get guest detail

router.get('/getguestdetail',authcheck, function (req, res) {
  try {
    // sdate=req.params.checkin
    console.log("query",req.query.checkin);

    checkin=req.query.checkin
    // command =( "select * from booking where checkin BETWEEN "+"'"+req.params.checkin+ ' 00:00:01'+ " '"+' AND ' +"'"+req.params.checkin+' 23:59:59'+"'");
    // console.log(command);
    // const sql="CALL getguestdetailwithcolor('"+ checkin +"')";
    const sql="CALL getguestdetailwithcolor('"+ checkin +"')";
    console.log(sql);
    // const guestres = con.query(sql);
    con.query(sql,function(err,result){
      if(err)
      {
      res.send("No Data");
      }
      else
      {
        res.send(result);
      }
    });
    // console(guestres);
    // return guestres;
    // res.send(guestres);
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})


//end guest detail

// code copy 
// router.get('/getguestdetail/:checkin',authcheck, function (req, res) {
//   try {
//     // sdate=req.params.checkin
//     console.log("parms",req.params.checkin);
//     command =( "select * from booking where checkin BETWEEN "+"'"+req.params.checkin+ ' 00:00:01'+ " '"+' AND ' +"'"+req.params.checkin+' 23:59:59'+"'");
//     console.log(command);
//     con.query(command, function (error, results) {
//       console.log(results.acheckin);
//       console.log("len",results.length);
//       // console.log(results.acheckin);
//       console.log("acheckin",results.acheckin);
//       var green=results.acheckin<results.checkin
//       console.log("green",green);
//       var red=results.acheckin<results.checkin
//       console.log("RED ",red);
//       var willinform=results.acheckin=0;
//       console.log("will inform",willinform);

//       if (results.length>=1) {
//       // if(acheckin>checkin){
//         res.send(results)
        
//       }
//       else {
//         res.send({ "Message": "Unable to get Date "});
//       }
//     })
//   }
//   catch (e) {
//     console.log("Catch");
//     const statusCode = e.statusCoderes || 500;
//     res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
//   }
// })

//end copy


// ST ADD FOOD ITEM

router.post('/admin/addfooditem',authcheck, function (req, res) {
  try {
    command = sprintf('INSERT INTO fooditem (fooditemname,foodcategory,avilabletime,price,status) VALUES ("%s","%s","%s",%d,%d)', req.body.fooditemname, req.body.foodcategory, req.body.avilabletime, req.body.price,1);
    console.log(command);
    con.query(command, function (error, results) {
      if (error) {
        res.send({ "Message": "Unable to get Date " });
      }
      else {
        // res.send(results);
        res.status(200).send({ message: "Successfully Add Food item" });
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



//END AD FOOD ITEM





//get food item
router.get('/getfooditem',  function (req, res) {
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

//cancelbooking


router.post('/bookingcancel/:bookingid',authcheck, function (req, res) {
  console.log("Welcome to cancel Room Book");
  var id = req.params.bookingid;
        var command = 'UPDATE booking SET bookedstatusid=2 WHERE bookingid=' +id+ ' ';
      console.log(command);
      let data = [true, 1];
      con.query(command, data, function (error, result) {
        // console.log(result);
        if (result.affectedRows<=0) {
          res.send({ status: false, message:"No Data Pls check booking id or else" });
          console.log(error);
          // throw error;
        }
        else {
          res.status(200).send("Successfully Booking Cancel");
        };
      });
    
  })
// });
//un wanted code

// }
    // else
    // {
    //   res.send("Data Not avilable");
    // }
// var cmd = 'SELECT * FROM booking WHERE  bookedstatusid=1 AND bookingid=' + id;
  // console.log(cmd);
  // con.query(cmd, function (error, getresult) {
    // console.log(getresult);
    // if (getresult = true) {
      // console.log(getresult=true || false);

//st user update

router.post('/updateuser/:userid',authcheck, function (req, res) {
  console.log("Welcome to update user ");
  var id = req.params.userid;
  var firstname=req.body.firstname;
  var lastname=req.body.lastname
  var address1=req.body.address1
  var address2=req.body.address2
  var city=req.body.city
  var state=req.body.state
  var country=req.body.country
  var phonenumber=req.body.phonenumber
  var email=req.body.email
  

        var command = 'UPDATE user SET firstname="'+firstname+'", lastname="'+lastname+'", address1="'+ address1+'",address2="'+address2 +'", city="'+city+' ",state="'+state +'", country="'+country+'", phonenumber="'+ phonenumber+'", email="'+ email+'" WHERE userid='+id+'';
      console.log(command);
      let data = [true, 1];
      con.query(command, data, function (error, result) {
        // console.log(result.affectedRows);
        if (result.affectedRows<=0) {
          res.send({ status: false, message:"No Data Pls check user id or else" });
          console.log(error);
          // throw error;
        }
        else {
          res.status(200).send("Successfully update user");
        };
      });
    
  })



//end user update



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
router.post('/addbooking', function (req, res) {
  try {
    console.log("Body",req.body);
    
    var command = sprintf('INSERT INTO booking (userid,firstname,lastname,email,phonenumber,address1,address2,city,state,country,pincode,checkin,checkout,adults,child,roomtype,roomid,noofdays,price,totalprice,bookedstatusid,verificationstatus,status) VALUES (%d,"%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%d,%d,"%s","%s",%b)', req.body.userid,  req.body.firstname, req.body.lastname, req.body.email, req.body.phonenumber, req.body.address1, req.body.address2,       req.body.city, req.body.state, req.body.country, req.body.pincode, req.body.checkin, req.body.checkout, req.body.adults, req.body.child,       req.body.roomtype,req.body.roomid,req.body.noofdays,req.body.price,req.body.totalprice,req.body.bookedstatusid,req.body.verificationstatus, 1);
    
    
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
    console.log("Catch",e);
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})
//end add booking

//st update booking
router.post('/updatebooking',authcheck, function (req, res) {
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
    var command = sprintf('INSERT INTO user (firstname,lastname,address1,address2,city,state,country,pincode,modifieddate,phonenumber,email,createddate,username,password,cpassword,status) VALUES ("%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%b)', req.body.firstname, req.body.lastname, req.body.address1, req.body.address2, req.body.city, req.body.state, req.body.country,req.body.pincode, dateTime, req.body.phonenumber, req.body.email, dateTime, req.body.username, hashedPassword, hashedCPassword, 1);
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

//get booking with user id


router.get('/getbookingwithuserid/:userid', authcheck, function (req, res) {
  try {
    // id=req.param.userid
    command = 'select * from booking WHERE userid='+ req.params.userid;
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


//end get booking with user id
//get user detail
router.get('/getuser',authcheck, function (req, res) {
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

router.get('/getfloor',authcheck, function (req, res) {
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



// module.exports = router;
