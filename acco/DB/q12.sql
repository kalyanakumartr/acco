CALL `spgetroom`('2024-03-27', '2024-03-28' );

CALL `getguestdetailwithcolor`('2024-03-27')

CALL `getguestdetailwithcolor`('2023-12-27')



select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid)) AS roomid,CONCAT(GROUP_CONCAT(roomno)) AS roomnos  from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-03-27' AND '2024-03-28' OR checkout BETWEEN '2024-03-27' AND '2024-03-28')) GROUP BY rtype,price,roomname