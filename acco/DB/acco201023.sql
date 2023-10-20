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
  `bookedId` int NOT NULL AUTO_INCREMENT,
  `bookedStatus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bookedId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.bookedstatus: ~2 rows (approximately)
DELETE FROM `bookedstatus`;
INSERT INTO `bookedstatus` (`bookedId`, `bookedStatus`) VALUES
	(1, 'Booked'),
	(2, 'CancleBooked'),
	(3, 'UpdateBooked');

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
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`bookingid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.booking: ~3 rows (approximately)
DELETE FROM `booking`;
INSERT INTO `booking` (`bookingid`, `firstname`, `lastname`, `email`, `phonenumber`, `address1`, `address2`, `city`, `state`, `country`, `pincode`, `checkin`, `checkout`, `adults`, `child`, `roomtype`, `status`) VALUES
	(1, 'Test1', 'Test1', 'muthu@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2023-09-02 03:00:32', '2023-10-10 04:00:07', 'undefined', '1', 'Service Apartment', b'1'),
	(2, 'muthu', 'muthu', 'muthu', '234', '234', '234', 'Namakkal', 'Tamil Nadu', 'India', '637015', '2023-10-17 11:02:00', '2023-10-18 11:02:00', '2', '11', '12', b'1'),
	(10, 'Muthalagan', 'N', 'muthu@stashook.com', '09884080613', 'Dev', '33', 'Namakkal', 'Tamil Nadu', 'India', '637015', '2023-10-16 21:54:00', '2023-10-18 20:52:00', '1', '2', '12', b'1');

-- Dumping structure for table acco.role
CREATE TABLE IF NOT EXISTS `role` (
  `roleId` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(100) DEFAULT NULL,
  `shortName` varchar(100) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.role: ~6 rows (approximately)
DELETE FROM `role`;
INSERT INTO `role` (`roleId`, `roleName`, `shortName`, `status`) VALUES
	(1, 'Admin', 'AD', b'1'),
	(2, 'Manager', 'M', b'1'),
	(3, 'RoomKeeper', 'RK', b'1'),
	(4, 'Customer', 'C', b'1'),
	(5, 'Supervisor', 'SV', b'1'),
	(6, 'FrontOfficeExecutive', 'FOE', b'1');

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

-- Dumping data for table acco.room: ~0 rows (approximately)
DELETE FROM `room`;
INSERT INTO `room` (`roomid`, `roomname`, `groupid`, `basecount`, `roomsize`, `desc`, `internet`, `geyser`, `ac`, `smoking`, `pets`, `alcohol`, `family`, `status`) VALUES
	('1', '2BHK', '1', 4, 600, 'rooms', b'1', b'1', b'1', b'0', b'0', b'0', b'1', b'1');

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

-- Dumping structure for table acco.rooms_s
CREATE TABLE IF NOT EXISTS `rooms_s` (
  `roomsId` int NOT NULL AUTO_INCREMENT,
  `roomsName` varchar(50) NOT NULL DEFAULT '0',
  `addbed` int DEFAULT NULL,
  `roomsplit` varchar(50) NOT NULL,
  `roompart1` varchar(50) NOT NULL,
  `roompart2` varchar(50) NOT NULL,
  `roomsstatus` bit(1) NOT NULL,
  PRIMARY KEY (`roomsId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.rooms_s: ~12 rows (approximately)
DELETE FROM `rooms_s`;
INSERT INTO `rooms_s` (`roomsId`, `roomsName`, `addbed`, `roomsplit`, `roompart1`, `roompart2`, `roomsstatus`) VALUES
	(1, '201_2BH', 2, 'yes', 'A', 'B', b'1'),
	(2, '202_2BH', 2, 'yes', 'A', 'B', b'1'),
	(3, '203_2BH', 2, 'yes', 'A', 'B', b'1'),
	(4, '204_2BH', 2, 'yes', 'A', 'B', b'1'),
	(5, '205_2BH', 2, 'yes', 'A', 'B', b'1'),
	(6, '206_2BH', 2, 'no', '', '', b'1'),
	(7, '207_2BH', 2, 'no', '', '', b'1'),
	(8, '208_2BH', 2, 'no', '', '', b'1'),
	(9, '209_2BH', 2, 'no', '', '', b'1'),
	(10, '210_2BH', 2, 'no', '', '', b'1'),
	(11, '211_3BH', 3, 'yes', 'A', 'B', b'1'),
	(12, '212_3BH', 3, 'no', '', '', b'1');

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
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `cpassword` varchar(100) DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.user: ~5 rows (approximately)
DELETE FROM `user`;
INSERT INTO `user` (`userid`, `firstname`, `lastname`, `address1`, `address2`, `city`, `state`, `country`, `registereddate`, `phonenumber`, `email`, `createddate`, `username`, `password`, `cpassword`, `status`) VALUES
	(8, 'selva', 's', 'qwerty', 'asdfg', 'sdf', 'TN', 'India', NULL, '9876545667', 'selva@gmail.com', '0000-00-00 00:00:00', 'selva', '$2a$08$/KlwgbUYxsFw.sXYefEp3es9uAhVNUqgGwMKc8IfkCjJgVyS5SMCO', '$2a$08$/KlwgbUYxsFw.sXYefEp3es9uAhVNUqgGwMKc8IfkCjJgVyS5SMCO', b'1'),
	(15, 'selva3', 's1', 'qwerty1', 'asdfg11', 'sdf1', 'TN', 'India1', NULL, '9876545667', 'selva31@gmail.com', '0000-00-00 00:00:00', 'selva1q', '$2a$08$DMm5K4ALVkBeKCFrrDyrVuSbh5J9nwkJkQ8qznZNFKUoD9iqhz4pm', '$2a$08$rxGzqxiZX4KYT25SV72DXuLhfuydXmWHoSbX959vYkQE/Fjo5Z.4u', b'1'),
	(16, 'selva3', 's1', 'qwerty1', 'asdfg11', 'sdf1', 'TN', 'India1', NULL, '9876545667', 'selva31@gmail.com', '0000-00-00 00:00:00', 'selva1q', '$2a$08$cGTj9eR0v05rx864lpLSZueSqyHl4UCDX0a0rcqJxL0fl4e7On9ni', '$2a$08$px4QdeHHArjMWfaDQWFLG.c6c6edtbc3DoTW0Ga1GGQJm1ZX0oyEO', b'1'),
	(17, 'selva', 's12', 'qwerty1', 'asdfg11', 'sdf1', 'TN', 'India1', NULL, '9876545667', 'selva31@gmail.com', '0000-00-00 00:00:00', 'selva', '$2a$08$3drkndeF1vDrPxDd0tPiuegNayJzFW3Akh6CSpSoLHBzH4g3a5AUi', '$2a$08$XF0Efg9M92r630is.Sdeeu6nSih7v7C.JVLG2PAsroohMo94jRq3O', b'1'),
	(18, 'muthu', 's12', 'qwerty1', 'asdfg11', 'sdf1', 'TN', 'India1', NULL, '9876545667', 'selva31@gmail.com', '0000-00-00 00:00:00', 'muthu', '$2a$08$m28cy5Au667et3CMFGdYl.ESJrKRHa31qp6b.xJn3ATa3kM2G7Ozq', '$2a$08$IcMSUiCUTiJSM/BOK6OBDuuC6OTlKAHxboakQPD6uA/N0JCpK6afS', b'1');

-- Dumping structure for table acco.userrolemap
CREATE TABLE IF NOT EXISTS `userrolemap` (
  `userRoleMapId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL DEFAULT '0',
  `roleId` int NOT NULL DEFAULT '0',
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`userRoleMapId`),
  KEY `FK_userrolemap_user` (`userId`),
  KEY `FK_userrolemap_role` (`roleId`),
  CONSTRAINT `FK_userrolemap_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_userrolemap_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.userrolemap: ~3 rows (approximately)
DELETE FROM `userrolemap`;
INSERT INTO `userrolemap` (`userRoleMapId`, `userId`, `roleId`, `status`) VALUES
	(2, 16, 4, b'1'),
	(3, 17, 4, b'1'),
	(4, 18, 4, b'1');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
