var express = require('express');
var router = express.Router();
var sprintf = require('sprintf-js').sprintf;
const con = require('../dbconfig');

/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send('respond with a resource');
});

router.get('/home', function (req, res) {
  res.send("Welcome to Home ");
})

//add user

router.post('/adduser', function (req, res) {
      console.log(req.body);
      var command = sprintf('INSERT INTO user (userName,password,gender,email,phoneNumber,status) VALUES ("%s", "%s","%s","%s","%s",%b)', req.body.userName, req.body.password, req.body.gender, req.body.email, req.body.phoneNumber, 1);
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
module.exports = router;
