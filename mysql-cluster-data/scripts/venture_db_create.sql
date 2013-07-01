USE venture;

/*Create Logfile Group ts_venture_log_group
Add Undofile 'ts_venture_undo'
engine=ndbcluster;

Create Tablespace ts_venture
Add Datafile 'ts_venture_data'
Use Logfile group ts_venture_log_group
Engine=ndbcluster;*/

DROP TABLE IF EXISTS `invitations`;
CREATE  TABLE `invitations` (
	`from_uid` INT NOT NULL STORAGE MEMORY,
	`to_uid` INT NOT NULL STORAGE MEMORY,
	`for_resource` varchar(58) NOT NULL STORAGE DISK,
	`invitation_ts` timestamp NOT NULL STORAGE DISK DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (from_uid, to_uid)) 
TABLESPACE ts_venture
ENGINE = ndbcluster
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `videos`;
CREATE  TABLE `videos` (
	`video_id` varchar(55) NOT NULL STORAGE MEMORY, 
	`channel_owner_uid` INT NOT NULL STORAGE MEMORY,
	`channel_name` varchar(100) NOT NULL STORAGE DISK,
	`video_title` varchar(100) NOT NULL STORAGE DISK,
	`video_visibility` varchar(100) NOT NULL STORAGE DISK,
	`video_desc` varchar(300) STORAGE DISK,
	`video_type` ENUM('live_broadcast', 'uploaded') NOT NULL STORAGE DISK,
	`broadcast_device` ENUM('web_cam', 'android_device', 'ios_device') STORAGE DISK,
	PRIMARY KEY (video_id, channel_owner_uid)) 
TABLESPACE ts_venture
ENGINE = ndbcluster
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `channels`;
CREATE  TABLE `channels` (
	`channel_owner_uid` INT NOT NULL STORAGE MEMORY,
	`channel_name` varchar(50) NOT NULL STORAGE MEMORY,
	`channel_visibility` varchar(70) NOT NULL STORAGE DISK,
	`channel_desc` varchar(300) STORAGE DISK,
	PRIMARY KEY (channel_owner_uid, channel_name)) 
TABLESPACE ts_venture
ENGINE = ndbcluster
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `connection_groups`f
CREATE  TABLE `connection_groups` (
	`uid` INT NOT NULL STORAGE MEMORY,
	`cg_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL STORAGE MEMORY,
	`cg_members` TEXT,
	PRIMARY KEY (uid, cg_name)) 
TABLESPACE ts_venture
ENGINE = ndbcluster
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

--
-- Table structure for table `edu_desc`
--

DROP TABLE IF EXISTS `connections`; 
CREATE  TABLE `connections` (
  `conn_user1` INT NOT NULL STORAGE MEMORY,
  `conn_user2` INT NOT NULL STORAGE MEMORY,
  `conn_relation` varchar(30) COLLATE utf8_unicode_ci NOT NULL STORAGE DISK,
  PRIMARY KEY (conn_user1, conn_user2) )
TABLESPACE ts_venture
ENGINE = ndbcluster
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `connection_requests`;
CREATE  TABLE `connection_requests` (
  `to_user` INT NOT NULL STORAGE MEMORY,
  `from_user` INT NOT NULL STORAGE MEMORY,
  `request_status` ENUM('pending_approval', 'delayed_for_review') NOT NULL STORAGE DISK,
  PRIMARY KEY (to_user, from_user) )
TABLESPACE ts_venture
ENGINE = ndbcluster
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


DROP TABLE IF EXISTS `edu_desc`;
CREATE TABLE `edu_desc` (
  `uid` int(11) NOT NULL STORAGE MEMORY,
  `institute_name` varchar(70) COLLATE utf8_unicode_ci NOT NULL STORAGE DISK,
  `inst_from` varchar(20) COLLATE utf8_unicode_ci STORAGE DISK DEFAULT NULL,
  `inst_to` varchar(20) COLLATE utf8_unicode_ci STORAGE DISK DEFAULT NULL,
  KEY `index_uid` (`uid`)
) TABLESPACE ts_venture ENGINE=ndbcluster DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
CREATE TABLE `user` (
  `uid` int(11) NOT NULL STORAGE MEMORY AUTO_INCREMENT,
  `profile_image` longblob STORAGE DISK,
  `emailid` varchar(30) COLLATE utf8_unicode_ci NOT NULL STORAGE MEMORY,
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL STORAGE DISK,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL STORAGE DISK,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL STORAGE DISK,
  `dob` varchar(20) COLLATE utf8_unicode_ci NOT NULL STORAGE DISK,
  `gender` enum('M','F') COLLATE utf8_unicode_ci NOT NULL STORAGE DISK,
  `current_home` varchar(80) COLLATE utf8_unicode_ci NOT NULL STORAGE DISK,
  `hometown` varchar(80) COLLATE utf8_unicode_ci NOT NULL STORAGE DISK,
  `join_date` timestamp NOT NULL STORAGE DISK DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`,`emailid`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  UNIQUE KEY `emailid_UNIQUE` (`emailid`)
) TABLESPACE ts_venture ENGINE=ndbcluster DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
CREATE TABLE `work_desc` (
  `uid` int(11) NOT NULL STORAGE MEMORY,
  `work_designation` varchar(50) COLLATE utf8_unicode_ci NOT NULL STORAGE DISK,
  `work_place_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL STORAGE DISK,
  `w_from` varchar(20) COLLATE utf8_unicode_ci STORAGE DISK DEFAULT NULL,
  `w_to` varchar(20) COLLATE utf8_unicode_ci STORAGE DISK DEFAULT NULL,
  KEY `index_uid` (`uid`)
) TABLESPACE ts_venture ENGINE=ndbcluster DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
