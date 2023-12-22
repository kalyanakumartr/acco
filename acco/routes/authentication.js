var express = require('express');
var router = express.Router();
const con = require('../dbconfig');





const authcheck = (req, res, next) => {
  headers = {

    'Content-Type': 'application/json',
    "Access-Control-Allow-Origin": ' <origin>',
    "Access-Control-Allow-Credentials": true
  };
  // console.log(headers);
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(" ")[1];
  // console.log(token);
  if (!token) return res.sendStatus(401);
  jsonwebtoken.verify(token, process.env.ACCESS_TOKEN, (err, obj) => {

    if (err) {
      console.log("error", err);
      return res.sendStatus(403);
    }
    req.userName = obj.username;
    req.password = obj.password;
    next();

  })
}

//end 



//auth
// router.post('/auth', function (request, response) {
//   let username = request.body.userName;
//   let password = request.body.password;
//   // console.log("Check", username, password);
//   // console.log("Check", username, password);
//   // response.setHeader({'Content-Type': 'application/json'});
//   // response.header ({'Content-Type': 'application/json'});
//   if (username && password) {
//     con.query('SELECT *FROM user WHERE username = ?  ', [request.body.userName], function (error, results) {
//       if (results.length > 0) {
//         // console.log("test3");
//         bcrypt
//           .compare(request.body.password, results[0].password)
//           .then(res => {
//             // console.log("test1");
//             if (res && results.length > 0) {
//               const accesstoken = jsonwebtoken.sign({ username, password }, process.env.ACCESS_TOKEN);
//               console.log("token", accesstoken);
//               response.status(200).send({ "message": "Successfully Login", accesstoken: accesstoken, username: results[0].username });
//               // response.send({"message"success to login");
//               response.end();

//             }
//             else {
//               response.status(401).send({ "message": "Incorrect Username and/or Password!" });
//               response.end();
//             }
//           })
//           .catch(err => console.error(err.message))


//       } else {
//         // console.log("test2");
//         response.status(401).send({ "message": "Incorrect Username and/or Password!" });
//         // response.end();
//       }
//     }
//     );
//   }
// })



//st auth multiple
router.post('/auth', async function (request, response) {
  // Capture the input fields
  let username = request.body.username;
  let password = request.body.password;
  if (username && password) {
    con.query('SELECT *FROM user as usr, userrolemap as urm WHERE usr.userid=urm.userid AND username = ?  ', [request.body.username], function (error, results) {
      if (results.length > 0) {
        if (results.length > 0) {
          const accesstoken = jsonwebtoken.sign({ username, password }, process.env.ACCESS_TOKEN);
          // console.log("token", accesstoken);
          var type = '';
          if (results[0].roleid == 1) {

            type = "Admin"
            // var appoiid = 0;
            // var statusId = 0;

            response.status(200).send({ accesstoken: accesstoken, usertype: type, username: results[0].username, userid: results[0].userid, email: results[0].email, phonenumber: results[0].phonenumber, firstname: results[0].firstname });
            response.end();
          }
          else if (results[0].roleid == 2) {

            type = "Manager"
            // var appoiid = 0;
            // var statusId = 0;
            response.status(200).send({ accesstoken: accesstoken, usertype: type, username: results[0].username, userid: results[0].userid, email: results[0].email, phonenumber: results[0].phonenumber, firstname: results[0].firstname });
            response.end();
          }
          else {
            type = "Customer"
            if (type == "Customer") {
              response.status(200).send({ accesstoken: accesstoken, usertype: type, username: results[0].username, userid: results[0].userid, email: results[0].email, phonenumber: results[0].phonenumber, firstname: results[0].firstname });
              response.end();
            }
          }
        }
        else {
          response.status(401).send('Incorrect Username and/or Password!');
          response.end();
        }
      } else {
        response.status(401).send('Incorrect Username and/or Password!');
        response.end();
      }
    }
    );
  } else {
    response.status(401).send('Please enter Username and Password!');
    response.end();
  }
});




//end multiple



//st change password
router.post('/changepassword', (req, res) => {
    var id = req.body.userid;
    var password = req.body.password;
  
  
    var command = 'UPDATE user SET password="' + password + '" WHERE userid = ' + id + '';
    let data = [true, 1];
    con.query(command, data, function (error, result) {
      if (error) {
        res.send({ status: false, message: error });
  
        console.log(error);
        throw error;
      }
      else {
        console.log("Done");
        res.status(200).send({ message: "Successfully Changed Password" });
      }
    });
  
  });
  
  
  //end change password
  





module.exports = router;
