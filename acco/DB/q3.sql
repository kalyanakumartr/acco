CALL `getroomlist`('2023-12-28', '2023-12-29', '3', '9')


select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,
(select COUNT(roomname) AS roomcount from room  where roomid NOT IN (SELECT roomid from booking WHERE 
(checkin  BETWEEN '2023-12-28' AND '2023-12-29' OR checkout BETWEEN '2023-12-28' AND '2023-12-29'))
AND roomname=name ) AS avilable from tariffdetail where roomtypeid=3 AND (headcount=4 OR headcount>=4);



-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.35 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for acco
CREATE DATABASE IF NOT EXISTS `acco` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `acco`;

-- Dumping structure for procedure acco.getroomlistsp
DELIMITER //
CREATE PROCEDURE `insert`(
	IN `cin` VARCHAR(50),
	IN `cout` VARCHAR(50),
	IN `rtid` INT,
	IN `adultin` INT
)
BEGIN
   DECLARE done INT DEFAULT FALSE;
   DECLARE roomname varchar(50);
	DECLARE avilable2  INT;
	DECLARE avilable  INT;
	DECLARE cur1 CURSOR FOR  SELECT roomname, COUNT(roomname) FROM room where STATUS=1  GROUP BY roomname;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
		DROP TEMPORARY TABLE IF EXISTS temp_table;
CREATE TEMPORARY TABLE IF NOT EXISTS temp_table
(
	`name` varchar(50),
  `des` VARCHAR(100),
  `price` DOUBLE,
  `maintenance` DOUBLE,
  `tax` DOUBLE,
  `headcount` INT, 
  `totalamount` DOUBLE,
  `discount` DOUBLE,
  `roomtypeid` INT,
  `avilable` INT 
 	 );
	

SET @Comma = ', ';
SET @Count = 0;

/*SET GLOBAL log_bin_trust_function_creators = "1";*/
OPEN cur1;
   read_loop: LOOP
	    FETCH cur1 INTO roomname, avilable;
		if(roomname='2bhk') then 
	    
	    SELECT name,des,price,maintenance,tax,headcount,totalamount,discount,roomtypeid,
			((SELECT sum(bhk2count) AS 2bhk  from booking WHERE
			 (checkin  BETWEEN cin AND cout OR checkout BETWEEN cin AND cout ) AND roomname=name))
			 AS avilable from tariffdetail where roomtypeid=rtid AND  (headcount=adultin OR headcount>=4);	
		

			End IF;	
		
	 IF done THEN
      LEAVE read_loop;
    END IF;
  END LOOP;
  CLOSE cur1;
SELECT * from temp_table;
DROP TEMPORARY TABLE IF EXISTS temp_table;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
