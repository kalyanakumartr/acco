CALL `getroomlistsp`('2024-01-13', '2024-01-14', '3', '4')


SELECT *,(SELECT statusname FROM STATUS) FROM room WHERE status=statusid;


select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,(select COUNT(roomname) 
AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-03-27' 
AND '2024-03-28' OR checkout BETWEEN '2024-03-27' AND '2024-03-28'))) from tariffdetail where roomtypeid=1 
AND (headcount=2 OR headcount>=4);



select name,des,headcount,roomtypeid,(select COUNT(roomname) 
AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-03-27' 
AND '2024-03-28' OR checkout BETWEEN '2024-03-27' AND '2024-03-28'))) from tariffdetail where roomtypeid=1 
AND (headcount=2 OR headcount>=4);


select COUNT(roomname) AS roomcount,rtype ,price,roomname ,json_array(GROUP_CONCAT(roomno)) AS roomno,
GROUP_CONCAT(roomid) AS roomids from room where roomid NOT IN (SELECT roomid from booking WHERE 
(checkin  BETWEEN '2024-03-27' AND '2024-03-27' OR checkout BETWEEN '2024-03-27' AND '2024-03-27')) 
GROUP BY rtype,price,roomname



select * from booking where bookingid=76

