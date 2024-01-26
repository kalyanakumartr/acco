select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid,':',roomno)) AS roomnos  from room where roomid NOT IN (
SELECT GROUP_CONCAT(roomid) AS roomid from booking WHERE (checkin  BETWEEN '2023-12-27' AND '2023-12-28' OR checkout BETWEEN '2023-12-27' AND '2023-12-28')
) GROUP BY rtype,price,roomname

select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid,':',roomno)) AS roomnos  from room where roomid NOT IN (
1,2,2,5
) GROUP BY rtype,price,roomname
