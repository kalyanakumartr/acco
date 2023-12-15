
flush PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';


SELECT * FROM `acco`.`room` ORDER BY `roomid`



select * from room where (basecount<='" + req.query.adults + "' OR basecount<=4) AND 
roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "' 
OR checkout BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "'))");



  