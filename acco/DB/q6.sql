CALL `getroomlist`('2024-01-13', '2024-01-14', '1', '20');
CALL `getroomlistsp`('2024-01-13', '2024-01-14', '1', '20');


select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,
(SELECT sum(bhk2count) AS 2bhk  from booking WHERE (checkin  BETWEEN '2024-01-13' AND '2024-01-14' OR checkout BETWEEN '2024-01-13' AND '2024-01-14' ) AND '2BHK'=name)
 AS avilable from tariffdetail where roomtypeid=1 AND (headcount=3 OR headcount>=4);
 
 
 	select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,
			((SELECT sum(bhk2count) AS 2bhk  from booking WHERE
			 (checkin  BETWEEN '2024-01-13' AND '2024-01-14' OR checkout BETWEEN '2024-01-13' AND '2024-01-14' ) AND name='2bhk'))
			 AS avilable from tariffdetail where roomtypeid=1 AND  (headcount=3 OR headcount>=4);			
	
 
 
 SELECT roomname, COUNT(roomname) FROM room where STATUS=1  GROUP BY roomname;