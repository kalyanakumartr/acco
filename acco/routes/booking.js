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


//st new logic

router.get('/getlogic', function (req, res) {
  // var cmd = 'select * from logic where adult=' + req.query.adult + '';
  // console.log("cmd", cmd);
  // con.query(cmd, function (err, result) {
  //   if (result.length >= 1) {
  //     if (err) {
  //       console.log("Error");
  //       res.send("No Data");
  //     }
  //     else {
  //       console.log(result);

  //       res.send(result);
  //     }
  //   }

  //   else {
  //     console.log("Error pls check adult");
  //     res.send("Pls check Adult no");
  //   }
  // })
  try {
      var cmd = 'select * from logic where adult=' + req.query.adult +  ' ' ;

    // var cmd = 'select * from booking where bookingid=' + req.query.bookingid + '';
    console.log(cmd);
    cin=req.query.cin;
    cout=req.query.cout;
    con.query(cmd, function (getbooerr, getboores) {
      console.log("Data Length", getboores.length);
      if (getboores.length >= 1) {

    adultcount=getboores[0].adult;
    console.log("adul",adultcount);
       command = 'CALL spandroomlist (?,?,?)';
        console.log("command", cin, cout,adultcount)
        con.query(command, [cin, cout,adultcount], function (err, result) {
          if (err) {
            console.log("err",err);
            res.send("err");
          }
          else {
            console.log(result);
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

//end new logic

//st checkinconfirm 

router.post('/checkinconfirm', function (req, res) {
  console.log("Body", req.body);
  console.log("Welcome to checkinconfirm");
  ain = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
  console.log(ain);
  // 'UPDATE booking SET bookedstatusid=2 WHERE bookingid=' + id + '  and userid=' + uid + '';
  var cmd = 'UPDATE booking SET roomid="' + req.body.roomid + '",acheckin="' + ain + '" where bookingid= ' + req.body.bookingid + '';
  console.log(cmd);
  let data = [true, 1];
  con.query(cmd, data, function (error, result) {
    console.log("aff", result.affectedRows);
    if (result.affectedRows >= 1) {

      res.status(200).send({message:"Successfully Confirm Booking"});
    
      //else
    }
    else {
      res.send({ status: false, message: "No Data Pls check booking id or else" });
      console.log(error);
    }
  });

})



//end checkinconfirm 

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
            result[0][0].roomid=result[0][0].roomid.replaceAll("\"", "");
            result[0][0].roomnos=result[0][0].roomnos.replaceAll("\"", "");
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
      res.send({ message: "save" })
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
      const bl = Buffer.from(imagefile, 'binary');

      res.send({ "FileName1": result[0].imageUrl, "file": bl });

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

  //       console.log(getres);
  // //will inclde or get 3bhcount
  //         if(getres[0].bhk2count>=1 & getres[0].bhk2count<=9 )
  //           {
  //             //will include time for cin and cout
  //             cin=moment(getres[0].checkin).format('YYYY-MM-DD');
  //             // cout=moment(getres[0].checkout).format('YYYY-MM-DD HH:mm:ss');

  //             cout=moment(getres[0].checkout).format('YYYY-MM-DD');
  //             console.log(cin);
  //             console.log(cout);
  //             console.log(getres[0].bhk2count);
  //             var getcmd='select COUNT(roomname) AS roomcount,rtype ,price,roomname ,json_array(GROUP_CONCAT(roomno)) AS roomno,GROUP_CONCAT(roomid) AS roomids from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '+cin+' AND '+cout+' OR checkout BETWEEN '+cin+' AND '+cout+')) GROUP BY rtype,price,roomname'
  //             console.log("getcmd",getcmd);       
  //             con.query(getcmd,function(err,gresu){
  //               //not in booking tblla  get room id
  //               // console.log("room id",getres[0].roomid);

  //               //tamil spreTE API
  //               //  1-101 CHECK KEY VALUE
  //               // ID CARD UPLOAD AONTOER API 
  //               // var command = sprintf('update booking set acheckin=' + "'" + req.query.acheckin + "'," + ' bhk2count='+getres[0].bhk2count+', bhk3count='+getres[0].bhk3count+' WHERE bookingid=' + req.query.bookingid +'');
  //               var command = sprintf('update booking set acheckin=' + "'" + req.query.acheckin + "'," + ' bhk2count='+getres[0].bhk2count+', bhk3count='+getres[0].bhk3count+' WHERE bookingid=' + req.query.bookingid +'');
  //   console.log("part 3",command);          

  //     let data = [true, 1];
  //     console.log("after", command);
  //     con.query(command, data, function (error, updateresult) {
  //       // console.log("affectedRows", updateresult.affectedRows);
  //         if (error) {
  // res.send("Check Mail Id");
  //         console.log("Check Mail Id");
  //         }
  //       else {
  //             console.log("3 part result",gresu);
  //             res.status(200).send({"First Part ":getres,"Roomlist":gresu,updateresult});
  //           }
  //           })
  //         })
  //         //   

  //   }
  //   else
  //   {
  //     console.log("Something wrong");
  //   }
  // }
  // else{
  //   console.log("aff row",getres.affectedRows);
  //   res.send("Check Booking Id");
  // }
  //   })}
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
  // var id = req.query.bookingid;
  // var uid = req.query.userid;
  var command = 'UPDATE booking SET bookedstatusid=2 WHERE bookingid=' + req.body.bookingid + '  and userid=' + req.body.userid + '';
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
      res.status(200).send({message:"Successfully Booking Cancel"});
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



//add booking with child age
router.post('/addbookingwithchild', function (req, res) {
  try {
    // console.log("Body", req.body);

    var command = sprintf('INSERT INTO booking (userid,modeoftypeid,bhk1count,bhk2count,bhk3count,firstname,lastname,email,phonenumber,address1,address2,city,state,country,pincode,checkin,checkout,adults,child,childage,roomtype,bed,noofdays,price,totalprice,bookedstatusid,verificationstatus,status) VALUES   (%d,%d,%d,%d,%d,"%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%d,%d,"%s","%s",%b)', req.body.userid, 1,req.body.bhk1count, req.body.bhk2count, req.body.bhk3count, req.body.firstname, req.body.lastname, req.body.email, req.body.phonenumber, req.body.address1, req.body.address2, req.body.city, req.body.state, req.body.country, req.body.pincode, req.body.checkin, req.body.checkout, req.body.adults, req.body.child, req.body.childage, req.body.roomtype, req.body.bed, req.body.noofdays, req.body.price, req.body.totalprice, 1, req.body.verificationstatus, 1);

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




// st get booking with user id

router.get('/getbookingwithuserid', authcheck, function (req, res) {
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




//add booking alter api with child
router.post('/addbooking', function (req, res) {
  try {
    console.log("Body", req.body);

    var command = sprintf('INSERT INTO booking (userid,modeoftypeid,firstname,lastname,email,phonenumber,address1,address2,city,state,country,pincode,checkin,checkout,adults,child,childage,roomtype,roomid,noofdays,price,totalprice,bookedstatusid,verificationstatus,status) VALUES (%d,%d,"%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%d,%d,"%s","%s",%b)', req.body.userid, 1, req.body.firstname, req.body.lastname, req.body.email, req.body.phonenumber, req.body.address1, req.body.address2, req.body.city, req.body.state, req.body.country, req.body.pincode, req.body.checkin, req.body.checkout, req.body.adults, req.body.child, req.body.childage, req.body.roomtype, req.body.roomid, req.body.noofdays, req.body.price, req.body.totalprice, 1, req.body.verificationstatus, 1);


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
