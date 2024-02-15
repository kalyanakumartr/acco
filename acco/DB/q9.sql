CALL `getroomlistsp`('2024-01-13', '2024-01-14', '1', '20')


select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid,':',roomno)) AS roomnos  from room where roomid NOT IN (SELECT GROUP_CONCAT(roomid) from booking WHERE (checkin  BETWEEN '2023-12-27' AND '2023-12-28' OR checkout BETWEEN '2023-12-27' AND '2023-12-28')) GROUP BY rtype,price,roomname

select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid,':',roomno)) AS roomnos  from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-12-27' AND '2023-12-28' OR checkout BETWEEN '2023-12-27' AND '2023-12-28')) GROUP BY rtype,price,roomname";
   
   select name,email,phonnumber,address,area,pincode from user
   
   select * from logindetail order by logindatetime desc
   
   UPDATE user SET name='" + uname + '", email="'+undefined?+email+':'+uemail+'  WHERE userid="'+req.body.userid
SELECT *FROM user as usr, userrolemap as urm WHERE usr.userid=urm.userid AND username ="muthu"and password="muthu"   
   
select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT('{\'',roomid,'\':',roomno,',checked:false','}')) AS roomnos from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29')) GROUP BY rtype,price,roomname
