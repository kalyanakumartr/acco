var express = require('express');
var router = express.Router();
var sprintf = require('sprintf-js').sprintf;
const bcrypt = require('bcryptjs');
const jsonwebtoken = require('jsonwebtoken');
const con = require('../dbconfig');
const Country = require('country-state-city').Country;
const State = require('country-state-city').State;
const multer = require('multer');
const path = require('path');




//auth login
const authcheck =(req,res,next)=>{
  headers = {

    'Content-Type': 'application/json',
    "Access-Control-Allow-Origin":' <origin>',
    "Access-Control-Allow-Credentials": true
  };
  // console.log(headers);
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(" ")[1];
  // console.log(token);
  if (!token) return res.sendStatus(401);
  jsonwebtoken.verify(token, process.env.ACCESS_TOKEN, (err, obj) => {
    
    if (err) {
      console.log("error",err);
      return res.sendStatus(403);
    }
    req.userName = obj.username;
    req.password = obj.password;
    next();

  })
}


//placetovisit


router.get('/getplacetovisit',function(req,res){
  try{
    command='select * from placetovisit';
        con.query(command,function(error,results){
      if(error){
        res.send({"Message":"Unable to get Date "});
      }
      else{
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
router.get('/getfooditem',function(req,res){
  try{
    command='select * from fooditem';
    
    con.query(command,function(error,results){
      if(error){
        res.send({"Message":"Unable to get Date "});
      }
      else{
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

router.get('/getrole',function(req,res){
  try{
    command='select * from role ';
    console.log(command);
    con.query(command,function(error,results){
      if(error){
        res.send({"Message":"Unable to get Date "});
      }
      else{
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
  console.log("Filename",req.file.filename);

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
router.post('cancelroombook/:id',function(req,res){
  console.log("Welcome to cancel Room Book");
  var id = req.params.id;
  var cmd = 'SELECT * FROM booking WHERE  bookedstatusid=2 AND id=' + id;
  con.query(cmd, function (error, getresult) {
    if(getresult=true){
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
router.post('/roombooked',function(req,res){
console.log("Welcome to Book page");
// console.log(req.body);

var getdetails = "SELECT *,false as roombooked FROM booking WHERE bookingid=" +req.body.bookingid;

con.query(getdetails,function(request,result){
  console.log("resu",result[0].adults);

if(result[0].adults<=4)
{

 console.log("2 bed room Booked");
 res.send({"Message":"2 Bed Room Booked"})
}
else if(result[0].adults>=4 && result[0].adults<=6)
{
  console.log("3 bed room Booked");
  res.send({"Message":"3 Bed Room Booked"})
 
}
  
else{
  console.log("Not Booked");
  res.send({"Message":" Not Booked"})
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
router.post('/addbooking',function(req,res){
  try{
  console.log(req.body);
  var command = sprintf('INSERT INTO booking (firstname,lastname,email,phonenumber,address1,address2,city,state,country,pincode,checkin,checkout,adults,child,roomtype,status) VALUES ("%s", "%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%d)',req.body.firstname, req.body.lastname, req.body.email,req.body.phonenumber,req.body.address1,req.body.address2,req.body.city,req.body.state,req.body.country ,req.body.pincode,req.body.checkin,req.body.checkout,req.body.adult,req.body.child,req.body.roomtype,1);
  
    console.log("after",command);
  con.query(command,function(err,result)
  {
    if(err){
      console.log(err);
      res.send({ status: false, message: err });
    }
    else
    {
      res.status(200).send({"message": "Booking added Successfully"}); 
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
  try{
  console.log("body",req.body);
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
  var command = sprintf('INSERT INTO user (firstname,lastname,address1,address2,city,state,country,phoneNumber,email,createddate,username,password,cpassword,status) VALUES ("%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%b)', req.body.firstname,req.body.lastname,req.body.address1,req.body.address2,req.body.city, req.body.state, req.body.country,req.body.phonenumber, req.body.email,dateTime, req.body.userName,hashedPassword,hashedCPassword,1);
  console.log(command);
  con.query(command, function (err, mysqlres1) {
    // console.log(v);
    if (err) throw err;
    console.log("Error",err);
    userid = mysqlres1.insertId
    console.log(userid);
    // console.log(mysqlres1, 'Last insert ID in User:', mysqlres1.insertId);  
    var command = sprintf('INSERT INTO userrolemap (userid ,roleid,status) VALUES (%d,%d,%b)', userid, req.body.roleid,1);
    // var command1=sprintf('INSERT INTO idproof (userid,status) VALUES (%d  ,%b)',  userid,1);
    con.query(command,function (err, mysqlres2) {
      console.log("role",command);
      // console.log("proof",command1);
      if (err) {
        res.status(401).send({ "message": err });       }
      else {       
          if (req.body.roleid = 4)
          res.status(200).send({message:"Successfully Register"});
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
router.get('/getbooking',authcheck,function(req,res){
  try{
  command='select * from booking ';
  con.query(command,function(error,results){
    if(error){
      res.send("Unable to get Date ")
    }
    else{
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
  router.get('/getuser',authcheck,function(req,res){
    try{
    command='select * from user';
    con.query(command,function(error,results){
      if(error){
        res.send("Unable to get Date ")
      }
      else{
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
              response.status(200).send({"message":"Successfully Login", accesstoken: accesstoken,username:results[0].username});
              // response.send({"message"success to login");
              response.end();

            }
            else{
              response.status(401).send({"message":"Incorrect Username and/or Password!"});
              response.end();
            }
          })
          .catch(err => console.error(err.message))


      }else{
        // console.log("test2");
        response.status(401).send({"message":"Incorrect Username and/or Password!"});
        // response.end();
      }
    }
      );
  }
})

//anupama code 

router.get('/getfloor', authcheck,function (req, res) {
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
  router.get('/getroom/:floornumber',authcheck, function (req, res) {
    console.log("getroom")
    var getroom = "SELECT * FROM floorroommapping WHERE floornumber=" + req.params.floornumber+'';
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

  router.get('/getbhk/:noofbhk',authcheck, function (req, res) {
    console.log("getbhk")
    var getroom = "SELECT * FROM floorroommapping WHERE noofbhk=" + req.params.noofbhk+'';
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

  router.get('/getChargedAmenities',authcheck, function (req, res) {
    console.log("getchargedAmenities")
    var getroom = "SELECT * FROM facilitycharges WHERE facilitycategory='Charged Amenities'" ;
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
