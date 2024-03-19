var express = require('express');
var router = express.Router();
const con = require('../dbconfig');
const moment = require('moment');
const jsonwebtoken = require('jsonwebtoken');
const { sprintf } = require('sprintf-js');
const bcrypt = require('bcryptjs');





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


//st auth multiple
router.post('/auth', async function (request, response) {
  try {
    // Capture the input fields
    let username = request.body.username;
    let password = request.body.password;
    if (username && password) {
      cmd = 'SELECT *FROM user as usr, userrolemap as urm WHERE usr.userid=urm.userid AND username ="' + request.body.username + '"';
      con.query(cmd, function (error, results) {
        console.log(cmd);
        // console.log(results);
        if (results.length > 0) {
          try {
            bcrypt
              .compare(request.body.password, results[0].password)
              .then(res => {
                if (res & results.length > 0) {

                  const accesstoken = jsonwebtoken.sign({ username, password }, process.env.ACCESS_TOKEN);
                  // console.log("token", accesstoken);
                  var type = '';
                  if (results[0].roleid == 1) {
                    type = "Admin"
                    var cdatetime = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
                    console.log(cdatetime);
                    console.log(results[0].userid);
                    console.log(results[0].username);
                    var userdetail = sprintf('insert into logindetail (userid,username,logindatetime,usertype,status) VALUES (%d,"%s","%s","%s",%b)', results[0].userid, results[0].username, cdatetime, type, 1); con.query(userdetail, function (res, res) {
                      response.status(200).send({ accesstoken: accesstoken, usertype: type, username: results[0].username, userid: results[0].userid, 
                        email: results[0].email, phonenumber: results[0].phonenumber, firstname: results[0].firstname, lastname: results[0].lastname, roleid: results[0].roleid, 
                        address1:results[0].address1,address2:results[0].address2,
                        city:results[0].city,state:results[0].state,country:results[0].country,
                        pincode:results[0].pincode,
                        message: "Admin Login Sucessfully" });
                      response.end();
                    })
                  }
                  else if (results[0].roleid == 2) {
                    type = "Manager"
                    var cdatetime = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');

                    console.log(cdatetime);
                    console.log(results[0].userid);
                    console.log(results[0].username);

                    var userdetail = sprintf('insert into logindetail (userid,username,logindatetime,usertype,status) VALUES (%d,"%s","%s","%s",%b)', results[0].userid, results[0].username, cdatetime, type, 1);
                    con.query(userdetail, function (res, res) {
                      // console.log("ma",res);
                      response.status(200).send({ accesstoken: accesstoken, usertype: type, username: results[0].username, userid: results[0].userid, 
                        email: results[0].email, phonenumber: results[0].phonenumber, firstname: results[0].firstname, lastname: results[0].lastname, roleid: results[0].roleid, 
                        address1:results[0].address1,address2:results[0].address2,
                        city:results[0].city,state:results[0].state,country:results[0].country,
                        pincode:results[0].pincode,
                        message: "Manager Login Sucessfully" });
                      response.end();
                    })
                  }

                  else if (results[0].roleid == 3) {
                    type = "Customer"
                    if (type == "Customer") {
                      var cdatetime = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');

                      console.log(cdatetime);
                      console.log(results[0].userid);
                      console.log(results[0].username);

                      var userdetail = sprintf('insert into logindetail (userid,username,logindatetime,usertype,status) VALUES (%d,"%s","%s","%s",%b)', results[0].userid, results[0].username, cdatetime, type, 1);
                      con.query(userdetail, function (res, res) {

                        response.status(200).send({ accesstoken: accesstoken, usertype: type, username: results[0].username, userid: results[0].userid, 
                          email: results[0].email, phonenumber: results[0].phonenumber, firstname: results[0].firstname, lastname: results[0].lastname, roleid: results[0].roleid, 
                          address1:results[0].address1,address2:results[0].address2,
                          city:results[0].city,state:results[0].state,country:results[0].country,
                          pincode:results[0].pincode,
                          message: "Customer Login Sucessfully" });
                        response.end();
                      })
                    }
                  }
                  else {
                    type = "FrontOfficeExecutive"
                    if (type == "FrontOfficeExecutive") {
                      var cdatetime = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');

                      console.log(cdatetime);
                      console.log(results[0].userid);
                      console.log(results[0].username);

                      var userdetail = sprintf('insert into logindetail (userid,username,logindatetime,usertype,status) VALUES (%d,"%s","%s","%s",%b)', results[0].userid, results[0].username, cdatetime, type, 1);
                      con.query(userdetail, function (res, res) {

                        response.status(200).send({ accesstoken: accesstoken, usertype: type, username: results[0].username, userid: results[0].userid, 
                          email: results[0].email, phonenumber: results[0].phonenumber, firstname: results[0].firstname, lastname: results[0].lastname, roleid: results[0].roleid, 
                          address1:results[0].address1,address2:results[0].address2,
                          city:results[0].city,state:results[0].state,country:results[0].country,
                          pincode:results[0].pincode,
                          message: "FOE Login Sucessfully" });
                        response.end();
                      })
                    }

                  }


                }
                else {
                  // response.status(401).send({ message: "Incorrect Username and/or Password!" });
                  response.status(401).send({ message: "Invalid credentials,please check your username and password" });


                  response.end();
                }
                // } else {
                //   response.status(401).send('Incorrect Username and/or Password!');
                //   response.end();
                // }
              })

          } catch (e) {
            console.log("Catch");
            const statusCode = e.statusCoderes || 500;
            res.status(statusCode, "Error").json({ success: 0, message: "Invalid credentials check username and password pls ", status: statusCode });
          }
        }
        //check
        else {
          response.status(401).send({ message: "Invalid credentials,please check your username and password!" });
          response.end();
        }
      }
      );
    } else {
      response.status(401).send({ message: "Invalid credentials,please check your username and password!" });
      response.end();
    }
  }
  catch (e) {
    console.log("Catch");
    const statusCode = e.statusCoderes || 500;
    res.status(statusCode, "Error").json({ success: 0, message: "Invalid credentials check username and password pls ", status: statusCode });
  }
});




//end multiple


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



//st get logindetail

router.get('/getlogin', function (req, res) {
  try {
    command = 'select * from logindetail';
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


//end get logindetail

//st change password
router.post('/changepassword', async (req, resu) => {
  var id = req.body.userid;
  var cmmd = 'select password from user where userid=' + id + '';
  con.query(cmmd, function (getpasserr, getpassres) {
    if (getpasserr) {
      resu.send("Som Err");
    }
    else (
      bcrypt
        .compare(req.body.oldpassword, getpassres[0].password, function (errr, cresu) {
          if (cresu) {
            console.log("Welcome"); console.log(cmmd);
            console.log("database password ", getpassres[0].password) // res.send("Correct");
            var Password = bcrypt.hash(req.body.password, 8);
            var Cpassword = bcrypt.hash(req.body.cpassword, 8);
            console.log("Password", Password, "CPassword", Cpassword);
            //   var Password = req.body.password; 
            //  var Cpassword= req.body.cpassword;
            var command = 'UPDATE user SET password="' + Password + '",cpassword="' + Cpassword + '" WHERE userid = ' + req.body.userid + '';
            let data = [true, 1];
            con.query(command, data, function (error, result) {
              if (error) {
                resu.send({ status: false, message: error });
                console.log(error);
                throw error;
              }
              else {
                console.log(command);
                console.log("Done");
                resu.status(200).send({ message: "Successfully Changed Password" });
              }
            })
          }
          else {
            resu.status(200).send({ message: "Some Pls check old password" });
          }

        }))
  })
})
// if()
// .then(res => {

// }))
// }); 
// });


// );
// });
// "oldpassword":"admin",
//     "password":"admin1",
//     "cpassword":"admin1"

//   var opassword=req.body.oldpassword;
//     if(getpassres[0].password==opassword){
//     console.log("cmd",cmmd);
//     console.log("getpass",getpassres);
//     // var opassword=bcrypt.hash(req.body.oldpassword,8);


//   // let Password = bcrypt.hash(req.body.password, 8);
//   // let Cpassword=  bcrypt.hash(req.body.cpassword,8)
//   let Password = req.body.password;
//   let Cpassword= req.body.cpassword;

//   var command = 'UPDATE user SET password="' + Password + '",cpassword="' + Cpassword + '" WHERE userid = ' + id + '';
//   let data = [true, 1];
//   con.query(command, data, function (error, result) {
//     if (error) {
//       res.send({ status: false, message: error });
//       console.log(error);
//       throw error;
//     }
//     else {
//       console.log("Done");
//       res.status(200).send({ message: "Successfully Changed Password" });
//     }
//   });
// }
// else{
//   res.send({ message: "Pls check Old password " })
// }

// });
// });


//end change password



module.exports = router;
