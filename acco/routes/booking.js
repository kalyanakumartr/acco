var express = require('express');
var router = express.Router();
const con = require('../dbconfig');
var authcheck = require('./authentication')
var sprintf = require('sprintf-js').sprintf;



//st search booking info

router.get('/searchbookinginfo',function(req,res){
console.log("Welcome to search");
cmd='select * from booking where bookedstatusid=1 ';

console.log(req.query.bookingid,req.query.email,req.query.phonenumber);
if(req.query.bookingid!=undefined){
  cmd=cmd+ ' and bookingid='+req.query.bookingid+' ';
}
if(req.query.email!=undefined){
  cmd=cmd+ (req.query.bookingid==undefined?' And ': ' OR ')+' email="'+req.query.email+'"';
}
if(req.query.phonenumber!=undefined){
  cmd=cmd+ (req.query.bookingid!=undefined?' OR ': req.query.email==undefined?' And ': ' OR ')+' phonenumber='+req.query.phonenumber+' ';
}
console.log(cmd);
con.query(cmd,function(err,result){
  if(err){
    console.log("Err");
    res.send("No Data");
  }
  else
  {
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
    rtid=req.query.roomtypeid;
    cin=req.query.checkin;
    cout=req.query.checkout;
    adultin=req.query.adults;
    
    cmd='CALL getroomlistsp (?,?,?,?)'
    console.log("cmd",cin,cout,rtid,adultin)
    // cmd='select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,(select COUNT(roomname) AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN "'+req.query.checkin+'" AND "'+req.query.checkout+'" OR checkout BETWEEN "'+req.query.checkin+'" AND "'+req.query.checkout+'"))AND roomname=name ) AS avilable from tariffdetail where roomtypeid='+rid+' AND (headcount='+req.query.adults+' OR headcount>=4)';
     con.query(cmd,[cin,cout,rtid,adultin] ,function (err, getroomtype) {

      console.log(cmd,"data", getroomtype);
      if (err) {
        console.log(err);
        res.send({ "Message": "Unable to get Date " });
      }
      else {
       re= await pool.query(getroomtype);
            res.send 
      
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





//st frontoff a checkin

router.post('/actualcheckin', authcheck, (req, res) => {
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



//cancelbooking


router.post('/bookingcancel', authcheck, function (req, res) {
  console.log("Welcome to cancel Room Book");
  var id = req.query.bookingid;
  var uid = req.query.userid;
  var command = 'UPDATE booking SET bookedstatusid=2 WHERE bookingid=' + id + '  and userid=' + uid + '';
  console.log(command);
  let data = [true, 1];
  con.query(command, data, function (error, result) {
    // console.log(result);
    if (result.affectedRows <= 0) {
      res.send({ status: false, message: "No Data Pls check booking id or else" });
      console.log(error);
      // throw error;
    }
    else {
      res.status(200).send("Successfully Booking Cancel");
    };
  });

})

//end cancel booking with userid





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


//add booking
router.post('/addbooking', function (req, res) {
  try {
    console.log("Body", req.body);

    var command = sprintf('INSERT INTO booking (userid,firstname,lastname,email,phonenumber,address1,address2,city,state,country,pincode,checkin,checkout,adults,child,roomtype,roomid,noofdays,price,totalprice,bookedstatusid,verificationstatus,status) VALUES (%d,"%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%d,%d,"%s","%s",%b)', req.body.userid, req.body.firstname, req.body.lastname, req.body.email, req.body.phonenumber, req.body.address1, req.body.address2, req.body.city, req.body.state, req.body.country, req.body.pincode, req.body.checkin, req.body.checkout, req.body.adults, req.body.child, req.body.roomtype, req.body.roomid, req.body.noofdays, req.body.price, req.body.totalprice, 1, req.body.verificationstatus, 1);


    console.log("after", command);
    if(req.body.lastname==undefined){
      command=command+(req.body.lastname==undefined?'Not Undefine': 'Null');
    }
    
    console.log(req.body.lastname);
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



//add booking with child age
router.post('/addbookingwithchild', function (req, res) {
  try {
    console.log("Body", req.body);

    var command = sprintf('INSERT INTO booking (userid,firstname,lastname,email,phonenumber,address1,address2,city,state,country,pincode,checkin,checkout,adults,child,childage,roomtype,roomid,noofdays,price,totalprice,bookedstatusid,verificationstatus,status) VALUES   (%d,"%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%d,%d,"%s","%s",%b)', req.body.userid, req.body.firstname, req.body.lastname, req.body.email, req.body.phonenumber, req.body.address1, req.body.address2, req.body.city, req.body.state, req.body.country, req.body.pincode, req.body.checkin, req.body.checkout, req.body.adults, req.body.child, req.body.childage, req.body.roomtype, req.body.roomid, req.body.noofdays, req.body.price, req.body.totalprice, req.body.bookedstatusid, req.body.verificationstatus, 1);

    console.log("after", command);
    // console.log("child",result[0].child);
    con.query(command, function (err, result) {

      // if(req.body.child<2)
      // {
      // var getbookfield='select bookingid,userid'
      // var com = sprintf('INSERT INTO childdetail (bookingid,userid,childname,childage,status) VALUES   (%d,%d,"%s",%d,%b)',req.body.bookingid, req.body.userid,  req.body.childname, req.body.childage,1);
      // console.log(com);

      // console.log("child",result);
      console.log(err);
      if (err) {
        console.log("Error", err);
        res.send({ status: false, message: err });
      }
      else {
        res.status(200).send({ "message": "Booking added Successfully" });
        res.end();
      }
      // }
    })
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




// st get booking with user id

router.get('/getbookingwithuserid', authcheck, function (req, res) {
  try {
    // id=req.param.userid
    command = 'select * from booking WHERE userid=' + req.query.userid;
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
