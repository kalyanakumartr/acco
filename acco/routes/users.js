var express = require('express');
var router = express.Router();
var sprintf = require('sprintf-js').sprintf;
const bcrypt = require('bcryptjs');
const con = require('../dbconfig');

/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send('respond with a resource');
});



//add user

router.post('/adduser', async function (req, res) {
      console.log(req.body);
      let hashedPassword = await bcrypt.hash(req.body.password, 8);
      console.log(hashedPassword);
      var command = sprintf('INSERT INTO user (userName,password,gender,email,phoneNumber,status) VALUES ("%s", "%s","%s","%s","%s",%b)', req.body.userName, hashedPassword, req.body.gender, req.body.email, req.body.phoneNumber, 1);
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
router.post('/auth',function(req,res){

});
module.exports = router;
