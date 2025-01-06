-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.39 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



-- Dumping structure for procedure acco.getguestdetailwithcolor
DELIMITER //
CREATE PROCEDURE `getguestdetailwithcolor`(
	IN `cdate` VARCHAR(50)
)
BEGIN
   DECLARE done INT DEFAULT FALSE;
   DECLARE actualCheckin datetime;
	DECLARE bookedCheckin  datetime;
	DECLARE bookId  INT;
	DECLARE cur1 CURSOR FOR SELECT bookingid, acheckin, checkin FROM booking WHERE (checkin LIKE concat(cdate,'%')) OR (checkout LIKE concat(cdate,'%'));
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
		DROP TEMPORARY TABLE IF EXISTS temp_table;
CREATE TEMPORARY TABLE IF NOT EXISTS temp_table
(
	bookingid int ,
  userid int ,
  modeoftypeid INT ,
   roomtypeid INT,
  bhk1count INT ,
  bhk2count INT ,
  bhk3count INT ,
  firstname varchar(50) ,
  lastname varchar(250) ,
  email varchar(250) ,
  phonenumber varchar(250),
  address1 varchar(250) ,
  address2 varchar(250) ,
  city varchar(250) ,
  state varchar(250),
  country varchar(250),
  pincode varchar(250) ,
  checkin datetime ,
  checkout datetime,
  acheckin datetime ,
  acheckout datetime ,
  adults varchar(250),
  child varchar(250) ,
    childage varchar(250) ,
    
  roomtype varchar(250),
  roomid varchar(250) ,
roomnos varchar(250) ,
   bed varchar(250),
      imageUrl varchar(250),
  noofdays varchar(250),

  price float ,
  tax float ,
  subtotal float ,
  totalprice float ,
  bookedstatusid varchar(250),
  verificationstatus varchar(250),
 clientfeedback varchar(250),
  commands varchar(250),

  status tinyint ,
 	color TEXT,
 	romenose TEXT,
 	PRIMARY KEY (bookingid) USING BTREE
 	 );
 	 
		
SET @roomnoss='';	
SET @Comma = ', ';
SET @Count = 0;

OPEN cur1;

   read_loop: LOOP
	    FETCH cur1 INTO bookId, actualCheckin, bookedCheckin;

	   
	    SET @roomids = (SELECT roomid from booking WHERE bookingid = bookId);
/*SELECT @roomids;
*/
 if(@roomids ='') then 
			SET @roomids='0';
				END IF;

/*
@roomids ISNULL?@roomids:'0';
*/
SET @SQL_QUERY1 =concat('select json_array(GROUP_CONCAT("{",roomid ,":",roomno,"}")) into @roomnoss from room where roomid IN (',@roomids,') ');
	PREPARE stmt4 FROM @SQL_QUERY1;
	EXECUTE stmt4;
	DEALLOCATE PREPARE stmt4;

			call findcolor(bookedCheckin,actualCheckin,@color);
			select count(*) into @Count from temp_table where bookingid =bookId;
			if (@Count=0) then
					
				INSERT INTO temp_table ( bookingid,  userid, modeoftypeid ,  roomtypeid, bhk1count,bhk2count,bhk3count,firstname ,  lastname ,  email ,  phonenumber ,
				  address1 ,  address2,  city ,  state ,  country,  pincode ,  checkin ,  checkout ,  acheckin ,acheckout,
				  adults ,  child ,   childage ,  roomtype,  roomid ,   roomnos ,  bed ,  imageUrl ,    noofdays,  price ,   tax ,subtotal , totalprice,  
				  bookedstatusid ,
				  verificationstatus,  status,clientfeedback, commands,	color,romenose) (select *,  @color ,@roomnoss from booking where bookingid = bookId);
				END IF;
			
	 IF done THEN
      LEAVE read_loop;
    END IF;
  END LOOP;
  CLOSE cur1;
SELECT * from temp_table WHERE NOT bookedstatusid=4 ORDER BY checkin desc;
DROP TEMPORARY TABLE IF EXISTS temp_table;

END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
