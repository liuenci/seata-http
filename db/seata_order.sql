/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : seata_order

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 19/02/2021 20:33:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `product_id` int(11) NULL DEFAULT NULL,
  `pay_amount` decimal(10, 0) NULL DEFAULT NULL,
  `add_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, 1, 1, '2021-02-19 20:30:28', '2021-02-19 20:30:28');

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime(0) NOT NULL,
  `log_modified` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of undo_log
-- ----------------------------
INSERT INTO `undo_log` VALUES (1, 106125929099608064, '172.17.147.12:8091:106125925249236992', 'serializer=jackson', 0x7B7D, 1, '2021-02-19 20:26:37', '2021-02-19 20:26:37');
INSERT INTO `undo_log` VALUES (2, 106126464447987713, '172.17.147.12:8091:106126460392095744', 'serializer=jackson', 0x7B7D, 1, '2021-02-19 20:28:42', '2021-02-19 20:28:42');
INSERT INTO `undo_log` VALUES (3, 106126673462738945, '172.17.147.12:8091:106126665149628416', 'serializer=jackson', 0x7B7D, 1, '2021-02-19 20:30:01', '2021-02-19 20:30:01');
INSERT INTO `undo_log` VALUES (4, 106126826315759617, '172.17.147.12:8091:106126824478654464', 'serializer=jackson', 0x7B7D, 1, '2021-02-19 20:30:10', '2021-02-19 20:30:10');

SET FOREIGN_KEY_CHECKS = 1;
