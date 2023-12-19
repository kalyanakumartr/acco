CALL getguestdetailwithcolor('2023-10-23');



select * from booking where bookingid = 1;


select COUNT(roomname) AS roomcount,rtype ,price,roomname ,GROUP_CONCAT(roomid) AS roomids from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29')) GROUP BY rtype,price,roomname




select COUNT(roomname) AS roomcount,rtype ,price,roomname ,json_array(GROUP_CONCAT(roomno)) AS roomno,GROUP_CONCAT(roomid) AS roomids from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29')) GROUP BY rtype,price,roomname



select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT('[',GROUP_CONCAT(roomno),']') AS roomnos,CONCAT('[',GROUP_CONCAT(roomid),']' )AS roomids from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29')) GROUP BY rtype,price,roomname



roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '" + req.query. "' AND '" + req.query.checkout + "' OR checkout BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "'))");


select * from room where basecount<=4

roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "' OR checkout BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "'))")



ALTER TABLE user
     CHANGE modifieddate
            modifieddate TIMESTAMP NOT NULL
                           DEFAULT CURRENT_TIMESTAMP
                           ON UPDATE CURRENT_TIMESTAMP;