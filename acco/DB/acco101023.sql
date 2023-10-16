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

-- Dumping structure for table acco.user
CREATE TABLE IF NOT EXISTS `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phoneNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `cpassword` varchar(100) DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.user: ~4 rows (approximately)
DELETE FROM `user`;
INSERT INTO `user` (`userId`, `firstName`, `lastName`, `address1`, `address2`, `city`, `state`, `country`, `phoneNumber`, `email`, `userName`, `password`, `cpassword`, `status`) VALUES
	(1, NULL, NULL, 'Male', NULL, 'Namakkal', 'Mohanur', 'India', '98840806113', 'muthu@gmail.com', 'muthu', '$2a$08$gudBOP95aJGZnIFLcgAJ0O2ig1QPIAckljiqBVniE.l0aTWSjdaau', NULL, b'1'),
	(3, NULL, NULL, 'Male', NULL, 'Namakkal', 'Mohanur', 'India', '98840806113', 'muthu11@gmail.com', 'muthu11', '$2a$08$GhNepfp6nOq8PaDqAjpzSubMdQRvs88H3lFkKU72pOA1r877ORjtm', NULL, b'1'),
	(4, NULL, NULL, 'Male', NULL, NULL, NULL, NULL, '98840806113', 'muthu@gmail.com', 'Muthu', 'Muthu', NULL, b'1'),
	(5, NULL, NULL, 'Male', NULL, NULL, NULL, NULL, '98840806113', 'muthu@gmail.com', 'Muthu', 'Muthu', NULL, b'1'),
	(6, NULL, NULL, 'Male', NULL, NULL, NULL, NULL, '98840806113', 'muthu@gmail.com', 'Muthu', 'Muthu', NULL, b'1'),
	(7, 'selva', 's', 'qwerty', 'asdfg', 'sdf', 'TN', 'India', '9876545667', 'selva@gmail.com', 'selva', '$2a$08$b6vzSc5nO89eg3JWFq9v0eihnKVXGoYWbXCcg8dvvESdJ.2sJBYki', '$2a$08$b6vzSc5nO89eg3JWFq9v0eihnKVXGoYWbXCcg8dvvESdJ.2sJBYki', b'1');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
