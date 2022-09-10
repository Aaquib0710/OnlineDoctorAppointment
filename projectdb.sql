-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: healthblazedb
-- ------------------------------------------------------
-- Server version	8.0.29

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

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appid` int NOT NULL AUTO_INCREMENT,
  `apid` int NOT NULL,
  `adocid` int NOT NULL,
  `ahospid` int NOT NULL,
  `payment` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `timeslot` time DEFAULT NULL,
  `appsatatuspat` varchar(45) DEFAULT NULL,
  `appstatusdoc` varchar(45) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`appid`),
  KEY `pid_idx` (`apid`),
  KEY `ahospid_idx` (`ahospid`),
  KEY `adocid_idx` (`adocid`),
  CONSTRAINT `adocid` FOREIGN KEY (`adocid`) REFERENCES `doctor` (`docid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ahospid` FOREIGN KEY (`ahospid`) REFERENCES `hospital` (`hospid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ptid` FOREIGN KEY (`apid`) REFERENCES `patient` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docschedule`
--

DROP TABLE IF EXISTS `docschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docschedule` (
  `shospid` int NOT NULL,
  `sdocid` int NOT NULL,
  `starttime` time DEFAULT NULL,
  `weekdays` varchar(45) DEFAULT NULL,
  `sid` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sid`),
  KEY `shospid_idx` (`shospid`),
  KEY `sdocid_idx` (`sdocid`),
  CONSTRAINT `sdocid` FOREIGN KEY (`sdocid`) REFERENCES `doctor` (`docid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shospid` FOREIGN KEY (`shospid`) REFERENCES `hospital` (`hospid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docschedule`
--

LOCK TABLES `docschedule` WRITE;
/*!40000 ALTER TABLE `docschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `docschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `docid` int NOT NULL AUTO_INCREMENT,
  `docname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `experience` double NOT NULL,
  `fees` int NOT NULL,
  `speciality` varchar(255) DEFAULT NULL,
  `loginid` int NOT NULL,
  PRIMARY KEY (`docid`),
  KEY `fk_login` (`loginid`),
  CONSTRAINT `fk_login` FOREIGN KEY (`loginid`) REFERENCES `login` (`loginid`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (111,'Bhangar','bhangar123@gmail.com',1,1000,'md',1);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `srno` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `hospid` int NOT NULL,
  `docid` int NOT NULL,
  `desciption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`srno`),
  KEY `pid_idx` (`pid`),
  KEY `docid_idx` (`docid`),
  KEY `hospid_idx` (`hospid`),
  CONSTRAINT `docid` FOREIGN KEY (`docid`) REFERENCES `doctor` (`docid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hospid` FOREIGN KEY (`hospid`) REFERENCES `hospital` (`hospid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `hospid` int NOT NULL AUTO_INCREMENT,
  `hospname` varchar(45) DEFAULT NULL,
  `mobileno` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `loginid` int NOT NULL,
  PRIMARY KEY (`hospid`),
  KEY `loginid_idx` (`loginid`),
  CONSTRAINT `loginid` FOREIGN KEY (`loginid`) REFERENCES `login` (`loginid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `loginid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`loginid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'bhangar123@gmail.com','12345','doctor'),(2,'bhangar123@gmail.com',NULL,NULL);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `contactno` varchar(255) DEFAULT NULL,
  `dateofbirth` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `logid` int NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `logid` (`logid`),
  CONSTRAINT `logid` FOREIGN KEY (`logid`) REFERENCES `login` (`loginid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-11  0:00:56
