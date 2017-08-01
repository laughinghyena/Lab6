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
INSERT INTO `console` VALUES (1,'PlayStation','1995','Fifth','None as of yet'),(2,'PlayStation 2','2000','Sixth','None as of yet'),(3,'PlayStation 3','2006','Seventh','None as of yet'),(4,'PlayStation 4','2013','Eighth','None as of yet');
/*!40000 ALTER TABLE `console` ENABLE KEYS */;
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
  `ConsoleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`GameID`),
  KEY `ConsoleID` (`ConsoleID`),
  CONSTRAINT `videogames_ibfk_1` FOREIGN KEY (`ConsoleID`) REFERENCES `console` (`ConsoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videogames`
--

LOCK TABLES `videogames` WRITE;
/*!40000 ALTER TABLE `videogames` DISABLE KEYS */;
INSERT INTO `videogames` VALUES ('Tekken 3','3d fighter','A game',1,1),('Tekken 5','3d fighter','A game',2,2),('Elder Scrolls 5: Skyrim','western rpg','A game',3,3),('Persona 5','jrpg','A game',4,4);
/*!40000 ALTER TABLE `videogames` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-07 17:36:58
