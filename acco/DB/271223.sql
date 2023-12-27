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

-- Dumping structure for table acco.bookedstatus
CREATE TABLE IF NOT EXISTS `bookedstatus` (
  `bookedstatusid` varchar(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `bookedstatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`bookedstatusid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `bookingid` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lastname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phonenumber` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address1` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pincode` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `checkin` datetime DEFAULT NULL,
  `checkout` datetime DEFAULT NULL,
  `acheckin` datetime DEFAULT NULL,
  `adults` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `child` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `childage` varchar(250) DEFAULT '0',
  `roomtype` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `roomid` varchar(250) DEFAULT '0',
  `noofdays` varchar(250) DEFAULT '0',
  `price` int DEFAULT NULL,
  `tax` int DEFAULT NULL,
  `totalprice` int DEFAULT NULL,
  `bookedstatusid` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `verificationstatus` varchar(250) DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`bookingid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.bookroom
CREATE TABLE IF NOT EXISTS `bookroom` (
  `bookingid` int NOT NULL AUTO_INCREMENT,
  `roomno` int NOT NULL DEFAULT '0',
  `noofbhk` varchar(50) NOT NULL DEFAULT '0',
  `ac` bit(1) NOT NULL DEFAULT (0),
  `breakfast` bit(1) NOT NULL DEFAULT (0),
  `extrabed` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`bookingid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.childdetail
CREATE TABLE IF NOT EXISTS `childdetail` (
  `childdetailid` int NOT NULL AUTO_INCREMENT,
  `bookingid` int NOT NULL DEFAULT '0',
  `userid` int NOT NULL DEFAULT '0',
  `childname` varchar(100) NOT NULL DEFAULT '0',
  `childage` int NOT NULL DEFAULT (0),
  `status` tinyint NOT NULL DEFAULT (0),
  PRIMARY KEY (`childdetailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.extrabill
CREATE TABLE IF NOT EXISTS `extrabill` (
  `extrabillid` int NOT NULL AUTO_INCREMENT,
  `bookingid` varchar(50) NOT NULL DEFAULT '0',
  `extrabillno` varchar(50) NOT NULL DEFAULT '0',
  `purchaseitem` varchar(50) NOT NULL DEFAULT '0',
  `price` varchar(50) NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`extrabillid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.facilitycategory
CREATE TABLE IF NOT EXISTS `facilitycategory` (
  `facilitycategoryid` int NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`facilitycategoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.facilitycategorymap
CREATE TABLE IF NOT EXISTS `facilitycategorymap` (
  `fcmapid` int NOT NULL AUTO_INCREMENT,
  `facilityid` int unsigned DEFAULT NULL,
  `facilitycategoryid` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`fcmapid`),
  KEY `FK_facilitycategorymap_facilitycharges` (`facilityid`),
  KEY `FK_facilitycategorymap_facilitycategory` (`facilitycategoryid`),
  CONSTRAINT `FK_facilitycategorymap_facilitycategory` FOREIGN KEY (`facilitycategoryid`) REFERENCES `facilitycategory` (`facilitycategoryid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.facilitycharges
CREATE TABLE IF NOT EXISTS `facilitycharges` (
  `facilityid` int NOT NULL AUTO_INCREMENT,
  `facilityname` varchar(50) NOT NULL DEFAULT '0',
  `facilitycategory` varchar(50) DEFAULT NULL,
  `charges` int NOT NULL DEFAULT '0',
  `quantity` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`facilityid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for procedure acco.findcolor
DELIMITER //
CREATE PROCEDURE `findcolor`(
	IN `cdate` VARCHAR(50),
	IN `checkindate` VARCHAR(50),
	IN `actualcheckindate` VARCHAR(50),
	OUT `color` VARCHAR(50)
)
BEGIN

SET color='Blue';

if actualcheckindate > '0000-00-00 00:00:00' then
SET color='Green';
END if;

/*SELECT actualcheckindate,@color,actualcheckindate > '0000-00-00 00:00:00';*/
END//
DELIMITER ;

-- Dumping structure for table acco.floor
CREATE TABLE IF NOT EXISTS `floor` (
  `flid` int NOT NULL AUTO_INCREMENT,
  `floornumber` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`flid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.floorroommapping
CREATE TABLE IF NOT EXISTS `floorroommapping` (
  `floorid` int NOT NULL AUTO_INCREMENT,
  `floornumber` varchar(50) DEFAULT NULL,
  `noofbhk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `roomno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `availablitystatus` varchar(50) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`floorid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.fooditem
CREATE TABLE IF NOT EXISTS `fooditem` (
  `fooditemid` int NOT NULL AUTO_INCREMENT,
  `fooditemname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `foodcategory` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `avilabletime` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` float NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`fooditemid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

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
	DECLARE cur1 CURSOR FOR SELECT bookingid, acheckin, checkin FROM booking where checkin LIKE concat(cdate,'%');
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
		DROP TEMPORARY TABLE IF EXISTS temp_table;
CREATE TEMPORARY TABLE IF NOT EXISTS temp_table
(
	`bookingid` int ,
  `userid` int ,
  `firstname` varchar(50) ,
  `lastname` varchar(250) ,
  `email` varchar(250) ,
  `phonenumber` varchar(250),
  `address1` varchar(250) ,
  `address2` varchar(250) ,
  `city` varchar(250) ,
  `state` varchar(250),
  `country` varchar(250),
  `pincode` varchar(250) ,
  `checkin` datetime ,
  `checkout` datetime,
  `acheckin` datetime ,
  `adults` varchar(250),
  `child` varchar(250) ,
  `roomtype` varchar(250),
  `roomid` varchar(250) ,
  `noofdays` varchar(250),
  `price` float ,
  `tax` float ,
  `totalprice` float ,
  `bookedstatusid` varchar(250),
  `verificationstatus` varchar(250),
  `status` tinyint ,
 	`color` TEXT,
 	PRIMARY KEY (`bookingid`) USING BTREE
 	 );
	
	
SET @Comma = ', ';
SET @Count = 0;
/*SET GLOBAL log_bin_trust_function_creators = "1";*/
OPEN cur1;
   read_loop: LOOP
	    FETCH cur1 INTO bookId, actualCheckin, bookedCheckin;
			call findcolor(cdate,bookedCheckin,actualCheckin,@color);
			select count(*) into @Count from temp_table where bookingid =bookId;
			if (@Count=0) then
					
				INSERT INTO temp_table ( `bookingid`,  `userid`,  `firstname` ,  `lastname` ,  `email` ,  `phonenumber` ,
				  `address1` ,  `address2`,  `city` ,  `state` ,  `country`,  `pincode` ,  `checkin` ,  `checkout` ,  `acheckin` ,
				  `adults` ,  `child` ,  `roomtype`,  `roomid` ,  `noofdays`,  `price` ,   `tax` ,  `totalprice`,  `bookedstatusid` ,
				  `verificationstatus`,  `status`, 	`color`) (select *,  @color from booking where bookingid = bookId);
			END IF;
			
	 IF done THEN
      LEAVE read_loop;
    END IF;
  END LOOP;
  CLOSE cur1;
SELECT * from temp_table;
SELECT bookingid, acheckin, checkin FROM booking where checkin LIKE concat(cdate,'%');
DROP TEMPORARY TABLE IF EXISTS temp_table;
END//
DELIMITER ;

-- Dumping structure for table acco.idproof
CREATE TABLE IF NOT EXISTS `idproof` (
  `proofid` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL DEFAULT '0',
  `proofname` varchar(100) NOT NULL DEFAULT '0',
  `proofurl` varchar(100) NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`proofid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.logindetail
CREATE TABLE IF NOT EXISTS `logindetail` (
  `logindetailid` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL DEFAULT '0',
  `username` varchar(250) NOT NULL DEFAULT '0',
  `logindatetime` datetime DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT (0),
  PRIMARY KEY (`logindetailid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.otpstore
CREATE TABLE IF NOT EXISTS `otpstore` (
  `otpid` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(100) DEFAULT NULL,
  `otp` varchar(50) DEFAULT NULL,
  `otptype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `otpctime` datetime DEFAULT NULL,
  `otpetime` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`otpid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.placetovisit
CREATE TABLE IF NOT EXISTS `placetovisit` (
  `placeid` int NOT NULL AUTO_INCREMENT,
  `location` varchar(500) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `distancefromhotel` varchar(500) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `state` varchar(500) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `duration` varchar(500) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `hints` varchar(500) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `detail` longtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `img1` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `img2` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `img3` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `img4` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `img5` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`placeid`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.role
CREATE TABLE IF NOT EXISTS `role` (
  `roleid` int NOT NULL AUTO_INCREMENT,
  `rolename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.room
CREATE TABLE IF NOT EXISTS `room` (
  `roomid` varchar(50) NOT NULL,
  `roomname` varchar(50) DEFAULT NULL,
  `roomno` int DEFAULT NULL,
  `groupid` varchar(50) DEFAULT NULL,
  `basecount` int DEFAULT NULL,
  `rtype` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `roomsize` int DEFAULT NULL,
  `desc` varchar(50) DEFAULT NULL,
  `roomsplit` tinyint DEFAULT NULL,
  `internet` tinyint NOT NULL DEFAULT '0',
  `geyser` tinyint NOT NULL DEFAULT '0',
  `ac` tinyint NOT NULL DEFAULT '0',
  `smoking` tinyint NOT NULL DEFAULT '0',
  `pets` tinyint NOT NULL DEFAULT '0',
  `alcohol` tinyint NOT NULL DEFAULT '0',
  `family` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.roomgroup
CREATE TABLE IF NOT EXISTS `roomgroup` (
  `groupid` varchar(50) NOT NULL,
  `groupname` varchar(50) DEFAULT NULL,
  `numberofrooms` int DEFAULT NULL,
  `roomtype` varchar(50) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.roomtype
CREATE TABLE IF NOT EXISTS `roomtype` (
  `roomtypeid` int NOT NULL AUTO_INCREMENT,
  `roomcategory` varchar(50) NOT NULL DEFAULT '0',
  `roomcount` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`roomtypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.user
CREATE TABLE IF NOT EXISTS `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pincode` varchar(250) DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `phonenumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `imageurl` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `idproof` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `cpassword` varchar(100) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table acco.userrolemap
CREATE TABLE IF NOT EXISTS `userrolemap` (
  `userRoleMapId` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL DEFAULT '0',
  `roleid` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`userRoleMapId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
