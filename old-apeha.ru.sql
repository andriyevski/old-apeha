/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50541
Source Host           : localhost:3306
Source Database       : old-apeha.ru

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2015-04-01 22:20:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `Admin`
-- ----------------------------
DROP TABLE IF EXISTS `Admin`;
CREATE TABLE `Admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pages` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `values` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Admin
-- ----------------------------
INSERT INTO `Admin` VALUES ('1', 'index.php', null, '1');

-- ----------------------------
-- Table structure for `Buildings`
-- ----------------------------
DROP TABLE IF EXISTS `Buildings`;
CREATE TABLE `Buildings` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `BuildingName` char(50) COLLATE utf8_bin DEFAULT NULL,
  `BuildingType` int(3) DEFAULT NULL,
  `Town` smallint(2) NOT NULL,
  `PHP_File` char(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of Buildings
-- ----------------------------
INSERT INTO `Buildings` VALUES ('1', 'Арена', '1', '1', 'core/char.php');
INSERT INTO `Buildings` VALUES ('2', 'Центральрная площадь', '2', '1', 'core/map.php');
INSERT INTO `Buildings` VALUES ('3', 'Кузница', '3', '1', 'core/smith.php');

-- ----------------------------
-- Table structure for `chat`
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `CH_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CH_ROOM` int(10) unsigned NOT NULL,
  `USER_ID` bigint(20) unsigned NOT NULL,
  `USER_ID_TO` bigint(20) NOT NULL,
  `IS_PRIVATE` smallint(6) NOT NULL,
  `CH_MSG` char(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`CH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of chat
-- ----------------------------

-- ----------------------------
-- Table structure for `Players`
-- ----------------------------
DROP TABLE IF EXISTS `Players`;
CREATE TABLE `Players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_rank` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `reg_ip` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_time` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_ip` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_time` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_date` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SessionID` bigint(20) DEFAULT NULL,
  `Security_Answer` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Money` int(200) DEFAULT '50',
  `Strength` int(11) DEFAULT '3',
  `Strength_Total` int(11) DEFAULT '3',
  `Endurance` int(11) DEFAULT '3',
  `Accuracy` int(11) DEFAULT '3',
  `Accuracy_Total` int(11) DEFAULT '0',
  `Dexterity` int(11) DEFAULT '3',
  `Dexterity_Total` int(11) DEFAULT '0',
  `Sword` int(11) DEFAULT '0',
  `Spear` int(11) DEFAULT '0',
  `Axe` int(11) DEFAULT '0',
  `Mace` int(11) DEFAULT '0',
  `Dagger` int(11) DEFAULT '0',
  `CurHealth` int(11) DEFAULT '0',
  `MaxHealth` int(11) DEFAULT '20',
  `Level` int(11) DEFAULT '0',
  `Experience` int(11) DEFAULT '0',
  `NextExperience` int(11) DEFAULT '10',
  `UnUsed_Points` int(11) DEFAULT '15',
  `Town` int(11) DEFAULT '1' COMMENT 'REFERENCES Towns(`ID`)',
  `Building` int(11) DEFAULT '1' COMMENT 'REFERENCES Buildings(`ID`)',
  `Moving_Type` int(11) DEFAULT '0',
  `EndMoving_Time` int(11) DEFAULT '0',
  `Disposition` int(11) DEFAULT NULL,
  `Clan` int(11) DEFAULT NULL,
  `Image` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaxWeigth` int(11) DEFAULT '20',
  `Helmet_Slot` int(11) DEFAULT '0',
  `Shield_Slot` int(11) DEFAULT '0',
  `Weapon_Slot` int(11) DEFAULT '0',
  `Gloves_Slot` int(11) DEFAULT '0',
  `Shoes_Slot` int(11) DEFAULT '0',
  `Armor_Slot` int(11) DEFAULT '0',
  `Necklace_Slot` int(11) DEFAULT '0',
  `Ring1_Slot` int(11) DEFAULT '0',
  `Ring2_Slot` int(11) DEFAULT '0',
  `Ring3_Slot` int(11) DEFAULT '0',
  `Ring4_Slot` int(11) DEFAULT '0',
  `Ear_Slot` int(11) DEFAULT '0',
  `Belt_Slot` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Players
-- ----------------------------
INSERT INTO `Players` VALUES ('14', null, 'Admin', 'test', '127.0.0.1', '21:33:00', '18-3-2015', '127.0.0.1', '00:37:23', '1-4-2015', '328582764', null, '50', '33', '3', '3', '3', '0', '3', '0', '0', '0', '0', '0', '0', '0', '20', '0', '0', '10', '15', '1', '1', '1', '0', null, null, null, '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `Players` VALUES ('15', null, 'TEst', 'test', '127.0.0.1', '23:08:08', '18-3-2015', null, null, null, null, null, '50', '3', '3', '3', '3', '0', '3', '0', '0', '0', '0', '0', '0', '0', '20', '0', '0', '10', '15', '1', '1', '1', '0', null, null, null, '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `Players` VALUES ('16', null, 'Mike-Tyson', 'tison', '127.0.0.1', '23:08:36', '18-3-2015', null, null, null, null, null, '50', '3', '3', '3', '3', '0', '3', '0', '0', '0', '0', '0', '0', '0', '20', '0', '0', '10', '15', '1', '1', '1', '0', null, null, null, '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `Players` VALUES ('17', null, 'FL', 'FL', '127.0.0.1', '23:09:32', '18-3-2015', '127.0.0.1', '23:09:38', '18-3-2015', null, null, '50', '3', '3', '3', '3', '0', '3', '0', '0', '0', '0', '0', '0', '0', '20', '0', '0', '10', '15', '1', '1', '1', '0', null, null, null, '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `Players` VALUES ('18', null, 'Masimus', 'lerop', '127.0.0.1', '01:40:07', '23-3-2015', '127.0.0.1', '01:40:17', '23-3-2015', null, null, '150', '33', '3', '3', '3', '0', '19', '0', '0', '0', '0', '0', '0', '0', '20', '1', '20', '10', '55', '1', '1', '0', '0', null, null, null, '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `Players` VALUES ('19', null, 'Логин', 'asd', '127.0.0.1', '18:01:00', '29-3-2015', '127.0.0.1', '18:01:10', '29-3-2015', null, null, '50', '3', '3', '3', '3', '0', '3', '0', '0', '0', '0', '0', '0', '0', '20', '0', '0', '10', '15', '1', '1', '0', '0', null, null, null, '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `Players` VALUES ('20', null, 'pop', 'pop2', '127.0.0.1', '23:36:22', '31-3-2015', '127.0.0.1', '23:37:06', '31-3-2015', null, null, '50', '3', '3', '3', '3', '0', '3', '0', '0', '0', '0', '0', '0', '0', '20', '0', '0', '10', '15', '1', '1', '0', '0', null, null, null, '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `site_time`
-- ----------------------------
DROP TABLE IF EXISTS `site_time`;
CREATE TABLE `site_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of site_time
-- ----------------------------
INSERT INTO `site_time` VALUES ('1', 'Index.php', '0.02');
INSERT INTO `site_time` VALUES ('2', 'autoris/exit.php', '0.01');
INSERT INTO `site_time` VALUES ('3', 'autoris/reg.php', '0.01');
INSERT INTO `site_time` VALUES ('4', 'autoris/save_user.php', '0.03');
INSERT INTO `site_time` VALUES ('5', 'autoris/testreg.php', '0.02');
INSERT INTO `site_time` VALUES ('6', 'game.php', '0.01');
