
CALL `spgetroom`('2024-03-27', '2024-03-28')

SELECT * FROM otpstore where email="muthu@stashook.com" AND otpetime>"2024-02-02 14:36:47" AND otpno=107857
select count(otpno) as counting from otpstore where email="muthu@stashook.com" AND otpetime>"2024-02-02 14:36:47" AND otpno=561730
 AND otpetime<'2024-02-02 14:05:43' AND otpno=930021

count(otpno) as counting from otpstore where email=muthu@stashook.com AND otpetime<'2024-02-02 14:05:43' AND otpno=930021
stashook.com AND otpetime<'2024-02-02 14:04:14' AND otpno=930021
stashook.com@stashook.com AND otpetime>='2024-02-02 14:01:38' AND otpno=930021

select count(otpno) as count from otpstore where email="muthu@stashdook.com"

SELECT json_object(roomid,roomno) FROM room
select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT('{\'',roomid,'\':',roomno,',checked:false','}')) AS roomnos from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29')) GROUP BY rtype,price,roomname

SELECT JSON_ARRAY(JSON_OBJECT(5,10,45,45))

select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT('{\'',roomid,'\':',roomno,',checked:false','}')) AS roomnos from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29')) GROUP BY rtype,price,roomname


select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid,':',roomno)) AS roomnos from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-03-27' AND '2024-03-28' OR checkout BETWEEN '2024-03-27' AND '2024-03-28')) GROUP BY rtype,price,roomname


