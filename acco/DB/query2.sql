INSERT INTO menuitem(productid,menuqty,menudate,status) VALUES (10,20,"2024-02-12",1);

UPDATE otpstore SET otp="566641",otpctime="2024-02-15 12:03:35",otpetime="2024-02-15 12:13:35" WHERE email="muthuslm2006@gmail.com"


select * from logic where adult=0

CALL `spgetroom`('2023-12-27', '2023-12-28')

select COUNT(roomname) AS roomcount,rtype ,price,roomname,CONCAT(GROUP_CONCAT(roomid)) AS roomid,CONCAT(GROUP_CONCAT(roomno)) AS roomnos from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-02-27' AND '2024-02-28' OR checkout BETWEEN '2024-02-27' AND '2024-02-28')) GROUP BY rtype,price,roomname

select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid,':',roomno)) AS roomnos  from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-03-27' AND '2024-03-28' OR checkout BETWEEN '2024-03-27' AND '2024-03-28')) GROUP BY rtype,price,roomname

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

select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,(select COUNT(roomname) AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-12-28' AND '2023-12-29' OR checkout BETWEEN '2023-12-28' AND '2023-12-29'))AND roomname=name ) AS avilable from tariffdetail where roomtypeid=3 AND (headcount=4 OR headcount>=4);
select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,(select COUNT(roomname) AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN "2023-12-28" AND "2023-12-29" OR checkout BETWEEN "2023-12-28" AND "2023-12-29"))AND roomname=name ) AS avilable from tariffdetail where roomtypeid=1 AND (headcount=3 OR headcount>=4

select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,(select COUNT(roomname) AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-03-27' AND '2024-03-28' OR checkout BETWEEN '2024-03-27' AND '2024-03-28'))) from tariffdetail where roomtypeid=1 AND (headcount=3 OR headcount>=4);
select COUNT(roomname) AS roomcount,roomid from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-03-27' AND '2024-03-28' OR checkout BETWEEN '2024-03-27' AND '2024-03-28'))


update booking set acheckin='2024-01-27 15:00:00', bhk2count=2  WHERE bookingid=40
update booking set acheckin='2024-01-27 15:00:00', bhk2count=1, bhk3count=1  WHERE bookingid=76
update booking set acheckin='2024-01-27 15:00:00', bhk2count=1, bhk3count=1,roomid=2 WHERE bookingid=76

select COUNT(roomname) AS roomcount,rtype ,price,roomname ,json_array(GROUP_CONCAT(roomno)) AS roomno,GROUP_CONCAT(roomid) AS roomids from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-03-27' AND '2024-03-27' OR checkout BETWEEN '2024-03-27' AND '2024-03-27')) GROUP BY rtype,price,roomname


select * from booking where email="muthu@stashook.com" order by bookingid desc 

select * from booking where bookingid=2select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT('{' 'roomid:',roomno,' CHECKED:FALSE '}'))' AS roomnos  from room 
where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN ''2023-10-28'' AND ''2023-10-29'' OR checkout BETWEEN ''2023-10-28'' AND ''2023-10-29'')) GROUP BY rtype,price,roomname

select * from booking where bookingid=

select * from booking where bookingid=2

select * from booking where bookingid=27
select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT('{' 'roomid:',roomno,' CHECKED:FALSE '}'))' AS roomnos  from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-27' AND '2023-10-28' OR checkout BETWEEN '2023-10-27' AND '2023-10-28')) GROUP BY rtype,price,roomname
select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT('{' 'roomid:',roomno,' CHECKED:FALSE '}'))' AS roomnos  from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-03-27' AND '2024-03-28' OR checkout BETWEEN '2024-03-27' AND '2024-03-28')) GROUP BY rtype,price,roomname")

select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT('{\'',roomid,'\':',roomno,',checked:false','}')) AS roomnos from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29')) GROUP BY rtype,price,roomname

/*work*/
"select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid,':',roomno)) AS roomnos  from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "' OR checkout BETWEEN '" + req.query.checkin + "' AND '" + req.query.checkout + "')) GROUP BY rtype,price,roomname";
 
select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid,':',roomno)) AS roomnos  from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN  '2023-10-28'  AND  '2023-10-29'  OR checkout BETWEEN  '2023-10-28'  AND '2023-10-29')) GROUP BY rtype,price,roomname" ;

UPDATE booking SET roomid=1:101,2:202 , acheckin="2024-01-14 09:48:51" where bookingid=25
UPDATE booking SET roomid='{[1:101,2:202]} ',acheckin="2024-01-14 09:48:51" where bookingid=25

SELECT roomid FROM booking WHERE LENGTH(roomid)>1
select * from booking where bookingid=25
SELECT col1.roomid,col2.roomid FROM booking
SELECT 0.roomid 'has work' FROM booking

update booking set roomid='1:101,2:202' where bookingid=25
select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid,':',roomno)) AS roomnos from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-03-27' AND '2024-03-28' OR checkout BETWEEN '2024-03-27' AND '2024-03-28')) GROUP BY rtype,price,roomname


TRUNCATE user
SELECT roomid FROM booking

select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid,':',roomno)) AS roomnos from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-03-27' AND '2024-03-28' OR checkout BETWEEN '2024-03-27' AND '2024-03-28')) GROUP BY rtype,price,roomname


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

ALTER TABLE productdetail
     CHANGE modifieddate
            modifieddate TIMESTAMP NOT NULL
                           DEFAULT CURRENT_TIMESTAMP
                           ON UPDATE CURRENT_TIMESTAMP;

SELECT *FROM user as usr, userrolemap as urm WHERE usr.userid=urm.userid AND username ="muthu"and password="muthu"


flush PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';


SELECT * FROM `acco`.`room` ORDER BY `roomid`



select * from room AND roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-03-27' AND '2024-03-28' OR checkout BETWEEN '2024-03-27' AND '2024-03-28'));



INSERT INTO tariffdetail(name,price,totalamount,status) VALUES ("Test",100.00,100.00,1)

update tariffdetail set name="TamilSelvan1", price=199,tax=0,discount=0,totalamount=199 WHERE tariffid=8
update tariffdetail set NAME="Tamil", price=1000,tax=0,discount=0,totalamount=1000 WHERE tariffid=8


  TRUNCATE product
  
  
  select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT('[',GROUP_CONCAT('{', '\"roomid\":',roomno,',\"CHECKED\":false' '}'),']') AS roomnos  from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-12-30' AND '2023-12-31' OR checkout BETWEEN '2023-12-30' AND '2023-12-31')) GROUP BY rtype,price,roomname;
  
  
  TRUNCATE product
  //
  
      


select * from booking WHERE userid=6 ORDER BY checkin;


cmd='
SELECT * from booking where bookedstatusid=1 AND (bookingid='' or email = '' or phonenumber=1); 

SELECT roomname, COUNT(roomname) as available FROM room where STATUS=1  GROUP BY roomname;

select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,(select COUNT(roomname) AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN "2024-03-27" AND "2024-03-28" OR checkout BETWEEN "2024-03-27" AND "2024-03-28"))AND roomname=name ) AS avilable from tariffdetail where roomtypeid=1 AND (headcount=3 OR headcount>=4)';

SELECT IFNULL(sum(bhk2count),0)  from booking WHERE (checkin  BETWEEN checkin AND checkout OR checkout BETWEEN checkin AND checkout ) 			from tariffdetail where roomtypeid=1 AND NAME='2BHK'

select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,(select COUNT(roomname) AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN checkin AND checkout OR checkout BETWEEN checkin AND checkout))AND roomname=name ) AS avilable from tariffdetail where roomtypeid=1;



CALL `spgetroom`('2024-03-27', '2024-03-28' );

CALL `getguestdetailwithcolor`('2024-03-27')

CALL `getguestdetailwithcolor`('2023-12-27')



select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT(roomid)) AS roomid,CONCAT(GROUP_CONCAT(roomno)) AS roomnos  from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2024-03-27' AND '2024-03-28' OR checkout BETWEEN '2024-03-27' AND '2024-03-28')) GROUP BY rtype,price,roomname