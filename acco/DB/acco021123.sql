-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.29 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
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

-- Dumping data for table acco.bookedstatus: ~3 rows (approximately)
DELETE FROM `bookedstatus`;
INSERT INTO `bookedstatus` (`bookedstatusid`, `bookedstatus`) VALUES
	('1', 'Booked'),
	('2', 'CancleBooked'),
	('3', 'UpdateBooked');

-- Dumping structure for table acco.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `bookingid` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phonenumber` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address1` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pincode` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `checkin` datetime NOT NULL,
  `checkout` datetime NOT NULL,
  `adults` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `child` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `roomtype` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `roomid` varchar(250) DEFAULT '0',
  `bookedstatusid` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`bookingid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.booking: ~4 rows (approximately)
DELETE FROM `booking`;
INSERT INTO `booking` (`bookingid`, `firstname`, `lastname`, `email`, `phonenumber`, `address1`, `address2`, `city`, `state`, `country`, `pincode`, `checkin`, `checkout`, `adults`, `child`, `roomtype`, `roomid`, `bookedstatusid`, `status`) VALUES
	(1, 'Test1', 'Test1', 'muthu@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2023-10-22 03:00:32', '2023-10-10 04:00:07', '4', '1', 'Service Apartment', '0', '0', b'1'),
	(2, 'muthu', 'muthu', 'muthu', '234', '234', '234', 'Namakkal', 'Tamil Nadu', 'India', '637015', '2023-10-22 14:02:00', '2023-10-18 11:02:00', '2', '11', 'Service Apartment', '0', '0', b'1'),
	(10, 'Muthalagan', 'N', 'muthu@stashook.com', '09884080613', 'Dev', '33', 'Namakkal', 'Tamil Nadu', 'India', '637015', '2023-10-23 21:54:00', '2023-10-18 20:52:00', '1', '2', 'Service Apartment', '0', '0', b'1'),
	(11, 'Arjun', 'Test1', 'muthu@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2023-10-24 03:00:00', '2023-10-10 04:00:00', '5', '1', 'Service Apartment', '0', '0', b'1');

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
DELETE FROM `bookroom`;
INSERT INTO `bookroom` (`bookingid`, `roomno`, `noofbhk`, `ac`, `breakfast`, `extrabed`) VALUES
	(1, 101, '2bhk', b'1', b'0', 0);

-- Dumping structure for table acco.extrabill
CREATE TABLE IF NOT EXISTS `extrabill` (
  `extrabillid` int NOT NULL AUTO_INCREMENT,
  `bookingid` varchar(50) NOT NULL DEFAULT '0',
  `extrabillno` varchar(50) NOT NULL DEFAULT '0',
  `purchaseitem` varchar(50) NOT NULL DEFAULT '0',
  `price` varchar(50) NOT NULL DEFAULT '0',
  `status` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`extrabillid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.extrabill: ~0 rows (approximately)
DELETE FROM `extrabill`;

-- Dumping structure for table acco.facilitycategory
CREATE TABLE IF NOT EXISTS `facilitycategory` (
  `facilitycategoryid` int NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`facilitycategoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.facilitycategory: ~7 rows (approximately)
DELETE FROM `facilitycategory`;
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
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`fcmapid`),
  KEY `FK_facilitycategorymap_facilitycharges` (`facilityid`),
  KEY `FK_facilitycategorymap_facilitycategory` (`facilitycategoryid`),
  CONSTRAINT `FK_facilitycategorymap_facilitycategory` FOREIGN KEY (`facilitycategoryid`) REFERENCES `facilitycategory` (`facilitycategoryid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.facilitycategorymap: ~0 rows (approximately)
DELETE FROM `facilitycategorymap`;

-- Dumping structure for table acco.facilitycharges
CREATE TABLE IF NOT EXISTS `facilitycharges` (
  `facilityid` int NOT NULL AUTO_INCREMENT,
  `facilityname` varchar(50) NOT NULL DEFAULT '0',
  `facilitycategory` varchar(50) DEFAULT NULL,
  `charges` int NOT NULL DEFAULT '0',
  `quantity` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`facilityid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.facilitycharges: ~22 rows (approximately)
DELETE FROM `facilitycharges`;
INSERT INTO `facilitycharges` (`facilityid`, `facilityname`, `facilitycategory`, `charges`, `quantity`, `status`) VALUES
	(1, 'AC', 'Charged Amenities', 400, 1, 1),
	(2, 'ExtraBed', 'Charged Amenities', 500, 2, 1),
	(3, 'Breakfast', 'Charged Amenities', 600, 2, 1),
	(4, 'Dining area', 'Living Area', 0, 0, 1),
	(5, 'Seating area', 'Living Area', 0, 0, 1),
	(6, 'Sofa', 'Living Area', 0, 0, 1),
	(7, 'Wifi', 'Media And Technology', 0, 0, 1),
	(8, 'Flat Screen TV', 'Media And Technology', 0, 0, 1),
	(9, 'Cable Channels', 'Media And Technology', 0, 0, 1),
	(10, 'Toiletries', 'Bathroom', 0, 0, 1),
	(11, 'Shower', 'Bathroom', 0, 0, 1),
	(12, 'Towels', 'Bathroom', 0, 0, 1),
	(13, 'Private Bathroom', 'Bathroom', 0, 0, 1),
	(14, 'Wardrobe or closet', 'Room Amenities', 0, 0, 1),
	(15, 'Drying Rack for clothes', 'Room Amenities', 0, 0, 1),
	(16, 'Fan', 'Room Amenities', 0, 0, 1),
	(17, 'Ironing Facilities', 'Room Amenities', 0, 0, 1),
	(18, 'Invoice provided', 'Reception Services', 0, 0, 1),
	(19, 'Private CheckIn/CheckOut', 'Reception Services', 0, 0, 1),
	(20, 'Lift', 'Miscellaneous', 0, 0, 1),
	(21, 'Family rooms', 'Miscellaneous', 0, 0, 1),
	(22, 'Non Smoking rooms', 'Miscellaneous', 0, 0, 1);

-- Dumping structure for table acco.floor
CREATE TABLE IF NOT EXISTS `floor` (
  `flid` int NOT NULL AUTO_INCREMENT,
  `floornumber` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`flid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.floor: ~3 rows (approximately)
DELETE FROM `floor`;
INSERT INTO `floor` (`flid`, `floornumber`) VALUES
	(1, 'FirstFloor'),
	(2, 'SecondFloor'),
	(3, 'ThirdFloor');

-- Dumping structure for table acco.floorroommapping
CREATE TABLE IF NOT EXISTS `floorroommapping` (
  `floorid` int NOT NULL AUTO_INCREMENT,
  `floornumber` varchar(50) DEFAULT NULL,
  `noofbhk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `roomno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `availablitystatus` varchar(50) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`floorid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.floorroommapping: ~12 rows (approximately)
DELETE FROM `floorroommapping`;
INSERT INTO `floorroommapping` (`floorid`, `floornumber`, `noofbhk`, `roomno`, `availablitystatus`, `status`) VALUES
	(1, '1', '2bhk', '101', NULL, b'1'),
	(2, '1', '2bhk', '102', NULL, b'1'),
	(3, '1', '2bhk', '103', NULL, b'1'),
	(4, '1', '3bhk', '104', NULL, b'1'),
	(5, '2', '2bhk', '202', NULL, b'1'),
	(6, '2', '2bhk', '201', NULL, b'1'),
	(7, '2', '2bhk', '203', NULL, b'1'),
	(8, '2', '3bhk', '204', NULL, b'1'),
	(9, '3', '2bhk', '301', NULL, b'1'),
	(10, '3', '2bhk', '302', NULL, b'1'),
	(11, '3', '2bhk', '303', NULL, b'1'),
	(12, '3', '3bhk', '304', NULL, b'1');

-- Dumping structure for table acco.fooditem
CREATE TABLE IF NOT EXISTS `fooditem` (
  `fooditemid` varchar(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `fooditem` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `foodcategory` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `avilabletime` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` float NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`fooditemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.fooditem: ~6 rows (approximately)
DELETE FROM `fooditem`;
INSERT INTO `fooditem` (`fooditemid`, `fooditem`, `foodcategory`, `avilabletime`, `price`, `status`) VALUES
	('1', 'Tomoto Soup', 'Chinese', '11 to 11', 50, 1),
	('2', 'Idly', 'South Indian', '11 to 11', 30, 1),
	('3', 'Veg Noodles', 'Chinese', '11 to 11', 130, 1),
	('4', 'Veg Fried Rice', 'Chinese', '11 to 11', 120, 1),
	('5', 'Ghee Roast Dosa', 'South Indian', '11 to 11', 90, 1),
	('6', 'Tandoori Roti', 'North Indian', '11 to 11', 120, 1);

-- Dumping structure for table acco.idproof
CREATE TABLE IF NOT EXISTS `idproof` (
  `proofid` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL DEFAULT '0',
  `proofname` varchar(100) NOT NULL DEFAULT '0',
  `proofurl` varchar(100) NOT NULL DEFAULT '0',
  `status` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`proofid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.idproof: ~0 rows (approximately)
DELETE FROM `idproof`;

-- Dumping structure for table acco.role
CREATE TABLE IF NOT EXISTS `role` (
  `roleid` int NOT NULL AUTO_INCREMENT,
  `rolename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.role: ~6 rows (approximately)
DELETE FROM `role`;
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
  `groupid` varchar(50) DEFAULT NULL,
  `basecount` int DEFAULT NULL,
  `roomsize` int DEFAULT NULL,
  `desc` varchar(50) DEFAULT NULL,
  `internet` bit(1) NOT NULL DEFAULT b'1',
  `geyser` bit(1) NOT NULL DEFAULT b'1',
  `ac` bit(1) NOT NULL DEFAULT b'1',
  `smoking` bit(1) NOT NULL DEFAULT b'1',
  `pets` bit(1) NOT NULL DEFAULT b'1',
  `alcohol` bit(1) NOT NULL DEFAULT b'1',
  `family` bit(1) NOT NULL DEFAULT b'1',
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.room: ~4 rows (approximately)
DELETE FROM `room`;
INSERT INTO `room` (`roomid`, `roomname`, `groupid`, `basecount`, `roomsize`, `desc`, `internet`, `geyser`, `ac`, `smoking`, `pets`, `alcohol`, `family`, `status`) VALUES
	('1', '2BHK1', '1', 4, 600, 'rooms', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'1'),
	('11', '3BHK', '1', 6, 900, 'rooms', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'1'),
	('2', '2BHK2', '1', 4, 600, 'rooms', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'1'),
	('3', '2BHK3', '1', 4, 600, 'rooms', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'1'),
	('4', '2BHK4', '1', 4, 600, 'rooms', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'1');

-- Dumping structure for table acco.roomgroup
CREATE TABLE IF NOT EXISTS `roomgroup` (
  `groupid` varchar(50) NOT NULL,
  `groupname` varchar(50) DEFAULT NULL,
  `numberofrooms` int DEFAULT NULL,
  `roomtype` varchar(50) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.roomgroup: ~0 rows (approximately)
DELETE FROM `roomgroup`;
INSERT INTO `roomgroup` (`groupid`, `groupname`, `numberofrooms`, `roomtype`, `status`) VALUES
	('1', 'Service Apartment', 12, 'deluxe', b'1');

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
  `modifieddate` timestamp NULL DEFAULT NULL,
  `phonenumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `imageurl` varchar(250) NOT NULL DEFAULT '',
  `idproof` varchar(250) NOT NULL DEFAULT '',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `cpassword` varchar(100) DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.user: ~9 rows (approximately)
DELETE FROM `user`;
INSERT INTO `user` (`userid`, `firstname`, `lastname`, `address1`, `address2`, `city`, `state`, `country`, `modifieddate`, `phonenumber`, `email`, `createddate`, `imageurl`, `idproof`, `username`, `password`, `cpassword`, `status`) VALUES
	(8, 'selva', 's', 'qwerty', 'asdfg', 'sdf', 'TN', 'India', NULL, '9876545667', 'selva@gmail.com', '0000-00-00 00:00:00', 'images_1697885543801.jpg', '', 'selva', '$2a$08$/KlwgbUYxsFw.sXYefEp3es9uAhVNUqgGwMKc8IfkCjJgVyS5SMCO', '$2a$08$/KlwgbUYxsFw.sXYefEp3es9uAhVNUqgGwMKc8IfkCjJgVyS5SMCO', b'1'),
	(15, 'selva3', 's1', 'qwerty1', 'asdfg11', 'sdf1', 'TN', 'India1', NULL, '9876545667', 'selva31@gmail.com', '0000-00-00 00:00:00', '', '', 'selva1q', '$2a$08$DMm5K4ALVkBeKCFrrDyrVuSbh5J9nwkJkQ8qznZNFKUoD9iqhz4pm', '$2a$08$rxGzqxiZX4KYT25SV72DXuLhfuydXmWHoSbX959vYkQE/Fjo5Z.4u', b'1'),
	(16, 'selva3', 's1', 'qwerty1', 'asdfg11', 'sdf1', 'TN', 'India1', NULL, '9876545667', 'selva31@gmail.com', '0000-00-00 00:00:00', '', '', 'selva1q', '$2a$08$cGTj9eR0v05rx864lpLSZueSqyHl4UCDX0a0rcqJxL0fl4e7On9ni', '$2a$08$px4QdeHHArjMWfaDQWFLG.c6c6edtbc3DoTW0Ga1GGQJm1ZX0oyEO', b'1'),
	(17, 'selva', 's12', 'qwerty1', 'asdfg11', 'nkl', 'TN', 'India1', NULL, '9876545667', 'selva31@gmail.com', '0000-00-00 00:00:00', '', '', 'selva', '$2a$08$3drkndeF1vDrPxDd0tPiuegNayJzFW3Akh6CSpSoLHBzH4g3a5AUi', '$2a$08$XF0Efg9M92r630is.Sdeeu6nSih7v7C.JVLG2PAsroohMo94jRq3O', b'1'),
	(18, 'muthu', 's12', 'qwerty1', 'asdfg11', 'nkl', 'TN', 'India1', NULL, '9876545667', 'selva31@gmail.com', '0000-00-00 00:00:00', '', '', 'muthu', '$2a$08$m28cy5Au667et3CMFGdYl.ESJrKRHa31qp6b.xJn3ATa3kM2G7Ozq', '$2a$08$IcMSUiCUTiJSM/BOK6OBDuuC6OTlKAHxboakQPD6uA/N0JCpK6afS', b'1'),
	(20, 'arjun', 'muthu', '41', 'a', 'namakkal', 'TN', 'India', '2010-10-23 06:42:00', '9876545667', 'arjun@gmail.com', '2010-10-23 13:22:00', '', '', 'arjun', 'arjun', '$2a$08$/doQXasT4fq3aDBRmSqBw.CZVxb11N6TLgjNFRZyqMZKcszPJLLFG', b'1'),
	(26, 'nagam', 'n', '51', 'a', 'namakkal', 'TN', 'India', '2010-10-24 06:42:00', '9876545667', 'nagam@gmail.com', '2023-11-01 11:32:02', '', '', 'undefined', '$2a$08$CUkEOEGD1EcCs64TSiLdsOH9EDTMjaw076GHkFVMm6d.upW.2F1xm', '$2a$08$t91Sa6v9eUEhQC/c9ZhSBO1xrqFxZXZNt.D3LdRcZEUK5/mfvueoC', b'1'),
	(27, 'nagam1', 'n', '51', 'a', 'namakkal', 'TN', 'India', '2010-10-24 06:42:00', '9876545667', 'nagam1@gmail.com', '2023-11-01 12:04:32', '', '', 'undefined', '$2a$08$pw9.cE9s76clyrqDMaNHM.fI/aqIrtIWXQijl7XStscgLqw3lr5JW', '$2a$08$6pNGCC56/hpc5CRJj55khuaLU/AfBqalMS81T3oAuMmyUD5g9J.Ca', b'1'),
	(28, 'nagam2', 'n', '51', 'b', 'namakkal', 'TN', 'India', '2010-10-24 06:42:00', '9876545667', 'nagam2@gmail.com', '2023-11-01 12:05:55', '', '', 'undefined', '$2a$08$bOWkqnFxaamsv5orqKlZXOuTKGp2WKP1LnuN9tqMvlT4JTsJ1dEgO', '$2a$08$hwd8Q7ZyuvauA1K41t.V5e4itxmP8m6GY47Lmvx77anBgFGNMVj7a', b'1');

-- Dumping structure for table acco.userrolemap
CREATE TABLE IF NOT EXISTS `userrolemap` (
  `userRoleMapId` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL DEFAULT '0',
  `roleid` int NOT NULL DEFAULT '0',
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`userRoleMapId`),
  KEY `FK_userrolemap_user` (`userid`) USING BTREE,
  KEY `FK_userrolemap_role` (`roleid`) USING BTREE,
  CONSTRAINT `FK_userrolemap_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.userrolemap: ~3 rows (approximately)
DELETE FROM `userrolemap`;
INSERT INTO `userrolemap` (`userRoleMapId`, `userid`, `roleid`, `status`) VALUES
	(2, 16, 4, b'1'),
	(9, 26, 4, b'1'),
	(10, 27, 4, b'1'),
	(11, 28, 4, b'1');

-- Dumping structure for procedure acco.usertablemodified
DELIMITER //
CREATE PROCEDURE `usertablemodified`()
UPDATE acco.user
SET modifieddate = CURRENT_TIMESTAMP WHERE userid IN (SELECT DISTINCT userid FROM user)//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
