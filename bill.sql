/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : bill

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-04-15 16:29:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` bigint(32) NOT NULL,
  `account_type_id` bigint(32) NOT NULL COMMENT '账单类型ID',
  `name` varchar(64) NOT NULL,
  `init_amount` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '初始金额',
  `curr_amount` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '当前金额',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，-1：冻结；0：删除；1：可用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_user` bigint(32) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='账户';

-- ----------------------------
-- Table structure for account_type
-- ----------------------------
DROP TABLE IF EXISTS `account_type`;
CREATE TABLE `account_type` (
  `id` bigint(32) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，0：删除；1：可用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_user` bigint(32) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='账户类型';

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` bigint(32) NOT NULL,
  `bill_type_id` bigint(32) NOT NULL,
  `tag_ids` varchar(255) DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，0：删除；1：可用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` bigint(32) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='账单';

-- ----------------------------
-- Table structure for bill_category
-- ----------------------------
DROP TABLE IF EXISTS `bill_category`;
CREATE TABLE `bill_category` (
  `id` bigint(32) NOT NULL,
  `super_bc_id` bigint(32) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `remark` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，0：删除；1：可用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` bigint(32) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='账单类别';

-- ----------------------------
-- Table structure for bill_img
-- ----------------------------
DROP TABLE IF EXISTS `bill_img`;
CREATE TABLE `bill_img` (
  `id` bigint(32) NOT NULL,
  `bill_id` bigint(32) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` bigint(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `remark` varchar(255) DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，0：删除；1：可用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` bigint(32) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签';

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(32) NOT NULL,
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，-1：冻结；0：删除；1：可用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(32) DEFAULT NULL COMMENT '最后修改人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户账号';

-- ----------------------------
-- Table structure for user_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE `user_detail` (
  `id` bigint(32) NOT NULL,
  `user_id` bigint(32) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，-1：冻结；0：删除；1：可用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` bigint(32) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户详情';
