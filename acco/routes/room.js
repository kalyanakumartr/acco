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



//st get roomlist

router.get('/getroomslist', function (req, res) {
    try {
      var cmd = 'select * from booking where bookingid=' + req.query.bookingid + '';
      console.log(cmd);
      con.query(cmd, function (getbooerr, getboores) {
        console.log("Data Length", getboores.length);
        if (getboores.length >= 1) {
          if (getboores[0].bhk2count >= 1 & getboores[0].bhk2count <= 9 || getboores[0].bhk3count >= 1 & getboores[0].bhk3count <= 9)
            console.log("bhk2count");
          // var command = "select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid)) AS roomid,CONCAT(GROUP_CONCAT(roomno)) AS roomnos  from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "' OR checkout BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "')) GROUP BY rtype,price,roomname";
          command = 'CALL spgetroom (?,?)';
          
          cin = req.query.checkin;
          cout = req.query.checkout;
          console.log("command", cin, cout)
          // cmd='select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,(select COUNT(roomname) AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN "'+req.query.checkin+'" AND "'+req.query.checkout+'" OR checkout BETWEEN "'+req.query.checkin+'" AND "'+req.query.checkout+'"))AND roomname=name ) AS avilable from tariffdetail where roomtypeid='+rid+' AND (headcount='+req.query.adults+' OR headcount>=4)';
          // con.query(cmd, [cin, cout, rtid, adultin], function (err, getroomtype) {
  
          console.log(command);
          con.query(command, [cin, cout], function (err, result) {
            if (err) {
              res.send("err");
            }
            else {
// <<<<<<< HEAD
              var i=0;
              for(var obj in result[0]){
                console.log("obj",result[0][obj]);
                // console.log("obj1",obj[i]);
                result[0][obj].roomid=result[0][obj].roomid.replaceAll("\"", "");
                result[0][obj].roomnos=result[0][obj].roomnos.replaceAll("\"", ""); 
              //  i++;
              };

              // result[0][0].roomid=result[0][0].roomid.replaceAll("\"", "");
              // result[0][0].roomnos=result[0][0].roomnos.replaceAll("\"", ""); 
              // result[0][1].roomid=result[0][1].roomid.replaceAll("\"", "");
              // result[0][1].roomnos=result[0][1].roomnos.replaceAll("\"", "");
              // console.log("0",result[0][0]);
              // console.log("1",result[0][1]);
// =======
//               result[0][0].roomid=result[0][0].roomid.replaceAll("\"", "");
//               result[0][0].roomnos=result[0][0].roomnos.replaceAll("\"", ""); 
//               result[0][1].roomid=result[0][1].roomid.replaceAll("\"", "");
//               result[0][1].roomnos=result[0][1].roomnos.replaceAll("\"", "");
//               console.log("0",result[0][0]);
//               console.log("1",result[0][1]);
// >>>>>>> a741d372e578d78e70ebf0776ee96a14633a72e5
              console.log("-",result,"getres");
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
  
  //end get room list
  
  //st room type get

router.get('/roomtype', function (req, res) {
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
  
  
  //st new get room list
  router.get('/getroomlist', function (req, res) {
    console.log("Welcome to getroomlist");
    try {
      rtid = req.query.roomtypeid;
      cin = req.query.checkin;
      cout = req.query.checkout;
      adultin = req.query.adults;
  
      cmd = 'CALL getroomlistsp (?,?,?,?)';
      console.log("cmd", cin, cout, rtid, adultin)
      // cmd='select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,(select COUNT(roomname) AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN "'+req.query.checkin+'" AND "'+req.query.checkout+'" OR checkout BETWEEN "'+req.query.checkin+'" AND "'+req.query.checkout+'"))AND roomname=name ) AS avilable from tariffdetail where roomtypeid='+rid+' AND (headcount='+req.query.adults+' OR headcount>=4)';
      con.query(cmd, [cin, cout, rtid, adultin], function (err, getroomtype) {
  
        console.log(cmd, "data", getroomtype);
        if (err) {
          console.log(err);
          res.send({ "Message": "Unable to get Date " });
        }
        else {
          res.send(getroomtype);
  
        }
      })
    }
    catch (err) {
      console.log("Catch");
      const statusCode = e.statusCoderes || 500;
      res.status(statusCode, "Error").json({ success: 0, message: err.message, status: statusCode });
    }
  })
  
  
  
  
  //to get roomnumber and bhk when floornumber given
  router.get('/getroom', authcheck, function (req, res) {
    console.log("getroom")
    var getroom = "SELECT * FROM room"
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
  

//to get roomnumber and bhk when floornumber given
router.get('/getfloorroommapping', authcheck, function (req, res) {
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
    
  
  //room booked
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
  
  

  //end canceledbooking with user id
//anupama code 
//get floor
router.get('/getfloor', authcheck, function (req, res) {
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
  
  
  
  
  //st get room list
  router.get('/oldgetroomlist', authcheck, function (req, res) {
  
    var cmmd = sprintf("select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT('[',GROUP_CONCAT('{', '\"roomid\":',roomno,',\"price\":',price,',\"CHECKED\":false' '}'),']') AS roomnos  from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "' OR checkout BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "')) GROUP BY rtype,price,roomname");
    con.query(cmmd, function (err, result) {
      console.log("cmd", cmmd);
      if (err) {
        console.log(err);
        res.send(err);
  
      }
      else {
        console.log(result.length);
        for (let a = 0; a < result.length; a++) {
          result[a].roomnos = JSON.parse(result[a].roomnos);
        }
        res.send(result);
      }
    })
    // res.send(result);
  });
  //end get room list
  
  
  

module.exports = router;




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
