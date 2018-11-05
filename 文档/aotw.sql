/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : aotw

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2018-11-05 09:22:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `group`
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `scale` int(11) DEFAULT NULL COMMENT '群规模',
  `sort` varchar(40) DEFAULT NULL COMMENT '群分类',
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userName` (`userName`),
  CONSTRAINT `group_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', 'xiaoming', '群001', '50', '游戏', null, null, '1', '/upload/default.jpg', '2018-10-30 19:24:55');
INSERT INTO `group` VALUES ('2', 'xiaoming', '群002', '50', '游戏', null, null, '1', '/upload/default.jpg', '2018-10-30 19:25:22');

-- ----------------------------
-- Table structure for `groupmember`
-- ----------------------------
DROP TABLE IF EXISTS `groupmember`;
CREATE TABLE `groupmember` (
  `userName` varchar(20) NOT NULL,
  `groupId` int(11) NOT NULL,
  PRIMARY KEY (`userName`,`groupId`),
  KEY `groupmember_ibfk_2` (`groupId`),
  CONSTRAINT `groupmember_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`),
  CONSTRAINT `groupmember_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groupmember
-- ----------------------------
INSERT INTO `groupmember` VALUES ('xiaoming01', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userName` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nickName` varchar(20) DEFAULT NULL,
  `realName` varchar(20) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `isAdmin` tinyint(4) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `registerTime` datetime DEFAULT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', 'admin', null, null, 'admin@qq.com', null, null, '1', '1', null, null, null);
INSERT INTO `user` VALUES ('xiaoming', 'E10ADC3949BA59ABBE56E057F20F883E', '小明', '', 'xiaoming@qq.com', '13112111111', '', '1', null, '广东省', '/img/defaultImg.png', '2018-10-25 10:49:42');
INSERT INTO `user` VALUES ('xiaoming01', 'E10ADC3949BA59ABBE56E057F20F883E', '小明01', '', 'xiaoming01@qq.com', '13112111111', '', '1', null, '{\"lat\":23.16265,\"lng\":113.06}', '/img/defaultImg.png', '2018-10-30 22:41:38');
INSERT INTO `user` VALUES ('xiaoming02', 'E10ADC3949BA59ABBE56E057F20F883E', '小明02', '张小明', 'xiaoming02@qq.com', '13112111111', '广东省', '1', null, null, '/img/defaultImg.png', '2018-10-30 22:59:30');
