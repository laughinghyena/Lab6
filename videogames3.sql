-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: videogames
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `videogames`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `videogames` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `videogames`;

--
-- Table structure for table `console`
--

DROP TABLE IF EXISTS `console`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `console` (
  `ConsoleID` int(11) NOT NULL AUTO_INCREMENT,
  `ConsoleName` text,
  `ReleaseYear` varchar(10) DEFAULT NULL,
  `Generation` varchar(25) DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`ConsoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `console`
--

LOCK TABLES `console` WRITE;
/*!40000 ALTER TABLE `console` DISABLE KEYS */;
INSERT INTO `console` VALUES (1,'PlayStation','1995','Fifth','None as of yet'),(2,'PlayStation 2','2000','Sixth','None as of yet'),(3,'PlayStation 3','2006','Seventh','None as of yet'),(4,'PlayStation 4','2013','Eighth','None as of yet'),(5,'ds','2004','Seventh','Handheld'),(6,'3ds','2011','Eighth','Handheld');
/*!40000 ALTER TABLE `console` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library` (
  `GameID` int(11) DEFAULT NULL,
  `ConsoleID` int(11) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  UNIQUE KEY `pkLibrary` (`GameID`,`ConsoleID`),
  KEY `ConsoleID` (`ConsoleID`),
  CONSTRAINT `library_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `videogames` (`GameID`),
  CONSTRAINT `library_ibfk_2` FOREIGN KEY (`ConsoleID`) REFERENCES `console` (`ConsoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES (1,1,'None as yet'),(2,2,'None as yet'),(3,3,'None as yet'),(4,4,'None as yet'),(5,5,'None as yet');
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price` (
  `PriceID` int(11) NOT NULL AUTO_INCREMENT,
  `PriceLocation` varchar(100) DEFAULT NULL,
  `Price` decimal(7,2) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  PRIMARY KEY (`PriceID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,'https://www.amazon.com',22.99,'2017-06-18','21:43:00'),(2,'http://www.gamestop.com',39.99,'2017-06-18','21:43:00'),(3,'https://www.amazon.com',17.82,'2017-06-18','21:43:00'),(4,'https://www.amazon.com',15.84,'2017-06-18','21:43:00');
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videogames`
--

DROP TABLE IF EXISTS `videogames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videogames` (
  `GameName` text,
  `Genre` text,
  `Description` text,
  `GameID` int(11) NOT NULL AUTO_INCREMENT,
  `Own` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`GameID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videogames`
--

LOCK TABLES `videogames` WRITE;
/*!40000 ALTER TABLE `videogames` DISABLE KEYS */;
INSERT INTO `videogames` VALUES ('Tekken 3','3d fighter','A game',1,1),('Tekken 5','3d fighter','A game',2,1),('Elder Scrolls 5: Skyrim','western rpg','A game',3,1),('Persona 5','jrpg','A game',4,1),('Dragon Quest V: Hand of the Heavenly Bride','jrpg','A game',5,1),('Dragon Quest IV: Chapters of the Chosen','jrpg','A game',6,0),('Radiant Historia: Perfect Chronology','jrpg','A game',7,0),('Metal Gear Solid HD Collection','stealth action','Compilation of Metal Gear Solid 2: Sons of Liberty, Metal Gear Solid: Snake Eater and Metal Gear Solid: Peace Walker',8,0),('Far Cry 4','Open World First Person Shooter','A game',9,0);
/*!40000 ALTER TABLE `videogames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `want`
--

DROP TABLE IF EXISTS `want`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `want` (
  `GameID` int(11) DEFAULT NULL,
  `ConsoleID` int(11) DEFAULT NULL,
  `WantLevel` int(11) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `PriceID` int(11) DEFAULT NULL,
  UNIQUE KEY `pkWant` (`GameID`,`ConsoleID`),
  KEY `ConsoleID` (`ConsoleID`),
  KEY `WantLevel` (`WantLevel`),
  KEY `PriceID` (`PriceID`),
  CONSTRAINT `want_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `videogames` (`GameID`),
  CONSTRAINT `want_ibfk_2` FOREIGN KEY (`ConsoleID`) REFERENCES `console` (`ConsoleID`),
  CONSTRAINT `want_ibfk_3` FOREIGN KEY (`WantLevel`) REFERENCES `wantlevel` (`wantLevel`),
  CONSTRAINT `want_ibfk_4` FOREIGN KEY (`PriceID`) REFERENCES `price` (`PriceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `want`
--

LOCK TABLES `want` WRITE;
/*!40000 ALTER TABLE `want` DISABLE KEYS */;
INSERT INTO `want` VALUES (6,5,1,'none as yet',1),(7,6,6,'Q1 2018 Price is for Preorder',2),(8,3,1,'none as yet',3),(9,4,1,'none as yet',4);
/*!40000 ALTER TABLE `want` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wantlevel`
--

DROP TABLE IF EXISTS `wantlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wantlevel` (
  `wantLevel` int(11) NOT NULL AUTO_INCREMENT,
  `wantDescription` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`wantLevel`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wantlevel`
--

LOCK TABLES `wantlevel` WRITE;
/*!40000 ALTER TABLE `wantlevel` DISABLE KEYS */;
INSERT INTO `wantlevel` VALUES (1,'High'),(2,'Wait for lower price'),(3,'Maybe'),(4,'Undecided'),(5,'Need more information'),(6,'Not Released Yet'),(7,'Do not want');
/*!40000 ALTER TABLE `wantlevel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-18 22:05:33
