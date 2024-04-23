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
INSERT INTO `oc_accounts` VALUES ('next','{\"displayname\":{\"value\":\"next\",\"scope\":\"v2-federated\",\"verified\":\"0\"},\"address\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"website\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"email\":{\"value\":null,\"scope\":\"v2-federated\",\"verified\":\"0\"},\"avatar\":{\"scope\":\"v2-federated\"},\"phone\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"twitter\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"fediverse\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"organisation\":{\"value\":\"\",\"scope\":\"v2-local\"},\"role\":{\"value\":\"\",\"scope\":\"v2-local\"},\"headline\":{\"value\":\"\",\"scope\":\"v2-local\"},\"biography\":{\"value\":\"\",\"scope\":\"v2-local\"},\"profile_enabled\":{\"value\":\"1\"}}');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts_data`
--

LOCK TABLES `oc_accounts_data` WRITE;
/*!40000 ALTER TABLE `oc_accounts_data` DISABLE KEYS */;
INSERT INTO `oc_accounts_data` VALUES (1,'next','displayname','next'),(2,'next','address',''),(3,'next','website',''),(4,'next','email',''),(5,'next','phone',''),(6,'next','twitter',''),(7,'next','fediverse',''),(8,'next','organisation',''),(9,'next','role',''),(10,'next','headline',''),(11,'next','biography',''),(12,'next','profile_enabled','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity`
--

LOCK TABLES `oc_activity` WRITE;
/*!40000 ALTER TABLE `oc_activity` DISABLE KEYS */;
INSERT INTO `oc_activity` VALUES (1,1713893100,30,'file_created','next','next','files','created_self','[{\"3\":\"\\/Documents\"}]','','[]','/Documents','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',3),(2,1713893100,30,'file_created','next','next','files','created_self','[{\"4\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',4),(3,1713893100,30,'file_changed','next','next','files','changed_self','[{\"4\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',4),(4,1713893100,30,'file_created','next','next','files','created_self','[{\"5\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',5),(5,1713893100,30,'file_changed','next','next','files','changed_self','[{\"5\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',5),(6,1713893100,30,'file_created','next','next','files','created_self','[{\"6\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',6),(7,1713893100,30,'file_changed','next','next','files','changed_self','[{\"6\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',6),(8,1713893100,30,'file_created','next','next','files','created_self','[{\"7\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',7),(9,1713893100,30,'file_changed','next','next','files','changed_self','[{\"7\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Documents','files',7),(10,1713893100,30,'file_created','next','next','files','created_self','[{\"8\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',8),(11,1713893100,30,'file_changed','next','next','files','changed_self','[{\"8\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',8),(12,1713893100,30,'file_created','next','next','files','created_self','[{\"9\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',9),(13,1713893101,30,'file_changed','next','next','files','changed_self','[{\"9\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',9),(14,1713893101,30,'file_created','next','next','files','created_self','[{\"10\":\"\\/Templates\"}]','','[]','/Templates','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',10),(15,1713893101,30,'file_created','next','next','files','created_self','[{\"11\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',11),(16,1713893101,30,'file_changed','next','next','files','changed_self','[{\"11\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',11),(17,1713893101,30,'file_created','next','next','files','created_self','[{\"12\":\"\\/Templates\\/Party invitation.odt\"}]','','[]','/Templates/Party invitation.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',12),(18,1713893101,30,'file_changed','next','next','files','changed_self','[{\"12\":\"\\/Templates\\/Party invitation.odt\"}]','','[]','/Templates/Party invitation.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',12),(19,1713893101,30,'file_created','next','next','files','created_self','[{\"13\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',13),(20,1713893101,30,'file_changed','next','next','files','changed_self','[{\"13\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',13),(21,1713893101,30,'file_created','next','next','files','created_self','[{\"14\":\"\\/Templates\\/Mother\'s day.odt\"}]','','[]','/Templates/Mother\'s day.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',14),(22,1713893101,30,'file_changed','next','next','files','changed_self','[{\"14\":\"\\/Templates\\/Mother\'s day.odt\"}]','','[]','/Templates/Mother\'s day.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',14),(23,1713893101,30,'file_created','next','next','files','created_self','[{\"15\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',15),(24,1713893101,30,'file_changed','next','next','files','changed_self','[{\"15\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',15),(25,1713893101,30,'file_created','next','next','files','created_self','[{\"16\":\"\\/Templates\\/Timesheet.ods\"}]','','[]','/Templates/Timesheet.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',16),(26,1713893101,30,'file_changed','next','next','files','changed_self','[{\"16\":\"\\/Templates\\/Timesheet.ods\"}]','','[]','/Templates/Timesheet.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',16),(27,1713893101,30,'file_created','next','next','files','created_self','[{\"17\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',17),(28,1713893101,30,'file_changed','next','next','files','changed_self','[{\"17\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',17),(29,1713893101,30,'file_created','next','next','files','created_self','[{\"18\":\"\\/Templates\\/Photo book.odt\"}]','','[]','/Templates/Photo book.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',18),(30,1713893101,30,'file_changed','next','next','files','changed_self','[{\"18\":\"\\/Templates\\/Photo book.odt\"}]','','[]','/Templates/Photo book.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',18),(31,1713893101,30,'file_created','next','next','files','created_self','[{\"19\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',19),(32,1713893101,30,'file_changed','next','next','files','changed_self','[{\"19\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',19),(33,1713893101,30,'file_created','next','next','files','created_self','[{\"20\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',20),(34,1713893101,30,'file_changed','next','next','files','changed_self','[{\"20\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',20),(35,1713893101,30,'file_created','next','next','files','created_self','[{\"21\":\"\\/Templates\\/Resume.odt\"}]','','[]','/Templates/Resume.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',21),(36,1713893101,30,'file_changed','next','next','files','changed_self','[{\"21\":\"\\/Templates\\/Resume.odt\"}]','','[]','/Templates/Resume.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',21),(37,1713893101,30,'file_created','next','next','files','created_self','[{\"22\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',22),(38,1713893101,30,'file_changed','next','next','files','changed_self','[{\"22\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',22),(39,1713893101,30,'file_created','next','next','files','created_self','[{\"23\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',23),(40,1713893101,30,'file_changed','next','next','files','changed_self','[{\"23\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',23),(41,1713893101,30,'file_created','next','next','files','created_self','[{\"24\":\"\\/Templates\\/Modern company.odp\"}]','','[]','/Templates/Modern company.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',24),(42,1713893101,30,'file_changed','next','next','files','changed_self','[{\"24\":\"\\/Templates\\/Modern company.odp\"}]','','[]','/Templates/Modern company.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',24),(43,1713893101,30,'file_created','next','next','files','created_self','[{\"25\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',25),(44,1713893101,30,'file_changed','next','next','files','changed_self','[{\"25\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',25),(45,1713893101,30,'file_created','next','next','files','created_self','[{\"26\":\"\\/Templates\\/Business model canvas.ods\"}]','','[]','/Templates/Business model canvas.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',26),(46,1713893102,30,'file_changed','next','next','files','changed_self','[{\"26\":\"\\/Templates\\/Business model canvas.ods\"}]','','[]','/Templates/Business model canvas.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',26),(47,1713893102,30,'file_created','next','next','files','created_self','[{\"27\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',27),(48,1713893102,30,'file_changed','next','next','files','changed_self','[{\"27\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',27),(49,1713893102,30,'file_created','next','next','files','created_self','[{\"28\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',28),(50,1713893102,30,'file_changed','next','next','files','changed_self','[{\"28\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',28),(51,1713893102,30,'file_created','next','next','files','created_self','[{\"29\":\"\\/Templates\\/Syllabus.odt\"}]','','[]','/Templates/Syllabus.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',29),(52,1713893102,30,'file_changed','next','next','files','changed_self','[{\"29\":\"\\/Templates\\/Syllabus.odt\"}]','','[]','/Templates/Syllabus.odt','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',29),(53,1713893102,30,'file_created','next','next','files','created_self','[{\"30\":\"\\/Templates\\/Gotong royong.odp\"}]','','[]','/Templates/Gotong royong.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',30),(54,1713893102,30,'file_changed','next','next','files','changed_self','[{\"30\":\"\\/Templates\\/Gotong royong.odp\"}]','','[]','/Templates/Gotong royong.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',30),(55,1713893102,30,'file_created','next','next','files','created_self','[{\"31\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',31),(56,1713893102,30,'file_changed','next','next','files','changed_self','[{\"31\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',31),(57,1713893102,30,'file_created','next','next','files','created_self','[{\"32\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',32),(58,1713893102,30,'file_changed','next','next','files','changed_self','[{\"32\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',32),(59,1713893102,30,'file_created','next','next','files','created_self','[{\"33\":\"\\/Templates\\/Yellow idea.odp\"}]','','[]','/Templates/Yellow idea.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',33),(60,1713893102,30,'file_changed','next','next','files','changed_self','[{\"33\":\"\\/Templates\\/Yellow idea.odp\"}]','','[]','/Templates/Yellow idea.odp','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',33),(61,1713893102,30,'file_created','next','next','files','created_self','[{\"34\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',34),(62,1713893102,30,'file_changed','next','next','files','changed_self','[{\"34\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',34),(63,1713893102,30,'file_created','next','next','files','created_self','[{\"35\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',35),(64,1713893102,30,'file_changed','next','next','files','changed_self','[{\"35\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Templates','files',35),(65,1713893102,30,'file_created','next','next','files','created_self','[{\"36\":\"\\/Templates credits.md\"}]','','[]','/Templates credits.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',36),(66,1713893102,30,'file_changed','next','next','files','changed_self','[{\"36\":\"\\/Templates credits.md\"}]','','[]','/Templates credits.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',36),(67,1713893102,30,'file_created','next','next','files','created_self','[{\"37\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',37),(68,1713893102,30,'file_changed','next','next','files','changed_self','[{\"37\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',37),(69,1713893102,30,'file_created','next','next','files','created_self','[{\"38\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',38),(70,1713893102,30,'file_changed','next','next','files','changed_self','[{\"38\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',38),(71,1713893102,30,'file_created','next','next','files','created_self','[{\"39\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',39),(72,1713893102,30,'file_changed','next','next','files','changed_self','[{\"39\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',39),(73,1713893102,30,'file_created','next','next','files','created_self','[{\"40\":\"\\/Photos\"}]','','[]','/Photos','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/','files',40),(74,1713893102,30,'file_created','next','next','files','created_self','[{\"41\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',41),(75,1713893102,30,'file_changed','next','next','files','changed_self','[{\"41\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',41),(76,1713893102,30,'file_created','next','next','files','created_self','[{\"42\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',42),(77,1713893102,30,'file_changed','next','next','files','changed_self','[{\"42\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',42),(78,1713893102,30,'file_created','next','next','files','created_self','[{\"43\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',43),(79,1713893103,30,'file_changed','next','next','files','changed_self','[{\"43\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',43),(80,1713893103,30,'file_created','next','next','files','created_self','[{\"44\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',44),(81,1713893103,30,'file_changed','next','next','files','changed_self','[{\"44\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',44),(82,1713893103,30,'file_created','next','next','files','created_self','[{\"45\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',45),(83,1713893103,30,'file_changed','next','next','files','changed_self','[{\"45\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',45),(84,1713893103,30,'file_created','next','next','files','created_self','[{\"46\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',46),(85,1713893103,30,'file_changed','next','next','files','changed_self','[{\"46\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',46),(86,1713893103,30,'file_created','next','next','files','created_self','[{\"47\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',47),(87,1713893103,30,'file_changed','next','next','files','changed_self','[{\"47\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',47),(88,1713893103,30,'file_created','next','next','files','created_self','[{\"48\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',48),(89,1713893103,30,'file_changed','next','next','files','changed_self','[{\"48\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',48),(90,1713893103,30,'file_created','next','next','files','created_self','[{\"49\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',49),(91,1713893103,30,'file_changed','next','next','files','changed_self','[{\"49\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://192.168.7.13/nextcloud/index.php/apps/files/?dir=/Photos','files',49);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbookchanges`
--

LOCK TABLES `oc_addressbookchanges` WRITE;
/*!40000 ALTER TABLE `oc_addressbookchanges` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbooks`
--

LOCK TABLES `oc_addressbooks` WRITE;
/*!40000 ALTER TABLE `oc_addressbooks` DISABLE KEYS */;
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
INSERT INTO `oc_appconfig` VALUES ('activity','enabled','yes',2,0),('activity','installed_version','2.21.1',2,0),('activity','types','filesystem',2,0),('backgroundjob','lastjob','3',2,0),('circles','enabled','yes',2,0),('circles','installed_version','29.0.0-dev',2,0),('circles','loopback_tmp_path','/nextcloud',2,0),('circles','loopback_tmp_scheme','http',2,0),('circles','types','filesystem,dav',2,0),('cloud_federation_api','enabled','yes',2,0),('cloud_federation_api','installed_version','1.12.0',2,0),('cloud_federation_api','types','filesystem',2,0),('comments','enabled','yes',2,0),('comments','installed_version','1.19.0',2,0),('comments','types','logging',2,0),('contactsinteraction','enabled','yes',2,0),('contactsinteraction','installed_version','1.10.0',2,0),('contactsinteraction','types','dav',2,0),('core','files_metadata','{\"photos-original_date_time\":{\"value\":null,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-exif\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}',2,0),('core','files_metadata_installed','1',2,0),('core','installedat','1713893096.2694',2,0),('core','lastcron','1713893262',8,0),('core','lastupdatedat','1713893096',8,0),('core','oc.integritycheck.checker','[]',64,1),('core','public_files','files_sharing/public.php',2,0),('core','vendor','nextcloud',2,0),('dashboard','enabled','yes',2,0),('dashboard','installed_version','7.9.0',2,0),('dashboard','types','',2,0),('dav','enabled','yes',2,0),('dav','installed_version','1.30.1',2,0),('dav','types','filesystem',2,0),('federatedfilesharing','enabled','yes',2,0),('federatedfilesharing','installed_version','1.19.0',2,0),('federatedfilesharing','types','',2,0),('federation','enabled','yes',2,0),('federation','installed_version','1.19.0',2,0),('federation','types','authentication',2,0),('files','enabled','yes',2,0),('files','installed_version','2.1.0',2,0),('files','types','filesystem',2,0),('files_downloadlimit','enabled','yes',2,0),('files_downloadlimit','installed_version','2.0.0',2,0),('files_downloadlimit','types','',2,0),('files_pdfviewer','enabled','yes',2,0),('files_pdfviewer','installed_version','2.10.0',2,0),('files_pdfviewer','types','',2,0),('files_reminders','enabled','yes',2,0),('files_reminders','installed_version','1.2.0',2,0),('files_reminders','types','',2,0),('files_sharing','enabled','yes',2,0),('files_sharing','installed_version','1.21.0',2,0),('files_sharing','types','filesystem',2,0),('files_trashbin','enabled','yes',2,0),('files_trashbin','installed_version','1.19.0',2,0),('files_trashbin','types','filesystem,dav',2,0),('files_versions','enabled','yes',2,0),('files_versions','installed_version','1.22.0',2,0),('files_versions','types','filesystem,dav',2,0),('firstrunwizard','enabled','yes',2,0),('firstrunwizard','installed_version','2.18.0',2,0),('firstrunwizard','types','logging',2,0),('logreader','enabled','yes',2,0),('logreader','installed_version','2.14.0',2,0),('logreader','types','logging',2,0),('lookup_server_connector','enabled','yes',2,0),('lookup_server_connector','installed_version','1.17.0',2,0),('lookup_server_connector','types','authentication',2,0),('nextcloud_announcements','enabled','yes',2,0),('nextcloud_announcements','installed_version','1.18.0',2,0),('nextcloud_announcements','types','logging',2,0),('notifications','enabled','yes',2,0),('notifications','installed_version','2.17.0',2,0),('notifications','types','logging',2,0),('oauth2','enabled','yes',2,0),('oauth2','installed_version','1.17.0',2,0),('oauth2','types','authentication',2,0),('password_policy','enabled','yes',2,0),('password_policy','installed_version','1.19.0',2,0),('password_policy','types','authentication',2,0),('photos','enabled','yes',2,0),('photos','installed_version','2.5.0',2,0),('photos','types','dav,authentication',2,0),('privacy','enabled','yes',2,0),('privacy','installed_version','1.13.0',2,0),('privacy','types','',2,0),('provisioning_api','enabled','yes',2,0),('provisioning_api','installed_version','1.19.0',2,0),('provisioning_api','types','prevent_group_restriction',2,0),('recommendations','enabled','yes',2,0),('recommendations','installed_version','2.1.0',2,0),('recommendations','types','',2,0),('related_resources','enabled','yes',2,0),('related_resources','installed_version','1.4.0',2,0),('related_resources','types','',2,0),('serverinfo','enabled','yes',2,0),('serverinfo','installed_version','1.19.0',2,0),('serverinfo','types','',2,0),('settings','enabled','yes',2,0),('settings','installed_version','1.12.0',2,0),('settings','types','',2,0),('sharebymail','enabled','yes',2,0),('sharebymail','installed_version','1.19.0',2,0),('sharebymail','types','filesystem',2,0),('support','enabled','yes',2,0),('support','installed_version','1.12.0',2,0),('support','types','session',2,0),('survey_client','enabled','yes',2,0),('survey_client','installed_version','1.17.0',2,0),('survey_client','types','',2,0),('systemtags','enabled','yes',2,0),('systemtags','installed_version','1.19.0',2,0),('systemtags','types','logging',2,0),('text','enabled','yes',2,0),('text','installed_version','3.10.0',2,0),('text','types','dav',2,0),('theming','enabled','yes',2,0),('theming','installed_version','2.4.0',2,0),('theming','types','logging',2,0),('twofactor_backupcodes','enabled','yes',2,0),('twofactor_backupcodes','installed_version','1.18.0',2,0),('twofactor_backupcodes','types','',2,0),('updatenotification','enabled','yes',2,0),('updatenotification','installed_version','1.19.1',2,0),('updatenotification','types','',2,0),('user_status','enabled','yes',2,0),('user_status','installed_version','1.9.0',2,0),('user_status','types','',2,0),('viewer','enabled','yes',2,0),('viewer','installed_version','2.3.0',2,0),('viewer','types','',2,0),('weather_status','enabled','yes',2,0),('weather_status','installed_version','1.9.0',2,0),('weather_status','types','',2,0),('workflowengine','enabled','yes',2,0),('workflowengine','installed_version','2.11.0',2,0),('workflowengine','types','filesystem',2,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authtoken`
--

LOCK TABLES `oc_authtoken` WRITE;
/*!40000 ALTER TABLE `oc_authtoken` DISABLE KEYS */;
INSERT INTO `oc_authtoken` VALUES (1,'next','next','aiomT6NqCSnMYoVqZA5iLd50HulGZIicHvY1qXdbFYnlIQDHcdcqZj0guKpJcGAv6faIe8FW4RPreC9RtAHLtrLj5YeNdYOd2PXjz3ny58Ib02tJf3kCuhTVzyNmKENryq1Oor8b0RuaIJTtpSoRch/ucBZifjFPJDudZD1I/4mmBUaRJyRU1wQcm1kIpw3AjCs/A9h+jVvQpYxFjTLFc3k/A4GjBbSookNj8XXLTxegiCzYdEiC3oNzImFhM6Q9s/5wxdIA9bm62ayN2ckEiISm4JpEMBN2/BJ/qTnXH1wZ8FQg2b6cnR7rcuLPa/zAZN3MVmpAzc7RPA+a2nZ9mA==','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36','7fbf7aa8a292c9e644a18d898df2ef28af31a9ba5ef013721a6382faf94addae0cd44bc2c8adc0594830272b3872953e5a9e562523d5ea4f5b77e067bd880506',0,0,1713893320,1713893103,NULL,NULL,'0ebb33828c05db59cfbc8f011ca3278726a2b1c8b2c1b4d25306b886e19815cfac7ad8bf7139834ff0882c45df2331a9e451671b463ad8ed17e6e28e599f11a63cb73f0aaf8350b9fd26009a49585c331a0a23c6e3378b0f3c67b624b6cd9ad2906c0634b7f40f0ab9011bb1c8c6c12ec77ef49d0f7ea60569d0c71697198206a773a44379a121440dc9ff5bbca7aacb14d4c59312eef096eaeb3127a737ed6ad598ae93acf2539cee6daac9eb9ee4b02a0923f6ab8d29529840fbb02a732a1ab6921c411b4298ab4ed87fd885b7ecfd39c1ea7519cb230d4b8ed88387cfbdbe3c79278f7c7bb1b2859b585d4457646e3a9a5ce752e237a280455e57441dfdd21563895217b093dfbfb4d707ee4156f938b5ae689a0fd375fc965dcede86b10ab97d16bca3c8f437f7e8b5436f6dea40904ff9942bef6f4d39001c5377bbc94fdb0d8e41797169e47894ee5a374e7b62a5b03071a4e1ef52c419583dbb48581a1dbbed0a67cf419c22b4fc2088e35e6e6452ff1bf603b36ff39122d408c124f899b9ed75154c3d70b3bf23cf7f34daa016537d0ca8884eaf50f37ebce46893703b56658e7d86139e78e88172391e93dc30cc425dab38367b0f08c08eab574e8aef7a467ad5e2ea33b481b5eda237c14e145380bf1c02ed777a769775eb0a97d7d5e182ef1b797713041b986d8e7140891d492df61d0ea6ce4b573f92148c81c020800a86ae28866afab2a4c5c10d159fad60e499f41b58a9c9109b6e8c7e47a5cd0b4ded14f11238bb9b49ab7a1b7c021a0bc49a4c6c51d20085b110d3368954ee5801774e9ded1ea3fb51d3c94b0d38a82874467cb0b1c328a733e31714c32e5fabe4f393c6841230b4688452e84f6e0a1aca84460706e77cf7c130efdbd048b24bbe44d110e125fd2423f6c065dbf35fdfc815cf37ff2ff6943a0bfeb4235f792817d97771c784559cc282644dc37f982c5a06305138633298e0ebc37279b10a34e6007cdcc9bf65ac20af276e87ae73e4e82110206da22992c27e53279ed03a54d06bbb93513f63947c1423c7e810036a76fbaaf5300105331c51294dc42d9a352f16c363f513e417cf86496c673f95b9eead4cdf0c85139acc3b5481dc6044e4a29dfeb3ad492eb40afd5774709b1aca38119cba4b378bb96b6617a54a4a083a13d18de8b2e59945c0ee75895dee786bc96f6dcf30ff075d0c636f1bd986384c4f1b16648dbcdc9969f1f6a90e1e3e1d35ead590fccaee4af2ce4bae3342a028998850959375f433ac13dfa465121f6bd849055a19f5e5b2cd44503d0bf0a921ccef299c17b81668413b0068ceb7e10180732d158a4b92638f55d62429c4e6955736c6794111cd140d68691f1134075a7a63bbfdfc9593feeaa7c5ceac4d2f3e09778584a875116028496b87d38cac6b5824e564f20db11cdfa6abc8f1aa36b929415afe7a8acd6796691c8317e193ff178cd4d6a2e5f70f53fea4a4385d3c802d26fc895aa2ce980eac236b087a556cd4459cf32eb273bab1a47eda8dac260869533ea6809f66d4f34751a4054d4d9aff0f482ae7f7b56de5f81264639e3a5f4e0bff890004a12f0973553cd2367b1978ee6f72d63d923caa16d47b155931891d9f0cbbe5eac7e627708eecc4564014deeb0c8cb9bd23ad8892a8c3b57e884b9e6ba0f26f968279336d3379ac0138405e524f8e318bbdf255adf9822c06981dbb45117ad1713adc7442eee15187956817f9085143bc8a371bb91a1e911a63bd30d810e525deec26d617d0077ecd32ff44af7bca48294379c1e2c2572de6c926710b4ceeee300713d9598f5e90b8a7ded5531c9b52d9ae80de29356ccd65528e3888981252296772e258101e526058a37b06ad67938a1e78d0383e8e7ea07cce141f07e65ca532d23f634f1e5c1e96f99dd4b703cf63f4ed529ef227131d1966f0e4053254fda20b99bd96964a4e81454a2af4c45d213d64523a0122408a673d29089dd72d046ddff47d92917936d2eedac09f9bf43297910e3161562c8d9bd9719194741bc14e8023e280a9a9ddb1f354c558a0be3429f03de15380cd2351dd9817ab74aad37e0a298a96d816416c5e4210e3f31267f3a3aab82ecd3d4a8b7dfe0e6d87998e259e8ce2fe07b38e3c9004af76fdd2e87965e4de2232257457ab244888201d89ee0a8d2a75f6af731bf9bfb9e4ee867112a991cb1caa332af04cc37f878ba128f43185d40497c9d1c34fed73e6c285ec5d3eb86ba1851fe18f4a63b525e6f2f70f13182f349c289d6089b446bc8a04f673a53524a21d5240f74e2f368512e5d17b7aceae719dd73b4b847b78a870c5ec5f6de7ad9aadef0b2a0d063cb1cc7e5e6bc56f2c94ca1c4f2cfb7acbdcfc6cc620dde7f170f7506802170cb559333950efcc3ab37bd3001b|705a310791bfe582ed118b37f22a4eb0|45f88536feaf954597f01784d9b4e18f93a16cf7e90974e373675a1cf1cd52c464e293f18d95b174e31f0714dbbdc6818e0c423bcabdef67b73a46d1aae4d56f|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArdG8NYU8LVuyfOFH6JQv\ndUG61rF3v7amo+1msXn8ywWZI1hmHExPZSkNEAYyGxtmGgJw4oErl/UnOjFojamM\nLASqg6w2deRpWMFNwbZP95i7WCK/TSyfjQGqen4mDfOw2/D18UVPIE3Njpq+vixn\nbvcay6fu9NSxhW9Y4j71SCNm3qIXLjfo08yBd3EqQhd264LqADroIaBw9dLss5zm\nrTvaetXMRccKRfuLkO051B8yUMMzJGeFN1pwOkqd/K5TokpK1yHCmrb64+JoWGKR\nERv9KTLkTjqXxU6lOnb3us/Jo/DzkuKrtiSUxt8ZSzezec9jQLWgAM6ZJFLFgR25\n9QIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'1|$2y$10$9mLFeRk7NCvEER.3tJnwE.b93KE.Ba0/iavmt9P2z/OSOYp.IjC7S');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarchanges`
--

LOCK TABLES `oc_calendarchanges` WRITE;
/*!40000 ALTER TABLE `oc_calendarchanges` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects`
--

LOCK TABLES `oc_calendarobjects` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects_props`
--

LOCK TABLES `oc_calendarobjects_props` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects_props` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendars`
--

LOCK TABLES `oc_calendars` WRITE;
/*!40000 ALTER TABLE `oc_calendars` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards`
--

LOCK TABLES `oc_cards` WRITE;
/*!40000 ALTER TABLE `oc_cards` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards_properties`
--

LOCK TABLES `oc_cards_properties` WRITE;
/*!40000 ALTER TABLE `oc_cards_properties` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_circle`
--

LOCK TABLES `oc_circles_circle` WRITE;
/*!40000 ALTER TABLE `oc_circles_circle` DISABLE KEYS */;
INSERT INTO `oc_circles_circle` VALUES (1,'RAYzBmV4JtgBGRi5rbKdumuakaPun7b','user:next:RAYzBmV4JtgBGRi5rbKdumuakaPun7b','next','','',1,1,'[]','','2024-04-23 17:25:00',0,''),(2,'CwSLNBJAquWeae844gy4gyLBgcjVdci','app:circles:CwSLNBJAquWeae844gy4gyLBgcjVdci','Circles','','',8193,10001,'[]','','2024-04-23 17:25:00',0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_member`
--

LOCK TABLES `oc_circles_member` WRITE;
/*!40000 ALTER TABLE `oc_circles_member` DISABLE KEYS */;
INSERT INTO `oc_circles_member` VALUES (1,'CwSLNBJAquWeae844gy4gyLBgcjVdci','CwSLNBJAquWeae844gy4gyLBgcjVdci','CwSLNBJAquWeae844gy4gyLBgcjVdci','circles',10000,'',NULL,9,'Member','[]','Circles','2024-04-23 17:25:00','',NULL,'2024-04-23 17:25:00'),(2,'RAYzBmV4JtgBGRi5rbKdumuakaPun7b','RAYzBmV4JtgBGRi5rbKdumuakaPun7b','RAYzBmV4JtgBGRi5rbKdumuakaPun7b','next',1,'','CwSLNBJAquWeae844gy4gyLBgcjVdci',9,'Member','[]','next','2024-04-23 17:25:00','',NULL,'2024-04-23 17:25:00');
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
INSERT INTO `oc_circles_membership` VALUES ('CwSLNBJAquWeae844gy4gyLBgcjVdci','CwSLNBJAquWeae844gy4gyLBgcjVdci',9,'CwSLNBJAquWeae844gy4gyLBgcjVdci','CwSLNBJAquWeae844gy4gyLBgcjVdci',1,'[\"CwSLNBJAquWeae844gy4gyLBgcjVdci\"]'),('RAYzBmV4JtgBGRi5rbKdumuakaPun7b','RAYzBmV4JtgBGRi5rbKdumuakaPun7b',9,'RAYzBmV4JtgBGRi5rbKdumuakaPun7b','RAYzBmV4JtgBGRi5rbKdumuakaPun7b',1,'[\"RAYzBmV4JtgBGRi5rbKdumuakaPun7b\"]');
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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_locks`
--

LOCK TABLES `oc_file_locks` WRITE;
/*!40000 ALTER TABLE `oc_file_locks` DISABLE KEYS */;
INSERT INTO `oc_file_locks` VALUES (1,0,'files/88b27fb6a1b0923cfcb5b3580df8187a',1713896926),(2,0,'files/22ff9f9d80152078508dc14bfd32cc0d',1713896707),(4,0,'files/3fa60956eccb079489960000a860b208',1713896764),(5,0,'files/bc03a7340966f7fd29ee50c672654343',1713896764),(6,0,'files/bd8dbf859ed5d1e840364d6b57f34820',1713896764),(7,0,'files/0a3f13577bf46b497117e37b0777aa04',1713896764),(8,0,'files/bc272bb99f8141c0348f2bccd5b7a8cf',1713896764),(9,0,'files/26cd301b2257ccf5308e0fe0742564d1',1713896764),(10,0,'files/fc1677dbfaff14890464e770c9993827',1713896764),(11,0,'files/b89b17442caa3b9cc77725856bfb649f',1713896764),(12,0,'files/d84a5d3253110c8c3042aefbe9056d2f',1713896764),(13,0,'files/ec5702649ad6708c1d1751927fb66ada',1713896764),(14,0,'files/ec1174e8c5ab11677cdec61f66d68f3f',1713896764),(15,0,'files/40ae106e7b3b35e22b8322ba1da6b154',1713896764),(16,0,'files/c2fe0dd4549c5c765f4c8b95dfef9fb9',1713896764),(17,0,'files/492c96f69c6d4beee5faee15512c19b1',1713896764),(18,0,'files/2387ffbae2ca980b3342133eb887345b',1713896764),(19,0,'files/c1278f30e17b349c7fffdac57a1c3842',1713896764),(20,0,'files/b67713751e4e36d6442aded017d602b2',1713896764),(21,0,'files/ac1f678a17b69ca1f04c643d1a02ef86',1713896764),(22,0,'files/c43ba57a3d1ddbbee055ef59f3a29eb6',1713896764),(23,0,'files/e1844e3c862dde4c1b08330dd836c689',1713896764),(24,0,'files/a929f746028fde5f102bb4ec6180916c',1713896764),(25,0,'files/72c58577ea3a8d070c09d73009af39e3',1713896764),(26,0,'files/d0518858fc6f76ef545b5fab6604d129',1713896764),(27,0,'files/60d84d982e990e1b4ee98e6ff3560298',1713896764),(28,0,'files/869e1ae58afd4b44fef8e718e86ec361',1713896764),(29,0,'files/aff8f818b45046cc550bdab04b4c3c71',1713896764),(30,0,'files/6aeaf180091100f621b661f3ec2b62aa',1713896764),(31,0,'files/d560127b849a1bcd25b11d3ee367817f',1713896764),(32,0,'files/bc115c6953da3fb9bda8d66e564eba83',1713896764),(33,0,'files/c2ec74ff30e11e8858d8b727be19c4c7',1713896764),(34,0,'files/df9a7b3227a83df5b102521dbabc1bab',1713896764),(35,0,'files/194daa21b04bb4644dc0827e4c483422',1713896764),(36,0,'files/254eb99006096f8c791777152717edce',1713896764),(37,0,'files/0e3f9219e1e3cc05b522363b76bd8d5f',1713896764),(38,0,'files/fc5d8d05952604517348dcbe4960776f',1713896764),(39,0,'files/6515d84f4ca79dbc69ae30e8834a5712',1713896764),(40,0,'files/85b0f6d3238be3d70af4534ad14d22fc',1713896764),(41,0,'files/630c5bae0e4cc98e3911aebfa1bdc1e5',1713896765),(42,0,'files/1dad66398962bb55ed07cfac89f3d7a8',1713896765),(43,0,'files/2a8882bde481e385981466da8601e357',1713896863),(45,0,'files/ef82fbaa71700370802a7079570d68c3',1713896926),(46,0,'files/6126d6dbca6600f0ff05f50031f83102',1713896863),(47,0,'files/b2965df67e514bb95b7d0219e5cbf00d',1713896765),(48,0,'files/900d5783a6b0f3d316ca85b3699310be',1713896765),(49,0,'files/a4d8f420aaa28ef040fd031e60bececd',1713896765),(50,0,'files/4a84d93fb5728b5a9d7e99a18f0e2c62',1713896765),(51,0,'files/1149474bcbd596be4f57b004465a10f5',1713896765),(52,0,'files/68c3215297190904d9578479141522f5',1713896765),(53,0,'files/aa8da9248fb07b86f929d9e0a0bd4da6',1713896765),(54,0,'files/fb68f6f23324273746cb33df7d01aa6d',1713896765),(57,0,'files/17dec6f9fd55c77ab817de72e4d6cd91',1713896863),(58,0,'files/a855812f4556f4d259f4cf3396fa8e36',1713896926),(61,0,'files/f63babdf3536069cac62b642f509ca1d',1713896863),(62,0,'files/c8c3db2f148568dcd1b0a8b0941c2f3b',1713896863),(65,0,'files/490dc15d28ed01c35f8263d095e57ae7',1713896863),(67,0,'files/4b45e4a2e0362741076f81f151c0e49a',1713896862),(69,0,'files/8f1e6c85b72f1b2ad79a5421c050fedd',1713896862),(71,0,'files/336202bfd0de34f77e8872988c265aeb',1713896862),(73,0,'files/d73ca12f71792b362413131abf958225',1713896862),(74,0,'files/ce76c43e93264cb1f4882d6fe26f9df5',1713896863),(75,0,'files/60665ac13e9a27fed53791f8ededf70c',1713896863),(76,0,'files/61bd6abb418b386350cf72f4ef42788f',1713896863),(77,0,'files/089f23f23bf549dc29817c827af37b5d',1713896863),(78,0,'files/9a6f1f1acf64d98565825d8d43af9960',1713896863),(79,0,'files/00151596af27711757e802038cae3b3d',1713896863),(80,0,'files/c5b8a890ece91e64024e3957133335d8',1713896863),(81,0,'files/4b9298b874405bdad7fc85c40ae87640',1713896863),(82,0,'files/2c9c9d92966ed05ed9a5b2e3d5a4d1be',1713896863),(87,0,'files/fb8bbbfed4ecab52b510d9f825b91c4d',1713896863),(88,0,'files/dd0f19fce90ec188dd756096b6d03814',1713896863),(89,0,'files/0a4fb085efe698c21cf10b4660dc8b00',1713896863),(90,0,'files/8a2e3b950f91788f055d6d3e14b50cf8',1713896863),(91,0,'files/720bbd983791524f8031788dad10fb85',1713896863),(92,0,'files/e2b9a444f6f63e7c982b8cdf087abd9d',1713896863),(93,0,'files/7dd75e1f159985ac138643fc83ffc846',1713896863),(94,0,'files/702486e11d855a186ee24b3cac95ff3d',1713896863),(95,0,'files/4b2336b8112b0f77760978da557dac7f',1713896863),(96,0,'files/a31f848a02d3721bbc888a48f44f7ce0',1713896863),(98,0,'files/2c830659606d0433be06cde653ea845e',1713896863),(100,0,'files/79193490dd4b04e04be30897f2f5a389',1713896863),(102,0,'files/80ea037c4b5869b6740911a82a0f1b90',1713896863),(103,0,'files/cd9c95b11c5ca5c59b6fc14bfc487784',1713896863),(104,0,'files/b02c6c5c3a40dcbabe956e6918ab06c2',1713896863),(105,0,'files/891cc8643d8cb22f3a5678ffdc41d11c',1713896863),(106,0,'files/9fb15032dfcd69ea7d9147869fee8b89',1713896863),(107,0,'files/d6f3f5bf34090d95e5248e1093d3d25b',1713896863),(108,0,'files/9d5a0fa63fe244ba90a3cd6786895ee6',1713896863),(112,0,'files/3d4757f149002546ce7d3589a2bd1cd6',1713896863),(113,0,'files/4501b179f48cdd1c36361f690c08682f',1713896863),(115,0,'files/8842547cfde672df8032ab5fe3aa33fa',1713896863),(116,0,'files/ce73fda184dd72d91a77fdf96116e649',1713896863),(118,0,'files/e06dce716744c7f4aa9281f14736e26c',1713896863),(119,0,'files/b7687d77090cba28c448b632348aaa78',1713896863),(120,0,'files/3a1563533c2c549123835156fcbf97a5',1713896863),(121,0,'files/e5680364a9ba8241db5f19c6c128ddfe',1713896863);
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
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache`
--

LOCK TABLES `oc_filecache` WRITE;
/*!40000 ALTER TABLE `oc_filecache` DISABLE KEYS */;
INSERT INTO `oc_filecache` VALUES (1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,38784812,1713893103,1713893100,0,0,'6627eeef62e39',23,''),(2,1,'files','45b963397aa40d4a0063e0d85e4fe7a1',1,'files',2,1,38784812,1713893103,1713893102,0,0,'6627eeef62e39',31,''),(3,1,'files/Documents','0ad78ba05b6961d92f7970b2b3922eca',2,'Documents',2,1,1108865,1713893100,1713893100,0,0,'6627eeecd90c8',31,''),(4,1,'files/Documents/Nextcloud flyer.pdf','9c5b4dc7182a7435767708ac3e8d126c',3,'Nextcloud flyer.pdf',4,3,1083339,1713893100,1713893100,0,0,'992c9a5c481767b49c7b86f7ba577fae',27,''),(5,1,'files/Documents/Example.md','efe0853470dd0663db34818b444328dd',3,'Example.md',6,5,1095,1713893100,1713893100,0,0,'644b52ea228175785c7b6c41ec2b2ae5',27,''),(6,1,'files/Documents/Welcome to Nextcloud Hub.docx','b44cb84f22ceddc4ca2826e026038091',3,'Welcome to Nextcloud Hub.docx',7,3,24295,1713893100,1713893100,0,0,'2f28a6acfca38e880643cb4373f1387c',27,''),(7,1,'files/Documents/Readme.md','51ec9e44357d147dd5c212b850f6910f',3,'Readme.md',6,5,136,1713893100,1713893100,0,0,'d8041d53b86b5f0342f5b77c22b42286',27,''),(8,1,'files/Nextcloud Manual.pdf','2bc58a43566a8edde804a4a97a9c7469',2,'Nextcloud Manual.pdf',4,3,16305464,1713893100,1713893100,0,0,'82f89fbea1a9541c0120cef0c802e0f8',27,''),(9,1,'files/Nextcloud.png','2bcc0ff06465ef1bfc4a868efde1e485',2,'Nextcloud.png',9,8,50598,1713893101,1713893101,0,0,'fb0ca047920f00e85d881e2cfc5b3c9c',27,''),(10,1,'files/Templates','530b342d0b8164ff3b4754c2273a453e',2,'Templates',2,1,10721152,1713893102,1713893102,0,0,'6627eeee7b2d0',31,''),(11,1,'files/Templates/Org chart.odg','fd846bc062b158abb99a75a5b33b53e7',10,'Org chart.odg',10,3,13878,1713893101,1713893101,0,0,'92ee6ea7b2c8dcbc71bae0c6ccf45f52',27,''),(12,1,'files/Templates/Party invitation.odt','439f95f734be87868374b1a5a312c550',10,'Party invitation.odt',11,3,868111,1713893101,1713893101,0,0,'efae31440f8a3c4a4274f292dbeeac0b',27,''),(13,1,'files/Templates/Product plan.md','a9fbf58bf31cebb8143f7ad3a5205633',10,'Product plan.md',6,5,573,1713893101,1713893101,0,0,'857233688f44674f4fdcbb2476c44a1a',27,''),(14,1,'files/Templates/Mother\'s day.odt','cb66c617dbb4acc9b534ec095c400b53',10,'Mother\'s day.odt',11,3,340061,1713893101,1713893101,0,0,'47421a02337cc7bf91aee50c7dc6a89e',27,''),(15,1,'files/Templates/Letter.odt','15545ade0e9863c98f3a5cc0fbf2836a',10,'Letter.odt',11,3,15961,1713893101,1713893101,0,0,'99274cc5a4e5bbc35dbb8db711fcaaf8',27,''),(16,1,'files/Templates/Timesheet.ods','cb79c81e41d3c3c77cd31576dc7f1a3a',10,'Timesheet.ods',12,3,88394,1713893101,1713893101,0,0,'e38de6939da3150e305d8f06d69fb6c2',27,''),(17,1,'files/Templates/Meeting notes.md','c0279758bb570afdcdbc2471b2f16285',10,'Meeting notes.md',6,5,326,1713893101,1713893101,0,0,'6ab82920b5812e65d8c6d748cafd43ea',27,''),(18,1,'files/Templates/Photo book.odt','ea35993988e2799424fef3ff4f420c24',10,'Photo book.odt',11,3,5155877,1713893101,1713893101,0,0,'7e3cf8215b0fa3f7d6f68a6218e22091',27,''),(19,1,'files/Templates/Mindmap.odg','74cff798fc1b9634ee45380599b2a6da',10,'Mindmap.odg',10,3,13653,1713893101,1713893101,0,0,'c5f4b68d3a8e93f654a21340308d902f',27,''),(20,1,'files/Templates/Elegant.odp','f3ec70ed694c0ca215f094b98eb046a7',10,'Elegant.odp',13,3,14316,1713893101,1713893101,0,0,'ba2b230ce498115d71679aafd4861eb8',27,''),(21,1,'files/Templates/Resume.odt','ace8f81202eadb2f0c15ba6ecc2539f5',10,'Resume.odt',11,3,39404,1713893101,1713893101,0,0,'4466a8c7a322a9d6ae14c6ebe4670765',27,''),(22,1,'files/Templates/SWOT analysis.whiteboard','3fd0e44b3e6f0e7144442ef6fc71a663',10,'SWOT analysis.whiteboard',14,3,38605,1713893101,1713893101,0,0,'108f461a6e44f7984c3c5e6d21fcd4c1',27,''),(23,1,'files/Templates/Expense report.ods','d0a4025621279b95d2f94ff4ec09eab3',10,'Expense report.ods',12,3,13441,1713893101,1713893101,0,0,'f45a383e87ee7428124fb43ef7f8191e',27,''),(24,1,'files/Templates/Modern company.odp','96ad2c06ebb6a79bcdf2f4030421dee3',10,'Modern company.odp',13,3,317015,1713893101,1713893101,0,0,'733f43b6b90507349be79ccb056a378b',27,''),(25,1,'files/Templates/Simple.odp','a2c90ff606d31419d699b0b437969c61',10,'Simple.odp',13,3,14810,1713893101,1713893101,0,0,'433f45ac2ead6a1a67d8a6ebc18733f7',27,''),(26,1,'files/Templates/Business model canvas.ods','86c10a47dedf156bf4431cb75e0f76ec',10,'Business model canvas.ods',12,3,52843,1713893101,1713893101,0,0,'db1b839807ddd6c21952d47c23ff8b19',27,''),(27,1,'files/Templates/Invoice.odt','40fdccb51b6c3e3cf20532e06ed5016e',10,'Invoice.odt',11,3,17276,1713893102,1713893102,0,0,'ccb8c5571c8b30aa27706f5949ba5b07',27,''),(28,1,'files/Templates/Flowchart.odg','832942849155883ceddc6f3cede21867',10,'Flowchart.odg',10,3,11836,1713893102,1713893102,0,0,'03d6813639182878db7b5645c270f751',27,''),(29,1,'files/Templates/Syllabus.odt','03b3147e6dae00674c1d50fe22bb8496',10,'Syllabus.odt',11,3,30354,1713893102,1713893102,0,0,'95e3e0960d47cde01ffdada0adaf94bb',27,''),(30,1,'files/Templates/Gotong royong.odp','14b958f5aafb7cfd703090226f3cbd1b',10,'Gotong royong.odp',13,3,3509628,1713893102,1713893102,0,0,'c9340f2debaa66a96fbdfeb644883a9b',27,''),(31,1,'files/Templates/Business model canvas.odg','6a8f3e02bdf45c8b0671967969393bcb',10,'Business model canvas.odg',10,3,16988,1713893102,1713893102,0,0,'ba2d860043a435bb00cda1cd82c76584',27,''),(32,1,'files/Templates/Impact effort matrix.whiteboard','c5e3b589ec8f9dd6afdebe0ac6feeac8',10,'Impact effort matrix.whiteboard',14,3,52674,1713893102,1713893102,0,0,'9fcc3371e765fc25a127029a4f30999a',27,''),(33,1,'files/Templates/Yellow idea.odp','3a57051288d7b81bef3196a2123f4af5',10,'Yellow idea.odp',13,3,81196,1713893102,1713893102,0,0,'07a80548b056ff5437e951cc660065e6',27,''),(34,1,'files/Templates/Diagram & table.ods','0a89f154655f6d4a0098bc4e6ca87367',10,'Diagram & table.ods',12,3,13378,1713893102,1713893102,0,0,'5ffd4c8d7a994b1b2cd96b827c4edf8d',27,''),(35,1,'files/Templates/Readme.md','71fa2e74ab30f39eed525572ccc3bbec',10,'Readme.md',6,5,554,1713893102,1713893102,0,0,'9a88521c4bb5b515e0902ff80da1c3ed',27,''),(36,1,'files/Templates credits.md','f7c01e3e0b55bb895e09dc08d19375b3',2,'Templates credits.md',6,5,2403,1713893102,1713893102,0,0,'b6476161934967f63ca107081c42c8d5',27,''),(37,1,'files/Reasons to use Nextcloud.pdf','418b19142a61c5bef296ea56ee144ca3',2,'Reasons to use Nextcloud.pdf',4,3,976625,1713893102,1713893102,0,0,'495270e6ce0037c54b312654b8fb7264',27,''),(38,1,'files/Readme.md','49af83716f8dcbfa89aaf835241c0b9f',2,'Readme.md',6,5,206,1713893102,1713893102,0,0,'a87734497258549a034d817d63df4e81',27,''),(39,1,'files/Nextcloud intro.mp4','e4919345bcc87d4585a5525daaad99c0',2,'Nextcloud intro.mp4',16,15,3963036,1713893102,1713893102,0,0,'6d30902f541ad935f6a6e87930807443',27,''),(40,1,'files/Photos','d01bb67e7b71dd49fd06bad922f521c9',2,'Photos',2,1,5656463,1713893103,1713893103,0,0,'6627eeef62e39',31,''),(41,1,'files/Photos/Frog.jpg','d6219add1a9129ed0c1513af985e2081',40,'Frog.jpg',17,8,457744,1713893102,1713893102,0,0,'4c627fa7a2c9cbbe439ff90aa4d2efde',27,''),(42,1,'files/Photos/Nextcloud community.jpg','b9b3caef83a2a1c20354b98df6bcd9d0',40,'Nextcloud community.jpg',17,8,797325,1713893102,1713893102,0,0,'f4fbd056617ad4b82f37cfe01c85ea90',27,''),(43,1,'files/Photos/Library.jpg','0b785d02a19fc00979f82f6b54a05805',40,'Library.jpg',17,8,2170375,1713893102,1713893102,0,0,'390a11982c9236981a7c357cfc32d43c',27,''),(44,1,'files/Photos/Birdie.jpg','cd31c7af3a0ec6e15782b5edd2774549',40,'Birdie.jpg',17,8,593508,1713893103,1713893103,0,0,'9222cee2e8c41692e85da20c3de55d21',27,''),(45,1,'files/Photos/Toucan.jpg','681d1e78f46a233e12ecfa722cbc2aef',40,'Toucan.jpg',17,8,167989,1713893103,1713893103,0,0,'2945cdb8626e7d954ebcdb7d98f1d5bf',27,''),(46,1,'files/Photos/Vineyard.jpg','14e5f2670b0817614acd52269d971db8',40,'Vineyard.jpg',17,8,427030,1713893103,1713893103,0,0,'f2dff11405f11007293905fe1aa8cef4',27,''),(47,1,'files/Photos/Steps.jpg','7b2ca8d05bbad97e00cbf5833d43e912',40,'Steps.jpg',17,8,567689,1713893103,1713893103,0,0,'e521943063e45587c0fa9306420a4f0c',27,''),(48,1,'files/Photos/Readme.md','2a4ac36bb841d25d06d164f291ee97db',40,'Readme.md',6,5,150,1713893103,1713893103,0,0,'70073081111fe4e1e037b84659332462',27,''),(49,1,'files/Photos/Gorilla.jpg','6d5f5956d8ff76a5f290cebb56402789',40,'Gorilla.jpg',17,8,474653,1713893103,1713893103,0,0,'9762ea9d1f5cfad264f32e97ca2f157a',27,''),(50,2,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,0,1713893107,1713893107,0,0,'6627eef3af938',23,''),(51,2,'appdata_ocndkx2jrkti','6f634b6f290af9368f2ec31e554d729c',50,'appdata_ocndkx2jrkti',2,1,0,1713893263,1713893263,0,0,'6627eef3271c0',31,''),(52,2,'appdata_ocndkx2jrkti/js','67db5271ec715742db47e4690defeb2e',51,'js',2,1,0,1713893107,1713893107,0,0,'6627eef329bed',31,''),(53,2,'appdata_ocndkx2jrkti/js/core','d22388a499039d12dc8d2287047933fe',52,'core',2,1,0,1713893107,1713893107,0,0,'6627eef32b436',31,''),(54,2,'appdata_ocndkx2jrkti/js/core/merged-template-prepend.js','1f17dcb0e4a0ddd99f24c6625a6df9e0',53,'merged-template-prepend.js',18,3,12288,1713893107,1713893107,0,0,'e7a259abfbd89c5efce24ec50b7b31b7',27,''),(55,2,'appdata_ocndkx2jrkti/js/core/merged-template-prepend.js.deps','258826697827a8dc65ebe12c43fe9b50',53,'merged-template-prepend.js.deps',14,3,290,1713893107,1713893107,0,0,'9d304d14c029854e0d27fdc8c14538d1',27,''),(56,2,'appdata_ocndkx2jrkti/js/core/merged-template-prepend.js.gzip','589f48dc0ca1fc0440c34387973c0d6d',53,'merged-template-prepend.js.gzip',19,3,3130,1713893107,1713893107,0,0,'f060802c3289ae892bcca429521bb47d',27,''),(57,2,'appdata_ocndkx2jrkti/theming','f04f99daa8feeb1ffa8abc65c85bcecc',51,'theming',2,1,0,1713893107,1713893107,0,0,'6627eef338f57',31,''),(58,2,'appdata_ocndkx2jrkti/theming/global','9ea50e34b9cd2b97e549b3136d429c6b',57,'global',2,1,0,1713893262,1713893262,0,0,'6627eef33aafd',31,''),(59,2,'appdata_ocndkx2jrkti/appstore','1a06319c6f82ae0837f3992b1f5c990c',51,'appstore',2,1,0,1713893113,1713893113,0,0,'6627eef3a6084',31,''),(60,2,'appdata_ocndkx2jrkti/appstore/apps.json','00bee4088ac9ce9e45bea24e1aa99c70',59,'apps.json',20,3,2525050,1713893113,1713893113,0,0,'3fafe7a92285130c929938c29e3d402e',27,''),(61,2,'appdata_ocndkx2jrkti/avatar','9640ea3bcf50845d97bfaaa0ddb9dbc3',51,'avatar',2,1,0,1713893164,1713893164,0,0,'6627ef2c688b2',31,''),(62,2,'appdata_ocndkx2jrkti/avatar/next','a6a2e6832042e5c74c420aee175d12c4',61,'next',2,1,0,1713893164,1713893164,0,0,'6627ef2c6eb1e',31,''),(63,2,'appdata_ocndkx2jrkti/preview','5d2e2a12aa56992cc615e21b4f91f17a',51,'preview',2,1,0,1713893164,1713893164,0,0,'6627ef2c7e647',31,''),(64,2,'appdata_ocndkx2jrkti/preview/f','e6478c7b050b4fb0d99afb629915f254',63,'f',2,1,-1,1713893164,1713893164,0,0,'6627ef2c8d19a',31,''),(65,2,'appdata_ocndkx2jrkti/avatar/next/avatar-dark.png','1ef60e0fd54b929235b39b422bd98530',62,'avatar-dark.png',9,8,13686,1713893262,1713893262,0,0,'cd1eac92bbef7c706eafa50d7ef15625',27,''),(66,2,'appdata_ocndkx2jrkti/preview/f/7','4db1c48cdbd05baf22b694ab0a1172e2',64,'7',2,1,-1,1713893164,1713893164,0,0,'6627ef2c8b836',31,''),(67,2,'appdata_ocndkx2jrkti/preview/6','c348684fc9a213bdaa691d72bebca784',63,'6',2,1,-1,1713893164,1713893164,0,0,'6627ef2c8e4cd',31,''),(68,2,'appdata_ocndkx2jrkti/preview/f/7/1','fcd3295135d99548c3bee4dcb59d4094',66,'1',2,1,-1,1713893164,1713893164,0,0,'6627ef2c8aa54',31,''),(69,2,'appdata_ocndkx2jrkti/preview/6/7','bfebbb3cea8f48599fcf7f138e60467b',67,'7',2,1,-1,1713893164,1713893164,0,0,'6627ef2c8d467',31,''),(70,2,'appdata_ocndkx2jrkti/preview/f/7/1/7','5428ba7db1dd9dde6379f266777b6850',68,'7',2,1,-1,1713893164,1713893164,0,0,'6627ef2c8999c',31,''),(71,2,'appdata_ocndkx2jrkti/preview/6/7/c','4351933c78b4cdba86a2b51508ec790a',69,'c',2,1,-1,1713893164,1713893164,0,0,'6627ef2c8bf9a',31,''),(72,2,'appdata_ocndkx2jrkti/preview/f/7/1/7/7','adf90cbe2170d346c3bde8edcbe49ddd',70,'7',2,1,-1,1713893164,1713893164,0,0,'6627ef2c88af7',31,''),(73,2,'appdata_ocndkx2jrkti/preview/6/7/c/6','03496ca88c629c76ac06c2a2b7250511',71,'6',2,1,-1,1713893164,1713893164,0,0,'6627ef2c8a15b',31,''),(74,2,'appdata_ocndkx2jrkti/preview/f/7/1/7/7/1','04d0242caf4dd993f3fadeb39194ab81',72,'1',2,1,-1,1713893164,1713893164,0,0,'6627ef2c8759d',31,''),(75,2,'appdata_ocndkx2jrkti/preview/6/c','1da009efbb9f57d67b47f5540fa22d36',67,'c',2,1,-1,1713893164,1713893164,0,0,'6627ef2c92b6c',31,''),(76,2,'appdata_ocndkx2jrkti/avatar/next/generated','26f22751bb4962b2f9498d2a2cda6604',62,'generated',14,3,0,1713893262,1713893262,0,0,'8795a37961ec59b1d4e018cdf115eb41',27,''),(77,2,'appdata_ocndkx2jrkti/preview/d','2ab22abdc032d41c75309f266db8c248',63,'d',2,1,-1,1713893164,1713893164,0,0,'6627ef2c93d38',31,''),(78,2,'appdata_ocndkx2jrkti/preview/f/7/1/7/7/1/6','888c6f978df30eba452350b5df503a54',74,'6',2,1,-1,1713893164,1713893164,0,0,'6627ef2c864ee',31,''),(79,2,'appdata_ocndkx2jrkti/preview/6/7/c/6/a','686b63b3c0c107689242cd24ae22b63e',73,'a',2,1,-1,1713893164,1713893164,0,0,'6627ef2c890a8',31,''),(80,2,'appdata_ocndkx2jrkti/preview/6/c/8','040cfaf8595e9cb11924ea6f75ef3053',75,'8',2,1,-1,1713893164,1713893164,0,0,'6627ef2c91e76',31,''),(81,2,'appdata_ocndkx2jrkti/preview/d/9','3bece363101094ce944d1e44f4f7b24a',77,'9',2,1,-1,1713893164,1713893164,0,0,'6627ef2c92a10',31,''),(82,2,'appdata_ocndkx2jrkti/preview/f/7/1/7/7/1/6/44','d60d1f053fb31d79405028a5ef997556',78,'44',2,1,0,1713893164,1713893164,0,0,'6627ef2c859ad',31,''),(83,2,'appdata_ocndkx2jrkti/preview/6/7/c/6/a/1','c8d43c3a89a3159c8aaf9fe4b938b0e0',79,'1',2,1,-1,1713893164,1713893164,0,0,'6627ef2c86e3f',31,''),(84,2,'appdata_ocndkx2jrkti/preview/d/9/d','4d65662c1bc57706743d7b81324e670b',81,'d',2,1,-1,1713893164,1713893164,0,0,'6627ef2c91be4',31,''),(85,2,'appdata_ocndkx2jrkti/preview/6/c/8/3','b70dfabe2b025dc223273fe7a098cbcc',80,'3',2,1,-1,1713893164,1713893164,0,0,'6627ef2c90e0c',31,''),(86,2,'appdata_ocndkx2jrkti/preview/6/7/c/6/a/1/e','905cad0236647ce2fecb27972d8cf687',83,'e',2,1,-1,1713893164,1713893164,0,0,'6627ef2c86070',31,''),(87,2,'appdata_ocndkx2jrkti/preview/d/9/d/4','a575ff36bd86078f0e18cf2a05f68978',84,'4',2,1,-1,1713893164,1713893164,0,0,'6627ef2c90a31',31,''),(88,2,'appdata_ocndkx2jrkti/preview/6/7/c/6/a/1/e/47','ea4d5524d9c2f4659d218c3ef0301adc',86,'47',2,1,0,1713893164,1713893164,0,0,'6627ef2c8517d',31,''),(89,2,'appdata_ocndkx2jrkti/preview/6/c/8/3/4','d13addb484c8c2680d9f36123844d204',85,'4',2,1,-1,1713893164,1713893164,0,0,'6627ef2c90458',31,''),(90,2,'appdata_ocndkx2jrkti/preview/d/9/d/4/f','db23809b7ee86569a0c88d4f8db01033',87,'f',2,1,-1,1713893164,1713893164,0,0,'6627ef2c8f0f3',31,''),(91,2,'appdata_ocndkx2jrkti/preview/6/c/8/3/4/9','74edf550fb0124f111167039931890c1',89,'9',2,1,-1,1713893164,1713893164,0,0,'6627ef2c8f654',31,''),(92,2,'appdata_ocndkx2jrkti/preview/d/9/d/4/f/4','c9bff6880372434ac03aa15edda77356',90,'4',2,1,-1,1713893164,1713893164,0,0,'6627ef2c8d848',31,''),(93,2,'appdata_ocndkx2jrkti/preview/6/c/8/3/4/9/c','f64689d0933b903788eab1192992030b',91,'c',2,1,-1,1713893164,1713893164,0,0,'6627ef2c8e1d7',31,''),(94,2,'appdata_ocndkx2jrkti/preview/d/9/d/4/f/4/9','824986b99fabfff5074c9de845f979d5',92,'9',2,1,-1,1713893164,1713893164,0,0,'6627ef2c8c333',31,''),(95,2,'appdata_ocndkx2jrkti/preview/6/c/8/3/4/9/c/45','a2fc8d28354ff110550e67982c3829fd',93,'45',2,1,0,1713893164,1713893164,0,0,'6627ef2c8b480',31,''),(96,2,'appdata_ocndkx2jrkti/avatar/next/avatar-dark.64.png','ff93f0eea3d5f3a6b6aa83e0c3ccd227',62,'avatar-dark.64.png',9,8,704,1713893164,1713893164,0,0,'398a29c630616c45a0fa1158b8bb8095',27,''),(97,2,'appdata_ocndkx2jrkti/preview/d/9/d/4/f/4/9/46','c8a793625e5a345eed4bbf15b4f4c06f',94,'46',2,1,0,1713893165,1713893165,0,0,'6627ef2c8ad54',31,''),(98,2,'appdata_ocndkx2jrkti/preview/f/7/1/7/7/1/6/44/1600-1067-max.jpg','4e0233db21d3816bc66bb4fe503b8a90',82,'1600-1067-max.jpg',17,8,165982,1713893164,1713893164,0,0,'03cd99eb15e125555b57cfb94d3d6f06',27,''),(99,2,'appdata_ocndkx2jrkti/preview/6/c/8/3/4/9/c/45/1600-1067-max.jpg','0994312d9f2fa46af87caa0ffa0ff6dd',95,'1600-1067-max.jpg',17,8,137923,1713893164,1713893164,0,0,'57e5000a5674e283e839f5be57d732bd',27,''),(100,2,'appdata_ocndkx2jrkti/preview/6/7/c/6/a/1/e/47/1200-1800-max.jpg','213dfcad2f5b366e5f3f66678d2c24ee',88,'1200-1800-max.jpg',17,8,207095,1713893164,1713893164,0,0,'79e18e6a763d2539a051cddd6f4499ae',27,''),(101,2,'appdata_ocndkx2jrkti/preview/f/7/1/7/7/1/6/44/256-256-crop.jpg','e87ef122a86b36055dfc1e9d41a97338',82,'256-256-crop.jpg',17,8,13155,1713893164,1713893164,0,0,'263ffeb5f5e99c75728fa006a4d1db0a',27,''),(102,2,'appdata_ocndkx2jrkti/preview/6/c/8/3/4/9/c/45/256-256-crop.jpg','3cec0afa1e97b65276f4e6504b2809dd',95,'256-256-crop.jpg',17,8,13780,1713893164,1713893164,0,0,'15e9e71e339aeea1876f21f68bb7e42b',27,''),(103,2,'appdata_ocndkx2jrkti/preview/d/9/d/4/f/4/9/46/1920-1281-max.jpg','c37f0f1a0afb88a82396505928ed9be0',97,'1920-1281-max.jpg',17,8,294390,1713893164,1713893164,0,0,'ed7a3285f33436af61290e270c5278c0',27,''),(104,2,'appdata_ocndkx2jrkti/preview/6/7/c/6/a/1/e/47/256-256-crop.jpg','4504b27fedd1da33726329a1da30e727',88,'256-256-crop.jpg',17,8,8560,1713893164,1713893164,0,0,'d2728c35282df65e8d7bd3d53417c2f3',27,''),(105,2,'appdata_ocndkx2jrkti/preview/6/4','440f79fb6f4ef069501b1e7df3f62a8d',67,'4',2,1,-1,1713893164,1713893164,0,0,'6627ef2cf1ae1',31,''),(106,2,'appdata_ocndkx2jrkti/preview/6/4/2','3d8eaef3023a5d24d9f525e68342922b',105,'2',2,1,-1,1713893164,1713893164,0,0,'6627ef2cf0849',31,''),(107,2,'appdata_ocndkx2jrkti/preview/6/4/2/e','c68b84e74a3e482bfe7edd44b5df80a3',106,'e',2,1,-1,1713893164,1713893164,0,0,'6627ef2cefe7d',31,''),(108,2,'appdata_ocndkx2jrkti/preview/6/4/2/e/9','395c5b86ca2d4254d821da8d4b382c7c',107,'9',2,1,-1,1713893164,1713893164,0,0,'6627ef2cef5aa',31,''),(109,2,'appdata_ocndkx2jrkti/preview/f/4','4c3afdb0293ab2f3e4d4ed647cc70a3b',64,'4',2,1,-1,1713893164,1713893164,0,0,'6627ef2d02ebf',31,''),(110,2,'appdata_ocndkx2jrkti/preview/6/4/2/e/9/2','dd3845f1799c69ba2b2008efaf2e9ec0',108,'2',2,1,-1,1713893164,1713893164,0,0,'6627ef2cee92a',31,''),(111,2,'appdata_ocndkx2jrkti/preview/f/4/5','d22918980cb29a86c3ef4552cd5f6711',109,'5',2,1,-1,1713893164,1713893164,0,0,'6627ef2d01a16',31,''),(112,2,'appdata_ocndkx2jrkti/preview/6/4/2/e/9/2/e','bc3f42d6ff5fa86bb3c67de43863a533',110,'e',2,1,-1,1713893164,1713893164,0,0,'6627ef2cedead',31,''),(113,2,'appdata_ocndkx2jrkti/preview/f/4/5/7','106348ba9a7f7e84cd155258d318aad0',111,'7',2,1,-1,1713893164,1713893164,0,0,'6627ef2d00ce9',31,''),(114,2,'appdata_ocndkx2jrkti/preview/6/4/2/e/9/2/e/48','690dd820c025f4f25b8c39b3e2d8bb25',112,'48',2,1,0,1713893165,1713893165,0,0,'6627ef2ceb9ed',31,''),(115,2,'appdata_ocndkx2jrkti/preview/f/4/5/7/c','777b4c837664721dac24107d01f81d36',113,'c',2,1,-1,1713893164,1713893164,0,0,'6627ef2cf1144',31,''),(116,2,'appdata_ocndkx2jrkti/preview/f/4/5/7/c/5','bbd74b523499694ef6c3aa3574d91d37',115,'5',2,1,-1,1713893164,1713893164,0,0,'6627ef2cef7d1',31,''),(117,2,'appdata_ocndkx2jrkti/preview/f/4/5/7/c/5/4','edfcaca111528277ec51e01a260d7dc8',116,'4',2,1,-1,1713893164,1713893164,0,0,'6627ef2cedcb3',31,''),(118,2,'appdata_ocndkx2jrkti/preview/f/4/5/7/c/5/4/49','d63a477badb8bbeba07ec616ec9f7b16',117,'49',2,1,0,1713893165,1713893165,0,0,'6627ef2ceb293',31,''),(119,2,'appdata_ocndkx2jrkti/preview/d/9/d/4/f/4/9/46/256-256-crop.jpg','a8971a60487adb44154658968790dab0',97,'256-256-crop.jpg',17,8,15764,1713893165,1713893165,0,0,'1a4a7340c1d32f086635a41219c918eb',27,''),(120,2,'appdata_ocndkx2jrkti/preview/0','f4556c13dd3d271723aa1849793675d0',63,'0',2,1,-1,1713893165,1713893165,0,0,'6627ef2d26b2c',31,''),(121,2,'appdata_ocndkx2jrkti/preview/0/2','2f9334e1b53703a59a9957cbb52e5e4c',120,'2',2,1,-1,1713893165,1713893165,0,0,'6627ef2d26232',31,''),(122,2,'appdata_ocndkx2jrkti/preview/0/2/e','47347300270d29d5cbc6cc38383c340d',121,'e',2,1,-1,1713893165,1713893165,0,0,'6627ef2d25d9e',31,''),(123,2,'appdata_ocndkx2jrkti/preview/f/4/5/7/c/5/4/49/1600-1067-max.jpg','d65c13c1fd4d75ced5edbb99c9f04409',118,'1600-1067-max.jpg',17,8,232378,1713893165,1713893165,0,0,'ebc9a7775a1ae04b925d9e2b6f28490f',27,''),(124,2,'appdata_ocndkx2jrkti/preview/0/2/e/7','278cfcf7d8056289ec1b4fc27bf99a18',122,'7',2,1,-1,1713893165,1713893165,0,0,'6627ef2d25596',31,''),(125,2,'appdata_ocndkx2jrkti/preview/6/4/2/e/9/2/e/48/4096-4096-max.png','751973580317431a18b9ac6681ec608d',114,'4096-4096-max.png',9,8,37125,1713893165,1713893165,0,0,'e5598dcd8551bfbd9e21bd0d563f49cc',27,''),(126,2,'appdata_ocndkx2jrkti/preview/0/2/e/7/4','babfd3c8096917709b3fc89de162c627',124,'4',2,1,-1,1713893165,1713893165,0,0,'6627ef2d25171',31,''),(127,2,'appdata_ocndkx2jrkti/preview/0/2/e/7/4/f','91b2bb9263bf8ddc1f283e25062e55b6',126,'f',2,1,-1,1713893165,1713893165,0,0,'6627ef2d24c95',31,''),(128,2,'appdata_ocndkx2jrkti/preview/0/2/e/7/4/f/1','3430e85c0c3c2aa8256b5cdc55471398',127,'1',2,1,-1,1713893165,1713893165,0,0,'6627ef2d244f9',31,''),(129,2,'appdata_ocndkx2jrkti/preview/0/2/e/7/4/f/1/27','7465d3d72071744066959e464fce4e16',128,'27',2,1,0,1713893165,1713893165,0,0,'6627ef2d23943',31,''),(130,2,'appdata_ocndkx2jrkti/preview/0/2/e/7/4/f/1/27/181-256-max.png','a3e7cdb695bd153725a9ba5b1f2267d7',129,'181-256-max.png',9,8,3547,1713893165,1713893165,0,0,'8e1dc229f409a5fc415a0689c9a890e0',27,''),(131,2,'appdata_ocndkx2jrkti/preview/0/2/e/7/4/f/1/27/181-181-crop.png','f1d16e8b5f1fc3126f0237e03c01f88a',129,'181-181-crop.png',9,8,7478,1713893165,1713893165,0,0,'e7575ebf16af39a4d4071548742649cd',27,''),(132,2,'appdata_ocndkx2jrkti/preview/f/4/5/7/c/5/4/49/256-256-crop.jpg','93844c9908410d96735e0facf73c7d03',118,'256-256-crop.jpg',17,8,13856,1713893165,1713893165,0,0,'9605ef62bdad76cf1c1d48a5a0cd008d',27,''),(133,2,'appdata_ocndkx2jrkti/preview/6/4/2/e/9/2/e/48/256-256-crop.png','b85a54b8b5d24358297f5649025dfe8f',114,'256-256-crop.png',9,8,6750,1713893165,1713893165,0,0,'97ac97b835bac33fccd700baaffc9c50',27,''),(134,2,'appdata_ocndkx2jrkti/theming/global/0','c7abf79a030717e481627a9a6013f8e5',58,'0',2,1,0,1713893262,1713893262,0,0,'6627ef8ed66a0',31,''),(135,2,'appdata_ocndkx2jrkti/theming/global/0/icon-core-#0082c9filetypes_image.svg','e21889b026e4fac578313e45d3bcce22',134,'icon-core-#0082c9filetypes_image.svg',21,8,378,1713893262,1713893262,0,0,'f4fadecc7fad94664b74a410ca624faa',27,''),(136,2,'appdata_ocndkx2jrkti/theming/global/0/icon-core-#0082c9filetypes_x-office-document.svg','36ae458d9c4e30fd0bf98c4f0033bfee',134,'icon-core-#0082c9filetypes_x-office-document.svg',21,8,304,1713893262,1713893262,0,0,'b17fc99e35eb9f357f7c843cfab262a9',27,''),(137,2,'appdata_ocndkx2jrkti/theming/global/0/icon-core-#0082c9filetypes_text.svg','dad8be32160523286b30ad293156ad3f',134,'icon-core-#0082c9filetypes_text.svg',21,8,299,1713893262,1713893262,0,0,'9828e2fbad86b842d35a2b2a684e39e0',27,''),(138,2,'appdata_ocndkx2jrkti/preview/d/6','dc09ddc63c9572fe4dc5b63c8636a655',77,'6',2,1,-1,1713893262,1713893262,0,0,'6627ef8f019a8',31,''),(139,2,'appdata_ocndkx2jrkti/preview/d/6/7','cb406d4a1c9b7883d9ca4f39ec9b53a2',138,'7',2,1,-1,1713893262,1713893262,0,0,'6627ef8f00bcb',31,''),(140,2,'appdata_ocndkx2jrkti/preview/d/6/7/d','acc3f696279bc3338348e4f69f8526f4',139,'d',2,1,-1,1713893262,1713893262,0,0,'6627ef8ef3bd6',31,''),(141,2,'appdata_ocndkx2jrkti/preview/d/6/7/d/8','1b688fa76c83b819920198b9c7595259',140,'8',2,1,-1,1713893262,1713893262,0,0,'6627ef8ef2794',31,''),(142,2,'appdata_ocndkx2jrkti/preview/d/6/7/d/8/a','562be770f68e7f5144f5f010e84596e5',141,'a',2,1,-1,1713893262,1713893262,0,0,'6627ef8ef1327',31,''),(143,2,'appdata_ocndkx2jrkti/preview/d/6/7/d/8/a/b','573c1679fca1758b552226f6d234797e',142,'b',2,1,-1,1713893262,1713893262,0,0,'6627ef8ef0a06',31,''),(144,2,'appdata_ocndkx2jrkti/preview/d/6/7/d/8/a/b/39','5c103a1905887b84a5003da41047c8b1',143,'39',2,1,0,1713893262,1713893262,0,0,'6627ef8ef027f',31,''),(145,2,'appdata_ocndkx2jrkti/preview/c','49dae4813dc79a22891bc5f71192b087',63,'c',2,1,-1,1713893263,1713893263,0,0,'6627ef8f08755',31,''),(146,2,'appdata_ocndkx2jrkti/preview/c/9','e9e4c45f0cd0328c10d0cd7cd47bd4eb',145,'9',2,1,-1,1713893263,1713893263,0,0,'6627ef8f07ba0',31,''),(147,2,'appdata_ocndkx2jrkti/preview/c/9/f','a48ce0faa998129998de776219563216',146,'f',2,1,-1,1713893263,1713893263,0,0,'6627ef8f07110',31,''),(148,2,'appdata_ocndkx2jrkti/preview/c/9/f/0','ff38f9295193d4af9ca2e6dc0fc542fb',147,'0',2,1,-1,1713893263,1713893263,0,0,'6627ef8f06044',31,''),(149,2,'appdata_ocndkx2jrkti/preview/c/9/f/0/f','c426c593111cfeda971dfddeedccfb62',148,'f',2,1,-1,1713893263,1713893263,0,0,'6627ef8f05171',31,''),(150,2,'appdata_ocndkx2jrkti/preview/c/9/f/0/f/8','b7da7969ebf08689c87273a3a7b8014c',149,'8',2,1,-1,1713893263,1713893263,0,0,'6627ef8f04565',31,''),(151,2,'appdata_ocndkx2jrkti/preview/c/9/f/0/f/8/9','f6dfdf463979560492a2f67173af305b',150,'9',2,1,-1,1713893263,1713893263,0,0,'6627ef8f03c0c',31,''),(152,2,'appdata_ocndkx2jrkti/preview/c/9/f/0/f/8/9/8','a90bfe6ca160c199d84e9e8af652aa55',151,'8',2,1,0,1713893263,1713893263,0,0,'6627ef8f0336d',31,''),(153,2,'appdata_ocndkx2jrkti/preview/a','b30c55ec2c27868f06475e4173d35f13',63,'a',2,1,-1,1713893263,1713893263,0,0,'6627ef8f21902',31,''),(154,2,'appdata_ocndkx2jrkti/preview/a/5','6346995ce8dccf79056c4a238c88336f',153,'5',2,1,-1,1713893263,1713893263,0,0,'6627ef8f24869',31,''),(155,2,'appdata_ocndkx2jrkti/preview/a/5/b','569c7878c6f2a901fee1b86c87d4eb3e',154,'b',2,1,-1,1713893263,1713893263,0,0,'6627ef8f1f579',31,''),(156,2,'appdata_ocndkx2jrkti/preview/a/5/b/f','97cc908c177577452789dc130f707351',155,'f',2,1,-1,1713893263,1713893263,0,0,'6627ef8f1d09b',31,''),(158,2,'appdata_ocndkx2jrkti/preview/a/5/b/f/c','a8692cafcb93cd4cfaf865ba854898ca',156,'c',2,1,-1,1713893263,1713893263,0,0,'6627ef8f1c5c9',31,''),(159,2,'appdata_ocndkx2jrkti/preview/a/5/b/f/c/9','39a0c4c4b913c51434f75c3e8e4e31fb',158,'9',2,1,-1,1713893263,1713893263,0,0,'6627ef8f1a9fa',31,''),(160,2,'appdata_ocndkx2jrkti/preview/a/5/7','fbc2c65c4ee90060b73dd08875929cd4',154,'7',2,1,-1,1713893263,1713893263,0,0,'6627ef8f2363f',31,''),(161,2,'appdata_ocndkx2jrkti/preview/a/5/b/f/c/9/e','945099bb4aecb0b0b061e7d92324b9e0',159,'e',2,1,-1,1713893263,1713893263,0,0,'6627ef8f193b2',31,''),(162,2,'appdata_ocndkx2jrkti/preview/a/5/b/f/c/9/e/37','016e3b29682aae3827cb3d672cae7296',161,'37',2,1,0,1713893263,1713893263,0,0,'6627ef8f18361',31,''),(163,2,'appdata_ocndkx2jrkti/preview/a/5/7/7','8b32821b039d9268f2b4fa58b4ddc0b6',160,'7',2,1,-1,1713893263,1713893263,0,0,'6627ef8f228f5',31,''),(164,2,'appdata_ocndkx2jrkti/preview/a/5/7/7/1','6c8cd6009794b930561fbfe4d8fd11dc',163,'1',2,1,-1,1713893263,1713893263,0,0,'6627ef8f2084f',31,''),(165,2,'appdata_ocndkx2jrkti/preview/a/5/7/7/1/b','32bd7953265c0bdbc406bf21f3fbaa4a',164,'b',2,1,-1,1713893263,1713893263,0,0,'6627ef8f1f586',31,''),(166,2,'appdata_ocndkx2jrkti/preview/a/5/7/7/1/b/c','35226398cf6995b349c78f3aff51bf2a',165,'c',2,1,-1,1713893263,1713893263,0,0,'6627ef8f1d296',31,''),(167,2,'appdata_ocndkx2jrkti/preview/1','4d573a2b775d5ceb3d7066d115a48650',63,'1',2,1,-1,1713893263,1713893263,0,0,'6627ef8f2fb48',31,''),(168,2,'appdata_ocndkx2jrkti/preview/1/9','162be5448e9a9d51748016ea39c130b7',167,'9',2,1,-1,1713893263,1713893263,0,0,'6627ef8f2eabc',31,''),(169,2,'appdata_ocndkx2jrkti/preview/a/5/7/7/1/b/c/38','636bd9c28b063ae3b4603f8062a19582',166,'38',2,1,0,1713893263,1713893263,0,0,'6627ef8f1c8f1',31,''),(170,2,'appdata_ocndkx2jrkti/preview/1/9/c','5a3342171b3a0e5c2e1442ce1b5232da',168,'c',2,1,-1,1713893263,1713893263,0,0,'6627ef8f2d62d',31,''),(171,2,'appdata_ocndkx2jrkti/preview/1/9/c/a','70160e53e14cda6ebb892453a3cdab3a',170,'a',2,1,-1,1713893263,1713893263,0,0,'6627ef8f2b748',31,''),(172,2,'appdata_ocndkx2jrkti/preview/1/9/c/a/1','01b471fd4aef50b1e0efe030e83a728a',171,'1',2,1,-1,1713893263,1713893263,0,0,'6627ef8f2a762',31,''),(173,2,'appdata_ocndkx2jrkti/preview/1/9/c/a/1/4','2f1cd39dba118c090d11a9ac998afd5b',172,'4',2,1,-1,1713893263,1713893263,0,0,'6627ef8f28769',31,''),(174,2,'appdata_ocndkx2jrkti/preview/1/9/c/a/1/4/e','d9133b88cce85349152813188aa66a31',173,'e',2,1,-1,1713893263,1713893263,0,0,'6627ef8f24f34',31,''),(175,2,'appdata_ocndkx2jrkti/preview/1/9/c/a/1/4/e/36','ebb26be3f8813b3112a105126d641261',174,'36',2,1,0,1713893263,1713893263,0,0,'6627ef8f23e3c',31,''),(176,2,'appdata_ocndkx2jrkti/preview/4','14451d73c2ff171d297a53cce6a1c6a2',63,'4',2,1,-1,1713893263,1713893263,0,0,'6627ef8f46bbc',31,''),(177,2,'appdata_ocndkx2jrkti/preview/4/5','12c269570c0238903d39817604a11df5',176,'5',2,1,-1,1713893263,1713893263,0,0,'6627ef8f458e2',31,''),(178,2,'appdata_ocndkx2jrkti/preview/4/5/c','dc4dfbfaa3f1ce3ba8a5ee14451aeee2',177,'c',2,1,-1,1713893263,1713893263,0,0,'6627ef8f44948',31,''),(179,2,'appdata_ocndkx2jrkti/preview/4/5/c/4','6f8a31d513df0fe8bbc9408f52f20cef',178,'4',2,1,-1,1713893263,1713893263,0,0,'6627ef8f43ef6',31,''),(180,2,'appdata_ocndkx2jrkti/preview/4/5/c/4/8','33e6ca2d4af6de8155260792c6095630',179,'8',2,1,-1,1713893263,1713893263,0,0,'6627ef8f43733',31,''),(181,2,'appdata_ocndkx2jrkti/preview/4/5/c/4/8/c','e1c9bfe89289ec3812c8720cda81f058',180,'c',2,1,-1,1713893263,1713893263,0,0,'6627ef8f42c72',31,''),(182,2,'appdata_ocndkx2jrkti/preview/4/5/c/4/8/c/c','dd5ca8a8f237ee24309104e38cf89eb4',181,'c',2,1,-1,1713893263,1713893263,0,0,'6627ef8f41f1c',31,''),(183,2,'appdata_ocndkx2jrkti/preview/4/5/c/4/8/c/c/9','6b41b7a2a5aba6493ce61318982a2cb9',182,'9',2,1,0,1713893263,1713893263,0,0,'6627ef8f3f9e4',31,''),(184,2,'appdata_ocndkx2jrkti/preview/a/5/7/7/1/b/c/38/4096-4096-max.png','ea435e93f09b3280da590e51f3484f32',169,'4096-4096-max.png',9,8,47771,1713893263,1713893263,0,0,'0ae53fbae222cbb1798a8f3d8bee288f',27,''),(185,2,'appdata_ocndkx2jrkti/preview/4/5/c/4/8/c/c/9/500-500-max.png','0fe9cb9e7dd50f22ae867a222cd4eb35',183,'500-500-max.png',9,8,50545,1713893263,1713893263,0,0,'abc7468064d5e04fad93ae11309bca93',27,''),(186,2,'appdata_ocndkx2jrkti/preview/4/5/c/4/8/c/c/9/64-64-crop.png','7c1272c45a166c59a916f331346b25b4',183,'64-64-crop.png',9,8,4459,1713893263,1713893263,0,0,'392eab33835b269681a157117b915c62',27,''),(187,2,'appdata_ocndkx2jrkti/text','0132cf41f553ed2372c15f0b2c874191',51,'text',2,1,0,1713893263,1713893263,0,0,'6627ef8f75f13',31,''),(188,2,'appdata_ocndkx2jrkti/text/documents','f21d86e79bb0dd35796e266ef212b05c',187,'documents',2,1,0,1713893326,1713893326,0,0,'6627ef8f78ddd',31,''),(189,2,'appdata_ocndkx2jrkti/preview/1/9/c/a/1/4/e/36/4096-4096-max.png','9b7dda48e7a262ea27dc21ae015963bd',175,'4096-4096-max.png',9,8,198133,1713893263,1713893263,0,0,'31cdd175cc1bd77b3b840073950b0b6d',27,''),(190,2,'appdata_ocndkx2jrkti/preview/1/9/c/a/1/4/e/36/64-64-crop.png','d86de2c3eeaa7b5c105b71c45a94b3cc',175,'64-64-crop.png',9,8,3254,1713893263,1713893263,0,0,'c0ec2c4885c006090397677e47ed4049',27,''),(191,2,'appdata_ocndkx2jrkti/preview/a/5/7/7/1/b/c/38/64-64-crop.png','32e9c18a8b72955ffbf51fea7c591840',169,'64-64-crop.png',9,8,1159,1713893263,1713893263,0,0,'42bb0a0c26756f885df756ae12aeea46',27,''),(192,2,'appdata_ocndkx2jrkti/text/documents/38.yjs','42861a01de42c85cc7e16fbee61fc1e4',188,'38.yjs',14,3,520,1713893326,1713893326,0,0,'6b77df0387c73b1d3823a1bdf5cb3278',27,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_metadata`
--

LOCK TABLES `oc_files_metadata` WRITE;
/*!40000 ALTER TABLE `oc_files_metadata` DISABLE KEYS */;
INSERT INTO `oc_files_metadata` VALUES (1,9,'{\"photos-original_date_time\":{\"value\":1713893101,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":500,\"height\":500},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','hNEjaDv','2024-04-23 17:25:01'),(2,39,'{\"photos-original_date_time\":{\"value\":1713893102,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0}}','EaVwp6z','2024-04-23 17:25:02'),(3,41,'{\"photos-original_date_time\":{\"value\":1341072915,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/500\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":1,\"ISOSpeedRatings\":8000,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 16:15:15\",\"DateTimeDigitized\":\"2012:06:30 16:15:15\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"9\\/1\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"6149\\/1087\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"280\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"134321\\/34\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":1,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.3.1\",\"DateTime\":\"2012:06:30 16:15:15\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','ZglcdUS','2024-04-23 17:25:02'),(4,42,'{\"photos-original_date_time\":{\"value\":1713893102,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":3000,\"height\":2000},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','3lly3Qd','2024-04-23 17:25:02'),(5,43,'{\"photos-original_date_time\":{\"value\":1341258636,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/80\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":400,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:07:02 19:50:36\",\"DateTimeDigitized\":\"2012:07:02 19:50:36\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"51\\/8\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"32\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1066,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"185679\\/47\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"GIMP 2.8.0\",\"DateTime\":\"2012:07:02 22:06:14\",\"Exif_IFD_Pointer\":198},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1066},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','vqRNdTe','2024-04-23 17:25:03'),(6,44,'{\"photos-original_date_time\":{\"value\":1341059531,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/125\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":3,\"ISOSpeedRatings\":320,\"UndefinedTag__x____\":320,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 12:32:11\",\"DateTimeDigitized\":\"2012:06:30 12:32:11\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"7\\/1\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"189284\\/33461\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"280\\/1\",\"SubSecTime\":\"83\",\"SubSecTimeOriginal\":\"83\",\"SubSecTimeDigitized\":\"83\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"1920000\\/487\",\"FocalPlaneYResolution\":\"320000\\/81\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"0000000000\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"DateTime\":\"2012:06:30 12:32:11\",\"Exif_IFD_Pointer\":174},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','JM6esoV','2024-04-23 17:25:03'),(7,45,'{\"photos-original_date_time\":{\"value\":1444907264,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/320\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":640,\"UndefinedTag__x____\":640,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2015:10:15 11:07:44\",\"DateTimeDigitized\":\"2015:10:15 11:07:44\",\"ShutterSpeedValue\":\"27970\\/3361\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"1\\/3\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"200\\/1\",\"SubSecTimeOriginal\":\"63\",\"SubSecTimeDigitized\":\"63\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"1600\\/1\",\"FocalPlaneYResolution\":\"1600\\/1\",\"FocalPlaneResolutionUnit\":3,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"000084121f\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"240\\/1\",\"YResolution\":\"240\\/1\",\"ResolutionUnit\":2,\"Software\":\"Adobe Photoshop Lightroom 6.2.1 (Macintosh)\",\"DateTime\":\"2015:10:16 14:40:21\",\"Exif_IFD_Pointer\":230},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','KbUUo2F','2024-04-23 17:25:03'),(8,46,'{\"photos-original_date_time\":{\"value\":1526500980,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"10\\/12500\",\"FNumber\":\"35\\/10\",\"ExposureProgram\":3,\"ISOSpeedRatings\":100,\"DateTimeOriginal\":\"2018:05:16 20:03:00\",\"DateTimeDigitized\":\"2018:05:16 20:03:00\",\"ExposureBiasValue\":\"0\\/6\",\"MaxApertureValue\":\"30\\/10\",\"MeteringMode\":5,\"LightSource\":0,\"Flash\":16,\"FocalLength\":\"700\\/10\",\"MakerNote\":\"Nikon\",\"UserComment\":\"Christoph WurstCC-SA 4.0\",\"SubSecTime\":\"30\",\"SubSecTimeOriginal\":\"30\",\"SubSecTimeDigitized\":\"30\",\"ColorSpace\":1,\"SensingMethod\":2,\"FileSource\":\"\",\"SceneType\":\"\",\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"DigitalZoomRatio\":\"1\\/1\",\"FocalLengthIn__mmFilm\":70,\"SceneCaptureType\":0,\"GainControl\":0,\"Contrast\":1,\"Saturation\":0,\"Sharpness\":1,\"SubjectDistanceRange\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"ImageDescription\":\"Christoph WurstCC-SA 4.0\",\"Make\":\"NIKON CORPORATION\",\"Model\":\"NIKON D610\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"GIMP 2.10.14\",\"DateTime\":\"2019:12:10 08:51:16\",\"Artist\":\"Christoph Wurst                     \",\"Copyright\":\"Christoph Wurst                                       \",\"Exif_IFD_Pointer\":402,\"GPS_IFD_Pointer\":13738,\"DateTimeOriginal\":\"2018:05:16 20:03:00\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1920,\"height\":1281},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','3wxiZUv','2024-04-23 17:25:03'),(9,47,'{\"photos-original_date_time\":{\"value\":1372319469,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/160\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":100,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2013:06:27 07:51:09\",\"DateTimeDigitized\":\"2013:06:27 07:51:09\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"59\\/8\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"2\\/3\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"45\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1200,\"ExifImageLength\":1800,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"185679\\/47\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"000052602c\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.4.5\",\"DateTime\":\"2013:06:27 07:51:09\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1200,\"height\":1800},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','rzNrBwP','2024-04-23 17:25:03'),(10,49,'{\"photos-original_date_time\":{\"value\":1341064060,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/640\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":1,\"ISOSpeedRatings\":12800,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 13:47:40\",\"DateTimeDigitized\":\"2012:06:30 13:47:40\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"75\\/8\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"6149\\/1087\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"235\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"134321\\/34\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":1,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.3.1\",\"DateTime\":\"2012:06:30 13:47:40\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','siZvceD','2024-04-23 17:25:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_metadata_index`
--

LOCK TABLES `oc_files_metadata_index` WRITE;
/*!40000 ALTER TABLE `oc_files_metadata_index` DISABLE KEYS */;
INSERT INTO `oc_files_metadata_index` VALUES (2,9,'photos-original_date_time',NULL,1713893101),(3,39,'photos-original_date_time',NULL,1713893102),(5,41,'photos-original_date_time',NULL,1341072915),(7,42,'photos-original_date_time',NULL,1713893102),(9,43,'photos-original_date_time',NULL,1341258636),(11,44,'photos-original_date_time',NULL,1341059531),(13,45,'photos-original_date_time',NULL,1444907264),(15,46,'photos-original_date_time',NULL,1526500980),(17,47,'photos-original_date_time',NULL,1372319469),(19,49,'photos-original_date_time',NULL,1341064060);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_versions`
--

LOCK TABLES `oc_files_versions` WRITE;
/*!40000 ALTER TABLE `oc_files_versions` DISABLE KEYS */;
INSERT INTO `oc_files_versions` VALUES (1,4,1713893100,1083339,4,'{\"author\":\"next\"}'),(2,5,1713893100,1095,6,'{\"author\":\"next\"}'),(3,6,1713893100,24295,7,'{\"author\":\"next\"}'),(4,7,1713893100,136,6,'{\"author\":\"next\"}'),(5,8,1713893100,16305464,4,'{\"author\":\"next\"}'),(6,9,1713893101,50598,9,'{\"author\":\"next\"}'),(7,11,1713893101,13878,10,'{\"author\":\"next\"}'),(8,12,1713893101,868111,11,'{\"author\":\"next\"}'),(9,13,1713893101,573,6,'{\"author\":\"next\"}'),(10,14,1713893101,340061,11,'{\"author\":\"next\"}'),(11,15,1713893101,15961,11,'{\"author\":\"next\"}'),(12,16,1713893101,88394,12,'{\"author\":\"next\"}'),(13,17,1713893101,326,6,'{\"author\":\"next\"}'),(14,18,1713893101,5155877,11,'{\"author\":\"next\"}'),(15,19,1713893101,13653,10,'{\"author\":\"next\"}'),(16,20,1713893101,14316,13,'{\"author\":\"next\"}'),(17,21,1713893101,39404,11,'{\"author\":\"next\"}'),(18,22,1713893101,38605,14,'{\"author\":\"next\"}'),(19,23,1713893101,13441,12,'{\"author\":\"next\"}'),(20,24,1713893101,317015,13,'{\"author\":\"next\"}'),(21,25,1713893101,14810,13,'{\"author\":\"next\"}'),(22,26,1713893101,52843,12,'{\"author\":\"next\"}'),(23,27,1713893102,17276,11,'{\"author\":\"next\"}'),(24,28,1713893102,11836,10,'{\"author\":\"next\"}'),(25,29,1713893102,30354,11,'{\"author\":\"next\"}'),(26,30,1713893102,3509628,13,'{\"author\":\"next\"}'),(27,31,1713893102,16988,10,'{\"author\":\"next\"}'),(28,32,1713893102,52674,14,'{\"author\":\"next\"}'),(29,33,1713893102,81196,13,'{\"author\":\"next\"}'),(30,34,1713893102,13378,12,'{\"author\":\"next\"}'),(31,35,1713893102,554,6,'{\"author\":\"next\"}'),(32,36,1713893102,2403,6,'{\"author\":\"next\"}'),(33,37,1713893102,976625,4,'{\"author\":\"next\"}'),(34,38,1713893102,206,6,'{\"author\":\"next\"}'),(35,39,1713893102,3963036,16,'{\"author\":\"next\"}'),(36,41,1713893102,457744,17,'{\"author\":\"next\"}'),(37,42,1713893102,797325,17,'{\"author\":\"next\"}'),(38,43,1713893102,2170375,17,'{\"author\":\"next\"}'),(39,44,1713893103,593508,17,'{\"author\":\"next\"}'),(40,45,1713893103,167989,17,'{\"author\":\"next\"}'),(41,46,1713893103,427030,17,'{\"author\":\"next\"}'),(42,47,1713893103,567689,17,'{\"author\":\"next\"}'),(43,48,1713893103,150,6,'{\"author\":\"next\"}'),(44,49,1713893103,474653,17,'{\"author\":\"next\"}');
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_jobs`
--

LOCK TABLES `oc_jobs` WRITE;
/*!40000 ALTER TABLE `oc_jobs` DISABLE KEYS */;
INSERT INTO `oc_jobs` VALUES (1,'OCA\\Files_Sharing\\DeleteOrphanedSharesJob','null',1713893107,1713893107,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(2,'OCA\\Files_Sharing\\ExpireSharesJob','null',1713893163,1713893163,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(3,'OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob','null',1713893262,1713893262,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(4,'OCA\\Federation\\SyncJob','null',0,1713893096,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(5,'OCA\\ServerInfo\\Jobs\\UpdateStorageStats','null',0,1713893096,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(6,'OCA\\Files_Versions\\BackgroundJob\\ExpireVersions','null',0,1713893096,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(7,'OCA\\UserStatus\\BackgroundJob\\ClearOldStatusesBackgroundJob','null',0,1713893096,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(8,'OCA\\Notifications\\BackgroundJob\\GenerateUserSettings','null',0,1713893097,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(9,'OCA\\Notifications\\BackgroundJob\\SendNotificationMails','null',0,1713893097,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(10,'OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash','null',0,1713893097,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(11,'OCA\\Photos\\Jobs\\AutomaticPlaceMapperJob','null',0,1713893097,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(12,'OCA\\WorkflowEngine\\BackgroundJobs\\Rotate','null',0,1713893097,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(13,'OCA\\Files\\BackgroundJob\\ScanFiles','null',0,1713893097,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(14,'OCA\\Files\\BackgroundJob\\DeleteOrphanedItems','null',0,1713893097,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(15,'OCA\\Files\\BackgroundJob\\CleanupFileLocks','null',0,1713893097,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(16,'OCA\\Files\\BackgroundJob\\CleanupDirectEditingTokens','null',0,1713893097,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(17,'OCA\\Files\\BackgroundJob\\DeleteExpiredOpenLocalEditor','null',0,1713893097,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(18,'OCA\\Support\\BackgroundJobs\\CheckSubscription','null',0,1713893097,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(19,'OCA\\NextcloudAnnouncements\\Cron\\Crawler','null',0,1713893097,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(20,'OCA\\Circles\\Cron\\Maintenance','null',0,1713893097,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(21,'OCA\\ContactsInteraction\\BackgroundJob\\CleanupJob','null',0,1713893098,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(22,'OCA\\Text\\Cron\\Cleanup','null',0,1713893098,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(23,'OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob','null',0,1713893098,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(24,'OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob','null',0,1713893098,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(25,'OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob','null',0,1713893098,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(26,'OCA\\DAV\\BackgroundJob\\EventReminderJob','null',0,1713893098,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(27,'OCA\\DAV\\BackgroundJob\\CalendarRetentionJob','null',0,1713893098,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(28,'OCA\\DAV\\BackgroundJob\\PruneOutdatedSyncTokensJob','null',0,1713893098,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(29,'OCA\\Activity\\BackgroundJob\\EmailNotification','null',0,1713893099,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(30,'OCA\\Activity\\BackgroundJob\\ExpireActivities','null',0,1713893099,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(31,'OCA\\Activity\\BackgroundJob\\DigestMail','null',0,1713893099,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(32,'OCA\\Activity\\BackgroundJob\\RemoveFormerActivitySettings','null',0,1713893099,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(33,'OCA\\UpdateNotification\\BackgroundJob\\UpdateAvailableNotifications','null',0,1713893099,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(34,'OCA\\FilesReminders\\BackgroundJob\\CleanUpReminders','null',0,1713893099,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(35,'OCA\\FilesReminders\\BackgroundJob\\ScheduledNotifications','null',0,1713893099,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(36,'OCA\\OAuth2\\BackgroundJob\\CleanupExpiredAuthorizationCode','null',0,1713893099,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(37,'OC\\Authentication\\Token\\TokenCleanupJob','null',0,1713893100,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(38,'OC\\Log\\Rotate','null',0,1713893100,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(39,'OC\\Preview\\BackgroundCleanupJob','null',0,1713893100,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(40,'OC\\TextProcessing\\RemoveOldTasksBackgroundJob','null',0,1713893100,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(41,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",4]',0,1713893100,0,0,'d460824b78c40b5edf22b21a8cc29e67',1),(42,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",5]',0,1713893100,0,0,'342812619ed300bd98d4cf95790ad7a6',1),(43,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",6]',0,1713893100,0,0,'5beb8544a75e0ea0d54ea79e82fd2e09',1),(44,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",7]',0,1713893100,0,0,'c3df8a79e209635befa2197b7892a460',1),(45,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",8]',0,1713893100,0,0,'0281f1578a23a58d34fd83621622f858',1),(46,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",9]',0,1713893101,0,0,'83ddc9f3ad248fd6e22cc23c7057e028',1),(47,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",11]',0,1713893101,0,0,'52a12f1e018e068b4ad2054d1a5e73f5',1),(48,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",12]',0,1713893101,0,0,'d9efb306327522663f3d6ac874c63564',1),(49,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",13]',0,1713893101,0,0,'693233ecce7ee2e1b048d5bec80cb3d4',1),(50,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",14]',0,1713893101,0,0,'3e317a3ac4756fb9395db1df8f12711e',1),(51,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",15]',0,1713893101,0,0,'9a023111d5ef6caa2ffe677b0be20986',1),(52,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",16]',0,1713893101,0,0,'662cd7fbe52ab2bf47d5b59840ff0ae5',1),(53,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",17]',0,1713893101,0,0,'dba5527b01929b1a3000991cfc55081b',1),(54,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",18]',0,1713893101,0,0,'23af84fa1eaceb8a31638c1413e3c49b',1),(55,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",19]',0,1713893101,0,0,'aae008a880f1173e39fa75cd2a77e784',1),(56,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",20]',0,1713893101,0,0,'ed9dd468221690b93604a34b0fcc04d9',1),(57,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",21]',0,1713893101,0,0,'9840b5d1f96bccf9583426145e16ea4d',1),(58,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",22]',0,1713893101,0,0,'0d338c116ea5b1ff89894a063352002f',1),(59,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",23]',0,1713893101,0,0,'56ebeb6238b2716a255a342555003bbe',1),(60,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",24]',0,1713893101,0,0,'4c75b0ee4c3d58b17897801d1c894c3a',1),(61,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",25]',0,1713893101,0,0,'1afd2b379b3bdb4ef07687733c527a60',1),(62,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",26]',0,1713893102,0,0,'2c225127f40782f600d1c6ba6fa60b0c',1),(63,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",27]',0,1713893102,0,0,'976ff65a24e45a7eabda0bd53a5d10a5',1),(64,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",28]',0,1713893102,0,0,'36c2864962cd21b2436bac6ed973ab49',1),(65,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",29]',0,1713893102,0,0,'7c81fd4855122afef5372e100088a6d9',1),(66,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",30]',0,1713893102,0,0,'451e79d22d86ed4464666820ff80a1dc',1),(67,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",31]',0,1713893102,0,0,'d95cb3f9f48b84b466b80148eb262718',1),(68,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",32]',0,1713893102,0,0,'eba853ce54fb0e3be4d3b289a20ffc3d',1),(69,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",33]',0,1713893102,0,0,'9df3635d7f8f2038b828d2923ac62183',1),(70,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",34]',0,1713893102,0,0,'a0e0ad6c4329edf85e9d5d4b09314c1a',1),(71,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",35]',0,1713893102,0,0,'b4c6069b849ba58505354e8764d02f41',1),(72,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",36]',0,1713893102,0,0,'5977874563570a182230cb37caf61909',1),(73,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",37]',0,1713893102,0,0,'e8e4b7e8690381e461c34239848a1549',1),(74,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",38]',0,1713893102,0,0,'e55289750b7be0b94c7154e4bb318038',1),(75,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",39]',0,1713893102,0,0,'bff8a2b42069c9ab5050800ab6ab24e8',1),(76,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",41]',0,1713893102,0,0,'8b0325f8b4a426d10d9dd582a45b496a',1),(77,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",42]',0,1713893102,0,0,'c2e5b13ade403fb42633e44ad58ebc69',1),(78,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",43]',0,1713893103,0,0,'8c59f626e1d9384871b611e0c728efba',1),(79,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",44]',0,1713893103,0,0,'d3fe7d549754c4a01c3d7d55af5e9910',1),(80,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",45]',0,1713893103,0,0,'0c17a36f331f509fbbdd55cefeca979a',1),(81,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",46]',0,1713893103,0,0,'b158ff9cd07ad130886e9be1b1f0b44b',1),(82,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",47]',0,1713893103,0,0,'32c54db59e7d453b9f8e124c44536eac',1),(83,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",48]',0,1713893103,0,0,'b93162ca0d2896d0d0c8518017fc17b5',1),(84,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"next\",49]',0,1713893103,0,0,'3357315ea995f97a240374a82430120e',1),(85,'OCA\\FirstRunWizard\\Notification\\BackgroundJob','{\"uid\":\"next\"}',0,1713893163,0,0,'afb9f6d2ed37b1358e0053a561ccb075',1);
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
INSERT INTO `oc_migrations` VALUES ('activity','2006Date20170808154933'),('activity','2006Date20170808155040'),('activity','2006Date20170919095939'),('activity','2007Date20181107114613'),('activity','2008Date20181011095117'),('activity','2010Date20190416112817'),('activity','2011Date20201006132544'),('activity','2011Date20201006132545'),('activity','2011Date20201006132546'),('activity','2011Date20201006132547'),('activity','2011Date20201207091915'),('circles','0022Date20220526111723'),('circles','0022Date20220526113601'),('circles','0022Date20220703115023'),('circles','0023Date20211216113101'),('circles','0024Date20220203123901'),('circles','0024Date20220203123902'),('circles','0024Date20220317190331'),('circles','0028Date20230705222601'),('contactsinteraction','010000Date20200304152605'),('core','13000Date20170705121758'),('core','13000Date20170718121200'),('core','13000Date20170814074715'),('core','13000Date20170919121250'),('core','13000Date20170926101637'),('core','14000Date20180129121024'),('core','14000Date20180404140050'),('core','14000Date20180516101403'),('core','14000Date20180518120534'),('core','14000Date20180522074438'),('core','14000Date20180626223656'),('core','14000Date20180710092004'),('core','14000Date20180712153140'),('core','15000Date20180926101451'),('core','15000Date20181015062942'),('core','15000Date20181029084625'),('core','16000Date20190207141427'),('core','16000Date20190212081545'),('core','16000Date20190427105638'),('core','16000Date20190428150708'),('core','17000Date20190514105811'),('core','18000Date20190920085628'),('core','18000Date20191014105105'),('core','18000Date20191204114856'),('core','19000Date20200211083441'),('core','20000Date20201109081915'),('core','20000Date20201109081918'),('core','20000Date20201109081919'),('core','20000Date20201111081915'),('core','21000Date20201120141228'),('core','21000Date20201202095923'),('core','21000Date20210119195004'),('core','21000Date20210309185126'),('core','21000Date20210309185127'),('core','22000Date20210216080825'),('core','23000Date20210721100600'),('core','23000Date20210906132259'),('core','23000Date20210930122352'),('core','23000Date20211203110726'),('core','23000Date20211213203940'),('core','24000Date20211210141942'),('core','24000Date20211213081506'),('core','24000Date20211213081604'),('core','24000Date20211222112246'),('core','24000Date20211230140012'),('core','24000Date20220131153041'),('core','24000Date20220202150027'),('core','24000Date20220404230027'),('core','24000Date20220425072957'),('core','25000Date20220515204012'),('core','25000Date20220602190540'),('core','25000Date20220905140840'),('core','25000Date20221007010957'),('core','27000Date20220613163520'),('core','27000Date20230309104325'),('core','27000Date20230309104802'),('core','28000Date20230616104802'),('core','28000Date20230728104802'),('core','28000Date20230803221055'),('core','28000Date20230906104802'),('core','28000Date20231004103301'),('core','28000Date20231103104802'),('core','28000Date20231126110901'),('core','29000Date20231126110901'),('core','29000Date20231213104850'),('core','29000Date20240124132201'),('core','29000Date20240124132202'),('core','29000Date20240131122720'),('dav','1004Date20170825134824'),('dav','1004Date20170919104507'),('dav','1004Date20170924124212'),('dav','1004Date20170926103422'),('dav','1005Date20180413093149'),('dav','1005Date20180530124431'),('dav','1006Date20180619154313'),('dav','1006Date20180628111625'),('dav','1008Date20181030113700'),('dav','1008Date20181105104826'),('dav','1008Date20181105104833'),('dav','1008Date20181105110300'),('dav','1008Date20181105112049'),('dav','1008Date20181114084440'),('dav','1011Date20190725113607'),('dav','1011Date20190806104428'),('dav','1012Date20190808122342'),('dav','1016Date20201109085907'),('dav','1017Date20210216083742'),('dav','1018Date20210312100735'),('dav','1024Date20211221144219'),('dav','1025Date20240308063933'),('dav','1027Date20230504122946'),('dav','1029Date20221114151721'),('dav','1029Date20231004091403'),('dav','1030Date20240205103243'),('federatedfilesharing','1010Date20200630191755'),('federatedfilesharing','1011Date20201120125158'),('federation','1010Date20200630191302'),('files','11301Date20191205150729'),('files','12101Date20221011153334'),('files_downloadlimit','000000Date20210910094923'),('files_reminders','10000Date20230725162149'),('files_sharing','11300Date20201120141438'),('files_sharing','21000Date20201223143245'),('files_sharing','22000Date20210216084241'),('files_sharing','24000Date20220208195521'),('files_sharing','24000Date20220404142216'),('files_trashbin','1010Date20200630192639'),('files_versions','1020Date20221114144058'),('notifications','2004Date20190107135757'),('notifications','2010Date20210218082811'),('notifications','2010Date20210218082855'),('notifications','2011Date20210930134607'),('notifications','2011Date20220826074907'),('oauth2','010401Date20181207190718'),('oauth2','010402Date20190107124745'),('oauth2','011601Date20230522143227'),('oauth2','011602Date20230613160650'),('oauth2','011603Date20230620111039'),('photos','20000Date20220727125801'),('photos','20001Date20220830131446'),('photos','20003Date20221102170153'),('photos','20003Date20221103094628'),('privacy','100Date20190217131943'),('text','010000Date20190617184535'),('text','030001Date20200402075029'),('text','030201Date20201116110353'),('text','030201Date20201116123153'),('text','030501Date20220202101853'),('text','030701Date20230207131313'),('text','030901Date20231114150437'),('twofactor_backupcodes','1002Date20170607104347'),('twofactor_backupcodes','1002Date20170607113030'),('twofactor_backupcodes','1002Date20170919123342'),('twofactor_backupcodes','1002Date20170926101419'),('twofactor_backupcodes','1002Date20180821043638'),('updatenotification','011901Date20240305120000'),('user_status','0001Date20200602134824'),('user_status','0002Date20200902144824'),('user_status','1000Date20201111130204'),('user_status','1003Date20210809144824'),('user_status','1008Date20230921144701'),('workflowengine','2000Date20190808074233'),('workflowengine','2200Date20210805101925');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mimetypes`
--

LOCK TABLES `oc_mimetypes` WRITE;
/*!40000 ALTER TABLE `oc_mimetypes` DISABLE KEYS */;
INSERT INTO `oc_mimetypes` VALUES (3,'application'),(19,'application/gzip'),(18,'application/javascript'),(20,'application/json'),(14,'application/octet-stream'),(4,'application/pdf'),(10,'application/vnd.oasis.opendocument.graphics'),(13,'application/vnd.oasis.opendocument.presentation'),(12,'application/vnd.oasis.opendocument.spreadsheet'),(11,'application/vnd.oasis.opendocument.text'),(7,'application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(1,'httpd'),(2,'httpd/unix-directory'),(8,'image'),(17,'image/jpeg'),(9,'image/png'),(21,'image/svg+xml'),(5,'text'),(6,'text/markdown'),(15,'video'),(16,'video/mp4');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mounts`
--

LOCK TABLES `oc_mounts` WRITE;
/*!40000 ALTER TABLE `oc_mounts` DISABLE KEYS */;
INSERT INTO `oc_mounts` VALUES (1,1,1,'next','/next/',NULL,'OC\\Files\\Mount\\LocalHomeMountProvider');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications`
--

LOCK TABLES `oc_notifications` WRITE;
/*!40000 ALTER TABLE `oc_notifications` DISABLE KEYS */;
INSERT INTO `oc_notifications` VALUES (1,'firstrunwizard','next',1713893163,'app','recognize','apphint-recognize','[]','','[]','','','[]'),(2,'firstrunwizard','next',1713893163,'app','groupfolders','apphint-groupfolders','[]','','[]','','','[]'),(3,'firstrunwizard','next',1713893163,'app','forms','apphint-forms','[]','','[]','','','[]'),(4,'firstrunwizard','next',1713893163,'app','deck','apphint-deck','[]','','[]','','','[]'),(5,'firstrunwizard','next',1713893163,'app','tasks','apphint-tasks','[]','','[]','','','[]');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_settings`
--

LOCK TABLES `oc_notifications_settings` WRITE;
/*!40000 ALTER TABLE `oc_notifications_settings` DISABLE KEYS */;
INSERT INTO `oc_notifications_settings` VALUES (1,'next',0,0,0);
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
INSERT INTO `oc_preferences` VALUES ('next','activity','configured','yes'),('next','avatar','generated','true'),('next','core','lang','en'),('next','core','templateDirectory','Templates/'),('next','dashboard','firstRun','0'),('next','files','lastSeenQuotaUsage','0.06'),('next','firstrunwizard','apphint','18'),('next','firstrunwizard','show','29.0.0'),('next','login','lastLogin','1713893100'),('next','notifications','sound_notification','no'),('next','notifications','sound_talk','no'),('next','password_policy','failedLoginAttempts','0');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_profile_config`
--

LOCK TABLES `oc_profile_config` WRITE;
/*!40000 ALTER TABLE `oc_profile_config` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_properties`
--

LOCK TABLES `oc_properties` WRITE;
/*!40000 ALTER TABLE `oc_properties` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages`
--

LOCK TABLES `oc_storages` WRITE;
/*!40000 ALTER TABLE `oc_storages` DISABLE KEYS */;
INSERT INTO `oc_storages` VALUES (1,'home::next',1,NULL),(2,'local::/var/www/html/nextcloud/data/',1,NULL);
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
INSERT INTO `oc_text_documents` VALUES (38,0,1,1713893102,'a87734497258549a034d817d63df4e81','6627ef8f7c633');
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
INSERT INTO `oc_text_sessions` VALUES (2,'next',NULL,'#9750a4','ccAkbaR4nSfEVpJOv18motrZdAUl/AE+vsO3jfAi7YLVLB05xRVKJrwzlATRdeWP',38,1713893326,'AWABj4q2pw8EWHsidXNlciI6eyJuYW1lIjoibmV4dCIsImNsaWVudElkIjo0MTA5MjA2Nzk5LCJjb2xvciI6IiM5NzUwYTQiLCJsYXN0VXBkYXRlIjoxNzEzODkzMjYyfX0=');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_steps`
--

LOCK TABLES `oc_text_steps` WRITE;
/*!40000 ALTER TABLE `oc_text_steps` DISABLE KEYS */;
INSERT INTO `oc_text_steps` VALUES (1,38,1,'[\"AAK0AgEKAAAHAQdkZWZhdWx0AwdoZWFkaW5nBwAAAAYEAAABJldlbGNvbWUgdG8gTmV4dGNsb3VkISDwn5OxIOKYge+4jyDwn5K7KAAAAAVsZXZlbAF9ASgAAAACaWQBfygAAAAEdXVpZAF\\/hwAAAwlwYXJhZ3JhcGgHAAAjBgQAACSkAUhlcmUgeW91IGNhbiBhZGQgYSBkZXNjcmlwdGlvbiBvciBhbnkgb3RoZXIgaW5mbyByZWxldmFudCBmb3IgdGhlIGZvbGRlci4gSXQgd2lsbCBzaG93IGFzIGEgIlJlYWRtZS5tZCIgYW5kIGluIHRoZSB3ZWIgaW50ZXJmYWNlIGFsc28gZW1iZWRkZWQgbmljZWx5IHVwIGF0IHRoZSB0b3AuhwAjAwlwYXJhZ3JhcGgA\",\"AAJTAQKPiranDwCoACEBdxZoLXdlbGNvbWUtdG8tbmV4dGNsb3VkqAAiAXckOWIwNTNhMDMtZDEzMC00YWZlLTk3Y2QtMzIxM2M3ZGQzZWQyAQABIQI=\"]',2147483647);
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
INSERT INTO `oc_twofactor_providers` VALUES ('backup_codes','next',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_status`
--

LOCK TABLES `oc_user_status` WRITE;
/*!40000 ALTER TABLE `oc_user_status` DISABLE KEYS */;
INSERT INTO `oc_user_status` VALUES (1,'next','online',1713893163,0,NULL,NULL,NULL,NULL,0,0);
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
INSERT INTO `oc_users` VALUES ('next',NULL,'1|$2y$10$mtP0A/u9dbhFYZs.J17.TOB2FAgbTdL3uSGtDnujeAMFDB8nnYFFy','next');
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

-- Dump completed on 2024-04-23 17:29:08
