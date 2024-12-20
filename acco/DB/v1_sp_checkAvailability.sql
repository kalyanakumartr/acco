-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.39 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
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

-- Dumping structure for procedure acco.checkAvailability
DELIMITER //
CREATE PROCEDURE `checkAvailability`(
	IN `cin` VARCHAR(50),
	IN `cout` VARCHAR(50),
	IN `rtid` INT,
	IN `adultin` INT
)
BEGIN
   DECLARE done INT DEFAULT FALSE;
	
DROP TEMPORARY TABLE IF EXISTS temp_check_available_table;
CREATE TEMPORARY TABLE IF NOT EXISTS temp_check_available_table
(	available_status varchar(50),
  number_of_2bhk int,
  number_of_3bhk int,
  number_of_2bhk_persons int,
  number_of_3bhk_persons int,
  with_extra_bed_2bhk_persons INT,
  with_extra_bed_3bhk_persons INT,
  PRIMARY KEY (available_status) USING BTREE
 	 );
	

SET @Comma = ', ';
SET @Count = 0;

SET @status = 'Available';

SET @available2bhkCount = 0;
SET @available2bhkPersonCount = 0;
SET @available2bhkPersonCountWithExtraBed = 0;
SET @available3bhkPersonCountWithExtraBed = 0;
SET @available3bhkPersonCount = 0;
SET @available3bhkCount = 0;
SET @bookedCount2bhk =0;

SET @total2bhkCount =10;
SET @total3bhkCount =2;

		SELECT IFNULL(sum(bhk2count),0)  from booking WHERE (checkin  BETWEEN cin AND cout OR checkout BETWEEN cin AND cout ) INTO @bookedCount2bhk;
  		SELECT IFNULL(sum(bhk3count),0)  from booking WHERE (checkin  BETWEEN cin AND cout OR checkout BETWEEN cin AND cout ) INTO @bookedCount3bhk;
  		SET @available2bhkCount = @total2bhkCount -@bookedCount2bhk;
  		SET @available3bhkCount = @total3bhkCount -@bookedCount3bhk;
  		SET @available2bhkPersonCount = @available2bhkCount*4;
  		SET @available3bhkPersonCount = @available3bhkCount*6;
  	  	SET @available2bhkPersonCountWithExtraBed = @available2bhkCount+(@available2bhkCount*4);
		SET @available3bhkPersonCountWithExtraBed = @available3bhkCount+(@available3bhkCount*6);
		
		if(adultin > @available2bhkPersonCount + @available2bhkPersonCount) then
			SET @status = 'Un Available';
		end if;
		INSERT INTO temp_check_available_table (available_status, number_of_2bhk, number_of_3bhk, number_of_2bhk_persons, number_of_3bhk_persons, with_extra_bed_2bhk_persons, with_extra_bed_3bhk_persons)VALUES (@status, @available2bhkCount, @available3bhkCount, @available2bhkPersonCount,@available3bhkPersonCount, @available2bhkPersonCountWithExtraBed, @available3bhkPersonCountWithExtraBed);
SELECT * from temp_check_available_table;
DROP TEMPORARY TABLE IF EXISTS temp_check_available_table;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
