
CALL `spgetroom`('2024-03-27', '2024-03-28')

SELECT json_object(roomid,roomno) FROM room
select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT('{\'',roomid,'\':',roomno,',checked:false','}')) AS roomnos from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29')) GROUP BY rtype,price,roomname

SELECT JSON_ARRAY(JSON_OBJECT(5,10,45,45))

select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT('{\'',roomid,'\':',roomno,',checked:false','}')) AS roomnos from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29')) GROUP BY rtype,price,roomname


select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid,':',roomno)) AS roomnos from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-03-27' AND '2024-03-28' OR checkout BETWEEN '2024-03-27' AND '2024-03-28')) GROUP BY rtype,price,roomname


