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
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.role: ~6 rows (approximately)
DELETE FROM `role`;
INSERT INTO `role` (`roleid`, `rolename`, `shortname`, `status`) VALUES
	(1, 'Admin', 'ad', b'1');

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
  `registereddate` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.user: ~6 rows (approximately)
DELETE FROM `user`;
INSERT INTO `user` (`userid`, `firstname`, `lastname`, `address1`, `address2`, `city`, `state`, `country`, `registereddate`, `phonenumber`, `email`, `createddate`, `imageurl`, `idproof`, `username`, `password`, `cpassword`, `status`) VALUES
	(8, 'selva', 's', 'qwerty', 'asdfg', 'sdf', 'TN', 'India', NULL, '9876545667', 'selva@gmail.com', '0000-00-00 00:00:00', 'images_1697885543801.jpg', '', 'selva', '$2a$08$/KlwgbUYxsFw.sXYefEp3es9uAhVNUqgGwMKc8IfkCjJgVyS5SMCO', '$2a$08$/KlwgbUYxsFw.sXYefEp3es9uAhVNUqgGwMKc8IfkCjJgVyS5SMCO', b'1'),
	(15, 'selva3', 's1', 'qwerty1', 'asdfg11', 'sdf1', 'TN', 'India1', NULL, '9876545667', 'selva31@gmail.com', '0000-00-00 00:00:00', '', '', 'selva1q', '$2a$08$DMm5K4ALVkBeKCFrrDyrVuSbh5J9nwkJkQ8qznZNFKUoD9iqhz4pm', '$2a$08$rxGzqxiZX4KYT25SV72DXuLhfuydXmWHoSbX959vYkQE/Fjo5Z.4u', b'1'),
	(16, 'selva3', 's1', 'qwerty1', 'asdfg11', 'sdf1', 'TN', 'India1', NULL, '9876545667', 'selva31@gmail.com', '0000-00-00 00:00:00', '', '', 'selva1q', '$2a$08$cGTj9eR0v05rx864lpLSZueSqyHl4UCDX0a0rcqJxL0fl4e7On9ni', '$2a$08$px4QdeHHArjMWfaDQWFLG.c6c6edtbc3DoTW0Ga1GGQJm1ZX0oyEO', b'1'),
	(17, 'selva', 's12', 'qwerty1', 'asdfg11', 'sdf1', 'TN', 'India1', NULL, '9876545667', 'selva31@gmail.com', '0000-00-00 00:00:00', '', '', 'selva', '$2a$08$3drkndeF1vDrPxDd0tPiuegNayJzFW3Akh6CSpSoLHBzH4g3a5AUi', '$2a$08$XF0Efg9M92r630is.Sdeeu6nSih7v7C.JVLG2PAsroohMo94jRq3O', b'1'),
	(18, 'muthu', 's12', 'qwerty1', 'asdfg11', 'sdf1', 'TN', 'India1', NULL, '9876545667', 'selva31@gmail.com', '0000-00-00 00:00:00', '', '', 'muthu', '$2a$08$m28cy5Au667et3CMFGdYl.ESJrKRHa31qp6b.xJn3ATa3kM2G7Ozq', '$2a$08$IcMSUiCUTiJSM/BOK6OBDuuC6OTlKAHxboakQPD6uA/N0JCpK6afS', b'1'),
	(20, 'arjun', 'muthu', '41', 'a', 'namakkal', 'TN', 'India', '2010-10-23 12:12:00', '9876545667', 'arjun@gmail.com', '2010-10-23 13:22:00', '', '', 'arjun', 'arjun', '$2a$08$/doQXasT4fq3aDBRmSqBw.CZVxb11N6TLgjNFRZyqMZKcszPJLLFG', b'1');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.userrolemap: ~1 rows (approximately)
DELETE FROM `userrolemap`;
INSERT INTO `userrolemap` (`userRoleMapId`, `userid`, `roleid`, `status`) VALUES
	(2, 16, 4, b'1');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
