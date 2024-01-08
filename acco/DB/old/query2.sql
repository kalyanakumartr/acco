CALL getguestdetailwithcolor('2023-10-23');



CALL `getguestdetailwithcolor`('2023-10-23')

select name,price,roomtypeid from tariffdetail where roomtypeid=3
select name,price,roomtypeid ,des from tariffdetail where roomtypeid=1


INSERT INTO product(productname,qty,mrp,rate,amount,tax,cgst,sgst,status) VALUES("icecream",1,10.00,10.00,9.50,18,0.25,0.25,1);


select * from booking where bookingid = 1;


select COUNT(roomname) AS roomcount,rtype ,price,roomname ,GROUP_CONCAT(roomid) AS roomids from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29')) GROUP BY rtype,price,roomname


select COUNT(roomname) AS roomcount, from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29'))


select COUNT(roomname) AS roomcount, AS roomno from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-12-28' AND '2023-12-29' OR checkout BETWEEN '2023-12-28' AND '2023-12-29'))



select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,(select COUNT(roomname) AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-12-28' AND '2023-12-29' OR checkout BETWEEN '2023-12-28' AND '2023-12-29'))) from tariffdetail where roomtypeid=1 AND (headcount=1 OR headcount>=4);


select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,(select COUNT(roomname) AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-12-28' AND '2023-12-29' OR checkout BETWEEN '2023-12-28' AND '2023-12-29'))) from tariffdetail where roomtypeid=1 AND (headcount=2 OR headcount>=4);

select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,(select COUNT(roomname) AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-12-28' AND '2023-12-29' OR checkout BETWEEN '2023-12-28' AND '2023-12-29'))AND roomname=name ) AS avilable from tariffdetail where roomtypeid=1 AND (headcount=4 OR headcount>=4);
select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,(select COUNT(roomname) AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN "2023-12-28" AND "2023-12-29" OR checkout BETWEEN "2023-12-28" AND "2023-12-29"))AND roomname=name ) AS avilable from tariffdetail where roomtypeid=1 AND (headcount=3 OR headcount>=4

select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,(select COUNT(roomname) AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-12-28' AND '2023-12-29' OR checkout BETWEEN '2023-12-28' AND '2023-12-29'))) from tariffdetail where roomtypeid=1 AND (headcount=3 OR headcount>=4);
select COUNT(roomname) AS roomcount,roomid from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-12-28' AND '2023-12-29' OR checkout BETWEEN '2023-12-28' AND '2023-12-29'))


select COUNT(roomname) AS roomcount,rtype ,price,roomname ,json_array(GROUP_CONCAT(roomno)) AS roomno,GROUP_CONCAT(roomid) AS roomids from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29')) GROUP BY rtype,price,roomname

select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT('{\'',roomid,'\':',roomno,',checked:false','}')) AS roomnos from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29')) GROUP BY rtype,price,roomname

select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid,':',roomno)) AS roomnos from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29')) GROUP BY rtype,price,roomname


select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT('{\' 'roomid:',roomno,' CHECKED:FALSE '}'))' AS roomnos  from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "' OR checkout BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "')) GROUP BY rtype,price,roomname")


roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '" + req.query. "' AND '" + req.query.checkout + "' OR checkout BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "'))");


select * from room where basecount<=4

roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "' OR checkout BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "'))")



ALTER TABLE user
     CHANGE modifieddate
            modifieddate TIMESTAMP NOT NULL
                           DEFAULT CURRENT_TIMESTAMP
                           ON UPDATE CURRENT_TIMESTAMP;




flush PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';


SELECT * FROM `acco`.`room` ORDER BY `roomid`



select * from room where (basecount<='" + req.query.adults + "' OR basecount<=4) AND 
roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "' 
OR checkout BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "'))");



INSERT INTO tariffdetail(name,price,totalamount,status) VALUES ("Test",100.00,100.00,1)

update tariffdetail set name="TamilSelvan1", price=199,tax=0,discount=0,totalamount=199 WHERE tariffid=8
update tariffdetail set NAME="Tamil", price=1000,tax=0,discount=0,totalamount=1000 WHERE tariffid=8


  TRUNCATE product
  
  
  select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT('[',GROUP_CONCAT('{', '\"roomid\":',roomno,',\"CHECKED\":false' '}'),']') AS roomnos  from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-12-30' AND '2023-12-31' OR checkout BETWEEN '2023-12-30' AND '2023-12-31')) GROUP BY rtype,price,roomname;
  
  
  TRUNCATE product
  
  