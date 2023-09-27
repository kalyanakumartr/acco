var express = require('express');
var router = express.Router();
var sprintf = require('sprintf-js').sprintf;
const bcrypt = require('bcryptjs');
const jsonwebtoken = require('jsonwebtoken');
const con = require('../dbconfig');
const Country = require('country-state-city').Country;
const State = require('country-state-city').State;



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





//add user

router.post('/adduser', async function (req, res) {
  console.log(req.body);
  let hashedPassword = await bcrypt.hash(req.body.password, 8);
  console.log(hashedPassword);
  var command = sprintf('INSERT INTO user (userName,password,gender,email,phoneNumber,country,state,city,address,status) VALUES ("%s", "%s","%s","%s","%s","%s","%s","%s","%s",%b)', req.body.userName, hashedPassword, req.body.gender, req.body.email, req.body.phoneNumber,req.body.country, req.body.state,req.body.city,req.body.address,1);
  console.log(command);
  con.query(command, function (err, mysqlres1) {
    if (err) {
      res.send({ status: false, message: err });
    }
    else {

      res.status(200).send("Users added Successfully");
    }
  })
})

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



//get user detail
router.get('/getuser',authenticat,function(req,res){
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

//auth
router.post('/auth', function (request, response) {
  let username = request.body.userName;
  let password = request.body.password;
  if (username && password) {
    con.query('SELECT *FROM user WHERE userName = ?  ', [request.body.userName], function (error, results) {
      if (results.length > 0) {
        bcrypt
          .compare(request.body.password, results[0].password)
          .then(res => {
            if (res && results.length > 0) {
              const accesstoken = jsonwebtoken.sign({ username, password }, process.env.ACCESS_TOKEN);
              console.log("token", accesstoken);
              response.status(200).send({ accesstoken: accesstoken,});
            }
            else{
              response.status(401).send('Incorrect Username and/or Password!');
              response.end();
            }
          })
          .catch(err => console.error(err.message))


      }else{
        response.status(401).send('Incorrect Username and/or Password!');
        response.end();
      }
    }
      );
  }
})
module.exports = router;
