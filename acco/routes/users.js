var express = require('express');
var router = express.Router();
var sprintf = require('sprintf-js').sprintf;
const bcrypt = require('bcryptjs');
const nodemailer = require("nodemailer");
const jsonwebtoken = require('jsonwebtoken');
const con = require('../dbconfig');
const room=require('./room');
var email=require('./email');
const logic=require('./logic');

const Country = require('country-state-city').Country;
const State = require('country-state-city').State;
const multer = require('multer');
const path = require('path');
var fs = require('fs');
// const otpgen=require('otp-generator');
const { error, Console } = require('console');
const moment = require('moment');
const otpGenerator = require('otp-generator');
const color = require('colors');
const PDFDocument = require('pdfkit');


var authcheck = require('./authentication')

// router.post('/generateinvoice', authcheck, (req, res) => {



//st forgot password
router.post('/forgotpassword',async function (req, res)  {
  var email = req.body.email;
  // var password = req.body.password;
  let hashedPassword = await bcrypt.hash(req.body.password, 8);
  let hashedCPassword = await bcrypt.hash(req.body.cpassword, 8);
  var command = 'UPDATE user SET password="' + hashedPassword + '",cpassword="'+hashedCPassword+'" WHERE email = "' + email + '"';
  console.log("command"+command)
  let data = [true, 1];
  con.query(command, data, function (error, result) {
    if (result.affectedRows >= 1) {
      console.log("Done");
      res.status(200).send({ message: "Successfully Changed Password" });

    }
    else {
      res.status(400).send({ status: false, message: "Pls check Email Id" });
      console.log("Pls check Email Id");

    }
  });

});


//end change password








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

router.get('/getguestbookingstatuscancel', function (req, res) {
  try {
    // sdate=req.params.checkin
    console.log("query", req.query.checkin);

    checkin = req.query.checkin
    // command =( "select * from booking where checkin BETWEEN "+"'"+req.params.checkin+ ' 00:00:01'+ " '"+' AND ' +"'"+req.params.checkin+' 23:59:59'+"'");
    // console.log(command);
    // const sql="CALL getguestdetailwithcolor('"+ checkin +"')";
    const sql = "CALL getguestbookingcancel('" + checkin + "')";
    console.log(sql);
    // const guestres = con.query(sql);
    con.query(sql, function (err, result) {
      if (err) {
        res.send("No Data");
      }
      else {
        console.log()
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






//st get guest detail

router.get('/getguestdetail', authcheck, function (req, res) {
  try {
    // sdate=req.params.checkin
    console.log("query", req.query.checkin);

    checkin = req.query.checkin
    // command =( "select * from booking where checkin BETWEEN "+"'"+req.params.checkin+ ' 00:00:01'+ " '"+' AND ' +"'"+req.params.checkin+' 23:59:59'+"'");
    // console.log(command);
    // const sql="CALL getguestdetailwithcolor('"+ checkin +"')";
    const sql = "CALL getguestdetailwithcolor('" + checkin + "')";
    console.log(sql);
    // const guestres = con.query(sql);
    con.query(sql, function (err, result) {
      if (err) {
        res.send("No Data");
      }
      else {
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






//get food item
router.get('/getfooditem', function (req, res) {
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

  let result = await con.query("update user set idproof='" + req.file.filename + "' WHERE idproof=" + req.body.idproof, function (err, rows) {
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

//st user update

router.post('/updateuser', authcheck, function (req, res) {
  console.log("Welcome to update user ");
  var id = req.body.userid;
  var firstname = req.body.firstname;
  var lastname = req.body.lastname
  var address1 = req.body.address1
  var address2 = req.body.address2
  var city = req.body.city
  var state = req.body.state
  var country = req.body.country
  var phonenumber = req.body.phonenumber
  var email = req.body.email


  var command = 'UPDATE user SET firstname="' + firstname + '", lastname="' + lastname + '", address1="' + address1 + '",address2="' + address2 + '", city="' + city + ' ",state="' + state + '", country="' + country + '", phonenumber="' + phonenumber + '", email="' + email + '" WHERE userid=' + id + '';
  console.log(command);
  let data = [true, 1];
  con.query(command, data, function (error, result) {
    // console.log(result.affectedRows);
    if (result.affectedRows <= 0) {
      res.send({ status: false, message: "No Email Pls check Email" });
      console.log(error);
      // throw error;
    }
    else {
      res.status(200).send({message:"Successfully update user"});
    };
  });

})



//end user update



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
    // console.log("body", req.body);
  
    con.query("select count(email) count from user where email=?", [req.body.email], async (error, result) => {
      console.log("Error", error, result[0].count);
      if (result[0].count > 0) {
        res.send({ status: true, message: "Already email id exist give correct email id " })
        console.log("Already email id exist give correct email id")
        return;
      }
      else {
  
    let hashedPassword = await bcrypt.hash(req.body.password, 8);
    let hashedCPassword = await bcrypt.hash(req.body.cpassword, 8);
    console.log(hashedPassword);
     var date_ob = new Date();
    var day = ("0" + date_ob.getDate()).slice(-2);
    var month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
    var year = date_ob.getFullYear();
    var hours = date_ob.getHours();
    var minutes = date_ob.getMinutes();
    var seconds = date_ob.getSeconds();
    var dateTime = year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
    console.log(dateTime);
    console.log(hashedPassword);
    var command = sprintf('INSERT INTO user (firstname,lastname,address1,address2,city,state,country,pincode,modifieddate,phonenumber,email,createddate,username,password,cpassword,status) VALUES ("%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%b)', req.body.firstname, req.body.lastname, req.body.address1, req.body.address2, req.body.city, req.body.state, req.body.country, req.body.pincode, dateTime, req.body.phonenumber, req.body.email, dateTime, req.body.username, hashedPassword, hashedCPassword, 1);
    console.log(command);
    con.query(command, function (err, mysqlres1) {
      if (err) throw err;
      console.log("Error", err);
      userid = mysqlres1.insertId
      console.log(userid);
      var command = sprintf('INSERT INTO userrolemap (userid ,roleid,status) VALUES (%d,%d,%b)', userid, req.body.roleid, 1);
      var commd='up'
      con.query(command, function (err, mysqlres2) {
        console.log("role", command);
        // console.log("proof",command1);
        if (err) {
          res.status(401).send({ "message": err });
        }
        else {
          if (req.body.roleid = 3)
            var cmmd=sprintf('insert into otpstore (userid,name,otptype,status) values (%d,"%s","%s",%d)',userid,req.body.firstname,"email",1);
          console.log(cmmd);
            con.query(cmmd,function(oerr,ores){
              if(oerr) {
                res.status(401).send({ "message": err });
              }
              else {
                  res.status(200).send({ message: "Successfully Register" });
          res.end();
              }
        })
      }
      
    })
  })
}}
)
}

  catch (e) {
    console.log("Catch", e.err);
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})



//get user detail
// router.get('/getuser', authcheck, function (req, res) {
//   try {
//     command = 'select * from user';
//     con.query(command, function (error, results) {
//       if (error) {
//         res.send("Unable to get Date ")
//       }
//       else {
//         res.send(results);
//       }
//     })
//   }
//   catch (e) {
//     console.log("Catch");
//     const statusCode = e.statusCoderes || 500;
//     res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
//   }

// })


//get user with user id

router.get('/getuserwithuserid', authcheck, function (req, res) {
  try {
    // id=req.param.userid
    command = 'select * from user WHERE userid=' + req.query.userid;
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



//end get user id
//get user detail
router.get('/getuser', authcheck, function (req, res) {
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



//end get user id




//add contactus

router.post('/addcontact', async function (req, res) {
  try {
    console.log("body", req.body);
      var command = sprintf('INSERT INTO contactus (name,email,phonenumber,city,message,status) VALUES ("%s","%s","%s","%s","%s",%b)', req.body.name, req.body.email, req.body.phonenumber, req.body.city, req.body.message,  1);
    console.log(command);
    con.query(command, function (err, mysqlres1) {
        if (err) {
          res.status(401).send({ "message": err });
        }
        else {
            res.status(200).send({ message: "Successfully Add" });
          res.end();
        }
      })
    
  }

  catch (e) {
    console.log("Catch", e.err);
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})

//end add contact

//st get contat
router.get('/getcontact', authcheck, function (req, res) {
  try {

    command = 'select * from contactus';
    con.query(command, function (error, results) {
      if (error) {
        res.send("Unable to get Date ")
      }
      else {
        res.send({"message":results});
      }
    })
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }

})

//end contact
module.exports = router;



// module.exports = router;
