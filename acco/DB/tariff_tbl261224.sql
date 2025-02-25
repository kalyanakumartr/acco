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
	(1, 'Single Occupancy', '1 Room given and the other one Locked', 1, 1, 1599.00, 0.00, 0.00, 0.00, 1599.00, 1),
	(2, 'Double occupancy', '1 Room given and the other one Locked', 1, 2, 1999.00, 0.00, 0.00, 0.00, 1999.00, 1),
	(3, 'Triple Occupance ', '1 Room given and the other one Locked', 1, 3, 1898.00, 0.00, 0.00, 0.00, 1898.00, 1),
	(4, '2BHK', '4 Adults + 2 Children ', 1, 4, 2899.00, 0.00, 0.00, 0.00, 2899.00, 1),
	(5, '3BHK', '6 Adults + 3 Children ', 1, 6, 3599.00, 0.00, 0.00, 0.00, 3599.00, 1),
	(6, '1BHK', '1 Room given and the other one Locked', 3, 2, 20000.00, 1500.00, 0.00, 0.00, 21500.00, 1),
	(7, '2BHK', '', 3, 4, 25000.00, 2000.00, 0.00, 0.00, 27000.00, 1),
	(8, '3BHK', '', 3, 6, 30000.00, 2500.00, 0.00, 0.00, 32500.00, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
