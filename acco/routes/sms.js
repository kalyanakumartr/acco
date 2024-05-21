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


router.get('/qa', function (req, res) {
    try {
        console.log("Welcome to Qustion Block");
        cmd = '	SELECT * from selfguru order by RAND() LIMIT ' + req.query.limit + '';
        console.log(cmd);
        con.query(cmd, function (err, result) {
            // console.log(result);
            console.log(result.length);
            if (result.length > 0) {
                res.send({ result });
            }
            else {  res.send("Pls give correct input");
        }
          }        )
    }
    catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
}
    
});

module.exports = router;


