var express = require('express');
var router = express.Router();
var sprintf = require('sprintf-js').sprintf;
const bcrypt = require('bcryptjs');
const jsonwebtoken = require('jsonwebtoken');
const con = require('../dbconfig');
const Country = require('country-state-city').Country;
const State = require('country-state-city').State;



//auth login
const authenticat =(req,res)=>{
  headers = {
    'Content-Type': 'application/json',
    "Access-Control-Allow-Origin": origin,
    "Access-Control-Allow-Credentials": true
  };
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(" ")[1];
  if (!token) return res.sendStatus(401);
  jsonwebtoken.verify(token, process.env.ACCESS_TOKEN, (err, obj) => {
    if (err) {
      return res.sendStatus(403);
    }
    req.username = obj.username;
    req.password = obj.password;
    next();

  })
}



/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send('respond with a resource');
  res.status(200).send(Country.getAllCountries());
  // console.log(Country.getAllCountries())
// console.log(State.getAllStates())
});

router.get('/home', function (req, res, next) {
  res.status(200).send(Country.getAllCountries());
}
);

//add booking
router.post('/addbooking',function(req,res){
  try{
  console.log(req.body);
  var command = sprintf('INSERT INTO booking (firstName,lastName,email,phoneNumber,address1,address2,city,state,country,pincode,checkIn,checkOut,adults,child,roomType,status) VALUES ("%s", "%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%b)',req.body.firstName, req.body.lastName, req.body.email,req.body.phoneNumber,req.body.address1,req.body.address2,req.body.city,req.body.state,req.body.country ,req.body.pincode,req.body.checkIn,req.body.checkOut,req.body.adult,req.body.child,req.body.roomType,1);
  
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



//add user

router.post('/adduser', async function (req, res) {
  console.log(req.body);
  let hashedPassword = await bcrypt.hash(req.body.password, 8);
  let hashedCPassword = await bcrypt.hash(req.body.cpassword, 8);
  // console.log(hashedPassword);
  var command = sprintf('INSERT INTO user (firstName,lastName,address1,address2,city,state,country,phoneNumber,email,userName,password,cpassword,status) VALUES ("%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s",%b)', req.body.firstName,req.body.lastName,req.body.address1,  req.body.address2,req.body.city, req.body.state, req.body.country,req.body.phoneNumber, req.body.email,req.body.userName,hashedPassword,hashedCPassword,1);
  // console.log(command);
  con.query(command, function (err, mysqlres1) {
    if (err) throw err;
    console.log("Error",err);
    userId = mysqlres1.insertId
    // console.log(mysqlres1, 'Last insert ID in User:', mysqlres1.insertId);  
    var command = sprintf('INSERT INTO userrolemap (userId ,roleId,status) VALUES (%d,%d, %d);', userId, req.body.roleId,1);
    con.query(command, function (err, mysqlres2) {
      console.log(command);
      if (err) {
        res.status(401).send({ "message": err });       }
      else {       
          if (req.body.roleId = 4)
          res.status(200).send({message:"Successfully Register"});
        res.end();
      }
  })
})
})
    // if (err) {
    //   res.send({ status: false, message: err });
    // }
    // else {

    //   res.status(200).send("Users added Successfully");
    // }



//get booking detail
router.get('/getbooking',function(req,res){
  command='select * from booking ';
  con.query(command,function(error,results){
    if(error){
      res.send("Unable to get Date ")
    }
    else{
      res.send(results);
    }
  })

  //get user detail
  router.get('/getuser',function(req,res){
    command='select * from user ';
    con.query(command,function(error,results){
      if(error){
        res.send("Unable to get Date ")
      }
      else{
        res.send(results);
      }
    })
  })
  
})

//auth
router.post('/auth', function (request, response) {
  let username = request.body.userName;
  let password = request.body.password;
  response.setHeader('Content-Type', 'application/json');
  if (username && password) {
    con.query('SELECT *FROM user WHERE userName = ?  ', [request.body.userName], function (error, results) {
      if (results.length > 0) {
        bcrypt
          .compare(request.body.password, results[0].password)
          .then(res => {
            if (res && results.length > 0) {
              const accesstoken = jsonwebtoken.sign({ username, password }, process.env.ACCESS_TOKEN);
              console.log("token", accesstoken);
              response.status(200).send({"message":"Successfully Login", accesstoken: accesstoken});
              // response.send({"message"success to login");

            }
            else{
              response.status(401).send({"message":"Incorrect Username and/or Password!"});
              // response.end();
            }
          })
          .catch(err => console.error(err.message))


      }else{
        response.status(401).send({"message":"Incorrect Username and/or Password!"});
        // response.end();
      }
    }
      );
  }
})
module.exports = router;
