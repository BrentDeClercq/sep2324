-- MariaDB dump 10.19  Distrib 10.5.22-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: nextcloud
-- ------------------------------------------------------
-- Server version	10.5.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oc_accounts`
--

DROP TABLE IF EXISTS `oc_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts` (
  `uid` varchar(64) NOT NULL DEFAULT '',
  `data` longtext NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts`
--

LOCK TABLES `oc_accounts` WRITE;
/*!40000 ALTER TABLE `oc_accounts` DISABLE KEYS */;
INSERT INTO `oc_accounts` VALUES ('Brent','{\"displayname\":{\"value\":\"Brent\",\"scope\":\"v2-federated\",\"verified\":\"0\"},\"address\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"website\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"email\":{\"value\":\"brent.declercq2@student.hogent.be\",\"scope\":\"v2-federated\",\"verified\":\"1\"},\"avatar\":{\"value\":\"\",\"scope\":\"v2-federated\",\"verified\":\"0\"},\"phone\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"twitter\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"fediverse\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"organisation\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"role\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"headline\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"biography\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"profile_enabled\":{\"value\":\"1\",\"scope\":\"v2-local\",\"verified\":\"0\"}}'),('next','{\"displayname\":{\"value\":\"next\",\"scope\":\"v2-federated\",\"verified\":\"0\"},\"address\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"website\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"email\":{\"value\":null,\"scope\":\"v2-federated\",\"verified\":\"0\"},\"avatar\":{\"scope\":\"v2-federated\"},\"phone\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"twitter\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"fediverse\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"organisation\":{\"value\":\"\",\"scope\":\"v2-local\"},\"role\":{\"value\":\"\",\"scope\":\"v2-local\"},\"headline\":{\"value\":\"\",\"scope\":\"v2-local\"},\"biography\":{\"value\":\"\",\"scope\":\"v2-local\"},\"profile_enabled\":{\"value\":\"1\"}}');
/*!40000 ALTER TABLE `oc_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_accounts_data`
--

DROP TABLE IF EXISTS `oc_accounts_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `accounts_data_uid` (`uid`),
  KEY `accounts_data_name` (`name`),
  KEY `accounts_data_value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts_data`
--

LOCK TABLES `oc_accounts_data` WRITE;
/*!40000 ALTER TABLE `oc_accounts_data` DISABLE KEYS */;
INSERT INTO `oc_accounts_data` VALUES (1,'next','displayname','next'),(2,'next','address',''),(3,'next','website',''),(4,'next','email',''),(5,'next','phone',''),(6,'next','twitter',''),(7,'next','fediverse',''),(8,'next','organisation',''),(9,'next','role',''),(10,'next','headline',''),(11,'next','biography',''),(12,'next','profile_enabled','1'),(25,'Brent','displayname','Brent'),(26,'Brent','address',''),(27,'Brent','website',''),(28,'Brent','email','brent.declercq2@student.hogent.be'),(29,'Brent','phone',''),(30,'Brent','twitter',''),(31,'Brent','fediverse',''),(32,'Brent','organisation',''),(33,'Brent','role',''),(34,'Brent','headline',''),(35,'Brent','biography',''),(36,'Brent','profile_enabled','1');
/*!40000 ALTER TABLE `oc_accounts_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity`
--

DROP TABLE IF EXISTS `oc_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity` (
  `activity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `user` varchar(64) DEFAULT NULL,
  `affecteduser` varchar(64) NOT NULL,
  `app` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `subjectparams` longtext NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `messageparams` longtext DEFAULT NULL,
  `file` varchar(4000) DEFAULT NULL,
  `link` varchar(4000) DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`activity_id`),
  KEY `activity_user_time` (`affecteduser`,`timestamp`),
  KEY `activity_filter_by` (`affecteduser`,`user`,`timestamp`),
  KEY `activity_filter` (`affecteduser`,`type`,`app`,`timestamp`),
  KEY `activity_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity`
--

LOCK TABLES `oc_activity` WRITE;
/*!40000 ALTER TABLE `oc_activity` DISABLE KEYS */;
INSERT INTO `oc_activity` VALUES (1,1714125887,30,'file_created','next','next','files','created_self','[{\"3\":\"\\/Documents\"}]','','[]','/Documents','http:///nextcloud/index.php/apps/files/?dir=/','files',3),(2,1714125887,30,'file_created','next','next','files','created_self','[{\"4\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',4),(3,1714125887,30,'file_changed','next','next','files','changed_self','[{\"4\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',4),(4,1714125887,30,'file_created','next','next','files','created_self','[{\"5\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',5),(5,1714125887,30,'file_changed','next','next','files','changed_self','[{\"5\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',5),(6,1714125887,30,'file_created','next','next','files','created_self','[{\"6\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',6),(7,1714125887,30,'file_changed','next','next','files','changed_self','[{\"6\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',6),(8,1714125887,30,'file_created','next','next','files','created_self','[{\"7\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',7),(9,1714125887,30,'file_changed','next','next','files','changed_self','[{\"7\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',7),(10,1714125887,30,'file_created','next','next','files','created_self','[{\"8\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http:///nextcloud/index.php/apps/files/?dir=/','files',8),(11,1714125887,30,'file_changed','next','next','files','changed_self','[{\"8\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http:///nextcloud/index.php/apps/files/?dir=/','files',8),(12,1714125887,30,'file_created','next','next','files','created_self','[{\"9\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http:///nextcloud/index.php/apps/files/?dir=/','files',9),(13,1714125887,30,'file_changed','next','next','files','changed_self','[{\"9\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http:///nextcloud/index.php/apps/files/?dir=/','files',9),(14,1714125887,30,'file_created','next','next','files','created_self','[{\"10\":\"\\/Templates\"}]','','[]','/Templates','http:///nextcloud/index.php/apps/files/?dir=/','files',10),(15,1714125887,30,'file_created','next','next','files','created_self','[{\"11\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',11),(16,1714125887,30,'file_changed','next','next','files','changed_self','[{\"11\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',11),(17,1714125887,30,'file_created','next','next','files','created_self','[{\"12\":\"\\/Templates\\/Party invitation.odt\"}]','','[]','/Templates/Party invitation.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',12),(18,1714125887,30,'file_changed','next','next','files','changed_self','[{\"12\":\"\\/Templates\\/Party invitation.odt\"}]','','[]','/Templates/Party invitation.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',12),(19,1714125887,30,'file_created','next','next','files','created_self','[{\"13\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',13),(20,1714125887,30,'file_changed','next','next','files','changed_self','[{\"13\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',13),(21,1714125887,30,'file_created','next','next','files','created_self','[{\"14\":\"\\/Templates\\/Mother\'s day.odt\"}]','','[]','/Templates/Mother\'s day.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',14),(22,1714125887,30,'file_changed','next','next','files','changed_self','[{\"14\":\"\\/Templates\\/Mother\'s day.odt\"}]','','[]','/Templates/Mother\'s day.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',14),(23,1714125887,30,'file_created','next','next','files','created_self','[{\"15\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',15),(24,1714125887,30,'file_changed','next','next','files','changed_self','[{\"15\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',15),(25,1714125887,30,'file_created','next','next','files','created_self','[{\"16\":\"\\/Templates\\/Timesheet.ods\"}]','','[]','/Templates/Timesheet.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',16),(26,1714125887,30,'file_changed','next','next','files','changed_self','[{\"16\":\"\\/Templates\\/Timesheet.ods\"}]','','[]','/Templates/Timesheet.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',16),(27,1714125887,30,'file_created','next','next','files','created_self','[{\"17\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',17),(28,1714125887,30,'file_changed','next','next','files','changed_self','[{\"17\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',17),(29,1714125887,30,'file_created','next','next','files','created_self','[{\"18\":\"\\/Templates\\/Photo book.odt\"}]','','[]','/Templates/Photo book.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',18),(30,1714125887,30,'file_changed','next','next','files','changed_self','[{\"18\":\"\\/Templates\\/Photo book.odt\"}]','','[]','/Templates/Photo book.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',18),(31,1714125887,30,'file_created','next','next','files','created_self','[{\"19\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',19),(32,1714125888,30,'file_changed','next','next','files','changed_self','[{\"19\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',19),(33,1714125888,30,'file_created','next','next','files','created_self','[{\"20\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',20),(34,1714125888,30,'file_changed','next','next','files','changed_self','[{\"20\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',20),(35,1714125888,30,'file_created','next','next','files','created_self','[{\"21\":\"\\/Templates\\/Resume.odt\"}]','','[]','/Templates/Resume.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',21),(36,1714125888,30,'file_changed','next','next','files','changed_self','[{\"21\":\"\\/Templates\\/Resume.odt\"}]','','[]','/Templates/Resume.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',21),(37,1714125888,30,'file_created','next','next','files','created_self','[{\"22\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',22),(38,1714125888,30,'file_changed','next','next','files','changed_self','[{\"22\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',22),(39,1714125888,30,'file_created','next','next','files','created_self','[{\"23\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',23),(40,1714125888,30,'file_changed','next','next','files','changed_self','[{\"23\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',23),(41,1714125888,30,'file_created','next','next','files','created_self','[{\"24\":\"\\/Templates\\/Modern company.odp\"}]','','[]','/Templates/Modern company.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',24),(42,1714125888,30,'file_changed','next','next','files','changed_self','[{\"24\":\"\\/Templates\\/Modern company.odp\"}]','','[]','/Templates/Modern company.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',24),(43,1714125888,30,'file_created','next','next','files','created_self','[{\"25\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',25),(44,1714125888,30,'file_changed','next','next','files','changed_self','[{\"25\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',25),(45,1714125888,30,'file_created','next','next','files','created_self','[{\"26\":\"\\/Templates\\/Business model canvas.ods\"}]','','[]','/Templates/Business model canvas.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',26),(46,1714125888,30,'file_changed','next','next','files','changed_self','[{\"26\":\"\\/Templates\\/Business model canvas.ods\"}]','','[]','/Templates/Business model canvas.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',26),(47,1714125888,30,'file_created','next','next','files','created_self','[{\"27\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',27),(48,1714125888,30,'file_changed','next','next','files','changed_self','[{\"27\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',27),(49,1714125888,30,'file_created','next','next','files','created_self','[{\"28\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',28),(50,1714125888,30,'file_changed','next','next','files','changed_self','[{\"28\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',28),(51,1714125888,30,'file_created','next','next','files','created_self','[{\"29\":\"\\/Templates\\/Syllabus.odt\"}]','','[]','/Templates/Syllabus.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',29),(52,1714125888,30,'file_changed','next','next','files','changed_self','[{\"29\":\"\\/Templates\\/Syllabus.odt\"}]','','[]','/Templates/Syllabus.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',29),(53,1714125888,30,'file_created','next','next','files','created_self','[{\"30\":\"\\/Templates\\/Gotong royong.odp\"}]','','[]','/Templates/Gotong royong.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',30),(54,1714125888,30,'file_changed','next','next','files','changed_self','[{\"30\":\"\\/Templates\\/Gotong royong.odp\"}]','','[]','/Templates/Gotong royong.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',30),(55,1714125888,30,'file_created','next','next','files','created_self','[{\"31\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',31),(56,1714125888,30,'file_changed','next','next','files','changed_self','[{\"31\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',31),(57,1714125888,30,'file_created','next','next','files','created_self','[{\"32\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',32),(58,1714125888,30,'file_changed','next','next','files','changed_self','[{\"32\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',32),(59,1714125888,30,'file_created','next','next','files','created_self','[{\"33\":\"\\/Templates\\/Yellow idea.odp\"}]','','[]','/Templates/Yellow idea.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',33),(60,1714125888,30,'file_changed','next','next','files','changed_self','[{\"33\":\"\\/Templates\\/Yellow idea.odp\"}]','','[]','/Templates/Yellow idea.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',33),(61,1714125888,30,'file_created','next','next','files','created_self','[{\"34\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',34),(62,1714125888,30,'file_changed','next','next','files','changed_self','[{\"34\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',34),(63,1714125888,30,'file_created','next','next','files','created_self','[{\"35\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',35),(64,1714125888,30,'file_changed','next','next','files','changed_self','[{\"35\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',35),(65,1714125888,30,'file_created','next','next','files','created_self','[{\"36\":\"\\/Templates credits.md\"}]','','[]','/Templates credits.md','http:///nextcloud/index.php/apps/files/?dir=/','files',36),(66,1714125888,30,'file_changed','next','next','files','changed_self','[{\"36\":\"\\/Templates credits.md\"}]','','[]','/Templates credits.md','http:///nextcloud/index.php/apps/files/?dir=/','files',36),(67,1714125889,30,'file_created','next','next','files','created_self','[{\"37\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http:///nextcloud/index.php/apps/files/?dir=/','files',37),(68,1714125889,30,'file_changed','next','next','files','changed_self','[{\"37\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http:///nextcloud/index.php/apps/files/?dir=/','files',37),(69,1714125889,30,'file_created','next','next','files','created_self','[{\"38\":\"\\/Readme.md\"}]','','[]','/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/','files',38),(70,1714125889,30,'file_changed','next','next','files','changed_self','[{\"38\":\"\\/Readme.md\"}]','','[]','/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/','files',38),(71,1714125889,30,'file_created','next','next','files','created_self','[{\"39\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http:///nextcloud/index.php/apps/files/?dir=/','files',39),(72,1714125889,30,'file_changed','next','next','files','changed_self','[{\"39\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http:///nextcloud/index.php/apps/files/?dir=/','files',39),(73,1714125889,30,'file_created','next','next','files','created_self','[{\"40\":\"\\/Photos\"}]','','[]','/Photos','http:///nextcloud/index.php/apps/files/?dir=/','files',40),(74,1714125889,30,'file_created','next','next','files','created_self','[{\"41\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',41),(75,1714125889,30,'file_changed','next','next','files','changed_self','[{\"41\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',41),(76,1714125889,30,'file_created','next','next','files','created_self','[{\"42\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',42),(77,1714125889,30,'file_changed','next','next','files','changed_self','[{\"42\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',42),(78,1714125889,30,'file_created','next','next','files','created_self','[{\"43\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',43),(79,1714125889,30,'file_changed','next','next','files','changed_self','[{\"43\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',43),(80,1714125889,30,'file_created','next','next','files','created_self','[{\"44\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',44),(81,1714125889,30,'file_changed','next','next','files','changed_self','[{\"44\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',44),(82,1714125889,30,'file_created','next','next','files','created_self','[{\"45\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',45),(83,1714125889,30,'file_changed','next','next','files','changed_self','[{\"45\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',45),(84,1714125889,30,'file_created','next','next','files','created_self','[{\"46\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',46),(85,1714125889,30,'file_changed','next','next','files','changed_self','[{\"46\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',46),(86,1714125889,30,'file_created','next','next','files','created_self','[{\"47\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',47),(87,1714125889,30,'file_changed','next','next','files','changed_self','[{\"47\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',47),(88,1714125889,30,'file_created','next','next','files','created_self','[{\"48\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',48),(89,1714125889,30,'file_changed','next','next','files','changed_self','[{\"48\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',48),(90,1714125889,30,'file_created','next','next','files','created_self','[{\"49\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',49),(91,1714125889,30,'file_changed','next','next','files','changed_self','[{\"49\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',49),(92,1714125998,30,'calendar','next','system','dav','calendar_add','{\"actor\":\"next\",\"calendar\":{\"id\":1,\"uri\":\"contact_birthdays\",\"name\":\"Contact birthdays\"}}','','[]','','','calendar',1),(93,1714126023,30,'file_created','Brent','Brent','files','created_self','[{\"122\":\"\\/Documents\"}]','','[]','/Documents','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',122),(94,1714126023,30,'file_created','Brent','Brent','files','created_self','[{\"123\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',123),(95,1714126023,30,'file_changed','Brent','Brent','files','changed_self','[{\"123\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',123),(96,1714126023,30,'file_created','Brent','Brent','files','created_self','[{\"124\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',124),(97,1714126023,30,'file_changed','Brent','Brent','files','changed_self','[{\"124\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',124),(98,1714126023,30,'file_created','Brent','Brent','files','created_self','[{\"125\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',125),(99,1714126023,30,'file_changed','Brent','Brent','files','changed_self','[{\"125\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',125),(100,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"126\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',126),(101,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"126\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',126),(102,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"127\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',127),(103,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"127\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',127),(104,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"128\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',128),(105,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"128\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',128),(106,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"129\":\"\\/Templates\"}]','','[]','/Templates','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',129),(107,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"130\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',130),(108,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"130\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',130),(109,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"131\":\"\\/Templates\\/Party invitation.odt\"}]','','[]','/Templates/Party invitation.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',131),(110,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"131\":\"\\/Templates\\/Party invitation.odt\"}]','','[]','/Templates/Party invitation.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',131),(111,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"132\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',132),(112,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"132\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',132),(113,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"133\":\"\\/Templates\\/Mother\'s day.odt\"}]','','[]','/Templates/Mother\'s day.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',133),(114,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"133\":\"\\/Templates\\/Mother\'s day.odt\"}]','','[]','/Templates/Mother\'s day.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',133),(115,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"134\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',134),(116,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"134\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',134),(117,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"135\":\"\\/Templates\\/Timesheet.ods\"}]','','[]','/Templates/Timesheet.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',135),(118,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"135\":\"\\/Templates\\/Timesheet.ods\"}]','','[]','/Templates/Timesheet.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',135),(119,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"136\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',136),(120,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"136\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',136),(121,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"137\":\"\\/Templates\\/Photo book.odt\"}]','','[]','/Templates/Photo book.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',137),(122,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"137\":\"\\/Templates\\/Photo book.odt\"}]','','[]','/Templates/Photo book.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',137),(123,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"138\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',138),(124,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"138\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',138),(125,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"139\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',139),(126,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"139\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',139),(127,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"140\":\"\\/Templates\\/Resume.odt\"}]','','[]','/Templates/Resume.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',140),(128,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"140\":\"\\/Templates\\/Resume.odt\"}]','','[]','/Templates/Resume.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',140),(129,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"141\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',141),(130,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"141\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',141),(131,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"142\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',142),(132,1714126024,30,'file_changed','Brent','Brent','files','changed_self','[{\"142\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',142),(133,1714126024,30,'file_created','Brent','Brent','files','created_self','[{\"143\":\"\\/Templates\\/Modern company.odp\"}]','','[]','/Templates/Modern company.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',143),(134,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"143\":\"\\/Templates\\/Modern company.odp\"}]','','[]','/Templates/Modern company.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',143),(135,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"144\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',144),(136,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"144\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',144),(137,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"145\":\"\\/Templates\\/Business model canvas.ods\"}]','','[]','/Templates/Business model canvas.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',145),(138,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"145\":\"\\/Templates\\/Business model canvas.ods\"}]','','[]','/Templates/Business model canvas.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',145),(139,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"146\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',146),(140,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"146\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',146),(141,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"147\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',147),(142,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"147\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',147),(143,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"148\":\"\\/Templates\\/Syllabus.odt\"}]','','[]','/Templates/Syllabus.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',148),(144,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"148\":\"\\/Templates\\/Syllabus.odt\"}]','','[]','/Templates/Syllabus.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',148),(145,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"149\":\"\\/Templates\\/Gotong royong.odp\"}]','','[]','/Templates/Gotong royong.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',149),(146,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"149\":\"\\/Templates\\/Gotong royong.odp\"}]','','[]','/Templates/Gotong royong.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',149),(147,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"150\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',150),(148,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"150\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',150),(149,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"151\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',151),(150,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"151\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',151),(151,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"152\":\"\\/Templates\\/Yellow idea.odp\"}]','','[]','/Templates/Yellow idea.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',152),(152,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"152\":\"\\/Templates\\/Yellow idea.odp\"}]','','[]','/Templates/Yellow idea.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',152),(153,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"153\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',153),(154,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"153\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',153),(155,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"154\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',154),(156,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"154\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',154),(157,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"155\":\"\\/Templates credits.md\"}]','','[]','/Templates credits.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',155),(158,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"155\":\"\\/Templates credits.md\"}]','','[]','/Templates credits.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',155),(159,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"156\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',156),(160,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"156\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',156),(161,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"157\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',157),(162,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"157\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',157),(163,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"158\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',158),(164,1714126025,30,'file_changed','Brent','Brent','files','changed_self','[{\"158\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',158),(165,1714126025,30,'file_created','Brent','Brent','files','created_self','[{\"159\":\"\\/Photos\"}]','','[]','/Photos','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',159),(166,1714126026,30,'file_created','Brent','Brent','files','created_self','[{\"160\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',160),(167,1714126026,30,'file_changed','Brent','Brent','files','changed_self','[{\"160\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',160),(168,1714126026,30,'file_created','Brent','Brent','files','created_self','[{\"161\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',161),(169,1714126026,30,'file_changed','Brent','Brent','files','changed_self','[{\"161\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',161),(170,1714126026,30,'file_created','Brent','Brent','files','created_self','[{\"162\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',162),(171,1714126026,30,'file_changed','Brent','Brent','files','changed_self','[{\"162\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',162),(172,1714126026,30,'file_created','Brent','Brent','files','created_self','[{\"163\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',163),(173,1714126026,30,'file_changed','Brent','Brent','files','changed_self','[{\"163\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',163),(174,1714126026,30,'file_created','Brent','Brent','files','created_self','[{\"164\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',164),(175,1714126026,30,'file_changed','Brent','Brent','files','changed_self','[{\"164\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',164),(176,1714126026,30,'file_created','Brent','Brent','files','created_self','[{\"165\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',165),(177,1714126026,30,'file_changed','Brent','Brent','files','changed_self','[{\"165\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',165),(178,1714126026,30,'file_created','Brent','Brent','files','created_self','[{\"166\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',166),(179,1714126026,30,'file_changed','Brent','Brent','files','changed_self','[{\"166\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',166),(180,1714126026,30,'file_created','Brent','Brent','files','created_self','[{\"167\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',167),(181,1714126026,30,'file_changed','Brent','Brent','files','changed_self','[{\"167\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',167),(182,1714126026,30,'file_created','Brent','Brent','files','created_self','[{\"168\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',168),(183,1714126026,30,'file_changed','Brent','Brent','files','changed_self','[{\"168\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',168),(184,1714219255,30,'calendar','next','next','dav','calendar_add_self','{\"actor\":\"next\",\"calendar\":{\"id\":2,\"uri\":\"personal\",\"name\":\"Personal\"}}','','[]','','','calendar',2),(185,1714219341,30,'calendar_event','next','next','dav','object_add_event_self','{\"actor\":\"next\",\"calendar\":{\"id\":2,\"uri\":\"personal\",\"name\":\"Personal\"},\"object\":{\"id\":\"ead3d0b2-1084-480b-b547-302f7debdf08\",\"name\":\"Demo Week 12\",\"classified\":false,\"link\":{\"object_uri\":\"4F96DBE3-51E1-4467-9F12-6EFAD2AA8694.ics\",\"calendar_uri\":\"personal\",\"owner\":\"next\"}}}','','[]','','','calendar',2),(186,1714220066,30,'forms_newshare','next','Brent','forms','newshare','{\"userId\":\"next\",\"formTitle\":\"Interne bevraging TenurIT\",\"formHash\":\"coRf36SybCF26Q9Z\"}','','[]','','','form',1),(187,1714220212,30,'forms_newsubmission','next','next','forms','newsubmission','{\"userId\":\"next\",\"formTitle\":\"Interne bevraging TenurIT\",\"formHash\":\"coRf36SybCF26Q9Z\"}','','[]','','','form',1);
/*!40000 ALTER TABLE `oc_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity_mq`
--

DROP TABLE IF EXISTS `oc_activity_mq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity_mq` (
  `mail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amq_timestamp` int(11) NOT NULL DEFAULT 0,
  `amq_latest_send` int(11) NOT NULL DEFAULT 0,
  `amq_type` varchar(255) NOT NULL,
  `amq_affecteduser` varchar(64) NOT NULL,
  `amq_appid` varchar(32) NOT NULL,
  `amq_subject` varchar(255) NOT NULL,
  `amq_subjectparams` longtext DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mail_id`),
  KEY `amp_user` (`amq_affecteduser`),
  KEY `amp_latest_send_time` (`amq_latest_send`),
  KEY `amp_timestamp_time` (`amq_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity_mq`
--

LOCK TABLES `oc_activity_mq` WRITE;
/*!40000 ALTER TABLE `oc_activity_mq` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_activity_mq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbookchanges`
--

DROP TABLE IF EXISTS `oc_addressbookchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbookchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `addressbookid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `addressbookid_synctoken` (`addressbookid`,`synctoken`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbookchanges`
--

LOCK TABLES `oc_addressbookchanges` WRITE;
/*!40000 ALTER TABLE `oc_addressbookchanges` DISABLE KEYS */;
INSERT INTO `oc_addressbookchanges` VALUES (1,'Database:Brent.vcf',1,1,1,1714125998),(2,'Database:Brent.vcf',2,1,2,1714125999),(3,'Database:Brent.vcf',3,1,2,1714125999);
/*!40000 ALTER TABLE `oc_addressbookchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbooks`
--

DROP TABLE IF EXISTS `oc_addressbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbooks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addressbook_index` (`principaluri`,`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbooks`
--

LOCK TABLES `oc_addressbooks` WRITE;
/*!40000 ALTER TABLE `oc_addressbooks` DISABLE KEYS */;
INSERT INTO `oc_addressbooks` VALUES (1,'principals/system/system','system','system','System addressbook which holds all users of this instance',4);
/*!40000 ALTER TABLE `oc_addressbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_appconfig`
--

DROP TABLE IF EXISTS `oc_appconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_appconfig` (
  `appid` varchar(32) NOT NULL DEFAULT '',
  `configkey` varchar(64) NOT NULL DEFAULT '',
  `configvalue` longtext DEFAULT NULL,
  `type` int(10) unsigned NOT NULL DEFAULT 2,
  `lazy` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`appid`,`configkey`),
  KEY `ac_lazy_i` (`lazy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_appconfig`
--

LOCK TABLES `oc_appconfig` WRITE;
/*!40000 ALTER TABLE `oc_appconfig` DISABLE KEYS */;
INSERT INTO `oc_appconfig` VALUES ('activity','enabled','yes',2,0),('activity','installed_version','2.21.1',2,0),('activity','types','filesystem',2,0),('backgroundjob','lastjob','32',2,0),('calendar','enabled','yes',2,0),('calendar','installed_version','4.7.1',2,0),('calendar','types','',2,0),('circles','enabled','yes',2,0),('circles','installed_version','29.0.0-dev',2,0),('circles','loopback_tmp_path','/nextcloud',2,0),('circles','loopback_tmp_scheme','http',2,0),('circles','maintenance_run','0',2,0),('circles','maintenance_update','{\"3\":1714218886,\"2\":1714218886,\"1\":1714218886}',2,0),('circles','types','filesystem,dav',2,0),('cloud_federation_api','enabled','yes',2,0),('cloud_federation_api','installed_version','1.12.0',2,0),('cloud_federation_api','types','filesystem',2,0),('comments','enabled','yes',2,0),('comments','installed_version','1.19.0',2,0),('comments','types','logging',2,0),('contactsinteraction','enabled','yes',2,0),('contactsinteraction','installed_version','1.10.0',2,0),('contactsinteraction','types','dav',2,0),('core','files_metadata','{\"photos-original_date_time\":{\"value\":null,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-exif\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}',2,0),('core','files_metadata_installed','1',2,0),('core','installedat','1714125883.1111',2,0),('core','lastcron','1714220226',8,0),('core','lastupdatedat','1714218575',8,0),('core','oc.integritycheck.checker','[]',64,1),('core','public_files','files_sharing/public.php',2,0),('core','vendor','nextcloud',2,0),('dashboard','enabled','yes',2,0),('dashboard','installed_version','7.9.0',2,0),('dashboard','types','',2,0),('dav','enabled','yes',2,0),('dav','installed_version','1.30.1',2,0),('dav','types','filesystem',2,0),('federatedfilesharing','enabled','yes',2,0),('federatedfilesharing','installed_version','1.19.0',2,0),('federatedfilesharing','types','',2,0),('federation','enabled','yes',2,0),('federation','installed_version','1.19.0',2,0),('federation','types','authentication',2,0),('files','enabled','yes',2,0),('files','installed_version','2.1.0',2,0),('files','types','filesystem',2,0),('files_downloadlimit','enabled','yes',2,0),('files_downloadlimit','installed_version','2.0.0',2,0),('files_downloadlimit','types','',2,0),('files_pdfviewer','enabled','yes',2,0),('files_pdfviewer','installed_version','2.10.0',2,0),('files_pdfviewer','types','',2,0),('files_reminders','enabled','yes',2,0),('files_reminders','installed_version','1.2.0',2,0),('files_reminders','types','',2,0),('files_sharing','enabled','yes',2,0),('files_sharing','installed_version','1.21.0',2,0),('files_sharing','types','filesystem',2,0),('files_trashbin','enabled','yes',2,0),('files_trashbin','installed_version','1.19.0',2,0),('files_trashbin','types','filesystem,dav',2,0),('files_versions','enabled','yes',2,0),('files_versions','installed_version','1.22.0',2,0),('files_versions','types','filesystem,dav',2,0),('firstrunwizard','enabled','yes',2,0),('firstrunwizard','installed_version','2.18.0',2,0),('firstrunwizard','types','logging',2,0),('forms','enabled','yes',2,0),('forms','installed_version','4.2.3',2,0),('forms','types','',2,0),('logreader','enabled','yes',2,0),('logreader','installed_version','2.14.0',2,0),('logreader','types','logging',2,0),('lookup_server_connector','enabled','yes',2,0),('lookup_server_connector','installed_version','1.17.0',2,0),('lookup_server_connector','types','authentication',2,0),('nextcloud_announcements','enabled','yes',2,0),('nextcloud_announcements','installed_version','1.18.0',2,0),('nextcloud_announcements','types','logging',2,0),('notifications','enabled','yes',2,0),('notifications','installed_version','2.17.0',2,0),('notifications','types','logging',2,0),('oauth2','enabled','yes',2,0),('oauth2','installed_version','1.17.0',2,0),('oauth2','types','authentication',2,0),('password_policy','enabled','yes',2,0),('password_policy','installed_version','1.19.0',2,0),('password_policy','types','authentication',2,0),('photos','enabled','yes',2,0),('photos','installed_version','2.5.0',2,0),('photos','lastPlaceMappedUser','next',2,0),('photos','lastPlaceMappingDone','true',2,0),('photos','types','dav,authentication',2,0),('privacy','enabled','yes',2,0),('privacy','installed_version','1.13.0',2,0),('privacy','types','',2,0),('provisioning_api','enabled','yes',2,0),('provisioning_api','installed_version','1.19.0',2,0),('provisioning_api','types','prevent_group_restriction',2,0),('recommendations','enabled','yes',2,0),('recommendations','installed_version','2.1.0',2,0),('recommendations','types','',2,0),('related_resources','enabled','yes',2,0),('related_resources','installed_version','1.4.0',2,0),('related_resources','types','',2,0),('serverinfo','cached_count_filecache','240',2,0),('serverinfo','cached_count_storages','3',2,0),('serverinfo','enabled','yes',2,0),('serverinfo','installed_version','1.19.0',2,0),('serverinfo','types','',2,0),('settings','appstore-fetcher-lastFailure','1714219686',2,0),('settings','enabled','yes',2,0),('settings','installed_version','1.12.0',2,0),('settings','types','',2,0),('sharebymail','enabled','yes',2,0),('sharebymail','installed_version','1.19.0',2,0),('sharebymail','types','filesystem',2,0),('support','enabled','yes',2,0),('support','installed_version','1.12.0',2,0),('support','types','session',2,0),('survey_client','enabled','yes',2,0),('survey_client','installed_version','1.17.0',2,0),('survey_client','types','',2,0),('systemtags','enabled','yes',2,0),('systemtags','installed_version','1.19.0',2,0),('systemtags','types','logging',2,0),('text','enabled','yes',2,0),('text','installed_version','3.10.0',2,0),('text','types','dav',2,0),('theming','enabled','yes',2,0),('theming','installed_version','2.4.0',2,0),('theming','types','logging',2,0),('twofactor_backupcodes','enabled','yes',2,0),('twofactor_backupcodes','installed_version','1.18.0',2,0),('twofactor_backupcodes','types','',2,0),('updatenotification','enabled','yes',2,0),('updatenotification','installed_version','1.19.1',2,0),('updatenotification','types','',2,0),('user_status','enabled','yes',2,0),('user_status','installed_version','1.9.0',2,0),('user_status','types','',2,0),('viewer','enabled','yes',2,0),('viewer','installed_version','2.3.0',2,0),('viewer','types','',2,0),('weather_status','enabled','yes',2,0),('weather_status','installed_version','1.9.0',2,0),('weather_status','types','',2,0),('workflowengine','enabled','yes',2,0),('workflowengine','installed_version','2.11.0',2,0),('workflowengine','types','filesystem',2,0);
/*!40000 ALTER TABLE `oc_appconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authorized_groups`
--

DROP TABLE IF EXISTS `oc_authorized_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authorized_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(200) NOT NULL,
  `class` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admindel_groupid_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authorized_groups`
--

LOCK TABLES `oc_authorized_groups` WRITE;
/*!40000 ALTER TABLE `oc_authorized_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_authorized_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authtoken`
--

DROP TABLE IF EXISTS `oc_authtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authtoken` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL DEFAULT '',
  `login_name` varchar(255) NOT NULL DEFAULT '',
  `password` longtext DEFAULT NULL,
  `name` longtext NOT NULL DEFAULT '',
  `token` varchar(200) NOT NULL DEFAULT '',
  `type` smallint(5) unsigned DEFAULT 0,
  `remember` smallint(5) unsigned DEFAULT 0,
  `last_activity` int(10) unsigned DEFAULT 0,
  `last_check` int(10) unsigned DEFAULT 0,
  `scope` longtext DEFAULT NULL,
  `expires` int(10) unsigned DEFAULT NULL,
  `private_key` longtext DEFAULT NULL,
  `public_key` longtext DEFAULT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `password_invalid` tinyint(1) DEFAULT 0,
  `password_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authtoken_token_index` (`token`),
  KEY `authtoken_last_activity_idx` (`last_activity`),
  KEY `authtoken_uid_index` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authtoken`
--

LOCK TABLES `oc_authtoken` WRITE;
/*!40000 ALTER TABLE `oc_authtoken` DISABLE KEYS */;
INSERT INTO `oc_authtoken` VALUES (3,'next','next','gamd33KQV7PS6hLi43WLrWTTWNMktoie3QTqPrGMHacXjw51OPjXzgKTFSe1CiwIuLLMovVwkilVMbCoLl8f85VcVyfkASoflISdiv/oVjFbHIHdBczlrs0iJjVoXBKjxATd5dJXtX/YItt0ZbDMrl8fuIw2ixvwXdHCSn7KNzPuxsMNEFbyPaXZoXji6NskWUms3EFHfashuf7HZb8TeriOx0Qm5Rbipm4FoA3WEEk8jPCY7JMLHfG2EUVW+Fj2AdzUO8jraSeXZrukvMeU7c3luJEeJzWFSjwx2w0SZ53RfPU42RH1hX35GBqYAjQX1Tie6SuAQWcIAGFBKfBTLw==','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36','f0e20fc3ad8940b81ed78e15f2dc02478b9466dbb600ff8e3a1b13f59f1205ee1140084bdd0df33f91c609f3acb9d009eb641c772226f629506f2e3d5e02f0e5',0,1,1714126100,1714126038,NULL,NULL,'37cae2a70945aeb79658c3870942986b9eefaaa327ac758e5ebbb6bb69022eb89b6d829d82de3172b6f0c2ee4bee25e9a6c3e327e6bd70630f139bc668f90f8849d21c71db1e540b443873525645afc5484f23f6db48b02fa4e3d138be94ae356d3fb47563845afca41a95bb365e0ea4a7e0a23da28bf5a422ca117e8fc5d41b4e6c6e8273404065a5f77c2425fb5a3624d9036a9139f281be9169dcb836b8eb0fdc5c8135a61fc2f1fa64cd923f95e6804e4aed4d7e45799f21ae46e804f2d2306edcd208f9ae6fd43710325f4696766de895c87cf90fe467759909b99ccdc2dd3183b6f0fa3dedc85ba83aa3dfad0de0890e84e08ac47102da71b7605706a857d2662fb95c2dc48d1c8694af378c5ea690af85bbc4d4a110628a99b207e8763999702dfcc85de2732243659039637774750507f5dbf443fa1f32ed4c0e26f8751a6b3ee2358f13a9391f5c3c6543bf2a01eaac1e078651e1570ebee131633e13bf9f5e19a4a160007eac9324be4b0a91652d54e14d81e676d03970d701bf253ea4c9908ff625d62f5e78b1c26eb24079d8168dfe8c1a561b0744d7e15c2840681565cfce653f3af63837dbe1010edd0f22276b33778e1c9c63e59aa8bfac67728eea6b26ecd51d7bdb7818682aa8446105066051c0df13697aef2e95368453d6a08a93596ebf6bc4f3bc7d6da91c270b07a2bf1cdebd8e080da884f0f684ae55eeb28bf3aae1399429504961fea729b74266f3f6b3e5cd30fe73ba21082bac4af0b584e1383180e632a7f70a0b81bab8ef6e30e07b0e5f4c8925042e52b6055380ac223a5c604fba0cbaeecd74b099961b14b914b81c6c48c4411c63d72f2a6cac48acdc7515437636ec58201ada7181e2b2207f3fce3d50de6ec9bfd22154c0024a5e99899ab90b517d7a18a6a84e1e00e4bbcbda2ebcf259be97364b0d3defb4f2ce5a32e6eedcd49a3c944bdbefea2703e7ff9f3734ccc84730ed331281aaed521fb973734c3c5ca103f36b05ed9f83f9bc2c1223f979e56dce852e0f60e7e45dcb3233853ce032429cf0c38282081eaf834fe5b584ab845de92622b946d29eddd48f6106bfc221a0c27342232d9166974d5c09b445b0be5302a9cb0f277217d181d554ceb420dcc3689595969b1f0b6862ad572112626bef94eaea2d3f6e06f17138f768fc23c6943ae3e367111ed7c5046e1fd38ff90f613c211f2c69607e625032a8f0fd5f97f4a43c592886331528cbd976d608f83487eb2ad188483d99dace229bac8e77f5697b504978a63ffeeb885873f68b6f68114ed6fe14195837218388743af11437e47d2cb56d6814feb7f6e3f18f487d8941e38f1d3a6360249826a2344dc8aeceec2898fff933c02a75ba59daf33d8931831dcff1c1b274d338f0d85962e1c60b774e833a110c75a94bba3ae0a455987b2128afbd958d7445da025dd47857d054b3e704efb5b167a02262c39e03d9944da7e38950c00bc06256a938aa05a6c07127b6284a68233437366880232bd82ea53ad740b5c71688dc3468713dc6b49812d46d304bb0483b0387d0ba96e98accf2a1bb2fdc31f19c0b35c4d79ead8855ece37853cc1b7d8746d95448443fcc326d7d688d51cb5b1e898885081f2c786d48d7696551725c0ee7b82fba38481f0edd0b26350de59999d480844cdcf831f7fa7a940d9c1b04b110391082d78f1908eaa176c20c6c0b6fa0293159bf8bab9a29112c5b4a196fbd1801afd3adc1f0f8b3b340be3bb2636e34406f1396e0a2f356a9810f655e1210ee9b0afca04873e460e6a0bcbdb3552aab0a79c4644f6d1e4b835bdd0e00c01ff3b19f1b280b8a419362e65d2ee65990513036438296215e4eb833f6246394961f2402565478004c0078f0dae24a50a00906e75628e1594c19a5df14f4fc119e1bc337f6b4d962c3bf68b4898572a30e62eb8132bcddcb852e60644d150f1a5f551f02d6e3839a25b27b5e1ecc0ec9e5ea0588a2f4ca2603a94a1307d8784704b946690f81819fe4d5cacbe0eb4995d7ce33d2be8fc410a5866f4e38c8a96903db75eccbda2932973c7bc0fa8025404fbc72bdd9438605a23defcf1a71695c0acb188063de347ee8fe9cd3565d86fdbb718b9eb40313b8740d3a1e2f50dcca82741fffdd003da5f7803ed38d718356a48b27e129d1e6429e1a366d606937ca6c721daeee9d7406bf13ed1dfd506a37f975a71f90ee8b3c24350be3f213aee7c39e4db8e0036d9875c5f1fd7d019a37e9c95a9e6878f1fe58aa3777c1856494fa4ac9fd78d137420320aca9a970c6dad94e6291c816c624a7ea7845a8e42079b5050c12dda798feb25ca70edac77f783ddc6b3cc70d296640d3b232e770bd9f875d9c9a3f228e9832f3000631f9082d590770a4a87a60f41c85c58dcaadd359|46298a6f5b91e98860fadc98d8110cc0|ab1209f6c2fe7daa55118ca93c9d51cced272a36ecec7f631163adac0dc1d65eb8950a39549e84bc26a6400e41879e9710698f3677433665eb520d99d19888e4|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjvBEDEu2tPXudDq6g9zM\nwCmY96nBWbG6ItIOrsf9IQJ48BEfJhUxd5CXunQ+3Gn0SdRSTB2VZxtonbqk3gm3\nxSYIcg2BPAtMfwN1MgtGWk9tYD3XWY8bQpvMr2OcMQeWZAfJQhkplBYPmxM2dNuJ\nYw/8wuP3NTrPWklC165F6UnUvIe7oNbVzvcypF0jD0W/bo5BofXvAPEt/uTJT5wW\nh3K3/4cW/gzOfYHhi/SAOZHVzK5f7FYlhog9FdQuFqsg+XQf0ZVhAjOp662dTzKe\newk/gZL6v8fVeKSt0hcTvtRGyNqnhL1jHdA69wrxt9qxscubkx3ZutcmprIDFb3Q\nkQIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'1|$2y$10$GIlVwG9vDw0FW1e6xHRzHeACSeYcmaYEPum9Ncs3DqX5wBq6yFXvS'),(6,'next','next','G76hzMOYWwg2WeIcTukiaFTJKz5GCopb9g4rNDGcVxbMOBcQbunX4pryDZvVfMvjQgsQFDMIJ4nhEs0MXNqL6rpTGCMt9TAT0U27Hz7x3lAV5XUekaL6i+eKM72FCM9Q+80lBdP1PD7GlArQK7w1SEBS5ZuWXypzF9A48oD8FX5K5zLGAg3uNbSpBq7SzIRrkb0VL9LqLwPt2o2ybZwNXmQLUW2SS7p7p/8CVOGozhSxd6gSf9xXqgpL9W1N1yqfT/vMBqh4SYoEmNTkTKoViDG5A/L07JOIAjeyca5W2QedQjs5YgplGY7vqZyV7vfjcRQsFzn0ZUO3edS66cxtBg==','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36','8ba224b3f03c5d177a144208dfd3a0577039419dddec50a07e0a60dc1f0cfcf044c36d9660a4cb41dae6e76d741709df1b3f038a87aa42252f938699e67d1e51',0,1,1714220287,1714220154,NULL,NULL,'e2031f4cda10d7706edec831cf039eb1f442751f7864ff9872fd4dc3ff6bb948bbe10d4e8b75dca2a5fc9185384afc5857dbb82d01dd195083205880c57ddea46a62b5480dff4e244dce0490c0ac5df2094661d33407a0641e85f5944554194f451eb8961abb4536c0ffa6fed87ae90ba2edf3df5e4a2882a9cf4bdea849d624429f97e469d9c5e2739a00da423fc53a4d1033e0a88adad4d5fb1c1805a5ac42288eebd4a1ccffb710c38dfdfa06a4123576c742225bc0aef87c83829701ebb2f3951533edd587a22b795291b7f6b82f78c85cfd2a06ca48b0c1ccbb6d12a617dca96f2067e860a01f9b9938a9ea05f005a90ebdbf856d6eb1b2f8fce3d12dbea2b2bfcc727572f7174d86cc29e09432aa5263c9d7829fd8a86abd033a9bee6e85be45454d102b93a9e9ef96157f4230879adcfe2d22492e3e669d9a3a0991f2545a59c71577d1e913b6c32ab59e8bfbbb7306c36d6fd9fedc35d3e63262c054e4bd7b3c999106e5f7d8e95fe84aa2aaf8f9e65da330b5863a63cb624b86fd5424ddf38bf29895eca1511828fa33e806c3f8b9185f17b8115b642424502861470bc29152c6077c178a221eeb57c90cb3e6cc05984558afcf3c46515841ddce52a96f3c0af768e2023031fec6eb0553fd8bc965419cda36398bdb240ed4168824073f00f13d3b8263c5c2b5377df5cd0eef69f3a7d6973e2355706c00c2ac3e3a6c3e2be954bb2a755442032d77445836f70e0170a859391d5bfe39bc6ac3226b39cb420e5b28f5de42ea3ec23474c0bf793fc5bdc7cd233ee26ef3176a652925791e7395ab020b8377dca5b5cb6416b94f3070beb101827ca2c7394375974c237cc406d5aede8bffb3db81cf6c3b0ccc68070a062d21d8ca72a3e1cc548112123ee470073e005ecac2e56941b8393f5920eb229df2864276fa932038ef1f04b31b003a4534a99298adb20017d81aa5883e871fb956aecbd5aef493bfa0765f21f5253183c12c30df75cb6b46d815495ad05f755555501dfbae3c812bf121aa7013abe248923f615dc432e505f1425640b42d46c7d466cd4100e21d1cd83924feb402d0505687522cc8cc802de935bebabddee217a7fae712167bc05d46ed53b75d6633681f95a0e3410ef7a9b65889c25e56dd639575b3d07a970eed9fc6a1382d602a5769cca715f1ab56c8142b81bf62dc2b18cea48201ccafcc016a05382a753a8e2f04f7b1f0b2cacf8be7df7d8ad9de0820db30bab321fb9f6ea3de3b62c736bb403a7fa14e9dc0cf9c04b87e506b766b953af704ec4213848bb0c98ed04a06ea6f7a790cbeb3617220843b2e41e3f11b837a97a34c3b6637fb3b21bfb0f05dc35e2907b2a9a484f8230106ef1af1f41a0be527a037a65f5b42fdf56c06e1895313bfbf02ea0630eaee9ade5d8ca8905d8e27d6e78510ae387508ade5d8688f9f26e6f8383a750a68e88e843ea578ed54e73c82c61a4ac6efffd207eb9e7d27b0c683df49143cfa3a172ad39745473f922feae0f481a1ab3249769d3c11a79fa561730f426863b64b1a721e84a0c18168a768e9de2ef3c6b7ed9e39550b9fc7211844841a5ed1b763fc7dbef70026cb489545cdf9d47ca52b9fecabc4da229178a9fda565afdbf1080ea17ec25769b2030368e39b4473222ed6c538e3369991457a7563bad2a92bd84a2080de9686d102523aad62430c179a3c686a39781e7a2f717b89731ed47b0e47d7b15da35ffccad204eeb4afe252c68388a9aeddb4ab6c017ba0ddaa15e14b582139795a92960f76e089f3b58e4e155046b52ec545eb7d8d4998eb2e4886745c0ef412ca8ad4e5ffd4f952742ae5f5eb443b60e0576dc7d13b6a53f898f00867f0bc5e3bfff47bea1843eb3042bb93b22891ffdaf0b91714eab30081c4d5a5c3bac57da5031122ac0b3adf2c329b5997892bfeb6e56cdb9a662122307c17a1401e67ce1293eae3578d11527e489e3d36b7998fe34114139cefc0f5404b4ea1a68c1d71048e4f169b7e0610f54282ab0b56b57d27d93c9dfcdcfc75f598aaf2e4d3f53b726de67973c44323073a8c3692f1e24f478aafbf65e87820e9d62e0e5b75c8b4a5a52113c74cd23ca64acb33903dabffe8d1c1f6052d4c52de9f7055d140790bd6b927ba5b7fa73687fa736327f28911b44ac40bd9e36f1149097208ec0e99fde60ec08fcd4f5058bf0acb35823d5ecae34e267f8ecdd924cbd7a447cb32c4bc2bd5f07086e0e423e53d69ad76b792c0dbd5e9b27150425e39949b88a07e059c6ed0a7d57d317c19ca5875bd8983fcb648cab557a95e413695cb4f97725dfb433332f89af2c0eee0bbe66aece5beca84a594a487027a4c09cfac8da7c8fdf30907a9d41cfc41e251752196890b6af9f9957aa8732f5766f9b67c9875f7b79b7f83|5f1339b962e6cb73c7a53638f4589d76|552a5a26cb04a619f1d858f9be59059ab973022994e934f91d030426eb25352c750ba8d08ebfad8b652b5db0a6ed3ea0e816b7df58e9ed211ed1e7850875d29f|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp68RsxgM+Pa41bjzthaJ\nUWq8vG7BVEcFsEVhOZpUKDKsRgmkKRacHmZbK44VoLqT/Nzfj6OAuKmdAuTcC94e\nWodZrdU29HkEuTCCMF2oa2nCu0KJw1wQ+IfARgK34eamvfnTAz2/8S0ScBsclAKR\nRbVlRBromQV0fYOjuxkbdvyIdnnYGUzBKBC5fsyhn9Ee+FGM4SrwSFuM2TmPUbi2\nyzuZyIosuHuIcSMYrWtQOspQvmdskk39Utxs+wQU5G1MANTXv28XisCCdhrskRsP\nPYhx8G4tDemdj2o5e1+vgHUoNdpbLigUEYJZvV+tR9c5NKVccf4cjf5e11upb2ZR\nSQIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'1|$2y$10$GIlVwG9vDw0FW1e6xHRzHeACSeYcmaYEPum9Ncs3DqX5wBq6yFXvS');
/*!40000 ALTER TABLE `oc_authtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_bruteforce_attempts`
--

DROP TABLE IF EXISTS `oc_bruteforce_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_bruteforce_attempts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(64) NOT NULL DEFAULT '',
  `occurred` int(10) unsigned NOT NULL DEFAULT 0,
  `ip` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `bruteforce_attempts_ip` (`ip`),
  KEY `bruteforce_attempts_subnet` (`subnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_bruteforce_attempts`
--

LOCK TABLES `oc_bruteforce_attempts` WRITE;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_appt_bookings`
--

DROP TABLE IF EXISTS `oc_calendar_appt_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_appt_bookings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appt_config_id` bigint(20) unsigned NOT NULL,
  `created_at` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `display_name` varchar(128) NOT NULL,
  `description` longtext DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `timezone` varchar(32) NOT NULL,
  `confirmed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cal_appt_bk_token_uniq_idx` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_appt_bookings`
--

LOCK TABLES `oc_calendar_appt_bookings` WRITE;
/*!40000 ALTER TABLE `oc_calendar_appt_bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_appt_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_appt_configs`
--

DROP TABLE IF EXISTS `oc_calendar_appt_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_appt_configs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext DEFAULT NULL,
  `location` longtext DEFAULT NULL,
  `visibility` varchar(10) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `target_calendar_uri` varchar(255) NOT NULL,
  `calendar_freebusy_uris` longtext DEFAULT NULL,
  `availability` longtext DEFAULT NULL,
  `start` int(11) DEFAULT NULL,
  `end` int(11) DEFAULT NULL,
  `length` int(11) NOT NULL,
  `increment` int(11) NOT NULL,
  `preparation_duration` int(11) NOT NULL DEFAULT 0,
  `followup_duration` int(11) NOT NULL DEFAULT 0,
  `time_before_next_slot` int(11) DEFAULT NULL,
  `daily_max` int(11) DEFAULT NULL,
  `future_limit` int(11) DEFAULT NULL,
  `create_talk_room` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cal_appt_token_uniq_idx` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_appt_configs`
--

LOCK TABLES `oc_calendar_appt_configs` WRITE;
/*!40000 ALTER TABLE `oc_calendar_appt_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_appt_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_invitations`
--

DROP TABLE IF EXISTS `oc_calendar_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `recurrenceid` varchar(255) DEFAULT NULL,
  `attendee` varchar(255) NOT NULL,
  `organizer` varchar(255) NOT NULL,
  `sequence` bigint(20) unsigned DEFAULT NULL,
  `token` varchar(60) NOT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_invitation_tokens` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_invitations`
--

LOCK TABLES `oc_calendar_invitations` WRITE;
/*!40000 ALTER TABLE `oc_calendar_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_reminders`
--

DROP TABLE IF EXISTS `oc_calendar_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendar_id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `is_recurring` smallint(6) DEFAULT NULL,
  `uid` varchar(255) NOT NULL,
  `recurrence_id` bigint(20) unsigned DEFAULT NULL,
  `is_recurrence_exception` smallint(6) NOT NULL,
  `event_hash` varchar(255) NOT NULL,
  `alarm_hash` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `is_relative` smallint(6) NOT NULL,
  `notification_date` bigint(20) unsigned NOT NULL,
  `is_repeat_based` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_reminder_objid` (`object_id`),
  KEY `calendar_reminder_uidrec` (`uid`,`recurrence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_reminders`
--

LOCK TABLES `oc_calendar_reminders` WRITE;
/*!40000 ALTER TABLE `oc_calendar_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources`
--

DROP TABLE IF EXISTS `oc_calendar_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) DEFAULT NULL,
  `resource_id` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `group_restrictions` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_resources_email` (`email`),
  KEY `calendar_resources_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources`
--

LOCK TABLES `oc_calendar_resources` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources_md`
--

DROP TABLE IF EXISTS `oc_calendar_resources_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_md_idk` (`resource_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources_md`
--

LOCK TABLES `oc_calendar_resources_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms`
--

DROP TABLE IF EXISTS `oc_calendar_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) DEFAULT NULL,
  `resource_id` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `group_restrictions` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_rooms_email` (`email`),
  KEY `calendar_rooms_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms`
--

LOCK TABLES `oc_calendar_rooms` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms_md`
--

DROP TABLE IF EXISTS `oc_calendar_rooms_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_md_idk` (`room_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms_md`
--

LOCK TABLES `oc_calendar_rooms_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarchanges`
--

DROP TABLE IF EXISTS `oc_calendarchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `calendarid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calid_type_synctoken` (`calendarid`,`calendartype`,`synctoken`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarchanges`
--

LOCK TABLES `oc_calendarchanges` WRITE;
/*!40000 ALTER TABLE `oc_calendarchanges` DISABLE KEYS */;
INSERT INTO `oc_calendarchanges` VALUES (1,'4F96DBE3-51E1-4467-9F12-6EFAD2AA8694.ics',1,2,1,0,1714219341);
/*!40000 ALTER TABLE `oc_calendarchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects`
--

DROP TABLE IF EXISTS `oc_calendarobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `calendarid` bigint(20) unsigned NOT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `componenttype` varchar(8) DEFAULT NULL,
  `firstoccurence` bigint(20) unsigned DEFAULT NULL,
  `lastoccurence` bigint(20) unsigned DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `classification` int(11) DEFAULT 0,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calobjects_index` (`calendarid`,`calendartype`,`uri`),
  KEY `calobj_clssfction_index` (`classification`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects`
--

LOCK TABLES `oc_calendarobjects` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects` DISABLE KEYS */;
INSERT INTO `oc_calendarobjects` VALUES (1,'BEGIN:VCALENDAR\r\nPRODID:-//IDN nextcloud.com//Calendar app 4.7.1//EN\r\nCALSCALE:GREGORIAN\r\nVERSION:2.0\r\nBEGIN:VEVENT\r\nCREATED:20240427T120154Z\r\nDTSTAMP:20240427T120221Z\r\nLAST-MODIFIED:20240427T120221Z\r\nSEQUENCE:2\r\nUID:ead3d0b2-1084-480b-b547-302f7debdf08\r\nDTSTART;VALUE=DATE:20240516\r\nDTEND;VALUE=DATE:20240517\r\nSTATUS:CONFIRMED\r\nSUMMARY:Demo Week 12\r\nEND:VEVENT\r\nEND:VCALENDAR','4F96DBE3-51E1-4467-9F12-6EFAD2AA8694.ics',2,1714219341,'9cd58b82f362d5b04385ed0bc040b796',376,'VEVENT',1715817600,1715904000,'ead3d0b2-1084-480b-b547-302f7debdf08',0,0,NULL);
/*!40000 ALTER TABLE `oc_calendarobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects_props`
--

DROP TABLE IF EXISTS `oc_calendarobjects_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects_props` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendarid` bigint(20) NOT NULL DEFAULT 0,
  `objectid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `parameter` varchar(64) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calendarobject_index` (`objectid`,`calendartype`),
  KEY `calendarobject_name_index` (`name`,`calendartype`),
  KEY `calendarobject_value_index` (`value`,`calendartype`),
  KEY `calendarobject_calid_index` (`calendarid`,`calendartype`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects_props`
--

LOCK TABLES `oc_calendarobjects_props` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects_props` DISABLE KEYS */;
INSERT INTO `oc_calendarobjects_props` VALUES (1,2,1,'STATUS',NULL,'CONFIRMED',0),(2,2,1,'SUMMARY',NULL,'Demo Week 12',0);
/*!40000 ALTER TABLE `oc_calendarobjects_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendars`
--

DROP TABLE IF EXISTS `oc_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `description` varchar(255) DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) DEFAULT NULL,
  `timezone` longtext DEFAULT NULL,
  `components` varchar(64) DEFAULT NULL,
  `transparent` smallint(6) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendars_index` (`principaluri`,`uri`),
  KEY `cals_princ_del_idx` (`principaluri`,`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendars`
--

LOCK TABLES `oc_calendars` WRITE;
/*!40000 ALTER TABLE `oc_calendars` DISABLE KEYS */;
INSERT INTO `oc_calendars` VALUES (1,'principals/system/system','Contact birthdays','contact_birthdays',1,NULL,0,'#E9D859',NULL,'VEVENT',0,NULL),(2,'principals/users/next','Personal','personal',2,NULL,0,NULL,NULL,'VEVENT,VTODO',0,NULL);
/*!40000 ALTER TABLE `oc_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarsubscriptions`
--

DROP TABLE IF EXISTS `oc_calendarsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarsubscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(100) DEFAULT NULL,
  `refreshrate` varchar(10) DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) DEFAULT NULL,
  `striptodos` smallint(6) DEFAULT NULL,
  `stripalarms` smallint(6) DEFAULT NULL,
  `stripattachments` smallint(6) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `source` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calsub_index` (`principaluri`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarsubscriptions`
--

LOCK TABLES `oc_calendarsubscriptions` WRITE;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards`
--

DROP TABLE IF EXISTS `oc_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `carddata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `lastmodified` bigint(20) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_abiduri` (`addressbookid`,`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards`
--

LOCK TABLES `oc_cards` WRITE;
/*!40000 ALTER TABLE `oc_cards` DISABLE KEYS */;
INSERT INTO `oc_cards` VALUES (1,1,'BEGIN:VCARD\r\nVERSION:3.0\r\nPRODID:-//Sabre//Sabre VObject 4.5.4//EN\r\nUID:Brent\r\nFN;X-NC-SCOPE=v2-federated:Brent\r\nN;X-NC-SCOPE=v2-federated:Brent;;;;\r\nEMAIL;TYPE=OTHER;X-NC-SCOPE=v2-federated:brent.declercq2@student.hogent.be\r\nPHOTO;ENCODING=b;TYPE=image/png;0=v2-federated:iVBORw0KGgoAAAANSUhEUgAAAgAA\r\n AAIACAYAAAD0eNT6AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAakklEQVR4nO3deaydd3ng8efuu+\r\n /m5drXe2xnwY4dJ3EWSENLy4Swqcw0FIZFo24MZUorZko1hZEqqrZqC+2MREvVamjVAUELEWUb\r\n StkKJIRAYhI7TmISx47Xa/vGd1/PvWf+oGXYlybn977n/j6ffyzZip4n0lm+5z3ved+GkcnZag\r\n AAWWksegEAID0BAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEB\r\n AAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAA\r\n AZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZ\r\n EgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEg\r\n AAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAA\r\n kCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkC\r\n EBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEB\r\n AAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAA\r\n AZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZ\r\n EgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEg\r\n AAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAA\r\n kCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkC\r\n EBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkCEBAAAZEgAAkKHmoheAMvjf9z0R\r\n f/vAiaLXqKmmhoZoaIhobGiIpoaGaGlqiObGxmhraozW5sZoa26Kzuam6Gptio6WpuhqaY5VbS\r\n 2xqr05ettbo6+tJQY6W2OwszX62luL/t8BniYBABGxVK3GwtJy0WvUjaaGhljd2RrruttjfU97\r\n rOtujw2rOmJzb2ds6u2MgQ6BAGUnAIAf21K1GiPT8zEyPR8Pjox/1793tzbH1v6u2DHQHTsGum\r\n LnYE9cvronWpp86whlIQCAZ9zUQiUOj4zH4W+Jg+bGhtje3xW71/XG1UN9sX99Xwx2thW4JeRN\r\n AABJVJarcXR0Ko6OTsWdR05HRMTwqo64YeNA3LhxMK4d7o/25qaCt4R8CACgMKcnZuPOI6fjzi\r\n Ono7mxIa4fHohbt62JW7esiVXtLUWvByuaAABKobJcjS+dHI0vnRyNP2p4NA5sHIjbd62PW7as\r\n du4A1IAAAEpnqfr/Y6C7tTledPn6eNlVG2N4VUfRq8GKIQCAUptaqMT7Dp2M9x86GTdtHozX7t\r\n sau9f1Fr0W1D0BANSFakTc/eRo3P3kaFyzvi9+4dptcc36/qLXgrrlizWg7hw8OxZv+OjB+G//\r\n +EA8cWm66HWgLgkAoG7d/eRovPaD98afffmxmK8sFb0O1BUBANS1pWo13vPgk/GqD3z52y48BP\r\n xgAgBYEc5MzsXrP3J/vPv+J4peBeqCAABWjKVqNf7qvifiv//ToZjzlQD8QAIAWHH++fiF+M8f\r\n vi/G5haKXgVKSwAAK9LR0an41Y/cH0/NigD4XgQAsGIdH5uJ//LR+2NyfrHoVaB0BACwoh0fm4\r\n nf+uShWFxaLnoVKBUBAKx4Xzs3Fn/4xUeKXgNKRQAAWfj40XPxsUfPFr0GlIZ7AUAiH3zFzdHT\r\n WtxTbrlajaVqNRaXvvHn0nI1FpeXo7JUjenFSkzNV2JyoRLTC5WYWqjEpdmFuDgzH+en5+Pi9H\r\n xcnFmIpWq1sP2fCW+/69HYv6Ev1ve4qyAIAEikp7U5ugoMgGfCuam5ODE2HccvTccTl6bjxNhM\r\n PHpxMubr5Pv1+aXl+IMvPBL/8/Zril4FClffr0ZAUkPd7THU3R43bBz85t8tV6vx6MXJODQyHo\r\n dGxuPgmUtxaa68Z91/9fSl+ORj5+L5O4aKXgUKJQCAp6WxoSGuXLMqrlyzKu7YvSkiIg6dG4sv\r\n nLgYnz9xIU6Ozxa84Xf7i68ci5/ctjZampwGRb48+oFn3J6hvnj9DTvifXfcFH/50mvj9l1D0V\r\n aiN9tzU3Nx55FTRa8BhSrPMxJYka5a2xu/fetV8Q//8dnxqwcui562chx4fO+DT0ZluT7OXYBa\r\n EABAEj1tLfHKvVvigz9/c7xm35bCjwhcnFmIf3pspNAdoEgCAEiqq7U5fuX6y+K9d9wYV6/rLX\r\n SXDx45Xeh8KJIAAAox1N0e73zx/vjl67ZHU0NDITs8fGEijo9NFzIbiiYAgMI0NjTEa6/ZGr//\r\n M3uitaCvBD5x9Fwhc6FoAgAo3LO3rI6337Y3Opqbks/+/PELyWdCGQgAoBT2b+iPP3j+nuRfB5\r\n wYn4nTE+W7VgHUmgAASuO64YF43fXbk8+95+Ro8plQNAEAlMor926Jn9iyOunMr50bSzoPykAA\r\n AKXzGzfvSnqdgAcFABkSAEDprO1uj1fv25Js3sWZhRidmU82D8pAAACl9Kq9W6K3rSXZvMeemk\r\n o2C8pAAACl1NLUGC+6fH2yeceeckEg8iIAgNJ66ZXDkepHgSfHZxJNgnIQAEBpDa/qiL1DfUlm\r\n nZuaSzIHykIAAKV2YONAkjnnJgUAeREAQKldP9yfZM7o7EKSOVAWAgAotSvWrIrOltrfI2B6oV\r\n LzGVAmAgAotcaGhtjS11XzOdWImJxfrPkcKAsBAJTe5t6OJHOmF5eSzIEyEABA6W3q7Uwyp7K0\r\n nGQOlIEAAEpvqLs9yZxKtZpkDpSBAABKryPBSYAREUvLAoB8CACg9FIFQMo7EELRPNqB0utsTh\r\n QAieZAGQgAoPSaGtPcEaC92Usi+fBoB0pvrpLm7Px2RwDIiAAASm+uUvvf5/e0NUeLcwDIiEc7\r\n UHopjgCs7Wqr+QwoEwEAlN6lBDfqWduV5loDUBYCACi9kana36p3XaKLDUFZCACg9M4mCIAdA7\r\n W/4RCUiQAASu/MxGzNZ1y+uqfmM6BMBABQapXl5Th2abqmM5oaGuKyge6azoCyEQBAqR29OBkL\r\n Nb5L3/aBLlcBJDsCACi1Ixcmaj7jwPBAzWdA2QgAoNTufnK05jNu2jxY8xlQNgIAKK3phUrcd+\r\n ZSTWd0tjTFnnW9NZ0BZSQAgNL6womLUVmu1nTGLVtWR3Ojl0Ly41EPlNZHHjlT8xkvvmJDzWdA\r\n GQkAoJQevjARXzs3VtMZw6s64pr1/TWdAWUlAIBSes8DJ2o+4yU+/ZMxAQCUzuGR8fjcExdqOq\r\n OnrTledtVwTWdAmQkAoFSWq9X447sejdqe+hfx8t2borOlucZToLwEAFAq73vwyfj66FRNZ/S0\r\n NccduzfVdAaUnQAASuPg2Uvxrq8cq/mcX7lue3S1+vRP3gQAUArnp+birZ86HEvV2h78f9baVf\r\n GzV22s6QyoBwIAKNyF6fn4tY8fjEtzizWd09TQEG++5YqazoB64RgYUKjzU3Pxho8djNMTszWf\r\n 9cvXb3fbX/gXAgAozFdPPxW/89kj8dTsQs1nPWfL6njV3i01nwP1QgAAyS1Xq/GXXz0Wf/u1Ez\r\n X/uV9ExIae9vgfz70qwSSoHwIASOozx87Hu77yeJJD/hER/e0t8fbb9jnrH76DZwRQc5Xl5fji\r\n iYvxNwePx9Ea/8b/W3W2NMU7XrAvNvd1JpsJ9UIAADVzfGw6Pvro2fjE0bM1P8P/O3U0N8Uf37\r\n Y3dq3uSToX6oUAAJ4xc5WluO/0pbjn1Gjcc3I0zkzOFbLHQEdrvN2bP/xAAgD4N5lZrMTjo1Px\r\n 6OhkfP3iN/489tR0zS/k88Ns6e2Md9y+L4a62wvdA8pOAABRWV6OpeVqVJarMVdZion5SkzNL8\r\n bEfCUm5hdjYn4xzk/Px9nJuTg7ORtnp+Zicr5S9Nrf5ae2r43fuuUKJ/zBj8CzBBJ56XvuKnqF\r\n b7Nc/cYbftGf2J8JHc1N8cabd8aLL99Q9CpQNwQAJDJbWSp6hRXpwPBAvOnZu2JjrzP94cchAI\r\n C6NNTdHr920864deuaoleBuiQAgLqypqstXrFnU7zsqo3R0uR+ZvBvJQCAujC8qiNetXdL3L5r\r\n KJobvfHD0yUAgNJqa2qM525bEy+6fEPs39Bf9DqwoggAoFQ6W5ri+uGBuGXL6rh125robPEyBb\r\n XgmQUUqrWpMXat7ok963rjxo0DsW99n0P8kIAAAArxhht2xL71fbFzsNsbPhRAAACFeP6OdTHY\r\n 2Vb0GpAtAQAU4qXvuSs293bGzsHuuHx1T+xa3ROXr+6JnraWoleDLAgAoBDViDgxPhMnxmfiU8\r\n fOf/Pvt/R2xoGNA3Fg40Ds39Af7c1NxS0JK5gAAErlX6Pg7x86Fc2NDbF3qC8ObByI521fG+t7\r\n OopeD1YMAQCUVmW5GveduRT3nbkU77r38dizrjdesGt9PG/7Wnf8g6fJMwioC9WIeHBkPB4cGY\r\n 8/uftoPGfL6njpFRviuuGBoleDuiQAgLqzsLQcnzl2Pj5z7HzsGuyOV+/bGs/dtiYaGxqKXg3q\r\n hgAA6trR0al466cPx/Cqjnjl1ZvjhbvWu0kQ/Ag8S4AV4fTEbPzRFx+Nl7//S/HJx84VvQ6Ung\r\n AAVpSR6fn4nc8eiV/80FfjsdGpoteB0hIAwIr08IWJ+IUPfSX+6r5jUVleLnodKB3nAEAid+ze\r\n FG0l/G66Uq1GtVqNpeVqLC5XY66yFAtLyzG9UInpxaWYml+MiflKjM8txlK1WvS6P5bKcjXeff\r\n /xuPfUU/G7z9sda7vbi14JSkMAQCK/eO22uv/t+tjcQlycXoizk7MxMj0Xp8Zn48TYTJwYm46R\r\n 6fmi1/u+Hjo/Ea+5895420/tjus3+tkgRAgA4MfQ194afe2tsWOw+7v+bXJ+Mb4+OhVHLkzEoZ\r\n HxOHRuPMbnFwvY8nubnK/Emz7xQLz5livihZevL3odKJwAAJ4RPW0tsX9Df+zf0P/Nv3v04mR8\r\n +dRo/PMTF+KRi5MFbvcNS9Vq/N7nH45Lcwvxqr1bil4HCiUAgJq5/F/u8PeafVvj/NRc/N+vn4\r\n uPHT0bpydmC93rz+99PBoj4pUigIyV74wkYEVa290er71ma/zdy2+Kt9+2N64b7v/h/1ENvfPe\r\n x+NDD58udAcokiMAQHI3bhqMGzcNxgPnxuJd9z4eD46MF7LHO+46Gut72uOGjYOFzIciOQIAFG\r\n bvUF/8+Uuujbc+96robWtJPn+pWo23fOpwnBqfST4biiYAgMLdtnMo/s/P3RA3FPATvZnFpXjL\r\n pw/H4pKLBZEXAQCUwkBHa7zjBfvi1QWcmPf10al455cfSz4XiiQAgFJ53YHL4o037Uw+9wMPnY\r\n pD58aSz4WiCACgdO7YvSl+4+a0EVCNiN///CPuG0A2BABQSv/hWZviDTfsSDrzxPhM3HnETwPJ\r\n gwAASusVV2+O23cNJZ351/cfj5nFStKZUAQBAJTabz7nirhyzapk88bnF+PvD59KNg+KIgCAUm\r\n tpaozf/end0dHclGzmBx465VwAVjwBAJTeUHd7/NJ125LNe2p2IT71+Plk86AIAgCoCy/fsznp\r\n VwEfP3o22SwoggAA6sbrD1yWbNb9Zy7F6Mx8snmQmgAA6sb+Df2xb6gvyaxqRHz6mK8BWLkEAF\r\n BX/tP+rclm3XNyNNksSE0AAHXluuGBGF7VkWTW186OuUkQK5YAAOrObTvSXBxofmk5Do2MJ5kF\r\n qQkAoO78u53prg545MJEslmQkgAA6s7wqo7Y3t+VZNajFyeTzIHUBABQl65O9GsAAcBKJQCAur\r\n R/fZoAODMx60RAViQBANSlPet6k8ypRsTZybkksyAlAQDUpbXd7dHalOYl7MzkbJI5kJIAAOrW\r\n hp72JHPOTTkCwMojAIC6tbG3M8mc8bnFJHMgJQEA1K2+tpYkcybmBQArjwAA6lZHS1OSOWOOAL\r\n ACCQCgbqUKgNnFpSRzICUBANSt9uY0AbC47DoArDwCAKhbqd6YK0vVJHMgJQEA1K25SpoAWKoK\r\n AFYeAQDUrflKmu/mmxoaksyBlAQAULfmEgVAc5MAYOURAEDdOj89n2ROS6OXSlYej2qgbqW6SU\r\n +qnxtCSgIAqFsjia7RvyrRFQchJQEA1KVzU3NRWU5zdn5Pa3OSOZCSAADq0pHzE8lmDXS2JpsF\r\n qQgAoC49dH482ayh7jS3HYaUBABQlw4nPAKwTgCwAgkAoO5ML1TikQtpAqAhItb3CABWHgEA1J\r\n 27nryY7ATAdd3tyW46BCkJAKDufO6JC8lmbR/oSjYLUhIAQF2ZXqjEPSdHk83bNdiTbBakJACA\r\n uvLhR87E/FKauwBGRDxr7apksyAlAQDUjeVqNT7w0KmkM3ev7U06D1IRAEDd+Oyx83Eu0eV/Iy\r\n IuG+iKVe0uA8zKJACAulBZXo6/+OqxpDNv3DiYdB6kJACAuvB3h07G6YnZpDNv3CQAWLkEAFB6\r\n T80uxLsPHk86s7+9Jfat70s6E1ISAEDpve2zR2JmcSnpzFu3rY3GhoakMyElAQCU2nsfOBH3nn\r\n 4q+dzn71iXfCakJACA0jo8Mp78xL+IiK19nbF3yOF/VjYBAJTSk2Mz8Zv/+GCya/5/q5+9ajj5\r\n TEhNAAClc2F6Pn794wdjfH4x+ezu1ua4fdf65HMhNQEAlMrpidl448cOxsj0fCHzf273xuhsaS\r\n 5kNqTkUQ6UxqFzY/HmTx4q5JN/RERnS1Pc8axNhcyG1AQAUAoffuRM/MndR2Mh4Y1+vtOr921x\r\n 6V+yIQCAQj05NhN/+MVH4uDZsUL3WNfVFi/f7dM/+RAAQCEm5xfj/YdPxnseeLLQT/3/6o0374\r\n q25qai14BkBACQ1PmpuXj/4ZPxDw+fidlK2qv7fT+3bl0Tt25dU/QakJQAAGpucWk57jk5Gp96\r\n fCQ+d/xCIb/t/35621riTc/eVfQakJwAAGpiYm4xDp4bi88eOx9fPHGxNJ/2v9NbnntlDHa2Fb\r\n 0GJCcAgKdtuVqNU+Oz8dD58Xjg3FgcGhmPE2MzUZ7P+d/bK67eHDdvXl30GlAIAQD8UNMLlRib\r\n W4xLswsxPrcYF2bm49TEbJwcn4kTY9NxZmIulqplf7v/djdsHIjXH7is6DWgMAIAEvmvn3ggmh\r\n rLe3vZxeVqLFSWorJcjcXl5VhcqsbC0nJMzC+W6jv7Z8LWvs542/N2u90vWRMAkMiDI+NFr0BE\r\n DHW3x5/efk10tXr5I2/uBQBkY3Vna/yvF14Ta7qc9AcCAMjCUHd7/NmLr43hVR1FrwKl4BgYsO\r\n Jt6e2MP719X6ztbi96FSgNAQCsaNcN98fv/fQe3/nDd/CMAFasf3/Vxvj1m3c62x++BwEArDi9\r\n bS3x27deGc/e4iI/8P0IAGBFOTA84PK+8CMQAMCK0NzYEK+7/rJ4xdWbi14F6oIAAOreT2xZHW\r\n +4caef+MGPQQAAdWvnYHe88aadcc36/qJXgbojAIC6M9DRGr903fZ4yRUbil4F6pYAAOrG9v6u\r\n uGPPprhtx1C0NLmQKTwdAgAovQPDA/HzV2+KGzYOFr0KrBgCACilNV1t8bzta+NFl2+Ibf1dRa\r\n 8DK44AAEpjoKM1fnLb2viZy9bGnqG+oteBFU0AAIVpamiIXat7Yv/6vrhp86Cz+SEhAQAk09zY\r\n EFesWRXXDPXFNRv6Yu9QX7Q3NxW9FmRJAADPuObGhti4qiO29XfF1v6u2N7fHdv6u2JTb0c0Nz\r\n p7H8pAAADfU1NDQzQ3NkRrc2O0NTVGc+M3/mxtbozWpsbobW+JwY7WGOxsi4GO1hjsbI3BjtZY\r\n 3dUWa7ravNFDyTWMTM5Wi14CAEhLogNAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAG\r\n RIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRI\r\n AABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAA\r\n BAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABA\r\n hgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhg\r\n QAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQA\r\n AGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAG\r\n RIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRI\r\n AABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAA\r\n BAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABA\r\n hgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhg\r\n QAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQA\r\n AGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAGRIAABAhgQAAG\r\n RIAABAhgQAAGTo/wEFynWKh7+QqQAAAABJRU5ErkJggg==\r\nX-SOCIALPROFILE;TYPE=NEXTCLOUD;X-NC-SCOPE=v2-published:http://192.168.7.13/\r\n nextcloud/index.php/u/Brent\r\nX-MANAGERSNAME;UID=next;X-NC-SCOPE=v2-local:next\r\nCLOUD:Brent@http://192.168.7.13/nextcloud\r\nEND:VCARD\r\n','Database:Brent.vcf',1714125999,'fef90da921bb297ec290bc0e3ad2e77a',10034,'Brent');
/*!40000 ALTER TABLE `oc_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards_properties`
--

DROP TABLE IF EXISTS `oc_cards_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards_properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `cardid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `preferred` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `card_contactid_index` (`cardid`),
  KEY `card_name_index` (`name`),
  KEY `card_value_index` (`value`),
  KEY `cards_prop_abid` (`addressbookid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards_properties`
--

LOCK TABLES `oc_cards_properties` WRITE;
/*!40000 ALTER TABLE `oc_cards_properties` DISABLE KEYS */;
INSERT INTO `oc_cards_properties` VALUES (11,1,1,'UID','Brent',0),(12,1,1,'FN','Brent',0),(13,1,1,'N','Brent;;;;',0),(14,1,1,'EMAIL','brent.declercq2@student.hogent.be',0),(15,1,1,'X-SOCIALPROFILE','http://192.168.7.13/nextcloud/index.php/u/Brent',0),(16,1,1,'CLOUD','Brent@http://192.168.7.13/nextcloud',0);
/*!40000 ALTER TABLE `oc_cards_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_circle`
--

DROP TABLE IF EXISTS `oc_circles_circle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_circle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(31) NOT NULL,
  `name` varchar(127) NOT NULL,
  `display_name` varchar(255) DEFAULT '',
  `sanitized_name` varchar(127) DEFAULT '',
  `instance` varchar(255) DEFAULT '',
  `config` int(10) unsigned DEFAULT NULL,
  `source` int(10) unsigned DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  `contact_addressbook` int(10) unsigned DEFAULT NULL,
  `contact_groupname` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8195F548E3C68343` (`unique_id`),
  KEY `IDX_8195F548D48A2F7C` (`config`),
  KEY `IDX_8195F5484230B1DE` (`instance`),
  KEY `IDX_8195F5485F8A7F73` (`source`),
  KEY `IDX_8195F548C317B362` (`sanitized_name`),
  KEY `dname` (`display_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_circle`
--

LOCK TABLES `oc_circles_circle` WRITE;
/*!40000 ALTER TABLE `oc_circles_circle` DISABLE KEYS */;
INSERT INTO `oc_circles_circle` VALUES (1,'2xRl6K5LKVAVYFu5ey2G1N9TB3WOw3s','user:next:2xRl6K5LKVAVYFu5ey2G1N9TB3WOw3s','next','','',1,1,'[]','','2024-04-26 10:04:46',0,''),(2,'drjkprotJ6TNMWZIKUpqxPmcCdIE1ZO','app:circles:drjkprotJ6TNMWZIKUpqxPmcCdIE1ZO','Circles','','',8193,10001,'[]','','2024-04-26 10:04:46',0,''),(3,'YI82QemKK8hUjFwAC3Ui5ksbwEq4qWK','user:Brent:YI82QemKK8hUjFwAC3Ui5ksbwEq4qWK','Brent','','',1,1,'[]','','2024-04-26 10:06:38',0,'');
/*!40000 ALTER TABLE `oc_circles_circle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_event`
--

DROP TABLE IF EXISTS `oc_circles_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_event` (
  `token` varchar(63) NOT NULL,
  `instance` varchar(255) NOT NULL,
  `event` longtext DEFAULT NULL,
  `result` longtext DEFAULT NULL,
  `interface` int(11) NOT NULL DEFAULT 0,
  `severity` int(11) DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `creation` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`token`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_event`
--

LOCK TABLES `oc_circles_event` WRITE;
/*!40000 ALTER TABLE `oc_circles_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_member`
--

DROP TABLE IF EXISTS `oc_circles_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `single_id` varchar(31) DEFAULT NULL,
  `circle_id` varchar(31) NOT NULL,
  `member_id` varchar(31) DEFAULT NULL,
  `user_id` varchar(127) NOT NULL,
  `user_type` smallint(6) NOT NULL DEFAULT 1,
  `instance` varchar(255) DEFAULT '',
  `invited_by` varchar(31) DEFAULT NULL,
  `level` smallint(6) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `cached_name` varchar(255) DEFAULT '',
  `cached_update` datetime DEFAULT NULL,
  `contact_id` varchar(127) DEFAULT NULL,
  `contact_meta` longtext DEFAULT NULL,
  `joined` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_member_cisiuiutil` (`circle_id`,`single_id`,`user_id`,`user_type`,`instance`,`level`),
  KEY `circles_member_cisi` (`circle_id`,`single_id`),
  KEY `IDX_25C66A49E7A1254A` (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_member`
--

LOCK TABLES `oc_circles_member` WRITE;
/*!40000 ALTER TABLE `oc_circles_member` DISABLE KEYS */;
INSERT INTO `oc_circles_member` VALUES (1,'drjkprotJ6TNMWZIKUpqxPmcCdIE1ZO','drjkprotJ6TNMWZIKUpqxPmcCdIE1ZO','drjkprotJ6TNMWZIKUpqxPmcCdIE1ZO','circles',10000,'',NULL,9,'Member','[]','Circles','2024-04-26 10:04:46','',NULL,'2024-04-26 10:04:46'),(2,'2xRl6K5LKVAVYFu5ey2G1N9TB3WOw3s','2xRl6K5LKVAVYFu5ey2G1N9TB3WOw3s','2xRl6K5LKVAVYFu5ey2G1N9TB3WOw3s','next',1,'','drjkprotJ6TNMWZIKUpqxPmcCdIE1ZO',9,'Member','[]','next','2024-04-26 10:04:47','',NULL,'2024-04-26 10:04:47'),(3,'YI82QemKK8hUjFwAC3Ui5ksbwEq4qWK','YI82QemKK8hUjFwAC3Ui5ksbwEq4qWK','YI82QemKK8hUjFwAC3Ui5ksbwEq4qWK','Brent',1,'','drjkprotJ6TNMWZIKUpqxPmcCdIE1ZO',9,'Member','[]','Brent','2024-04-26 10:06:39','',NULL,'2024-04-26 10:06:39');
/*!40000 ALTER TABLE `oc_circles_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_membership`
--

DROP TABLE IF EXISTS `oc_circles_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_membership` (
  `circle_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `inheritance_first` varchar(31) NOT NULL,
  `inheritance_last` varchar(31) NOT NULL,
  `inheritance_depth` int(10) unsigned NOT NULL,
  `inheritance_path` longtext NOT NULL,
  PRIMARY KEY (`single_id`,`circle_id`),
  KEY `IDX_8FC816EAE7C1D92B` (`single_id`),
  KEY `circles_membership_ifilci` (`inheritance_first`,`inheritance_last`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_membership`
--

LOCK TABLES `oc_circles_membership` WRITE;
/*!40000 ALTER TABLE `oc_circles_membership` DISABLE KEYS */;
INSERT INTO `oc_circles_membership` VALUES ('2xRl6K5LKVAVYFu5ey2G1N9TB3WOw3s','2xRl6K5LKVAVYFu5ey2G1N9TB3WOw3s',9,'2xRl6K5LKVAVYFu5ey2G1N9TB3WOw3s','2xRl6K5LKVAVYFu5ey2G1N9TB3WOw3s',1,'[\"2xRl6K5LKVAVYFu5ey2G1N9TB3WOw3s\"]'),('YI82QemKK8hUjFwAC3Ui5ksbwEq4qWK','YI82QemKK8hUjFwAC3Ui5ksbwEq4qWK',9,'YI82QemKK8hUjFwAC3Ui5ksbwEq4qWK','YI82QemKK8hUjFwAC3Ui5ksbwEq4qWK',1,'[\"YI82QemKK8hUjFwAC3Ui5ksbwEq4qWK\"]'),('drjkprotJ6TNMWZIKUpqxPmcCdIE1ZO','drjkprotJ6TNMWZIKUpqxPmcCdIE1ZO',9,'drjkprotJ6TNMWZIKUpqxPmcCdIE1ZO','drjkprotJ6TNMWZIKUpqxPmcCdIE1ZO',1,'[\"drjkprotJ6TNMWZIKUpqxPmcCdIE1ZO\"]');
/*!40000 ALTER TABLE `oc_circles_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mount`
--

DROP TABLE IF EXISTS `oc_circles_mount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) NOT NULL,
  `circle_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `token` varchar(63) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `mountpoint` longtext DEFAULT NULL,
  `mountpoint_hash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mount_cimipt` (`circle_id`,`mount_id`,`parent`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mount`
--

LOCK TABLES `oc_circles_mount` WRITE;
/*!40000 ALTER TABLE `oc_circles_mount` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mountpoint`
--

DROP TABLE IF EXISTS `oc_circles_mountpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mountpoint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `mountpoint` longtext DEFAULT NULL,
  `mountpoint_hash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mountpoint_ms` (`mount_id`,`single_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mountpoint`
--

LOCK TABLES `oc_circles_mountpoint` WRITE;
/*!40000 ALTER TABLE `oc_circles_mountpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mountpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_remote`
--

DROP TABLE IF EXISTS `oc_circles_remote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_remote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT 'Unknown',
  `interface` int(11) NOT NULL DEFAULT 0,
  `uid` varchar(20) DEFAULT NULL,
  `instance` varchar(127) DEFAULT NULL,
  `href` varchar(254) DEFAULT NULL,
  `item` longtext DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F94EF834230B1DE` (`instance`),
  KEY `IDX_F94EF83539B0606` (`uid`),
  KEY `IDX_F94EF8334F8E741` (`href`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_remote`
--

LOCK TABLES `oc_circles_remote` WRITE;
/*!40000 ALTER TABLE `oc_circles_remote` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_remote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_share_lock`
--

DROP TABLE IF EXISTS `oc_circles_share_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_share_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(31) NOT NULL,
  `circle_id` varchar(31) NOT NULL,
  `instance` varchar(127) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_337F52F8126F525E70EE2FF6` (`item_id`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_share_lock`
--

LOCK TABLES `oc_circles_share_lock` WRITE;
/*!40000 ALTER TABLE `oc_circles_share_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_share_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_token`
--

DROP TABLE IF EXISTS `oc_circles_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) DEFAULT NULL,
  `circle_id` varchar(31) DEFAULT NULL,
  `single_id` varchar(31) DEFAULT NULL,
  `member_id` varchar(31) DEFAULT NULL,
  `token` varchar(31) DEFAULT NULL,
  `password` varchar(127) DEFAULT NULL,
  `accepted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sicisimit` (`share_id`,`circle_id`,`single_id`,`member_id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_token`
--

LOCK TABLES `oc_circles_token` WRITE;
/*!40000 ALTER TABLE `oc_circles_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_accesscache`
--

DROP TABLE IF EXISTS `oc_collres_accesscache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_accesscache` (
  `user_id` varchar(64) NOT NULL,
  `collection_id` bigint(20) NOT NULL DEFAULT 0,
  `resource_type` varchar(64) NOT NULL DEFAULT '',
  `resource_id` varchar(64) NOT NULL DEFAULT '',
  `access` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`user_id`,`collection_id`,`resource_type`,`resource_id`),
  KEY `collres_user_res` (`user_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_accesscache`
--

LOCK TABLES `oc_collres_accesscache` WRITE;
/*!40000 ALTER TABLE `oc_collres_accesscache` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_accesscache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_collections`
--

DROP TABLE IF EXISTS `oc_collres_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_collections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_collections`
--

LOCK TABLES `oc_collres_collections` WRITE;
/*!40000 ALTER TABLE `oc_collres_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_resources`
--

DROP TABLE IF EXISTS `oc_collres_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_resources` (
  `collection_id` bigint(20) NOT NULL,
  `resource_type` varchar(64) NOT NULL,
  `resource_id` varchar(64) NOT NULL,
  PRIMARY KEY (`collection_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_resources`
--

LOCK TABLES `oc_collres_resources` WRITE;
/*!40000 ALTER TABLE `oc_collres_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments`
--

DROP TABLE IF EXISTS `oc_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `topmost_parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `children_count` int(10) unsigned NOT NULL DEFAULT 0,
  `actor_type` varchar(64) NOT NULL DEFAULT '',
  `actor_id` varchar(64) NOT NULL DEFAULT '',
  `message` longtext DEFAULT NULL,
  `verb` varchar(64) DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT NULL,
  `latest_child_timestamp` datetime DEFAULT NULL,
  `object_type` varchar(64) NOT NULL DEFAULT '',
  `object_id` varchar(64) NOT NULL DEFAULT '',
  `reference_id` varchar(64) DEFAULT NULL,
  `reactions` varchar(4000) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `meta_data` longtext DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_index` (`parent_id`),
  KEY `comments_topmost_parent_id_idx` (`topmost_parent_id`),
  KEY `comments_object_index` (`object_type`,`object_id`,`creation_timestamp`),
  KEY `comments_actor_index` (`actor_type`,`actor_id`),
  KEY `expire_date` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments`
--

LOCK TABLES `oc_comments` WRITE;
/*!40000 ALTER TABLE `oc_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments_read_markers`
--

DROP TABLE IF EXISTS `oc_comments_read_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments_read_markers` (
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `object_type` varchar(64) NOT NULL DEFAULT '',
  `object_id` varchar(64) NOT NULL DEFAULT '',
  `marker_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`object_type`,`object_id`),
  KEY `comments_marker_object_index` (`object_type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments_read_markers`
--

LOCK TABLES `oc_comments_read_markers` WRITE;
/*!40000 ALTER TABLE `oc_comments_read_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments_read_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_absence`
--

DROP TABLE IF EXISTS `oc_dav_absence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_absence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `first_day` varchar(10) NOT NULL,
  `last_day` varchar(10) NOT NULL,
  `status` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_absence_uid_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_absence`
--

LOCK TABLES `oc_dav_absence` WRITE;
/*!40000 ALTER TABLE `oc_dav_absence` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_absence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_cal_proxy`
--

DROP TABLE IF EXISTS `oc_dav_cal_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_cal_proxy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` varchar(64) NOT NULL,
  `proxy_id` varchar(64) NOT NULL,
  `permissions` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_cal_proxy_uidx` (`owner_id`,`proxy_id`,`permissions`),
  KEY `dav_cal_proxy_ipid` (`proxy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_cal_proxy`
--

LOCK TABLES `oc_dav_cal_proxy` WRITE;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_shares`
--

DROP TABLE IF EXISTS `oc_dav_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_shares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access` smallint(6) DEFAULT NULL,
  `resourceid` bigint(20) unsigned NOT NULL,
  `publicuri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_shares_index` (`principaluri`,`resourceid`,`type`,`publicuri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_shares`
--

LOCK TABLES `oc_dav_shares` WRITE;
/*!40000 ALTER TABLE `oc_dav_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_direct_edit`
--

DROP TABLE IF EXISTS `oc_direct_edit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_direct_edit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `editor_id` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `share_id` bigint(20) DEFAULT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  `accessed` tinyint(1) DEFAULT 0,
  `file_path` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4D5AFECA5F37A13B` (`token`),
  KEY `direct_edit_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_direct_edit`
--

LOCK TABLES `oc_direct_edit` WRITE;
/*!40000 ALTER TABLE `oc_direct_edit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_direct_edit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_directlink`
--

DROP TABLE IF EXISTS `oc_directlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_directlink` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) DEFAULT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `token` varchar(60) DEFAULT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directlink_token_idx` (`token`),
  KEY `directlink_expiration_idx` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_directlink`
--

LOCK TABLES `oc_directlink` WRITE;
/*!40000 ALTER TABLE `oc_directlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_directlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_federated_reshares`
--

DROP TABLE IF EXISTS `oc_federated_reshares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_federated_reshares` (
  `share_id` bigint(20) NOT NULL,
  `remote_id` varchar(255) DEFAULT '',
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_federated_reshares`
--

LOCK TABLES `oc_federated_reshares` WRITE;
/*!40000 ALTER TABLE `oc_federated_reshares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_federated_reshares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_file_locks`
--

DROP TABLE IF EXISTS `oc_file_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_file_locks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lock` int(11) NOT NULL DEFAULT 0,
  `key` varchar(64) NOT NULL,
  `ttl` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lock_key_index` (`key`),
  KEY `lock_ttl_index` (`ttl`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_locks`
--

LOCK TABLES `oc_file_locks` WRITE;
/*!40000 ALTER TABLE `oc_file_locks` DISABLE KEYS */;
INSERT INTO `oc_file_locks` VALUES (1,0,'files/88b27fb6a1b0923cfcb5b3580df8187a',1714223275),(32,0,'files/a855812f4556f4d259f4cf3396fa8e36',1714223275),(34,0,'files/ef82fbaa71700370802a7079570d68c3',1714223275),(116,0,'files/49f5d7716799ea96c8d539db0b12eec0',1714223274),(118,0,'files/f0b2874d3d65869d5a9a5d1f19d207d3',1714223274),(135,0,'files/7e305a80d26a66b63d0acc1fa789e0a2',1714223274),(136,0,'files/2a2218ac94993c7e9ef190aac8e6dcf2',1714223274),(149,0,'files/f63babdf3536069cac62b642f509ca1d',1714223274),(150,0,'files/c8c3db2f148568dcd1b0a8b0941c2f3b',1714223274),(151,0,'files/2a8882bde481e385981466da8601e357',1714223274),(152,0,'files/6126d6dbca6600f0ff05f50031f83102',1714223274),(153,0,'files/490dc15d28ed01c35f8263d095e57ae7',1714223274),(154,0,'files/17dec6f9fd55c77ab817de72e4d6cd91',1714223274),(155,0,'files/6f4b74e44eecb00a27bd82a45418c970',1714223274),(165,0,'files/d898168518fd57ba84c4f732bf26578a',1714223274),(169,0,'files/fdd7c1468148200b3edf5260659b6ff3',1714222140),(170,0,'files/a8b789bc6f7b733c341ef13528427211',1714222140),(172,0,'files/acfeda01c921bf9ca34961f8c2fef9a7',1714222140),(173,0,'files/9bf46d9db618ef51e8e41f228a511f61',1714222140),(174,0,'files/e37d4ec78e75a36e90fc7d3a304c762b',1714222140),(175,0,'files/23de502ccfdcc7ffb61b9f3cf4b99a64',1714222140),(176,0,'files/0d6201eb56de2ac160da1e030406425d',1714222140),(177,0,'files/2ea074e6e39cadeb3bef05948a47937c',1714222140),(178,0,'files/b2c6b2028bc05d0e319ba1902bf654bd',1714222140),(179,0,'files/b88dfab475faf12ad310a1df5234b59c',1714222140),(180,0,'files/edd671a9aa134a956da6dbb73d398157',1714222140),(181,0,'files/3d4757f149002546ce7d3589a2bd1cd6',1714222140),(184,0,'files/c1e4352d41aab2bef5e5864b7fa0b5eb',1714222140),(185,0,'files/7cb25b267292eac55109d2a85b061b8c',1714222140),(186,0,'files/6a0e9cfb2543ded9d02283c163412a0d',1714222140),(187,0,'files/817007c347668113ee8c95143819f767',1714222140),(188,0,'files/f3fe9db70004f39f3da8922195436932',1714222140),(189,0,'files/83f5c344b41aab42bd70f7e55fe40483',1714222140),(190,0,'files/ead2512217cc3b8b49ba2dcf23e22de2',1714222140),(194,0,'files/9cf714158cb91dea6af12f66e40aa9b8',1714222150),(195,0,'files/b8659da7567931134b243e7e7af60f0a',1714222150),(196,0,'files/3f7beb9e65a847e12c9fc3fa6e8b6c12',1714222150),(197,0,'files/e3983075385b5e29318b0e35c35690b1',1714222150),(198,0,'files/43f4d7e6e8de419f8537c018f270f17f',1714222150),(199,0,'files/fd0579d5c69e90ba8c808d54df4b5ff1',1714222150),(200,0,'files/3969a201a0a5ef83a425abc5bf3314d2',1714222150),(201,0,'files/73cbb7bad0563242df858aa84c873697',1714222150),(202,0,'files/0da272ccc74176e2684a683555e3c68d',1714222150),(203,0,'files/a7cb284a70ba7188fa9b22b2508de535',1714222150),(204,0,'files/8347ede106fe984f22f6e04644af36d3',1714222150),(205,0,'files/64fe820251638e4ad002a5086c056ef4',1714222150),(206,0,'files/8b778b68465b3531807698cfc2333580',1714222150),(207,0,'files/3d1278b45ae29a99da1d33793f418620',1714222150),(208,0,'files/b0afa19c0d5322c8d70295f6fcaa5961',1714222150),(209,0,'files/20f716343b95d21b52c9b4bad706dac6',1714222150),(210,0,'files/dc13cfec3521567852753c6aad9dd13f',1714222150),(211,0,'files/00febada651cfb76fa728fdc030ec0ff',1714222150),(212,0,'files/f3dc12600812ce96d5e95a9a82ec6278',1714222150),(213,0,'files/f678c1c5b3384f9d5a227e2ae61468f8',1714222150),(215,0,'files/b2fde07198d21d1c5a7f4f59c64d11d8',1714222150),(217,0,'files/3086405f574345b79dcb56413df05d1d',1714222150),(219,0,'files/51b2df04b55b07aa0b9bbb0235f7f28d',1714222150),(243,0,'files/b66158b8f117fc873b9948f2ac18173d',1714223274),(244,0,'files/dc7d1d571125c3a9311f0f21e422e8f8',1714223274);
/*!40000 ALTER TABLE `oc_file_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache`
--

DROP TABLE IF EXISTS `oc_filecache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache` (
  `fileid` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage` bigint(20) NOT NULL DEFAULT 0,
  `path` varchar(4000) DEFAULT NULL,
  `path_hash` varchar(32) NOT NULL DEFAULT '',
  `parent` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(250) DEFAULT NULL,
  `mimetype` bigint(20) NOT NULL DEFAULT 0,
  `mimepart` bigint(20) NOT NULL DEFAULT 0,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `mtime` bigint(20) NOT NULL DEFAULT 0,
  `storage_mtime` bigint(20) NOT NULL DEFAULT 0,
  `encrypted` int(11) NOT NULL DEFAULT 0,
  `unencrypted_size` bigint(20) NOT NULL DEFAULT 0,
  `etag` varchar(40) DEFAULT NULL,
  `permissions` int(11) DEFAULT 0,
  `checksum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fileid`),
  UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`),
  KEY `fs_parent_name_hash` (`parent`,`name`),
  KEY `fs_storage_mimetype` (`storage`,`mimetype`),
  KEY `fs_storage_mimepart` (`storage`,`mimepart`),
  KEY `fs_storage_size` (`storage`,`size`,`fileid`),
  KEY `fs_id_storage_size` (`fileid`,`storage`,`size`),
  KEY `fs_parent` (`parent`),
  KEY `fs_mtime` (`mtime`),
  KEY `fs_size` (`size`),
  KEY `fs_storage_path_prefix` (`storage`,`path`(64))
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache`
--

LOCK TABLES `oc_filecache` WRITE;
/*!40000 ALTER TABLE `oc_filecache` DISABLE KEYS */;
INSERT INTO `oc_filecache` VALUES (1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,38784812,1714126038,1714126038,0,0,'662b7cd6b1106',23,''),(2,1,'files','45b963397aa40d4a0063e0d85e4fe7a1',1,'files',2,1,38784812,1714125889,1714125889,0,0,'662b7c41b8d6e',31,''),(3,1,'files/Documents','0ad78ba05b6961d92f7970b2b3922eca',2,'Documents',2,1,1108865,1714125887,1714125887,0,0,'662b7c3f57c67',31,''),(4,1,'files/Documents/Nextcloud flyer.pdf','9c5b4dc7182a7435767708ac3e8d126c',3,'Nextcloud flyer.pdf',4,3,1083339,1714125887,1714125887,0,0,'fc06a9ec106d4da8075b3a7a88ceae93',27,''),(5,1,'files/Documents/Example.md','efe0853470dd0663db34818b444328dd',3,'Example.md',6,5,1095,1714125887,1714125887,0,0,'a27b02f704477c14ebcbcb7d56ef4bcc',27,''),(6,1,'files/Documents/Welcome to Nextcloud Hub.docx','b44cb84f22ceddc4ca2826e026038091',3,'Welcome to Nextcloud Hub.docx',7,3,24295,1714125887,1714125887,0,0,'1251a75207f95b5fdf4a1b3a155cdf4c',27,''),(7,1,'files/Documents/Readme.md','51ec9e44357d147dd5c212b850f6910f',3,'Readme.md',6,5,136,1714125887,1714125887,0,0,'27fe54a372ffa41efa746060362a22c9',27,''),(8,1,'files/Nextcloud Manual.pdf','2bc58a43566a8edde804a4a97a9c7469',2,'Nextcloud Manual.pdf',4,3,16305464,1714125887,1714125887,0,0,'ccc61516354ba8038486098bbdb7c5a3',27,''),(9,1,'files/Nextcloud.png','2bcc0ff06465ef1bfc4a868efde1e485',2,'Nextcloud.png',9,8,50598,1714125887,1714125887,0,0,'97d9228cad4f0a381cf53e2c36114dcb',27,''),(10,1,'files/Templates','530b342d0b8164ff3b4754c2273a453e',2,'Templates',2,1,10721152,1714125888,1714125888,0,0,'662b7c40dfc2b',31,''),(11,1,'files/Templates/Org chart.odg','fd846bc062b158abb99a75a5b33b53e7',10,'Org chart.odg',10,3,13878,1714125887,1714125887,0,0,'3b5979826217d8eb572c1111d40cd17e',27,''),(12,1,'files/Templates/Party invitation.odt','439f95f734be87868374b1a5a312c550',10,'Party invitation.odt',11,3,868111,1714125887,1714125887,0,0,'59175dd20b689f2e8a18ed003f79a45b',27,''),(13,1,'files/Templates/Product plan.md','a9fbf58bf31cebb8143f7ad3a5205633',10,'Product plan.md',6,5,573,1714125887,1714125887,0,0,'496b53162f02e7d8174f92d7a9762919',27,''),(14,1,'files/Templates/Mother\'s day.odt','cb66c617dbb4acc9b534ec095c400b53',10,'Mother\'s day.odt',11,3,340061,1714125887,1714125887,0,0,'4edcbcc389e1adfc14d671f3213d31bd',27,''),(15,1,'files/Templates/Letter.odt','15545ade0e9863c98f3a5cc0fbf2836a',10,'Letter.odt',11,3,15961,1714125887,1714125887,0,0,'f4562e72e0c4a153579ce576525bba25',27,''),(16,1,'files/Templates/Timesheet.ods','cb79c81e41d3c3c77cd31576dc7f1a3a',10,'Timesheet.ods',12,3,88394,1714125887,1714125887,0,0,'6ae663b8c14d16121fed59635eb26864',27,''),(17,1,'files/Templates/Meeting notes.md','c0279758bb570afdcdbc2471b2f16285',10,'Meeting notes.md',6,5,326,1714125887,1714125887,0,0,'0acf1df87e38bca0e1a8cf86ff48b12b',27,''),(18,1,'files/Templates/Photo book.odt','ea35993988e2799424fef3ff4f420c24',10,'Photo book.odt',11,3,5155877,1714125887,1714125887,0,0,'873cb465daaeb36691449f216a0a7251',27,''),(19,1,'files/Templates/Mindmap.odg','74cff798fc1b9634ee45380599b2a6da',10,'Mindmap.odg',10,3,13653,1714125888,1714125888,0,0,'8645b40ef6d4fb00c97db485b4169145',27,''),(20,1,'files/Templates/Elegant.odp','f3ec70ed694c0ca215f094b98eb046a7',10,'Elegant.odp',13,3,14316,1714125888,1714125888,0,0,'d7fac18812b5002d6a0e31ade557800b',27,''),(21,1,'files/Templates/Resume.odt','ace8f81202eadb2f0c15ba6ecc2539f5',10,'Resume.odt',11,3,39404,1714125888,1714125888,0,0,'bb64171e1db5640cb3494e8c3cd0e2ec',27,''),(22,1,'files/Templates/SWOT analysis.whiteboard','3fd0e44b3e6f0e7144442ef6fc71a663',10,'SWOT analysis.whiteboard',14,3,38605,1714125888,1714125888,0,0,'e9e736b3f1c8d731f492b29e6ee981dc',27,''),(23,1,'files/Templates/Expense report.ods','d0a4025621279b95d2f94ff4ec09eab3',10,'Expense report.ods',12,3,13441,1714125888,1714125888,0,0,'9cc3bbd276309af5d4a778dc26614253',27,''),(24,1,'files/Templates/Modern company.odp','96ad2c06ebb6a79bcdf2f4030421dee3',10,'Modern company.odp',13,3,317015,1714125888,1714125888,0,0,'1c62b1b45089599701c657b2fde145c4',27,''),(25,1,'files/Templates/Simple.odp','a2c90ff606d31419d699b0b437969c61',10,'Simple.odp',13,3,14810,1714125888,1714125888,0,0,'42e179b58439cab476b9d16a41d553a2',27,''),(26,1,'files/Templates/Business model canvas.ods','86c10a47dedf156bf4431cb75e0f76ec',10,'Business model canvas.ods',12,3,52843,1714125888,1714125888,0,0,'d28edd2d3d10fa14dfbbed4bfc5d0f04',27,''),(27,1,'files/Templates/Invoice.odt','40fdccb51b6c3e3cf20532e06ed5016e',10,'Invoice.odt',11,3,17276,1714125888,1714125888,0,0,'5f91c022e0f086cdc312a2985138e7ee',27,''),(28,1,'files/Templates/Flowchart.odg','832942849155883ceddc6f3cede21867',10,'Flowchart.odg',10,3,11836,1714125888,1714125888,0,0,'09a4e6c51d0b86996b1ffbac2bbdceab',27,''),(29,1,'files/Templates/Syllabus.odt','03b3147e6dae00674c1d50fe22bb8496',10,'Syllabus.odt',11,3,30354,1714125888,1714125888,0,0,'4e0e61937e85a06260edb5aa214a4c49',27,''),(30,1,'files/Templates/Gotong royong.odp','14b958f5aafb7cfd703090226f3cbd1b',10,'Gotong royong.odp',13,3,3509628,1714125888,1714125888,0,0,'618ca2857babb9502b6321e8cfc72724',27,''),(31,1,'files/Templates/Business model canvas.odg','6a8f3e02bdf45c8b0671967969393bcb',10,'Business model canvas.odg',10,3,16988,1714125888,1714125888,0,0,'592006092ba91bef7a653e8e9f9faf60',27,''),(32,1,'files/Templates/Impact effort matrix.whiteboard','c5e3b589ec8f9dd6afdebe0ac6feeac8',10,'Impact effort matrix.whiteboard',14,3,52674,1714125888,1714125888,0,0,'f2a9058fed60f6009b5fde01e3809383',27,''),(33,1,'files/Templates/Yellow idea.odp','3a57051288d7b81bef3196a2123f4af5',10,'Yellow idea.odp',13,3,81196,1714125888,1714125888,0,0,'906130c57e34ab92d4c6dfd62bfe2030',27,''),(34,1,'files/Templates/Diagram & table.ods','0a89f154655f6d4a0098bc4e6ca87367',10,'Diagram & table.ods',12,3,13378,1714125888,1714125888,0,0,'317d15253a1fe6cc6a7ad1653a2afc8c',27,''),(35,1,'files/Templates/Readme.md','71fa2e74ab30f39eed525572ccc3bbec',10,'Readme.md',6,5,554,1714125888,1714125888,0,0,'2b6ce161f0d50afff27d481ddd2a7696',27,''),(36,1,'files/Templates credits.md','f7c01e3e0b55bb895e09dc08d19375b3',2,'Templates credits.md',6,5,2403,1714125888,1714125888,0,0,'1d05d779a1fcd77d9d2c8d2e4cea37a8',27,''),(37,1,'files/Reasons to use Nextcloud.pdf','418b19142a61c5bef296ea56ee144ca3',2,'Reasons to use Nextcloud.pdf',4,3,976625,1714125889,1714125889,0,0,'61eb037824c1abafa7ffb51c01e1e283',27,''),(38,1,'files/Readme.md','49af83716f8dcbfa89aaf835241c0b9f',2,'Readme.md',6,5,206,1714125889,1714125889,0,0,'684c9455f4340057d8a763508ffb5b31',27,''),(39,1,'files/Nextcloud intro.mp4','e4919345bcc87d4585a5525daaad99c0',2,'Nextcloud intro.mp4',16,15,3963036,1714125889,1714125889,0,0,'5beb6302c4d9506080d93fe3aa3b2b08',27,''),(40,1,'files/Photos','d01bb67e7b71dd49fd06bad922f521c9',2,'Photos',2,1,5656463,1714125889,1714125889,0,0,'662b7c41b8d6e',31,''),(41,1,'files/Photos/Frog.jpg','d6219add1a9129ed0c1513af985e2081',40,'Frog.jpg',17,8,457744,1714125889,1714125889,0,0,'e6238d51707a7fe984c78dab7731f4a1',27,''),(42,1,'files/Photos/Nextcloud community.jpg','b9b3caef83a2a1c20354b98df6bcd9d0',40,'Nextcloud community.jpg',17,8,797325,1714125889,1714125889,0,0,'3631dfbb81ebc74984c9a4fa23d23441',27,''),(43,1,'files/Photos/Library.jpg','0b785d02a19fc00979f82f6b54a05805',40,'Library.jpg',17,8,2170375,1714125889,1714125889,0,0,'03bcfe093c97fc3e03040d95fc7e30ef',27,''),(44,1,'files/Photos/Birdie.jpg','cd31c7af3a0ec6e15782b5edd2774549',40,'Birdie.jpg',17,8,593508,1714125889,1714125889,0,0,'4390492d105c3a9c8a700765a94b3b6d',27,''),(45,1,'files/Photos/Toucan.jpg','681d1e78f46a233e12ecfa722cbc2aef',40,'Toucan.jpg',17,8,167989,1714125889,1714125889,0,0,'8cdc3bfc039ea7aec77c93632a293f84',27,''),(46,1,'files/Photos/Vineyard.jpg','14e5f2670b0817614acd52269d971db8',40,'Vineyard.jpg',17,8,427030,1714125889,1714125889,0,0,'20602fcc20371bce10e56a05b739aba0',27,''),(47,1,'files/Photos/Steps.jpg','7b2ca8d05bbad97e00cbf5833d43e912',40,'Steps.jpg',17,8,567689,1714125889,1714125889,0,0,'a30490733b72ff4aab3c30c5119eeb2a',27,''),(48,1,'files/Photos/Readme.md','2a4ac36bb841d25d06d164f291ee97db',40,'Readme.md',6,5,150,1714125889,1714125889,0,0,'2c6ab01bee71f5ca5b7390ce537266d4',27,''),(49,1,'files/Photos/Gorilla.jpg','6d5f5956d8ff76a5f290cebb56402789',40,'Gorilla.jpg',17,8,474653,1714125889,1714125889,0,0,'47e515e0e8d91ede2cfc4d0b0dfe26d8',27,''),(50,2,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,0,1714125993,1714125993,0,0,'662b7ca999f7b',23,''),(51,2,'appdata_ocks80ys70ng','e8e742a32c1e66f6e66f3e4d1a4622a9',50,'appdata_ocks80ys70ng',2,1,0,1714218613,1714218613,0,0,'662b7c6093e2a',31,''),(52,2,'appdata_ocks80ys70ng/js','6b038c963e21a74617215d1324dc60b1',51,'js',2,1,0,1714125920,1714125920,0,0,'662b7c6096d21',31,''),(53,2,'appdata_ocks80ys70ng/js/core','45ffb5d8a4b8393089b0f570276df3d6',52,'core',2,1,0,1714125920,1714125920,0,0,'662b7c60987bd',31,''),(54,2,'appdata_ocks80ys70ng/js/core/merged-template-prepend.js','822e5d66912f2fe658c1b8418e2a0035',53,'merged-template-prepend.js',18,3,12288,1714125920,1714125920,0,0,'90002a56a9371198f8c8c1bf061396b0',27,''),(55,2,'appdata_ocks80ys70ng/js/core/merged-template-prepend.js.deps','db7e71b5f92bf85e3726ecef0993d08c',53,'merged-template-prepend.js.deps',14,3,290,1714125920,1714125920,0,0,'8c876c0569cbb185f8028def10682399',27,''),(56,2,'appdata_ocks80ys70ng/js/core/merged-template-prepend.js.gzip','10b0689b68c2b43acf4e6dad25792f0a',53,'merged-template-prepend.js.gzip',19,3,3130,1714125920,1714125920,0,0,'75c37aa21f2e91b794e8555d7ee237db',27,''),(57,2,'appdata_ocks80ys70ng/theming','1f27ed45110c7c913941c51750aa72db',51,'theming',2,1,0,1714125920,1714125920,0,0,'662b7c60abb7c',31,''),(58,2,'appdata_ocks80ys70ng/theming/global','8f1b66a6575361d0f15dbaf22c573939',57,'global',2,1,0,1714126040,1714126040,0,0,'662b7c60ae6f6',31,''),(59,2,'appdata_ocks80ys70ng/preview','817790483fe2f514e65d4547317eda31',51,'preview',2,1,0,1714125922,1714125922,0,0,'662b7c62593ab',31,''),(60,2,'appdata_ocks80ys70ng/preview/f','8ce9c77e9e2f1801b7d10f59df377fdc',59,'f',2,1,-1,1714125922,1714125922,0,0,'662b7c6266a6f',31,''),(61,2,'appdata_ocks80ys70ng/preview/3','568b2dbd9ddc5888db1b4cca72ccc2d9',59,'3',2,1,-1,1714125922,1714125922,0,0,'662b7c6266c11',31,''),(62,2,'appdata_ocks80ys70ng/preview/a','518698cf32c759b371a4d6307097d597',59,'a',2,1,-1,1714125922,1714125922,0,0,'662b7c6267d1e',31,''),(63,2,'appdata_ocks80ys70ng/preview/f/7','85987fa0fc63dc39bd7b905f1d6e8efd',60,'7',2,1,-1,1714125922,1714125922,0,0,'662b7c6265024',31,''),(64,2,'appdata_ocks80ys70ng/preview/3/4','6cc24035fce92770d7bff4eb89b99f55',61,'4',2,1,-1,1714125922,1714125922,0,0,'662b7c6265314',31,''),(65,2,'appdata_ocks80ys70ng/preview/f/7/1','aa5ca10bfdb11c258703daae8d6e9781',63,'1',2,1,-1,1714125922,1714125922,0,0,'662b7c6263da0',31,''),(66,2,'appdata_ocks80ys70ng/preview/3/4/1','f42bb7fdaedd199042ff58ec715cbc92',64,'1',2,1,-1,1714125922,1714125922,0,0,'662b7c626309b',31,''),(67,2,'appdata_ocks80ys70ng/preview/1','024b4c920aca670920103a8b146464f4',59,'1',2,1,-1,1714125922,1714125922,0,0,'662b7c626909e',31,''),(68,2,'appdata_ocks80ys70ng/preview/a/5','26a068183a8ea5bc760d7e30b6089cab',62,'5',2,1,-1,1714125922,1714125922,0,0,'662b7c6266697',31,''),(69,2,'appdata_ocks80ys70ng/preview/f/7/1/7','44dffbc671a2318e31cea1e32886ef5a',65,'7',2,1,-1,1714125922,1714125922,0,0,'662b7c6262624',31,''),(70,2,'appdata_ocks80ys70ng/preview/1/7','b706d02596f12e3d663d450908e12373',67,'7',2,1,-1,1714125922,1714125922,0,0,'662b7c626767e',31,''),(71,2,'appdata_ocks80ys70ng/preview/3/4/1/6','6a4f7f1df2267c240629e1dad84b74aa',66,'6',2,1,-1,1714125922,1714125922,0,0,'662b7c6261dfb',31,''),(72,2,'appdata_ocks80ys70ng/preview/a/5/7','5af35c40606c5a69bf7a4c14d8059eb6',68,'7',2,1,-1,1714125922,1714125922,0,0,'662b7c62652f2',31,''),(73,2,'appdata_ocks80ys70ng/preview/f/7/1/7/7','06e09daa0a6d98b69dbc8f1225c1e108',69,'7',2,1,-1,1714125922,1714125922,0,0,'662b7c6262067',31,''),(74,2,'appdata_ocks80ys70ng/preview/1/7/e','e91f5265141412ae0b33fb085ca11992',70,'e',2,1,-1,1714125922,1714125922,0,0,'662b7c62656eb',31,''),(75,2,'appdata_ocks80ys70ng/preview/3/4/1/6/a','02e0de53febd09ea1c1a0650a2b66075',71,'a',2,1,-1,1714125922,1714125922,0,0,'662b7c6261298',31,''),(76,2,'appdata_ocks80ys70ng/preview/a/5/7/7','eed8731d59186f09884137dc558abe8b',72,'7',2,1,-1,1714125922,1714125922,0,0,'662b7c6263c98',31,''),(77,2,'appdata_ocks80ys70ng/preview/f/7/1/7/7/1','ec94883727cea90efd4fbda9cc11f52f',73,'1',2,1,-1,1714125922,1714125922,0,0,'662b7c62613b8',31,''),(78,2,'appdata_ocks80ys70ng/preview/3/4/1/6/a/7','3c3b496bde9edd1c8d33452b9c6a5c83',75,'7',2,1,-1,1714125922,1714125922,0,0,'662b7c6260867',31,''),(79,2,'appdata_ocks80ys70ng/preview/1/7/e/6','8a5a1361e8de43e96c8389e25b9dec6f',74,'6',2,1,-1,1714125922,1714125922,0,0,'662b7c6264999',31,''),(80,2,'appdata_ocks80ys70ng/preview/f/7/1/7/7/1/6','f19a861150199a75b7c29a2178230147',77,'6',2,1,-1,1714125922,1714125922,0,0,'662b7c62608b9',31,''),(81,2,'appdata_ocks80ys70ng/preview/1/7/e/6/2','cbccf10282ad29ad9dced90a427493d3',79,'2',2,1,-1,1714125922,1714125922,0,0,'662b7c6262617',31,''),(82,2,'appdata_ocks80ys70ng/preview/a/5/7/7/1','15f1142353b72ceb4f45793ba19785a1',76,'1',2,1,-1,1714125922,1714125922,0,0,'662b7c6262b5e',31,''),(83,2,'appdata_ocks80ys70ng/preview/3/4/1/6/a/7/5','ee8c7565aab6bbd7044d194700739685',78,'5',2,1,-1,1714125922,1714125922,0,0,'662b7c625f3a6',31,''),(84,2,'appdata_ocks80ys70ng/preview/1/7/e/6/2/1','f2a75064b51956f5cc74dfbfd10958e3',81,'1',2,1,-1,1714125922,1714125922,0,0,'662b7c6261423',31,''),(85,2,'appdata_ocks80ys70ng/preview/f/7/1/7/7/1/6/44','41f78da9bec4e813b1b9d11dc43b6c22',80,'44',2,1,0,1714125922,1714125922,0,0,'662b7c625f8fb',31,''),(86,2,'appdata_ocks80ys70ng/preview/a/5/7/7/1/b','1787079d31908170c4358b8d35bd9174',82,'b',2,1,-1,1714125922,1714125922,0,0,'662b7c6261dfb',31,''),(87,2,'appdata_ocks80ys70ng/preview/3/4/1/6/a/7/5/41','a94fb192cd76e9b7c71bd4154d71a270',83,'41',2,1,0,1714125922,1714125922,0,0,'662b7c625e1cb',31,''),(88,2,'appdata_ocks80ys70ng/preview/1/7/e/6/2/1/6','ebf49becb571ff2ed583fcc65adc1233',84,'6',2,1,-1,1714125922,1714125922,0,0,'662b7c6260c62',31,''),(89,2,'appdata_ocks80ys70ng/preview/a/5/7/7/1/b/c','40077b6117e755995d9ce25e4c3c1cd1',86,'c',2,1,-1,1714125922,1714125922,0,0,'662b7c62615a5',31,''),(90,2,'appdata_ocks80ys70ng/preview/1/7/e/6/2/1/6/43','8042c3f252ea2ecb4512f3c4134e0188',88,'43',2,1,0,1714125923,1714125923,0,0,'662b7c625f9e1',31,''),(91,2,'appdata_ocks80ys70ng/preview/a/5/7/7/1/b/c/38','fa3fec8245054720cc19f71ef38ff4ac',89,'38',2,1,0,1714218540,1714218540,0,0,'662b7c6260dd2',31,''),(92,2,'appdata_ocks80ys70ng/preview/f/7/1/7/7/1/6/44/1600-1067-max.jpg','495dd27374e480b0f034634b4960d5f0',85,'1600-1067-max.jpg',17,8,165982,1714125922,1714125922,0,0,'966c116e7cb2353a1ca806a21ca8ea48',27,''),(93,2,'appdata_ocks80ys70ng/preview/3/4/1/6/a/7/5/41/1600-1067-max.jpg','77c9c5a4e6acce1d0b10bf89326884f9',87,'1600-1067-max.jpg',17,8,147631,1714125922,1714125922,0,0,'d69491d1b1d51d410d969586d83ebf0d',27,''),(94,2,'appdata_ocks80ys70ng/preview/f/7/1/7/7/1/6/44/256-256-crop.jpg','fbe84bb57765c0f51df473893da8ca97',85,'256-256-crop.jpg',17,8,13155,1714125922,1714125922,0,0,'bc007254d7e50a616ea81a5ba8783fa5',27,''),(95,2,'appdata_ocks80ys70ng/preview/a/5/7/7/1/b/c/38/4096-4096-max.png','52c5fbb210e4e3d8a033cc61ffaa78f1',91,'4096-4096-max.png',9,8,47771,1714125922,1714125922,0,0,'ebc9396107a980bd654806ca3ef4ca9e',27,''),(96,2,'appdata_ocks80ys70ng/preview/a/1','69202bdc224fe6c06c7252b9e61e314a',62,'1',2,1,-1,1714125922,1714125922,0,0,'662b7c62bd95b',31,''),(97,2,'appdata_ocks80ys70ng/preview/a/1/d','d8c563664bf407bb2e8980a99ba7f563',96,'d',2,1,-1,1714125922,1714125922,0,0,'662b7c62bd08a',31,''),(98,2,'appdata_ocks80ys70ng/preview/a/1/d/0','9faa3e0f3a973c029faa57440de07608',97,'0',2,1,-1,1714125922,1714125922,0,0,'662b7c62bc24e',31,''),(99,2,'appdata_ocks80ys70ng/preview/a/1/d/0/c','b66b0b514be0103c8a412a088989e9a1',98,'c',2,1,-1,1714125922,1714125922,0,0,'662b7c62bb2f1',31,''),(100,2,'appdata_ocks80ys70ng/preview/a/1/d/0/c/6','41a4eb86c136e44ce852c4ceb712b59a',99,'6',2,1,-1,1714125922,1714125922,0,0,'662b7c62b9d6a',31,''),(101,2,'appdata_ocks80ys70ng/preview/a/1/d/0/c/6/e','8530ad38553dd2b3fdba1d86b30998d5',100,'e',2,1,-1,1714125922,1714125922,0,0,'662b7c62b90e3',31,''),(102,2,'appdata_ocks80ys70ng/preview/a/1/d/0/c/6/e/42','85e67fd8038225b4093febdeb701acb7',101,'42',2,1,0,1714125923,1714125923,0,0,'662b7c62b74e3',31,''),(103,2,'appdata_ocks80ys70ng/preview/3/4/1/6/a/7/5/41/256-256-crop.jpg','be8f7ec8c95b2893ebd052e9ad3231f1',87,'256-256-crop.jpg',17,8,8559,1714125922,1714125922,0,0,'bfd13ef1331574e9e21cdbac5c24506b',27,''),(104,2,'appdata_ocks80ys70ng/preview/1/7/e/6/2/1/6/43/1600-1066-max.jpg','8b8d61c56d16f5746266953c4565064e',90,'1600-1066-max.jpg',17,8,351167,1714125922,1714125922,0,0,'fc8a951701ef7ee135bcefd0402707e6',27,''),(105,2,'appdata_ocks80ys70ng/preview/1/7/e/6/2/1/6/43/256-256-crop.jpg','147a77610ec6d87d2e9dab47d9120066',90,'256-256-crop.jpg',17,8,18049,1714125923,1714125923,0,0,'4267273c888ee8fd518e9fffa6b0b563',27,''),(106,2,'appdata_ocks80ys70ng/preview/a/5/7/7/1/b/c/38/256-256-crop.png','1f8988950da814789c6df88aca8bc895',91,'256-256-crop.png',9,8,9089,1714125923,1714125923,0,0,'0fd387c655ec4eaaa378b53c18ddb23b',27,''),(107,2,'appdata_ocks80ys70ng/preview/a/1/d/0/c/6/e/42/3000-2000-max.jpg','6ba22081ecc114857b2680ebdf539028',102,'3000-2000-max.jpg',17,8,808212,1714125923,1714125923,0,0,'ec4c4978dbc6cf46aa813d0d234b5b04',27,''),(108,2,'appdata_ocks80ys70ng/preview/a/1/d/0/c/6/e/42/256-256-crop.jpg','cc2cba03ab1b486632df01a71547d79c',102,'256-256-crop.jpg',17,8,21338,1714125923,1714125923,0,0,'bd1b7d5b8f44949e5dc108ac69b232f0',27,''),(109,2,'appdata_ocks80ys70ng/avatar','3f18e788f2245850de8669a2d4d10b05',51,'avatar',2,1,0,1714125998,1714125998,0,0,'662b7c685ade2',31,''),(110,2,'appdata_ocks80ys70ng/avatar/next','2844abfb3dd841e9ff4e883c76c3866e',109,'next',2,1,0,1714218563,1714218563,0,0,'662b7c685e11e',31,''),(111,2,'appdata_ocks80ys70ng/avatar/next/avatar-dark.png','4d44f9e85e78045449cab56d1693a0c7',110,'avatar-dark.png',9,8,13686,1714220226,1714220226,0,0,'93a8315367db69fb00b45950cc805a42',27,''),(112,2,'appdata_ocks80ys70ng/avatar/next/generated','b2052d1c385e16b85ab5e25a0c6f159d',110,'generated',14,3,0,1714220226,1714220226,0,0,'dc85fc07625cd8761a773a3656d5674c',27,''),(113,2,'appdata_ocks80ys70ng/avatar/next/avatar-dark.64.png','74c9d949911e40fe7eff5eb69d1a0040',110,'avatar-dark.64.png',9,8,704,1714125928,1714125928,0,0,'5dfcb95127cd9f4c252e94e19824f62c',27,''),(114,2,'appdata_ocks80ys70ng/avatar/Brent','b3873503435baeff0bb4f0001d154a6a',109,'Brent',2,1,0,1714125999,1714125999,0,0,'662b7caed4231',31,''),(115,2,'appdata_ocks80ys70ng/avatar/Brent/avatar.png','943ff724168419d0cd4de6607ad5749b',114,'avatar.png',9,8,13880,1714125998,1714125998,0,0,'9d857c600a93069804e6caa34920a31e',27,''),(116,2,'appdata_ocks80ys70ng/avatar/Brent/generated','45c65b95167fd20f54ecb163cc7fc6ec',114,'generated',14,3,0,1714125998,1714125998,0,0,'803869ba8d65ce6d6dd39bc0e9febeae',27,''),(117,2,'appdata_ocks80ys70ng/avatar/Brent/avatar.512.png','75ff7f1554d622b7731b79c9d9671b4e',114,'avatar.512.png',9,8,6206,1714125998,1714125998,0,0,'5b47599e6c568f8fb5a3923dadbb0798',27,''),(118,3,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,38784812,1714126026,1714126023,0,0,'662b7cca9a3c1',23,''),(119,2,'appdata_ocks80ys70ng/avatar/Brent/avatar-dark.64.png','f2754bb406cb532a0927a9ad0799cf71',114,'avatar-dark.64.png',9,8,799,1714125999,1714125999,0,0,'da58709b278228e1e17f1d84d422606e',27,''),(120,3,'cache','0fea6a13c52b4d4725368f24b045ca84',118,'cache',2,1,0,1714126023,1714126023,0,0,'662b7cc7ba3e2',31,''),(121,3,'files','45b963397aa40d4a0063e0d85e4fe7a1',118,'files',2,1,38784812,1714126026,1714126025,0,0,'662b7cca9a3c1',31,''),(122,3,'files/Documents','0ad78ba05b6961d92f7970b2b3922eca',121,'Documents',2,1,1108865,1714126024,1714126024,0,0,'662b7cc80b73f',31,''),(123,3,'files/Documents/Nextcloud flyer.pdf','9c5b4dc7182a7435767708ac3e8d126c',122,'Nextcloud flyer.pdf',4,3,1083339,1714126023,1714126023,0,0,'ca5180abedf9a81d62d550ffe536fa42',27,''),(124,3,'files/Documents/Example.md','efe0853470dd0663db34818b444328dd',122,'Example.md',6,5,1095,1714126023,1714126023,0,0,'29745726bdd52bcf07eb4a490d217458',27,''),(125,3,'files/Documents/Welcome to Nextcloud Hub.docx','b44cb84f22ceddc4ca2826e026038091',122,'Welcome to Nextcloud Hub.docx',7,3,24295,1714126023,1714126023,0,0,'e01ac55f0dacf99afa3a60ee15bd535c',27,''),(126,3,'files/Documents/Readme.md','51ec9e44357d147dd5c212b850f6910f',122,'Readme.md',6,5,136,1714126024,1714126024,0,0,'96d31e80efc28ec356da0e491f75b20e',27,''),(127,3,'files/Nextcloud Manual.pdf','2bc58a43566a8edde804a4a97a9c7469',121,'Nextcloud Manual.pdf',4,3,16305464,1714126024,1714126024,0,0,'0e59484a9e69d5aef2a6d0f519e58eee',27,''),(128,3,'files/Nextcloud.png','2bcc0ff06465ef1bfc4a868efde1e485',121,'Nextcloud.png',9,8,50598,1714126024,1714126024,0,0,'8ad4cbb36603d83dd3a45e4e73dd5277',27,''),(129,3,'files/Templates','530b342d0b8164ff3b4754c2273a453e',121,'Templates',2,1,10721152,1714126025,1714126025,0,0,'662b7cc9a700d',31,''),(130,3,'files/Templates/Org chart.odg','fd846bc062b158abb99a75a5b33b53e7',129,'Org chart.odg',10,3,13878,1714126024,1714126024,0,0,'ad9940eabf8f1d20092d53d8044bb29e',27,''),(131,3,'files/Templates/Party invitation.odt','439f95f734be87868374b1a5a312c550',129,'Party invitation.odt',11,3,868111,1714126024,1714126024,0,0,'24e57ea0ed0131023119fa4b0697ba7c',27,''),(132,3,'files/Templates/Product plan.md','a9fbf58bf31cebb8143f7ad3a5205633',129,'Product plan.md',6,5,573,1714126024,1714126024,0,0,'82ee46fd3e4b1a0b02f2d41ee771e6ca',27,''),(133,3,'files/Templates/Mother\'s day.odt','cb66c617dbb4acc9b534ec095c400b53',129,'Mother\'s day.odt',11,3,340061,1714126024,1714126024,0,0,'8c9918c34e009920eddca09ee5cd4ec7',27,''),(134,3,'files/Templates/Letter.odt','15545ade0e9863c98f3a5cc0fbf2836a',129,'Letter.odt',11,3,15961,1714126024,1714126024,0,0,'726491e5c62afdd7c15aba1e398bc23f',27,''),(135,3,'files/Templates/Timesheet.ods','cb79c81e41d3c3c77cd31576dc7f1a3a',129,'Timesheet.ods',12,3,88394,1714126024,1714126024,0,0,'e5a0c6725b29ba84c4cc9ab02d04ee8e',27,''),(136,3,'files/Templates/Meeting notes.md','c0279758bb570afdcdbc2471b2f16285',129,'Meeting notes.md',6,5,326,1714126024,1714126024,0,0,'420899a96c2bb022d11a0e7e04b9d046',27,''),(137,3,'files/Templates/Photo book.odt','ea35993988e2799424fef3ff4f420c24',129,'Photo book.odt',11,3,5155877,1714126024,1714126024,0,0,'456a3dc4622726b78ec810f427f7e824',27,''),(138,3,'files/Templates/Mindmap.odg','74cff798fc1b9634ee45380599b2a6da',129,'Mindmap.odg',10,3,13653,1714126024,1714126024,0,0,'8d0b353a65bdc74d054a52edade2e0ed',27,''),(139,3,'files/Templates/Elegant.odp','f3ec70ed694c0ca215f094b98eb046a7',129,'Elegant.odp',13,3,14316,1714126024,1714126024,0,0,'c8358c56d847ce55f555ba464a2b3609',27,''),(140,3,'files/Templates/Resume.odt','ace8f81202eadb2f0c15ba6ecc2539f5',129,'Resume.odt',11,3,39404,1714126024,1714126024,0,0,'d1bdc7cc1c52230b54e12c506bd43d9b',27,''),(141,3,'files/Templates/SWOT analysis.whiteboard','3fd0e44b3e6f0e7144442ef6fc71a663',129,'SWOT analysis.whiteboard',14,3,38605,1714126024,1714126024,0,0,'f9e87049e99a8e8e4d4a63444e70c85f',27,''),(142,3,'files/Templates/Expense report.ods','d0a4025621279b95d2f94ff4ec09eab3',129,'Expense report.ods',12,3,13441,1714126024,1714126024,0,0,'a833b49fcd9dff6e4ee5a94972eef0fd',27,''),(143,3,'files/Templates/Modern company.odp','96ad2c06ebb6a79bcdf2f4030421dee3',129,'Modern company.odp',13,3,317015,1714126025,1714126025,0,0,'063191bdf32f99c5c89b038309af0542',27,''),(144,3,'files/Templates/Simple.odp','a2c90ff606d31419d699b0b437969c61',129,'Simple.odp',13,3,14810,1714126025,1714126025,0,0,'ed28163cab6d2a677c6355546a25059f',27,''),(145,3,'files/Templates/Business model canvas.ods','86c10a47dedf156bf4431cb75e0f76ec',129,'Business model canvas.ods',12,3,52843,1714126025,1714126025,0,0,'6946aa520945c6e5b1a34a54fe479b64',27,''),(146,3,'files/Templates/Invoice.odt','40fdccb51b6c3e3cf20532e06ed5016e',129,'Invoice.odt',11,3,17276,1714126025,1714126025,0,0,'7d60e0b79429784e4b041e5abbc5ae44',27,''),(147,3,'files/Templates/Flowchart.odg','832942849155883ceddc6f3cede21867',129,'Flowchart.odg',10,3,11836,1714126025,1714126025,0,0,'bc5284c149e7bb3810961b9521750372',27,''),(148,3,'files/Templates/Syllabus.odt','03b3147e6dae00674c1d50fe22bb8496',129,'Syllabus.odt',11,3,30354,1714126025,1714126025,0,0,'537eba2ff19b062f87123bc3d08e0c1d',27,''),(149,3,'files/Templates/Gotong royong.odp','14b958f5aafb7cfd703090226f3cbd1b',129,'Gotong royong.odp',13,3,3509628,1714126025,1714126025,0,0,'ded66cc931b6ab68bc3dbf3aa11a02a9',27,''),(150,3,'files/Templates/Business model canvas.odg','6a8f3e02bdf45c8b0671967969393bcb',129,'Business model canvas.odg',10,3,16988,1714126025,1714126025,0,0,'e4ae7d4b6ba18a1f4df9d5f50ec5ffb6',27,''),(151,3,'files/Templates/Impact effort matrix.whiteboard','c5e3b589ec8f9dd6afdebe0ac6feeac8',129,'Impact effort matrix.whiteboard',14,3,52674,1714126025,1714126025,0,0,'7e46f150ef6e6286543024f26c1279c9',27,''),(152,3,'files/Templates/Yellow idea.odp','3a57051288d7b81bef3196a2123f4af5',129,'Yellow idea.odp',13,3,81196,1714126025,1714126025,0,0,'c73c6b7f02ab065581ebf31a7954ae73',27,''),(153,3,'files/Templates/Diagram & table.ods','0a89f154655f6d4a0098bc4e6ca87367',129,'Diagram & table.ods',12,3,13378,1714126025,1714126025,0,0,'286348721cbda2014a0d3579c610b7d7',27,''),(154,3,'files/Templates/Readme.md','71fa2e74ab30f39eed525572ccc3bbec',129,'Readme.md',6,5,554,1714126025,1714126025,0,0,'01fcadfe4fb5136fb4d34e9c53d24817',27,''),(155,3,'files/Templates credits.md','f7c01e3e0b55bb895e09dc08d19375b3',121,'Templates credits.md',6,5,2403,1714126025,1714126025,0,0,'975555bbe353bdeb1f02845dff27a9ab',27,''),(156,3,'files/Reasons to use Nextcloud.pdf','418b19142a61c5bef296ea56ee144ca3',121,'Reasons to use Nextcloud.pdf',4,3,976625,1714126025,1714126025,0,0,'7e5ab3de8d82a4d9a309423f875337eb',27,''),(157,3,'files/Readme.md','49af83716f8dcbfa89aaf835241c0b9f',121,'Readme.md',6,5,206,1714126025,1714126025,0,0,'7250276794922f1f05f6ec5c26ca5c91',27,''),(158,3,'files/Nextcloud intro.mp4','e4919345bcc87d4585a5525daaad99c0',121,'Nextcloud intro.mp4',16,15,3963036,1714126025,1714126025,0,0,'a082c76ae85411065d2caa3d79ba98e5',27,''),(159,3,'files/Photos','d01bb67e7b71dd49fd06bad922f521c9',121,'Photos',2,1,5656463,1714126026,1714126026,0,0,'662b7cca9a3c1',31,''),(160,3,'files/Photos/Frog.jpg','d6219add1a9129ed0c1513af985e2081',159,'Frog.jpg',17,8,457744,1714126026,1714126026,0,0,'96744b4b7b5dc6cff8a1197b52c18ad1',27,''),(161,3,'files/Photos/Nextcloud community.jpg','b9b3caef83a2a1c20354b98df6bcd9d0',159,'Nextcloud community.jpg',17,8,797325,1714126026,1714126026,0,0,'7db4d7d0cde99c51a016e202db7bda1a',27,''),(162,3,'files/Photos/Library.jpg','0b785d02a19fc00979f82f6b54a05805',159,'Library.jpg',17,8,2170375,1714126026,1714126026,0,0,'739c424da63bbb0024ec942336756e7f',27,''),(163,3,'files/Photos/Birdie.jpg','cd31c7af3a0ec6e15782b5edd2774549',159,'Birdie.jpg',17,8,593508,1714126026,1714126026,0,0,'a4406aca279025d308f550165da2dde8',27,''),(164,3,'files/Photos/Toucan.jpg','681d1e78f46a233e12ecfa722cbc2aef',159,'Toucan.jpg',17,8,167989,1714126026,1714126026,0,0,'54b07a32cfa562c9a72712479492ceea',27,''),(165,3,'files/Photos/Vineyard.jpg','14e5f2670b0817614acd52269d971db8',159,'Vineyard.jpg',17,8,427030,1714126026,1714126026,0,0,'ddafe34bd1ada89d2c841e260436bf9c',27,''),(166,3,'files/Photos/Steps.jpg','7b2ca8d05bbad97e00cbf5833d43e912',159,'Steps.jpg',17,8,567689,1714126026,1714126026,0,0,'148810b2ce29b3084c55f5eaef988219',27,''),(167,3,'files/Photos/Readme.md','2a4ac36bb841d25d06d164f291ee97db',159,'Readme.md',6,5,150,1714126026,1714126026,0,0,'c91e558eed8158e8f2c35adf1525b315',27,''),(168,3,'files/Photos/Gorilla.jpg','6d5f5956d8ff76a5f290cebb56402789',159,'Gorilla.jpg',17,8,474653,1714126026,1714126026,0,0,'cb0fe229b627874ca0ee90c55a01a484',27,''),(169,2,'appdata_ocks80ys70ng/preview/0','20b6f0785a4d3f7ba2cef55cd97f4ef1',59,'0',2,1,-1,1714126028,1714126028,0,0,'662b7ccc39616',31,''),(170,2,'appdata_ocks80ys70ng/preview/0/7','ae13146a15699a1155fd98ea6d3d2ab4',169,'7',2,1,-1,1714126028,1714126028,0,0,'662b7ccc38aa2',31,''),(171,2,'appdata_ocks80ys70ng/preview/8','3a28a68219a25ff2317c2b61ce67a7f1',59,'8',2,1,-1,1714218455,1714218455,0,0,'662cea9add2d0',31,''),(172,2,'appdata_ocks80ys70ng/preview/0/7/7','0fb1c8b932096b9f97f79970de032d89',170,'7',2,1,-1,1714126028,1714126028,0,0,'662b7ccc37e51',31,''),(173,2,'appdata_ocks80ys70ng/preview/b','9cb45dbcc4c23c00615e4b5f16255177',59,'b',2,1,-1,1714126028,1714126028,0,0,'662b7ccc3d2f2',31,''),(174,2,'appdata_ocks80ys70ng/preview/0/7/7/7','94e0239a60b55157a965d4343d6dd672',172,'7',2,1,-1,1714126028,1714126028,0,0,'662b7ccc36329',31,''),(175,2,'appdata_ocks80ys70ng/preview/8/2','b0c5b606fe2279cb5aef7bcae6401424',171,'2',2,1,-1,1714218455,1714218455,0,0,'662cea9adbf6b',31,''),(176,2,'appdata_ocks80ys70ng/preview/b/7','1a22f61b94b3f322c0bc9f2a4ad2f3b5',173,'7',2,1,-1,1714126028,1714126028,0,0,'662b7ccc3bc2e',31,''),(177,2,'appdata_ocks80ys70ng/preview/0/7/7/7/d','e7d0a00ce4c56c031653d7591a264900',174,'d',2,1,-1,1714126028,1714126028,0,0,'662b7ccc34a8b',31,''),(178,2,'appdata_ocks80ys70ng/preview/8/2/a','43a2ee84661ce1d8f67b30dd69b1da81',175,'a',2,1,-1,1714126028,1714126028,0,0,'662b7ccc39c0d',31,''),(179,2,'appdata_ocks80ys70ng/preview/b/7/3','6bfdc4275e4ed1240857d9bb163fa265',176,'3',2,1,-1,1714126028,1714126028,0,0,'662b7ccc3a733',31,''),(180,2,'appdata_ocks80ys70ng/preview/0/7/7/7/d/5','ee01f79e482c6660ec417799e23999db',177,'5',2,1,-1,1714126028,1714126028,0,0,'662b7ccc33d3c',31,''),(181,2,'appdata_ocks80ys70ng/preview/f/a','526f09594cc96823cbe1eed24e4e9270',60,'a',2,1,-1,1714126028,1714126028,0,0,'662b7ccc402ab',31,''),(182,2,'appdata_ocks80ys70ng/preview/8/2/a/a','13196e43f36cd3a7b80bbe6575efbd95',178,'a',2,1,-1,1714126028,1714126028,0,0,'662b7ccc38ea4',31,''),(183,2,'appdata_ocks80ys70ng/preview/0/7/7/7/d/5/c','dabbf3a5105ea5508fdfe1f5426e17d1',180,'c',2,1,-1,1714126028,1714126028,0,0,'662b7ccc33312',31,''),(184,2,'appdata_ocks80ys70ng/preview/b/7/3/c','ef5aca39a68c8205de6ad089040a7269',179,'c',2,1,-1,1714126028,1714126028,0,0,'662b7ccc39a9a',31,''),(185,2,'appdata_ocks80ys70ng/preview/b/7/3/c/e','bb753a91ef74a55a8fa6908bb28d9417',184,'e',2,1,-1,1714126028,1714126028,0,0,'662b7ccc38f89',31,''),(186,2,'appdata_ocks80ys70ng/preview/0/7/7/7/d/5/c/163','b6dbe88dbc8aea0f79b9f2066c8d60b9',183,'163',2,1,0,1714126028,1714126028,0,0,'662b7ccc32321',31,''),(187,2,'appdata_ocks80ys70ng/preview/f/a/7','d6e4e708acfc431ddbc68e0f417377f3',181,'7',2,1,-1,1714126028,1714126028,0,0,'662b7ccc3e2e3',31,''),(188,2,'appdata_ocks80ys70ng/preview/8/2/a/a/4','b7f94a3c8088eaaa533d5e9ced5cb057',182,'4',2,1,-1,1714126028,1714126028,0,0,'662b7ccc37b8c',31,''),(189,2,'appdata_ocks80ys70ng/preview/b/7/3/c/e/3','48151d2b6506bf504a089dcb93ddbcef',185,'3',2,1,-1,1714126028,1714126028,0,0,'662b7ccc383e1',31,''),(190,2,'appdata_ocks80ys70ng/preview/f/a/7/c','4c853e8b6af7d2f351e75e7498065d80',187,'c',2,1,-1,1714126028,1714126028,0,0,'662b7ccc3cc16',31,''),(191,2,'appdata_ocks80ys70ng/preview/8/2/a/a/4/b','5d04baa93621659b9e217ac1fe341841',188,'b',2,1,-1,1714126028,1714126028,0,0,'662b7ccc360cb',31,''),(192,2,'appdata_ocks80ys70ng/preview/b/7/3/c/e/3/9','f272f89093a0dae44f8c2fbed01ea796',189,'9',2,1,-1,1714126028,1714126028,0,0,'662b7ccc36535',31,''),(193,2,'appdata_ocks80ys70ng/preview/f/a/7/c/d','83e490d6d8f1d7be8620012a00075e6f',190,'d',2,1,-1,1714126028,1714126028,0,0,'662b7ccc3aea1',31,''),(194,2,'appdata_ocks80ys70ng/preview/b/7/3/c/e/3/9/160','6e86477162bf28081b4e2add4b67e049',192,'160',2,1,0,1714126028,1714126028,0,0,'662b7ccc34ece',31,''),(195,2,'appdata_ocks80ys70ng/preview/8/2/a/a/4/b/0','7ffa184161ceed7a4aebd16e59c992fb',191,'0',2,1,-1,1714126028,1714126028,0,0,'662b7ccc34178',31,''),(196,2,'appdata_ocks80ys70ng/preview/f/a/7/c/d/f','b57e6a2edfd07e39304bd0c823f682dc',193,'f',2,1,-1,1714126028,1714126028,0,0,'662b7ccc39cac',31,''),(197,2,'appdata_ocks80ys70ng/preview/8/2/a/a/4/b/0/162','29ee042c082f0216a49e9241943b0ef5',195,'162',2,1,0,1714126028,1714126028,0,0,'662b7ccc337a2',31,''),(198,2,'appdata_ocks80ys70ng/preview/f/a/7/c/d/f/a','b7816ff8928149a5b8edca9a038bc42b',196,'a',2,1,-1,1714126028,1714126028,0,0,'662b7ccc39080',31,''),(199,2,'appdata_ocks80ys70ng/preview/f/a/7/c/d/f/a/164','1b76e5c5048cad7357609a919b6dd156',198,'164',2,1,0,1714126028,1714126028,0,0,'662b7ccc37746',31,''),(200,2,'appdata_ocks80ys70ng/preview/0/7/7/7/d/5/c/163/1600-1067-max.jpg','f630a9ca298e1852df15bdbfab9cc03c',186,'1600-1067-max.jpg',17,8,165982,1714126028,1714126028,0,0,'3a7ec436f4be4f2077309e072d1b521a',27,''),(201,2,'appdata_ocks80ys70ng/preview/b/7/3/c/e/3/9/160/1600-1067-max.jpg','ceab7989bd26a57414f0672508634078',194,'1600-1067-max.jpg',17,8,147631,1714126028,1714126028,0,0,'21c2ea0a41d7244bd39f9a4fe4d60e95',27,''),(202,2,'appdata_ocks80ys70ng/preview/f/a/7/c/d/f/a/164/1600-1067-max.jpg','3c93be88f104d82e4ea7f80197514608',199,'1600-1067-max.jpg',17,8,137923,1714126028,1714126028,0,0,'8a66a8f31b12ed79f13c8ec5ca128e09',27,''),(203,2,'appdata_ocks80ys70ng/preview/0/7/7/7/d/5/c/163/256-256-crop.jpg','324d6e4535c9642d5a47127e839293a6',186,'256-256-crop.jpg',17,8,13155,1714126028,1714126028,0,0,'ec8c646bf5665ed3afe58b70b5680602',27,''),(204,2,'appdata_ocks80ys70ng/preview/b/d','0b982d95f1509303da14d69854d10bc2',173,'d',2,1,-1,1714126028,1714126028,0,0,'662b7ccc86f71',31,''),(205,2,'appdata_ocks80ys70ng/preview/b/d/4','15f28134972d08adbdc4fc3c51a8fe4c',204,'4',2,1,-1,1714126028,1714126028,0,0,'662b7ccc859a8',31,''),(206,2,'appdata_ocks80ys70ng/preview/b/d/4/c','4c8359d57bbc6281820c2009fd08f8e3',205,'c',2,1,-1,1714126028,1714126028,0,0,'662b7ccc84b99',31,''),(207,2,'appdata_ocks80ys70ng/preview/b/d/4/c/9','473b5382761dd6a3251a908e7f2dd73b',206,'9',2,1,-1,1714126028,1714126028,0,0,'662b7ccc83c9b',31,''),(208,2,'appdata_ocks80ys70ng/preview/b/d/4/c/9/a','6c4ef50c86437c9122164344a97b94d8',207,'a',2,1,-1,1714126028,1714126028,0,0,'662b7ccc82921',31,''),(209,2,'appdata_ocks80ys70ng/preview/b/d/4/c/9/a/b','0a77f9fc9a4bf76ae41c5aab45cc0cb6',208,'b',2,1,-1,1714126028,1714126028,0,0,'662b7ccc80d09',31,''),(210,2,'appdata_ocks80ys70ng/preview/b/d/4/c/9/a/b/161','3593b9c4e8101e3276ac0d1ca20d77ac',209,'161',2,1,0,1714126029,1714126029,0,0,'662b7ccc7eda7',31,''),(211,2,'appdata_ocks80ys70ng/preview/8/2/a/a/4/b/0/162/1600-1066-max.jpg','d877a09e934392fbbc9ac1e74c94341b',197,'1600-1066-max.jpg',17,8,351167,1714126028,1714126028,0,0,'efb51b03353224a8152df3b63ee85943',27,''),(212,2,'appdata_ocks80ys70ng/preview/f/a/7/c/d/f/a/164/256-256-crop.jpg','c5c9119feeb7abec50c45234f9d2238e',199,'256-256-crop.jpg',17,8,13780,1714126028,1714126028,0,0,'ccf343e271611570317fb03f23f3b423',27,''),(213,2,'appdata_ocks80ys70ng/preview/9','3f1e205ccbebcd3f8adfbc8b61f2243f',59,'9',2,1,-1,1714218540,1714218540,0,0,'662cea9adce8a',31,''),(214,2,'appdata_ocks80ys70ng/preview/9/7','7401b7cf6d38888d82a369a9bc3c4842',213,'7',2,1,-1,1714218455,1714218455,0,0,'662cea9ad950f',31,''),(215,2,'appdata_ocks80ys70ng/preview/b/7/3/c/e/3/9/160/256-256-crop.jpg','3e7f5e8595f49a9c9b1e95c09086e6d5',194,'256-256-crop.jpg',17,8,8559,1714126028,1714126028,0,0,'ba5904854d635e599c329f12b8b942d5',27,''),(216,2,'appdata_ocks80ys70ng/preview/9/7/6','59efeec10b168d9d4f639c36011ea3e4',214,'6',2,1,-1,1714126028,1714126028,0,0,'662b7ccca45b1',31,''),(217,2,'appdata_ocks80ys70ng/preview/9/7/6/6','a539a1aff1a5c6c8f43e30df27d736b9',216,'6',2,1,-1,1714126028,1714126028,0,0,'662b7ccca41fe',31,''),(218,2,'appdata_ocks80ys70ng/preview/9/7/6/6/5','ed0f1660426d64723e91c899abb339b9',217,'5',2,1,-1,1714126028,1714126028,0,0,'662b7ccca3deb',31,''),(219,2,'appdata_ocks80ys70ng/preview/8/2/a/a/4/b/0/162/256-256-crop.jpg','4a66ff402da0f0b9e700b8a515190729',197,'256-256-crop.jpg',17,8,18049,1714126028,1714126028,0,0,'bbd02e21a0b4de432196730690a2b760',27,''),(220,2,'appdata_ocks80ys70ng/preview/9/7/6/6/5/2','e2838482816cc623fcb6ee67f96aca73',218,'2',2,1,-1,1714126028,1714126028,0,0,'662b7ccca3533',31,''),(221,2,'appdata_ocks80ys70ng/preview/9/7/6/6/5/2/7','710953b8fbe49c9324fb0d4ea91af252',220,'7',2,1,-1,1714126028,1714126028,0,0,'662b7ccca26cb',31,''),(222,2,'appdata_ocks80ys70ng/preview/9/7/6/6/5/2/7/165','bf75272df31cccab63fc94c5b17e6b7c',221,'165',2,1,0,1714126029,1714126029,0,0,'662b7ccca1ded',31,''),(223,2,'appdata_ocks80ys70ng/preview/7','e58d748917665ff97ac4844c9838c093',59,'7',2,1,-1,1714126028,1714126028,0,0,'662b7cccb8e80',31,''),(224,2,'appdata_ocks80ys70ng/preview/7/e','fd68e549cf6cbcc74a31771467d537ed',223,'e',2,1,-1,1714126028,1714126028,0,0,'662b7cccb74ca',31,''),(225,2,'appdata_ocks80ys70ng/preview/7/e/7','5d7bf1911e4cc6b723cec561c912049a',224,'7',2,1,-1,1714126028,1714126028,0,0,'662b7cccb63b7',31,''),(226,2,'appdata_ocks80ys70ng/preview/7/e/7/7','3238679453f5e4c85ded9151a6f0e1ff',225,'7',2,1,-1,1714126028,1714126028,0,0,'662b7cccb5165',31,''),(227,2,'appdata_ocks80ys70ng/preview/7/e/7/7/5','f903bf24322ce7ce7b9f7e2257f8d909',226,'5',2,1,-1,1714126028,1714126028,0,0,'662b7cccb47a7',31,''),(228,2,'appdata_ocks80ys70ng/preview/7/e/7/7/5/7','d9428cbc0073facca6c3f68edd49908a',227,'7',2,1,-1,1714126028,1714126028,0,0,'662b7cccb3133',31,''),(229,2,'appdata_ocks80ys70ng/preview/7/e/7/7/5/7/b','104fb87c6090d5c6d2b190def050b7bd',228,'b',2,1,-1,1714126028,1714126028,0,0,'662b7cccb1331',31,''),(230,2,'appdata_ocks80ys70ng/preview/7/e/7/7/5/7/b/166','063562cfdf5198b5620b0a26b37561f3',229,'166',2,1,0,1714126029,1714126029,0,0,'662b7cccafba9',31,''),(231,2,'appdata_ocks80ys70ng/preview/9/7/6/6/5/2/7/165/1920-1281-max.jpg','c7fb327a1f0ceac197826d21242ecdc6',222,'1920-1281-max.jpg',17,8,294390,1714126028,1714126028,0,0,'c8ce394bfa2eb07d91a1a5b1de4e5143',27,''),(232,2,'appdata_ocks80ys70ng/preview/7/e/7/7/5/7/b/166/1200-1800-max.jpg','dbeb67480d4a923228049b79dac91d2b',230,'1200-1800-max.jpg',17,8,207095,1714126028,1714126028,0,0,'96ab11505cf97de0c7ca8d7a167bcf65',27,''),(233,2,'appdata_ocks80ys70ng/preview/b/d/4/c/9/a/b/161/3000-2000-max.jpg','54073ed881280af9bb71c0029a01e6cb',210,'3000-2000-max.jpg',17,8,808212,1714126028,1714126028,0,0,'93e04312d48c3479a2ec1f0e5c623cd5',27,''),(234,2,'appdata_ocks80ys70ng/preview/7/e/7/7/5/7/b/166/256-256-crop.jpg','5370809fc8c4ea0a5274fb6f0c311666',230,'256-256-crop.jpg',17,8,8560,1714126029,1714126029,0,0,'fe605a6ae4ab11eeb70ce1ef19a08e0d',27,''),(235,2,'appdata_ocks80ys70ng/preview/9/7/6/6/5/2/7/165/256-256-crop.jpg','35a27d8048dcd1b4ea98df8a039517e6',222,'256-256-crop.jpg',17,8,15764,1714126029,1714126029,0,0,'ebfb6c57f5d7004e3772ec107b44c322',27,''),(236,2,'appdata_ocks80ys70ng/preview/b/d/4/c/9/a/b/161/256-256-crop.jpg','1517a2df7a2a99744ae716aed7246557',210,'256-256-crop.jpg',17,8,21338,1714126029,1714126029,0,0,'764604668d4133cb5fbc13c44396d8b6',27,''),(237,1,'cache','0fea6a13c52b4d4725368f24b045ca84',1,'cache',2,1,0,1714126038,1714126038,0,0,'662b7cd6aea89',31,''),(238,2,'appdata_ocks80ys70ng/theming/global/0','b3615002056bc3dd27275e24aa10a637',58,'0',2,1,0,1714218550,1714218550,0,0,'662b7cd80aeee',31,''),(239,2,'appdata_ocks80ys70ng/theming/global/0/icon-core-#0082c9filetypes_video.svg','d03a9b415a94d638ff65985bc9723fbc',238,'icon-core-#0082c9filetypes_video.svg',20,8,277,1714126040,1714126040,0,0,'31c5b09c298e2358802522ef1d9821d3',27,''),(240,2,'appdata_ocks80ys70ng/theming/global/0/icon-core-#0082c9filetypes_application-pdf.svg','51513eff9223c228f76042d29933be09',238,'icon-core-#0082c9filetypes_application-pdf.svg',20,8,756,1714126040,1714126040,0,0,'c1e0dea92b4d6c2b34300ad0cd77ff22',27,''),(241,2,'appdata_ocks80ys70ng/theming/global/0/icon-core-#0082c9filetypes_image.svg','6e404bc1ef65aff06588ac6fd131c262',238,'icon-core-#0082c9filetypes_image.svg',20,8,378,1714218540,1714218540,0,0,'a4456dc359ed15f8b8da8a45d3b0fb74',27,''),(242,2,'appdata_ocks80ys70ng/theming/global/0/icon-core-#0082c9filetypes_text.svg','d802454833047be396b5e89b8fad00d7',238,'icon-core-#0082c9filetypes_text.svg',20,8,299,1714218540,1714218540,0,0,'7a6084fbd8567b8b57f12d2f99b2f781',27,''),(243,2,'appdata_ocks80ys70ng/preview/9/500-500-max.png','c544fd1ebaea81ed2cc18faf7a44cc0f',213,'500-500-max.png',9,8,50545,1714218540,1714218540,0,0,'311a2b7d1a436386f2df20717aa2eade',27,''),(244,2,'appdata_ocks80ys70ng/preview/1/9','22ae6b0815e65e50133e7c152f3999b7',67,'9',2,1,-1,1714218540,1714218540,0,0,'662ce62c70ad0',31,''),(245,2,'appdata_ocks80ys70ng/preview/9/64-64-crop.png','cc2959e7ac264dec85a1c4983f5da0df',213,'64-64-crop.png',9,8,4459,1714218540,1714218540,0,0,'7743a2826e50246c0c0c530190793b37',27,''),(246,2,'appdata_ocks80ys70ng/preview/1/9/c','d1972ce633c6fffc3d0764fcf84de5cb',244,'c',2,1,-1,1714218540,1714218540,0,0,'662ce62c6f015',31,''),(247,2,'appdata_ocks80ys70ng/preview/1/9/c/a','d36151253709e82e9e9b1df12b9b99c3',246,'a',2,1,-1,1714218540,1714218540,0,0,'662ce62c6e1d2',31,''),(248,2,'appdata_ocks80ys70ng/preview/a/5/b','380cfc20c9d6391ec8f69c6c92f015b3',68,'b',2,1,-1,1714218540,1714218540,0,0,'662ce62c76f8c',31,''),(249,2,'appdata_ocks80ys70ng/preview/1/9/c/a/1','d88a51390b2ec31c996ab21dee920d0c',247,'1',2,1,-1,1714218540,1714218540,0,0,'662ce62c6c9dc',31,''),(250,2,'appdata_ocks80ys70ng/preview/a/5/b/f','9e04be1e621c626cbf8afce4f4dfc467',248,'f',2,1,-1,1714218540,1714218540,0,0,'662ce62c75e7b',31,''),(251,2,'appdata_ocks80ys70ng/preview/1/9/c/a/1/4','5b516536499a773daa23d05dfac10619',249,'4',2,1,-1,1714218540,1714218540,0,0,'662ce62c6b062',31,''),(252,2,'appdata_ocks80ys70ng/preview/a/5/b/f/c','b7bc4dc8531f3ef635b36deea784577d',250,'c',2,1,-1,1714218540,1714218540,0,0,'662ce62c7537c',31,''),(253,2,'appdata_ocks80ys70ng/preview/1/9/c/a/1/4/e','a4bb31117bf538c3cf2ccb5ae6e4cc18',251,'e',2,1,-1,1714218540,1714218540,0,0,'662ce62c69219',31,''),(254,2,'appdata_ocks80ys70ng/preview/a/5/b/f/c/9','e517ec6be29a3e5549c7ecbf6d91dcf7',252,'9',2,1,-1,1714218540,1714218540,0,0,'662ce62c74d46',31,''),(255,2,'appdata_ocks80ys70ng/preview/a/5/b/f/c/9/e','f9db077f6689361478133f9999528f57',254,'e',2,1,-1,1714218540,1714218540,0,0,'662ce62c74794',31,''),(256,2,'appdata_ocks80ys70ng/preview/1/9/c/a/1/4/e/36','2329db32f091d9289a12e90f423ebea3',253,'36',2,1,0,1714218541,1714218541,0,0,'662ce62c68283',31,''),(257,2,'appdata_ocks80ys70ng/preview/a/5/b/f/c/9/e/37','1a98b6b4813cc702b2fa25ffabb7ce2f',255,'37',2,1,0,1714218540,1714218540,0,0,'662ce62c73d71',31,''),(258,2,'appdata_ocks80ys70ng/preview/d','bbb046b1b43249d6de56bf9e9eac087c',59,'d',2,1,-1,1714218540,1714218540,0,0,'662ce62c96784',31,''),(259,2,'appdata_ocks80ys70ng/preview/d/6','37852aaa643320257e165b5bb9aa933b',258,'6',2,1,-1,1714218540,1714218540,0,0,'662ce62c95f71',31,''),(260,2,'appdata_ocks80ys70ng/preview/d/6/7','b68b350a7b39c1a0a19c93192d770ffa',259,'7',2,1,-1,1714218540,1714218540,0,0,'662ce62c95b5a',31,''),(261,2,'appdata_ocks80ys70ng/preview/d/6/7/d','353173c56c52169c9eacfb84ea60fc4f',260,'d',2,1,-1,1714218540,1714218540,0,0,'662ce62c95724',31,''),(262,2,'appdata_ocks80ys70ng/preview/d/6/7/d/8','d734a4f6ec909e02ccc678ddc9804342',261,'8',2,1,-1,1714218540,1714218540,0,0,'662ce62c951db',31,''),(263,2,'appdata_ocks80ys70ng/preview/d/6/7/d/8/a','c50d1bd227abb11a7a8a24aab4c77f1b',262,'a',2,1,-1,1714218540,1714218540,0,0,'662ce62c939a8',31,''),(264,2,'appdata_ocks80ys70ng/preview/d/6/7/d/8/a/b','8f5eee839efec2a294238f843d932425',263,'b',2,1,-1,1714218540,1714218540,0,0,'662ce62c92c50',31,''),(265,2,'appdata_ocks80ys70ng/preview/d/6/7/d/8/a/b/39','066373d92de39dccb48b0d14691be2b0',264,'39',2,1,0,1714218540,1714218540,0,0,'662ce62c91d85',31,''),(266,2,'appdata_ocks80ys70ng/preview/a/5/7/7/1/b/c/38/64-64-crop.png','e2427a89e325de5d1d74ee42470b4038',91,'64-64-crop.png',9,8,1159,1714218540,1714218540,0,0,'136e58fed502bcd8a4ad6246142ce4dd',27,''),(267,2,'appdata_ocks80ys70ng/preview/1/9/c/a/1/4/e/36/4096-4096-max.png','71587043955d631957bd3f51ac8733ee',256,'4096-4096-max.png',9,8,198133,1714218540,1714218540,0,0,'0ee88932b96baec682760cc9447346d6',27,''),(268,2,'appdata_ocks80ys70ng/text','1fe53f38e70d472e626e386a61ab7566',51,'text',2,1,0,1714218540,1714218540,0,0,'662ce62cd6a62',31,''),(269,2,'appdata_ocks80ys70ng/text/documents','e801dabf135f44ff59d36c1c29724a0c',268,'documents',2,1,0,1714218540,1714218540,0,0,'662ce62cd9110',31,''),(270,2,'appdata_ocks80ys70ng/preview/1/9/c/a/1/4/e/36/64-64-crop.png','8f9f65d6c4dc7c87e9913bfba9589ec8',256,'64-64-crop.png',9,8,3254,1714218541,1714218541,0,0,'804d92da447813aa61fa1a4b5502906e',27,''),(271,2,'appdata_ocks80ys70ng/theming/global/0/icon-core-#0082c9filetypes_x-office-drawing.svg','6c8de90f4df32cc5a748d3e3032855ef',238,'icon-core-#0082c9filetypes_x-office-drawing.svg',20,8,369,1714218550,1714218550,0,0,'aadf8344d6ed36a2f221134b4482e04c',27,''),(272,2,'appdata_ocks80ys70ng/theming/global/0/icon-core-#0082c9filetypes_x-office-spreadsheet.svg','db2f19277f69ad45401e8123e9ccc923',238,'icon-core-#0082c9filetypes_x-office-spreadsheet.svg',20,8,317,1714218550,1714218550,0,0,'9d6bce0302eb2e8168b5506c71c77efd',27,''),(273,2,'appdata_ocks80ys70ng/preview/6','50776a6c20b562b286a81bd1c0148e46',59,'6',2,1,-1,1714218550,1714218550,0,0,'662ce63681830',31,''),(274,2,'appdata_ocks80ys70ng/preview/6/c','9dae448251dcf8a843f5fc6ac9df48df',273,'c',2,1,-1,1714218550,1714218550,0,0,'662ce63680f01',31,''),(275,2,'appdata_ocks80ys70ng/preview/6/c/8','3b19eeeb7b45f51f5d06912ad62996e5',274,'8',2,1,-1,1714218550,1714218550,0,0,'662ce636806cf',31,''),(276,2,'appdata_ocks80ys70ng/preview/6/c/8/3','fb967e2c0b1d6c8738d1ea9a24f7a0a0',275,'3',2,1,-1,1714218550,1714218550,0,0,'662ce63680107',31,''),(277,2,'appdata_ocks80ys70ng/preview/6/c/8/3/4','b125a839e7ab36175e755a51e6015877',276,'4',2,1,-1,1714218550,1714218550,0,0,'662ce6367f6bd',31,''),(278,2,'appdata_ocks80ys70ng/preview/6/c/8/3/4/9','220df77d9d1698f55c111f1beb9c5a9a',277,'9',2,1,-1,1714218550,1714218550,0,0,'662ce6367ed36',31,''),(279,2,'appdata_ocks80ys70ng/preview/4','5f96f25636bba54e1638711da3bd78db',59,'4',2,1,-1,1714218550,1714218550,0,0,'662ce6368af3a',31,''),(280,2,'appdata_ocks80ys70ng/preview/6/c/8/3/4/9/c','1d52755a4ce14f284ce85eb6d42d6976',278,'c',2,1,-1,1714218550,1714218550,0,0,'662ce6367e1a5',31,''),(281,2,'appdata_ocks80ys70ng/preview/4/e','1dd97a66dd7d979db8bb564dc97633d3',279,'e',2,1,-1,1714218550,1714218550,0,0,'662ce6368aa5a',31,''),(282,2,'appdata_ocks80ys70ng/preview/6/c/8/3/4/9/c/45','16666ae3549354e3cc4dec5b92076127',280,'45',2,1,0,1714218550,1714218550,0,0,'662ce6367c9e6',31,''),(283,2,'appdata_ocks80ys70ng/preview/4/e/7','918b1356512ca6da95899220f51bfe4f',281,'7',2,1,-1,1714218550,1714218550,0,0,'662ce63688e3d',31,''),(284,2,'appdata_ocks80ys70ng/preview/4/e/7/3','ad2886ce6f632497b422126841ac3d18',283,'3',2,1,-1,1714218550,1714218550,0,0,'662ce63686562',31,''),(285,2,'appdata_ocks80ys70ng/preview/4/e/7/3/2','756029d90405072cb55eb4a51e12a1c5',284,'2',2,1,-1,1714218550,1714218550,0,0,'662ce636851e7',31,''),(286,2,'appdata_ocks80ys70ng/preview/4/e/7/3/2/c','509734f0b4c137a29c1602a30f77f824',285,'c',2,1,-1,1714218550,1714218550,0,0,'662ce63683956',31,''),(287,2,'appdata_ocks80ys70ng/preview/4/e/7/3/2/c/e','b753e050187675280dc39dad19b272b7',286,'e',2,1,-1,1714218550,1714218550,0,0,'662ce63681830',31,''),(288,2,'appdata_ocks80ys70ng/preview/4/e/7/3/2/c/e/26','c8e9bb39f9a9f9b3594f7e0846791d5f',287,'26',2,1,0,1714218550,1714218550,0,0,'662ce63680cbf',31,''),(289,2,'appdata_ocks80ys70ng/preview/c','20199c8584ca71c44f4e0f24261ee3e1',59,'c',2,1,-1,1714218550,1714218550,0,0,'662ce63694b5b',31,''),(290,2,'appdata_ocks80ys70ng/preview/c/1','f85ce80cb7e5df8c7a2f4bb83cc3416e',289,'1',2,1,-1,1714218550,1714218550,0,0,'662ce63693f24',31,''),(291,2,'appdata_ocks80ys70ng/preview/c/1/6','9da5875c70fdbc5c5114950ff99c0e90',290,'6',2,1,-1,1714218550,1714218550,0,0,'662ce6369357c',31,''),(292,2,'appdata_ocks80ys70ng/preview/c/1/6/a','8bb4e1da8cc6a8cbd52d6f8888b5763e',291,'a',2,1,-1,1714218550,1714218550,0,0,'662ce63692a16',31,''),(293,2,'appdata_ocks80ys70ng/preview/c/1/6/a/5','7734ba248bdcc461d654a752cdd74484',292,'5',2,1,-1,1714218550,1714218550,0,0,'662ce63692352',31,''),(294,2,'appdata_ocks80ys70ng/preview/c/1/6/a/5/3','25fdc3f2fdad927310a69af5e24536a3',293,'3',2,1,-1,1714218550,1714218550,0,0,'662ce63691eb6',31,''),(295,2,'appdata_ocks80ys70ng/preview/4/e/7/3/2/c/e/26/512-376-max.png','6bfb4d01588962b5cabc3f72739dd1e8',288,'512-376-max.png',9,8,13892,1714218550,1714218550,0,0,'dc699a17f85cff72eac39f0d32f012f3',27,''),(296,2,'appdata_ocks80ys70ng/preview/c/1/6/a/5/3/2','a4f584b19bce74f90bd9b093f52ae2ff',294,'2',2,1,-1,1714218550,1714218550,0,0,'662ce63691885',31,''),(297,2,'appdata_ocks80ys70ng/preview/c/1/6/a/5/3/2/31','293d4e00470224c35947e5113a45f6f8',296,'31',2,1,0,1714218550,1714218550,0,0,'662ce636913f6',31,''),(298,2,'appdata_ocks80ys70ng/preview/6/c/8/3/4/9/c/45/1600-1067-max.jpg','731a2605eb6174eda7f6316370c17cee',282,'1600-1067-max.jpg',17,8,137923,1714218550,1714218550,0,0,'e84c90358842f4e3c813af6f040c7e45',27,''),(299,2,'appdata_ocks80ys70ng/preview/4/e/7/3/2/c/e/26/64-64-crop.png','85dd602f5abcb6301ed04a1144926361',288,'64-64-crop.png',9,8,3096,1714218550,1714218550,0,0,'8261137f572b112d1d375130a3afcf84',27,''),(300,2,'appdata_ocks80ys70ng/preview/c/1/6/a/5/3/2/31/256-181-max.png','e00c75530eba2f25eda5717080d6e050',297,'256-181-max.png',9,8,4032,1714218550,1714218550,0,0,'b2cbdce07d9372615db13ba42b330176',27,''),(301,2,'appdata_ocks80ys70ng/preview/c/1/6/a/5/3/2/31/64-64-crop.png','10b42e89ce1db89c7c8b45d7ede7dcce',297,'64-64-crop.png',9,8,3365,1714218550,1714218550,0,0,'ca0fe2c54f5c29b4863b0ddda414a507',27,''),(302,2,'appdata_ocks80ys70ng/preview/6/c/8/3/4/9/c/45/64-64-crop.jpg','118d01f05fee4307997056e5c5850cd0',282,'64-64-crop.jpg',17,8,2105,1714218550,1714218550,0,0,'cc98793a59a9b2a0c822284335136ec1',27,''),(303,2,'appdata_ocks80ys70ng/avatar/next/avatar-dark.512.png','4131dbbe34d5e14c218c4fb7b8d32a20',110,'avatar-dark.512.png',9,8,5844,1714218563,1714218563,0,0,'ecc89ec794bf2c723f5704eb2e8d4861',27,''),(304,2,'appdata_ocks80ys70ng/appstore','9295ce9d9fa4da1b83bfbe610eba39d2',51,'appstore',2,1,0,1714218613,1714218613,0,0,'662ce67571efc',31,'');
/*!40000 ALTER TABLE `oc_filecache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache_extended`
--

DROP TABLE IF EXISTS `oc_filecache_extended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache_extended` (
  `fileid` bigint(20) unsigned NOT NULL,
  `metadata_etag` varchar(40) DEFAULT NULL,
  `creation_time` bigint(20) NOT NULL DEFAULT 0,
  `upload_time` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`fileid`),
  KEY `fce_ctime_idx` (`creation_time`),
  KEY `fce_utime_idx` (`upload_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache_extended`
--

LOCK TABLES `oc_filecache_extended` WRITE;
/*!40000 ALTER TABLE `oc_filecache_extended` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_filecache_extended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_metadata`
--

DROP TABLE IF EXISTS `oc_files_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_metadata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `json` longtext NOT NULL,
  `sync_token` varchar(15) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_meta_fileid` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_metadata`
--

LOCK TABLES `oc_files_metadata` WRITE;
/*!40000 ALTER TABLE `oc_files_metadata` DISABLE KEYS */;
INSERT INTO `oc_files_metadata` VALUES (1,9,'{\"photos-original_date_time\":{\"value\":1714125887,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":500,\"height\":500},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','m5jTxlD','2024-04-26 10:04:48'),(2,39,'{\"photos-original_date_time\":{\"value\":1714125889,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0}}','5XvNUFz','2024-04-26 10:04:50'),(3,41,'{\"photos-original_date_time\":{\"value\":1341072915,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/500\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":1,\"ISOSpeedRatings\":8000,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 16:15:15\",\"DateTimeDigitized\":\"2012:06:30 16:15:15\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"9\\/1\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"6149\\/1087\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"280\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"134321\\/34\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":1,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.3.1\",\"DateTime\":\"2012:06:30 16:15:15\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','42P1Wus','2024-04-26 10:04:50'),(4,42,'{\"photos-original_date_time\":{\"value\":1714125889,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":3000,\"height\":2000},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','pruCM6f','2024-04-26 10:04:50'),(5,43,'{\"photos-original_date_time\":{\"value\":1341258636,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/80\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":400,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:07:02 19:50:36\",\"DateTimeDigitized\":\"2012:07:02 19:50:36\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"51\\/8\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"32\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1066,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"185679\\/47\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"GIMP 2.8.0\",\"DateTime\":\"2012:07:02 22:06:14\",\"Exif_IFD_Pointer\":198},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1066},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','O714bKe','2024-04-26 10:04:50'),(6,44,'{\"photos-original_date_time\":{\"value\":1341059531,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/125\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":3,\"ISOSpeedRatings\":320,\"UndefinedTag__x____\":320,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 12:32:11\",\"DateTimeDigitized\":\"2012:06:30 12:32:11\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"7\\/1\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"189284\\/33461\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"280\\/1\",\"SubSecTime\":\"83\",\"SubSecTimeOriginal\":\"83\",\"SubSecTimeDigitized\":\"83\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"1920000\\/487\",\"FocalPlaneYResolution\":\"320000\\/81\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"0000000000\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"DateTime\":\"2012:06:30 12:32:11\",\"Exif_IFD_Pointer\":174},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','K5IsrCG','2024-04-26 10:04:51'),(7,45,'{\"photos-original_date_time\":{\"value\":1444907264,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/320\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":640,\"UndefinedTag__x____\":640,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2015:10:15 11:07:44\",\"DateTimeDigitized\":\"2015:10:15 11:07:44\",\"ShutterSpeedValue\":\"27970\\/3361\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"1\\/3\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"200\\/1\",\"SubSecTimeOriginal\":\"63\",\"SubSecTimeDigitized\":\"63\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"1600\\/1\",\"FocalPlaneYResolution\":\"1600\\/1\",\"FocalPlaneResolutionUnit\":3,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"000084121f\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"240\\/1\",\"YResolution\":\"240\\/1\",\"ResolutionUnit\":2,\"Software\":\"Adobe Photoshop Lightroom 6.2.1 (Macintosh)\",\"DateTime\":\"2015:10:16 14:40:21\",\"Exif_IFD_Pointer\":230},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','d8e2wWd','2024-04-26 10:04:51'),(8,46,'{\"photos-original_date_time\":{\"value\":1526500980,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"10\\/12500\",\"FNumber\":\"35\\/10\",\"ExposureProgram\":3,\"ISOSpeedRatings\":100,\"DateTimeOriginal\":\"2018:05:16 20:03:00\",\"DateTimeDigitized\":\"2018:05:16 20:03:00\",\"ExposureBiasValue\":\"0\\/6\",\"MaxApertureValue\":\"30\\/10\",\"MeteringMode\":5,\"LightSource\":0,\"Flash\":16,\"FocalLength\":\"700\\/10\",\"MakerNote\":\"Nikon\",\"UserComment\":\"Christoph WurstCC-SA 4.0\",\"SubSecTime\":\"30\",\"SubSecTimeOriginal\":\"30\",\"SubSecTimeDigitized\":\"30\",\"ColorSpace\":1,\"SensingMethod\":2,\"FileSource\":\"\",\"SceneType\":\"\",\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"DigitalZoomRatio\":\"1\\/1\",\"FocalLengthIn__mmFilm\":70,\"SceneCaptureType\":0,\"GainControl\":0,\"Contrast\":1,\"Saturation\":0,\"Sharpness\":1,\"SubjectDistanceRange\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"ImageDescription\":\"Christoph WurstCC-SA 4.0\",\"Make\":\"NIKON CORPORATION\",\"Model\":\"NIKON D610\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"GIMP 2.10.14\",\"DateTime\":\"2019:12:10 08:51:16\",\"Artist\":\"Christoph Wurst                     \",\"Copyright\":\"Christoph Wurst                                       \",\"Exif_IFD_Pointer\":402,\"GPS_IFD_Pointer\":13738,\"DateTimeOriginal\":\"2018:05:16 20:03:00\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1920,\"height\":1281},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','Czwu2P2','2024-04-26 10:04:51'),(9,47,'{\"photos-original_date_time\":{\"value\":1372319469,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/160\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":100,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2013:06:27 07:51:09\",\"DateTimeDigitized\":\"2013:06:27 07:51:09\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"59\\/8\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"2\\/3\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"45\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1200,\"ExifImageLength\":1800,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"185679\\/47\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"000052602c\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.4.5\",\"DateTime\":\"2013:06:27 07:51:09\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1200,\"height\":1800},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','xvU5Swa','2024-04-26 10:04:51'),(10,49,'{\"photos-original_date_time\":{\"value\":1341064060,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/640\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":1,\"ISOSpeedRatings\":12800,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 13:47:40\",\"DateTimeDigitized\":\"2012:06:30 13:47:40\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"75\\/8\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"6149\\/1087\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"235\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"134321\\/34\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":1,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.3.1\",\"DateTime\":\"2012:06:30 13:47:40\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','EpP3o7B','2024-04-26 10:04:51'),(11,128,'{\"photos-original_date_time\":{\"value\":1714126024,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":500,\"height\":500},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','8SO3MFX','2024-04-26 10:07:06'),(12,158,'{\"photos-original_date_time\":{\"value\":1714126025,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0}}','NBRnhrw','2024-04-26 10:07:07'),(13,160,'{\"photos-original_date_time\":{\"value\":1341072915,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/500\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":1,\"ISOSpeedRatings\":8000,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 16:15:15\",\"DateTimeDigitized\":\"2012:06:30 16:15:15\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"9\\/1\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"6149\\/1087\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"280\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"134321\\/34\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":1,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.3.1\",\"DateTime\":\"2012:06:30 16:15:15\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','3J87e8K','2024-04-26 10:07:07'),(14,161,'{\"photos-original_date_time\":{\"value\":1714126026,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":3000,\"height\":2000},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','wWjJr6L','2024-04-26 10:07:08'),(15,162,'{\"photos-original_date_time\":{\"value\":1341258636,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/80\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":400,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:07:02 19:50:36\",\"DateTimeDigitized\":\"2012:07:02 19:50:36\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"51\\/8\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"32\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1066,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"185679\\/47\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"GIMP 2.8.0\",\"DateTime\":\"2012:07:02 22:06:14\",\"Exif_IFD_Pointer\":198},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1066},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','avK1XIC','2024-04-26 10:07:08'),(16,163,'{\"photos-original_date_time\":{\"value\":1341059531,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/125\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":3,\"ISOSpeedRatings\":320,\"UndefinedTag__x____\":320,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 12:32:11\",\"DateTimeDigitized\":\"2012:06:30 12:32:11\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"7\\/1\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"189284\\/33461\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"280\\/1\",\"SubSecTime\":\"83\",\"SubSecTimeOriginal\":\"83\",\"SubSecTimeDigitized\":\"83\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"1920000\\/487\",\"FocalPlaneYResolution\":\"320000\\/81\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"0000000000\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"DateTime\":\"2012:06:30 12:32:11\",\"Exif_IFD_Pointer\":174},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','rzSHJZa','2024-04-26 10:07:08'),(17,164,'{\"photos-original_date_time\":{\"value\":1444907264,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/320\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":640,\"UndefinedTag__x____\":640,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2015:10:15 11:07:44\",\"DateTimeDigitized\":\"2015:10:15 11:07:44\",\"ShutterSpeedValue\":\"27970\\/3361\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"1\\/3\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"200\\/1\",\"SubSecTimeOriginal\":\"63\",\"SubSecTimeDigitized\":\"63\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"1600\\/1\",\"FocalPlaneYResolution\":\"1600\\/1\",\"FocalPlaneResolutionUnit\":3,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"000084121f\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"240\\/1\",\"YResolution\":\"240\\/1\",\"ResolutionUnit\":2,\"Software\":\"Adobe Photoshop Lightroom 6.2.1 (Macintosh)\",\"DateTime\":\"2015:10:16 14:40:21\",\"Exif_IFD_Pointer\":230},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','GZY1Dqp','2024-04-26 10:07:08'),(18,165,'{\"photos-original_date_time\":{\"value\":1526500980,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"10\\/12500\",\"FNumber\":\"35\\/10\",\"ExposureProgram\":3,\"ISOSpeedRatings\":100,\"DateTimeOriginal\":\"2018:05:16 20:03:00\",\"DateTimeDigitized\":\"2018:05:16 20:03:00\",\"ExposureBiasValue\":\"0\\/6\",\"MaxApertureValue\":\"30\\/10\",\"MeteringMode\":5,\"LightSource\":0,\"Flash\":16,\"FocalLength\":\"700\\/10\",\"MakerNote\":\"Nikon\",\"UserComment\":\"Christoph WurstCC-SA 4.0\",\"SubSecTime\":\"30\",\"SubSecTimeOriginal\":\"30\",\"SubSecTimeDigitized\":\"30\",\"ColorSpace\":1,\"SensingMethod\":2,\"FileSource\":\"\",\"SceneType\":\"\",\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"DigitalZoomRatio\":\"1\\/1\",\"FocalLengthIn__mmFilm\":70,\"SceneCaptureType\":0,\"GainControl\":0,\"Contrast\":1,\"Saturation\":0,\"Sharpness\":1,\"SubjectDistanceRange\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"ImageDescription\":\"Christoph WurstCC-SA 4.0\",\"Make\":\"NIKON CORPORATION\",\"Model\":\"NIKON D610\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"GIMP 2.10.14\",\"DateTime\":\"2019:12:10 08:51:16\",\"Artist\":\"Christoph Wurst                     \",\"Copyright\":\"Christoph Wurst                                       \",\"Exif_IFD_Pointer\":402,\"GPS_IFD_Pointer\":13738,\"DateTimeOriginal\":\"2018:05:16 20:03:00\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1920,\"height\":1281},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','P2rQiez','2024-04-26 10:07:08'),(19,166,'{\"photos-original_date_time\":{\"value\":1372319469,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/160\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":100,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2013:06:27 07:51:09\",\"DateTimeDigitized\":\"2013:06:27 07:51:09\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"59\\/8\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"2\\/3\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"45\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1200,\"ExifImageLength\":1800,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"185679\\/47\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"000052602c\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.4.5\",\"DateTime\":\"2013:06:27 07:51:09\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1200,\"height\":1800},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','msQUyYE','2024-04-26 10:07:08'),(20,168,'{\"photos-original_date_time\":{\"value\":1341064060,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/640\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":1,\"ISOSpeedRatings\":12800,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 13:47:40\",\"DateTimeDigitized\":\"2012:06:30 13:47:40\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"75\\/8\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"6149\\/1087\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"235\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"134321\\/34\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":1,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.3.1\",\"DateTime\":\"2012:06:30 13:47:40\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','JrYyhQp','2024-04-26 10:07:08');
/*!40000 ALTER TABLE `oc_files_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_metadata_index`
--

DROP TABLE IF EXISTS `oc_files_metadata_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_metadata_index` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `meta_key` varchar(31) DEFAULT NULL,
  `meta_value_string` varchar(63) DEFAULT NULL,
  `meta_value_int` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `f_meta_index` (`file_id`,`meta_key`,`meta_value_string`),
  KEY `f_meta_index_i` (`file_id`,`meta_key`,`meta_value_int`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_metadata_index`
--

LOCK TABLES `oc_files_metadata_index` WRITE;
/*!40000 ALTER TABLE `oc_files_metadata_index` DISABLE KEYS */;
INSERT INTO `oc_files_metadata_index` VALUES (2,9,'photos-original_date_time',NULL,1714125887),(3,39,'photos-original_date_time',NULL,1714125889),(5,41,'photos-original_date_time',NULL,1341072915),(7,42,'photos-original_date_time',NULL,1714125889),(9,43,'photos-original_date_time',NULL,1341258636),(11,44,'photos-original_date_time',NULL,1341059531),(13,45,'photos-original_date_time',NULL,1444907264),(15,46,'photos-original_date_time',NULL,1526500980),(17,47,'photos-original_date_time',NULL,1372319469),(19,49,'photos-original_date_time',NULL,1341064060),(21,128,'photos-original_date_time',NULL,1714126024),(22,158,'photos-original_date_time',NULL,1714126025),(24,160,'photos-original_date_time',NULL,1341072915),(26,161,'photos-original_date_time',NULL,1714126026),(28,162,'photos-original_date_time',NULL,1341258636),(30,163,'photos-original_date_time',NULL,1341059531),(32,164,'photos-original_date_time',NULL,1444907264),(34,165,'photos-original_date_time',NULL,1526500980),(36,166,'photos-original_date_time',NULL,1372319469),(38,168,'photos-original_date_time',NULL,1341064060);
/*!40000 ALTER TABLE `oc_files_metadata_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_reminders`
--

DROP TABLE IF EXISTS `oc_files_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `due_date` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `notified` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reminders_uniq_idx` (`user_id`,`file_id`,`due_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_reminders`
--

LOCK TABLES `oc_files_reminders` WRITE;
/*!40000 ALTER TABLE `oc_files_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_files_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_trash`
--

DROP TABLE IF EXISTS `oc_files_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_trash` (
  `auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(250) NOT NULL DEFAULT '',
  `user` varchar(64) NOT NULL DEFAULT '',
  `timestamp` varchar(12) NOT NULL DEFAULT '',
  `location` varchar(512) NOT NULL DEFAULT '',
  `type` varchar(4) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `id_index` (`id`),
  KEY `timestamp_index` (`timestamp`),
  KEY `user_index` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_trash`
--

LOCK TABLES `oc_files_trash` WRITE;
/*!40000 ALTER TABLE `oc_files_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_files_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_versions`
--

DROP TABLE IF EXISTS `oc_files_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_versions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `size` bigint(20) NOT NULL,
  `mimetype` bigint(20) NOT NULL,
  `metadata` longtext NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`metadata`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_versions_uniq_index` (`file_id`,`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_versions`
--

LOCK TABLES `oc_files_versions` WRITE;
/*!40000 ALTER TABLE `oc_files_versions` DISABLE KEYS */;
INSERT INTO `oc_files_versions` VALUES (1,4,1714125887,1083339,4,'{\"author\":\"next\"}'),(2,5,1714125887,1095,6,'{\"author\":\"next\"}'),(3,6,1714125887,24295,7,'{\"author\":\"next\"}'),(4,7,1714125887,136,6,'{\"author\":\"next\"}'),(5,8,1714125887,16305464,4,'{\"author\":\"next\"}'),(6,9,1714125887,50598,9,'{\"author\":\"next\"}'),(7,11,1714125887,13878,10,'{\"author\":\"next\"}'),(8,12,1714125887,868111,11,'{\"author\":\"next\"}'),(9,13,1714125887,573,6,'{\"author\":\"next\"}'),(10,14,1714125887,340061,11,'{\"author\":\"next\"}'),(11,15,1714125887,15961,11,'{\"author\":\"next\"}'),(12,16,1714125887,88394,12,'{\"author\":\"next\"}'),(13,17,1714125887,326,6,'{\"author\":\"next\"}'),(14,18,1714125887,5155877,11,'{\"author\":\"next\"}'),(15,19,1714125888,13653,10,'{\"author\":\"next\"}'),(16,20,1714125888,14316,13,'{\"author\":\"next\"}'),(17,21,1714125888,39404,11,'{\"author\":\"next\"}'),(18,22,1714125888,38605,14,'{\"author\":\"next\"}'),(19,23,1714125888,13441,12,'{\"author\":\"next\"}'),(20,24,1714125888,317015,13,'{\"author\":\"next\"}'),(21,25,1714125888,14810,13,'{\"author\":\"next\"}'),(22,26,1714125888,52843,12,'{\"author\":\"next\"}'),(23,27,1714125888,17276,11,'{\"author\":\"next\"}'),(24,28,1714125888,11836,10,'{\"author\":\"next\"}'),(25,29,1714125888,30354,11,'{\"author\":\"next\"}'),(26,30,1714125888,3509628,13,'{\"author\":\"next\"}'),(27,31,1714125888,16988,10,'{\"author\":\"next\"}'),(28,32,1714125888,52674,14,'{\"author\":\"next\"}'),(29,33,1714125888,81196,13,'{\"author\":\"next\"}'),(30,34,1714125888,13378,12,'{\"author\":\"next\"}'),(31,35,1714125888,554,6,'{\"author\":\"next\"}'),(32,36,1714125888,2403,6,'{\"author\":\"next\"}'),(33,37,1714125889,976625,4,'{\"author\":\"next\"}'),(34,38,1714125889,206,6,'{\"author\":\"next\"}'),(35,39,1714125889,3963036,16,'{\"author\":\"next\"}'),(36,41,1714125889,457744,17,'{\"author\":\"next\"}'),(37,42,1714125889,797325,17,'{\"author\":\"next\"}'),(38,43,1714125889,2170375,17,'{\"author\":\"next\"}'),(39,44,1714125889,593508,17,'{\"author\":\"next\"}'),(40,45,1714125889,167989,17,'{\"author\":\"next\"}'),(41,46,1714125889,427030,17,'{\"author\":\"next\"}'),(42,47,1714125889,567689,17,'{\"author\":\"next\"}'),(43,48,1714125889,150,6,'{\"author\":\"next\"}'),(44,49,1714125889,474653,17,'{\"author\":\"next\"}'),(45,123,1714126023,1083339,4,'{\"author\":\"Brent\"}'),(46,124,1714126023,1095,6,'{\"author\":\"Brent\"}'),(47,125,1714126023,24295,7,'{\"author\":\"Brent\"}'),(48,126,1714126024,136,6,'{\"author\":\"Brent\"}'),(49,127,1714126024,16305464,4,'{\"author\":\"Brent\"}'),(50,128,1714126024,50598,9,'{\"author\":\"Brent\"}'),(51,130,1714126024,13878,10,'{\"author\":\"Brent\"}'),(52,131,1714126024,868111,11,'{\"author\":\"Brent\"}'),(53,132,1714126024,573,6,'{\"author\":\"Brent\"}'),(54,133,1714126024,340061,11,'{\"author\":\"Brent\"}'),(55,134,1714126024,15961,11,'{\"author\":\"Brent\"}'),(56,135,1714126024,88394,12,'{\"author\":\"Brent\"}'),(57,136,1714126024,326,6,'{\"author\":\"Brent\"}'),(58,137,1714126024,5155877,11,'{\"author\":\"Brent\"}'),(59,138,1714126024,13653,10,'{\"author\":\"Brent\"}'),(60,139,1714126024,14316,13,'{\"author\":\"Brent\"}'),(61,140,1714126024,39404,11,'{\"author\":\"Brent\"}'),(62,141,1714126024,38605,14,'{\"author\":\"Brent\"}'),(63,142,1714126024,13441,12,'{\"author\":\"Brent\"}'),(64,143,1714126025,317015,13,'{\"author\":\"Brent\"}'),(65,144,1714126025,14810,13,'{\"author\":\"Brent\"}'),(66,145,1714126025,52843,12,'{\"author\":\"Brent\"}'),(67,146,1714126025,17276,11,'{\"author\":\"Brent\"}'),(68,147,1714126025,11836,10,'{\"author\":\"Brent\"}'),(69,148,1714126025,30354,11,'{\"author\":\"Brent\"}'),(70,149,1714126025,3509628,13,'{\"author\":\"Brent\"}'),(71,150,1714126025,16988,10,'{\"author\":\"Brent\"}'),(72,151,1714126025,52674,14,'{\"author\":\"Brent\"}'),(73,152,1714126025,81196,13,'{\"author\":\"Brent\"}'),(74,153,1714126025,13378,12,'{\"author\":\"Brent\"}'),(75,154,1714126025,554,6,'{\"author\":\"Brent\"}'),(76,155,1714126025,2403,6,'{\"author\":\"Brent\"}'),(77,156,1714126025,976625,4,'{\"author\":\"Brent\"}'),(78,157,1714126025,206,6,'{\"author\":\"Brent\"}'),(79,158,1714126025,3963036,16,'{\"author\":\"Brent\"}'),(80,160,1714126026,457744,17,'{\"author\":\"Brent\"}'),(81,161,1714126026,797325,17,'{\"author\":\"Brent\"}'),(82,162,1714126026,2170375,17,'{\"author\":\"Brent\"}'),(83,163,1714126026,593508,17,'{\"author\":\"Brent\"}'),(84,164,1714126026,167989,17,'{\"author\":\"Brent\"}'),(85,165,1714126026,427030,17,'{\"author\":\"Brent\"}'),(86,166,1714126026,567689,17,'{\"author\":\"Brent\"}'),(87,167,1714126026,150,6,'{\"author\":\"Brent\"}'),(88,168,1714126026,474653,17,'{\"author\":\"Brent\"}');
/*!40000 ALTER TABLE `oc_files_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_checks`
--

DROP TABLE IF EXISTS `oc_flow_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) NOT NULL DEFAULT '',
  `operator` varchar(16) NOT NULL DEFAULT '',
  `value` longtext DEFAULT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_checks`
--

LOCK TABLES `oc_flow_checks` WRITE;
/*!40000 ALTER TABLE `oc_flow_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations`
--

DROP TABLE IF EXISTS `oc_flow_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) NOT NULL DEFAULT '',
  `name` varchar(256) DEFAULT '',
  `checks` longtext DEFAULT NULL,
  `operation` longtext DEFAULT NULL,
  `entity` varchar(256) NOT NULL DEFAULT 'OCA\\WorkflowEngine\\Entity\\File',
  `events` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations`
--

LOCK TABLES `oc_flow_operations` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations_scope`
--

DROP TABLE IF EXISTS `oc_flow_operations_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations_scope` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_id` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `value` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_scope` (`operation_id`,`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations_scope`
--

LOCK TABLES `oc_flow_operations_scope` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_forms_v2_answers`
--

DROP TABLE IF EXISTS `oc_forms_v2_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_forms_v2_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forms_answers_submission` (`submission_id`),
  KEY `forms_answers_question` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_forms_v2_answers`
--

LOCK TABLES `oc_forms_v2_answers` WRITE;
/*!40000 ALTER TABLE `oc_forms_v2_answers` DISABLE KEYS */;
INSERT INTO `oc_forms_v2_answers` VALUES (1,1,1,'Dune');
/*!40000 ALTER TABLE `oc_forms_v2_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_forms_v2_forms`
--

DROP TABLE IF EXISTS `oc_forms_v2_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_forms_v2_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(64) NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `owner_id` varchar(64) NOT NULL,
  `created` int(11) DEFAULT NULL COMMENT 'unix-timestamp',
  `expires` int(11) DEFAULT 0 COMMENT 'unix-timestamp',
  `is_anonymous` tinyint(1) DEFAULT 0,
  `submit_multiple` tinyint(1) DEFAULT 0,
  `show_expiration` tinyint(1) DEFAULT 0,
  `last_updated` int(11) DEFAULT 0 COMMENT 'unix-timestamp',
  `submission_message` varchar(2048) DEFAULT NULL COMMENT 'custom thank you message',
  `file_id` bigint(20) unsigned DEFAULT NULL,
  `file_format` varchar(5) DEFAULT NULL,
  `state` smallint(5) unsigned NOT NULL DEFAULT 0,
  `access_enum` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueHash` (`hash`),
  KEY `forms_forms_owner` (`owner_id`),
  KEY `forms_forms_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_forms_v2_forms`
--

LOCK TABLES `oc_forms_v2_forms` WRITE;
/*!40000 ALTER TABLE `oc_forms_v2_forms` DISABLE KEYS */;
INSERT INTO `oc_forms_v2_forms` VALUES (1,'coRf36SybCF26Q9Z','Interne bevraging TenurIT','Dit is een interne bevraging binnen TenurIT en is van existentieel belang voor het correct functioneren van dit bedrijf.','next',1714219885,0,0,0,0,1714220212,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `oc_forms_v2_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_forms_v2_options`
--

DROP TABLE IF EXISTS `oc_forms_v2_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_forms_v2_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `text` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forms_options_question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_forms_v2_options`
--

LOCK TABLES `oc_forms_v2_options` WRITE;
/*!40000 ALTER TABLE `oc_forms_v2_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_forms_v2_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_forms_v2_questions`
--

DROP TABLE IF EXISTS `oc_forms_v2_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_forms_v2_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `order` int(11) DEFAULT 1,
  `type` varchar(256) NOT NULL,
  `text` varchar(2048) DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT 0,
  `description` text DEFAULT '',
  `extra_settings_json` longtext DEFAULT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`extra_settings_json`)),
  `name` varchar(255) DEFAULT '' COMMENT 'technical-identifier',
  PRIMARY KEY (`id`),
  KEY `forms_questions_form_order` (`form_id`,`order`),
  KEY `forms_questions_form` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_forms_v2_questions`
--

LOCK TABLES `oc_forms_v2_questions` WRITE;
/*!40000 ALTER TABLE `oc_forms_v2_questions` DISABLE KEYS */;
INSERT INTO `oc_forms_v2_questions` VALUES (1,1,1,'short','Wat is jouw favoriete film?',0,'','{}',''),(2,1,2,'short','Wat is jouw favoriete serie',0,'','{}','');
/*!40000 ALTER TABLE `oc_forms_v2_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_forms_v2_shares`
--

DROP TABLE IF EXISTS `oc_forms_v2_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_forms_v2_shares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `share_type` smallint(6) DEFAULT NULL,
  `share_with` varchar(256) NOT NULL,
  `permissions_json` longtext DEFAULT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`permissions_json`)),
  PRIMARY KEY (`id`),
  KEY `forms_shares_form` (`form_id`),
  KEY `forms_shares_type` (`share_type`),
  KEY `forms_shares_with` (`share_with`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_forms_v2_shares`
--

LOCK TABLES `oc_forms_v2_shares` WRITE;
/*!40000 ALTER TABLE `oc_forms_v2_shares` DISABLE KEYS */;
INSERT INTO `oc_forms_v2_shares` VALUES (2,1,0,'Brent','[\"submit\"]'),(4,1,3,'SGSnagD56oX2zsJLoDNDJ7dH','[\"submit\"]');
/*!40000 ALTER TABLE `oc_forms_v2_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_forms_v2_submissions`
--

DROP TABLE IF EXISTS `oc_forms_v2_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_forms_v2_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `timestamp` int(11) DEFAULT NULL COMMENT 'unix-timestamp',
  PRIMARY KEY (`id`),
  KEY `forms_submissions_form` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_forms_v2_submissions`
--

LOCK TABLES `oc_forms_v2_submissions` WRITE;
/*!40000 ALTER TABLE `oc_forms_v2_submissions` DISABLE KEYS */;
INSERT INTO `oc_forms_v2_submissions` VALUES (1,1,'next',1714220212);
/*!40000 ALTER TABLE `oc_forms_v2_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_admin`
--

DROP TABLE IF EXISTS `oc_group_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_admin` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `group_admin_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_admin`
--

LOCK TABLES `oc_group_admin` WRITE;
/*!40000 ALTER TABLE `oc_group_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_group_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_user`
--

DROP TABLE IF EXISTS `oc_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_user` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `gu_uid_index` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_user`
--

LOCK TABLES `oc_group_user` WRITE;
/*!40000 ALTER TABLE `oc_group_user` DISABLE KEYS */;
INSERT INTO `oc_group_user` VALUES ('admin','next');
/*!40000 ALTER TABLE `oc_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_groups`
--

DROP TABLE IF EXISTS `oc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_groups` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `displayname` varchar(255) NOT NULL DEFAULT 'name',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_groups`
--

LOCK TABLES `oc_groups` WRITE;
/*!40000 ALTER TABLE `oc_groups` DISABLE KEYS */;
INSERT INTO `oc_groups` VALUES ('admin','admin');
/*!40000 ALTER TABLE `oc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_jobs`
--

DROP TABLE IF EXISTS `oc_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL DEFAULT '',
  `argument` varchar(4000) NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT 0,
  `last_checked` int(11) DEFAULT 0,
  `reserved_at` int(11) DEFAULT 0,
  `execution_duration` int(11) DEFAULT 0,
  `argument_hash` varchar(32) DEFAULT NULL,
  `time_sensitive` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `job_class_index` (`class`),
  KEY `job_lastcheck_reserved` (`last_checked`,`reserved_at`),
  KEY `job_argument_hash` (`class`,`argument_hash`),
  KEY `jobs_time_sensitive` (`time_sensitive`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_jobs`
--

LOCK TABLES `oc_jobs` WRITE;
/*!40000 ALTER TABLE `oc_jobs` DISABLE KEYS */;
INSERT INTO `oc_jobs` VALUES (1,'OCA\\Files_Sharing\\DeleteOrphanedSharesJob','null',1714125921,1714125921,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(2,'OCA\\Files_Sharing\\ExpireSharesJob','null',1714125928,1714125928,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(3,'OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob','null',1714126027,1714126027,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(4,'OCA\\Federation\\SyncJob','null',1714126039,1714126039,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(5,'OCA\\ServerInfo\\Jobs\\UpdateStorageStats','null',1714218476,1714218476,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(6,'OCA\\Files_Versions\\BackgroundJob\\ExpireVersions','null',1714218487,1714218487,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(7,'OCA\\UserStatus\\BackgroundJob\\ClearOldStatusesBackgroundJob','null',1714218536,1714218536,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(8,'OCA\\Notifications\\BackgroundJob\\GenerateUserSettings','null',1714218539,1714218539,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(9,'OCA\\Notifications\\BackgroundJob\\SendNotificationMails','null',1714218553,1714218553,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(10,'OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash','null',1714218563,1714218563,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(11,'OCA\\Photos\\Jobs\\AutomaticPlaceMapperJob','null',1714218566,1714218566,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(12,'OCA\\WorkflowEngine\\BackgroundJobs\\Rotate','null',1714218568,1714218568,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(13,'OCA\\Files\\BackgroundJob\\ScanFiles','null',1714218572,1714218572,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(14,'OCA\\Files\\BackgroundJob\\DeleteOrphanedItems','null',1714218579,1714218579,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(15,'OCA\\Files\\BackgroundJob\\CleanupFileLocks','null',1714218581,1714218581,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(16,'OCA\\Files\\BackgroundJob\\CleanupDirectEditingTokens','null',1714218583,1714218583,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(17,'OCA\\Files\\BackgroundJob\\DeleteExpiredOpenLocalEditor','null',1714218583,1714218583,0,1,'37a6259cc0c1dae299a7866489dff0bd',0),(18,'OCA\\Support\\BackgroundJobs\\CheckSubscription','null',1714218609,1714218609,0,1,'37a6259cc0c1dae299a7866489dff0bd',1),(19,'OCA\\NextcloudAnnouncements\\Cron\\Crawler','null',1714218619,1714218619,0,6,'37a6259cc0c1dae299a7866489dff0bd',1),(20,'OCA\\Circles\\Cron\\Maintenance','null',1714218886,1714218886,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(21,'OCA\\ContactsInteraction\\BackgroundJob\\CleanupJob','null',1714219242,1714219242,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(22,'OCA\\Text\\Cron\\Cleanup','null',1714219255,1714219255,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(23,'OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob','null',1714219545,1714219545,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(24,'OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob','null',1714219674,1714219674,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(25,'OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob','null',1714219677,1714219677,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(26,'OCA\\DAV\\BackgroundJob\\EventReminderJob','null',1714219687,1714219687,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(27,'OCA\\DAV\\BackgroundJob\\CalendarRetentionJob','null',1714219715,1714219715,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(28,'OCA\\DAV\\BackgroundJob\\PruneOutdatedSyncTokensJob','null',1714219820,1714219820,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(29,'OCA\\Activity\\BackgroundJob\\EmailNotification','null',1714219874,1714219874,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(30,'OCA\\Activity\\BackgroundJob\\ExpireActivities','null',1714219883,1714219883,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(31,'OCA\\Activity\\BackgroundJob\\DigestMail','null',1714220186,1714220186,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(32,'OCA\\Activity\\BackgroundJob\\RemoveFormerActivitySettings','null',1714220226,1714220226,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(33,'OCA\\UpdateNotification\\BackgroundJob\\UpdateAvailableNotifications','null',0,1714125885,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(34,'OCA\\FilesReminders\\BackgroundJob\\CleanUpReminders','null',0,1714125885,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(35,'OCA\\FilesReminders\\BackgroundJob\\ScheduledNotifications','null',0,1714125885,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(36,'OCA\\OAuth2\\BackgroundJob\\CleanupExpiredAuthorizationCode','null',0,1714125886,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(37,'OC\\Authentication\\Token\\TokenCleanupJob','null',0,1714125886,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(38,'OC\\Log\\Rotate','null',0,1714125886,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(39,'OC\\Preview\\BackgroundCleanupJob','null',0,1714125886,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(40,'OC\\TextProcessing\\RemoveOldTasksBackgroundJob','null',0,1714125886,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(41,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",4]',0,1714125887,0,0,'d460824b78c40b5edf22b21a8cc29e67',1),(42,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",5]',0,1714125887,0,0,'342812619ed300bd98d4cf95790ad7a6',1),(43,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",6]',0,1714125887,0,0,'5beb8544a75e0ea0d54ea79e82fd2e09',1),(44,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",7]',0,1714125887,0,0,'c3df8a79e209635befa2197b7892a460',1),(45,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",8]',0,1714125887,0,0,'0281f1578a23a58d34fd83621622f858',1),(46,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",9]',0,1714125887,0,0,'83ddc9f3ad248fd6e22cc23c7057e028',1),(47,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",11]',0,1714125887,0,0,'52a12f1e018e068b4ad2054d1a5e73f5',1),(48,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",12]',0,1714125887,0,0,'d9efb306327522663f3d6ac874c63564',1),(49,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",13]',0,1714125887,0,0,'693233ecce7ee2e1b048d5bec80cb3d4',1),(50,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",14]',0,1714125887,0,0,'3e317a3ac4756fb9395db1df8f12711e',1),(51,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",15]',0,1714125887,0,0,'9a023111d5ef6caa2ffe677b0be20986',1),(52,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",16]',0,1714125887,0,0,'662cd7fbe52ab2bf47d5b59840ff0ae5',1),(53,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",17]',0,1714125887,0,0,'dba5527b01929b1a3000991cfc55081b',1),(54,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",18]',0,1714125887,0,0,'23af84fa1eaceb8a31638c1413e3c49b',1),(55,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",19]',0,1714125888,0,0,'aae008a880f1173e39fa75cd2a77e784',1),(56,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",20]',0,1714125888,0,0,'ed9dd468221690b93604a34b0fcc04d9',1),(57,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",21]',0,1714125888,0,0,'9840b5d1f96bccf9583426145e16ea4d',1),(58,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",22]',0,1714125888,0,0,'0d338c116ea5b1ff89894a063352002f',1),(59,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",23]',0,1714125888,0,0,'56ebeb6238b2716a255a342555003bbe',1),(60,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",24]',0,1714125888,0,0,'4c75b0ee4c3d58b17897801d1c894c3a',1),(61,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",25]',0,1714125888,0,0,'1afd2b379b3bdb4ef07687733c527a60',1),(62,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",26]',0,1714125888,0,0,'2c225127f40782f600d1c6ba6fa60b0c',1),(63,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",27]',0,1714125888,0,0,'976ff65a24e45a7eabda0bd53a5d10a5',1),(64,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",28]',0,1714125888,0,0,'36c2864962cd21b2436bac6ed973ab49',1),(65,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",29]',0,1714125888,0,0,'7c81fd4855122afef5372e100088a6d9',1),(66,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",30]',0,1714125888,0,0,'451e79d22d86ed4464666820ff80a1dc',1),(67,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",31]',0,1714125888,0,0,'d95cb3f9f48b84b466b80148eb262718',1),(68,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",32]',0,1714125888,0,0,'eba853ce54fb0e3be4d3b289a20ffc3d',1),(69,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",33]',0,1714125888,0,0,'9df3635d7f8f2038b828d2923ac62183',1),(70,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",34]',0,1714125888,0,0,'a0e0ad6c4329edf85e9d5d4b09314c1a',1),(71,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",35]',0,1714125888,0,0,'b4c6069b849ba58505354e8764d02f41',1),(72,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",36]',0,1714125888,0,0,'5977874563570a182230cb37caf61909',1),(73,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",37]',0,1714125889,0,0,'e8e4b7e8690381e461c34239848a1549',1),(74,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",38]',0,1714125889,0,0,'e55289750b7be0b94c7154e4bb318038',1),(75,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",39]',0,1714125889,0,0,'bff8a2b42069c9ab5050800ab6ab24e8',1),(76,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",41]',0,1714125889,0,0,'8b0325f8b4a426d10d9dd582a45b496a',1),(77,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",42]',0,1714125889,0,0,'c2e5b13ade403fb42633e44ad58ebc69',1),(78,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",43]',0,1714125889,0,0,'8c59f626e1d9384871b611e0c728efba',1),(79,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",44]',0,1714125889,0,0,'d3fe7d549754c4a01c3d7d55af5e9910',1),(80,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",45]',0,1714125889,0,0,'0c17a36f331f509fbbdd55cefeca979a',1),(81,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",46]',0,1714125889,0,0,'b158ff9cd07ad130886e9be1b1f0b44b',1),(82,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",47]',0,1714125889,0,0,'32c54db59e7d453b9f8e124c44536eac',1),(83,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",48]',0,1714125889,0,0,'b93162ca0d2896d0d0c8518017fc17b5',1),(84,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",49]',0,1714125889,0,0,'3357315ea995f97a240374a82430120e',1),(85,'OCA\\FirstRunWizard\\Notification\\BackgroundJob','{\"uid\":\"next\"}',0,1714125920,0,0,'afb9f6d2ed37b1358e0053a561ccb075',1),(86,'OCA\\Settings\\BackgroundJobs\\VerifyUserData','{\"verificationCode\":\"\",\"data\":\"brent.declercq2@student.hogent.be\",\"type\":\"email\",\"uid\":\"Brent\",\"try\":0,\"lastRun\":1714125999}',0,1714125999,0,0,'47d7c77090d7d7fa07cc2ce3afedc7e3',1),(87,'OCA\\LookupServerConnector\\BackgroundJobs\\RetryJob','{\"userId\":\"Brent\"}',0,1714125999,0,0,'5689c2ba1aa08e21d7d0d97f4a4d2dd7',1),(88,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",123]',0,1714126023,0,0,'d0bd8cdc4b24e03daef0817288ae6b11',1),(89,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",124]',0,1714126023,0,0,'403607a308b1e6366bc297bee5b38d74',1),(90,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",125]',0,1714126024,0,0,'49e37d69aafed5549de5faee80e82a07',1),(91,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",126]',0,1714126024,0,0,'301695282624b437b7c8e71b5a21c91c',1),(92,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",127]',0,1714126024,0,0,'8647d03470d6e36c35b9e3c2b5147e09',1),(93,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",128]',0,1714126024,0,0,'7a938cc015e7e310b23b9d4ccda3f772',1),(94,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",130]',0,1714126024,0,0,'4596bc0c9a4b01ceb5c02ac07f40c914',1),(95,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",131]',0,1714126024,0,0,'d25cef2f57f12ab195fa57fd665d75f3',1),(96,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",132]',0,1714126024,0,0,'1d7437c18a4a798c8f48e884e42ad33b',1),(97,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",133]',0,1714126024,0,0,'4d49cfd2c8e292d6d47ac0024d4bed59',1),(98,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",134]',0,1714126024,0,0,'f60c57ae455aeb54a0af3a1d4447a079',1),(99,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",135]',0,1714126024,0,0,'e70dd831c1efa59dbbe75898f2810fee',1),(100,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",136]',0,1714126024,0,0,'6205ca0f50ee90228628c77dcea3a440',1),(101,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",137]',0,1714126024,0,0,'b7decd00e5a7cbd712204333858c8814',1),(102,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",138]',0,1714126024,0,0,'93bcfd94df61aafc642d98014b701e27',1),(103,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",139]',0,1714126024,0,0,'e6cc632809b65b525e2cdac0b9af47c6',1),(104,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",140]',0,1714126024,0,0,'dea2058d2504c21a04ceb9ff0f1ba937',1),(105,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",141]',0,1714126024,0,0,'dedb00221714683bce25d7ff2696e9f8',1),(106,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",142]',0,1714126024,0,0,'35abd3145d45bf1136f4236b85d98a68',1),(107,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",143]',0,1714126025,0,0,'8a41c74841cbc05c68243b2e4b421216',1),(108,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",144]',0,1714126025,0,0,'dab769531c2d0c45b5d6cff440fc64e9',1),(109,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",145]',0,1714126025,0,0,'568e9b56ce60db36d588120f23d78542',1),(110,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",146]',0,1714126025,0,0,'c4324a68221296fb874bd40b55b5397e',1),(111,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",147]',0,1714126025,0,0,'f3c1d3ea342ddc0cdb746661c2b25b49',1),(112,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",148]',0,1714126025,0,0,'160f8518b5fc4ea30bc82eadaf688016',1),(113,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",149]',0,1714126025,0,0,'aa5bf274a7f39ee272c21824d05502d7',1),(114,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",150]',0,1714126025,0,0,'c344a1c3cd8a60e71d40bf27ef8d80e3',1),(115,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",151]',0,1714126025,0,0,'d03475927548245bf6d19f5874f70c84',1),(116,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",152]',0,1714126025,0,0,'eb501e010e2c3dfb4fd91d753af5c5ba',1),(117,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",153]',0,1714126025,0,0,'5ec37a1efe836b887d0cce37f8ba34df',1),(118,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",154]',0,1714126025,0,0,'b0897e2fc524d2fa2e00ab3b72d3872c',1),(119,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",155]',0,1714126025,0,0,'38653f2cf74cf032f5263eb5f25c149d',1),(120,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",156]',0,1714126025,0,0,'1ed459ed11281f39b210864090180b66',1),(121,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",157]',0,1714126025,0,0,'6cae7216580c76ea6ea9be5efbe1a42b',1),(122,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",158]',0,1714126025,0,0,'0f2a9808510d33c51328a06a3a239f2e',1),(123,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",160]',0,1714126026,0,0,'f049fa14386342fa53326e56effbe07a',1),(124,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",161]',0,1714126026,0,0,'61c8cb71a8c77367d203b6770935cf0b',1),(125,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",162]',0,1714126026,0,0,'94e84ea549190314aca316c57ef3d2e0',1),(126,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",163]',0,1714126026,0,0,'e7b97ccc7fcb3f21f33922c91445b8e9',1),(127,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",164]',0,1714126026,0,0,'b704b16432fd9a531277fc635af8a28b',1),(128,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",165]',0,1714126026,0,0,'98e8ecb8c9b3d791b338cd22bacabcc0',1),(129,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",166]',0,1714126026,0,0,'fcca190f2e9c9a079250c6463ccb45e8',1),(130,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",167]',0,1714126026,0,0,'b91076e64458e9dd38cf93064596c3b1',1),(131,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"Brent\",168]',0,1714126026,0,0,'65d0c421cc7d3a9d9b12180cb1303d29',1),(132,'OCA\\FirstRunWizard\\Notification\\BackgroundJob','{\"uid\":\"Brent\"}',0,1714126027,0,0,'eeb83c1286ab21c8051cb37db0450d96',1),(133,'OCA\\Calendar\\BackgroundJob\\CleanUpOutdatedBookingsJob','null',0,1714219250,0,0,'37a6259cc0c1dae299a7866489dff0bd',1);
/*!40000 ALTER TABLE `oc_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_known_users`
--

DROP TABLE IF EXISTS `oc_known_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_known_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `known_to` varchar(255) NOT NULL,
  `known_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ku_known_to` (`known_to`),
  KEY `ku_known_user` (`known_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_known_users`
--

LOCK TABLES `oc_known_users` WRITE;
/*!40000 ALTER TABLE `oc_known_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_known_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_login_flow_v2`
--

DROP TABLE IF EXISTS `oc_login_flow_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_login_flow_v2` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) unsigned NOT NULL,
  `started` smallint(5) unsigned NOT NULL DEFAULT 0,
  `poll_token` varchar(255) NOT NULL,
  `login_token` varchar(255) NOT NULL,
  `public_key` text NOT NULL,
  `private_key` text NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `app_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poll_token` (`poll_token`),
  UNIQUE KEY `login_token` (`login_token`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_login_flow_v2`
--

LOCK TABLES `oc_login_flow_v2` WRITE;
/*!40000 ALTER TABLE `oc_login_flow_v2` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_login_flow_v2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_migrations`
--

DROP TABLE IF EXISTS `oc_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_migrations` (
  `app` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`app`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_migrations`
--

LOCK TABLES `oc_migrations` WRITE;
/*!40000 ALTER TABLE `oc_migrations` DISABLE KEYS */;
INSERT INTO `oc_migrations` VALUES ('activity','2006Date20170808154933'),('activity','2006Date20170808155040'),('activity','2006Date20170919095939'),('activity','2007Date20181107114613'),('activity','2008Date20181011095117'),('activity','2010Date20190416112817'),('activity','2011Date20201006132544'),('activity','2011Date20201006132545'),('activity','2011Date20201006132546'),('activity','2011Date20201006132547'),('activity','2011Date20201207091915'),('calendar','2040Date20210908101001'),('calendar','3000Date20211109132439'),('calendar','3010Date20220111090252'),('calendar','4050Date20230614163505'),('circles','0022Date20220526111723'),('circles','0022Date20220526113601'),('circles','0022Date20220703115023'),('circles','0023Date20211216113101'),('circles','0024Date20220203123901'),('circles','0024Date20220203123902'),('circles','0024Date20220317190331'),('circles','0028Date20230705222601'),('contactsinteraction','010000Date20200304152605'),('core','13000Date20170705121758'),('core','13000Date20170718121200'),('core','13000Date20170814074715'),('core','13000Date20170919121250'),('core','13000Date20170926101637'),('core','14000Date20180129121024'),('core','14000Date20180404140050'),('core','14000Date20180516101403'),('core','14000Date20180518120534'),('core','14000Date20180522074438'),('core','14000Date20180626223656'),('core','14000Date20180710092004'),('core','14000Date20180712153140'),('core','15000Date20180926101451'),('core','15000Date20181015062942'),('core','15000Date20181029084625'),('core','16000Date20190207141427'),('core','16000Date20190212081545'),('core','16000Date20190427105638'),('core','16000Date20190428150708'),('core','17000Date20190514105811'),('core','18000Date20190920085628'),('core','18000Date20191014105105'),('core','18000Date20191204114856'),('core','19000Date20200211083441'),('core','20000Date20201109081915'),('core','20000Date20201109081918'),('core','20000Date20201109081919'),('core','20000Date20201111081915'),('core','21000Date20201120141228'),('core','21000Date20201202095923'),('core','21000Date20210119195004'),('core','21000Date20210309185126'),('core','21000Date20210309185127'),('core','22000Date20210216080825'),('core','23000Date20210721100600'),('core','23000Date20210906132259'),('core','23000Date20210930122352'),('core','23000Date20211203110726'),('core','23000Date20211213203940'),('core','24000Date20211210141942'),('core','24000Date20211213081506'),('core','24000Date20211213081604'),('core','24000Date20211222112246'),('core','24000Date20211230140012'),('core','24000Date20220131153041'),('core','24000Date20220202150027'),('core','24000Date20220404230027'),('core','24000Date20220425072957'),('core','25000Date20220515204012'),('core','25000Date20220602190540'),('core','25000Date20220905140840'),('core','25000Date20221007010957'),('core','27000Date20220613163520'),('core','27000Date20230309104325'),('core','27000Date20230309104802'),('core','28000Date20230616104802'),('core','28000Date20230728104802'),('core','28000Date20230803221055'),('core','28000Date20230906104802'),('core','28000Date20231004103301'),('core','28000Date20231103104802'),('core','28000Date20231126110901'),('core','29000Date20231126110901'),('core','29000Date20231213104850'),('core','29000Date20240124132201'),('core','29000Date20240124132202'),('core','29000Date20240131122720'),('dav','1004Date20170825134824'),('dav','1004Date20170919104507'),('dav','1004Date20170924124212'),('dav','1004Date20170926103422'),('dav','1005Date20180413093149'),('dav','1005Date20180530124431'),('dav','1006Date20180619154313'),('dav','1006Date20180628111625'),('dav','1008Date20181030113700'),('dav','1008Date20181105104826'),('dav','1008Date20181105104833'),('dav','1008Date20181105110300'),('dav','1008Date20181105112049'),('dav','1008Date20181114084440'),('dav','1011Date20190725113607'),('dav','1011Date20190806104428'),('dav','1012Date20190808122342'),('dav','1016Date20201109085907'),('dav','1017Date20210216083742'),('dav','1018Date20210312100735'),('dav','1024Date20211221144219'),('dav','1025Date20240308063933'),('dav','1027Date20230504122946'),('dav','1029Date20221114151721'),('dav','1029Date20231004091403'),('dav','1030Date20240205103243'),('federatedfilesharing','1010Date20200630191755'),('federatedfilesharing','1011Date20201120125158'),('federation','1010Date20200630191302'),('files','11301Date20191205150729'),('files','12101Date20221011153334'),('files_downloadlimit','000000Date20210910094923'),('files_reminders','10000Date20230725162149'),('files_sharing','11300Date20201120141438'),('files_sharing','21000Date20201223143245'),('files_sharing','22000Date20210216084241'),('files_sharing','24000Date20220208195521'),('files_sharing','24000Date20220404142216'),('files_trashbin','1010Date20200630192639'),('files_versions','1020Date20221114144058'),('forms','0010Date20190000000007'),('forms','010102Date20200323120846'),('forms','010200Date20200323141300'),('forms','020002Date20200729205932'),('forms','020200Date20210120082018'),('forms','020202Date20210311150843'),('forms','020300Date20210403214012'),('forms','020300Date20210406114130'),('forms','020300Date20210406133704'),('forms','030000Date20211206213004'),('forms','030000Date20220402100057'),('forms','030000Date20220402151229'),('forms','030000Date20220414203511'),('forms','030000Date20220705192811'),('forms','030000Date20220707130109'),('forms','030000Date20220831195000'),('forms','030000Date20220926200602'),('forms','030100Date20221231100426'),('forms','030100Date20230115214242'),('forms','030100Date20230123182700'),('forms','030100Date20230202175747'),('forms','030200Date20230307141800'),('forms','030400Date20230628011500'),('forms','040010Date20240122133700'),('forms','040200Date20240219201500'),('forms','040200Date20240402200139'),('forms','040200Date20240402224725'),('notifications','2004Date20190107135757'),('notifications','2010Date20210218082811'),('notifications','2010Date20210218082855'),('notifications','2011Date20210930134607'),('notifications','2011Date20220826074907'),('oauth2','010401Date20181207190718'),('oauth2','010402Date20190107124745'),('oauth2','011601Date20230522143227'),('oauth2','011602Date20230613160650'),('oauth2','011603Date20230620111039'),('photos','20000Date20220727125801'),('photos','20001Date20220830131446'),('photos','20003Date20221102170153'),('photos','20003Date20221103094628'),('privacy','100Date20190217131943'),('text','010000Date20190617184535'),('text','030001Date20200402075029'),('text','030201Date20201116110353'),('text','030201Date20201116123153'),('text','030501Date20220202101853'),('text','030701Date20230207131313'),('text','030901Date20231114150437'),('twofactor_backupcodes','1002Date20170607104347'),('twofactor_backupcodes','1002Date20170607113030'),('twofactor_backupcodes','1002Date20170919123342'),('twofactor_backupcodes','1002Date20170926101419'),('twofactor_backupcodes','1002Date20180821043638'),('updatenotification','011901Date20240305120000'),('user_status','0001Date20200602134824'),('user_status','0002Date20200902144824'),('user_status','1000Date20201111130204'),('user_status','1003Date20210809144824'),('user_status','1008Date20230921144701'),('workflowengine','2000Date20190808074233'),('workflowengine','2200Date20210805101925');
/*!40000 ALTER TABLE `oc_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mimetypes`
--

DROP TABLE IF EXISTS `oc_mimetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mimetypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mimetype` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mimetype_id_index` (`mimetype`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mimetypes`
--

LOCK TABLES `oc_mimetypes` WRITE;
/*!40000 ALTER TABLE `oc_mimetypes` DISABLE KEYS */;
INSERT INTO `oc_mimetypes` VALUES (3,'application'),(19,'application/gzip'),(18,'application/javascript'),(14,'application/octet-stream'),(4,'application/pdf'),(10,'application/vnd.oasis.opendocument.graphics'),(13,'application/vnd.oasis.opendocument.presentation'),(12,'application/vnd.oasis.opendocument.spreadsheet'),(11,'application/vnd.oasis.opendocument.text'),(7,'application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(1,'httpd'),(2,'httpd/unix-directory'),(8,'image'),(17,'image/jpeg'),(9,'image/png'),(20,'image/svg+xml'),(5,'text'),(6,'text/markdown'),(15,'video'),(16,'video/mp4');
/*!40000 ALTER TABLE `oc_mimetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mounts`
--

DROP TABLE IF EXISTS `oc_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage_id` bigint(20) NOT NULL,
  `root_id` bigint(20) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `mount_point` varchar(4000) NOT NULL,
  `mount_id` bigint(20) DEFAULT NULL,
  `mount_provider_class` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mounts_storage_index` (`storage_id`),
  KEY `mounts_root_index` (`root_id`),
  KEY `mounts_mount_id_index` (`mount_id`),
  KEY `mounts_user_root_path_index` (`user_id`,`root_id`,`mount_point`(128)),
  KEY `mounts_class_index` (`mount_provider_class`),
  KEY `mount_user_storage` (`storage_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mounts`
--

LOCK TABLES `oc_mounts` WRITE;
/*!40000 ALTER TABLE `oc_mounts` DISABLE KEYS */;
INSERT INTO `oc_mounts` VALUES (1,1,1,'next','/next/',NULL,'OC\\Files\\Mount\\LocalHomeMountProvider'),(2,3,118,'Brent','/Brent/',NULL,'OC\\Files\\Mount\\LocalHomeMountProvider');
/*!40000 ALTER TABLE `oc_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications`
--

DROP TABLE IF EXISTS `oc_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(32) NOT NULL,
  `user` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `object_type` varchar(64) NOT NULL,
  `object_id` varchar(64) NOT NULL,
  `subject` varchar(64) NOT NULL,
  `subject_parameters` longtext DEFAULT NULL,
  `message` varchar(64) DEFAULT NULL,
  `message_parameters` longtext DEFAULT NULL,
  `link` varchar(4000) DEFAULT NULL,
  `icon` varchar(4000) DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `oc_notifications_app` (`app`),
  KEY `oc_notifications_user` (`user`),
  KEY `oc_notifications_timestamp` (`timestamp`),
  KEY `oc_notifications_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications`
--

LOCK TABLES `oc_notifications` WRITE;
/*!40000 ALTER TABLE `oc_notifications` DISABLE KEYS */;
INSERT INTO `oc_notifications` VALUES (1,'firstrunwizard','next',1714125920,'app','recognize','apphint-recognize','[]','','[]','','','[]'),(2,'firstrunwizard','next',1714125920,'app','groupfolders','apphint-groupfolders','[]','','[]','','','[]'),(4,'firstrunwizard','next',1714125920,'app','deck','apphint-deck','[]','','[]','','','[]'),(5,'firstrunwizard','next',1714125920,'app','tasks','apphint-tasks','[]','','[]','','','[]'),(6,'forms','Brent',1714220066,'activity_notification','186','newshare','{\"userId\":\"next\",\"formTitle\":\"Interne bevraging TenurIT\",\"formHash\":\"coRf36SybCF26Q9Z\"}','','[]','','','[]');
/*!40000 ALTER TABLE `oc_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_pushhash`
--

DROP TABLE IF EXISTS `oc_notifications_pushhash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_pushhash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `token` int(11) NOT NULL DEFAULT 0,
  `deviceidentifier` varchar(128) NOT NULL,
  `devicepublickey` varchar(512) NOT NULL,
  `devicepublickeyhash` varchar(128) NOT NULL,
  `pushtokenhash` varchar(128) NOT NULL,
  `proxyserver` varchar(256) NOT NULL,
  `apptype` varchar(32) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oc_npushhash_uid` (`uid`,`token`),
  KEY `oc_npushhash_di` (`deviceidentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_pushhash`
--

LOCK TABLES `oc_notifications_pushhash` WRITE;
/*!40000 ALTER TABLE `oc_notifications_pushhash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_notifications_pushhash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_settings`
--

DROP TABLE IF EXISTS `oc_notifications_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `batch_time` int(11) NOT NULL DEFAULT 0,
  `last_send_id` bigint(20) NOT NULL DEFAULT 0,
  `next_send_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notset_user` (`user_id`),
  KEY `notset_nextsend` (`next_send_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_settings`
--

LOCK TABLES `oc_notifications_settings` WRITE;
/*!40000 ALTER TABLE `oc_notifications_settings` DISABLE KEYS */;
INSERT INTO `oc_notifications_settings` VALUES (1,'next',0,0,0),(2,'Brent',0,0,0);
/*!40000 ALTER TABLE `oc_notifications_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_access_tokens`
--

DROP TABLE IF EXISTS `oc_oauth2_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `hashed_code` varchar(128) NOT NULL,
  `encrypted_token` varchar(786) NOT NULL,
  `code_created_at` bigint(20) unsigned NOT NULL DEFAULT 0,
  `token_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_access_hash_idx` (`hashed_code`),
  KEY `oauth2_access_client_id_idx` (`client_id`),
  KEY `oauth2_tk_c_created_idx` (`token_count`,`code_created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_access_tokens`
--

LOCK TABLES `oc_oauth2_access_tokens` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_clients`
--

DROP TABLE IF EXISTS `oc_oauth2_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `client_identifier` varchar(64) NOT NULL,
  `secret` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_client_id_idx` (`client_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_clients`
--

LOCK TABLES `oc_oauth2_clients` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_open_local_editor`
--

DROP TABLE IF EXISTS `oc_open_local_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_open_local_editor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `path_hash` varchar(64) NOT NULL,
  `expiration_time` bigint(20) unsigned NOT NULL,
  `token` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openlocal_user_path_token` (`user_id`,`path_hash`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_open_local_editor`
--

LOCK TABLES `oc_open_local_editor` WRITE;
/*!40000 ALTER TABLE `oc_open_local_editor` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_open_local_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums`
--

DROP TABLE IF EXISTS `oc_photos_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums` (
  `album_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `created` bigint(20) NOT NULL,
  `location` varchar(255) NOT NULL,
  `last_added_photo` bigint(20) NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `pa_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums`
--

LOCK TABLES `oc_photos_albums` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums_collabs`
--

DROP TABLE IF EXISTS `oc_photos_albums_collabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums_collabs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL,
  `collaborator_id` varchar(64) NOT NULL,
  `collaborator_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `album_collabs_uniq_collab` (`album_id`,`collaborator_id`,`collaborator_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums_collabs`
--

LOCK TABLES `oc_photos_albums_collabs` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums_collabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums_collabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums_files`
--

DROP TABLE IF EXISTS `oc_photos_albums_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums_files` (
  `album_file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `added` bigint(20) NOT NULL,
  `owner` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`album_file_id`),
  UNIQUE KEY `paf_album_file` (`album_id`,`file_id`),
  KEY `paf_folder` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums_files`
--

LOCK TABLES `oc_photos_albums_files` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_preferences`
--

DROP TABLE IF EXISTS `oc_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_preferences` (
  `userid` varchar(64) NOT NULL DEFAULT '',
  `appid` varchar(32) NOT NULL DEFAULT '',
  `configkey` varchar(64) NOT NULL DEFAULT '',
  `configvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`userid`,`appid`,`configkey`),
  KEY `preferences_app_key` (`appid`,`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_preferences`
--

LOCK TABLES `oc_preferences` WRITE;
/*!40000 ALTER TABLE `oc_preferences` DISABLE KEYS */;
INSERT INTO `oc_preferences` VALUES ('Brent','activity','configured','yes'),('Brent','avatar','generated','true'),('Brent','core','lang','en'),('Brent','core','templateDirectory','Templates/'),('Brent','core','timezone','Europe/Brussels'),('Brent','dashboard','firstRun','0'),('Brent','files','quota','none'),('Brent','firstrunwizard','show','29.0.0'),('Brent','login','lastLogin','1714218485'),('Brent','notifications','sound_notification','no'),('Brent','notifications','sound_talk','no'),('Brent','password_policy','failedLoginAttempts','0'),('Brent','settings','email','brent.declercq2@student.hogent.be'),('Brent','settings','manager','[\"next\"]'),('next','activity','configured','yes'),('next','avatar','generated','true'),('next','core','lang','en'),('next','core','templateDirectory','Templates/'),('next','core','timezone','Europe/Brussels'),('next','dashboard','firstRun','0'),('next','files','lastSeenQuotaUsage','0.06'),('next','firstrunwizard','apphint','18'),('next','firstrunwizard','show','29.0.0'),('next','login','lastLogin','1714218475'),('next','login_token','qdWlrUkhJOvKSj58xFv20VF/rWoI7Ugi','1714126039'),('next','login_token','vczwNepn+InW6YAV3dNlbVHhIgVdkXl3','1714218535'),('next','notifications','sound_notification','no'),('next','notifications','sound_talk','no'),('next','password_policy','failedLoginAttempts','0');
/*!40000 ALTER TABLE `oc_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_privacy_admins`
--

DROP TABLE IF EXISTS `oc_privacy_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_privacy_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayname` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_privacy_admins`
--

LOCK TABLES `oc_privacy_admins` WRITE;
/*!40000 ALTER TABLE `oc_privacy_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_privacy_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_profile_config`
--

DROP TABLE IF EXISTS `oc_profile_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_profile_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `config` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_config_user_id_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_profile_config`
--

LOCK TABLES `oc_profile_config` WRITE;
/*!40000 ALTER TABLE `oc_profile_config` DISABLE KEYS */;
INSERT INTO `oc_profile_config` VALUES (1,'next','{\"address\":{\"visibility\":\"show_users_only\"},\"avatar\":{\"visibility\":\"show\"},\"biography\":{\"visibility\":\"show\"},\"displayname\":{\"visibility\":\"show\"},\"headline\":{\"visibility\":\"show\"},\"organisation\":{\"visibility\":\"show\"},\"role\":{\"visibility\":\"show\"},\"email\":{\"visibility\":\"show_users_only\"},\"phone\":{\"visibility\":\"show_users_only\"},\"twitter\":{\"visibility\":\"show\"},\"website\":{\"visibility\":\"show\"}}');
/*!40000 ALTER TABLE `oc_profile_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_properties`
--

DROP TABLE IF EXISTS `oc_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) NOT NULL DEFAULT '',
  `propertypath` varchar(255) NOT NULL DEFAULT '',
  `propertyname` varchar(255) NOT NULL DEFAULT '',
  `propertyvalue` longtext NOT NULL,
  `valuetype` smallint(6) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `properties_path_index` (`userid`,`propertypath`),
  KEY `properties_pathonly_index` (`propertypath`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_properties`
--

LOCK TABLES `oc_properties` WRITE;
/*!40000 ALTER TABLE `oc_properties` DISABLE KEYS */;
INSERT INTO `oc_properties` VALUES (1,'next','calendars/next/personal','{http://owncloud.org/ns}calendar-enabled','1',1);
/*!40000 ALTER TABLE `oc_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_ratelimit_entries`
--

DROP TABLE IF EXISTS `oc_ratelimit_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_ratelimit_entries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hash` varchar(128) NOT NULL,
  `delete_after` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ratelimit_hash` (`hash`),
  KEY `ratelimit_delete_after` (`delete_after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_ratelimit_entries`
--

LOCK TABLES `oc_ratelimit_entries` WRITE;
/*!40000 ALTER TABLE `oc_ratelimit_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_ratelimit_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_reactions`
--

DROP TABLE IF EXISTS `oc_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_reactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL,
  `message_id` bigint(20) unsigned NOT NULL,
  `actor_type` varchar(64) NOT NULL DEFAULT '',
  `actor_id` varchar(64) NOT NULL DEFAULT '',
  `reaction` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_reaction_unique` (`parent_id`,`actor_type`,`actor_id`,`reaction`),
  KEY `comment_reaction` (`reaction`),
  KEY `comment_reaction_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_reactions`
--

LOCK TABLES `oc_reactions` WRITE;
/*!40000 ALTER TABLE `oc_reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_recent_contact`
--

DROP TABLE IF EXISTS `oc_recent_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_recent_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_uid` varchar(64) NOT NULL,
  `uid` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `federated_cloud_id` varchar(255) DEFAULT NULL,
  `card` longblob NOT NULL,
  `last_contact` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recent_contact_actor_uid` (`actor_uid`),
  KEY `recent_contact_id_uid` (`id`,`actor_uid`),
  KEY `recent_contact_uid` (`uid`),
  KEY `recent_contact_email` (`email`),
  KEY `recent_contact_fed_id` (`federated_cloud_id`),
  KEY `recent_contact_last_contact` (`last_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_recent_contact`
--

LOCK TABLES `oc_recent_contact` WRITE;
/*!40000 ALTER TABLE `oc_recent_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_recent_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_schedulingobjects`
--

DROP TABLE IF EXISTS `oc_schedulingobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_schedulingobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedulobj_principuri_index` (`principaluri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_schedulingobjects`
--

LOCK TABLES `oc_schedulingobjects` WRITE;
/*!40000 ALTER TABLE `oc_schedulingobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_schedulingobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share`
--

DROP TABLE IF EXISTS `oc_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `share_type` smallint(6) NOT NULL DEFAULT 0,
  `share_with` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `uid_owner` varchar(64) NOT NULL DEFAULT '',
  `uid_initiator` varchar(64) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `item_type` varchar(64) NOT NULL DEFAULT '',
  `item_source` varchar(255) DEFAULT NULL,
  `item_target` varchar(255) DEFAULT NULL,
  `file_source` bigint(20) DEFAULT NULL,
  `file_target` varchar(512) DEFAULT NULL,
  `permissions` smallint(6) NOT NULL DEFAULT 0,
  `stime` bigint(20) NOT NULL DEFAULT 0,
  `accepted` smallint(6) NOT NULL DEFAULT 0,
  `expiration` datetime DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `mail_send` smallint(6) NOT NULL DEFAULT 0,
  `share_name` varchar(64) DEFAULT NULL,
  `password_by_talk` tinyint(1) DEFAULT 0,
  `note` longtext DEFAULT NULL,
  `hide_download` smallint(6) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  `attributes` longtext DEFAULT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`attributes`)),
  `password_expiration_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_share_type_index` (`item_type`,`share_type`),
  KEY `file_source_index` (`file_source`),
  KEY `token_index` (`token`),
  KEY `share_with_index` (`share_with`),
  KEY `parent_index` (`parent`),
  KEY `owner_index` (`uid_owner`),
  KEY `initiator_index` (`uid_initiator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share`
--

LOCK TABLES `oc_share` WRITE;
/*!40000 ALTER TABLE `oc_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share_external`
--

DROP TABLE IF EXISTS `oc_share_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share_external` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent` bigint(20) DEFAULT -1,
  `share_type` int(11) DEFAULT NULL,
  `remote` varchar(512) NOT NULL,
  `remote_id` varchar(255) DEFAULT '',
  `share_token` varchar(64) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `name` varchar(4000) NOT NULL,
  `owner` varchar(64) NOT NULL,
  `user` varchar(64) NOT NULL,
  `mountpoint` varchar(4000) NOT NULL,
  `mountpoint_hash` varchar(32) NOT NULL,
  `accepted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sh_external_mp` (`user`,`mountpoint_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share_external`
--

LOCK TABLES `oc_share_external` WRITE;
/*!40000 ALTER TABLE `oc_share_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_shares_limits`
--

DROP TABLE IF EXISTS `oc_shares_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_shares_limits` (
  `id` varchar(32) NOT NULL,
  `limit` bigint(20) NOT NULL,
  `downloads` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_shares_limits`
--

LOCK TABLES `oc_shares_limits` WRITE;
/*!40000 ALTER TABLE `oc_shares_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_shares_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages`
--

DROP TABLE IF EXISTS `oc_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages` (
  `numeric_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(64) DEFAULT NULL,
  `available` int(11) NOT NULL DEFAULT 1,
  `last_checked` int(11) DEFAULT NULL,
  PRIMARY KEY (`numeric_id`),
  UNIQUE KEY `storages_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages`
--

LOCK TABLES `oc_storages` WRITE;
/*!40000 ALTER TABLE `oc_storages` DISABLE KEYS */;
INSERT INTO `oc_storages` VALUES (1,'home::next',1,NULL),(2,'local::/var/www/html/nextcloud/data/',1,NULL),(3,'home::Brent',1,NULL);
/*!40000 ALTER TABLE `oc_storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages_credentials`
--

DROP TABLE IF EXISTS `oc_storages_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages_credentials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(64) DEFAULT NULL,
  `identifier` varchar(64) NOT NULL,
  `credentials` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocred_ui` (`user`,`identifier`),
  KEY `stocred_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages_credentials`
--

LOCK TABLES `oc_storages_credentials` WRITE;
/*!40000 ALTER TABLE `oc_storages_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_storages_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag`
--

DROP TABLE IF EXISTS `oc_systemtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `visibility` smallint(6) NOT NULL DEFAULT 1,
  `editable` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_ident` (`name`,`visibility`,`editable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag`
--

LOCK TABLES `oc_systemtag` WRITE;
/*!40000 ALTER TABLE `oc_systemtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_group`
--

DROP TABLE IF EXISTS `oc_systemtag_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_group` (
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `gid` varchar(255) NOT NULL,
  PRIMARY KEY (`gid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_group`
--

LOCK TABLES `oc_systemtag_group` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_object_mapping`
--

DROP TABLE IF EXISTS `oc_systemtag_object_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_object_mapping` (
  `objectid` varchar(64) NOT NULL DEFAULT '',
  `objecttype` varchar(64) NOT NULL DEFAULT '',
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`objecttype`,`objectid`,`systemtagid`),
  KEY `systag_by_tagid` (`systemtagid`,`objecttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_object_mapping`
--

LOCK TABLES `oc_systemtag_object_mapping` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text2image_tasks`
--

DROP TABLE IF EXISTS `oc_text2image_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text2image_tasks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `input` longtext NOT NULL,
  `status` int(11) DEFAULT 0,
  `number_of_images` int(11) NOT NULL DEFAULT 1,
  `user_id` varchar(64) DEFAULT NULL,
  `app_id` varchar(32) NOT NULL DEFAULT '',
  `identifier` varchar(255) DEFAULT '',
  `last_updated` datetime DEFAULT NULL,
  `completion_expected_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t2i_tasks_updated` (`last_updated`),
  KEY `t2i_tasks_status` (`status`),
  KEY `t2i_tasks_uid_appid_ident` (`user_id`,`app_id`,`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text2image_tasks`
--

LOCK TABLES `oc_text2image_tasks` WRITE;
/*!40000 ALTER TABLE `oc_text2image_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text2image_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_documents`
--

DROP TABLE IF EXISTS `oc_text_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_documents` (
  `id` bigint(20) unsigned NOT NULL,
  `current_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version_time` bigint(20) unsigned NOT NULL,
  `last_saved_version_etag` varchar(64) DEFAULT '',
  `base_version_etag` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_documents`
--

LOCK TABLES `oc_text_documents` WRITE;
/*!40000 ALTER TABLE `oc_text_documents` DISABLE KEYS */;
INSERT INTO `oc_text_documents` VALUES (38,0,0,1714125889,'684c9455f4340057d8a763508ffb5b31','662ce62cdaa42');
/*!40000 ALTER TABLE `oc_text_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_sessions`
--

DROP TABLE IF EXISTS `oc_text_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) DEFAULT NULL,
  `guest_name` varchar(64) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `token` varchar(64) NOT NULL,
  `document_id` bigint(20) NOT NULL,
  `last_contact` bigint(20) unsigned NOT NULL,
  `last_awareness_message` longtext DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rd_session_token_idx` (`token`),
  KEY `ts_lastcontact` (`last_contact`),
  KEY `ts_docid_lastcontact` (`document_id`,`last_contact`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_sessions`
--

LOCK TABLES `oc_text_sessions` WRITE;
/*!40000 ALTER TABLE `oc_text_sessions` DISABLE KEYS */;
INSERT INTO `oc_text_sessions` VALUES (1,'next',NULL,'#9750a4','qhyXqBDwH0EhgCG/y4wHB37acwZDX9wlyceo+87Yvl3tTAj7+KcLXWw4vRYqNCSO',38,1714218540,'AWABqLbrnAUBWHsidXNlciI6eyJuYW1lIjoibmV4dCIsImNsaWVudElkIjoxNDAyNjU3NTc2LCJjb2xvciI6IiM5NzUwYTQiLCJsYXN0VXBkYXRlIjoxNzE0MjE4NTQwfX0='),(2,'next',NULL,'#9750a4','PRu37HQcsTxtUhibJI/JWrhULalfRsf6bV0HE1DNUSqd6vc6tZhk22I6FsR7ZlpA',38,1714219675,'AWABm87aoAcBWHsidXNlciI6eyJuYW1lIjoibmV4dCIsImNsaWVudElkIjoxOTQ3NjQxNjI3LCJjb2xvciI6IiM5NzUwYTQiLCJsYXN0VXBkYXRlIjoxNzE0MjE5Njc2fX0=');
/*!40000 ALTER TABLE `oc_text_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_steps`
--

DROP TABLE IF EXISTS `oc_text_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_steps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned NOT NULL,
  `session_id` bigint(20) unsigned NOT NULL,
  `data` longtext NOT NULL,
  `version` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rd_steps_did_idx` (`document_id`),
  KEY `rd_steps_version_idx` (`version`),
  KEY `textstep_session` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_steps`
--

LOCK TABLES `oc_text_steps` WRITE;
/*!40000 ALTER TABLE `oc_text_steps` DISABLE KEYS */;
INSERT INTO `oc_text_steps` VALUES (1,38,1,'[\"AAK0AgEKAAAHAQdkZWZhdWx0AwdoZWFkaW5nBwAAAAYEAAABJldlbGNvbWUgdG8gTmV4dGNsb3VkISDwn5OxIOKYge+4jyDwn5K7KAAAAAVsZXZlbAF9ASgAAAACaWQBfygAAAAEdXVpZAF\\/hwAAAwlwYXJhZ3JhcGgHAAAjBgQAACSkAUhlcmUgeW91IGNhbiBhZGQgYSBkZXNjcmlwdGlvbiBvciBhbnkgb3RoZXIgaW5mbyByZWxldmFudCBmb3IgdGhlIGZvbGRlci4gSXQgd2lsbCBzaG93IGFzIGEgIlJlYWRtZS5tZCIgYW5kIGluIHRoZSB3ZWIgaW50ZXJmYWNlIGFsc28gZW1iZWRkZWQgbmljZWx5IHVwIGF0IHRoZSB0b3AuhwAjAwlwYXJhZ3JhcGgA\",\"AAJTAQKotuucBQCoACEBdxZoLXdlbGNvbWUtdG8tbmV4dGNsb3VkqAAiAXckYzQ0YTFhYTktOWVkMi00NDkyLWEwMDQtN2M1NDcxYThkMzMwAQABIQI=\"]',2147483647),(2,38,2,'[\"AAK0AgEKAAAHAQdkZWZhdWx0AwdoZWFkaW5nBwAAAAYEAAABJldlbGNvbWUgdG8gTmV4dGNsb3VkISDwn5OxIOKYge+4jyDwn5K7KAAAAAVsZXZlbAF9ASgAAAACaWQBfygAAAAEdXVpZAF\\/hwAAAwlwYXJhZ3JhcGgHAAAjBgQAACSkAUhlcmUgeW91IGNhbiBhZGQgYSBkZXNjcmlwdGlvbiBvciBhbnkgb3RoZXIgaW5mbyByZWxldmFudCBmb3IgdGhlIGZvbGRlci4gSXQgd2lsbCBzaG93IGFzIGEgIlJlYWRtZS5tZCIgYW5kIGluIHRoZSB3ZWIgaW50ZXJmYWNlIGFsc28gZW1iZWRkZWQgbmljZWx5IHVwIGF0IHRoZSB0b3AuhwAjAwlwYXJhZ3JhcGgA\",\"AAJTAQKbztqgBwCoACEBdxZoLXdlbGNvbWUtdG8tbmV4dGNsb3VkqAAiAXckZTk4NzZlN2ItYjdjMy00M2M2LTgxY2EtNmU5ZDExNjlkYjg2AQABIQI=\"]',2147483647);
/*!40000 ALTER TABLE `oc_text_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_textprocessing_tasks`
--

DROP TABLE IF EXISTS `oc_textprocessing_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_textprocessing_tasks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `input` longtext NOT NULL,
  `output` longtext DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `user_id` varchar(64) DEFAULT NULL,
  `app_id` varchar(32) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `last_updated` int(10) unsigned DEFAULT 0,
  `completion_expected_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tp_tasks_updated` (`last_updated`),
  KEY `tp_tasks_status_type_nonunique` (`status`,`type`),
  KEY `tp_tasks_uid_appid_ident` (`user_id`,`app_id`,`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_textprocessing_tasks`
--

LOCK TABLES `oc_textprocessing_tasks` WRITE;
/*!40000 ALTER TABLE `oc_textprocessing_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_textprocessing_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_trusted_servers`
--

DROP TABLE IF EXISTS `oc_trusted_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_trusted_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(512) NOT NULL,
  `url_hash` varchar(255) NOT NULL DEFAULT '',
  `token` varchar(128) DEFAULT NULL,
  `shared_secret` varchar(256) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `sync_token` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_hash` (`url_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_trusted_servers`
--

LOCK TABLES `oc_trusted_servers` WRITE;
/*!40000 ALTER TABLE `oc_trusted_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_trusted_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_backupcodes`
--

DROP TABLE IF EXISTS `oc_twofactor_backupcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_backupcodes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `code` varchar(128) NOT NULL,
  `used` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `twofactor_backupcodes_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_backupcodes`
--

LOCK TABLES `oc_twofactor_backupcodes` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_providers`
--

DROP TABLE IF EXISTS `oc_twofactor_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_providers` (
  `provider_id` varchar(32) NOT NULL,
  `uid` varchar(64) NOT NULL,
  `enabled` smallint(6) NOT NULL,
  PRIMARY KEY (`provider_id`,`uid`),
  KEY `twofactor_providers_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_providers`
--

LOCK TABLES `oc_twofactor_providers` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_providers` DISABLE KEYS */;
INSERT INTO `oc_twofactor_providers` VALUES ('backup_codes','Brent',0),('backup_codes','next',0);
/*!40000 ALTER TABLE `oc_twofactor_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_status`
--

DROP TABLE IF EXISTS `oc_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `status_timestamp` int(10) unsigned NOT NULL,
  `is_user_defined` tinyint(1) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `custom_icon` varchar(255) DEFAULT NULL,
  `custom_message` longtext DEFAULT NULL,
  `clear_at` int(10) unsigned DEFAULT NULL,
  `is_backup` tinyint(1) DEFAULT 0,
  `status_message_timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_status_uid_ix` (`user_id`),
  KEY `user_status_clr_ix` (`clear_at`),
  KEY `user_status_tstmp_ix` (`status_timestamp`),
  KEY `user_status_iud_ix` (`is_user_defined`,`status`),
  KEY `user_status_mtstmp_ix` (`status_message_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_status`
--

LOCK TABLES `oc_user_status` WRITE;
/*!40000 ALTER TABLE `oc_user_status` DISABLE KEYS */;
INSERT INTO `oc_user_status` VALUES (1,'next','offline',1714220287,0,NULL,NULL,NULL,NULL,0,0),(2,'Brent','offline',1714219545,0,NULL,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `oc_user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_transfer_owner`
--

DROP TABLE IF EXISTS `oc_user_transfer_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_transfer_owner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source_user` varchar(64) NOT NULL,
  `target_user` varchar(64) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `node_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_transfer_owner`
--

LOCK TABLES `oc_user_transfer_owner` WRITE;
/*!40000 ALTER TABLE `oc_user_transfer_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_user_transfer_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_users`
--

DROP TABLE IF EXISTS `oc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_users` (
  `uid` varchar(64) NOT NULL DEFAULT '',
  `displayname` varchar(64) DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `uid_lower` varchar(64) DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `user_uid_lower` (`uid_lower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_users`
--

LOCK TABLES `oc_users` WRITE;
/*!40000 ALTER TABLE `oc_users` DISABLE KEYS */;
INSERT INTO `oc_users` VALUES ('Brent',NULL,'1|$2y$10$zoybXlXf1W9j6kHlRcHD7uh6GWL1vFjNTwLvH8iWaXR9Cdp7qxUYm','brent'),('next',NULL,'1|$2y$10$/vzqoFbRnjqOy5ydustx5ed5fMN8sVDL0oA.nQ0ZJzsjgiJo1U8US','next');
/*!40000 ALTER TABLE `oc_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory`
--

DROP TABLE IF EXISTS `oc_vcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`),
  KEY `type_index` (`type`),
  KEY `category_index` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory`
--

LOCK TABLES `oc_vcategory` WRITE;
/*!40000 ALTER TABLE `oc_vcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory_to_object`
--

DROP TABLE IF EXISTS `oc_vcategory_to_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory_to_object` (
  `objid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `categoryid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`,`objid`,`type`),
  KEY `vcategory_objectd_index` (`objid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory_to_object`
--

LOCK TABLES `oc_vcategory_to_object` WRITE;
/*!40000 ALTER TABLE `oc_vcategory_to_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory_to_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_webauthn`
--

DROP TABLE IF EXISTS `oc_webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_webauthn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `public_key_credential_id` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webauthn_uid` (`uid`),
  KEY `webauthn_publicKeyCredentialId` (`public_key_credential_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_webauthn`
--

LOCK TABLES `oc_webauthn` WRITE;
/*!40000 ALTER TABLE `oc_webauthn` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_webauthn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_whats_new`
--

DROP TABLE IF EXISTS `oc_whats_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_whats_new` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(64) NOT NULL DEFAULT '11',
  `etag` varchar(64) NOT NULL DEFAULT '',
  `last_check` int(10) unsigned NOT NULL DEFAULT 0,
  `data` longtext NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`),
  KEY `version_etag_idx` (`version`,`etag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_whats_new`
--

LOCK TABLES `oc_whats_new` WRITE;
/*!40000 ALTER TABLE `oc_whats_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_whats_new` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-27 12:18:19
