// var express = require('express');
// var router = express.Router();
// var sprintf = require('sprintf-js').sprintf;
// const con = require('../dbconfig');



// router.post('/addmarquee', async function (req, res) {
//     console.log("Welcome to Marquee");
//     try {
//         console.log("body", req.body);
//         var command = sprintf('INSERT INTO marquee (marqueeName,status) VALUES ("%s",%b)', req.body.marqueeName, 1);
//         console.log(command);
//         con.query(command, function (err, insertresult) {
//             if (err) throw err;
//             console.log("Error", err);
//             res.status(200).send({ message: "Successfully Register" });
//             res.end();
//         })
//     }


//     catch (e) {
//         console.log("Catch", e.err);
//         const statusCode = e.statusCoderes || 500;
//         res.status(statusCode, "Error").json({ success: 0, message: e.message, status: statusCode });
//     }
// })
