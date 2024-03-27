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
const { captureRejectionSymbol } = require('events');



//st cancelpolicy

router.get('/cancelpolicy', (req, res) => {
  try {
    console.log("Welcome to Cancel Policy");
    cmd = 'select * from cancelpolicy';
    con.query(cmd, (error, result) => {
      console.log(cmd);
      if (error) {
        console.log("No Data in Cancel Policy");
        res.send("No Data in Cancel Policy");
      }
      else {
        console.log("Successfully Get Cancel Policy");
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
//end cancelpolicy

// st ge image


router.get('/getimage', function (req, res) {
  var getresisterQ = "SELECT imageUrl FROM booking WHERE bookingid=" + req.query.bookingid;
  con.query(getresisterQ, function (error, result) {
    console.log("len", result.length);
    // if (result.length<=1){
    if (error) {
      console.log(error);
      res.send("Unable to get data");
    }
    else {

      console.log("userimage", result);
      const imagefile = fs.readFileSync('C:/images/' + result[0].imageUrl);
      const bl = Buffer.from(imagefile, 'binary');
      res.send({ "FileName1": result[0].imageUrl, "file": bl });

    }
    // }

  });
});

//end get image




//st firm 

router.post('/checkinconfirm', function (req, res) {
  console.log("Body", req.body);
  console.log("Welcome to checkinconfirm");
  ain = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
  console.log(ain);
  // cmd='UPDATE booking SET bookedstatusid=2 ,roomid='+req.body.roomid+' WHERE bookingid=' + id + '  and userid=' + uid + '';
  // var cmd = 'UPDATE booking SET roomid="select json_array(GROUP_CONCAT("{",roomid ,":",roomno,"}")) AS roomids from room where roomid IN' +( req.body.roomid)+',acheckin="' + ain + '",bookedstatusid=3 where bookingid= ' + req.body.bookingid + '';
  cmd='UPDATE booking SET bookedstatusid=3 ,roomid="'+req.body.roomid+'", roomnos="'+req.body.roomnos+'", acheckin="'+ain+'" WHERE bookingid=' + req.body.bookingid+'' ;

  console.log(cmd);
  let data = [true, 1];
  con.query(cmd, data, function (error, result) {
    console.log("aff", result.affectedRows);
    if (result.affectedRows >= 1) {

      res.status(200).send({ message: "Successfully Confirm Booking" });

      //else
    }
    else {
      res.send({ status: false, message: "No Data Pls check booking id or else" });
      console.log(error);
    }
  });

})
//end checkinconfirm 


// addimagetodatabase table for userimage
//storage

const storage = multer.diskStorage({
  destination: 'C:/images/',

  filename: (req1, file, cb) => {
    // console.log("Request name ",req1.params.id);
    return cb(null, `${file.fieldname}_${Date.now()}${path.extname(file.originalname)}`)
    // return cb(null,`${file.fieldname}_`+req1.params.id+`${path.extname(file.originalname)}`)
  }
})

const createimage = async (req, res, next) => {

  var data = {

    imageUrl: req.file.filename,

    // userImage:userImg.filename,
    // status:1
  }
  // console.log("Filename",req.file.filename);
  let result = await con.query("update booking set imageUrl='" + req.file.filename + "' WHERE bookingid=" + req.body.bookingid, function (err, rows) {
    if (err) {
      console.log(err);
      res.send({
        message: "errpr", err
      })
    }
    else {
      res.send({ message: "Image Successfully Save in Local" })
    }
  })
}
// const { nextTick } = require('process');
const upload = multer({
  storage: storage
})
router.post('/idbookingproof', upload.single('images'), createimage)

//**** End  */

// //st getid proof

router.get('/getidproofimage', function (req, res) {
  var getresisterQ = "SELECT imageUrl FROM booking WHERE bookingid=" + req.query.bookingid;
  con.query(getresisterQ, function (error, result) {
    if (error) {
      console.log(error);
      res.send("Unable to get data");
    }
    else {
      console.log("userimage", result);
      const imagefile = fs.readFileSync('C:/images/' + result[0].imageUrl);
      const bl = Buffer.from(imagefile, 'base64');

      res.send(bl);
      // res.send({ "FileName1": result[0].imageUrl, "file": bl });

    }
  });
});
//****End  */
// //end getid proof


//st search booking info

router.get('/searchbookinginfo', function (req, res) {
  console.log("Welcome to search");
  cmd = 'select * from booking where bookedstatusid=1 ';

  console.log(req.query.bookingid, req.query.email, req.query.phonenumber);
  if (req.query.bookingid != undefined) {
    cmd = cmd + ' and bookingid=' + req.query.bookingid + ' ';
  }
  if (req.query.email != undefined) {
    cmd = cmd + (req.query.bookingid == undefined ? ' And ' : ' OR ') + ' email="' + req.query.email + '"';
  }
  if (req.query.phonenumber != undefined) {
    cmd = cmd + (req.query.bookingid != undefined ? ' OR ' : req.query.email == undefined ? ' And ' : ' OR ') + ' phonenumber=' + req.query.phonenumber + ' ';
  }
  console.log(cmd);
  con.query(cmd, function (err, result) {
    if (err) {
      console.log("Err");
      res.send("No Data");
    }
    else {
      console.log(result);
      res.send(result);
    }
  })
});


//end search booking info




//st tariff

router.get('/gettariff', function (req, res) {
  console.log("Welcome to Tariff");
  try {
    command = 'SELECT * FROM tariffdetail';
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

// }) 


//end tariff



//st frontoff a checkin

router.post('/actualcheckin', function (req, res) {
  try {
    // will give email and phone no 
    var command = 'select * from booking where bookingid=' + req.query.bookingid + '';
    con.query(command, function (geterr, getres) {
      if (geterr.affectedRows >= 1) {
        console.log(getres.affectedRows)
        res.send({ "Result": getres });

      }
      else {

        console.log("Error", geterr);
        res.send("Err");
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





//cancelbooking


router.post('/bookingcancel', authcheck, function (req, res) {
  try {
    console.log("Welcome to cancel Room Book");
    // var id = req.query.bookingid;
    // var uid = req.query.userid;
    var command = 'UPDATE booking SET bookedstatusid=2, commands="' + req.body.commands + '" WHERE bookingid=' + req.body.bookingid + '  and userid=' + req.body.userid + '';
    console.log(command);
    let data = [true, 1];
    con.query(command, data, function (error, result) {
           console.log("affectedRows", result.affectedRows);
      if (result.affectedRows <= 0) {
        res.send({ status: false, message: "Pls check booking id Or User Id" });
      }
      else {
        comm = ('select roomid from booking where bookingid=' + req.body.bookingid + '');
        con.query(comm, (geterr, getres) => {
          console.log(comm);
          console.log("select len", getres.length);
          if (getres.length >= 1) {
            console.log("room", getres[0].roomid);
            console.log("aff", getres.length);
            cmdd = 'call updateroomsstatus(?,?)';
            console.log(cmdd);
            con.query(cmdd, [req.body.bookingid, req.body.statusid], function (err, result) {
              if (err) {
                res.send("Some Error in get fields pls check");
              } else {
                console.log("Your Booking Canceled successfully! ")
                res.status(200).send({ message: "Your Booking Canceled successfully!" });
              }
              // res.status(200).send({ message: "Successfully Booking Cancel" });
            });

          }
          else {
            res.send("No Data");
          }
        });
      }
    })
  }
  catch (e) {
    console.log("Catch", e);
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
});

//end cancel booking with userid
//add booking with child age
router.post('/addbookingwithchild', function (req, res) {
  try {
    // console.log("Body", req.body);
    img = "image.jpg";
    var command = sprintf('INSERT INTO booking (userid,modeoftypeid,bhk1count,bhk2count,bhk3count,firstname,lastname,email,phonenumber,address1,address2,city,state,country,pincode,checkin,checkout,adults,child,childage,roomtype,bed,noofdays,price,totalprice,bookedstatusid,verificationstatus,imageUrl,status) VALUES   (%d,%d,%d,%d,%d,"%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%d,%d,"%s","%s","%s",%b)', req.body.userid, req.body.modeoftypeid, req.body.bhk1count, req.body.bhk2count, req.body.bhk3count, req.body.firstname, req.body.lastname, req.body.email, req.body.phonenumber, req.body.address1, req.body.address2, req.body.city, req.body.state, req.body.country, req.body.pincode, req.body.checkin, req.body.checkout, req.body.adults, req.body.child, req.body.childage, req.body.roomtype, req.body.bed, req.body.noofdays, req.body.price, req.body.totalprice,1, req.body.verificationstatus, img, 1);

    console.log("after", command);

    con.query(command, function (err, result) {

      console.log(result, 'Last insert ID in User:', result.insertId);
      // var getres='select * from booking where userid='+req.body.userid;
      // con.query(getres,function(geterr,gerresult){
      // console.log("bid",result);
      // console.log("bid1",gerresult);

      console.log("Error", err);
      if (err) {
        console.log("Error", err);
        res.send({ status: false, message: err });
      }
      else {
        // console.log("Bookingid",gerresult[0].bookingid);
        res.status(200).send({ "message": "Booking added Successfully", "BookingId ": result.insertId });

        // res.status(200).send({ "message": "Booking added Successfully",Bookingid:gerresult[0].bookingid,phonenumber:gerresult[0].phonenumber});
      }
    })
    // })
  }
  catch (e) {
    console.log("Catch", e);
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})
//end add booking


//st update booking
router.post('/updatebooking', authcheck, function (req, res) {
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

//end 

// st get booking with user id only

router.get('/getbookingwithuseridonly', authcheck, function (req, res) {
  try {
    // id=req.param.userid
    command = 'select * from booking WHERE userid=' + req.query.userid + ' ORDER BY checkin';
    console.log(command);
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

//end get booking with user id only



// st get booking with user id

router.get('/getbookingwithuserid', authcheck, function (req, res) {
  try {
    // id=req.param.userid
    command = 'select * from booking WHERE userid=' + req.query.userid + ' and bookedstatusid=1 ORDER BY checkin';
    console.log(command);
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

// st get canceledbooking with user id

router.get('/getcanceledbooking', authcheck, function (req, res) {
  try {
    // id=req.param.userid
    command = 'select * from booking WHERE userid=' + req.query.userid + ' and bookedstatusid=2 ORDER BY checkin';
    console.log(command);
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



//add booking alter api with child
router.post('/addbooking', function (req, res) {
  try {
    console.log("Body", req.body);

    var command = sprintf('INSERT INTO booking (userid,modeoftypeid,firstname,lastname,email,phonenumber,address1,address2,city,state,country,pincode,checkin,checkout,adults,child,childage,roomtype,roomid,noofdays,price,totalprice,bookedstatusid,verificationstatus,status) VALUES (%d,%d,"%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%d,%d,"%s","%s",%b)', req.body.userid, req.body.modeoftypeid, req.body.firstname, req.body.lastname, req.body.email, req.body.phonenumber, req.body.address1, req.body.address2, req.body.city, req.body.state, req.body.country, req.body.pincode, req.body.checkin, req.body.checkout, req.body.adults, req.body.child, req.body.childage, req.body.roomtype, req.body.roomid, req.body.noofdays, req.body.price, req.body.totalprice, 1, req.body.verificationstatus, 1);


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
    console.log("Catch", e);
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})
//end add booking

//st add maintenance

router.post('/addmaintenance', (req, res) => {
  try {
    console.log("welcome to add maintenance");
    console.log("Body", req.body);

    var command = sprintf('INSERT INTO maintenance (roomid,maintenancetypeid,fromdate,todate,reason,status) VALUES (%d,%d,"%s","%s","%s",%d)', req.body.roomid, req.body.maintenancetypeid, req.body.fromdate, req.body.todate, req.body.reason, 1);
    console.log("after", command);
    con.query(command, function (err, result) {
      if (err) {
        console.log(err);
        res.send({ status: false, message: err });
      }
      else {
        console.log(result);
        res.status(200).send({ "message": "maintenance Added Successfully" });
        res.end();
      }
    })

    // res.end();
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})

//end add maintenance
router.get('/getmaintenance', function (req, res) {
  try {
    command = 'select * from maintenance ';
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


//st get maintenance



//end get maintenance
//st room avilable

router.post('/roomavilable', (req, res) => {
  try {
    console.log("Welcome to Room Avilable");
    var command = sprintf('update booking set bookedstatusid=' + 5 + ' where bookingid=' + req.body.bookingid + '');
    let data = [true, 1];
    console.log("after", command);
    con.query(command, data, function (error, result) {
      console.log("affectedRows", result.affectedRows);
      if (result.affectedRows <= 0) {
        res.send("Check Booking  Id");
        console.log("Check Booking Id");
      } else {


        cmdd = 'call updateroomsstatus(?,?)';
        console.log(cmdd);
        con.query(cmdd, [req.body.bookingid, req.body.statusid], function (err, result) {
          if (err) {
            res.send("No Data");
          } else {
            console.log("Done")
            res.status(200).send({ message: "Successfully Actual checkout Update and Room Staus changed " });
            // res.send(result);
          }
        });
      }
    });
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
  }
})


//end room avilable

// st checkout and status chage housekeep
router.post('/actualcheckout', (req, res) => {
  console.log("Welcome to A Check Out");
  command = sprintf('update booking set acheckout=' + '"' + req.body.acheckout + '"' + ' ,bookedstatusid=' + 4 + ' WHERE bookingid=' + req.body.bookingid + '');
  let data = [true, 1];
  console.log("after", command);
  con.query(command, data, function (error, result) {
    console.log("affectedRows", result.affectedRows);
    if (result.affectedRows <= 0) {
      res.send("Check Booking Id");
      console.log("Check Booking Id");
    } else {
      cmdd = 'call updateroomsstatus(?,?)';
      console.log(cmdd);
      con.query(cmdd, [req.body.bookingid, req.body.statusid], function (err, result) {
        if (err) {
          res.send("No Data");
        } else {
          console.log()
          res.status(200).send({ message: "Successfully Actual checkout Update and Room Staus changed " });
        }
      });
    }
  })
})


// end  checkout and status chage housekeep

//st frontoff a checkin

router.post('/oldactualcheckin', authcheck, (req, res) => {
  try {
    var command = sprintf('update booking set acheckin=' + "'" + req.body.acheckin + "'" + ' WHERE email=' + '"' + req.body.email + '"');

    let data = [true, 1];
    console.log("after", command);
    con.query(command, data, function (error, result) {
      console.log("affectedRows", result.affectedRows);
      if (result.affectedRows <= 0) {

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
module.exports = router;


