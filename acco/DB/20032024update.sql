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

-- Dumping structure for table acco.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `bookingid` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `modeoftypeid` int DEFAULT NULL,
  `bhk1count` int DEFAULT NULL,
  `bhk2count` int DEFAULT NULL,
  `bhk3count` int DEFAULT NULL,
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
  `acheckout` datetime DEFAULT NULL,
  `adults` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `child` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `childage` varchar(250) DEFAULT '0',
  `roomtype` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `roomid` varchar(250) DEFAULT '0',
  `roomnos` varchar(250) DEFAULT '0',
  `bed` varchar(250) DEFAULT '0',
  `imageUrl` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `noofdays` varchar(250) DEFAULT '0',
  `price` int DEFAULT NULL,
  `tax` int DEFAULT NULL,
  `totalprice` int DEFAULT NULL,
  `bookedstatusid` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `verificationstatus` varchar(250) DEFAULT '0',
  `clientfeedback` varchar(500) DEFAULT '0',
  `commands` varchar(500) DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`bookingid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.booking: ~19 rows (approximately)
INSERT INTO `booking` (`bookingid`, `userid`, `modeoftypeid`, `bhk1count`, `bhk2count`, `bhk3count`, `firstname`, `lastname`, `email`, `phonenumber`, `address1`, `address2`, `city`, `state`, `country`, `pincode`, `checkin`, `checkout`, `acheckin`, `acheckout`, `adults`, `child`, `childage`, `roomtype`, `roomid`, `roomnos`, `bed`, `imageUrl`, `noofdays`, `price`, `tax`, `totalprice`, `bookedstatusid`, `verificationstatus`, `clientfeedback`, `commands`, `status`) VALUES
	(23, 10, 1, 0, 1, 0, 'Arjun', 'Test1', 'muthu@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2023-12-29 03:00:00', '2023-12-30 04:00:00', NULL, NULL, '2', '1', '0', 'Service Apartments', '3', '0', '0', NULL, '1', 2899, NULL, 2899, '1', 'Checked', '0', '0', 1),
	(24, 10, 1, 0, 1, 0, 'Arjun', 'Test1', 'muthu@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2023-12-29 03:00:00', '2023-12-30 04:00:00', NULL, NULL, '2', '1', '0', 'Service Apartments', '6', '0', '0', NULL, '1', 2899, NULL, 2899, '1', 'Checked', '0', '0', 1),
	(25, 10, 1, 0, 1, 0, 'Arjun', 'Test1', 'muthu@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2024-02-22 12:37:00', '2023-12-28 04:00:00', NULL, NULL, '2', '1', '0', 'Service Apartments', '10,8,9', '201,202,303', '0', NULL, '1', 2899, NULL, 2899, '5', 'Checked', '0', '0', 1),
	(26, 10, 1, 0, 1, 0, 'Arjun', 'Test1', 'muthu@stashook.com', '1', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2024-02-22 16:00:00', '2023-12-28 04:00:00', NULL, NULL, '2', '1', '0', 'Service Apartments', '1,2', '101,102', '0', 'images_1706163210489.jpg', '1', 2899, NULL, 2899, '1', 'Checked', '0', '0', 1),
	(27, 10, 1, 0, 1, 0, 'Arjun', 'Test1', 'muthu@stashook.com', '1', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2024-02-22 14:13:00', '2023-12-28 04:00:00', NULL, NULL, '2', '3', '0', 'Service Apartments', '2', '0', '0', 'images_1704989565170.jpg', '1', 2899, NULL, 2899, '1', 'Checked', '0', '0', 1),
	(29, 10, 1, 0, 0, 1, 'Arjun', 'Test1', 'muthu@stashook.com', '1', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2024-02-22 21:00:00', '2023-12-28 04:00:00', '2024-02-21 21:00:00', NULL, '2', '3', '6,8,9', 'Service Apartments', '5', '0', '0', NULL, '1', 2899, NULL, 2899, '1', 'Checked', '0', '0', 1),
	(30, 7, 1, 0, 1, 0, 'Tamil', 'Test1', 'tamil@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2024-01-13 03:00:01', '2024-01-14 03:00:01', NULL, NULL, '2', '3', '5,8,9', 'Service Apartments', '4', '0', '0', NULL, '1', 2899, NULL, 2899, '1', 'Checked', '0', '0', 1),
	(44, 17, 1, 0, 2, 1, 'sathish', 'Test1', 'sathish@stashook.com', '2', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2024-01-13 03:00:01', '2024-01-14 03:00:01', NULL, NULL, '20', '1', '7', 'Service Apartments', '11', '0', '0', 'images_1706163457607.jpg', '1', 12000, NULL, 12000, '1', 'Checked', '0', '0', 1),
	(45, 10, 1, 0, 0, 0, 'Arjun', 'Test1', 'muthu@stashook.com', '1', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2024-01-13 03:00:01', '2024-01-14 03:00:01', '2024-01-27 15:00:00', NULL, '4', '1', '7', 'Service Apartments', '0', '0', '0', NULL, '1', 2599, NULL, 2599, '1', 'Checked', '0', '0', 1),
	(76, 6, 1, 0, 2, 0, 'MUTHU', 'Test1', 'MUTHU@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2024-03-27 03:00:00', '2024-03-28 04:00:00', '2024-01-18 13:18:51', NULL, '2', '3', '5,8,9', '1', '1,2,5', '203', '0', NULL, '1', 2899, NULL, 2899, '1', 'Checked', '0', '0', 1),
	(77, 17, 1, 0, 8, 0, 'sathish', '0', 'sathish@gmail.com', '99409', '0', '0', '0', '0', '0', '0', '2024-02-27 20:31:00', '2024-02-28 20:31:00', NULL, NULL, '40', '0', '0', '1', '0', '203', '0', NULL, '1', 5198, NULL, 5198, '1', 'undefined', '0', '0', 1),
	(78, 22, 1, 0, 0, 1, 'arasan', '0', 'arasan@gmail.com', '9876545960', '0', '0', '0', '0', '0', '0', '2024-02-27 20:33:00', '2024-02-28 20:33:00', NULL, NULL, '7', '0', '0', '1', '0', '303', '1', NULL, '1', 3898, NULL, 3898, '1', 'undefined', '0', '0', 1),
	(79, 6, 1, 1, 0, 1, 'muthu', '0', 'muthu@gmail.com', '9876545667', '0', '0', '0', '0', '0', '0', '2024-02-27 19:33:00', '2024-02-28 19:33:00', NULL, NULL, '10', '0', '0', '1', '0', '0', '0', NULL, '1', 3599, NULL, 3599, '2', 'undefined', '0', '0', 1),
	(80, 6, 1, 0, 1, 0, 'muthu', '0', 'muthu@gmail.com', '9876545667', '0', '0', '0', '0', '0', '0', '2024-03-11 16:29:00', '2024-03-12 11:29:00', NULL, '2024-03-15 15:00:00', '3', '0', '0', '1', '0', '0', '1', 'images_1710249086699.jpg', '0.7916666666666666', 1502, NULL, 1502, '4', 'undefined', '0', '0', 1),
	(81, 24, 1, 1, 0, 0, 'tiger', 'lion', 'tiger@gmail.com', '8877665544', 'forest', 'chennai', 'Chennai', 'Tamil Nadu', 'India', '600001', '2024-03-19 12:58:00', '2024-03-20 12:58:00', '2024-03-18 13:53:34', NULL, '2', '1', '3', '1', '1', '0', '0', '', '1', 1599, NULL, 1599, '2', 'undefined', '0', '0', 1),
	(82, 24, 1, 0, 1, 0, 'tiger', 'lion', 'tiger@gmail.com', '8877665544', 'forest', 'chennai', 'Chennai', 'Tamil Nadu', 'India', '600001', '2024-03-20 13:54:00', '2024-03-21 13:54:00', '2024-03-18 13:56:44', NULL, '3', '0', '0', '1', '2', '0', '1', NULL, '1', 1898, NULL, 1898, '1', 'undefined', '0', '0', 1),
	(83, 24, 1, 0, 2, 0, 'tiger', 'lion', 'tiger@gmail.com', '8877665544', 'forest', 'chennai', 'Chennai', 'Tamil Nadu', 'India', '600001', '2024-03-20 20:54:00', '2024-03-22 20:54:00', '2024-03-18 20:55:47', '2024-03-15 21:21:21', '7', '0', '0', '1', '4,3', '0', '0', NULL, '2', 11596, NULL, 11596, '2', 'undefined', '0', '0', 1),
	(84, 24, 1, 0, 1, 0, 'tiger', 'lion', 'tiger@gmail.com', '8877665544', 'forest', 'chennai', 'Chennai', 'Tamil Nadu', 'India', '600001', '2024-03-29 11:42:00', '2024-03-30 11:42:00', NULL, NULL, '5', '0', '0', '1', '0', '0', '1', 'image.jpg', '1', 3198, NULL, 3198, '1', 'undefined', '0', '0', 1),
	(85, 24, 1, 1, 0, 1, 'tiger', 'lion', 'tiger@gmail.com', '8877665544', 'forest', 'chennai', 'Chennai', 'Tamil Nadu', 'India', '600001', '2024-03-30 11:48:00', '2024-03-31 11:48:00', NULL, NULL, '9', '0', '0', '1', '0', '0', '1', 'image.jpg', '1', 5497, NULL, 5497, '1', 'undefined', '0', '0', 1);

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

-- Dumping data for table acco.bookroom: ~1 rows (approximately)
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

-- Dumping structure for table acco.contactus
CREATE TABLE IF NOT EXISTS `contactus` (
  `contactusid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '0',
  `phonenumber` varchar(100) NOT NULL DEFAULT '0',
  `city` varchar(100) NOT NULL DEFAULT '0',
  `message` varchar(2000) NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT (1),
  PRIMARY KEY (`contactusid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.contactus: ~2 rows (approximately)
INSERT INTO `contactus` (`contactusid`, `name`, `email`, `phonenumber`, `city`, `message`, `status`) VALUES
	(1, 'Muthalagan', 'muthu@stashook.com', '98876543', 'Namakkal', ' Good Service ', 1),
	(2, 'muthu', 'muthuslm2006@gmail.com', '9884080613', 'Namakkal', 'wsadsadasd', 1);

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

-- Dumping data for table acco.ebreading: ~1 rows (approximately)
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

-- Dumping data for table acco.facilitycharges: ~3 rows (approximately)
INSERT INTO `facilitycharges` (`facilityid`, `roomtypeid`, `facilityname`, `facilitycategory`, `charges`, `quantity`, `status`) VALUES
	(1, 3, 'EB', 'Charge', 15, 1, 1),
	(2, 1, 'ExtraBed', 'Charged Amenities', 299, 1, 1),
	(3, 3, 'ExtraBed', 'Charged Amenities', 3000, 1, 1);

-- Dumping structure for procedure acco.findcolor
DELIMITER //
CREATE PROCEDURE `findcolor`(
	IN `checkindate` VARCHAR(50),
	IN `acheckin` VARCHAR(50),
	OUT `color` VARCHAR(50)
)
BEGIN

SET color='Green';

/*SELECT TIMESTAMPDIFF(second ,'2024-02-21 19:32:00',NOW()),NOW();*/
/*SELECT acheckin IS NOT NULL;*/
if acheckin IS NULL then
 
 

if TIMESTAMPDIFF(second ,checkindate,NOW())> 0 then
SET color='Orange';
END if;


if TIMESTAMPDIFF(second ,checkindate,NOW())> 3600 then
SET color='Red';
END if;

if TIMESTAMPDIFF(second ,checkindate,NOW())<=0 then
SET color='Green';
END if;

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

-- Dumping data for table acco.floor: ~4 rows (approximately)
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

-- Dumping data for table acco.fooditem: ~5 rows (approximately)
INSERT INTO `fooditem` (`fooditemid`, `fooditemname`, `foodcategory`, `avilabletime`, `price`, `status`) VALUES
	(1, 'South Indian Foods', 'Chinese', '11 to 11', 50, 1),
	(2, 'North Indian Foods', 'South Indian', '11 to 11', 30, 1),
	(3, 'Chinese Foods', 'Chinese', '11 to 11', 130, 1),
	(4, 'Beverages like Coffee /Tea / Cool Drinks', 'Chinese', '11 to 11', 120, 1),
	(5, 'Tandoori Items', 'South Indian', '11 to 11', 90, 1);

-- Dumping structure for procedure acco.getguestbookingcancel
DELIMITER //
CREATE PROCEDURE `getguestbookingcancel`(
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
  `modeoftypeid` INT ,
  `bhk1count` INT ,
  `bhk2count` INT ,
  `bhk3count` INT ,
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
  `acheckout` datetime ,
  `adults` varchar(250),
  `child` varchar(250) ,
    `childage` varchar(250) ,
    
  `roomtype` varchar(250),
  `roomid` varchar(250) ,
`roomnos` varchar(250) ,
   `bed` varchar(250),
      `imageUrl` varchar(250),
  `noofdays` varchar(250),

  `price` float ,
  `tax` float ,
  `totalprice` float ,
  `bookedstatusid` varchar(250),
  `verificationstatus` varchar(250),
  `clientfeedback` varchar(250),
  `commands` varchar(250),
  `status` tinyint ,
 	`color` TEXT,
 	PRIMARY KEY (`bookingid`) USING BTREE
 	 );
	

SET @Comma = ', ';
SET @Count = 0;
/* SET @bookedstatusid=1;
SET GLOBAL log_bin_trust_function_creators = "1";*/
OPEN cur1;
   read_loop: LOOP
	    FETCH cur1 INTO bookId, actualCheckin, bookedCheckin;
		/*	call findcolor(cdate,bookedCheckin,actualCheckin,@color);
			*/call findcolor(bookedCheckin,actualCheckin,@color);
		
			select count(*) into @Count from temp_table where bookingid =bookId;
			if (@Count=0) then
					
				INSERT INTO temp_table ( `bookingid`,  `userid`, `modeoftypeid` ,  `bhk1count`,`bhk2count`,`bhk3count`,`firstname` ,  `lastname` ,  `email` ,  `phonenumber` ,
				  `address1` ,  `address2`,  `city` ,  `state` ,  `country`,  `pincode` ,  `checkin` ,  `checkout` ,  `acheckin` ,`acheckout` ,
				  `adults` ,  `child` ,   `childage` ,  `roomtype`,  `roomid` ,   `roomnos` ,  `bed` ,  `imageUrl` ,    `noofdays`,  `price` ,   `tax` ,  `totalprice`,  
				  `bookedstatusid` ,
				  `verificationstatus`,  `status`, 	 `clientfeedback` ,`commands` ,`color`) (select *,  @color from booking where bookingid = bookId);
			END IF;
			
	 IF done THEN
      LEAVE read_loop;
    END IF;
  END LOOP;
  CLOSE cur1;
SELECT * from temp_table WHERE bookedstatusid=2;
/*
SELECT bookingid, acheckin, checkin FROM booking where bookedstatusid=2 and checkin LIKE concat(cdate,'%');
*/DROP TEMPORARY TABLE IF EXISTS temp_table;
END//
DELIMITER ;

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
  `modeoftypeid` INT ,
  `bhk1count` INT ,
  `bhk2count` INT ,
  `bhk3count` INT ,
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
  `acheckout` datetime ,
  `adults` varchar(250),
  `child` varchar(250) ,
    `childage` varchar(250) ,
    
  `roomtype` varchar(250),
  `roomid` varchar(250) ,
`roomnos` varchar(250) ,
   `bed` varchar(250),
      `imageUrl` varchar(250),
  `noofdays` varchar(250),

  `price` float ,
  `tax` float ,
  `totalprice` float ,
  `bookedstatusid` varchar(250),
  `verificationstatus` varchar(250),
 `clientfeedback` varchar(250),
  `commands` varchar(250),

  `status` tinyint ,
 	`color` TEXT,
 	PRIMARY KEY (`bookingid`) USING BTREE
 	 );
	
	
SET @Comma = ', ';
SET @Count = 0;
OPEN cur1;
   read_loop: LOOP
	    FETCH cur1 INTO bookId, actualCheckin, bookedCheckin;
			call findcolor(bookedCheckin,actualCheckin,@color);
			select count(*) into @Count from temp_table where bookingid =bookId;
			if (@Count=0) then
					
				INSERT INTO temp_table ( `bookingid`,  `userid`, `modeoftypeid` ,  `bhk1count`,`bhk2count`,`bhk3count`,`firstname` ,  `lastname` ,  `email` ,  `phonenumber` ,
				  `address1` ,  `address2`,  `city` ,  `state` ,  `country`,  `pincode` ,  `checkin` ,  `checkout` ,  `acheckin` ,`acheckout`,
				  `adults` ,  `child` ,   `childage` ,  `roomtype`,  `roomid` ,   `roomnos` ,  `bed` ,  `imageUrl` ,    `noofdays`,  `price` ,   `tax` ,  `totalprice`,  
				  `bookedstatusid` ,
				  `verificationstatus`,  `status`,`clientfeedback`, `commands`,	`color`) (select *,  @color from booking where bookingid = bookId);
			END IF;
			
	 IF done THEN
      LEAVE read_loop;
    END IF;
  END LOOP;
  CLOSE cur1;
SELECT * from temp_table WHERE bookedstatusid=1;
DROP TEMPORARY TABLE IF EXISTS temp_table;

END//
DELIMITER ;

-- Dumping structure for procedure acco.getroomlist
DELIMITER //
CREATE PROCEDURE `getroomlist`(
	IN `checkin` VARCHAR(50),
	IN `checkout` VARCHAR(50),
	IN `roomtypeid` INT,
	IN `adult` INT
)
BEGIN

	

select name,des,price,maintenance,headcount,totalamount,tax,discount,roomtypeid,
(SELECT sum(bhk2count) AS 2bhk  from booking WHERE (checkin  BETWEEN checkin AND checkout OR checkout BETWEEN checkin AND checkout ) AND '2BHK'=name)
 AS avilable from tariffdetail where roomtypeid=roomtypeid AND (headcount=adult OR headcount>=4);


END//
DELIMITER ;

-- Dumping structure for procedure acco.getroomlistsp
DELIMITER //
CREATE PROCEDURE `getroomlistsp`(
	IN `cin` VARCHAR(50),
	IN `cout` VARCHAR(50),
	IN `rtid` INT,
	IN `adultin` INT
)
BEGIN
   DECLARE done INT DEFAULT FALSE;
   DECLARE roomname1 varchar(50);
	DECLARE avail1  INT;
	DECLARE available  INT;
	DECLARE n INT DEFAULT 0;
	DECLARE i INT DEFAULT 0;
	DECLARE cur1 CURSOR FOR  SELECT roomname, COUNT(roomname) as available FROM room where STATUS=1  GROUP BY roomname;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
		DROP TEMPORARY TABLE IF EXISTS temp_table;
CREATE TEMPORARY TABLE IF NOT EXISTS temp_table
(	name varchar(50),
  des VARCHAR(100),
  price DOUBLE,
  maintenance DOUBLE,
  tax DOUBLE,
  headcount INT, 
  totalamount DOUBLE,
  discount DOUBLE,
  roomtypeid INT,
  avail INT  ,
    PRIMARY KEY (name) USING BTREE
 	 );
	

SET @Comma = ', ';
SET @Count = 0;
SELECT COUNT( distinct roomname) FROM room where STATUS=1  INTO n;
SET i=1;
/*SET GLOBAL log_bin_trust_function_creators = "1";*/
OPEN cur1;
   read_loop: LOOP
	    FETCH cur1 INTO roomname1, avail1;
	    

		if(roomname1 ='2BHK') then 
		INSERT INTO temp_table SELECT name,des,price,maintenance,tax,headcount,totalamount,discount,roomtypeid, (avail1 -
			(SELECT IFNULL(sum(bhk2count),0)  from booking WHERE (checkin  BETWEEN cin AND cout OR checkout BETWEEN cin AND cout ) )  )
			from tariffdetail where roomtypeid=rtid AND  (headcount=adultin OR headcount=4);

		elseif (roomname1 ='3BHK') then 
				INSERT INTO temp_table SELECT name,des,price,maintenance,tax,headcount,totalamount,discount,roomtypeid, (avail1 -
			(SELECT IFNULL(sum(bhk3count),0)  from booking WHERE (checkin  BETWEEN cin AND cout OR checkout BETWEEN cin AND cout ) )  )
			from tariffdetail where roomtypeid=rtid AND NAME='3BHK';
		End IF;	
	IF i>=n or done THEN
      LEAVE read_loop;
    END IF;
    SET i = i + 1;
  END LOOP;
  CLOSE cur1;
SELECT * from temp_table;
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

-- Dumping structure for table acco.invoicedata
CREATE TABLE IF NOT EXISTS `invoicedata` (
  `invoicedataid` int NOT NULL AUTO_INCREMENT,
  `bookingid` int NOT NULL DEFAULT '0',
  `data` json NOT NULL,
  `status` tinyint DEFAULT (1),
  PRIMARY KEY (`invoicedataid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.invoicedata: ~1 rows (approximately)
INSERT INTO `invoicedata` (`invoicedataid`, `bookingid`, `data`, `status`) VALUES
	(1, 84, '[{"bed": "1", "tax": null, "city": "Chennai", "child": "0", "email": "tiger@gmail.com", "price": 3198, "state": "Tamil Nadu", "adults": "5", "roomid": "0", "roomno": null, "status": 1, "userid": 24, "checkin": "2024-03-29T06:12:00.000Z", "country": "India", "pincode": "600001", "roomnos": "0", "acheckin": null, "address1": "forest", "address2": "chennai", "checkout": "2024-03-30T06:12:00.000Z", "childage": "0", "commands": "0", "imageUrl": "image.jpg", "lastname": "lion", "noofdays": "1", "roomname": null, "roomtype": "1", "acheckout": null, "bhk1count": 0, "bhk2count": 1, "bhk3count": 0, "bookingid": 84, "firstname": "tiger", "totalprice": 3198, "phonenumber": "8877665544", "modeoftypeid": 1, "bookedstatusid": "1", "clientfeedback": "0", "verificationstatus": "undefined"}]', 1);

-- Dumping structure for table acco.logic
CREATE TABLE IF NOT EXISTS `logic` (
  `logicid` int NOT NULL AUTO_INCREMENT,
  `adult` int DEFAULT '0',
  `optiontype` varchar(50) DEFAULT NULL,
  `bhktype1` int DEFAULT NULL,
  `bhktype2` int DEFAULT NULL,
  `bhktype3` int DEFAULT NULL,
  `noofrooms` int DEFAULT NULL,
  `bed` double DEFAULT '0',
  `Price` double DEFAULT '0',
  `totalamount` double DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  PRIMARY KEY (`logicid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.logic: ~42 rows (approximately)
INSERT INTO `logic` (`logicid`, `adult`, `optiontype`, `bhktype1`, `bhktype2`, `bhktype3`, `noofrooms`, `bed`, `Price`, `totalamount`, `status`) VALUES
	(1, 1, 'R1', 1, 0, 0, 1, 0, 1299, 1299, 1),
	(2, 1, 'O1', 0, 1, 0, 2, 0, 2899, 2899, 1),
	(3, 2, 'R1', 1, 0, 0, 1, 0, 1599, 1599, 1),
	(4, 2, 'O1', 0, 1, 0, 2, 0, 2899, 2899, 1),
	(5, 3, 'R1', 0, 1, 0, 1, 1, 1898, 1898, 1),
	(6, 3, 'O1', 0, 2, 0, 2, 0, 2899, 2899, 1),
	(7, 3, 'O2', 0, 0, 1, 3, 0, 3599, 3599, 1),
	(8, 4, 'R1', 0, 1, 0, 2, 0, 2899, 2899, 1),
	(9, 4, 'O1', 0, 0, 1, 3, 0, 3599, 3599, 1),
	(10, 5, 'R1', 0, 1, 0, 2, 1, 3198, 3198, 1),
	(11, 5, 'O1', 0, 0, 1, 3, 0, 3599, 3599, 1),
	(12, 6, 'R1', 0, 0, 1, 3, 0, 3599, 3599, 1),
	(13, 6, 'R2', 1, 1, 0, 3, 0, 4998, 4998, 1),
	(14, 6, 'O1', 0, 2, 0, 4, 0, 5798, 5798, 1),
	(15, 7, 'R1', 0, 0, 1, 3, 1, 3898, 3898, 1),
	(16, 7, 'R2', 1, 1, 0, 3, 1, 4497, 4497, 1),
	(17, 7, 'O1', 1, 0, 1, 4, 0, 4898, 4898, 1),
	(18, 7, 'O2', 0, 2, 0, 4, 0, 5798, 5798, 1),
	(19, 8, 'R1', 1, 0, 1, 4, 0, 5198, 5198, 1),
	(20, 8, 'R2', 0, 2, 0, 4, 0, 5798, 5798, 1),
	(21, 8, 'O1', 0, 1, 1, 5, 0, 6498, 6498, 1),
	(22, 8, 'O2', 0, 3, 0, 6, 0, 8697, 8697, 1),
	(23, 9, 'R1', 1, 0, 1, 4, 1, 5497, 5497, 1),
	(24, 9, 'R2', 0, 2, 0, 4, 1, 6097, 6097, 1),
	(25, 9, 'O1', 0, 1, 1, 5, 0, 6498, 6498, 1),
	(26, 9, 'O2', 1, 2, 0, 5, 0, 7097, 7097, 1),
	(27, 10, 'R1', 0, 1, 1, 5, 0, 6498, 6498, 1),
	(28, 10, 'R2', 1, 2, 0, 5, 0, 7397, 7397, 1),
	(29, 10, 'O1', 1, 1, 1, 6, 0, 7797, 7797, 1),
	(30, 10, 'O2', 0, 3, 0, 6, 0, 8697, 8697, 1),
	(31, 11, 'R1', 0, 1, 1, 5, 1, 6097, 6097, 1),
	(32, 11, 'R2', 1, 2, 0, 5, 1, 7696, 7696, 1),
	(33, 11, 'O1', 1, 1, 1, 6, 0, 8097, 8097, 1),
	(34, 11, 'O2', 0, 3, 0, 6, 0, 8697, 8697, 1),
	(35, 12, 'R1', 1, 1, 1, 6, 0, 8097, 8097, 1),
	(36, 12, 'R2', 1, 2, 0, 5, 1, 7696, 7697, 1),
	(37, 12, 'O1', 1, 1, 1, 6, 0, 8097, 8097, 1),
	(38, 12, 'O2', 0, 3, 0, 6, 0, 8697, 8697, 1),
	(39, 13, 'R1', 0, 2, 1, 7, 0, 9397, 9397, 1),
	(40, 13, 'O1', 0, 2, 1, 7, 1, 9697, 9697, 1),
	(41, 14, 'R1', 1, 2, 1, 7, 0, 10696, 10696, 1),
	(42, 14, 'O1', 1, 2, 1, 7, 1, 10996, 10996, 1);

-- Dumping structure for table acco.logindetail
CREATE TABLE IF NOT EXISTS `logindetail` (
  `logindetailid` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL DEFAULT '0',
  `username` varchar(250) NOT NULL DEFAULT '0',
  `logindatetime` datetime DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT (0),
  PRIMARY KEY (`logindetailid`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.logindetail: ~130 rows (approximately)
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
	(20, 6, 'muthu', '2023-12-30 16:42:36', 'Customer', 1),
	(21, 6, 'muthu', '2024-01-03 22:14:18', 'Customer', 1),
	(22, 7, 'tamil', '2024-01-08 20:23:16', 'Manager', 1),
	(23, 17, 'sathish', '2024-01-08 20:25:56', 'Customer', 1),
	(24, 17, 'sathish', '2024-01-08 20:52:37', 'Customer', 1),
	(25, 7, 'tamil', '2024-01-08 20:58:44', 'Manager', 1),
	(26, 8, 'admin', '2024-01-08 20:59:20', 'Admin', 1),
	(27, 8, 'admin', '2024-01-08 20:59:33', 'Admin', 1),
	(28, 8, 'admin', '2024-01-08 21:00:09', 'Admin', 1),
	(29, 8, 'admin', '2024-01-08 21:00:30', 'Admin', 1),
	(30, 7, 'tamil', '2024-01-08 21:31:18', 'Manager', 1),
	(31, 16, 'uma', '2024-01-09 16:54:15', 'Customer', 1),
	(32, 16, 'uma', '2024-01-09 16:54:15', 'FrontOfficeExecutive', 1),
	(33, 16, 'uma', '2024-01-09 16:58:30', 'FrontOfficeExecutive', 1),
	(34, 7, 'tamil', '2024-01-09 16:58:44', 'Manager', 1),
	(35, 6, 'muthu', '2024-01-09 16:59:21', 'Customer', 1),
	(36, 8, 'admin', '2024-01-09 16:59:52', 'Admin', 1),
	(37, 16, 'uma', '2024-01-09 17:23:23', 'FrontOfficeExecutive', 1),
	(38, 6, 'muthu', '2024-01-09 17:25:07', 'Customer', 1),
	(39, 6, 'muthu', '2024-01-09 17:52:31', 'Customer', 1),
	(40, 6, 'muthu', '2024-01-09 17:56:51', 'Customer', 1),
	(41, 6, 'muthu', '2024-01-09 18:00:15', 'Customer', 1),
	(42, 6, 'muthu', '2024-01-09 18:04:11', 'Customer', 1),
	(43, 6, 'muthu', '2024-01-09 18:04:26', 'Customer', 1),
	(44, 6, 'muthu', '2024-01-09 18:05:02', 'Customer', 1),
	(45, 6, 'muthu', '2024-01-09 18:05:35', 'Customer', 1),
	(46, 6, 'muthu', '2024-01-09 18:08:34', 'Customer', 1),
	(47, 6, 'muthu', '2024-01-09 18:14:14', 'Customer', 1),
	(48, 6, 'muthu', '2024-01-09 18:20:13', 'Customer', 1),
	(49, 6, 'muthu', '2024-01-09 18:21:11', 'Customer', 1),
	(50, 6, 'muthu', '2024-01-09 18:21:48', 'Customer', 1),
	(51, 6, 'muthu', '2024-01-09 18:22:11', 'Customer', 1),
	(52, 6, 'muthu', '2024-01-09 18:24:09', 'Customer', 1),
	(53, 6, 'muthu', '2024-01-09 18:31:35', 'Customer', 1),
	(54, 6, 'muthu', '2024-01-20 14:11:40', 'Customer', 1),
	(55, 8, 'admin', '2024-01-20 14:11:56', 'Admin', 1),
	(56, 7, 'tamil', '2024-01-20 14:12:28', 'Manager', 1),
	(57, 6, 'muthu', '2024-01-20 14:12:46', 'Customer', 1),
	(58, 6, 'muthu', '2024-01-26 17:01:03', 'Customer', 1),
	(59, 6, 'muthu', '2024-01-26 17:06:16', 'Customer', 1),
	(60, 8, 'admin', '2024-02-06 17:56:56', 'Admin', 1),
	(61, 8, 'admin', '2024-02-06 17:57:07', 'Admin', 1),
	(62, 8, 'admin', '2024-02-06 17:59:41', 'Admin', 1),
	(63, 8, 'admin', '2024-02-06 21:24:28', 'Admin', 1),
	(64, 8, 'admin', '2024-02-06 21:25:50', 'Admin', 1),
	(65, 12, 'devi', '2024-02-06 21:26:26', 'Customer', 1),
	(66, 6, 'muthu', '2024-02-08 22:15:57', 'Customer', 1),
	(67, 7, 'tamil', '2024-02-08 22:16:37', 'Manager', 1),
	(68, 8, 'admin', '2024-02-08 22:16:58', 'Admin', 1),
	(69, 16, 'uma', '2024-02-08 22:17:16', 'FrontOfficeExecutive', 1),
	(70, 16, 'uma', '2024-02-08 22:17:25', 'FrontOfficeExecutive', 1),
	(71, 16, 'uma', '2024-02-08 22:19:23', 'FrontOfficeExecutive', 1),
	(72, 7, 'tamil', '2024-02-08 22:20:10', 'Manager', 1),
	(73, 17, 'sathish', '2024-02-08 22:20:56', 'FrontOfficeExecutive', 1),
	(74, 16, 'uma', '2024-02-26 20:30:21', 'FrontOfficeExecutive', 1),
	(75, 17, 'sathish', '2024-02-26 20:30:40', 'FrontOfficeExecutive', 1),
	(76, 17, 'sathish', '2024-02-26 20:31:25', 'Customer', 1),
	(77, 22, 'arasan', '2024-02-26 20:33:36', 'Customer', 1),
	(78, 22, 'arasan', '2024-02-26 20:35:55', 'Customer', 1),
	(79, 6, 'muthu', '2024-02-26 20:36:44', 'Customer', 1),
	(80, 6, 'muthu', '2024-02-26 20:37:10', 'Customer', 1),
	(81, 6, 'muthu', '2024-02-26 21:54:36', 'Customer', 1),
	(82, 6, 'muthu', '2024-02-27 19:33:07', 'Customer', 1),
	(83, 17, 'sathish', '2024-02-27 19:35:25', 'Customer', 1),
	(84, 6, 'muthu', '2024-02-27 19:35:39', 'Customer', 1),
	(85, 6, 'muthu', '2024-03-08 13:32:19', 'Customer', 1),
	(86, 6, 'muthu', '2024-03-11 11:10:41', 'Customer', 1),
	(87, 16, 'uma', '2024-03-11 11:15:47', 'FrontOfficeExecutive', 1),
	(88, 16, 'uma', '2024-03-11 11:18:04', 'FrontOfficeExecutive', 1),
	(89, 6, 'muthu', '2024-03-11 11:21:35', 'Customer', 1),
	(90, 16, 'uma', '2024-03-11 11:27:33', 'FrontOfficeExecutive', 1),
	(91, 6, 'muthu', '2024-03-11 11:29:15', 'Customer', 1),
	(92, 16, 'uma', '2024-03-11 11:30:46', 'FrontOfficeExecutive', 1),
	(93, 6, 'muthu', '2024-03-11 11:31:42', 'Customer', 1),
	(94, 16, 'uma', '2024-03-11 11:32:25', 'FrontOfficeExecutive', 1),
	(95, 16, 'uma', '2024-03-11 11:33:47', 'FrontOfficeExecutive', 1),
	(96, 6, 'muthu', '2024-03-11 11:58:15', 'Customer', 1),
	(97, 16, 'uma', '2024-03-11 12:04:51', 'FrontOfficeExecutive', 1),
	(98, 6, 'muthu', '2024-03-11 12:08:32', 'Customer', 1),
	(99, 16, 'uma', '2024-03-11 12:19:00', 'FrontOfficeExecutive', 1),
	(100, 16, 'uma', '2024-03-11 13:38:49', 'FrontOfficeExecutive', 1),
	(101, 16, 'uma', '2024-03-11 13:47:41', 'FrontOfficeExecutive', 1),
	(102, 16, 'uma', '2024-03-11 16:53:44', 'FrontOfficeExecutive', 1),
	(103, 16, 'uma', '2024-03-11 17:02:29', 'FrontOfficeExecutive', 1),
	(104, 16, 'uma', '2024-03-11 17:12:51', 'FrontOfficeExecutive', 1),
	(105, 16, 'uma', '2024-03-11 17:15:28', 'FrontOfficeExecutive', 1),
	(106, 16, 'uma', '2024-03-11 17:19:22', 'FrontOfficeExecutive', 1),
	(107, 16, 'uma', '2024-03-12 18:13:54', 'FrontOfficeExecutive', 1),
	(108, 16, 'uma', '2024-03-12 18:17:12', 'FrontOfficeExecutive', 1),
	(109, 16, 'uma', '2024-03-12 18:27:49', 'FrontOfficeExecutive', 1),
	(110, 16, 'uma', '2024-03-12 18:32:54', 'FrontOfficeExecutive', 1),
	(111, 16, 'uma', '2024-03-12 18:33:55', 'FrontOfficeExecutive', 1),
	(112, 16, 'uma', '2024-03-12 18:38:40', 'FrontOfficeExecutive', 1),
	(113, 16, 'uma', '2024-03-12 18:40:21', 'FrontOfficeExecutive', 1),
	(114, 16, 'uma', '2024-03-12 18:41:47', 'FrontOfficeExecutive', 1),
	(115, 6, 'muthu', '2024-03-14 14:31:59', 'Customer', 1),
	(116, 16, 'uma', '2024-03-14 14:32:11', 'FrontOfficeExecutive', 1),
	(117, 8, 'admin', '2024-03-14 14:32:26', 'Admin', 1),
	(118, 24, 'tiger', '2024-03-18 12:54:18', 'Customer', 1),
	(119, 24, 'tiger', '2024-03-18 12:56:09', 'Customer', 1),
	(120, 24, 'tiger', '2024-03-18 12:58:03', 'Customer', 1),
	(121, 16, 'uma', '2024-03-18 12:58:51', 'FrontOfficeExecutive', 1),
	(122, 16, 'uma', '2024-03-18 13:10:04', 'FrontOfficeExecutive', 1),
	(123, 16, 'uma', '2024-03-18 13:11:42', 'FrontOfficeExecutive', 1),
	(124, 24, 'tiger', '2024-03-18 13:54:53', 'Customer', 1),
	(125, 16, 'uma', '2024-03-18 13:56:19', 'FrontOfficeExecutive', 1),
	(126, 24, 'tiger', '2024-03-18 20:54:40', 'Customer', 1),
	(127, 16, 'uma', '2024-03-18 20:55:26', 'FrontOfficeExecutive', 1),
	(128, 24, 'tiger', '2024-03-19 11:41:11', 'Customer', 1),
	(129, 16, 'uma', '2024-03-19 11:43:04', 'FrontOfficeExecutive', 1),
	(130, 16, 'uma', '2024-03-19 11:48:04', 'FrontOfficeExecutive', 1),
	(131, 24, 'tiger', '2024-03-19 11:48:16', 'Customer', 1),
	(132, 16, 'uma', '2024-03-19 11:49:40', 'FrontOfficeExecutive', 1);

-- Dumping structure for table acco.maintenance
CREATE TABLE IF NOT EXISTS `maintenance` (
  `maintenanceid` int NOT NULL AUTO_INCREMENT,
  `roomid` int NOT NULL DEFAULT '0',
  `maintenancetypeid` int NOT NULL DEFAULT (0),
  `fromdate` datetime DEFAULT NULL,
  `todate` datetime DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`maintenanceid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.maintenance: ~2 rows (approximately)
INSERT INTO `maintenance` (`maintenanceid`, `roomid`, `maintenancetypeid`, `fromdate`, `todate`, `reason`, `status`) VALUES
	(1, 1, 1, '2024-03-13 15:00:00', '2024-03-14 14:59:59', 'ac not working', 1),
	(2, 2, 1, '2024-03-14 00:00:00', '2024-03-15 00:00:00', 'ac repair', 1);

-- Dumping structure for table acco.maintenancetype
CREATE TABLE IF NOT EXISTS `maintenancetype` (
  `maintenancetypeid` int NOT NULL AUTO_INCREMENT,
  `maintenancetypename` varchar(250) NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT (1),
  PRIMARY KEY (`maintenancetypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.maintenancetype: ~2 rows (approximately)
INSERT INTO `maintenancetype` (`maintenancetypeid`, `maintenancetypename`, `status`) VALUES
	(1, 'electrical work', 1),
	(2, 'housekeeping', 1);

-- Dumping structure for table acco.modeoftype
CREATE TABLE IF NOT EXISTS `modeoftype` (
  `motid` int NOT NULL AUTO_INCREMENT,
  `motname` varchar(100) NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT (0),
  PRIMARY KEY (`motid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.modeoftype: ~6 rows (approximately)
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
  `otp` varchar(50) DEFAULT NULL,
  `otptype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `otpctime` datetime DEFAULT NULL,
  `otpetime` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`otpid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.otpstore: ~4 rows (approximately)
INSERT INTO `otpstore` (`otpid`, `userid`, `name`, `otp`, `otptype`, `otpctime`, `otpetime`, `status`) VALUES
	(1, 19, 'nagam2', '476279', 'email', '2024-02-16 14:07:13', '2024-02-16 14:17:13', 1),
	(4, 22, 'arasan', NULL, NULL, NULL, NULL, 1),
	(5, 23, 'arasan1', '801381', 'email', '2024-02-23 15:08:24', '2024-02-23 15:18:24', 1),
	(6, 24, 'tiger', NULL, 'email', NULL, NULL, 1);

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
	(4, 'FrontOfficeExecutive', 'FOE', 1),
	(5, 'Supervisor', 'SP', 1),
	(6, 'Room keeper', 'RK', 1);

-- Dumping structure for table acco.room
CREATE TABLE IF NOT EXISTS `room` (
  `roomid` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.room: ~12 rows (approximately)
INSERT INTO `room` (`roomid`, `roomname`, `roomno`, `groupid`, `basecount`, `rtype`, `price`, `tax`, `roomsize`, `desc`, `roomsplit`, `internet`, `geyser`, `ac`, `smoking`, `pets`, `alcohol`, `family`, `status`) VALUES
	(1, '2BHK', 101, '1', 4, 2, 2899, NULL, 600, 'rooms', 1, 1, 1, 1, 1, 0, 1, 1, 8),
	(2, '2BHK', 102, '1', 4, 2, 2899, NULL, 600, 'rooms', 1, 1, 1, 1, 1, 0, 1, 1, 8),
	(3, '2BHK', 201, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 10),
	(4, '2BHK', 202, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 10),
	(5, '3BHK', 203, '1', 6, 3, 3599, NULL, 900, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 6),
	(6, '2BHK', 204, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 6),
	(7, '2BHK', 301, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 6),
	(8, '2BHK', 302, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 6),
	(9, '3BHK', 303, '1', 6, 3, 3599, NULL, 900, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 6),
	(10, '2BHK', 304, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 6),
	(11, '2BHK', 401, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 6),
	(12, '2BHK', 402, '1', 4, 2, 2899, NULL, 600, 'rooms', 0, 1, 1, 1, 1, 0, 1, 1, 6);

-- Dumping structure for table acco.roomgroup
CREATE TABLE IF NOT EXISTS `roomgroup` (
  `groupid` varchar(50) NOT NULL,
  `groupname` varchar(50) DEFAULT NULL,
  `numberofrooms` int DEFAULT NULL,
  `roomtype` varchar(50) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.roomgroup: ~1 rows (approximately)
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

-- Dumping structure for procedure acco.spandroomlist
DELIMITER //
CREATE PROCEDURE `spandroomlist`(
	IN `cin` VARCHAR(50),
	IN `cout` VARCHAR(50),
	IN `adultcount` INT
)
BEGIN
SET @bhk2available=0;
SET @bhk3available=0;

SET @bhk2roomcount = 0;
SET @bhk3roomcount = 0;
SET @bookedIds = 0;
SELECT COUNT(*) into @bhk2available FROM room WHERE rtype=2;

SELECT COUNT(*) into @bhk3available FROM room WHERE rtype=3;

SET @SQL_QUERY1 =CONCAT('SELECT (',@bhk2available,'-((if(SUM(bhk1count) IS NULL ,0, SUM(bhk1count)))+(if(SUM(bhk2count) IS NULL ,0, SUM(bhk2count))))) into @bhk2roomcount from booking where   (checkin  BETWEEN  \'',cin ,'\' AND  \'',cout,'\'  OR checkout BETWEEN \'' ,cin,'\'  AND \'', cout,'\')AND bookedstatusid!=2');
/* correct 
SET @SQL_QUERY1 =CONCAT('SELECT (',@bhk2available,'-(if(SUM(bhk2count) IS NULL ,0, SUM(bhk2count)))) into @bhk2roomcount from booking where   (checkin  BETWEEN  \'',cin ,'\' AND  \'',cout,'\'  OR checkout BETWEEN \'' ,cin,'\'  AND \'', cout,'\'  )');
*/
/*(if(SUM(bhk2count) IS NULL ,0, SUM(bhk2count))) into @bhk2roomcount from booking where   (checkin  BETWEEN  \'',cin ,'\' AND  \'',cout,'\'  OR checkout BETWEEN \'' ,cin,'\'  AND \'', cout,'\'  )');
*/
SET @SQL_QUERY2 =CONCAT('SELECT (',@bhk3available,'-(if(SUM(bhk3count) IS NULL ,0, SUM(bhk3count)))) into @bhk3roomcount from booking where   (checkin  BETWEEN  \'',cin ,'\' AND  \'',cout,'\'  OR checkout BETWEEN \'' ,cin,'\'  AND \'', cout,'\'  )AND bookedstatusid!=2');

SELECT  @SQL_QUERY2, @SQL_QUERY1;

	PREPARE stmt3 FROM @SQL_QUERY2;
	EXECUTE stmt3;
	DEALLOCATE PREPARE stmt3;
	
	PREPARE stmt4 FROM @SQL_QUERY1;
	EXECUTE stmt4;
	DEALLOCATE PREPARE stmt4;
/*
SELECT @bhk2roomcount,@bhk3roomcount;
*/
SELECT * FROM logic WHERE adult=adultcount AND bhktype1+bhktype2<=@bhk2roomcount AND bhktype3<=@bhk3roomcount ;
END//
DELIMITER ;

-- Dumping structure for procedure acco.spgetroom
DELIMITER //
CREATE PROCEDURE `spgetroom`(
	IN `cin` VARCHAR(50),
	IN `cout` VARCHAR(50)
)
BEGIN
/*SET @SQL_QUERY = concat(' SELECT GROUP_CONCAT(roomid) into @roomIds from booking WHERE (checkin  BETWEEN \'', cin ,'\' AND \'', cout ,'\' OR checkout BETWEEN \'', cin ,'\' AND \'', cout ,'\' )' );

SELECT @SQL_QUERY;
	PREPARE stmt3 FROM @SQL_QUERY;
	EXECUTE stmt3;
	DEALLOCATE PREPARE stmt3;
	select @roomIds;*/
	SET @roomids = ( SELECT GROUP_CONCAT(roomid) from booking WHERE (checkin  BETWEEN  cin AND  cout  OR checkout BETWEEN  cin  AND  cout  ) );
/*

select COUNT(roomname) AS roomcount,rtype ,price,roomname ,CONCAT(GROUP_CONCAT('{\'',roomid,'\':',roomno,',checked:false','}')) AS roomnos from room where roomid NOT IN (SELECT roomid from booking WHERE (checkin  BETWEEN '2023-10-28' AND '2023-10-29' OR checkout BETWEEN '2023-10-28' AND '2023-10-29')) GROUP BY rtype,price,roomname

*/
/*
SET @SQL_QUERY1 =concat('select COUNT(roomname) AS roomcount,rtype ,price,roomname ,group_concat(JSON_OBJECT(roomid ,roomno))) AS roomnoss,CONCAT(GROUP_CONCAT(roomid)) AS roomid,CONCAT(GROUP_CONCAT(roomno)) AS roomnos from room where roomid NOT IN (',@roomIds,') GROUP BY rtype,price,roomname');

*/
SET @SQL_QUERY1 =concat('select COUNT(roomname) AS roomcount,rtype ,price,roomname ,json_array(GROUP_CONCAT("{",roomid ,":",roomno,"}")) AS roomnoss,json_array(GROUP_CONCAT(roomid)) AS roomid,json_array(GROUP_CONCAT(roomno)) AS roomnos from room where roomid NOT IN (',@roomIds,') GROUP BY rtype,price,roomname');

	PREPARE stmt4 FROM @SQL_QUERY1;
	EXECUTE stmt4;
	DEALLOCATE PREPARE stmt4;
 END//
DELIMITER ;

-- Dumping structure for table acco.status
CREATE TABLE IF NOT EXISTS `status` (
  `statusid` int NOT NULL DEFAULT (0),
  `statusname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `stastustype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`statusid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.status: ~10 rows (approximately)
INSERT INTO `status` (`statusid`, `statusname`, `stastustype`) VALUES
	(1, 'Booked', 'booking'),
	(2, 'CancleBooked', 'booking'),
	(3, 'UpdateBooked', 'booking'),
	(4, 'Housekeeping', 'booking'),
	(5, 'Available', 'booking'),
	(6, 'Available', 'room'),
	(7, 'Housekeeping', 'room'),
	(8, 'OnRepair', 'room'),
	(9, 'Booked', 'room'),
	(10, 'CancleBooked', 'room');

-- Dumping structure for table acco.tariffdetail
CREATE TABLE IF NOT EXISTS `tariffdetail` (
  `tariffid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '0',
  `des` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `roomtypeid` int NOT NULL,
  `headcount` int NOT NULL,
  `price` double(40,2) DEFAULT '0.00',
  `maintenance` double(40,2) DEFAULT '0.00',
  `tax` double(40,2) DEFAULT '0.00',
  `discount` double(40,2) DEFAULT '0.00',
  `totalamount` double(40,2) DEFAULT '0.00',
  `status` tinyint DEFAULT (0),
  PRIMARY KEY (`tariffid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.tariffdetail: ~8 rows (approximately)
INSERT INTO `tariffdetail` (`tariffid`, `name`, `des`, `roomtypeid`, `headcount`, `price`, `maintenance`, `tax`, `discount`, `totalamount`, `status`) VALUES
	(1, 'Single Occupancy', '1 Room given and the other one Locked', 1, 1, 1299.00, 0.00, 0.00, 0.00, 1299.00, 1),
	(2, 'Double occupancy', '1 Room given and the other one Locked', 1, 2, 1599.00, 0.00, 0.00, 0.00, 1599.00, 1),
	(3, 'Triple Occupance ', '1 Room given and the other one Locked', 1, 3, 1898.00, 0.00, 0.00, 0.00, 1898.00, 1),
	(4, '2BHK', '4 Adults + 2 Children ', 1, 4, 2899.00, 0.00, 0.00, 0.00, 2899.00, 1),
	(5, '3BHK', '6 Adults + 3 Children ', 1, 6, 3599.00, 0.00, 0.00, 0.00, 3599.00, 1),
	(6, '1BHK', '1 Room given and the other one Locked', 3, 2, 20000.00, 1500.00, 0.00, 0.00, 21500.00, 1),
	(7, '2BHK', '', 3, 4, 25000.00, 2000.00, 0.00, 0.00, 27000.00, 1),
	(8, '3BHK', '', 3, 6, 30000.00, 2500.00, 0.00, 0.00, 32500.00, 1);

-- Dumping structure for table acco.temp_table
CREATE TABLE IF NOT EXISTS `temp_table` (
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.temp_table: ~1 rows (approximately)
INSERT INTO `temp_table` (`id`) VALUES
	(1);

-- Dumping structure for procedure acco.updateroomsstatus
DELIMITER //
CREATE PROCEDURE `updateroomsstatus`(
	IN `bookid` INT,
	IN `statusid` INT
)
BEGIN


	SET @roomids =0;
	
SELECT roomid into @roomids FROM booking WHERE bookingid=bookid;


SET @SQL_QUERY1 =CONCAT('update room set status =',statusid,'  WHERE roomid IN(',@roomIds,')');

	
	PREPARE stmt4 FROM @SQL_QUERY1;
	EXECUTE stmt4;
	DEALLOCATE PREPARE stmt4;
	


END//
DELIMITER ;

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.user: ~11 rows (approximately)
INSERT INTO `user` (`userid`, `firstname`, `lastname`, `address1`, `address2`, `city`, `state`, `country`, `pincode`, `modifieddate`, `phonenumber`, `email`, `createddate`, `imageurl`, `idproof`, `username`, `password`, `cpassword`, `status`) VALUES
	(6, 'muthu', 'n', '51', 'a', 'namakkal', 'TN', 'India', NULL, '2024-03-08 08:00:42', '9876545667', 'muthu@gmail.com', '2023-11-04 12:05:52', '', '', 'muthu', '$2a$08$Pt4TqNQPip93CDx9mDOiCOrj2tda5RxGQesiuHW1ckUc2mm35Jaq6', '$2a$08$EpnSLbvHbWPbNlgsKq6YgeJArb/ydcXc6tr29LNKEVHTzTkwGnLhG', 1),
	(7, 'tamil', 'selvan', '41', 'a', 'namakkal ', 'TN', 'India', NULL, '2024-03-05 15:19:25', '9940975265', 'tamil@gmail.com', '2023-11-04 13:31:30', '', '', 'tamil', '$2a$08$07hA1xyWogIYXP8Idil0De2Tsi03EmYnhABMM9jXifD9fpPtvrCH2', '$2a$08$8L8y5sQdkh5jIoNJBaMUyuImO87OYWZk7dNSZbZbEpdsA.tJ74Gr2', 1),
	(8, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-05 15:01:37', '988408063', 'admin@gmail.com', '2023-11-29 13:02:45', '', '', 'admin', '$2y$08$2GcjkTSQbMs/s3.S39HKsev1vmct3mJGiD8kxRVO1huw76Q0kiLZ.', '$2y$08$2GcjkTSQbMs/s3.S39HKsev1vmct3mJGiD8kxRVO1huw76Q0kiLZ.', 1),
	(9, 'tamilselvan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-05 15:01:37', '123456', 'tamilselvan@gmail.com', '2023-11-29 13:16:17', '', '', 'tamilselvan', '$2y$08$2GcjkTSQbMs/s3.S39HKsev1vmct3mJGiD8kxRVO1huw76Q0kiLZ.', '$2y$08$2GcjkTSQbMs/s3.S39HKsev1vmct3mJGiD8kxRVO1huw76Q0kiLZ.', 1),
	(10, 'arjun', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-05 15:01:36', '99999123456', 'arjun@gmail.com', '2023-11-29 13:26:12', '', '', 'arjun', '$2y$08$2GcjkTSQbMs/s3.S39HKsev1vmct3mJGiD8kxRVO1huw76Q0kiLZ.', '$2y$08$2GcjkTSQbMs/s3.S39HKsev1vmct3mJGiD8kxRVO1huw76Q0kiLZ.', 1),
	(11, 'arjun1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-05 15:01:35', '99999123456', 'arjun1@gmail.com', '2023-11-29 13:27:03', '', '', 'arjun1', '$2y$08$2GcjkTSQbMs/s3.S39HKsev1vmct3mJGiD8kxRVO1huw76Q0kiLZ.', '$2y$08$2GcjkTSQbMs/s3.S39HKsev1vmct3mJGiD8kxRVO1huw76Q0kiLZ.', 1),
	(12, 'devi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-05 15:01:35', '99999123456', 'devi@gmail.com', '2023-11-29 13:28:54', '', '', 'devi', '$2y$08$2GcjkTSQbMs/s3.S39HKsev1vmct3mJGiD8kxRVO1huw76Q0kiLZ.', '$2y$08$2GcjkTSQbMs/s3.S39HKsev1vmct3mJGiD8kxRVO1huw76Q0kiLZ.', 1),
	(16, 'uma', 'b', '41', 'a', 'namakkal ', 'TN', 'India', NULL, '2024-03-18 07:39:17', '9940975265', 'arjunuma@gmail.com', '2023-12-06 22:12:01', '', '', 'uma', '$2a$08$d6RoA3jT5IhwJwMGW4WzXuSxPRKPqaSoFUNW2S5Cc7aTHpt6gqNIu', '$2a$08$d6RoA3jT5IhwJwMGW4WzXuSxPRKPqaSoFUNW2S5Cc7aTHpt6gqNIu', 1),
	(17, 'sathish', 'kumar', '41', 'a', 'namakkal', 'TN', 'India', NULL, '2024-03-05 15:01:34', '99409', 'sathish@gmail.com', '2023-12-11 12:42:00', '', '', 'sathish', '$2y$08$2GcjkTSQbMs/s3.S39HKsev1vmct3mJGiD8kxRVO1huw76Q0kiLZ.', '$2y$08$2GcjkTSQbMs/s3.S39HKsev1vmct3mJGiD8kxRVO1huw76Q0kiLZ.', 1),
	(22, 'arasan', 'n', '51', 'a', 'namakkal', 'TN', 'India', 'undefined', '2024-03-05 15:01:33', '9876545960', 'arasan@gmail.com', '2024-02-16 15:00:26', '', '', 'arasan', '$2y$08$2GcjkTSQbMs/s3.S39HKsev1vmct3mJGiD8kxRVO1huw76Q0kiLZ.', '$2y$08$2GcjkTSQbMs/s3.S39HKsev1vmct3mJGiD8kxRVO1huw76Q0kiLZ.', 1),
	(24, 'tiger', 'lion', 'forest', 'chennai', 'Chennai', 'Tamil Nadu', 'India', '600001', '2024-03-18 07:24:06', '8877665544', 'tiger@gmail.com', '2024-03-18 12:54:06', '', '', 'tiger', '$2a$08$d6RoA3jT5IhwJwMGW4WzXuSxPRKPqaSoFUNW2S5Cc7aTHpt6gqNIu', '$2a$08$Zkb2EWsYjYQt7eekmjFNquhq73qYs36i05KSkS.bDQMyFTYV/z./S', 1);

-- Dumping structure for table acco.userrolemap
CREATE TABLE IF NOT EXISTS `userrolemap` (
  `userRoleMapId` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL DEFAULT '0',
  `roleid` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`userRoleMapId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.userrolemap: ~11 rows (approximately)
INSERT INTO `userrolemap` (`userRoleMapId`, `userid`, `roleid`, `status`) VALUES
	(18, 7, 2, 1),
	(19, 8, 1, 1),
	(20, 6, 3, 1),
	(21, 12, 3, 1),
	(22, 16, 4, 1),
	(23, 10, 3, 1),
	(24, 17, 3, 1),
	(25, 18, 4, 1),
	(29, 22, 3, 1),
	(30, 23, 3, 1),
	(31, 24, 3, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;