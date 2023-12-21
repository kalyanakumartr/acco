var express = require('express');
var router = express.Router();
const con = require('../dbconfig');




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
  


module.exports = router;
