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

-- Dumping structure for table acco.facilitycharges
CREATE TABLE IF NOT EXISTS `facilitycharges` (
  `facilityid` int NOT NULL AUTO_INCREMENT,
  `facilityname` varchar(50) NOT NULL DEFAULT '0',
  `facilitycategory` varchar(50) DEFAULT NULL,
  `charges` int NOT NULL DEFAULT '0',
  `quantity` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`facilityid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table acco.facilitycharges: ~23 rows (approximately)
INSERT INTO `facilitycharges` (`facilityid`, `facilityname`, `facilitycategory`, `charges`, `quantity`, `status`) VALUES
	(1, 'AC', 'Charged Amenities', 400, 1, 1),
	(2, 'ExtraBed', 'Charged Amenities', 299, 1, 1),
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
	(22, 'Non Smoking rooms', 'Miscellaneous', 0, 0, 1),
	(23, 'Eb', 'Charges', 15, 1, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
