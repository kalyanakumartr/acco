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

-- Dumping structure for table acco.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `bookingId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastName` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phoneNumber` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address1` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pincode` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CheckIn` varchar(50) NOT NULL DEFAULT '',
  `CheckOut` varchar(50) NOT NULL DEFAULT '',
  `adults` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `child` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `roomType` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`bookingId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.booking: ~0 rows (approximately)
DELETE FROM `booking`;
INSERT INTO `booking` (`bookingId`, `firstName`, `lastName`, `email`, `phoneNumber`, `address1`, `address2`, `city`, `state`, `country`, `pincode`, `CheckIn`, `CheckOut`, `adults`, `child`, `roomType`, `status`) VALUES
	(1, 'Test1', 'Test1', 'muthu@stashook.com', '444444', 'Test1', 'Test1', 'Test1', 'TN', 'India', '55555', '2023-09-02 03:00:32', '2023-10-10 04:00:07', 'undefined', '1', 'Service Apartment', b'1');

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

-- Dumping structure for table acco.user
CREATE TABLE IF NOT EXISTS `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phoneNumber` varchar(100) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `state` varchar(250) DEFAULT NULL,
  `city` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.user: ~1 rows (approximately)
DELETE FROM `user`;
INSERT INTO `user` (`userId`, `userName`, `password`, `gender`, `email`, `phoneNumber`, `country`, `state`, `city`, `address`, `status`) VALUES
	(1, 'muthu', '$2a$08$gudBOP95aJGZnIFLcgAJ0O2ig1QPIAckljiqBVniE.l0aTWSjdaau', 'Male', 'muthu@gmail.com', '98840806113', 'India', 'TamilNadu', 'Namakkal', 'Mohanur', b'1'),
	(3, 'muthu11', '$2a$08$GhNepfp6nOq8PaDqAjpzSubMdQRvs88H3lFkKU72pOA1r877ORjtm', 'Male', 'muthu11@gmail.com', '98840806113', 'India', 'TamilNadu', 'Namakkal', 'Mohanur', b'1'),
	(4, 'Muthu', 'Muthu', 'Male', 'muthu@gmail.com', '98840806113', NULL, NULL, NULL, NULL, b'1'),
	(5, 'Muthu', 'Muthu', 'Male', 'muthu@gmail.com', '98840806113', NULL, NULL, NULL, NULL, b'1'),
	(6, 'Muthu', 'Muthu', 'Male', 'muthu@gmail.com', '98840806113', NULL, NULL, NULL, NULL, b'1');

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
  CONSTRAINT `FK_userrolemap_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.userrolemap: ~0 rows (approximately)
DELETE FROM `userrolemap`;
INSERT INTO `userrolemap` (`userRoleMapId`, `userId`, `roleId`, `status`) VALUES
	(1, 1, 1, b'1');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
