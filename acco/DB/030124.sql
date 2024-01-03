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

-- Dumping data for table acco.bookedstatus: ~4 rows (approximately)
INSERT INTO `bookedstatus` (`bookedstatusid`, `bookedstatus`) VALUES
	('1', 'Booked'),
	('2', 'CancleBooked'),
	('3', 'UpdateBooked'),
	('4', 'completed');

-- Dumping structure for table acco.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `bookingid` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `modeoftypeid` int DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.booking: ~9 rows (approximately)
INSERT INTO `booking` (`bookingid`, `userid`, `modeoftypeid`, `firstname`, `lastname`, `email`, `phonenumber`, `address1`, `address2`, `city`, `state`, `country`, `pincode`, `checkin`, `checkout`, `acheckin`, `adults`, `child`, `childage`, `roomtype`, `roomid`, `noofdays`, `price`, `tax`, `totalprice`, `bookedstatusid`, `verificationstatus`, `status`) VALUES
	(23, 10, 1, 'Arjun', 'Test1', 'muthu@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2023-12-27 03:00:00', '2023-12-28 04:00:00', NULL, '2', '1', '0', 'Service Apartments', '4', '1', 2899, NULL, 2899, '1', 'Checked', 1),
	(24, 10, 1, 'Arjun', 'Test1', 'muthu@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2023-12-27 03:00:00', '2023-12-28 04:00:00', NULL, '2', '1', '0', 'Service Apartments', '4', '1', 2899, NULL, 2899, '1', 'Checked', 1),
	(25, 10, 1, 'Arjun', 'Test1', 'muthu@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2023-12-27 03:00:00', '2023-12-28 04:00:00', NULL, '2', '1', '0', 'Service Apartments', '4', '1', 2899, NULL, 2899, '1', 'Checked', 1),
	(26, 10, 1, 'Arjun', 'Test1', 'muthu@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2023-12-27 03:00:00', '2023-12-28 04:00:00', NULL, '2', '1', '0', 'Service Apartments', '4', '1', 2899, NULL, 2899, '1', 'Checked', 1),
	(27, 10, 1, 'Arjun', 'Test1', 'muthu@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2023-12-27 03:00:00', '2023-12-28 04:00:00', NULL, '2', '3', '0', 'Service Apartments', '4', '1', 2899, NULL, 2899, '1', 'Checked', 1),
	(29, 10, 1, 'Arjun', 'Test1', 'muthu@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2023-12-27 03:00:00', '2023-12-28 04:00:00', NULL, '2', '3', '6,8,9', 'Service Apartments', '4', '1', 2899, NULL, 2899, '1', 'Checked', 1),
	(30, 7, 1, 'Tamil', 'Test1', 'tamil@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2023-12-28 03:00:00', '2023-12-29 04:00:00', NULL, '2', '3', '5,8,9', 'Service Apartments', '4', '1', 2899, NULL, 2899, '1', 'Checked', 1);

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

-- Dumping data for table acco.bookroom: ~0 rows (approximately)
INSERT INTO `bookroom` (`bookingid`, `roomno`, `noofbhk`, `ac`, `breakfast`, `extrabed`) VALUES
	(1, 101, '2bhk', b'1', b'0', 0);

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

-- Dumping data for table acco.childdetail: ~0 rows (approximately)

-- Dumping structure for table acco.ebreading
CREATE TABLE IF NOT EXISTS `ebreading` (
  `ebreadingid` int NOT NULL AUTO_INCREMENT,
  `bookingid` int NOT NULL DEFAULT '0',
  `openinguint` double DEFAULT (0),
  `closingunit` double DEFAULT (0),
  `totalunit` double DEFAULT '0',
  `price` double DEFAULT '0',
  `totalamount` double DEFAULT '0',
  `openingdate` datetime DEFAULT (0),
  `closingingdate` datetime DEFAULT (0),
  PRIMARY KEY (`ebreadingid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.ebreading: ~0 rows (approximately)
INSERT INTO `ebreading` (`ebreadingid`, `bookingid`, `openinguint`, `closingunit`, `totalunit`, `price`, `totalamount`, `openingdate`, `closingingdate`) VALUES
	(1, 30, 100, 200, 100, 15, 1500, '2023-12-03 23:00:00', '2024-01-03 00:00:00');

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

-- Dumping data for table acco.extrabill: ~0 rows (approximately)

-- Dumping structure for table acco.facilitycategory
CREATE TABLE IF NOT EXISTS `facilitycategory` (
  `facilitycategoryid` int NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`facilitycategoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.facilitycategory: ~7 rows (approximately)
INSERT INTO `facilitycategory` (`facilitycategoryid`, `categoryname`) VALUES
	(1, 'Living Area'),
	(2, 'Media And Technology'),
	(3, 'Bathroom'),
	(4, 'Room Amenities'),
	(5, 'Reception Services'),
	(6, 'Miscellaneous'),
	(7, 'Charged Amenities');

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

-- Dumping data for table acco.facilitycategorymap: ~0 rows (approximately)

-- Dumping structure for table acco.facilitycharges
CREATE TABLE IF NOT EXISTS `facilitycharges` (
  `facilityid` int NOT NULL AUTO_INCREMENT,
  `roomtypeid` int NOT NULL DEFAULT '0',
  `facilityname` varchar(50) NOT NULL DEFAULT '0',
  `facilitycategory` varchar(50) DEFAULT NULL,
  `charges` int NOT NULL DEFAULT '0',
  `quantity` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`facilityid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.facilitycharges: ~22 rows (approximately)
INSERT INTO `facilitycharges` (`facilityid`, `roomtypeid`, `facilityname`, `facilitycategory`, `charges`, `quantity`, `status`) VALUES
	(1, 3, 'EB', 'Charge', 15, 1, 1),
	(2, 1, 'ExtraBed', 'Charged Amenities', 299, 1, 1),
	(3, 3, 'ExtraBed', 'Charged Amenities', 3000, 1, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.floor: ~3 rows (approximately)
INSERT INTO `floor` (`flid`, `floornumber`) VALUES
	(1, 'FirstFloor'),
	(2, 'SecondFloor'),
	(3, 'ThirdFloor'),
	(4, 'GroundFloor');

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

-- Dumping data for table acco.floorroommapping: ~12 rows (approximately)
INSERT INTO `floorroommapping` (`floorid`, `floornumber`, `noofbhk`, `roomno`, `availablitystatus`, `status`) VALUES
	(1, '1', '2bhk', '101', NULL, 1),
	(2, '1', '2bhk', '102', NULL, 1),
	(3, '1', '2bhk', '103', NULL, 1),
	(4, '1', '3bhk', '104', NULL, 1),
	(5, '2', '2bhk', '202', NULL, 1),
	(6, '2', '2bhk', '201', NULL, 1),
	(7, '2', '2bhk', '203', NULL, 1),
	(8, '2', '3bhk', '204', NULL, 1),
	(9, '3', '2bhk', '301', NULL, 1),
	(10, '3', '2bhk', '302', NULL, 1),
	(11, '3', '2bhk', '303', NULL, 1),
	(12, '3', '3bhk', '304', NULL, 1);

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

-- Dumping data for table acco.fooditem: ~7 rows (approximately)
INSERT INTO `fooditem` (`fooditemid`, `fooditemname`, `foodcategory`, `avilabletime`, `price`, `status`) VALUES
	(1, 'Tomoto Soup', 'Chinese', '11 to 11', 50, 1),
	(2, 'Idly', 'South Indian', '11 to 11', 30, 1),
	(3, 'Veg Noodles', 'Chinese', '11 to 11', 130, 1),
	(4, 'Veg Fried Rice', 'Chinese', '11 to 11', 120, 1),
	(5, 'Ghee Roast Dosa', 'South Indian', '11 to 11', 90, 1),
	(6, 'Tandoori Roti', 'North Indian', '11 to 11', 120, 1),
	(7, 'Corn Soup', 'Chinese', '11 to 11', 200, 1);

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

-- Dumping data for table acco.idproof: ~0 rows (approximately)

-- Dumping structure for table acco.logindetail
CREATE TABLE IF NOT EXISTS `logindetail` (
  `logindetailid` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL DEFAULT '0',
  `username` varchar(250) NOT NULL DEFAULT '0',
  `logindatetime` datetime DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT (0),
  PRIMARY KEY (`logindetailid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.logindetail: ~16 rows (approximately)
INSERT INTO `logindetail` (`logindetailid`, `userid`, `username`, `logindatetime`, `usertype`, `status`) VALUES
	(3, 8, 'admin', '2023-12-23 17:15:24', 'Admin', 1),
	(4, 7, 'tamil', '2023-12-23 17:15:35', 'Manager', 1),
	(5, 7, 'tamil', '2023-12-23 17:17:56', 'Manager', 1),
	(6, 8, 'admin', '2023-12-23 17:18:05', 'Admin', 1),
	(7, 6, 'muthu', '2023-12-23 17:18:15', 'Customer', 1),
	(8, 7, 'tamil', '2023-12-27 17:45:18', 'Manager', 1),
	(9, 6, 'muthu', '2023-12-28 16:46:22', 'Customer', 1),
	(10, 6, 'muthu', '2023-12-28 16:51:31', 'Customer', 1),
	(11, 6, 'muthu', '2023-12-29 11:14:27', 'Customer', 1),
	(12, 6, 'muthu', '2023-12-29 11:50:01', 'Customer', 1),
	(13, 6, 'muthu', '2023-12-29 12:01:04', 'Customer', 1),
	(14, 6, 'muthu', '2023-12-29 13:31:14', 'Customer', 1),
	(15, 6, 'muthu', '2023-12-29 13:33:58', 'Customer', 1),
	(16, 6, 'muthu', '2023-12-30 11:07:29', 'Customer', 1),
	(17, 6, 'muthu', '2023-12-30 16:36:28', 'Customer', 1),
	(18, 6, 'muthu', '2023-12-30 16:38:36', 'Customer', 1),
	(19, 6, 'muthu', '2023-12-30 16:41:28', 'Customer', 1),
	(20, 6, 'muthu', '2023-12-30 16:42:36', 'Customer', 1);

-- Dumping structure for table acco.modeoftype
CREATE TABLE IF NOT EXISTS `modeoftype` (
  `motid` int NOT NULL AUTO_INCREMENT,
  `motname` varchar(100) NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT (0),
  PRIMARY KEY (`motid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.modeoftype: ~0 rows (approximately)
INSERT INTO `modeoftype` (`motid`, `motname`, `status`) VALUES
	(1, 'online', 1),
	(2, 'walkincurrent', 1),
	(3, 'walkinfuture', 1),
	(4, 'sms/whatsup', 1),
	(5, 'agent', 1),
	(6, 'ota', 1);

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

-- Dumping data for table acco.otpstore: ~0 rows (approximately)
INSERT INTO `otpstore` (`otpid`, `userid`, `name`, `phonenumber`, `otp`, `otptype`, `otpctime`, `otpetime`, `status`) VALUES
	(1, 15, 'devi111', '99999123456', '791727', 'email', '2023-11-30 13:32:03', '2023-11-30 13:42:03', 1);

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

-- Dumping data for table acco.placetovisit: 10 rows
/*!40000 ALTER TABLE `placetovisit` DISABLE KEYS */;
INSERT INTO `placetovisit` (`placeid`, `location`, `distancefromhotel`, `description`, `state`, `duration`, `hints`, `detail`, `img1`, `img2`, `img3`, `img4`, `img5`, `status`) VALUES
	(1, 'Rockfort Temple', '5km', 'Pilgrim', 'Tamilnadu', '15m', 'Religion, Temple', 'The Rock Fort temple stands 83m tall perched atop the rock. The smooth rock was first cut by the Pallavas but it was the Nayaks of Madurai who completed both the temples under the Vijayanagara empire.\r\n\r\n\r\nThe temple is situated at the top of the rock. The temple is mystic in its nature with an awe-inspiring rock architecture. The Ganesh temple is much smaller with an access through steep steps carved on the rock and provides a stunning view of Trichy, Srirangam and the rivers Kaveri andKollidam. Due to its ancient and impressive architecture created by the Pallavas, the temple is maintained by the Archaeological department of India.\r\n\r\n\r\nVibhishana, was the younger brother of the Asura King Ravana who ruled Lanka. Lord Rama in the epic of Ramayana rescues his wife Sita, who was kidnapped and held by Ravana, with the help of Sugriva and Hanuman defeated him. In this war, the moral and truth-abiding brother of Ravana, Vibishana aids Rama in his battle against his brother. Ultimately Rama wins the war and as a token of love, He gifts Vibishana a vigraham (idol for worship) of Lord Ranganatha, a form of Vishnu.\r\nVibhishana, though he supported Rama, was basically an Asura, hence the Devas (who are arch rivals to Asuras as per Hindu mythology) wanted to stop this idea of an Asura taking Lord\'s supreme form to his Kingdom. They request the help of the Remover of obstacles and God of learning, Lord Vinayaka and the Lord accepts the plan. Vibhishana, while on his way back to his Kingdom, goes through Trichi, and wanted to take his bath in the river Kaveri and do his daily rituals. However, he is perplexed as the deity, once kept in land, can never be removed and has to be in that place forever.\r\n\r\n\r\nAs a solution, Vibishana tries to find someone to hold the deity while he was taking bath. He finds the Lord Vinayaka under disguise of a cowherd boy. As per the plan, when Vibishana is fully into water, Vinayaka takes the deity and keeps it firmly in sand, in the banks of kaveri. On seeing this, the angry Vibhishana chases the boy, to punish him, and boy keeps running and climbs over the rock near the Kaveri bank. Vibhishana finally reaches the boy and hits him on the fore-head of little boy who then reveals himself to be Vinayaga. Vibishana immediately apologizes and the Lord gives him his blessings and sends him off to Lanka. This is similar to the story Of Lord Ganesh in Gokarna with Ravana in the same Ramayana period.. Ref Gokarna\r\nThe place on which the Ranganathan deity was kept was later covered in deep forests, due to disuse and after a very long time, it is discovered when a Chola king chasing a parrot finds the deity accidentally. He then establishes the Ranganathaswamy temple, Srirangam as one of the largest temple complexes in the world. Meanwhile, the Pallavas built the Vinayaka temple and the Thayumanaswamy temple, in the rock which Vinayaka uses to escape Vibishana.\r\n', '39795817.jpg', 'Rockfort Temple View.JPG', 'rock-fort-temple.jpg', 'Trichy.jpg', 'india-2006.1155478320.img_9398.jpg', 1),
	(2, 'Rameswaram', '50km', 'Pilgrim, Historical', 'Tamilnadu', '55m', 'Temple,Garden', 'Rameswaram is a town in Ramanathapuram district in the Indian state of Tamil Nadu. It is located on Pamban Islandseparated from mainland India by the Pamban channel and is about 50 kilometres from Mannar Island, Sri Lanka. Pamban Island, also known as Rameswaram Island, is connected to mainland India by the Pamban Bridge. Rameswaram is the terminus of the railway line from Chennai and Madurai. Together with Kashi, it is considered to be one of the holiest places in India to Hindus, and part of the Char Dham pilgrimages. Hence, it is a bustlingpilgrim centre.\r\nIt is situated in the Gulf of Mannar at the very tip of the Indian peninsula. According to legend, this is the place from where Lord Rama built a bridge Ram Setu (also known as Adam\'s Bridge) across the sea to Lanka to rescue his consort Sita from her abductor Ravana. Both the Vaishnavites and Shaivites visit this pilgrimage centre which is known as the Varanasi of the south.\r\nEx-president of India, Dr. A.P.J. Abdul Kalam, hails from a fishing hamlet called Dhanushkodi situated on this island.\r\n\r\nRameswaram is located at 9.28°N 79.3°E.[1] It has an average elevation of 10 metres (32 feet). The religious island is spread in an area of 61.8 square kilometres and happens to be in the shape of a conch. The Ramanatha Swamy Temple occupies major area of Rameshwaram.\r\nThe beach of Rameswaram is famous for its beautiful sea featured with no waves at all. The sea waves rise to a maximum height of 3 cm and the view looks like a very big river. Legend has it that Lord Ram of Ramayana prayed to the sea god to pave the way for Lanka. The sea god granted a boon saying that he will make the sea waves less to aid him in building a rock bridge.\r\n\r\n\r\n', '1_Rameshwaram Temple ceiling.jpg', '18198682.jpg', 'Rameshwaram-5778_6.JPG', 'rameshwaram (1).jpg', 'rameshwaram.jpg', 1),
	(3, 'Pamban', '300km', 'Beaches', 'Tamilnadu', '6.5hrs', 'Bridge,Tour', '', '', '', '', '', '', 1),
	(4, 'Thiruvanaikovil', '300 mtrs', 'Lord Jambugeswarar & goddes Akilandeswari', 'Trichy', '5 mins walk', 'a', 't', '', '', '', '', '', 1),
	(5, 'Srirangam', '2.5 km', 'Pilgrim centre', 'Tamilnadu', '10 mins', 'Pilgrim centre', 'Srirangam is beautiful island surrounded by river Cauvery and Kollidam(tributary of Cauvery). srirangam is 8 miles in length and 4 miles in breadth. The population of Srirangam is about 50 thousands. It is 7 km from Trichy junction and it also has a railway station. The island town is surrounded by 7 walls. Sri Renganatha swami temple is one of the famous vaishnavite temples in India. There are 21 gopurams, the rajagopuram (principal tower) is largest gopuram in south India.  The 72m high, 13-tiered gopuram (towers) was built  in 1987 and dominates the landscape for miles  around,  while  the  remaining  20 Invitation of Tenth year sahasra Deepa (Thousand Lights) Festivals \r\ngopurams were built, between the 14th and 17th centuries.  \r\n\r\nSri Ranganathar Sannathi Timings \r\nViswaroobam seva 06.15 to 07.30 \r\nPooja time - No seva  07.30  to 08.45 \r\nSeva 08.45 to 13.00 \r\nPooja time – No seva  13.00 to 14.00 \r\nSeva 14.00 to  18.00 \r\nPooja time – No seva  18.00 to 18.45 \r\nSeva 18.45 to 21.00 \r\nFree seva  20.00 to 21.00 \r\n', '', '', '', '', '', 1),
	(6, 'madurai', '120 kms', 'meenakshi amman temple', 'tamil nadu', '2.5 hrs ', 'pilgrims', 'its hi-lite are meenakshi amman temple, kalalagar perumal temple, thiruparam kundram, palamuthir cholai', 'images1.jpg', 'images2.jpg', 'images3.jpg', 'images4.jpg', 'images5.jpg', 1),
	(7, 'Mukkombu', '17km', 'Dam', 'Tamilnadu', '45m', 'Tour', 'At the head of the Srirangam Island, there is another dam called Upper Anaicut or Mukkombu which is about  685 m long. Constructed in the 19th century across Kollidam, this dam has been forced into three sections instead of one long stretch because of the shape of the island. This is also good spot for picnics.', 'img2.JPG', '', '', '', '', 1),
	(8, 'Kudumiyanmalai', '25km', 'Siva temple', 'Tamilnadu', '50m', 'Temple,Pligrim', 'The Siva temple here has some interesting inscriptions as well as beautiful sculptures. One of the inscriptions deals with the musical treatise of Mahendravarman Pallava and his experimentation with an eight-stringed instrument called Parivadini. ', 'img3.JPG', '', '', '', '', 1),
	(9, 'Sittannavasal', '58km', 'Jain cave temple', 'Tamilnadu', '1h,15m', 'Temple,Pligrim', 'In this village are the remains of a 2nd century B.C. Jain cave temple. Fresco paintings reminiscent of Ajanta adorn the walls. Many of them are typical of the 9th century Pandyan period and include exquisitely detailed pictures of animals, fish, ducks, people gathering lotuses from a pond and two dancing figures. There are also inscriptions dating back to the 9th and 10th centuries. Fresco paintings from the 7th century can be seen on the ceiling of  Ardhamandapam. There are many pre-historic burial sites around Sittannavasal and among the relics unearthed are burial urns, cists and Kungupatarai.', 'img4.JPG', '', '', '', '', 1),
	(10, 'Thanjavur ', '54km', 'Temple and Museum  ', 'Tamilnadu', '1h,15m', 'Temple,Pilgrim', 'The capital of the imperial Chola dynasty a thousand years ago.  The magnificent Brahadeeswarar temple dedicated to Lord Siva bears witness to the glory of Chola architecture,  sculpture  and  paintings. A  museum  in  the  temple  countyard  has interesting Chola artefacts.The Saraswathi Mahal Palace was started by the Nayaks of Madurai around 1550 AD and completed by the Maratha rulers of Thanjavur. The Palace Library instituted by Maharaja Serfoji has a collection of 30,000 palm leaf manuscripts and many rare European books. The Thanjavur Art Gallery has  priceless  collection  of  bronze  icons and  granite sculptures dating from the  9th century AD. Thanjavur is a good place to shop for Thanjavur Art Plates, handicrafts, handwoven silk, bronze icons, intricately inlaid brass work and bejewelled paintings.', 'img5.JPG', '', '', '', '', 1);
/*!40000 ALTER TABLE `placetovisit` ENABLE KEYS */;

-- Dumping structure for table acco.role
CREATE TABLE IF NOT EXISTS `role` (
  `roleid` int NOT NULL AUTO_INCREMENT,
  `rolename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.role: ~6 rows (approximately)
INSERT INTO `role` (`roleid`, `rolename`, `shortname`, `status`) VALUES
	(1, 'Admin', 'AD', 1),
	(2, 'Manager', 'Ma', 1),
	(3, 'Customer', 'CU', 1),
	(4, 'Supervisor', 'SV', 1),
	(5, 'Front Office Executive', 'FOE', 1),
	(6, 'Room keeper', 'RK', 1);

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

-- Dumping data for table acco.room: ~12 rows (approximately)
INSERT INTO `room` (`roomid`, `roomname`, `roomno`, `groupid`, `basecount`, `rtype`, `price`, `tax`, `roomsize`, `desc`, `roomsplit`, `internet`, `geyser`, `ac`, `smoking`, `pets`, `alcohol`, `family`, `status`) VALUES
	('1', '2BHK', 101, '1', 4, 2, 2899, NULL, 600, 'rooms', 1, 1, 1, 1, 1, 0, 1, 1, 1),
	('10', '2BHK', 304, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 1),
	('11', '2BHK', 401, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 1),
	('12', '2BHK', 402, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 1),
	('2', '2BHK', 102, '1', 4, 2, 2899, NULL, 600, 'rooms', 1, 1, 1, 1, 1, 0, 1, 1, 1),
	('3', '2BHK', 201, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 1),
	('4', '2BHK', 202, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 1),
	('5', '3BHK', 203, '1', 6, 3, 3599, NULL, 900, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 1),
	('6', '2BHK', 204, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 1),
	('7', '2BHK', 301, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 1),
	('8', '2BHK', 302, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 1),
	('9', '3BHK', 303, '1', 6, 3, 3599, NULL, 900, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 1);

-- Dumping structure for table acco.roomgroup
CREATE TABLE IF NOT EXISTS `roomgroup` (
  `groupid` varchar(50) NOT NULL,
  `groupname` varchar(50) DEFAULT NULL,
  `numberofrooms` int DEFAULT NULL,
  `roomtype` varchar(50) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.roomgroup: ~0 rows (approximately)
INSERT INTO `roomgroup` (`groupid`, `groupname`, `numberofrooms`, `roomtype`, `status`) VALUES
	('1', 'Service Apartment', 12, 'deluxe', 1);

-- Dumping structure for table acco.roomtype
CREATE TABLE IF NOT EXISTS `roomtype` (
  `roomtypeid` int NOT NULL AUTO_INCREMENT,
  `roomcategory` varchar(50) NOT NULL DEFAULT '0',
  `roomcount` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`roomtypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.roomtype: ~3 rows (approximately)
INSERT INTO `roomtype` (`roomtypeid`, `roomcategory`, `roomcount`, `status`) VALUES
	(1, 'Service Apartment', 12, 1),
	(2, 'Business Center', 1, 1),
	(3, 'Monthly', 1, 1);

-- Dumping structure for table acco.tariffdetail
CREATE TABLE IF NOT EXISTS `tariffdetail` (
  `tariffid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '0',
  `des` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `roomtypeid` int NOT NULL,
  `price` double(40,2) DEFAULT '0.00',
  `maintenance` double(40,2) DEFAULT '0.00',
  `tax` double(40,2) DEFAULT '0.00',
  `discount` double(40,2) DEFAULT '0.00',
  `totalamount` double(40,2) DEFAULT '0.00',
  `status` tinyint DEFAULT (0),
  PRIMARY KEY (`tariffid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.tariffdetail: ~8 rows (approximately)
INSERT INTO `tariffdetail` (`tariffid`, `name`, `des`, `roomtypeid`, `price`, `maintenance`, `tax`, `discount`, `totalamount`, `status`) VALUES
	(1, 'Single Occupancy', '1 Room given and the other one Locked', 1, 1299.00, 0.00, 0.00, 0.00, 1299.00, 1),
	(2, 'Double occupancy', '1 Room given and the other one Locked', 1, 1599.00, 0.00, 0.00, 0.00, 1599.00, 1),
	(3, 'Triple Occupance ', '1 Room given and the other one Locked', 1, 1898.00, 0.00, 0.00, 0.00, 1898.00, 1),
	(4, '2BHK', '4 Adults + 2 Children ', 1, 2899.00, 0.00, 0.00, 0.00, 2899.00, 1),
	(5, '3BHK', '6 Adults + 3 Children ', 1, 3599.00, 0.00, 0.00, 0.00, 3599.00, 1),
	(6, '1BHK', '1 Room given and the other one Locked', 3, 20000.00, 1500.00, 0.00, 0.00, 21500.00, 1),
	(7, '2BHK', '', 3, 25000.00, 2000.00, 0.00, 0.00, 27000.00, 1),
	(8, '3BHK', '', 3, 30000.00, 2500.00, 0.00, 0.00, 32500.00, 1);

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

-- Dumping data for table acco.user: ~9 rows (approximately)
INSERT INTO `user` (`userid`, `firstname`, `lastname`, `address1`, `address2`, `city`, `state`, `country`, `pincode`, `modifieddate`, `phonenumber`, `email`, `createddate`, `imageurl`, `idproof`, `username`, `password`, `cpassword`, `status`) VALUES
	(6, 'muthu', 'n', '51', 'a', 'namakkal', 'TN', 'India', NULL, '2023-12-06 10:49:20', '9876545667', 'muthu@gmail.com', '2023-11-04 12:05:52', '', '', 'muthu', 'muthu', '$2a$08$xC9avRQUIkksqb1V9GFDEu4OqRgo5JKv5U0xa20uzcaceZEVs2FSu', 1),
	(7, 'tamil', 'selvan', '41', 'a', 'namakkal ', 'TN', 'India', NULL, '2023-12-21 11:53:45', '9940975265', 'tamil@gmail.com', '2023-11-04 13:31:30', '', '', 'tamil', 'tamil', '$2a$08$9Ay1cWr29pOl9CqutbDrG.ZYlmtYJaKHjV/VDS.EQDOuBcUshDZUO', 1),
	(8, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-01 06:57:35', '988408063', 'admin@gmail.com', '2023-11-29 13:02:45', '', '', 'admin', 'admin', NULL, 1),
	(9, 'tamilselvan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-02 10:29:03', '123456', 'tamilselvan@gmail.com', '2023-11-29 13:16:17', '', '', 'tamilselvan', 'tamilselvan', NULL, 1),
	(10, 'arjun', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-02 10:28:57', '99999123456', 'arjun@gmail.com', '2023-11-29 13:26:12', '', '', 'arjun', 'arjun', NULL, 1),
	(11, 'arjun1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-02 10:28:50', '99999123456', 'arjun1@gmail.com', '2023-11-29 13:27:03', '', '', 'arjun1', 'arjun1', NULL, 1),
	(12, 'devi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-02 10:28:43', '99999123456', 'devi@gmail.com', '2023-11-29 13:28:54', '', '', 'devi', 'devi', NULL, 1),
	(16, 'uma', 'b', '41', 'a', 'namakkal ', 'TN', 'India', NULL, '2023-12-06 16:56:54', '9940975265', 'arjunuma@gmail.com', '2023-12-06 22:12:01', '', '', 'uma', '$2a$08$/3tf3imDeLEX78uTA6M01.z/.y9jjv3t/a5TBX.YtZGKNtF2bgUpC', '$2a$08$4M0T5pdCq0Jz3gLcFzasmeIDLOVTdttowaokIMaVjHayaUpa77XfC', 1),
	(17, 'sathish', 'kumar', '41', 'a', 'namakkal', 'TN', 'India', NULL, '2023-12-11 07:12:00', '99409', 'sathish@gmail.com', '2023-12-11 12:42:00', '', '', 'sathish', '$2a$08$qq57Skf/0wj8FT09ykYySesR9H4xkDTi3Dn4zXfs8A6QujQ.RCCJi', '$2a$08$r1ulF77sNwpwuXwiCIO2yuwx19PE009nWeULb1.8tH2fh0RL1nN3S', 1);

-- Dumping structure for table acco.userrolemap
CREATE TABLE IF NOT EXISTS `userrolemap` (
  `userRoleMapId` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL DEFAULT '0',
  `roleid` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`userRoleMapId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.userrolemap: ~7 rows (approximately)
INSERT INTO `userrolemap` (`userRoleMapId`, `userid`, `roleid`, `status`) VALUES
	(18, 7, 2, 1),
	(19, 8, 1, 1),
	(20, 6, 3, 1),
	(21, 12, 3, 1),
	(22, 16, 4, 1),
	(23, 10, 3, 1),
	(24, 17, 4, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
