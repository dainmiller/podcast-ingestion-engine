-- MySQL dump 10.17  Distrib 10.3.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 10.0.35.104    Database: sa1
-- ------------------------------------------------------
-- Server version	10.1.34-MariaDB

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
-- Table structure for table `APIKey`
--

DROP TABLE IF EXISTS `APIKey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APIKey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_DeviceMode` int(11) DEFAULT NULL,
  `keyString` varchar(127) DEFAULT NULL,
  `expiration` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `DeviceMode` (`id_DeviceMode`),
  KEY `key` (`keyString`,`id_DeviceMode`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdCampaign`
--

DROP TABLE IF EXISTS `AdCampaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdCampaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_item_description` varchar(200) DEFAULT NULL,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `id_RSSEpisode` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=578 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdCart`
--

DROP TABLE IF EXISTS `AdCart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdCart` (
  `id_AdCart` int(10) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT NULL,
  `id_Station_constraint` int(10) DEFAULT NULL,
  `time_trigger` int(10) DEFAULT NULL,
  `feed_number_trigger` smallint(10) DEFAULT NULL,
  `id_RSSFeed_trigger` int(10) DEFAULT NULL,
  `impression_constraint` int(10) DEFAULT NULL,
  `total_listening_time_constraint` varchar(10) DEFAULT NULL,
  `time_less_than` int(11) NOT NULL DEFAULT '0',
  `time_greater_than` int(11) NOT NULL DEFAULT '0',
  `test_group_constraint` int(10) DEFAULT NULL,
  `id_Population_constraint` int(10) DEFAULT NULL,
  `id_Protocol_constraint` int(11) DEFAULT NULL,
  `zip_code_constraint` int(10) DEFAULT NULL,
  `zip_radius_constraint` smallint(10) DEFAULT NULL,
  `version_constraint` int(10) DEFAULT NULL,
  `id_RSSFeed` int(11) NOT NULL DEFAULT '0',
  `priority` smallint(10) DEFAULT '0',
  `trigger_type` smallint(10) DEFAULT '0',
  `per_user_impression_constraint` int(10) DEFAULT '0',
  `id_Station_sponsor_constraint` varchar(10) DEFAULT NULL,
  `per_user_per_day_impression_constraint` int(10) DEFAULT '0',
  `paid` tinyint(1) DEFAULT NULL,
  `private_name` text,
  `notes` text,
  `rate` float DEFAULT NULL,
  `archived` tinyint(1) DEFAULT NULL,
  `new_session` tinyint(1) DEFAULT NULL,
  `subscribers` tinyint(1) DEFAULT NULL,
  `id_RSSEpisode_trigger` int(10) DEFAULT NULL,
  `time_since_last_ad` smallint(10) DEFAULT NULL,
  `per_day_impression_constraint` int(10) DEFAULT NULL,
  `autoPubDateStart` datetime DEFAULT NULL,
  `autoPubDateEnd` datetime DEFAULT NULL,
  `rowUpdatedTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_AdCart`),
  KEY `id_RSSFeed` (`id_RSSFeed`),
  KEY `id_RSSFeed_trigger` (`id_RSSFeed_trigger`),
  KEY `active_idx` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=45737 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdCartCountByFeed`
--

DROP TABLE IF EXISTS `AdCartCountByFeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdCartCountByFeed` (
  `id_RSSFeed` int(11) NOT NULL,
  `ad_cart_use_count` bigint(20) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdCartUse`
--

DROP TABLE IF EXISTS `AdCartUse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdCartUse` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `id_RSSFeed` int(11) NOT NULL DEFAULT '0',
  `totalListeningTime` int(10) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `currentSession` tinyint(1) NOT NULL DEFAULT '1',
  KEY `id_User` (`id_User`),
  KEY `feed_idx` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdCartUseArchive`
--

DROP TABLE IF EXISTS `AdCartUseArchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdCartUseArchive` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `id_RSSFeed` int(11) NOT NULL DEFAULT '0',
  `totalListeningTime` int(10) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `currentSession` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdCartUseCount`
--

DROP TABLE IF EXISTS `AdCartUseCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdCartUseCount` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `id_RSSFeed` int(11) NOT NULL DEFAULT '0',
  `count` smallint(6) NOT NULL DEFAULT '0',
  KEY `id_User` (`id_User`,`id_RSSFeed`),
  KEY `id_RSSFeed_idx` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdCartUseCountArchive`
--

DROP TABLE IF EXISTS `AdCartUseCountArchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdCartUseCountArchive` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `id_RSSFeed` int(11) NOT NULL DEFAULT '0',
  `count` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdCartZip`
--

DROP TABLE IF EXISTS `AdCartZip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdCartZip` (
  `id_RSSFeed` int(10) DEFAULT NULL,
  `zip` int(5) DEFAULT NULL,
  KEY `id_RSSFeed_idx` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdDisplay`
--

DROP TABLE IF EXISTS `AdDisplay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdDisplay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `template` varchar(63) NOT NULL,
  `ga_adname` varchar(31) NOT NULL,
  `ga_partnername` varchar(63) NOT NULL,
  `use_tracking_pixel` tinyint(4) NOT NULL DEFAULT '0',
  `tracking_pixel_url` varchar(255) DEFAULT NULL,
  `clickthrough_url` varchar(255) DEFAULT NULL,
  `image_extension` varchar(10) DEFAULT 'jpg',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=651 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdRequest`
--

DROP TABLE IF EXISTS `AdRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdRequest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_User` int(10) DEFAULT NULL,
  `mode` int(5) DEFAULT NULL,
  `version` smallint(5) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `id_RSSFeed_previous` int(10) DEFAULT NULL,
  `id_RSSFeed_next` int(10) DEFAULT NULL,
  `time_since_last_ad` int(10) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `timestamp_idx` (`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=464758309 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdRequestSupplemental`
--

DROP TABLE IF EXISTS `AdRequestSupplemental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdRequestSupplemental` (
  `id_AdRequest` bigint(20) DEFAULT NULL,
  `new_session` tinyint(1) DEFAULT NULL,
  `id_AdCart_response` int(1) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `timestamp_idx` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Alert`
--

DROP TABLE IF EXISTS `Alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `sendMode` tinyint(4) DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_Payload` int(11) NOT NULL DEFAULT '0',
  `offset` int(11) NOT NULL DEFAULT '0',
  `id_Target` int(11) NOT NULL DEFAULT '0',
  `targetType` tinyint(4) NOT NULL DEFAULT '0',
  `sent` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_shares` int(11) NOT NULL DEFAULT '0',
  `sendCount` int(11) NOT NULL DEFAULT '0',
  `androidSendCount` int(11) NOT NULL DEFAULT '0',
  `iOSSendCount` int(11) NOT NULL DEFAULT '0',
  `openCount` int(11) NOT NULL DEFAULT '0',
  `androidOpenCount` int(11) NOT NULL DEFAULT '0',
  `iOSOpenCount` int(11) NOT NULL DEFAULT '0',
  `id_S3Cache` int(11) NOT NULL DEFAULT '0',
  `id_Cache` int(11) DEFAULT '0',
  `id_DeviceMode` int(11) NOT NULL DEFAULT '0',
  `poster` varchar(63) DEFAULT NULL,
  `accelerated` tinyint(4) NOT NULL DEFAULT '0',
  `url` varchar(510) DEFAULT NULL,
  `priority` smallint(6) NOT NULL DEFAULT '0',
  `deliveryTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retry` smallint(6) DEFAULT '0',
  `markUserSent` tinyint(4) DEFAULT '1',
  `error` varchar(255) DEFAULT NULL,
  `subscriberFilter` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `time_idx` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=11153 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AlertQueue`
--

DROP TABLE IF EXISTS `AlertQueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AlertQueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_User` int(11) DEFAULT NULL,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `sent` datetime DEFAULT NULL,
  `published` datetime DEFAULT NULL,
  `state` tinyint(4) DEFAULT '0',
  `alert_id` int(11) DEFAULT NULL,
  `priority` tinyint(4) DEFAULT NULL,
  `biz_rule` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id_RSSFeed` (`id_RSSFeed`),
  KEY `idx_id_User` (`id_User`),
  KEY `state_type_idx` (`state`,`type`),
  KEY `user_feed_idx` (`id_User`,`id_RSSFeed`),
  KEY `sent_idx` (`sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AlertSendMark`
--

DROP TABLE IF EXISTS `AlertSendMark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AlertSendMark` (
  `id_Alert` int(11) NOT NULL DEFAULT '0',
  `modulo` tinyint(4) NOT NULL DEFAULT '0',
  `id_User_low` int(11) NOT NULL DEFAULT '0',
  KEY `modulo` (`id_Alert`,`modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AlertTarget`
--

DROP TABLE IF EXISTS `AlertTarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AlertTarget` (
  `modulo` tinyint(4) NOT NULL,
  `id_User` int(11) NOT NULL,
  `deviceToken` varchar(512) NOT NULL,
  `registration_id` varchar(512) NOT NULL,
  `version` int(11) NOT NULL,
  `lastAlert` datetime DEFAULT NULL,
  `isGCM` tinyint(4) DEFAULT '0',
  `zip` int(11) DEFAULT '0',
  KEY `id_User` (`id_User`),
  KEY `modulo` (`modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AutomatedList`
--

DROP TABLE IF EXISTS `AutomatedList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AutomatedList` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BannerSizes`
--

DROP TABLE IF EXISTS `BannerSizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BannerSizes` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BlackListWords`
--

DROP TABLE IF EXISTS `BlackListWords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlackListWords` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `word` varchar(32) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Bookmark`
--

DROP TABLE IF EXISTS `Bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bookmark` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_RSSEpisode` int(10) DEFAULT NULL,
  `offset` int(10) DEFAULT NULL,
  `id_User` int(10) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `autoGenerated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_User_episode` (`id_RSSEpisode`,`id_User`),
  KEY `id_User_idx` (`id_User`),
  KEY `timestamp_idx` (`timestamp`),
  KEY `user_autogenerated_idx` (`id_User`,`autoGenerated`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BrokenStream`
--

DROP TABLE IF EXISTS `BrokenStream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BrokenStream` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_User` int(10) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9728 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CDNCache`
--

DROP TABLE IF EXISTS `CDNCache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CDNCache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_DeviceMode` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `name` varchar(127) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `lastUpdated` datetime NOT NULL,
  `typeData` int(11) DEFAULT '0',
  `inProgress` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `mode` (`id_DeviceMode`,`version`,`type`),
  KEY `alert` (`id_DeviceMode`,`version`,`type`,`typeData`)
) ENGINE=InnoDB AUTO_INCREMENT=972506 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CDNCacheDev`
--

DROP TABLE IF EXISTS `CDNCacheDev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CDNCacheDev` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_DeviceMode` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `name` varchar(127) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `lastUpdated` datetime NOT NULL,
  `typeData` int(11) DEFAULT '0',
  `inProgress` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `mode` (`id_DeviceMode`,`version`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3252 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Campaign`
--

DROP TABLE IF EXISTS `Campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Campaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `channel` varchar(100) NOT NULL,
  `manageOtherLists` tinyint(4) NOT NULL DEFAULT '0',
  `created_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Carousel`
--

DROP TABLE IF EXISTS `Carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Carousel` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_TestGroup` int(10) DEFAULT NULL,
  `cardData` text,
  `name` text,
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `public` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_TestGroup` (`id_TestGroup`,`public`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CarouselCard`
--

DROP TABLE IF EXISTS `CarouselCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CarouselCard` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_Image` int(10) DEFAULT NULL,
  `title` text,
  `banner` text,
  `public` tinyint(4) DEFAULT NULL,
  `targetType` tinyint(4) DEFAULT '0',
  `id_Target` int(11) DEFAULT '0',
  `target` text,
  `imageURL` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `id_Target` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `target_idx` (`id_Target`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=147021 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Clip`
--

DROP TABLE IF EXISTS `Clip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clip` (
  `id_RSSEpisode` int(11) NOT NULL DEFAULT '0',
  `id_RSSEpisode_original` int(11) DEFAULT NULL,
  `startTime` float DEFAULT NULL,
  `endTime` float DEFAULT NULL,
  `bumperURL` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSEpisode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `eid` int(11) DEFAULT NULL,
  `eType` enum('RSSFeed','Genre','User') DEFAULT NULL,
  `comment` text,
  `commentBy` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Contact`
--

DROP TABLE IF EXISTS `Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_User` int(10) DEFAULT NULL,
  `contactFirstName` varchar(100) DEFAULT NULL,
  `contactLastName` varchar(100) DEFAULT NULL,
  `contactEmail` varchar(100) DEFAULT NULL,
  `contactPhone` bigint(15) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `inviteStatus` int(3) DEFAULT NULL,
  `id_SMSInviteMessage` int(10) DEFAULT NULL,
  `inviteDate` datetime DEFAULT NULL,
  `id_InviteFlow` int(10) DEFAULT NULL,
  `queued` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_idx` (`contactEmail`),
  KEY `phone_idx` (`contactPhone`),
  KEY `status_queued_idx` (`inviteStatus`,`queued`)
) ENGINE=InnoDB AUTO_INCREMENT=848644 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ContactCount`
--

DROP TABLE IF EXISTS `ContactCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContactCount` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_User` int(10) DEFAULT NULL,
  `id_InviteFlow` int(10) DEFAULT NULL,
  `selected` int(10) DEFAULT NULL,
  `total` int(10) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8370 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ContestRegistrations`
--

DROP TABLE IF EXISTS `ContestRegistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContestRegistrations` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `source_id` int(11) NOT NULL,
  `email` varchar(127) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `source_id` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11730 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Countries`
--

DROP TABLE IF EXISTS `Countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Countries` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `sortOrder` int(2) unsigned NOT NULL DEFAULT '0',
  `abbreviation` char(2) DEFAULT NULL,
  `longName` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CountryCode`
--

DROP TABLE IF EXISTS `CountryCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CountryCode` (
  `codeAlpha2` varchar(2) DEFAULT NULL,
  `codeAlpha3` varchar(3) DEFAULT NULL,
  `id_Station` int(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CustomImage`
--

DROP TABLE IF EXISTS `CustomImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomImage` (
  `id_Image` int(11) NOT NULL,
  `customType` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id_Image_customType` (`id_Image`,`customType`),
  KEY `id_Image_idx` (`id_Image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CustomImageOK`
--

DROP TABLE IF EXISTS `CustomImageOK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomImageOK` (
  `id_RSSFeed` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DCActivities`
--

DROP TABLE IF EXISTS `DCActivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DCActivities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_PodcastIngestionEngineUser` int(10) unsigned NOT NULL,
  `id_ActivityType` int(2) unsigned NOT NULL,
  `additionalDetail` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3369 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DCActivityTypes`
--

DROP TABLE IF EXISTS `DCActivityTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DCActivityTypes` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  `description` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DCApplicationRequests`
--

DROP TABLE IF EXISTS `DCApplicationRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DCApplicationRequests` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `fullName` varchar(63) NOT NULL,
  `id_Title` int(3) unsigned DEFAULT NULL,
  `email` varchar(127) NOT NULL,
  `password` varchar(63) DEFAULT NULL,
  `phone` bigint(10) unsigned DEFAULT NULL,
  `mailingList` int(1) unsigned NOT NULL DEFAULT '0',
  `companyName` varchar(127) NOT NULL,
  `companyAddr1` varchar(63) DEFAULT NULL,
  `companyAddr2` varchar(63) DEFAULT NULL,
  `companyCity` varchar(63) DEFAULT NULL,
  `id_State` int(2) unsigned DEFAULT NULL,
  `companyZip` int(5) unsigned DEFAULT NULL,
  `id_CountryOfHQ` int(3) unsigned DEFAULT NULL,
  `id_CountryOfUse` int(3) unsigned DEFAULT NULL,
  `id_PartnerType` int(2) unsigned DEFAULT NULL,
  `platform` varchar(31) DEFAULT NULL,
  `id_LaunchTimeFrame` int(2) unsigned DEFAULT NULL,
  `id_ConnectivityType` int(2) unsigned DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `comments` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DCCategories`
--

DROP TABLE IF EXISTS `DCCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DCCategories` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DCConnectivityTypes`
--

DROP TABLE IF EXISTS `DCConnectivityTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DCConnectivityTypes` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DCDocuments`
--

DROP TABLE IF EXISTS `DCDocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DCDocuments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_Active` int(1) unsigned NOT NULL DEFAULT '1',
  `id_PodcastIngestionEngineUser` int(10) unsigned NOT NULL,
  `id_Category` int(2) unsigned NOT NULL,
  `linkText` varchar(127) NOT NULL,
  `URL` varchar(127) NOT NULL,
  `additionalDetail` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DCIndustries`
--

DROP TABLE IF EXISTS `DCIndustries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DCIndustries` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DCLaunchTimeFrames`
--

DROP TABLE IF EXISTS `DCLaunchTimeFrames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DCLaunchTimeFrames` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DCPartnerTypes`
--

DROP TABLE IF EXISTS `DCPartnerTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DCPartnerTypes` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DCPartners`
--

DROP TABLE IF EXISTS `DCPartners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DCPartners` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `companyName` varchar(127) NOT NULL,
  `companyAddr1` varchar(63) DEFAULT NULL,
  `companyAddr2` varchar(63) DEFAULT NULL,
  `companyCity` varchar(63) DEFAULT NULL,
  `id_State` int(2) unsigned DEFAULT NULL,
  `companyZip` int(5) unsigned DEFAULT NULL,
  `id_CountryOfHQ` int(3) unsigned DEFAULT NULL,
  `id_CountryOfUse` int(3) unsigned DEFAULT NULL,
  `id_PartnerType` int(2) unsigned DEFAULT NULL,
  `platform` varchar(31) DEFAULT NULL,
  `id_LaunchTimeFrame` int(2) unsigned DEFAULT NULL,
  `id_ConnectivityType` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DCTitles`
--

DROP TABLE IF EXISTS `DCTitles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DCTitles` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DLQueue`
--

DROP TABLE IF EXISTS `DLQueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DLQueue` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `id_RSSFeed` int(11) NOT NULL DEFAULT '0',
  `id_RSSEpisode` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT NULL,
  `rowUpdatedTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `user_episode_idx` (`id_User`,`id_RSSEpisode`),
  KEY `user-feed` (`id_User`,`id_RSSFeed`),
  KEY `user-state` (`id_User`,`state`),
  KEY `timestamp_idx` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DLQueueStatus`
--

DROP TABLE IF EXISTS `DLQueueStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DLQueueStatus` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `id_RSSFeed` int(11) NOT NULL DEFAULT '0',
  `count` tinyint(4) NOT NULL DEFAULT '0',
  `lastListen` timestamp NULL DEFAULT NULL,
  `id_RSSEpisode_last` int(11) NOT NULL DEFAULT '0',
  `lastProcess` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `user_feed_idx` (`id_User`,`id_RSSFeed`),
  KEY `user-feed` (`id_User`,`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DMA`
--

DROP TABLE IF EXISTS `DMA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DMA` (
  `zip` mediumint(9) NOT NULL DEFAULT '0',
  `name` varchar(127) NOT NULL,
  `radius` mediumint(9) NOT NULL DEFAULT '200'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DeezerIngestionUpdates`
--

DROP TABLE IF EXISTS `DeezerIngestionUpdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeezerIngestionUpdates` (
  `show_id` int(10) unsigned NOT NULL,
  `episode_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `timestamp_idx` (`timestamp`),
  KEY `show_episode_status` (`show_id`,`episode_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DeviceMode`
--

DROP TABLE IF EXISTS `DeviceMode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceMode` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_DeviceMode_parent` int(10) DEFAULT NULL,
  `name` varchar(127) DEFAULT NULL,
  `browserTag` varchar(127) DEFAULT NULL,
  `modeTag` varchar(127) DEFAULT NULL,
  `selectable` tinyint(4) NOT NULL DEFAULT '0',
  `keyRequired` tinyint(4) DEFAULT '0',
  `current` tinyint(4) DEFAULT '1',
  `id_StationGroup_top` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`id_DeviceMode_parent`),
  KEY `modeTag_idx` (`modeTag`)
) ENGINE=InnoDB AUTO_INCREMENT=252769 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DownloadLink`
--

DROP TABLE IF EXISTS `DownloadLink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DownloadLink` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `deviceString` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EAREpisode`
--

DROP TABLE IF EXISTS `EAREpisode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EAREpisode` (
  `id` int(11) NOT NULL DEFAULT '0',
  `id_RSSEpisode` int(11) DEFAULT '0',
  `id_EARFeed` int(11) DEFAULT '0',
  `title` text,
  `description` text,
  `url` text,
  `filesize` int(11) DEFAULT '0',
  `duration` smallint(5) DEFAULT NULL,
  `published` datetime DEFAULT NULL,
  `draft` tinyint(1) DEFAULT '0',
  `episodeNumber` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_RSSEpisode_idx` (`id_RSSEpisode`),
  KEY `id_EARFeed_idx` (`id_EARFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EARFeed`
--

DROP TABLE IF EXISTS `EARFeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EARFeed` (
  `id` int(11) NOT NULL DEFAULT '0',
  `id_RSSFeed` int(11) DEFAULT '0',
  `title` text,
  `description` text,
  `artworkURL` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_RSSFeed_idx` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EmailBlacklist`
--

DROP TABLE IF EXISTS `EmailBlacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmailBlacklist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(10) DEFAULT NULL,
  `address` text,
  `heat` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11350 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EmailNotify`
--

DROP TABLE IF EXISTS `EmailNotify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmailNotify` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `subject` text,
  `message` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7572 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EmailWhitelist`
--

DROP TABLE IF EXISTS `EmailWhitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmailWhitelist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EnhancedSource`
--

DROP TABLE IF EXISTS `EnhancedSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EnhancedSource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Entity`
--

DROP TABLE IF EXISTS `Entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Entity` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `shortName` varchar(11) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `endorsed` tinyint(4) DEFAULT NULL,
  `public` tinyint(4) DEFAULT NULL,
  `id_EntityCategory` int(11) DEFAULT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `backgroundColor` varchar(255) DEFAULT NULL,
  `buttonTopColor` varchar(255) DEFAULT NULL,
  `buttonBottomColor` varchar(255) DEFAULT NULL,
  `buttonBorderColor` varchar(255) DEFAULT NULL,
  `buttonTextColor` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntityCategory`
--

DROP TABLE IF EXISTS `EntityCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntityCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `public` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EpisodeIngestionErrors`
--

DROP TABLE IF EXISTS `EpisodeIngestionErrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EpisodeIngestionErrors` (
  `id_RSSEpisode` int(11) NOT NULL,
  `errorCount` int(11) unsigned NOT NULL DEFAULT '0',
  `firstErrorDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastErrorDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSEpisode`),
  KEY `EpisodeIngestionErrors_errorCount_idx` (`errorCount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EpisodeMetadata`
--

DROP TABLE IF EXISTS `EpisodeMetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EpisodeMetadata` (
  `id_RSSEpisode` int(11) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `metadata` text,
  KEY `id_idx` (`id_RSSEpisode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EpisodeRates`
--

DROP TABLE IF EXISTS `EpisodeRates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EpisodeRates` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EpisodeTakedowns`
--

DROP TABLE IF EXISTS `EpisodeTakedowns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EpisodeTakedowns` (
  `uniqId` char(13) NOT NULL,
  `id_RSSEpisode` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uniqId`,`id_RSSEpisode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EventCenter`
--

DROP TABLE IF EXISTS `EventCenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventCenter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `bannerURL` varchar(255) DEFAULT NULL,
  `bannerHeight` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FacebookClickCount`
--

DROP TABLE IF EXISTS `FacebookClickCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FacebookClickCount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT NULL,
  `facebookActionID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216608 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FacebookCommentCount`
--

DROP TABLE IF EXISTS `FacebookCommentCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FacebookCommentCount` (
  `id_RSSEpisode` int(10) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `lastChecked` datetime DEFAULT NULL,
  UNIQUE KEY `id_RSSEpisode_idx` (`id_RSSEpisode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FacebookCommentCountMin`
--

DROP TABLE IF EXISTS `FacebookCommentCountMin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FacebookCommentCountMin` (
  `id_RSSEpisode` int(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FacebookTitle`
--

DROP TABLE IF EXISTS `FacebookTitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FacebookTitle` (
  `fid` int(11) DEFAULT NULL,
  `pattern` varchar(255) DEFAULT NULL,
  `replacement` varchar(255) DEFAULT NULL,
  KEY `fid_idx` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FacebookUser`
--

DROP TABLE IF EXISTS `FacebookUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FacebookUser` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `facebookID` varchar(255) DEFAULT NULL,
  `accessToken` text,
  `email` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1914 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FacebookWallPost`
--

DROP TABLE IF EXISTS `FacebookWallPost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FacebookWallPost` (
  `facebookID` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `facebookPostID` varchar(255) DEFAULT NULL,
  `id_RSSEpisode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FavoritesAlerts`
--

DROP TABLE IF EXISTS `FavoritesAlerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FavoritesAlerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3106 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FavoritesAlertsApp`
--

DROP TABLE IF EXISTS `FavoritesAlertsApp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FavoritesAlertsApp` (
  `id_User` int(10) NOT NULL DEFAULT '0',
  `type` int(2) DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FeedChangeRequest`
--

DROP TABLE IF EXISTS `FeedChangeRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedChangeRequest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `fieldName` varchar(50) DEFAULT NULL,
  `newValue` varchar(255) DEFAULT NULL,
  `requestDate` datetime DEFAULT NULL,
  `approvalDate` datetime DEFAULT NULL,
  `denialDate` datetime DEFAULT NULL,
  `denialReason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106088 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FeedIngestionBlacklist`
--

DROP TABLE IF EXISTS `FeedIngestionBlacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedIngestionBlacklist` (
  `id_RSSFeed` int(11) NOT NULL,
  `rowUpdatedTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id_RSSFeed` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FeedIngestionBlacklist_bak`
--

DROP TABLE IF EXISTS `FeedIngestionBlacklist_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedIngestionBlacklist_bak` (
  `id_RSSFeed` int(11) NOT NULL,
  `rowUpdatedTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id_RSSFeed` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FeedIngestionErrors`
--

DROP TABLE IF EXISTS `FeedIngestionErrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedIngestionErrors` (
  `id_RSSFeed` int(11) NOT NULL,
  `errorCount` int(11) unsigned NOT NULL DEFAULT '0',
  `feedErrorThreshold` int(11) unsigned NOT NULL DEFAULT '50',
  `episodeErrorThreshold` int(11) unsigned NOT NULL DEFAULT '5',
  `firstErrorDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastErrorDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSFeed`),
  KEY `FeedIngestionErrors_errorCount_idx` (`errorCount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FeedProcessingErrors`
--

DROP TABLE IF EXISTS `FeedProcessingErrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedProcessingErrors` (
  `id_RSSFeed` int(11) NOT NULL,
  `errorCount` int(11) NOT NULL DEFAULT '0',
  `firstErrorDate` datetime NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FeedXML`
--

DROP TABLE IF EXISTS `FeedXML`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedXML` (
  `uniqId` char(13) NOT NULL,
  `xml` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `feed_xml_uniqid_idx` (`uniqId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FlashBriefing`
--

DROP TABLE IF EXISTS `FlashBriefing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FlashBriefing` (
  `id_NewsItem` int(11) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `id_NewsItem_idx` (`id_NewsItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Genre` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_Genre_parent` int(4) DEFAULT '0',
  `name` varchar(127) DEFAULT NULL,
  `public` tinyint(2) DEFAULT '0',
  `id_User_master` int(11) NOT NULL DEFAULT '0',
  `rank` smallint(6) NOT NULL DEFAULT '0',
  `liveFeedCount` smallint(6) DEFAULT '0',
  `uiColor` varchar(10) DEFAULT NULL,
  `pushToDeezer` int(11) NOT NULL DEFAULT '0',
  `feedCount` smallint(6) DEFAULT '0',
  `childCount` smallint(6) DEFAULT '0',
  `active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`id_Genre_parent`,`public`),
  KEY `genre_uiColor_idx` (`uiColor`),
  KEY `active_idx` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=674 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HasOffersTracker`
--

DROP TABLE IF EXISTS `HasOffersTracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HasOffersTracker` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `id_Publisher` int(11) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_User`),
  UNIQUE KEY `id_User_UNIQUE` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HowlShowMIA`
--

DROP TABLE IF EXISTS `HowlShowMIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HowlShowMIA` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `id_idx` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IPRecord`
--

DROP TABLE IF EXISTS `IPRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IPRecord` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_User` int(10) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `ip` varchar(32) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=310487 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Image`
--

DROP TABLE IF EXISTS `Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceURL` text,
  `fileLocation` text,
  `widthPixels` int(11) DEFAULT NULL,
  `heightPixels` int(11) DEFAULT NULL,
  `densityPixels` int(11) DEFAULT NULL,
  `md5Hash` char(32) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `md5Hash_idx` (`md5Hash`),
  KEY `fileLocation_idx` (`fileLocation`(191))
) ENGINE=InnoDB AUTO_INCREMENT=91410 DEFAULT CHARSET=utf8mb4 COMMENT='ALTER TABLE `Image` ADD COLUMN sourceURL text AFTER id';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ImageTag`
--

DROP TABLE IF EXISTS `ImageTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImageTag` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tag` varchar(100) DEFAULT NULL,
  `id_RSSEpisode` int(10) DEFAULT NULL,
  `id_NewsItem` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4747 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InfoEmail`
--

DROP TABLE IF EXISTS `InfoEmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InfoEmail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(127) DEFAULT NULL,
  `fromEmail` varchar(63) NOT NULL,
  `fromName` varchar(63) NOT NULL,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `template` varchar(255) NOT NULL,
  `passTemplate` varchar(127) NOT NULL,
  `failTemplate` varchar(127) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InfoURL`
--

DROP TABLE IF EXISTS `InfoURL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InfoURL` (
  `id` int(11) NOT NULL DEFAULT '0',
  `mainImage` varchar(510) DEFAULT NULL,
  `supImage` varchar(510) DEFAULT NULL,
  `title` varchar(63) DEFAULT NULL,
  `text` varchar(510) DEFAULT NULL,
  `id_InfoURLTemplate` int(11) NOT NULL DEFAULT '0',
  `url` varchar(510) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InfoURLTemplate`
--

DROP TABLE IF EXISTS `InfoURLTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InfoURLTemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `url` varchar(510) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InstallTracking`
--

DROP TABLE IF EXISTS `InstallTracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InstallTracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `androidId` varchar(255) DEFAULT NULL,
  `referrer` text,
  `mode` int(11) DEFAULT NULL,
  `processed` int(11) DEFAULT '0',
  `id_User` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `android_id_idx` (`androidId`(191))
) ENGINE=InnoDB AUTO_INCREMENT=130059810 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InviteFlow`
--

DROP TABLE IF EXISTS `InviteFlow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InviteFlow` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `promptTitle` varchar(100) DEFAULT NULL,
  `promptTitleButtonLabel` varchar(100) DEFAULT NULL,
  `promptText` varchar(500) DEFAULT NULL,
  `promptButtonLabel` varchar(100) DEFAULT NULL,
  `promptImageOn` tinyint(1) DEFAULT NULL,
  `promptImageURL` varchar(500) DEFAULT NULL,
  `contactAlertOn` tinyint(1) DEFAULT NULL,
  `contactAlertTitle` varchar(100) DEFAULT NULL,
  `contactAlertMessage` varchar(500) DEFAULT NULL,
  `contactAlertLeftButtonLabel` varchar(100) DEFAULT NULL,
  `contactAlertRightButtonLabel` varchar(100) DEFAULT NULL,
  `friendSelectionTitle` varchar(100) DEFAULT NULL,
  `friendSelectionTitleButtonLabel` varchar(100) DEFAULT NULL,
  `friendSelectionText` varchar(500) DEFAULT NULL,
  `friendSelectionEntryCountText` varchar(100) DEFAULT NULL,
  `friendSelectionImageOn` tinyint(1) DEFAULT NULL,
  `friendSelectionImageURL` varchar(500) DEFAULT NULL,
  `friendSelectionDefault` tinyint(1) DEFAULT '0',
  `confirmationToastOn` tinyint(1) DEFAULT NULL,
  `confirmationToastText` varchar(100) DEFAULT NULL,
  `contactOrder` tinyint(3) DEFAULT '0',
  `id_SMSInviteMessage` int(10) DEFAULT NULL,
  `emailTemplate` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JobEntry`
--

DROP TABLE IF EXISTS `JobEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JobEntry` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `rank` int(10) DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `bambooID` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KBCategories`
--

DROP TABLE IF EXISTS `KBCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KBCategories` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `id_KBCategory` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `categoryName` varchar(31) NOT NULL,
  `categoryRank` int(2) unsigned NOT NULL DEFAULT '1',
  `public` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_KBCategory` (`id_KBCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KBEntry`
--

DROP TABLE IF EXISTS `KBEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KBEntry` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `question` text,
  `answer` text,
  `rank` int(10) DEFAULT NULL,
  `category` int(10) DEFAULT NULL,
  `public` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Language`
--

DROP TABLE IF EXISTS `Language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Language` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) DEFAULT NULL,
  `language_cd` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LatestHeard`
--

DROP TABLE IF EXISTS `LatestHeard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LatestHeard` (
  `id_User` int(10) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `user_feed_idx` (`id_User`,`id_RSSFeed`),
  KEY `user_idx` (`id_User`),
  KEY `feed_idx` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LatestHeard_old`
--

DROP TABLE IF EXISTS `LatestHeard_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LatestHeard_old` (
  `id_User` int(10) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  KEY `feed` (`id_RSSFeed`),
  KEY `user` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ListEntry`
--

DROP TABLE IF EXISTS `ListEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListEntry` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `id_ListEntry_next` int(10) DEFAULT NULL,
  `id_ListHead` int(10) DEFAULT NULL,
  `entryMethod` int(2) NOT NULL DEFAULT '0',
  `heard` int(2) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `head` (`id_ListHead`),
  KEY `next` (`id_ListEntry_next`),
  KEY `feed` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ListEntry_recyclables`
--

DROP TABLE IF EXISTS `ListEntry_recyclables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListEntry_recyclables` (
  `id_ListEntry` int(11) NOT NULL,
  PRIMARY KEY (`id_ListEntry`),
  KEY `id_ListEntry_idx` (`id_ListEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ListHead`
--

DROP TABLE IF EXISTS `ListHead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListHead` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_User` int(10) DEFAULT NULL,
  `id_ListEntry_head` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_Station` int(10) DEFAULT NULL,
  `lastAccessed` datetime DEFAULT NULL,
  `changed` int(2) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `data` text,
  PRIMARY KEY (`id`),
  KEY `station` (`id_Station`),
  KEY `head` (`id_ListEntry_head`),
  KEY `index_ListHead_lastAccessed` (`lastAccessed`),
  KEY `user` (`id_User`),
  KEY `station_user_idx` (`id_Station`,`id_User`)
) ENGINE=InnoDB AUTO_INCREMENT=70307674 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ListHeadRepairLog`
--

DROP TABLE IF EXISTS `ListHeadRepairLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListHeadRepairLog` (
  `id_ListHead` int(11) NOT NULL,
  `count` smallint(6) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cyclical` tinyint(1) NOT NULL,
  KEY `id_ListEntry` (`id_ListHead`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ListHead_recyclables`
--

DROP TABLE IF EXISTS `ListHead_recyclables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListHead_recyclables` (
  `id_ListHead` int(11) NOT NULL,
  PRIMARY KEY (`id_ListHead`),
  KEY `id_ListHead_idx` (`id_ListHead`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ListJSON`
--

DROP TABLE IF EXISTS `ListJSON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListJSON` (
  `id_ListHead` int(10) DEFAULT '0',
  `data` text,
  KEY `head` (`id_ListHead`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ListUnsubscribes`
--

DROP TABLE IF EXISTS `ListUnsubscribes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListUnsubscribes` (
  `id_User` int(11) DEFAULT NULL,
  `id_Campaign` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `user_campaign_idx` (`id_User`,`id_Campaign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ListenerCount`
--

DROP TABLE IF EXISTS `ListenerCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListenerCount` (
  `id` tinyint(3) unsigned NOT NULL,
  `display_text` varchar(255) DEFAULT NULL,
  `min_count` int(10) unsigned DEFAULT '0',
  `max_count` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LoginCookies`
--

DROP TABLE IF EXISTS `LoginCookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoginCookies` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `login_cookie` varchar(32) DEFAULT '',
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ManageLog`
--

DROP TABLE IF EXISTS `ManageLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ManageLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_Target` int(11) NOT NULL,
  `tableName` varchar(31) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `user` varchar(31) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ts` (`ts`),
  KEY `id_Target` (`id_Target`),
  KEY `table` (`tableName`),
  KEY `entity` (`id_Target`,`tableName`) USING BTREE,
  KEY `user_id_idx` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=126546528 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MandrillEmail`
--

DROP TABLE IF EXISTS `MandrillEmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MandrillEmail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `template` varchar(127) DEFAULT NULL,
  `id_Target` int(11) NOT NULL DEFAULT '0',
  `targetType` tinyint(4) NOT NULL DEFAULT '0',
  `campaign_id` varchar(127) DEFAULT NULL,
  `sent` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deliveryTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sendCount` int(11) DEFAULT '0',
  `error` varchar(255) DEFAULT NULL,
  `poster` varchar(45) DEFAULT 'nobody',
  `completed` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MandrillUseCount`
--

DROP TABLE IF EXISTS `MandrillUseCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MandrillUseCount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_User` int(11) DEFAULT NULL,
  `email` varchar(127) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `subject_line` varchar(255) DEFAULT NULL,
  `action` tinyint(4) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `id_RSSEpisode_clicked` int(11) DEFAULT NULL,
  `url_clicked` varchar(300) DEFAULT NULL,
  `country` varchar(155) DEFAULT NULL,
  `region` varchar(155) DEFAULT NULL,
  `city` varchar(155) DEFAULT NULL,
  `zip` int(30) DEFAULT NULL,
  `timezone` varchar(200) DEFAULT NULL,
  `mobile` tinyint(4) DEFAULT NULL,
  `user_agent` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_User` (`id_User`),
  KEY `id_RSSEpisode_clicked` (`id_RSSEpisode_clicked`),
  KEY `zip` (`zip`)
) ENGINE=InnoDB AUTO_INCREMENT=6965773 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MostActiveHour_federated`
--

DROP TABLE IF EXISTS `MostActiveHour_federated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MostActiveHour_federated` (
  `id_User` int(11) DEFAULT NULL,
  `day_of_week` int(11) DEFAULT '-1',
  `hour` smallint(6) DEFAULT '12',
  `time` int(11) DEFAULT NULL,
  `time_for_day` int(11) DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `user_day_idx` (`id_User`,`day_of_week`),
  KEY `idx_id_User` (`id_User`),
  KEY `day_hour_idx` (`day_of_week`,`hour`)
) ENGINE=FEDERATED DEFAULT CHARSET=utf8mb4 CONNECTION='mysql://stitcher_ro:6p4LfYg1%7y6@stitcher-static.ct74dnkmw0zc.us-east-1.rds.amazonaws.com:3306/stitcherstatic/MostActiveHour';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MostActiveHour_supp`
--

DROP TABLE IF EXISTS `MostActiveHour_supp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MostActiveHour_supp` (
  `id_User` int(11) DEFAULT NULL,
  `day_of_week` int(11) DEFAULT '-1',
  `hour` smallint(6) DEFAULT '12',
  `time` int(11) DEFAULT NULL,
  `time_for_day` int(11) DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `user_day_idx` (`id_User`,`day_of_week`),
  KEY `idx_id_User` (`id_User`),
  KEY `day_hour_idx` (`day_of_week`,`hour`),
  KEY `timestamp_idx` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MostThumbedFeeds`
--

DROP TABLE IF EXISTS `MostThumbedFeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MostThumbedFeeds` (
  `id_RSSFeed` int(10) DEFAULT NULL,
  `ratio` decimal(23,4) DEFAULT NULL,
  `up_count` bigint(21) NOT NULL DEFAULT '0',
  `down_count` bigint(21) DEFAULT '0',
  `last_run_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `id_idx` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NamedEntity`
--

DROP TABLE IF EXISTS `NamedEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NamedEntity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `name` varchar(510) DEFAULT NULL,
  `id_Twitter` int(11) DEFAULT NULL,
  `entityType` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `entityType_idx` (`entityType`)
) ENGINE=InnoDB AUTO_INCREMENT=4407 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NamedEntityImageMap`
--

DROP TABLE IF EXISTS `NamedEntityImageMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NamedEntityImageMap` (
  `id_NamedEntity` int(11) NOT NULL,
  `id_Image` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `id_NamedEntity_idx` (`id_NamedEntity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NewEpisodeAlert`
--

DROP TABLE IF EXISTS `NewEpisodeAlert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NewEpisodeAlert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_User` int(11) DEFAULT NULL,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `sent` datetime DEFAULT NULL,
  `published` datetime DEFAULT NULL,
  `state` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_id_RSSFeed` (`id_RSSFeed`),
  KEY `idx_id_User` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NewEpisodeQueue`
--

DROP TABLE IF EXISTS `NewEpisodeQueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NewEpisodeQueue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_RSSEpisode` int(10) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `published` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2980314 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NewsAlertInfo`
--

DROP TABLE IF EXISTS `NewsAlertInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NewsAlertInfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creationDate` date NOT NULL,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alertType` enum('BreakingNewsAlert','TopNewsAlert') NOT NULL DEFAULT 'TopNewsAlert',
  `id_RSSEpisode` int(10) DEFAULT NULL,
  `alertTitle` varchar(96) DEFAULT NULL COMMENT 'only used with top news alerts',
  `imageName` varchar(64) DEFAULT NULL,
  `alertText` text,
  PRIMARY KEY (`id`),
  KEY `alertType` (`alertType`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8mb4 COMMENT='Used to create the infopages for breaking news alerts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NewsItem`
--

DROP TABLE IF EXISTS `NewsItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NewsItem` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(511) NOT NULL,
  `imageURL` varchar(255) NOT NULL,
  `pubDate` datetime NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `actionURL` varchar(255) NOT NULL,
  `facebookTitle` varchar(255) DEFAULT NULL,
  `facebookDescription` varchar(255) DEFAULT NULL,
  `id_RSSEpisode` int(11) DEFAULT NULL,
  `id_RSSEpisode_breaking_news` int(11) DEFAULT NULL,
  `id_RSSEpisode_alert` int(11) DEFAULT NULL,
  `autoPubDate` datetime DEFAULT NULL,
  `startTime` float(10,3) DEFAULT NULL,
  `endTime` float(10,3) DEFAULT NULL,
  `id_RSSEpisode_cut` int(11) DEFAULT NULL,
  `id_RSSEpisode_alert_cut` int(11) DEFAULT NULL,
  `id_RSSEpisode_original` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `episode_idx` (`id_RSSEpisode`),
  KEY `episode_cut_idx` (`id_RSSEpisode_cut`),
  KEY `id_RSSEpisode_alert_idx` (`id_RSSEpisode_alert`),
  KEY `pub_ep_date_idx` (`pubDate`,`id_RSSEpisode`),
  FULLTEXT KEY `fullText` (`title`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=28010 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NowPlaying`
--

DROP TABLE IF EXISTS `NowPlaying`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NowPlaying` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `artist` varchar(50) DEFAULT NULL,
  `albumTitle` varchar(50) DEFAULT NULL,
  `albumArt` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `startTime` varchar(30) DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `isSong` tinyint(1) DEFAULT NULL,
  `isDirty` tinyint(1) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_RSSFeed_idx` (`id_RSSFeed`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OpportunityAlert`
--

DROP TABLE IF EXISTS `OpportunityAlert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OpportunityAlert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_Payload` int(11) NOT NULL DEFAULT '0',
  `expiration` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `news` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payload_id_idx` (`id_Payload`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OpportunityAlertPair`
--

DROP TABLE IF EXISTS `OpportunityAlertPair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OpportunityAlertPair` (
  `opportunity_id` int(11) DEFAULT NULL,
  `alert_id` int(11) DEFAULT NULL,
  `expiration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `opp_alert_id` (`opportunity_id`,`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `OpportunityAlertPairView`
--

DROP TABLE IF EXISTS `OpportunityAlertPairView`;
/*!50001 DROP VIEW IF EXISTS `OpportunityAlertPairView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `OpportunityAlertPairView` (
  `opportunity_id` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `alert_id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `message` tinyint NOT NULL,
  `expiration` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `PPActivities`
--

DROP TABLE IF EXISTS `PPActivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PPActivities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_PodcastIngestionEngineUser` int(10) unsigned NOT NULL,
  `id_ActivityType` int(2) unsigned NOT NULL,
  `additionalDetail` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=703719 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PPActivityTypes`
--

DROP TABLE IF EXISTS `PPActivityTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PPActivityTypes` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  `description` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PPMarketingBanner`
--

DROP TABLE IF EXISTS `PPMarketingBanner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PPMarketingBanner` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `anchorURL` varchar(255) DEFAULT NULL,
  `imageURL` varchar(127) NOT NULL,
  `imageWidth` int(3) DEFAULT NULL,
  `imageHeight` int(3) DEFAULT NULL,
  `imageAltText` varchar(127) DEFAULT NULL,
  `location` int(11) NOT NULL DEFAULT '1',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PPUsers`
--

DROP TABLE IF EXISTS `PPUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PPUsers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valid` int(1) unsigned NOT NULL DEFAULT '1',
  `id_PodcastIngestionEngineUser` int(10) unsigned NOT NULL,
  `id_RSSProvider` int(10) unsigned NOT NULL,
  `password` varchar(63) DEFAULT NULL,
  `userType` enum('stitcher','partner') NOT NULL DEFAULT 'partner',
  `first_name` varchar(63) DEFAULT NULL,
  `last_name` varchar(127) DEFAULT NULL,
  `email` varchar(127) NOT NULL,
  `websiteURL` varchar(255) DEFAULT NULL,
  `phone` bigint(10) unsigned DEFAULT NULL,
  `street` varchar(127) DEFAULT NULL,
  `city` varchar(127) DEFAULT NULL,
  `id_State` int(2) unsigned DEFAULT NULL,
  `province` varchar(63) DEFAULT NULL,
  `zip` int(5) unsigned DEFAULT NULL,
  `id_Country` int(3) unsigned NOT NULL DEFAULT '186',
  `showName` text,
  `feedURL` text,
  `bitRate` varchar(15) DEFAULT NULL,
  `timeOnAir` varchar(255) DEFAULT NULL,
  `id_EpisodeRate` int(3) unsigned DEFAULT NULL,
  `podcastNumber` varchar(255) DEFAULT NULL,
  `otherListeners` varchar(255) DEFAULT NULL,
  `tracking` varchar(255) DEFAULT NULL,
  `stitcherStation` varchar(255) DEFAULT NULL,
  `id_BannerSize` int(3) unsigned DEFAULT NULL,
  `promotionPlans` varchar(255) DEFAULT NULL,
  `twitterName` varchar(255) DEFAULT NULL,
  `facebookPage` varchar(255) DEFAULT NULL,
  `heardAboutPodcastIngestionEngine` varchar(255) DEFAULT NULL,
  `anythingElse` varchar(255) DEFAULT NULL,
  `agreesToTerms` int(1) unsigned NOT NULL DEFAULT '0',
  `mailingList` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_provider_idx` (`id_RSSProvider`),
  KEY `user_id_idx` (`id_PodcastIngestionEngineUser`)
) ENGINE=InnoDB AUTO_INCREMENT=173826 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PageList`
--

DROP TABLE IF EXISTS `PageList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PageList` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `entity_type` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PageListEntry`
--

DROP TABLE IF EXISTS `PageListEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PageListEntry` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_PageList` int(10) unsigned NOT NULL,
  `entity_type` tinyint(3) unsigned NOT NULL,
  `id_Entity` int(10) unsigned NOT NULL,
  `order` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pagelistentry_id_pagelist_index` (`id_PageList`),
  CONSTRAINT `pagelistentry_id_pagelist_foreign` FOREIGN KEY (`id_PageList`) REFERENCES `PageList` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PageSection`
--

DROP TABLE IF EXISTS `PageSection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PageSection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_SectionType` int(10) unsigned NOT NULL,
  `id_Entity` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` blob NOT NULL COMMENT 'Config dictating how to render section type (e.g. with/without subtitle, background color, etc.)',
  `lazy_load` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `entity_type` enum('PageList','AutomatedList','UserCreatedList') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PageList',
  PRIMARY KEY (`id`),
  KEY `pagesection_id_sectiontype_index` (`id_SectionType`),
  KEY `pagesection_id_pagelist_index` (`id_Entity`),
  CONSTRAINT `pagesection_id_sectiontype_foreign` FOREIGN KEY (`id_SectionType`) REFERENCES `PageSectionType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PageSectionGroup`
--

DROP TABLE IF EXISTS `PageSectionGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PageSectionGroup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PageSectionGroupSections`
--

DROP TABLE IF EXISTS `PageSectionGroupSections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PageSectionGroupSections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_SectionGroup` int(10) unsigned NOT NULL,
  `id_Section` int(10) unsigned NOT NULL,
  `order` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pagesectiongroupsections_id_section_index` (`id_Section`),
  KEY `pagesectiongroupsections_id_sectiongroup_index` (`id_SectionGroup`),
  CONSTRAINT `pagesectiongroupsections_id_section_foreign` FOREIGN KEY (`id_Section`) REFERENCES `PageSection` (`id`),
  CONSTRAINT `pagesectiongroupsections_id_sectiongroup_foreign` FOREIGN KEY (`id_SectionGroup`) REFERENCES `PageSectionGroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PageSectionType`
--

DROP TABLE IF EXISTS `PageSectionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PageSectionType` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PageTemplate`
--

DROP TABLE IF EXISTS `PageTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PageTemplate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT 'Homepage Premium, Browse, etc.',
  `minimum_listening_hours` smallint(6) NOT NULL DEFAULT '0',
  `required_category_wizard` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `minimum_favorites` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_unique_index` (`minimum_favorites`,`required_category_wizard`,`minimum_listening_hours`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PageTemplateEntities`
--

DROP TABLE IF EXISTS `PageTemplateEntities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PageTemplateEntities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_Template` int(10) unsigned NOT NULL,
  `id_Entity` int(10) unsigned NOT NULL,
  `entity_type` enum('Section','SectionGroup') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pagetemplateentities_id_template_index` (`id_Template`),
  CONSTRAINT `pagetemplateentities_id_template_foreign` FOREIGN KEY (`id_Template`) REFERENCES `PageTemplate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PartnerFeedRequests`
--

DROP TABLE IF EXISTS `PartnerFeedRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PartnerFeedRequests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_PodcastIngestionEngineUser` int(10) unsigned NOT NULL,
  `showName` text NOT NULL,
  `feedURL` text NOT NULL,
  `bitRate` varchar(15) DEFAULT NULL,
  `podcastNumber` varchar(255) DEFAULT NULL,
  `stitcherStation` varchar(255) DEFAULT NULL,
  `agreesToTerms` int(1) unsigned NOT NULL,
  `id_TermsOfService` int(4) unsigned NOT NULL,
  `status` enum('Pending','In Process','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `comments` text,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `id_Genre` int(11) DEFAULT NULL,
  `streaming` smallint(5) DEFAULT NULL,
  `twitterName` varchar(255) DEFAULT NULL,
  `facebookpage` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `id_language` smallint(11) DEFAULT NULL,
  `id_ListenerCount` tinyint(3) DEFAULT NULL,
  `feedOK` tinyint(3) DEFAULT NULL,
  `downloadsPerEpisode` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4040 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PartnerLanding`
--

DROP TABLE IF EXISTS `PartnerLanding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PartnerLanding` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_Partner` int(10) DEFAULT NULL,
  `ip` int(10) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1936302 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PartnerRequestBannerSizes`
--

DROP TABLE IF EXISTS `PartnerRequestBannerSizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PartnerRequestBannerSizes` (
  `id_PartnerRequest` int(10) unsigned NOT NULL,
  `id_BannerSize` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PartnerRequestShows`
--

DROP TABLE IF EXISTS `PartnerRequestShows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PartnerRequestShows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_PartnerRequest` int(10) unsigned NOT NULL,
  `showName` text NOT NULL,
  `feedURL` text NOT NULL,
  `id_Genre` int(11) DEFAULT '1',
  `streaming` smallint(5) unsigned NOT NULL DEFAULT '0',
  `twitterName` varchar(255) DEFAULT NULL,
  `facebookPage` varchar(255) DEFAULT NULL,
  `keywords` text,
  `id_Language` int(11) DEFAULT '1',
  `id_ListenerCount` tinyint(3) unsigned DEFAULT NULL,
  `feedOk` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8803 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PartnerRequests`
--

DROP TABLE IF EXISTS `PartnerRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PartnerRequests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_PodcastIngestionEngineUser` int(10) unsigned NOT NULL,
  `first_name` varchar(63) NOT NULL,
  `last_name` varchar(127) NOT NULL,
  `email` varchar(127) NOT NULL,
  `websiteURL` varchar(255) NOT NULL,
  `phone` bigint(10) unsigned DEFAULT NULL,
  `street` varchar(127) NOT NULL,
  `city` varchar(127) NOT NULL,
  `id_State` int(2) unsigned DEFAULT NULL,
  `zip` int(5) unsigned NOT NULL,
  `id_Country` int(3) unsigned NOT NULL,
  `showName` text NOT NULL,
  `feedURL` text NOT NULL,
  `bitRate` varchar(15) DEFAULT NULL,
  `timeOnAir` varchar(255) DEFAULT NULL,
  `id_EpisodeRate` int(3) unsigned DEFAULT NULL,
  `podcastNumber` varchar(255) DEFAULT NULL,
  `otherListeners` varchar(255) DEFAULT NULL,
  `tracking` varchar(255) DEFAULT NULL,
  `stitcherStation` varchar(255) DEFAULT NULL,
  `id_BannerSize` int(3) unsigned DEFAULT NULL,
  `promotionPlans` varchar(255) DEFAULT NULL,
  `twitterName` varchar(255) DEFAULT NULL,
  `facebookPage` varchar(255) DEFAULT NULL,
  `heardAboutPodcastIngestionEngine` varchar(255) DEFAULT NULL,
  `anythingElse` varchar(255) DEFAULT NULL,
  `agreesToTerms` int(1) unsigned NOT NULL DEFAULT '0',
  `id_TermsOfService` int(4) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `comments` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12330 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PendingUsers`
--

DROP TABLE IF EXISTS `PendingUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PendingUsers` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(127) NOT NULL,
  `promo_cd` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `promo_cd` (`promo_cd`)
) ENGINE=InnoDB AUTO_INCREMENT=37035 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Population`
--

DROP TABLE IF EXISTS `Population`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Population` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tableName` varchar(127) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1716 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PressEntry`
--

DROP TABLE IF EXISTS `PressEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PressEntry` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `public` tinyint(1) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProcessingFlag`
--

DROP TABLE IF EXISTS `ProcessingFlag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProcessingFlag` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `useEC2` tinyint(1) DEFAULT NULL,
  `useCurlForFeed` tinyint(1) DEFAULT NULL,
  `useCurlForAudio` tinyint(1) DEFAULT NULL,
  `checkPubdate` tinyint(1) DEFAULT NULL,
  `checkURL` tinyint(1) DEFAULT NULL,
  `checkDescription` tinyint(1) DEFAULT NULL,
  `forceCompressionToLimit` tinyint(1) DEFAULT NULL,
  `dontUseFeedPubdate` tinyint(4) DEFAULT '0',
  `dontUseUserAgent` tinyint(4) DEFAULT '0',
  `AudioURL` varchar(127) DEFAULT NULL,
  `FauxEpisodePubdate` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProcessingScoreboard`
--

DROP TABLE IF EXISTS `ProcessingScoreboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProcessingScoreboard` (
  `uniqId` char(13) DEFAULT NULL,
  `feedId` int(11) NOT NULL,
  `episodeCount` int(11) NOT NULL DEFAULT '0',
  `id_RSSEpisode_last` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `uniqId` (`uniqId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PromoLink`
--

DROP TABLE IF EXISTS `PromoLink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PromoLink` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_target` int(11) DEFAULT NULL,
  `targetTable` varchar(255) DEFAULT 'RSSFeed',
  `vanityURL` varchar(255) DEFAULT NULL,
  `shortCode` varchar(11) DEFAULT NULL,
  `redirectURL` varchar(255) DEFAULT 'http://www.stitcher.com/dl',
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT NULL,
  `useMarketing` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shortCode` (`shortCode`),
  KEY `vanityURL` (`vanityURL`(191))
) ENGINE=InnoDB AUTO_INCREMENT=10117 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PromoLinkContact`
--

DROP TABLE IF EXISTS `PromoLinkContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PromoLinkContact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_PromoLink` int(11) DEFAULT NULL,
  `contact` varchar(255) NOT NULL DEFAULT '',
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24042 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Protocol`
--

DROP TABLE IF EXISTS `Protocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Protocol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `id_Station_default` int(11) DEFAULT NULL,
  `id_Station_copy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProviderTOS`
--

DROP TABLE IF EXISTS `ProviderTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProviderTOS` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_RSSProvider` int(10) unsigned NOT NULL,
  `id_TermsOfService` tinyint(4) unsigned NOT NULL,
  `agreementDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_RSSProvider` (`id_RSSProvider`)
) ENGINE=InnoDB AUTO_INCREMENT=344843 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PubdateChange`
--

DROP TABLE IF EXISTS `PubdateChange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PubdateChange` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_RSSEpisode` int(10) DEFAULT NULL,
  `published_old` datetime DEFAULT NULL,
  `duration_old` int(10) DEFAULT NULL,
  `bitRate_old` int(10) DEFAULT NULL,
  `headerSizeInBytes_old` int(10) DEFAULT NULL,
  `published_new` datetime DEFAULT NULL,
  `duration_new` int(10) DEFAULT NULL,
  `bitRate_new` int(10) DEFAULT NULL,
  `headerSizeInBytes_new` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204841 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Question`
--

DROP TABLE IF EXISTS `Question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `id_TestGroup` int(10) DEFAULT NULL,
  `skippable` tinyint(1) DEFAULT NULL,
  `user_type` int(2) DEFAULT '0',
  `active` tinyint(1) DEFAULT '0',
  `response_target` int(10) DEFAULT NULL,
  `randomize_order` tinyint(1) DEFAULT '0',
  `id_DeviceMode` int(11) DEFAULT '0',
  `roadblockURL` varchar(255) DEFAULT NULL,
  `id_Population` int(11) DEFAULT NULL,
  `version_min` int(10) DEFAULT NULL,
  `version_max` int(10) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `autoPubDateStart` datetime DEFAULT NULL,
  `autoPubDateEnd` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QuestionOption`
--

DROP TABLE IF EXISTS `QuestionOption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionOption` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_Question` int(10) DEFAULT NULL,
  `value` int(10) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QuestionResponse`
--

DROP TABLE IF EXISTS `QuestionResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionResponse` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_Question` int(10) DEFAULT NULL,
  `id_QuestionOption` int(10) DEFAULT NULL,
  `id_User` int(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_User_idx` (`id_User`),
  KEY `id_Question_idx` (`id_Question`)
) ENGINE=InnoDB AUTO_INCREMENT=37707518 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSEpisode`
--

DROP TABLE IF EXISTS `RSSEpisode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSEpisode` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` text,
  `description` text,
  `url` text,
  `duration` int(4) DEFAULT NULL,
  `published` datetime DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `duration_expl` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `durationState` tinyint(2) DEFAULT '0',
  `valid` tinyint(2) DEFAULT '1',
  `cached` tinyint(2) DEFAULT '0',
  `title_checksum` int(10) unsigned DEFAULT '0',
  `bitRate` smallint(6) NOT NULL DEFAULT '0',
  `headerSizeInBytes` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `originalDescription` text,
  `GUID` varchar(500) DEFAULT NULL,
  `added` datetime DEFAULT CURRENT_TIMESTAMP,
  `rowUpdatedTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `feed` (`id_RSSFeed`),
  KEY `index_RSSEpisode_url` (`url`(191)),
  KEY `title_checksum_idx` (`title_checksum`),
  KEY `feed_type_idx` (`id_RSSFeed`,`type`),
  KEY `guid_idx` (`GUID`(191))
) ENGINE=InnoDB AUTO_INCREMENT=60953746 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 TRIGGER insert_trigger BEFORE INSERT on RSSEpisode 
    FOR EACH ROW  
      BEGIN  
        SET NEW.title_checksum = CRC32(NEW.title); 
      END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 TRIGGER update_trigger BEFORE UPDATE on RSSEpisode  
    FOR EACH ROW 
      BEGIN  
        SET NEW.title_checksum = CRC32(NEW.title); 
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `RSSEpisodeCategory`
--

DROP TABLE IF EXISTS `RSSEpisodeCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSEpisodeCategory` (
  `id_RSSEpisode` int(10) NOT NULL DEFAULT '0',
  `id_Category` int(10) NOT NULL DEFAULT '0',
  `auto` tinyint(4) DEFAULT '0',
  KEY `Category_idx` (`id_Category`),
  KEY `Episode_idx` (`id_RSSEpisode`),
  KEY `auto_idx` (`id_RSSEpisode`,`auto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSEpisodeChild`
--

DROP TABLE IF EXISTS `RSSEpisodeChild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSEpisodeChild` (
  `id_RSSEpisode` int(11) NOT NULL DEFAULT '0',
  `id_RSSEpisode_parent` int(11) DEFAULT NULL,
  `startTime` float DEFAULT NULL,
  `endTime` float DEFAULT NULL,
  `bumperURL` text,
  `childType` tinyint(1) DEFAULT NULL,
  `creator` varchar(31) DEFAULT NULL,
  `tweeted` tinyint(1) DEFAULT NULL,
  `facebooked` tinyint(1) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `inApp` tinyint(1) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_RSSEpisode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSEpisodeCustomInfo`
--

DROP TABLE IF EXISTS `RSSEpisodeCustomInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSEpisodeCustomInfo` (
  `id_RSSEpisode` int(11) DEFAULT NULL,
  `imagePublic` tinyint(4) DEFAULT NULL,
  `titlePublic` tinyint(4) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `lastUser` varchar(255) DEFAULT NULL,
  `imageSource` varchar(255) DEFAULT NULL,
  `twitterImagePublic` tinyint(1) DEFAULT NULL,
  KEY `id_rssepisode_idx` (`id_RSSEpisode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSEpisodeEnhanced`
--

DROP TABLE IF EXISTS `RSSEpisodeEnhanced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSEpisodeEnhanced` (
  `id_RSSEpisode` int(11) NOT NULL,
  `episodeNumber` int(11) DEFAULT NULL,
  `externalId` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSEpisode`),
  KEY `id_externalId_idx` (`externalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSEpisodeGuestMap`
--

DROP TABLE IF EXISTS `RSSEpisodeGuestMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSEpisodeGuestMap` (
  `id_RSSEpisode` int(11) NOT NULL,
  `id_NamedEntity` int(11) NOT NULL,
  `guestType` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id_RSSEpisode_NamedEntity_idx` (`id_RSSEpisode`,`id_NamedEntity`),
  KEY `id_RSSEpisode_idx` (`id_RSSEpisode`),
  KEY `id_NamedEntity_idx` (`id_NamedEntity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSEpisodeImageMap`
--

DROP TABLE IF EXISTS `RSSEpisodeImageMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSEpisodeImageMap` (
  `id_RSSEpisode` int(11) NOT NULL,
  `id_Image` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id_RSSEpisode_Image_idx` (`id_RSSEpisode`,`id_Image`),
  KEY `id_RSSEpisode_idx` (`id_RSSEpisode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSEpisodeLastCommented`
--

DROP TABLE IF EXISTS `RSSEpisodeLastCommented`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSEpisodeLastCommented` (
  `id_RSSEpisode` int(11) DEFAULT NULL,
  `last_viewed_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `checked` tinyint(1) DEFAULT '0',
  UNIQUE KEY `id_rssepisode_idx` (`id_RSSEpisode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSEpisodeMetadata`
--

DROP TABLE IF EXISTS `RSSEpisodeMetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSEpisodeMetadata` (
  `id_RSSEpisode` int(10) NOT NULL DEFAULT '0',
  `hash` char(64) DEFAULT NULL,
  `found_at` datetime DEFAULT NULL,
  `public_at` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSEpisode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSEpisodePubEvent`
--

DROP TABLE IF EXISTS `RSSEpisodePubEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSEpisodePubEvent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_RSSEpisode` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) DEFAULT '0',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `cronsearch` (`time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSEpisodeSEOKey`
--

DROP TABLE IF EXISTS `RSSEpisodeSEOKey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSEpisodeSEOKey` (
  `id_RSSEpisode` int(11) NOT NULL,
  `seokey` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_RSSEpisode`),
  KEY `seokey_idx` (`seokey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSEpisodeSeasonMap`
--

DROP TABLE IF EXISTS `RSSEpisodeSeasonMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSEpisodeSeasonMap` (
  `id_Season` int(11) NOT NULL,
  `id_RSSEpisode` int(11) NOT NULL,
  `episodeNumber` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id_Season_RSSEpisode_idx` (`id_Season`,`id_RSSEpisode`),
  UNIQUE KEY `id_RSSEpisode_idx` (`id_RSSEpisode`),
  KEY `id_Season_idx` (`id_Season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeed`
--

DROP TABLE IF EXISTS `RSSFeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_RSSProvider` int(5) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `secureURL` varchar(255) DEFAULT NULL,
  `webURL` varchar(255) DEFAULT NULL,
  `infoURL` varchar(255) DEFAULT NULL,
  `seokey` varchar(80) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `seoDescription` text,
  `id_Genre` int(10) DEFAULT '1',
  `id_Country` int(3) unsigned DEFAULT NULL,
  `author` varchar(127) DEFAULT NULL,
  `blacklist` varchar(255) DEFAULT NULL,
  `rating` int(4) DEFAULT '32768' COMMENT 'Default = 2.5',
  `updateFrequency` int(4) DEFAULT NULL,
  `averageDuration` int(4) DEFAULT '0',
  `stddevDuration` int(4) NOT NULL DEFAULT '0',
  `added` datetime DEFAULT NULL,
  `lastUpdate` datetime DEFAULT NULL,
  `lastChecked` datetime DEFAULT NULL,
  `id_RSSEpisode_last` int(10) DEFAULT NULL,
  `explicit` tinyint(1) DEFAULT '0',
  `sourceListOnly` tinyint(1) DEFAULT '0',
  `public` tinyint(1) DEFAULT '0',
  `directory` tinyint(1) DEFAULT '0',
  `retrieveDuration` tinyint(1) DEFAULT '1',
  `retrieveImage` tinyint(1) DEFAULT '1',
  `retrieveName` tinyint(1) DEFAULT '1',
  `retrieveDescription` tinyint(1) DEFAULT '1',
  `imageURL` varchar(255) DEFAULT NULL,
  `imageX` int(2) DEFAULT NULL,
  `imageY` int(2) DEFAULT NULL,
  `thumbnailURL` varchar(255) DEFAULT NULL,
  `mastheadImageFilename` varchar(255) DEFAULT NULL,
  `processingError` int(2) unsigned DEFAULT '0',
  `sendOrigAudio` tinyint(1) unsigned DEFAULT '0',
  `downsampleBitrate` smallint(6) DEFAULT NULL,
  `bitRate` smallint(2) DEFAULT '0',
  `bitRateOverride` tinyint(1) DEFAULT NULL,
  `supKeywords` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `ep_title` varchar(255) DEFAULT NULL,
  `ep_description` text,
  `compress` tinyint(1) DEFAULT '1',
  `zip` int(5) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `video` tinyint(1) DEFAULT '0',
  `id_Language` int(10) DEFAULT '1',
  `skippable` tinyint(1) DEFAULT '1',
  `upRating` int(4) DEFAULT '0',
  `downRating` int(4) DEFAULT '0',
  `displayLinkURL` varchar(255) DEFAULT NULL,
  `cacheEpisodes` tinyint(1) DEFAULT '1',
  `authURL` varchar(255) DEFAULT NULL,
  `authMethod` tinyint(2) DEFAULT '0',
  `noProcess` tinyint(1) DEFAULT '0',
  `noEpisodeTakedown` tinyint(4) DEFAULT '0',
  `multiEpisode` tinyint(1) DEFAULT '0',
  `subscribeURL` varchar(255) DEFAULT NULL,
  `id_DeviceMode` int(11) NOT NULL DEFAULT '0',
  `streaming` smallint(4) NOT NULL DEFAULT '0',
  `noMarkHeard` tinyint(1) DEFAULT '0',
  `id_Station` int(10) unsigned NOT NULL DEFAULT '0',
  `archivedEpisodeCount` int(4) DEFAULT '0',
  `dontRecommend` tinyint(4) NOT NULL DEFAULT '0',
  `scheduleURL` varchar(255) DEFAULT NULL,
  `newEpisodeAlert` tinyint(4) NOT NULL DEFAULT '0',
  `twitterName` varchar(255) DEFAULT NULL,
  `customImage` tinyint(1) DEFAULT NULL,
  `customImageSource` varchar(255) DEFAULT NULL,
  `transcribe` tinyint(1) NOT NULL DEFAULT '0',
  `showWebsiteURL` text,
  `facebookPageURL` text,
  `donationURL` text,
  `donationEmail` varchar(250) DEFAULT NULL,
  `isReviewed` tinyint(4) DEFAULT '0',
  `hasUnpublishedEpisodes` tinyint(1) DEFAULT NULL,
  `isClippable` tinyint(4) DEFAULT '1',
  `episodeCount` int(11) DEFAULT NULL,
  `GeoCardOK` tinyint(4) DEFAULT '0',
  `color` varchar(10) DEFAULT NULL,
  `pushToDeezer` tinyint(4) NOT NULL DEFAULT '0',
  `sendPastEpisodesToDeezer` tinyint(4) NOT NULL DEFAULT '0',
  `takedown` int(11) DEFAULT '0',
  `autoSeason` tinyint(4) DEFAULT '0',
  `ingestionMethod` tinyint(4) DEFAULT '0',
  `rowUpdatedTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seokey` (`seokey`),
  KEY `genre` (`id_Genre`),
  KEY `lastfeed_idx` (`id_RSSEpisode_last`),
  KEY `zip_idx` (`zip`),
  KEY `id_provider_idx` (`id_RSSProvider`),
  KEY `language_idx` (`id_Language`),
  KEY `country_idx` (`id_Country`),
  KEY `last_update_idx` (`lastUpdate`)
) ENGINE=InnoDB AUTO_INCREMENT=409781 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedBanner`
--

DROP TABLE IF EXISTS `RSSFeedBanner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedBanner` (
  `id_RSSFeed` int(10) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `public` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedCategory`
--

DROP TABLE IF EXISTS `RSSFeedCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedCategory` (
  `id_RSSFeed` int(10) NOT NULL DEFAULT '0',
  `id_Category` int(10) NOT NULL DEFAULT '0',
  `auto` tinyint(4) DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `Category_idx` (`id_Category`),
  KEY `Feed_idx` (`id_RSSFeed`),
  KEY `auto_idx` (`id_RSSFeed`,`auto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedColor`
--

DROP TABLE IF EXISTS `RSSFeedColor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedColor` (
  `id_RSSFeed` int(11) NOT NULL DEFAULT '0',
  `color` varchar(10) NOT NULL DEFAULT '',
  `checksum` varchar(32) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedCountry`
--

DROP TABLE IF EXISTS `RSSFeedCountry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedCountry` (
  `id_RSSFeed` int(10) unsigned NOT NULL DEFAULT '0',
  `id_Country` int(10) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `feed` (`id_RSSFeed`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedCuratedReco`
--

DROP TABLE IF EXISTS `RSSFeedCuratedReco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedCuratedReco` (
  `id_RSSFeed` int(11) NOT NULL,
  `list` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSFeed`),
  UNIQUE KEY `id_RSSFeed_UNIQUE` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedEnhanced`
--

DROP TABLE IF EXISTS `RSSFeedEnhanced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedEnhanced` (
  `id_RSSFeed` int(11) NOT NULL,
  `sortDirection` char(4) DEFAULT 'DESC',
  `isPremium` int(11) DEFAULT '1',
  `contentType` varchar(255) DEFAULT NULL,
  `defaultSeason` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSFeed`),
  KEY `id_RSSFeed_idx` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedExternalMap`
--

DROP TABLE IF EXISTS `RSSFeedExternalMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedExternalMap` (
  `id_RSSFeed` int(11) NOT NULL,
  `id_External` int(11) NOT NULL,
  `id_Source` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `id_External_idx` (`id_External`),
  KEY `id_RSSFeed_idx` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedHTTPResponse`
--

DROP TABLE IF EXISTS `RSSFeedHTTPResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedHTTPResponse` (
  `id_RSSFeed` int(11) NOT NULL,
  `etag` varchar(128) DEFAULT NULL,
  `lastModified` varchar(64) DEFAULT NULL,
  `headers` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSFeed`),
  UNIQUE KEY `etag_idx` (`etag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='ALTER TABLE `Image` ADD COLUMN sourceURL text AFTER id';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedHeaders`
--

DROP TABLE IF EXISTS `RSSFeedHeaders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedHeaders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `etag` text,
  `last_modified` datetime DEFAULT NULL,
  `hash` char(64) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `feed` (`id_RSSFeed`)
) ENGINE=InnoDB AUTO_INCREMENT=236158 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedHeardTemp`
--

DROP TABLE IF EXISTS `RSSFeedHeardTemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedHeardTemp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `id_RSSEpisode` int(10) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1435363216 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedHeat`
--

DROP TABLE IF EXISTS `RSSFeedHeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedHeat` (
  `id_RSSFeed` int(11) NOT NULL,
  `heat` float NOT NULL,
  `mheat` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_RSSFeed`),
  KEY `heat` (`heat`),
  KEY `mheat` (`mheat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedHostMap`
--

DROP TABLE IF EXISTS `RSSFeedHostMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedHostMap` (
  `id_RSSFeed` int(11) NOT NULL,
  `id_NamedEntity` int(11) NOT NULL,
  `hostType` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id_RSSFeed_NamedEntity_idx` (`id_RSSFeed`,`id_NamedEntity`),
  KEY `id_RSSFeed_idx` (`id_RSSFeed`),
  KEY `id_NamedEntity_idx` (`id_NamedEntity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedImageHeaders`
--

DROP TABLE IF EXISTS `RSSFeedImageHeaders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedImageHeaders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `etag` text,
  `hash` char(64) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `feed` (`id_RSSFeed`)
) ENGINE=InnoDB AUTO_INCREMENT=370470 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedOnboardingIssues`
--

DROP TABLE IF EXISTS `RSSFeedOnboardingIssues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedOnboardingIssues` (
  `id_RSSFeed` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `issue_type` smallint(6) NOT NULL,
  `issue_text` text,
  `references_id_RSSFeed` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSFeed`),
  KEY `url_idx` (`url`(191)),
  KEY `name_idx` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedParts`
--

DROP TABLE IF EXISTS `RSSFeedParts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedParts` (
  `id_RSSFeed` int(10) DEFAULT NULL,
  `id_RSSEpisode` int(10) DEFAULT NULL,
  `part` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedPremiumMap`
--

DROP TABLE IF EXISTS `RSSFeedPremiumMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedPremiumMap` (
  `id_RSSFeed_free` int(11) DEFAULT NULL,
  `id_RSSFeed_premium` int(11) DEFAULT NULL,
  `autoSync` tinyint(1) DEFAULT '0',
  `doPreview` tinyint(4) DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `free_premium_idx` (`id_RSSFeed_free`,`id_RSSFeed_premium`),
  UNIQUE KEY `id_RSSFeed_free_idx` (`id_RSSFeed_free`),
  UNIQUE KEY `id_RSSFeed_premium_idx` (`id_RSSFeed_premium`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedProcessingStatus`
--

DROP TABLE IF EXISTS `RSSFeedProcessingStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedProcessingStatus` (
  `id_RSSFeed` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(127) DEFAULT '0',
  PRIMARY KEY (`id_RSSFeed`),
  KEY `idx_id_RSSFeed` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedRating`
--

DROP TABLE IF EXISTS `RSSFeedRating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedRating` (
  `id_RSSFeed` int(11) NOT NULL,
  `upRating` int(11) DEFAULT '0',
  `downRating` int(11) DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSFeed`),
  UNIQUE KEY `id_RSSFeed_UNIQUE` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedScore`
--

DROP TABLE IF EXISTS `RSSFeedScore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedScore` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_User` int(10) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `weight` int(4) DEFAULT NULL,
  `numChanges` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed` (`id_RSSFeed`),
  KEY `user` (`id_User`)
) ENGINE=InnoDB AUTO_INCREMENT=3816002 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedSigned`
--

DROP TABLE IF EXISTS `RSSFeedSigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedSigned` (
  `id_RSSFeed` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSFeed`),
  UNIQUE KEY `id_RSSFeed` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedSocialFollowers`
--

DROP TABLE IF EXISTS `RSSFeedSocialFollowers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedSocialFollowers` (
  `id_RSSFeed` int(11) NOT NULL DEFAULT '0',
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `followerType` tinyint(4) DEFAULT NULL,
  `followerResource` varchar(255) DEFAULT NULL,
  `followerCount` bigint(20) DEFAULT NULL,
  KEY `feed_date_idx` (`id_RSSFeed`,`lastUpdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedStats`
--

DROP TABLE IF EXISTS `RSSFeedStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedStats` (
  `id_RSSFeed` int(10) NOT NULL DEFAULT '0',
  `listens` int(4) DEFAULT NULL,
  `skips` int(4) DEFAULT NULL,
  `completes` int(4) DEFAULT NULL,
  `favorites` int(4) DEFAULT NULL,
  PRIMARY KEY (`id_RSSFeed`),
  KEY `id` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSFeedText`
--

DROP TABLE IF EXISTS `RSSFeedText`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSFeedText` (
  `id` int(10) NOT NULL DEFAULT '0',
  `keywords` varchar(511) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `author` varchar(127) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `blacklist` varchar(255) DEFAULT NULL,
  `epTitle` varchar(127) DEFAULT NULL,
  `epDescription` varchar(255) DEFAULT NULL,
  `epKeywords` varchar(255) DEFAULT NULL,
  `averageDuration` int(4) DEFAULT NULL,
  `public` tinyint(2) NOT NULL DEFAULT '0',
  `lastUpdate` datetime DEFAULT NULL,
  `id_DeviceMode` mediumint(9) NOT NULL DEFAULT '0',
  `streaming` tinyint(4) NOT NULL DEFAULT '0',
  `authMethod` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `keywords` (`keywords`),
  FULLTEXT KEY `episodes` (`epTitle`,`epDescription`,`epKeywords`),
  FULLTEXT KEY `text` (`keywords`,`description`,`author`,`name`,`epTitle`,`epDescription`,`epKeywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSProvider`
--

DROP TABLE IF EXISTS `RSSProvider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSProvider` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `shortName` varchar(255) DEFAULT NULL,
  `seokey` varchar(80) NOT NULL,
  `public` tinyint(1) DEFAULT '0',
  `id_Station` int(10) DEFAULT NULL,
  `displayAds` tinyint(1) DEFAULT '1',
  `houseAudioAds` tinyint(1) DEFAULT '1',
  `paidAudioAds` tinyint(1) DEFAULT '1',
  `hasSpecialAgreement` tinyint(1) NOT NULL DEFAULT '0',
  `agreesToTerms` tinyint(1) NOT NULL DEFAULT '0',
  `agreementNotes` text,
  `affiliateStatus` enum('not an affiliate','applied','affiliate') NOT NULL DEFAULT 'not an affiliate',
  `blockComments` tinyint(4) NOT NULL DEFAULT '0',
  `adsOnDeezer` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `seokey` (`seokey`)
) ENGINE=InnoDB AUTO_INCREMENT=178573 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RSSProviderSettings`
--

DROP TABLE IF EXISTS `RSSProviderSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RSSProviderSettings` (
  `id_RSSProvider` int(11) DEFAULT NULL,
  `settingKey` varchar(100) DEFAULT NULL,
  `settingVal` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `setting_key_idx` (`id_RSSProvider`,`settingKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ratings`
--

DROP TABLE IF EXISTS `Ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ratings` (
  `id` varchar(11) NOT NULL DEFAULT '',
  `total_votes` int(11) NOT NULL,
  `total_value` int(11) NOT NULL,
  `user_ids` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReferralMessage`
--

DROP TABLE IF EXISTS `ReferralMessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferralMessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_User` int(11) NOT NULL DEFAULT '0',
  `message` varchar(510) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1854438 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SEOKeyArchive`
--

DROP TABLE IF EXISTS `SEOKeyArchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEOKeyArchive` (
  `seokey` varchar(80) NOT NULL,
  `entity` varchar(22) NOT NULL,
  `id_Entity` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`seokey`,`entity`),
  KEY `id_Entity_idx` (`id_Entity`),
  KEY `seo_idx` (`seokey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SINGLE_ROW_TABLE`
--

DROP TABLE IF EXISTS `SINGLE_ROW_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SINGLE_ROW_TABLE` (
  `dummy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SMSInviteMessage`
--

DROP TABLE IF EXISTS `SMSInviteMessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SMSInviteMessage` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `message` varchar(500) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SMSNumber`
--

DROP TABLE IF EXISTS `SMSNumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SMSNumber` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SPFeeds`
--

DROP TABLE IF EXISTS `SPFeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SPFeeds` (
  `id_RSSFeed` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SearchRecord`
--

DROP TABLE IF EXISTS `SearchRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SearchRecord` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `term` char(63) DEFAULT NULL,
  `id_User` int(10) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mode` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `term_idx` (`term`)
) ENGINE=InnoDB AUTO_INCREMENT=48631278 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SearchRecordResultCount`
--

DROP TABLE IF EXISTS `SearchRecordResultCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SearchRecordResultCount` (
  `id_SearchRecord` int(10) DEFAULT NULL,
  `keyword` int(10) DEFAULT NULL,
  `mention` int(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SearchRecordSource`
--

DROP TABLE IF EXISTS `SearchRecordSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SearchRecordSource` (
  `id_SearchRecord` int(10) NOT NULL,
  `source` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Season`
--

DROP TABLE IF EXISTS `Season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_RSSFeed` int(11) NOT NULL,
  `seasonNumber` int(11) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `description` text,
  `releaseDate` datetime DEFAULT NULL,
  `isDefaultSeason` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_RSSFeed_seasonNumber_idx` (`id_RSSFeed`,`seasonNumber`),
  KEY `id_RSSFeed_idx` (`id_RSSFeed`)
) ENGINE=InnoDB AUTO_INCREMENT=18334 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sessions`
--

DROP TABLE IF EXISTS `Sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `session_key` varchar(100) DEFAULT NULL,
  `session_data` text,
  `expiration_date` datetime NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_session_key_idx` (`session_key`)
) ENGINE=InnoDB AUTO_INCREMENT=142327 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Settings`
--

DROP TABLE IF EXISTS `Settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Settings` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `settingsKey` varchar(127) DEFAULT NULL,
  `settingsValue` varchar(510) DEFAULT NULL,
  `comment` varchar(510) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `key` (`settingsKey`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Shortcut`
--

DROP TABLE IF EXISTS `Shortcut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shortcut` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shortcut_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `shortcut_type` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SiteManagement`
--

DROP TABLE IF EXISTS `SiteManagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteManagement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item` varchar(30) DEFAULT NULL,
  `value` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `States`
--

DROP TABLE IF EXISTS `States`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `States` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `abbreviation` char(2) NOT NULL,
  `longName` varchar(31) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Station`
--

DROP TABLE IF EXISTS `Station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Station` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `type` tinyint(1) unsigned DEFAULT NULL,
  `id_Station_parent` int(10) DEFAULT NULL,
  `id_User` int(10) DEFAULT NULL,
  `keywords` text,
  `supKeywords` text,
  `blacklist` varchar(511) DEFAULT NULL,
  `optimalDuration` int(4) DEFAULT NULL,
  `public` tinyint(2) DEFAULT NULL,
  `rank` int(4) unsigned DEFAULT '0',
  `temporary` tinyint(2) DEFAULT '0',
  `id_Genre` int(10) DEFAULT '0',
  `id_Language` int(10) DEFAULT '1',
  `explicit` tinyint(1) DEFAULT '0',
  `feedCount` int(10) DEFAULT '40',
  `device` int(10) DEFAULT NULL,
  `adKey` varchar(40) DEFAULT NULL,
  `id_ListHead_banned` int(11) NOT NULL DEFAULT '0',
  `sponsored` int(10) DEFAULT '0',
  `synonyms` varchar(255) DEFAULT NULL,
  `thumbnailURL` varchar(255) NOT NULL,
  `hrThumbnailURL` varchar(255) NOT NULL,
  `feedThumbnail` tinyint(1) NOT NULL DEFAULT '1',
  `id_RSSFeed_thumbnail` int(10) NOT NULL,
  `pushToDeezer` tinyint(4) DEFAULT '0',
  `editable` tinyint(4) DEFAULT '0',
  `premium` tinyint(4) DEFAULT '0',
  `rowUpdatedTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parent` (`id_Station_parent`),
  KEY `user` (`id_User`),
  KEY `public_idx` (`public`),
  KEY `type_idx` (`type`),
  KEY `editable_idx` (`editable`)
) ENGINE=InnoDB AUTO_INCREMENT=1489196 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StationCountry`
--

DROP TABLE IF EXISTS `StationCountry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StationCountry` (
  `id_Station` int(11) NOT NULL,
  `id_Country` int(11) NOT NULL DEFAULT '0',
  KEY `index1` (`id_Station`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StationGroup`
--

DROP TABLE IF EXISTS `StationGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StationGroup` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT 'Unnamed Group',
  `public` tinyint(1) DEFAULT '0',
  `rank` int(10) DEFAULT '0',
  `thumbnailURL` varchar(255) NOT NULL,
  `hrThumbnailURL` varchar(255) NOT NULL,
  `stationThumbnail` tinyint(1) NOT NULL DEFAULT '1',
  `id_Station_thumbnail` int(10) NOT NULL,
  `uiColor` varchar(15) NOT NULL DEFAULT '#000000',
  `id_DeviceMode` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StationGroupEntry`
--

DROP TABLE IF EXISTS `StationGroupEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StationGroupEntry` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_StationGroup` int(10) DEFAULT NULL,
  `id_Station` int(10) DEFAULT NULL,
  `id_StationGroup_child` int(11) NOT NULL DEFAULT '0',
  `id_Target` int(11) DEFAULT '0',
  `targetType` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `station_idx` (`id_Station`),
  KEY `child_idx` (`id_StationGroup_child`)
) ENGINE=InnoDB AUTO_INCREMENT=749 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StationGroupMasthead`
--

DROP TABLE IF EXISTS `StationGroupMasthead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StationGroupMasthead` (
  `id_StationGroup` int(11) NOT NULL,
  `actionURL` varchar(255) DEFAULT NULL,
  `hasImage` tinyint(4) DEFAULT '0',
  `imageType` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_StationGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StationMasthead`
--

DROP TABLE IF EXISTS `StationMasthead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StationMasthead` (
  `id_Station` int(11) NOT NULL,
  `actionURL` varchar(255) DEFAULT NULL,
  `hasImage` tinyint(4) DEFAULT '0',
  `imageType` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_Station`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SubscriptionRecord`
--

DROP TABLE IF EXISTS `SubscriptionRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubscriptionRecord` (
  `id_User` int(11) DEFAULT NULL,
  `receipt` text,
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id_SubscriptionType` tinyint(2) DEFAULT NULL,
  KEY `user_idx` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SubscriptionType`
--

DROP TABLE IF EXISTS `SubscriptionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubscriptionType` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `duration` int(10) DEFAULT NULL,
  `productID` varchar(100) DEFAULT NULL,
  `platform` varchar(11) DEFAULT NULL,
  `isAutoRenewing` tinyint(4) DEFAULT NULL,
  `subscriptionTier` varchar(255) NOT NULL DEFAULT 'premium',
  `durationString` varchar(200) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TermsOfService`
--

DROP TABLE IF EXISTS `TermsOfService`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TermsOfService` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `creationDate` date NOT NULL,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `revisionDate` date NOT NULL,
  `text` text,
  `version` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TestGroup`
--

DROP TABLE IF EXISTS `TestGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TestGroup` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `lastUpdate` datetime DEFAULT NULL,
  `size` int(5) DEFAULT NULL,
  `maxSize` int(5) DEFAULT NULL,
  `autoPopulateNew` tinyint(2) DEFAULT NULL,
  `autoPopulateReturning` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Timeline`
--

DROP TABLE IF EXISTS `Timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Timeline` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1274 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TopList`
--

DROP TABLE IF EXISTS `TopList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TopList` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT 'title',
  `id_User` int(11) DEFAULT NULL,
  `description` text,
  `listed` tinyint(4) DEFAULT '1',
  `public` tinyint(4) DEFAULT '1',
  `seokey` varchar(80) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `deleted` tinyint(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `seokey` (`seokey`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TopListItem`
--

DROP TABLE IF EXISTS `TopListItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TopListItem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_topList` int(11) DEFAULT NULL,
  `title` text,
  `description` text,
  `id_RSSEpisode` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2688 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TopTenList`
--

DROP TABLE IF EXISTS `TopTenList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TopTenList` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT 'title',
  `id_User` int(11) DEFAULT NULL,
  `description` text,
  `listed` tinyint(4) DEFAULT '1',
  `public` tinyint(4) DEFAULT '1',
  `seokey` varchar(80) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seokey` (`seokey`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TopTenListItem`
--

DROP TABLE IF EXISTS `TopTenListItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TopTenListItem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_topTenList` int(11) DEFAULT NULL,
  `title` text,
  `description` text,
  `id_RSSEpisode` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Trivia`
--

DROP TABLE IF EXISTS `Trivia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Trivia` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_User` int(10) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `id_RSSEpisode` int(10) DEFAULT NULL,
  `response` int(1) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `id_DeviceMode` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299345 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TwitterBotMessageType`
--

DROP TABLE IF EXISTS `TwitterBotMessageType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TwitterBotMessageType` (
  `id` tinyint(4) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TwitterBotOpp`
--

DROP TABLE IF EXISTS `TwitterBotOpp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TwitterBotOpp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_RSSEpisode` int(10) DEFAULT NULL,
  `id_named_entities` int(10) DEFAULT NULL,
  `entity` varchar(60) DEFAULT NULL,
  `totalHandles` int(10) DEFAULT NULL,
  `totalFollowers` int(10) DEFAULT NULL,
  `state` tinyint(2) DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1462 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TwitterBotTweet`
--

DROP TABLE IF EXISTS `TwitterBotTweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TwitterBotTweet` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tweetID` varchar(200) DEFAULT NULL,
  `id_TwitterHandle` int(10) DEFAULT NULL,
  `id_named_entities` int(10) DEFAULT NULL,
  `entity` varchar(60) DEFAULT NULL,
  `id_TwitterBotMessageType` tinyint(4) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `retweets` int(10) DEFAULT NULL,
  `clicks` int(10) DEFAULT NULL,
  `id_RSSEpisode` int(10) DEFAULT NULL,
  `added` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TwitterHandle`
--

DROP TABLE IF EXISTS `TwitterHandle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TwitterHandle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `handle` varchar(30) DEFAULT NULL,
  `id_named_entities` int(10) DEFAULT NULL,
  `entity` varchar(60) DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL,
  `followers` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UFPWizardAB`
--

DROP TABLE IF EXISTS `UFPWizardAB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UFPWizardAB` (
  `id_User` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UsageInfo`
--

DROP TABLE IF EXISTS `UsageInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UsageInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `feed_id` int(10) DEFAULT NULL,
  `episode_id` int(10) DEFAULT NULL,
  `count_iPod` int(2) DEFAULT NULL,
  `count_iTunes` int(2) DEFAULT NULL,
  `count_website` int(2) DEFAULT NULL,
  `date_last_played` datetime DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `iPod_auto_sync` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=833 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UseCount`
--

DROP TABLE IF EXISTS `UseCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UseCount` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_User` int(10) DEFAULT NULL,
  `id_Station` int(10) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `id_RSSEpisode` int(10) DEFAULT '0',
  `mode` int(1) DEFAULT NULL,
  `timestamp` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action_count` smallint(5) unsigned DEFAULT NULL,
  `completed` int(3) DEFAULT '0',
  `time` int(2) DEFAULT '0',
  `skipped` tinyint(1) DEFAULT '0',
  `error` int(4) DEFAULT '0',
  `testGroup` int(10) DEFAULT NULL,
  `version` smallint(5) unsigned DEFAULT NULL,
  `extraData` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `iuser_id_idx` (`id_User`),
  KEY `episode_id_idx` (`id_RSSEpisode`),
  KEY `idx_id_RSSFeed` (`id_RSSFeed`)
) ENGINE=InnoDB AUTO_INCREMENT=197125 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UseCountDups`
--

DROP TABLE IF EXISTS `UseCountDups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UseCountDups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_User` int(10) DEFAULT NULL,
  `id_Station` int(10) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `id_RSSEpisode` int(10) DEFAULT '0',
  `mode` int(1) DEFAULT NULL,
  `timestamp` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action_count` smallint(5) unsigned DEFAULT NULL,
  `completed` int(3) DEFAULT '0',
  `time` int(2) DEFAULT '0',
  `skipped` tinyint(1) DEFAULT '0',
  `error` int(4) DEFAULT '0',
  `testGroup` int(10) DEFAULT NULL,
  `version` smallint(5) unsigned DEFAULT NULL,
  `extraData` bigint(20) DEFAULT NULL,
  `postAttempt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `iuser_id_idx` (`id_User`),
  KEY `episode_id_idx` (`id_RSSEpisode`),
  KEY `idx_id_RSSFeed` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(31) DEFAULT NULL,
  `email` varchar(127) DEFAULT NULL,
  `fullName` varchar(63) DEFAULT NULL,
  `password` varchar(63) DEFAULT NULL,
  `phone` bigint(10) DEFAULT NULL,
  `pin` int(4) DEFAULT '0',
  `valid` tinyint(1) DEFAULT '0',
  `demo` int(1) DEFAULT '0',
  `partnerRef` int(10) DEFAULT NULL,
  `regMode` int(1) DEFAULT NULL,
  `mailingList` int(1) DEFAULT '0',
  `registered` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `gender` tinyint(1) DEFAULT '0',
  `zip` int(5) DEFAULT '0',
  `sync_count` int(10) DEFAULT '0',
  `iPhone_play_count` int(10) DEFAULT '0',
  `id_Station_favorites` int(10) DEFAULT NULL,
  `id_ListHead_favorites` int(10) DEFAULT NULL,
  `testGroup` int(10) DEFAULT NULL,
  `initialRegState` tinyint(4) DEFAULT NULL,
  `id_UserAgent` int(10) DEFAULT NULL,
  `ratings` int(4) unsigned NOT NULL DEFAULT '0',
  `explicit` tinyint(1) unsigned DEFAULT '1',
  `timezone` int(2) DEFAULT '-1',
  `version` varchar(40) DEFAULT NULL,
  `total_listening_time` int(10) DEFAULT NULL,
  `id_ListHead_liveFavorites` int(11) NOT NULL DEFAULT '0',
  `playNewOnly` tinyint(4) NOT NULL DEFAULT '1',
  `uponAppLaunch` varchar(24) NOT NULL DEFAULT 'front_page',
  `crypt_pw` varchar(255) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `userAgent` (`id_UserAgent`),
  KEY `testGroup_idx` (`testGroup`),
  KEY `deleted_idx` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=1007897086 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 TRIGGER welcome_trigger AFTER INSERT on sa1.User  
    FOR EACH ROW 
     BEGIN 
        INSERT INTO sa1.WelcomeEmailUsers (id_User) values (NEW.id);
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `UserAgent`
--

DROP TABLE IF EXISTS `UserAgent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserAgent` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(511) DEFAULT NULL,
  `crawler` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_idx` (`identifier`(191))
) ENGINE=InnoDB AUTO_INCREMENT=185765 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserData`
--

DROP TABLE IF EXISTS `UserData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserData` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `id_ListHead_banned` int(11) NOT NULL DEFAULT '0',
  `deviceToken` varchar(512) DEFAULT NULL,
  `facebookID` varchar(255) DEFAULT NULL,
  `facebookAccessToken` text,
  `registration_id` varchar(512) DEFAULT NULL,
  `facebookShareEnabled` tinyint(4) DEFAULT '0',
  `shareListenFB` tinyint(4) DEFAULT '0',
  `shareThumbsFB` tinyint(4) DEFAULT '0',
  `shareFavsFB` tinyint(4) DEFAULT '0',
  `lastAlert` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` smallint(5) unsigned DEFAULT NULL,
  `facebookConnectDate` datetime DEFAULT NULL,
  `androidId` varchar(255) DEFAULT NULL,
  `isGCM` tinyint(4) DEFAULT '0',
  `googleID` varchar(100) DEFAULT NULL,
  `googleAccessToken` text,
  `googleConnectDate` datetime DEFAULT NULL,
  `googleRefreshToken` text,
  PRIMARY KEY (`id_User`),
  KEY `id_ListHead_banned_idx` (`id_ListHead_banned`),
  KEY `facebook_id_idx` (`facebookID`(191)),
  KEY `fb_connect_dt` (`facebookConnectDate`),
  KEY `id_devicetoken` (`deviceToken`(191)),
  KEY `google_id_idx` (`googleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserDeleted`
--

DROP TABLE IF EXISTS `UserDeleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserDeleted` (
  `id_Deleted` int(11) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_Deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserDeletionQueue`
--

DROP TABLE IF EXISTS `UserDeletionQueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserDeletionQueue` (
  `id_User` int(10) unsigned NOT NULL,
  `fb_users_profile__email` varchar(127) DEFAULT NULL,
  `fb_users_profile__birthday` date DEFAULT NULL,
  `fb_users_profile__first_name` varchar(63) DEFAULT NULL,
  `fb_users_profile__gender` varchar(6) DEFAULT NULL,
  `fb_users_profile__last_name` varchar(63) DEFAULT NULL,
  `UserDetails__birthday` date DEFAULT NULL,
  `UserDetails__gender` varchar(10) DEFAULT NULL,
  `UserData__facebookAccessToken` text,
  `UserData__facebookID` varchar(255) DEFAULT NULL,
  `UserData__androidId` varchar(255) DEFAULT NULL,
  `UserData__deviceToken` varchar(512) DEFAULT NULL,
  `UserData__googleAccessToken` text,
  `UserData__googleID` varchar(100) DEFAULT NULL,
  `UserData__registration_Id` varchar(512) DEFAULT NULL,
  `User__email` varchar(127) DEFAULT NULL,
  `User__fullName` varchar(63) DEFAULT NULL,
  `User__gender` tinyint(1) DEFAULT NULL,
  `UserFeedAuth__password` varchar(63) NOT NULL DEFAULT '',
  `UserUUID__uuid` char(41) DEFAULT NULL,
  `rowUpdatedTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserDetails`
--

DROP TABLE IF EXISTS `UserDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserDetails` (
  `id_User` int(11) NOT NULL,
  `zip` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `listening_time` int(11) DEFAULT NULL,
  `genre_affinities` text,
  `parent_genre_affinities` text,
  `subscriber` tinyint(4) DEFAULT '0',
  `population_groups` text,
  `test_group` int(11) DEFAULT NULL,
  `referrer` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_User`),
  KEY `user_idx` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserFeatured`
--

DROP TABLE IF EXISTS `UserFeatured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserFeatured` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `imageURL` varchar(255) NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserFeedAuth`
--

DROP TABLE IF EXISTS `UserFeedAuth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserFeedAuth` (
  `id_User` int(11) NOT NULL,
  `id_RSSFeed` int(11) NOT NULL,
  `login` varchar(127) NOT NULL,
  `password` varchar(63) NOT NULL,
  `crypt_pw` varchar(255) NOT NULL DEFAULT '',
  `lastChecked` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id_User_id_RSSFeed_idx` (`id_User`,`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserFollow`
--

DROP TABLE IF EXISTS `UserFollow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserFollow` (
  `facebookID_follower` varchar(255) DEFAULT NULL,
  `facebookID_target` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `facebookSubscriptionID` varchar(255) DEFAULT NULL,
  `manual` tinyint(1) DEFAULT NULL,
  KEY `facebookID_follower_idx` (`facebookID_follower`(191)) USING BTREE,
  KEY `facebookID_target_idx` (`facebookID_target`(191)) USING BTREE,
  KEY `timestamp_idx` (`timestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserFriend`
--

DROP TABLE IF EXISTS `UserFriend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserFriend` (
  `id_User` int(10) DEFAULT NULL,
  `facebookID_friend` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `new` tinyint(4) DEFAULT NULL,
  `alertSent` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `id_idx` (`id_User`),
  KEY `id_friend_idx` (`facebookID_friend`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserFrontPage`
--

DROP TABLE IF EXISTS `UserFrontPage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserFrontPage` (
  `id_User` int(11) DEFAULT NULL,
  `id_RSSEpisode` int(11) DEFAULT NULL,
  `id_NewsItem` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `reason` int(11) DEFAULT NULL,
  `published` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deviceID` varchar(50) DEFAULT NULL,
  UNIQUE KEY `user_episode_news_unique_idx` (`id_User`,`id_RSSEpisode`,`id_NewsItem`),
  KEY `id_User_idx` (`id_User`),
  KEY `published_idx` (`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserHeardEpisode`
--

DROP TABLE IF EXISTS `UserHeardEpisode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserHeardEpisode` (
  `id_User` int(11) DEFAULT NULL,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `id_RSSEpisode` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id_User_Feed_Episode_idx` (`id_User`,`id_RSSFeed`,`id_RSSEpisode`),
  KEY `id_User_idx` (`id_User`),
  KEY `id_User_Episode_idx` (`id_User`,`id_RSSEpisode`),
  KEY `timestamp_idx` (`timestamp`),
  KEY `id_RSSFeed_id_User` (`id_RSSFeed`,`id_User`),
  KEY `feed_episode_idx` (`id_RSSFeed`,`id_RSSEpisode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserHistory`
--

DROP TABLE IF EXISTS `UserHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserHistory` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `id_RSSFeed` int(11) NOT NULL DEFAULT '0',
  `id_RSSEpisode` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  KEY `id_User` (`id_User`),
  KEY `user_episode_idx` (`id_User`,`id_RSSEpisode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserHowlMap`
--

DROP TABLE IF EXISTS `UserHowlMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserHowlMap` (
  `id_User` int(11) DEFAULT NULL,
  `id_Howl` int(11) DEFAULT NULL,
  `guid` varchar(45) DEFAULT NULL,
  `subscriptionSource` varchar(25) DEFAULT NULL,
  `expiration` datetime DEFAULT NULL,
  `id_ListHead_Howl` int(11) DEFAULT NULL,
  `noPasswordSet` tinyint(4) DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id_Howl_idx` (`id_Howl`),
  UNIQUE KEY `id_User_idx` (`id_User`),
  UNIQUE KEY `guid_UNIQUE` (`guid`),
  KEY `guid_idx` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserProtocolConnections`
--

DROP TABLE IF EXISTS `UserProtocolConnections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserProtocolConnections` (
  `id_User` int(11) DEFAULT NULL,
  `id_Protocol` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `id_user_idx` (`id_User`),
  KEY `id_protocol_idx` (`id_Protocol`),
  KEY `id_user_protocol_idx` (`id_User`,`id_Protocol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserSavedSearch`
--

DROP TABLE IF EXISTS `UserSavedSearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserSavedSearch` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_User` int(10) DEFAULT NULL,
  `search_query` varchar(512) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user` (`id_User`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserSocialActivity`
--

DROP TABLE IF EXISTS `UserSocialActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserSocialActivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) DEFAULT NULL,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `id_RSSEpisode` int(11) DEFAULT NULL,
  `facebookID` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `facebookActionID` bigint(20) DEFAULT NULL,
  `id_User` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `facebookID_idx` (`facebookID`(191)),
  KEY `fbidtimestamp_idx` (`facebookID`(191),`timestamp`),
  KEY `fb_rss_feedId` (`facebookID`(191),`id_RSSEpisode`),
  KEY `id_rssepisode_idx` (`id_RSSEpisode`),
  KEY `UserSocialActivity_facebookActionID_idx` (`facebookActionID`)
) ENGINE=InnoDB AUTO_INCREMENT=96061139 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserSubscription`
--

DROP TABLE IF EXISTS `UserSubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserSubscription` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `receipt` text,
  `state` tinyint(2) DEFAULT '0',
  `expiration` timestamp NULL DEFAULT NULL,
  `id_SubscriptionType` tinyint(4) NOT NULL,
  `subscribedTS` datetime DEFAULT CURRENT_TIMESTAMP,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserSubscriptionToken`
--

DROP TABLE IF EXISTS `UserSubscriptionToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserSubscriptionToken` (
  `id_User` int(11) NOT NULL,
  `subscriptionToken` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_User`),
  UNIQUE KEY `token_idx` (`subscriptionToken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserUUID`
--

DROP TABLE IF EXISTS `UserUUID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserUUID` (
  `id_User` int(10) unsigned NOT NULL DEFAULT '0',
  `uuid` char(41) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserVectorGenre`
--

DROP TABLE IF EXISTS `UserVectorGenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserVectorGenre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_User` int(11) DEFAULT NULL,
  `id_Genre` int(11) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `percentage` decimal(6,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id_User` (`id_User`),
  KEY `idx_id_Genre` (`id_Genre`)
) ENGINE=InnoDB AUTO_INCREMENT=1365883 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserVectorParentGenre`
--

DROP TABLE IF EXISTS `UserVectorParentGenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserVectorParentGenre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_User` int(11) DEFAULT NULL,
  `id_ParentGenre` int(11) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `percentage` decimal(6,4) DEFAULT NULL,
  `count` smallint(6) DEFAULT NULL,
  `concentration` decimal(5,2) DEFAULT NULL,
  `id_Genre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id_User` (`id_User`),
  KEY `idx_id_pGenre` (`id_ParentGenre`)
) ENGINE=InnoDB AUTO_INCREMENT=1024565 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WebToNativeAppCount`
--

DROP TABLE IF EXISTS `WebToNativeAppCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WebToNativeAppCount` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_User` int(10) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `partnerRef` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18334 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WelcomeEmailUsers`
--

DROP TABLE IF EXISTS `WelcomeEmailUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WelcomeEmailUsers` (
  `id_User` bigint(20) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_User`),
  KEY `timestamp_idx` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WelcomePremiumUsers`
--

DROP TABLE IF EXISTS `WelcomePremiumUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WelcomePremiumUsers` (
  `id_User` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_User`),
  KEY `timestamp_idx` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WizardCard`
--

DROP TABLE IF EXISTS `WizardCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WizardCard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tileData` varchar(510) DEFAULT '',
  `searchButton` tinyint(4) DEFAULT '0',
  `searchBox` tinyint(4) NOT NULL,
  `title` varchar(63) DEFAULT NULL,
  `subtitle` varchar(127) DEFAULT NULL,
  `public` tinyint(4) DEFAULT '0',
  `showFeeds` tinyint(4) DEFAULT '0',
  `type` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WizardCardSet`
--

DROP TABLE IF EXISTS `WizardCardSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WizardCardSet` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_TestGroup` int(10) DEFAULT NULL,
  `cardData` varchar(126) DEFAULT NULL,
  `name` varchar(63) DEFAULT NULL,
  `public` tinyint(4) DEFAULT NULL,
  `id_Publisher` int(11) DEFAULT '0',
  `id_DeviceMode` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_TestGroup` (`id_TestGroup`,`public`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WizardFeedSource`
--

DROP TABLE IF EXISTS `WizardFeedSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WizardFeedSource` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `id_RSSFeed` int(11) DEFAULT NULL,
  `id_WizardTile` int(11) DEFAULT NULL,
  KEY `user` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WizardSelection`
--

DROP TABLE IF EXISTS `WizardSelection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WizardSelection` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `id_Genre` int(11) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `genre` (`id_Genre`),
  KEY `user` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WizardSelectionMaster`
--

DROP TABLE IF EXISTS `WizardSelectionMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WizardSelectionMaster` (
  `opportunity_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  UNIQUE KEY `opportunity_idx` (`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WizardTile`
--

DROP TABLE IF EXISTS `WizardTile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WizardTile` (
  `id_ListHead` int(10) unsigned NOT NULL,
  `imageURL` varchar(510) DEFAULT '',
  `public` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_ListHead`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WizardTileSelection`
--

DROP TABLE IF EXISTS `WizardTileSelection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WizardTileSelection` (
  `id_Target` int(11) NOT NULL,
  `type` tinyint(4) DEFAULT '0',
  `id_User` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  KEY `target` (`id_Target`),
  KEY `id_user_idx` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `XMLTestURL`
--

DROP TABLE IF EXISTS `XMLTestURL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `XMLTestURL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serviceURL` varchar(250) DEFAULT NULL,
  `description` varchar(45) DEFAULT 'description',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `XMLTestURLResult`
--

DROP TABLE IF EXISTS `XMLTestURLResult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `XMLTestURLResult` (
  `id_XMLTestURL` int(11) NOT NULL DEFAULT '0',
  `time` int(11) DEFAULT '0',
  `valid` tinyint(4) DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT NULL,
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ZipFeed`
--

DROP TABLE IF EXISTS `ZipFeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZipFeed` (
  `zip` int(5) NOT NULL,
  `id_RSSFeed` int(10) unsigned NOT NULL DEFAULT '0',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_unique_users` bigint(22) DEFAULT '0',
  `total_time` decimal(37,4) DEFAULT NULL,
  `proximity_rank` bigint(21) DEFAULT NULL,
  `state_rank` bigint(21) DEFAULT NULL,
  UNIQUE KEY `zip_rssfeed_idx` (`zip`,`id_RSSFeed`),
  KEY `proximity_rank_idx` (`proximity_rank`),
  KEY `state_rank_idx` (`state_rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ZipLocation`
--

DROP TABLE IF EXISTS `ZipLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZipLocation` (
  `zip` int(5) NOT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `county` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `feedCount` smallint(6) DEFAULT '0',
  `liveFeedCount` smallint(6) NOT NULL DEFAULT '0',
  `zip_DMA` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`zip`),
  KEY `DMA` (`zip_DMA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `affiliate_metrics`
--

DROP TABLE IF EXISTS `affiliate_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate_metrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_RSSProvider` int(11) DEFAULT '0',
  `id_RSSFeed` int(11) DEFAULT '0',
  `promo_cd` varchar(16) NOT NULL,
  `count` int(11) DEFAULT '0',
  `usedDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_RSSProvider` (`id_RSSProvider`,`id_RSSFeed`),
  KEY `promo_cd` (`promo_cd`,`usedDate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_tracker`
--

DROP TABLE IF EXISTS `agent_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_tracker` (
  `user_agent` varchar(511) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `share_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `agent_idx` (`user_agent`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_registered_10000`
--

DROP TABLE IF EXISTS `android_registered_10000`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_registered_10000` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `days` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=733 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deezer_list`
--

DROP TABLE IF EXISTS `deezer_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deezer_list` (
  `country` varchar(2) DEFAULT NULL,
  `id_Genre` int(11) DEFAULT NULL,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `user_cnt` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  UNIQUE KEY `country_genre_feed` (`country`,`id_Genre`,`id_RSSFeed`),
  KEY `genre_id` (`id_Genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deezer_listening_stats`
--

DROP TABLE IF EXISTS `deezer_listening_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deezer_listening_stats` (
  `date` date DEFAULT NULL,
  `id_rssfeed` int(11) DEFAULT NULL,
  `stitcher_listens` int(11) DEFAULT NULL,
  `stitcher_listening_time` int(11) DEFAULT NULL,
  `deezer_listens` int(11) DEFAULT NULL,
  `deezer_listening_time` int(11) DEFAULT NULL,
  `deezer_listening_percent` float DEFAULT NULL,
  `deezer_listens_percent` float DEFAULT NULL,
  `as_of_timestamp` datetime DEFAULT NULL,
  UNIQUE KEY `date_feed_idx` (`date`,`id_rssfeed`),
  KEY `date_idx` (`date`),
  KEY `feed_idx` (`id_rssfeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `short_name` varchar(25) DEFAULT NULL,
  `family` varchar(15) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `download_url` varchar(255) DEFAULT NULL,
  `supported` varchar(15) DEFAULT NULL,
  `operating_system` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `download_requests`
--

DROP TABLE IF EXISTS `download_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `download_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_trackings_id` int(11) DEFAULT NULL,
  `email_phone` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=260815 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `episode_to_entity`
--

DROP TABLE IF EXISTS `episode_to_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episode_to_entity` (
  `id_RSSEpisode` int(11) DEFAULT NULL,
  `id_NamedEntity` int(11) DEFAULT NULL,
  UNIQUE KEY `episode_entity_idx` (`id_RSSEpisode`,`id_NamedEntity`),
  KEY `id_NamedEntity_idx` (`id_NamedEntity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fb_users_profile`
--

DROP TABLE IF EXISTS `fb_users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fb_users_profile` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `first_name` varchar(63) DEFAULT NULL,
  `last_name` varchar(63) DEFAULT NULL,
  `email` varchar(127) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `timezone` int(11) DEFAULT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `verified` varchar(5) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_User`),
  KEY `user_id_idx` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fb_users_profile_todelete`
--

DROP TABLE IF EXISTS `fb_users_profile_todelete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fb_users_profile_todelete` (
  `id_User` int(11) NOT NULL DEFAULT '0',
  `first_name` varchar(63) DEFAULT NULL,
  `last_name` varchar(63) DEFAULT NULL,
  `email` varchar(127) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `timezone` int(11) DEFAULT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `verified` varchar(5) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_User`),
  KEY `user_id_idx` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_to_entity`
--

DROP TABLE IF EXISTS `feed_to_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_to_entity` (
  `id_RSSFeed` int(11) DEFAULT NULL,
  `id_NamedEntity` int(11) DEFAULT NULL,
  UNIQUE KEY `feed_entity_idx` (`id_RSSFeed`,`id_NamedEntity`),
  KEY `feed_idx` (`id_RSSFeed`),
  KEY `entity_idx` (`id_NamedEntity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedback_responses`
--

DROP TABLE IF EXISTS `feedback_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedbacks_id` int(11) NOT NULL,
  `msg_timestamp` datetime DEFAULT NULL,
  `message` text,
  `feedback_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fb_id` (`feedbacks_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48753 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_supplied_email` varchar(255) DEFAULT NULL,
  `message_text` text,
  `total_listening_time` int(11) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  `feed_id` int(11) DEFAULT NULL,
  `use_count_id` int(11) DEFAULT NULL,
  `time_sent_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mode` int(11) DEFAULT NULL,
  `version` float DEFAULT NULL,
  `answered` int(11) DEFAULT NULL,
  `answered_text` text,
  `time_answered_ts` datetime DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `feedback_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `mode_idx` (`mode`)
) ENGINE=InnoDB AUTO_INCREMENT=173554 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `internationalR3d_log_20120802`
--

DROP TABLE IF EXISTS `internationalR3d_log_20120802`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internationalR3d_log_20120802` (
  `issue` varchar(100) DEFAULT NULL,
  `id_RSSProvider` int(11) DEFAULT NULL,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `public` tinyint(1) DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `CountryOfOriginal` int(11) DEFAULT NULL,
  `language` int(11) DEFAULT NULL,
  `Provider` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Genre` int(11) DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bitRate` int(11) DEFAULT NULL,
  `keywords` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrix`
--

DROP TABLE IF EXISTS `matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrix` (
  `id_RSSFeed_from` int(11) DEFAULT NULL,
  `id_RSSFeed_to` int(11) DEFAULT NULL,
  `diff` float DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `total_count` int(11) DEFAULT NULL,
  `total_lcount` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  KEY `idx_fid_from` (`id_RSSFeed_from`),
  KEY `idx_fid_to` (`id_RSSFeed_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `named_entities`
--

DROP TABLE IF EXISTS `named_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `named_entities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(700) DEFAULT NULL,
  `classification` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entity_idx` (`entity`(100))
) ENGINE=InnoDB AUTO_INCREMENT=69440141 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_trackings`
--

DROP TABLE IF EXISTS `partner_trackings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_trackings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `ip_address` int(11) DEFAULT NULL,
  `session_id` varchar(32) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `device_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `id_RSSEpisode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12311090 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11686 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_reset_requests`
--

DROP TABLE IF EXISTS `password_reset_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_requests` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_User` int(10) unsigned NOT NULL,
  `unique_key` varchar(255) NOT NULL,
  `status` enum('requested','used','attempted_after_expiry','expired') NOT NULL DEFAULT 'requested',
  PRIMARY KEY (`id`),
  KEY `unique_key` (`unique_key`(191)),
  KEY `password_reset_requests_unique_key` (`unique_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=657301 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pie_user_vector`
--

DROP TABLE IF EXISTS `pie_user_vector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pie_user_vector` (
  `email` varchar(127) DEFAULT NULL,
  `id_User` int(10) DEFAULT NULL,
  `time` decimal(32,0) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `listen_score` double(20,3) DEFAULT NULL,
  `listen_score_total` double(20,3) DEFAULT '0.000',
  `id_RSSProvider` int(11) DEFAULT NULL,
  KEY `feed_idx` (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_timekeeper`
--

DROP TABLE IF EXISTS `production_timekeeper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_timekeeper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_name` varchar(255) DEFAULT NULL,
  `last_load_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completed_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `readable_name` varchar(50) DEFAULT NULL,
  `update_frequency` varchar(25) DEFAULT NULL,
  `database_location` varchar(25) DEFAULT NULL,
  `status` varchar(25) DEFAULT 'idle',
  PRIMARY KEY (`id`),
  KEY `process_name_idx` (`process_name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reco_blacklist`
--

DROP TABLE IF EXISTS `reco_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reco_blacklist` (
  `id_User` int(11) DEFAULT NULL,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `user_feed_idx` (`id_User`,`id_RSSFeed`),
  KEY `user_idx` (`id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recommender`
--

DROP TABLE IF EXISTS `recommender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_RSSFeed` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `id_User` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_User_idx` (`id_User`)
) ENGINE=InnoDB AUTO_INCREMENT=18048671 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_record_summary`
--

DROP TABLE IF EXISTS `search_record_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_record_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term_index` varchar(68) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `term` varchar(65) DEFAULT NULL,
  `freq` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `term_idx` (`term_index`)
) ENGINE=InnoDB AUTO_INCREMENT=1096171 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shares`
--

DROP TABLE IF EXISTS `shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `episode_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `share_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `user_agent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `user_id_event_idx` (`user_id`,`event_id`),
  KEY `user_id_event_share_idx` (`user_id`,`event_id`,`share_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13859450 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `feed_id` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `template` varchar(10) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `layout_flag` int(11) DEFAULT '0',
  `promo_cd` varchar(16) DEFAULT NULL,
  `vanity_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2158 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stitcher_list_federated`
--

DROP TABLE IF EXISTS `stitcher_list_federated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stitcher_list_federated` (
  `id_Genre` int(4) DEFAULT '0',
  `genre_name` varchar(127) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `total_time` decimal(33,0) DEFAULT NULL,
  `total_unique_users` bigint(21) NOT NULL DEFAULT '0',
  `upratings` decimal(23,0) DEFAULT NULL,
  `downratings` decimal(23,0) DEFAULT NULL,
  `total_listens` bigint(21) NOT NULL DEFAULT '0',
  `total_shares` decimal(25,0) DEFAULT NULL,
  `email_shares` decimal(23,0) DEFAULT NULL,
  `fb_shares` decimal(23,0) DEFAULT NULL,
  `twitter_shares` decimal(23,0) DEFAULT NULL,
  `thumbnailURL` varchar(255) DEFAULT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `id_RSSProvider` int(5) DEFAULT NULL,
  `rank_total_users` int(11) DEFAULT NULL,
  `overall_rank_total_users` int(11) NOT NULL DEFAULT '0',
  `rank_total_time` int(11) DEFAULT NULL,
  `overall_rank_total_time` int(11) NOT NULL DEFAULT '0',
  `rank_upratings` int(11) DEFAULT NULL,
  `overall_rank_upratings` int(11) NOT NULL DEFAULT '0',
  `rank_total_listens` int(11) DEFAULT NULL,
  `overall_rank_total_listens` int(11) NOT NULL DEFAULT '0',
  `rank_total_shares` int(11) DEFAULT NULL,
  `overall_rank_total_shares` int(11) NOT NULL DEFAULT '0',
  `rank_email_shares` int(11) DEFAULT NULL,
  `overall_rank_email_shares` int(11) NOT NULL DEFAULT '0',
  `rank_fb_shares` int(11) DEFAULT NULL,
  `overall_rank_fb_shares` int(11) NOT NULL DEFAULT '0',
  `rank_twitter_shares` int(11) DEFAULT NULL,
  `overall_rank_twitter_shares` int(11) NOT NULL DEFAULT '0',
  `diff_total_users` bigint(21) DEFAULT NULL,
  `diff_total_time` decimal(34,0) DEFAULT NULL,
  `diff_total_shares` decimal(26,0) DEFAULT NULL,
  `diff_email_shares` decimal(24,0) DEFAULT NULL,
  `diff_fb_shares` decimal(24,0) DEFAULT NULL,
  `diff_twitter_shares` decimal(24,0) DEFAULT NULL,
  `rank_diff_total_users` bigint(12) DEFAULT NULL,
  `rank_diff_total_time` bigint(12) DEFAULT NULL,
  `rank_diff_total_shares` bigint(12) DEFAULT NULL,
  `rank_diff_email_shares` bigint(12) DEFAULT NULL,
  `rank_diff_fb_shares` bigint(12) DEFAULT NULL,
  `rank_diff_twitter_shares` bigint(12) DEFAULT NULL,
  `overall_rank_diff_total_users` bigint(12) DEFAULT NULL,
  `overall_rank_diff_total_time` bigint(12) DEFAULT NULL,
  `overall_rank_diff_total_shares` bigint(12) DEFAULT NULL,
  `overall_rank_diff_email_shares` bigint(12) DEFAULT NULL,
  `overall_rank_diff_fb_shares` bigint(12) DEFAULT NULL,
  `overall_rank_diff_twitter_shares` bigint(12) DEFAULT NULL,
  `date` date DEFAULT NULL,
  UNIQUE KEY `date_rssfeed_idx` (`date`,`id_RSSFeed`),
  KEY `genre_idx` (`id_Genre`),
  KEY `date_idx` (`date`),
  KEY `rssfeed_idx` (`id_RSSFeed`),
  KEY `user_count_idx` (`total_unique_users`),
  KEY `d_g_f_idx` (`id_Genre`,`id_RSSFeed`,`date`)
) ENGINE=FEDERATED DEFAULT CHARSET=utf8mb4 CONNECTION='mysql://stitcher_ro:6p4LfYg1%7y6@stitcher-static.ct74dnkmw0zc.us-east-1.rds.amazonaws.com:3306/stitcherstatic/stitcher_list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stitcher_list_internal_federated`
--

DROP TABLE IF EXISTS `stitcher_list_internal_federated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stitcher_list_internal_federated` (
  `id_genre` int(11) DEFAULT NULL,
  `genre_name` varchar(127) DEFAULT NULL,
  `id_rssfeed` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `total_time` float(8,3) DEFAULT NULL,
  `total_unique_users` int(11) DEFAULT NULL,
  `upratings` int(11) DEFAULT NULL,
  `downratings` int(11) DEFAULT NULL,
  `total_listens` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `total_shares` int(11) DEFAULT NULL,
  `email_shares` int(11) DEFAULT NULL,
  `fb_shares` int(11) DEFAULT NULL,
  `twitter_shares` int(11) DEFAULT NULL,
  `thumbnailurl` varchar(255) DEFAULT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `id_rssprovider` int(11) DEFAULT NULL,
  `rank_total_users` int(11) DEFAULT NULL,
  `rank_total_time` int(11) DEFAULT NULL,
  `rank_upratings` int(11) DEFAULT NULL,
  `rank_total_listens` int(11) DEFAULT NULL,
  `rank_total_shares` int(11) DEFAULT NULL,
  `rank_email_shares` int(11) DEFAULT NULL,
  `rank_fb_shares` int(11) DEFAULT NULL,
  `rank_twitter_shares` int(11) DEFAULT NULL,
  `overall_rank_total_users` int(11) DEFAULT NULL,
  `overall_rank_total_time` int(11) DEFAULT NULL,
  `overall_rank_upratings` int(11) DEFAULT NULL,
  `overall_rank_total_listens` int(11) DEFAULT NULL,
  `overall_rank_total_shares` int(11) DEFAULT NULL,
  `overall_rank_email_shares` int(11) DEFAULT NULL,
  `overall_rank_fb_shares` int(11) DEFAULT NULL,
  `overall_rank_twitter_shares` int(11) DEFAULT NULL,
  `diff_total_users` int(11) DEFAULT NULL,
  `diff_total_time` float(8,3) DEFAULT NULL,
  `diff_total_shares` int(11) DEFAULT NULL,
  `diff_email_shares` int(11) DEFAULT NULL,
  `diff_fb_shares` int(11) DEFAULT NULL,
  `diff_twitter_shares` int(11) DEFAULT NULL,
  `rank_diff_total_users` int(11) DEFAULT NULL,
  `rank_diff_total_time` int(11) DEFAULT NULL,
  `rank_diff_total_shares` int(11) DEFAULT NULL,
  `rank_diff_email_shares` int(11) DEFAULT NULL,
  `rank_diff_fb_shares` int(11) DEFAULT NULL,
  `rank_diff_twitter_shares` int(11) DEFAULT NULL,
  `overall_rank_diff_total_users` int(11) DEFAULT NULL,
  `overall_rank_diff_total_time` int(11) DEFAULT NULL,
  `overall_rank_diff_total_shares` int(11) DEFAULT NULL,
  `overall_rank_diff_email_shares` int(11) DEFAULT NULL,
  `overall_rank_diff_fb_shares` int(11) DEFAULT NULL,
  `overall_rank_diff_twitter_shares` int(11) DEFAULT NULL,
  KEY `id_idx` (`id_rssfeed`)
) ENGINE=FEDERATED DEFAULT CHARSET=utf8mb4 CONNECTION='mysql://stitcher_ro:6p4LfYg1%7y6@stitcher-static.ct74dnkmw0zc.us-east-1.rds.amazonaws.com:3306/stitcherstatic/stitcher_list_internal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stitcher_list_top_100`
--

DROP TABLE IF EXISTS `stitcher_list_top_100`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stitcher_list_top_100` (
  `id_genre` int(11) NOT NULL,
  `id_rssfeed` int(11) NOT NULL,
  `rank_total_users` int(11) DEFAULT NULL,
  `genre_name` varchar(127) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id_genre_2` (`id_genre`,`id_rssfeed`),
  KEY `id_genre` (`id_genre`),
  KEY `id_rssfeed` (`id_rssfeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `topLiveStation`
--

DROP TABLE IF EXISTS `topLiveStation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topLiveStation` (
  `gid` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  KEY `idx_1` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_shared_feeds`
--

DROP TABLE IF EXISTS `top_shared_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_shared_feeds` (
  `id_RSSFeed` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `share_cnt` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_RSSFeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_preference_vector`
--

DROP TABLE IF EXISTS `user_preference_vector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preference_vector` (
  `id_User` int(10) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `time` decimal(54,0) DEFAULT NULL,
  `upRating` decimal(45,0) DEFAULT NULL,
  `downRating` decimal(45,0) DEFAULT NULL,
  `emailShare` decimal(45,0) DEFAULT NULL,
  `fbShare` decimal(45,0) DEFAULT NULL,
  `twitterShare` decimal(45,0) DEFAULT NULL,
  `banFeed` decimal(45,0) DEFAULT NULL,
  `recoSelect` decimal(45,0) DEFAULT NULL,
  `searchSelect` decimal(45,0) DEFAULT NULL,
  `fbSelect` decimal(45,0) DEFAULT NULL,
  `duration` decimal(32,0) DEFAULT NULL,
  `listen_score` double(20,3) DEFAULT NULL,
  `episodes` bigint(21) NOT NULL DEFAULT '0',
  `total_time_in_period` int(11) DEFAULT NULL,
  `id_Genre` int(11) DEFAULT NULL,
  `id_Genre_parent` int(11) DEFAULT NULL,
  `id_RSSProvider` int(11) DEFAULT NULL,
  `listen_score_total` double(20,3) DEFAULT '0.000',
  `listen_score_percent` float(7,6) DEFAULT NULL,
  `fav_count` int(11) DEFAULT '0',
  `thumb_up_score` float(7,3) DEFAULT NULL,
  `share_score` int(11) DEFAULT NULL,
  `thumb_down_score` float(7,3) DEFAULT NULL,
  `total_up_ratings_percent` float(7,4) DEFAULT NULL,
  `total_up_ratings` int(11) DEFAULT NULL,
  `fav_score` int(11) DEFAULT '0',
  `total_score` int(11) DEFAULT '0',
  `custom_playlist_name` varchar(255) DEFAULT NULL,
  UNIQUE KEY `user_feed_idx` (`id_User`,`id_RSSFeed`),
  KEY `user_fav_idx` (`id_User`,`fav_count`),
  KEY `feed_idx` (`id_RSSFeed`),
  KEY `user_idx` (`id_User`),
  KEY `genre_idx` (`id_Genre`),
  KEY `provider_idx` (`id_RSSProvider`)
) ENGINE=FEDERATED DEFAULT CHARSET=utf8mb4 CONNECTION='mysql://stitcher_ro:6p4LfYg1%7y6@stitcher-static.ct74dnkmw0zc.us-east-1.rds.amazonaws.com:3306/stitcherstatic/user_preference_vector';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_preference_vector_federated`
--

DROP TABLE IF EXISTS `user_preference_vector_federated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preference_vector_federated` (
  `id_User` int(10) DEFAULT NULL,
  `id_RSSFeed` int(10) DEFAULT NULL,
  `time` decimal(54,0) DEFAULT NULL,
  `upRating` decimal(45,0) DEFAULT NULL,
  `downRating` decimal(45,0) DEFAULT NULL,
  `emailShare` decimal(45,0) DEFAULT NULL,
  `fbShare` decimal(45,0) DEFAULT NULL,
  `twitterShare` decimal(45,0) DEFAULT NULL,
  `banFeed` decimal(45,0) DEFAULT NULL,
  `recoSelect` decimal(45,0) DEFAULT NULL,
  `searchSelect` decimal(45,0) DEFAULT NULL,
  `fbSelect` decimal(45,0) DEFAULT NULL,
  `duration` decimal(32,0) DEFAULT NULL,
  `listen_score` double(20,3) DEFAULT NULL,
  `episodes` bigint(21) NOT NULL DEFAULT '0',
  `total_time_in_period` int(11) DEFAULT NULL,
  `id_Genre` int(11) DEFAULT NULL,
  `id_Genre_parent` int(11) DEFAULT NULL,
  `id_RSSProvider` int(11) DEFAULT NULL,
  `listen_score_total` double(20,3) DEFAULT '0.000',
  `listen_score_percent` float(7,6) DEFAULT NULL,
  `fav_count` int(11) DEFAULT '0',
  `thumb_up_score` float(7,3) DEFAULT NULL,
  `share_score` int(11) DEFAULT NULL,
  `thumb_down_score` float(7,3) DEFAULT NULL,
  `total_up_ratings_percent` float(7,4) DEFAULT NULL,
  `total_up_ratings` int(11) DEFAULT NULL,
  `fav_score` int(11) DEFAULT '0',
  `total_score` int(11) DEFAULT '0',
  `custom_playlist_name` varchar(255) DEFAULT NULL,
  UNIQUE KEY `user_feed_idx` (`id_User`,`id_RSSFeed`),
  KEY `user_fav_idx` (`id_User`,`fav_count`),
  KEY `feed_idx` (`id_RSSFeed`),
  KEY `user_idx` (`id_User`),
  KEY `genre_idx` (`id_Genre`),
  KEY `provider_idx` (`id_RSSProvider`)
) ENGINE=FEDERATED DEFAULT CHARSET=utf8mb4 CONNECTION='mysql://stitcher_ro:6p4LfYg1%7y6@stitcher-static.ct74dnkmw0zc.us-east-1.rds.amazonaws.com:3306/stitcherstatic/user_preference_vector';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `OpportunityAlertPairView`
--

/*!50001 DROP TABLE IF EXISTS `OpportunityAlertPairView`*/;
/*!50001 DROP VIEW IF EXISTS `OpportunityAlertPairView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sa2`@`10.%` SQL SECURITY DEFINER */
/*!50001 VIEW `OpportunityAlertPairView` AS select `a`.`opportunity_id` AS `opportunity_id`,`b`.`type` AS `type`,`b`.`description` AS `description`,`a`.`alert_id` AS `alert_id`,`c`.`title` AS `title`,`c`.`message` AS `message`,`c`.`expiration` AS `expiration` from ((`OpportunityAlertPair` `a` left join `WizardSelectionMaster` `b` on((`a`.`opportunity_id` = `b`.`opportunity_id`))) left join `OpportunityAlert` `c` on((`a`.`alert_id` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-24 22:03:48
