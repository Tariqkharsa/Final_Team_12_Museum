CREATE DATABASE  IF NOT EXISTS `FinalTeam12` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `FinalTeam12`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: team12.copftkcel1k2.us-east-1.rds.amazonaws.com    Database: FinalTeam12
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `ACCESS`
--

DROP TABLE IF EXISTS `ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACCESS` (
  `ACID` int NOT NULL,
  `ACEN` varchar(50) NOT NULL,
  KEY `ACID` (`ACID`),
  KEY `ACEN` (`ACEN`),
  CONSTRAINT `ACCESS_ibfk_1` FOREIGN KEY (`ACID`) REFERENCES `CUSTOMERS` (`CID`),
  CONSTRAINT `ACCESS_ibfk_2` FOREIGN KEY (`ACEN`) REFERENCES `Exhibition` (`exName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCESS`
--

LOCK TABLES `ACCESS` WRITE;
/*!40000 ALTER TABLE `ACCESS` DISABLE KEYS */;
INSERT INTO `ACCESS` VALUES (1,'Summer Art Pieces');
/*!40000 ALTER TABLE `ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARTPIECES`
--

DROP TABLE IF EXISTS `ARTPIECES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ARTPIECES` (
  `AID` int NOT NULL AUTO_INCREMENT,
  `ANAME` varchar(100) NOT NULL,
  `ARTIST` varchar(50) DEFAULT NULL,
  `DEPTNAME` varchar(100) NOT NULL,
  `ARTINFO` varchar(1500) DEFAULT NULL,
  `INDATE` date NOT NULL,
  `OUTDATE` date DEFAULT NULL,
  `dID` int NOT NULL,
  PRIMARY KEY (`AID`),
  KEY `dID` (`dID`),
  CONSTRAINT `ARTPIECES_ibfk_1` FOREIGN KEY (`dID`) REFERENCES `Departments` (`Dep_Num`),
  CONSTRAINT `INVALD_INSTALL_DATE` CHECK (((`INDATE` > _utf8mb4'2001-01-01') and (`INDATE` <= sysdate()))),
  CONSTRAINT `INVALD_REMOVE_DATE` CHECK (((`OUTDATE` > _utf8mb4'2001-01-01') and (`OUTDATE` >= `INDATE`)))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARTPIECES`
--

LOCK TABLES `ARTPIECES` WRITE;
/*!40000 ALTER TABLE `ARTPIECES` DISABLE KEYS */;
INSERT INTO `ARTPIECES` VALUES (6,'Ultra Instinct','Goku','Painting','One of the legendary debuggers in existence.','2022-04-11','2022-04-28',1),(8,'The Rinnegan','Pain','Sculpture','These eyes were said to give their user frameworks','2022-04-14','2022-04-22',4),(9,'The Shortie','Levi','Photography','Humanity\'s best programmer','2022-04-15','2022-04-23',3),(10,'Demon','Tanjiro','Drawing','Code mostly in the dark','2022-04-15','2022-04-29',2),(20,'dgxv','fxfb','Painting','','2022-04-24','2022-04-27',2);
/*!40000 ALTER TABLE `ARTPIECES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMERS`
--

DROP TABLE IF EXISTS `CUSTOMERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMERS` (
  `FirstName` char(50) DEFAULT NULL,
  `LastName` char(50) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `PhoneNumber` varchar(10) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `CID` int NOT NULL AUTO_INCREMENT,
  `SpecialStatus` enum('CollegeStudent','Veteran','Senior','Child','None') NOT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMERS`
--

LOCK TABLES `CUSTOMERS` WRITE;
/*!40000 ALTER TABLE `CUSTOMERS` DISABLE KEYS */;
INSERT INTO `CUSTOMERS` VALUES ('Dorian','Nozales',23,'8325671234','myemail@yahoo.com',1,'CollegeStudent'),('Tom','Cruise',51,'2003004000','TomCruise1234@gmail.com',57,'None'),('Lord','Voldemort',50,'3004005000','LordVoldemort1234@gmail.com',58,'None'),('Eren','Yeager',15,'4005006000','erenyeager1234@gmail.com',59,'CollegeStudent'),('Tariq','Kharsa',20,'2003004000','Dummy.Email1768@gmail.com',60,'CollegeStudent'),('Mo','Kharsa',10,'2003005000','Dummy.Email1768@gmail.com',61,'None'),('Mark','Evans',10,'2003005000','Dummy.Email1768@gmail.com',62,'None'),('Alvin','Moore',10,'2003004000','Alvin.Moore1234@gmail.com',63,'None'),('Seto','Kaiba',20,'2003005000','JS@gmail.com',64,'None'),('Parker','LIGHTSEY',4,'5122971728','dog5o1012@gmail.com',65,'CollegeStudent'),('scott','fame',36,'2508898907','33940@gmail.com',66,'Veteran'),('hustle','man',30,'2800818897','8897@gmail.com',67,'None'),('Bob','Builder',23,'1112223333','Dummy.Email1768@gmail.com',68,'Veteran'),('Tariq','Karsa',12,'2003005000','dummy.email1768@gmail.com',69,'CollegeStudent'),('as','sa',6,'2003005000','Dummy.Email1768@gmail.com',70,'None'),('ama','ama',10,'2003004000','Dummy.Email1768@gmail.com',71,'CollegeStudent'),('fad','addd',7,'2003004000','Dummy.Email1768@gmail.com',72,'None'),('dummy','person',13,'2003004000','Dummy.Email1768@gmail.com',73,'CollegeStudent'),('agent','adw',7,'2003004000','Dummy.Email1768@gmail.com',74,'CollegeStudent'),('cc','eick',6,'2003004000','Dummy.Email1768@gmail.com',75,'CollegeStudent'),('Monkey','Monkey',7,'2003004000','Dummy.Email1768@gmail.com',76,'CollegeStudent');
/*!40000 ALTER TABLE `CUSTOMERS` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `NOTIFY` AFTER INSERT ON `CUSTOMERS` FOR EACH ROW BEGIN
	INSERT INTO Notifications(Email,cName)
    VALUES(NEW.Email, CONCAT(NEW.FirstName, " ", NEW.LastName));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Departments`
--

DROP TABLE IF EXISTS `Departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departments` (
  `Dep_Num` int NOT NULL,
  `Dep_Name` varchar(30) NOT NULL,
  `Dep_Mus` varchar(65) NOT NULL,
  PRIMARY KEY (`Dep_Num`),
  KEY `Dep_Mus` (`Dep_Mus`),
  CONSTRAINT `Departments_ibfk_1` FOREIGN KEY (`Dep_Mus`) REFERENCES `Museum` (`mName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departments`
--

LOCK TABLES `Departments` WRITE;
/*!40000 ALTER TABLE `Departments` DISABLE KEYS */;
INSERT INTO `Departments` VALUES (1,'Sculpture','Houston Museum of Fine Arts'),(2,'Painting','Houston Museum of Fine Arts'),(3,'Drawing','Houston Museum of Fine Arts'),(4,'Photography','Houston Museum of Fine Arts'),(5,'Sculpture','Houston Museum of Fine Arts');
/*!40000 ALTER TABLE `Departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEES`
--

DROP TABLE IF EXISTS `EMPLOYEES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEES` (
  `EMPLOYEE_ID` int NOT NULL AUTO_INCREMENT,
  `JOBTITLE` varchar(100) NOT NULL,
  `FIRST_NAME` varchar(50) NOT NULL,
  `LAST_NAME` varchar(50) NOT NULL,
  `AGE` int NOT NULL,
  `SEX` enum('M','F','Other') DEFAULT NULL,
  `PHONE_NUMBER` char(12) NOT NULL,
  `EMPLOYEE_ADDRESS` varchar(200) NOT NULL,
  `SALARY` decimal(9,2) NOT NULL,
  `BIRTHDATE` date NOT NULL,
  `dNUM` int NOT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  KEY `dNUM` (`dNUM`),
  CONSTRAINT `EMPLOYEES_ibfk_1` FOREIGN KEY (`dNUM`) REFERENCES `Departments` (`Dep_Num`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEES`
--

LOCK TABLES `EMPLOYEES` WRITE;
/*!40000 ALTER TABLE `EMPLOYEES` DISABLE KEYS */;
INSERT INTO `EMPLOYEES` VALUES (1,'Manager','Harold','hart',21,'M','832-845-9284','440 North St Houston, TX',40000.00,'2000-08-12',1),(3,'Tester','tester','tester',3,'M','111-111-1111','adsf',55555.00,'2000-08-08',2),(4,'Directory','scott','fame',42,'M','321-273-7743','wonderland 77511',70000.00,'2001-08-21',2),(5,'Tour Guide','bagel','betrice',21,'F','771-981-8791','pluto solar system 88760',31000.00,'1999-08-21',3),(6,'Manager','setve','jobs',18,'M','281-098-7729','restwell lane 90191',61420.00,'2002-08-10',3);
/*!40000 ALTER TABLE `EMPLOYEES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exhibition`
--

DROP TABLE IF EXISTS `Exhibition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exhibition` (
  `exName` varchar(50) NOT NULL,
  `COST` double(4,2) NOT NULL,
  `sDate` date NOT NULL,
  `eDate` date NOT NULL,
  `cover_url` varchar(200) NOT NULL,
  PRIMARY KEY (`exName`),
  CONSTRAINT `INVALID_INSTALL_DATE` CHECK ((`sDate` > _utf8mb4'2001-01-01')),
  CONSTRAINT `INVALID_REMOVE_DATE` CHECK (((`eDate` > _utf8mb4'2001-01-01') and (`eDate` >= `sDate`)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exhibition`
--

LOCK TABLES `Exhibition` WRITE;
/*!40000 ALTER TABLE `Exhibition` DISABLE KEYS */;
INSERT INTO `Exhibition` VALUES ('Leonardo\'s collection',38.90,'2022-04-04','2022-04-18','../images/leonardo.jpg.webp'),('Monet\'s collection',59.99,'2022-04-04','2022-04-20','../images/monet.jpg'),('Rafael\'s collection',45.99,'2022-04-04','2022-04-20','../images/rafael.jpg'),('Rococo Period',51.99,'2022-04-04','2022-04-20','../images/rococo-period.jpg'),('Summer Art Pieces',25.00,'2021-06-09','2022-07-09','../images/summer_art.png'),('Vangoh\'s collection',38.99,'2022-04-04','2022-04-20','../images/vangoh.jpg');
/*!40000 ALTER TABLE `Exhibition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GiftShop`
--

DROP TABLE IF EXISTS `GiftShop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GiftShop` (
  `GiftID` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `GiftName` varchar(30) NOT NULL,
  `Price` double(16,2) NOT NULL,
  `SpecialStatus` enum('Sold','In Stock') DEFAULT NULL,
  PRIMARY KEY (`GiftID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GiftShop`
--

LOCK TABLES `GiftShop` WRITE;
/*!40000 ALTER TABLE `GiftShop` DISABLE KEYS */;
INSERT INTO `GiftShop` VALUES (2,100,'Shirt',12.99,NULL),(3,100,'Snow Globe',1.00,NULL),(4,34,'Keychain',0.99,NULL),(5,1000,'Lollipop',0.99,NULL);
/*!40000 ALTER TABLE `GiftShop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Museum`
--

DROP TABLE IF EXISTS `Museum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Museum` (
  `mName` varchar(65) NOT NULL,
  `Street` varchar(30) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Province` varchar(20) NOT NULL,
  `ZipCode` varchar(5) NOT NULL,
  `sTime` time NOT NULL,
  `eTime` time NOT NULL,
  `Ratings` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`mName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Museum`
--

LOCK TABLES `Museum` WRITE;
/*!40000 ALTER TABLE `Museum` DISABLE KEYS */;
INSERT INTO `Museum` VALUES ('Houston Museum of Fine Arts','1001 Bissonnet St','Houston','TX','77005','09:00:00','18:00:00',3.1);
/*!40000 ALTER TABLE `Museum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notifications`
--

DROP TABLE IF EXISTS `Notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notifications` (
  `EID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `cName` char(100) NOT NULL,
  PRIMARY KEY (`EID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notifications`
--

LOCK TABLES `Notifications` WRITE;
/*!40000 ALTER TABLE `Notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TICKET`
--

DROP TABLE IF EXISTS `TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TICKET` (
  `TID` int NOT NULL AUTO_INCREMENT,
  `TTYPES` enum('CHILD','SENIOR','REGULAR','VETERAN','STUDENT') NOT NULL,
  `QUANTITY` int NOT NULL,
  `PRICE` decimal(8,2) NOT NULL,
  `SOLDDATE` date DEFAULT NULL,
  `CUSID` int NOT NULL,
  PRIMARY KEY (`TID`),
  KEY `CUSID` (`CUSID`),
  CONSTRAINT `TICKET_ibfk_1` FOREIGN KEY (`CUSID`) REFERENCES `CUSTOMERS` (`CID`),
  CONSTRAINT `INVALID_SOLDDATE` CHECK (((`SOLDDATE` >= _utf8mb4'2001-01-01') and (`SOLDDATE` <= sysdate())))
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TICKET`
--

LOCK TABLES `TICKET` WRITE;
/*!40000 ALTER TABLE `TICKET` DISABLE KEYS */;
INSERT INTO `TICKET` VALUES (55,'REGULAR',1,10.00,'2022-04-18',57),(56,'CHILD',1,5.00,'2022-04-18',57),(57,'STUDENT',1,1.00,'2022-04-18',57),(58,'SENIOR',1,8.00,'2022-04-18',57),(59,'VETERAN',1,8.00,'2022-04-18',57),(60,'REGULAR',1,10.00,'2022-04-01',58),(61,'CHILD',1,5.00,'2022-04-01',58),(62,'STUDENT',1,1.00,'2022-04-01',58),(63,'SENIOR',1,8.00,'2022-04-01',58),(64,'VETERAN',1,8.00,'2022-04-01',58),(65,'REGULAR',1,10.00,'2022-03-15',59),(66,'CHILD',1,5.00,'2022-03-15',59),(67,'STUDENT',1,1.00,'2022-03-15',59),(68,'SENIOR',1,8.00,'2022-03-15',59),(69,'VETERAN',1,8.00,'2022-03-15',59),(70,'REGULAR',1,10.00,'2022-03-03',60),(71,'CHILD',1,5.00,'2022-03-03',60),(72,'STUDENT',1,1.00,'2022-03-03',60),(73,'SENIOR',1,8.00,'2022-03-03',60),(74,'VETERAN',1,8.00,'2022-03-03',60),(75,'STUDENT',1,1.00,'2022-03-11',61),(76,'REGULAR',1,10.00,'2022-03-12',62),(77,'CHILD',1,5.00,'2022-03-22',63),(78,'STUDENT',1,1.00,'2022-01-21',64),(79,'REGULAR',1,10.00,'2022-03-26',65),(80,'REGULAR',1,10.00,'2022-03-26',65),(81,'VETERAN',4,8.00,'2022-04-18',66),(82,'REGULAR',1,10.00,'2022-03-26',65),(83,'SENIOR',1,8.00,'2022-04-18',67),(84,'REGULAR',1,10.00,'2022-03-26',65),(85,'REGULAR',1,10.00,'2022-03-15',68),(86,'CHILD',2,5.00,'2022-03-15',68),(87,'STUDENT',3,1.00,'2022-03-15',68),(88,'SENIOR',4,8.00,'2022-03-15',68),(89,'VETERAN',5,8.00,'2022-03-15',68),(90,'REGULAR',1,10.00,'2022-04-16',60),(91,'CHILD',1,5.00,'2022-04-16',60),(92,'REGULAR',1,10.00,'2022-03-26',69),(93,'REGULAR',1,10.00,'2022-03-26',70),(94,'REGULAR',1,10.00,'2022-03-30',71),(95,'REGULAR',1,10.00,'2022-03-26',72),(96,'REGULAR',1,10.00,'2022-03-30',73),(97,'REGULAR',1,10.00,'2022-03-30',74),(98,'REGULAR',1,10.00,'2022-03-26',75),(99,'REGULAR',1,10.00,'2022-03-30',76);
/*!40000 ALTER TABLE `TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `VT`
--

DROP TABLE IF EXISTS `VT`;
/*!50001 DROP VIEW IF EXISTS `VT`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `VT` AS SELECT 
 1 AS `Customer`,
 1 AS `ID`,
 1 AS `Label`,
 1 AS `Quantity`,
 1 AS `Price`,
 1 AS `DateSold`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `RID` int NOT NULL AUTO_INCREMENT,
  `rNum` decimal(2,1) NOT NULL,
  `cName` char(100) NOT NULL,
  PRIMARY KEY (`RID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (10,5.0,'John Wick'),(11,5.0,'Customer'),(12,1.0,'Customer'),(13,4.5,'Customer'),(14,5.0,'Customer'),(15,4.0,'Customer'),(16,4.9,'Customer'),(17,2.0,'Customer'),(18,4.9,'Customer'),(19,5.0,'Customer'),(20,2.6,'Customer'),(21,0.1,'Customer'),(22,0.8,'Customer'),(23,2.0,'Customer'),(24,4.8,'Customer'),(25,0.7,'Customer'),(26,0.4,'Customer'),(27,5.0,'Customer'),(28,2.0,'Customer'),(29,5.0,'Customer'),(30,0.3,'Customer');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `RATE` AFTER INSERT ON `rating` FOR EACH ROW BEGIN
	UPDATE Museum 
    SET Ratings = (SELECT AVG(rNum) FROM rating);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'FinalTeam12'
--

--
-- Dumping routines for database 'FinalTeam12'
--

--
-- Final view structure for view `VT`
--

/*!50001 DROP VIEW IF EXISTS `VT`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `VT` AS select concat(`CUSTOMERS`.`FirstName`,' ',`CUSTOMERS`.`LastName`) AS `Customer`,`TICKET`.`TID` AS `ID`,`TICKET`.`TTYPES` AS `Label`,`TICKET`.`QUANTITY` AS `Quantity`,`TICKET`.`PRICE` AS `Price`,`TICKET`.`SOLDDATE` AS `DateSold` from (`TICKET` join `CUSTOMERS` on((`TICKET`.`CUSID` = `CUSTOMERS`.`CID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-24  0:05:49
