-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: venture
-- ------------------------------------------------------
-- Server version	5.5.30-ndb-7.2.12-cluster-gpl

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

USE venture;

--
-- Table structure for table `edu_desc`
--

CREATE  TABLE `connection_requests` (
  `to_user` INT NOT NULL STORAGE MEMORY,
  `from_user` INT NOT NULL STORAGE MEMORY,
  `request_status` ENUM('pending_approval', 'delayed_for_review') NOT NULL STORAGE DISK,
  PRIMARY KEY (`to_user`) )
TABLESPACE ts_venture
ENGINE = ndbcluster
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


DROP TABLE IF EXISTS `edu_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_desc` (
  `uid` int(11) NOT NULL /*!50120 STORAGE MEMORY */,
  `institute_name` varchar(70) COLLATE utf8_unicode_ci NOT NULL /*!50120 STORAGE DISK */,
  `inst_from` varchar(20) COLLATE utf8_unicode_ci /*!50120 STORAGE DISK */ DEFAULT NULL,
  `inst_to` varchar(20) COLLATE utf8_unicode_ci /*!50120 STORAGE DISK */ DEFAULT NULL,
  KEY `index_uid` (`uid`)
) /*!50100 TABLESPACE ts_venture */ ENGINE=ndbcluster DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_desc`
--

LOCK TABLES `edu_desc` WRITE;
/*!40000 ALTER TABLE `edu_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL /*!50120 STORAGE MEMORY */ AUTO_INCREMENT,
  `profile_image` longblob /*!50120 STORAGE DISK */,
  `emailid` varchar(30) COLLATE utf8_unicode_ci NOT NULL /*!50120 STORAGE MEMORY */,
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL /*!50120 STORAGE DISK */,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL /*!50120 STORAGE DISK */,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL /*!50120 STORAGE DISK */,
  `dob` varchar(20) COLLATE utf8_unicode_ci NOT NULL /*!50120 STORAGE DISK */,
  `gender` enum('M','F') COLLATE utf8_unicode_ci NOT NULL /*!50120 STORAGE DISK */,
  `current_home` varchar(80) COLLATE utf8_unicode_ci NOT NULL /*!50120 STORAGE DISK */,
  `hometown` varchar(80) COLLATE utf8_unicode_ci NOT NULL /*!50120 STORAGE DISK */,
  `join_date` timestamp NOT NULL /*!50120 STORAGE DISK */ DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`,`emailid`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  UNIQUE KEY `emailid_UNIQUE` (`emailid`)
) /*!50100 TABLESPACE ts_venture */ ENGINE=ndbcluster DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_desc`
--

DROP TABLE IF EXISTS `work_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_desc` (
  `uid` int(11) NOT NULL /*!50120 STORAGE MEMORY */,
  `work_designation` varchar(50) COLLATE utf8_unicode_ci NOT NULL /*!50120 STORAGE DISK */,
  `work_place_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL /*!50120 STORAGE DISK */,
  `w_from` varchar(20) COLLATE utf8_unicode_ci /*!50120 STORAGE DISK */ DEFAULT NULL,
  `w_to` varchar(20) COLLATE utf8_unicode_ci /*!50120 STORAGE DISK */ DEFAULT NULL,
  KEY `index_uid` (`uid`)
) /*!50100 TABLESPACE ts_venture */ ENGINE=ndbcluster DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_desc`
--

LOCK TABLES `work_desc` WRITE;
/*!40000 ALTER TABLE `work_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_desc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-23 23:03:06
