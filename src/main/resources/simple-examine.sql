/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : simple-examine

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 05/03/2020 15:07:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员表',
  `admin_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员登录名',
  `admin_pwd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员密码（md5加密）',
  `admin_power` tinyint(4) NULL DEFAULT NULL COMMENT '管理员权限  0：最高权限  1：任务发布权限  2：临时权限',
  `admin_statu` tinyint(2) NULL DEFAULT NULL COMMENT '管理员账号状态  0：可用   1：禁用',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `admin_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `tele` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` int(10) NULL DEFAULT NULL,
  `province` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `county` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` tinyint(2) NULL DEFAULT NULL,
  `last_login_time` int(10) NULL DEFAULT NULL COMMENT '最后登录时间',
  `salt` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('18a7560ad0124394bbdddfccea485c1e', 'junan', 'd7a032abd5295b4cb528899c17dc5cce', 0, 0, 'junan', 'http://127.0.0.1:8080/static/adminLocation/5f47f742d8d64b589d0a679513a47bcc.jpg', '描述信息1', '13699044479', 1573574400, '460000', '460100', '460106', '1286890175@qq.com', 0, 1583390434, 'a51055ea98d342a1b3c2452610ae0be5');
INSERT INTO `admin` VALUES ('d64110ee67f643eb8cbbdff26ad1e9c8', 'test', '1cf9a8c520f2b6974fb12fdfabbf49f6', 0, 0, 'test', NULL, 'sdasfas', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'e2b033a5a0cb4497a7e823dae6db3393');

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员id',
  `role_id` int(10) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (4, '18a7560ad0124394bbdddfccea485c1e', 1);

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `area_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `area_name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区名',
  `area_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area_stat` tinyint(2) NULL DEFAULT NULL COMMENT ' 分区状态  0：启用  1：禁用   ',
  `create_time` int(10) NULL DEFAULT NULL,
  `create_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` int(10) NULL DEFAULT NULL,
  `update_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`area_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', 'A区', '住院部1楼', '人流量大，注意安全。', 1, NULL, '18a7560ad0124394bbdddfccea485c1e', 1580023510, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `area` VALUES ('10', 'L区', '急诊楼三楼', '注意道路疏通', 1, 0, '18a7560ad0124394bbdddfccea485c1e', 1571720064, NULL);
INSERT INTO `area` VALUES ('11', 'M区', NULL, NULL, 0, NULL, '18a7560ad0124394bbdddfccea485c1e', NULL, NULL);
INSERT INTO `area` VALUES ('2', 'B区', NULL, NULL, 0, NULL, '18a7560ad0124394bbdddfccea485c1e', NULL, NULL);
INSERT INTO `area` VALUES ('290cf35f94894e409864417b7ff56084', 'GG区', '门诊楼一楼', '人多注意。', 0, 1571720766, '18a7560ad0124394bbdddfccea485c1e', 1571720809, NULL);
INSERT INTO `area` VALUES ('3', 'C区', NULL, NULL, 0, NULL, '18a7560ad0124394bbdddfccea485c1e', NULL, NULL);
INSERT INTO `area` VALUES ('4', 'D区', NULL, NULL, 0, NULL, '18a7560ad0124394bbdddfccea485c1e', NULL, NULL);
INSERT INTO `area` VALUES ('5', 'F区', NULL, NULL, 0, NULL, '18a7560ad0124394bbdddfccea485c1e', NULL, NULL);
INSERT INTO `area` VALUES ('6', 'E区', NULL, NULL, 0, NULL, '18a7560ad0124394bbdddfccea485c1e', NULL, NULL);
INSERT INTO `area` VALUES ('7', 'F区', NULL, NULL, 0, NULL, '18a7560ad0124394bbdddfccea485c1e', NULL, NULL);
INSERT INTO `area` VALUES ('8', 'G区', NULL, NULL, 1, NULL, '18a7560ad0124394bbdddfccea485c1e', 1573353294, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `area` VALUES ('9', 'K区', NULL, NULL, 0, NULL, '18a7560ad0124394bbdddfccea485c1e', NULL, NULL);
INSERT INTO `area` VALUES ('f3ccd3bf1d7f4f26bd6dd5b5567e25a8', 'FF区', '不知道', 'nothing', 0, 1571732776, '18a7560ad0124394bbdddfccea485c1e', 1571732775, NULL);

-- ----------------------------
-- Table structure for atten
-- ----------------------------
DROP TABLE IF EXISTS `atten`;
CREATE TABLE `atten`  (
  `atten_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `atten_staff` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `atten_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` int(10) NULL DEFAULT NULL,
  `create_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` int(10) NULL DEFAULT NULL,
  `update_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`atten_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of atten
-- ----------------------------
INSERT INTO `atten` VALUES ('5198f68aacdf4e4ba11352e16e80a02c', '2', '准时签到', 1572684391, '18a7560ad0124394bbdddfccea485c1e', 1572684391, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `atten` VALUES ('ca816ce47ae2406f94c81b30f2c71157', '1', NULL, 1572684287, '18a7560ad0124394bbdddfccea485c1e', 1572684287, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `atten` VALUES ('e9fc8d0072924ef58107dc953bbfa27d', '4', '。。', 1572684410, '18a7560ad0124394bbdddfccea485c1e', 1572684410, '18a7560ad0124394bbdddfccea485c1e');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `dept_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名',
  `dept_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_stat` tinyint(2) NULL DEFAULT NULL COMMENT '部门状态 0：禁用  1启用',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('a886bde835b6448dac3b60ab4ea2162b', '安全巡检部', '安全巡检部', 0);
INSERT INTO `dept` VALUES ('a886bde835b6448dac3b60ab4ea2162e', '后勤保障部', '后勤保障部', 0);

-- ----------------------------
-- Table structure for equ
-- ----------------------------
DROP TABLE IF EXISTS `equ`;
CREATE TABLE `equ`  (
  `equ_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `equ_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `equ_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `equ_point` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `equ_stat` tinyint(2) NULL DEFAULT NULL,
  `create_time` int(10) NULL DEFAULT NULL,
  `create_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` int(10) NULL DEFAULT NULL,
  `update_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`equ_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equ
-- ----------------------------
INSERT INTO `equ` VALUES ('15c7d5b1089e47129970cc6ebec99016', '糖尿病治疗仪2', '.。', 'A101001001', 0, 1572680647, NULL, 1572680875, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `equ` VALUES ('44cc2da224094ffe9a9333f36d08ffca', '糖尿病治疗仪', '该设备。。。。', 'A101002006', 0, 1571736971, NULL, 1575114204, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `equ` VALUES ('6c96447665e64ea7827e8d89564f14d8', '激光治疗仪', '该设备。。。', 'A101002007', 1, 1571737133, NULL, 1573351137, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `equ` VALUES ('d6628636afeb4e0691b43cb815db58de', '手术无影灯', '该设备需要小心。。', 'A101001005', 0, 1571736753, NULL, 1572182910, NULL);

-- ----------------------------
-- Table structure for equ_fail
-- ----------------------------
DROP TABLE IF EXISTS `equ_fail`;
CREATE TABLE `equ_fail`  (
  `fail_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fail_equ` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fail_appear_time` int(10) NULL DEFAULT NULL,
  `deal_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fail_deal_time` int(10) NULL DEFAULT NULL,
  `fail_stat` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`fail_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equ_fail
-- ----------------------------
INSERT INTO `equ_fail` VALUES ('a30e62f182ff45f0ade8431f57dd2878', '15c7d5b1089e47129970cc6ebec99016', 1572680900, '18a7560ad0124394bbdddfccea485c1e', 1572680915, 2);
INSERT INTO `equ_fail` VALUES ('cb14bb5316c9489982193c7d7f2bd1a6', '44cc2da224094ffe9a9333f36d08ffca', 1572680370, '18a7560ad0124394bbdddfccea485c1e', 1572680383, 1);
INSERT INTO `equ_fail` VALUES ('d63a49a897e34284a9b8df631480464b', '44cc2da224094ffe9a9333f36d08ffca', 1572680561, '18a7560ad0124394bbdddfccea485c1e', 1573297726, 2);
INSERT INTO `equ_fail` VALUES ('e013ac46b20f4aa8990640ac7e38b379', 'd6628636afeb4e0691b43cb815db58de', 1572756849, '18a7560ad0124394bbdddfccea485c1e', 1575128190, 1);

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `images_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '巡检人员提交的照片表',
  `images_patrol` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '照片对应的巡检报告编号',
  `images_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '照片名',
  PRIMARY KEY (`images_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for line
-- ----------------------------
DROP TABLE IF EXISTS `line`;
CREATE TABLE `line`  (
  `line_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路表索引',
  `line_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名',
  `line_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `line_area` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路所属的分区',
  `line_stat` tinyint(2) NULL DEFAULT NULL COMMENT '该线路状态  0：可用  1：不可用   2：维护中',
  `create_time` int(10) NULL DEFAULT NULL,
  `create_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` int(10) NULL DEFAULT NULL,
  `update_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`line_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of line
-- ----------------------------
INSERT INTO `line` VALUES ('1', 'A区急诊楼一楼线路01', '这里是描述', '290cf35f94894e409864417b7ff56084', 0, 1572067533, '18a7560ad0124394bbdddfccea485c1e', 1572067533, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `line` VALUES ('10', 'A区门诊楼二楼线路02', '这里是描述', '1', 0, 1572067533, '18a7560ad0124394bbdddfccea485c1e', 1572068059, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `line` VALUES ('11', 'A区门诊楼三楼线路01', '这里是描述', '2', 1, 1572067533, '18a7560ad0124394bbdddfccea485c1e', 1572068064, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `line` VALUES ('12', 'A区门诊楼三楼线路02', '这里是描述', '3', 0, 1572067533, '18a7560ad0124394bbdddfccea485c1e', 1572067533, NULL);
INSERT INTO `line` VALUES ('2', 'A区急诊楼一楼线路02', '这里是描述', '4', 1, 1572067533, '18a7560ad0124394bbdddfccea485c1e', 1572068072, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `line` VALUES ('3', 'A区急诊楼二楼线路01', '这里是描述', '5', 0, 1572067533, '18a7560ad0124394bbdddfccea485c1e', 1572067533, NULL);
INSERT INTO `line` VALUES ('4', 'A区急诊楼二楼线路02', '这里是描述', '6', 1, 1572067533, '18a7560ad0124394bbdddfccea485c1e', 1572068077, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `line` VALUES ('5', 'A区急诊楼三楼线路01', '这里是描述', '10', 1, 1572067533, '18a7560ad0124394bbdddfccea485c1e', 1573353318, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `line` VALUES ('6', 'A区急诊楼三楼线路02', '这里是描述', '6', 0, 1572067533, '18a7560ad0124394bbdddfccea485c1e', 1572067533, NULL);
INSERT INTO `line` VALUES ('7', 'A区门诊楼一楼线路01', '这里是描述', '2', 0, 1572067533, '18a7560ad0124394bbdddfccea485c1e', 1572067533, NULL);
INSERT INTO `line` VALUES ('8', 'A区门诊楼一楼线路02', '这里是描述', '5', 0, 1572067533, '18a7560ad0124394bbdddfccea485c1e', 1572067533, NULL);
INSERT INTO `line` VALUES ('9', 'A区门诊楼二楼线路01', '这里是描述', '7', 0, 1572067533, '18a7560ad0124394bbdddfccea485c1e', 1572067533, NULL);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `log_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `log_time` int(10) NULL DEFAULT NULL,
  `log_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_ip` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_method` tinyint(3) NULL DEFAULT NULL,
  `log_admin` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_useTime` smallint(6) NULL DEFAULT NULL,
  `log_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_stat` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('000f77981f354102a9b70de568f2e045', 1575095644, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 0, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('00117c5889fa4bd9aaf59a7abd973cdf', 1573355135, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 64, '获取全部数据', 0);
INSERT INTO `log` VALUES ('00122bcfda394809acc6c3e4567ae14b', 1575119220, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('001e518b19414c8d91597b17524d5f3e', 1573354003, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('002486a9399744d284b32c8cc02de754', 1573352094, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('0035f854dd994ffdbb2db5aa9c2aa747', 1574650501, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('004a6cc2304e498883fb66c1dbc01550', 1578233264, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 9, '退出登录', 0);
INSERT INTO `log` VALUES ('00542a78cff14299a9f0c66ec68a9de7', 1574607952, 'http://127.0.0.1:8080/patrolItem/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 97, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('009e545f4ff14245bf120db0614a3cbc', 1575119569, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('00be0221c12143efb2a455cb2712c122', 1575192847, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 40, '获取全部模块', 0);
INSERT INTO `log` VALUES ('00dfdd1c535c430e81a51ea0941a9da5', 1575194428, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('00f9ceb99c63464fa90a1bf3c2cac9b4', 1575196732, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页', 0);
INSERT INTO `log` VALUES ('01083d4a8b454c04bba27d43846fdbc4', 1573638322, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('0185a46b397e48d4a05e548e8c949c25', 1583390462, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页', 0);
INSERT INTO `log` VALUES ('018b1e59681b4d33860239d8f3abafb2', 1575114199, 'http://127.0.0.1:8080/equ/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('018defb582a24411a9aa4f568cf5fc60', 1574650588, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 58, NULL, 0);
INSERT INTO `log` VALUES ('019474cb54cf4aa6926a4df8c18b59a7', 1575095173, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('01afd112dd884964bcfccaf93a422bc8', 1575205209, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('01b9334274174d4e9e10354b215fc1b4', 1578226505, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 202, '获取全部数据', 0);
INSERT INTO `log` VALUES ('01e504223c0c427eaa82b216bf7b04f9', 1575095136, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 29, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('01ed5e46becd4067bf0737200e055786', 1573351633, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('01f41e296587429ea16ea490367f62fe', 1574650821, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 46, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('0214536bf06845a7986ea09ff1372f0a', 1573356186, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('0215af124aad4731abfc55bafd71a642', 1573484051, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 9, '退出登录', 0);
INSERT INTO `log` VALUES ('02164ed39ae1413fa51a5a238e33f93b', 1575197452, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('027163c0faad49b184063d96f1c05d4e', 1575261373, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 209, '分页', 0);
INSERT INTO `log` VALUES ('0294ccb501b347e781e41b932cb5b02e', 1575204369, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 170, '启用角色', 0);
INSERT INTO `log` VALUES ('02a8fc3296dd4db9a94439c138e844f3', 1575193051, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 102, '获取全部数据', 0);
INSERT INTO `log` VALUES ('02b1429e07aa4925af53ace760a8a777', 1575121304, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('02bbfe72d4d04fb194ca39f11bb4262c', 1573353534, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 38, '获取全部数据', 0);
INSERT INTO `log` VALUES ('02beb0ddfaa34dfd92238b4cc04bd3c4', 1573355857, 'http://127.0.0.1:8080/log/all/28/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('02f221b0226e43f3b317685c199f435a', 1575205005, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页', 0);
INSERT INTO `log` VALUES ('02f7a3935a9d4001a00d60a717158b52', 1574646394, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('0311d27acb2f438388f712b28c85173e', 1574650483, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('033695b9329546f8bbed8fd391d1ac3a', 1575204835, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部数据', 0);
INSERT INTO `log` VALUES ('0355fae7f43546eab067ce5c889e8ebf', 1573460303, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 221, '登录', 0);
INSERT INTO `log` VALUES ('035a0aaf08c744db95a227d602cd2ce9', 1575190171, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 26, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('035f4d793f4f4fa1b23912a1a7f91099', 1575119220, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('035fd87b65274962ba4dfb1fbdac7523', 1575199948, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('036caee6c0e544b5a5358f63a354014d', 1573352341, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('03730085d0394fba9ba964aa00082973', 1580023519, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('039ea1b128d54ffa96fc1a973c4ad0b4', 1575202970, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('03cd779d1fc1499d8d58cb34fbb1fb74', 1575196732, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('03ecdc42399c444897e20d4c0e31e88f', 1574648926, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('03ed38601f2c46399d28b3dbfd5b4307', 1573351632, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('03fa277873234ef1b2e1cf1a5de5e3f1', 1575211614, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页', 0);
INSERT INTO `log` VALUES ('03faa5103a984b0da276f9d66c40c626', 1575119595, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('03fb9aa8368f4d129b12b230375147fc', 1575261560, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 529, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('03fbd7bebd3e4ecbb2c593c08df3b18c', 1575094956, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 35, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('042331dadca64c3fbe6c0b7a892b5fe4', 1575209553, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 8738, '启用角色', 0);
INSERT INTO `log` VALUES ('0450e8d3d2c64debbd1a6faecf7c8e89', 1575112668, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 92, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('045efcecccfe46b5a374fb92c91817d8', 1575128185, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('0472fed8a9f544dd9ed90551bd0d99ce', 1575208168, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 65, '获取全部数据', 0);
INSERT INTO `log` VALUES ('049e415422564cacb931b50ee5a9c3d8', 1581922617, 'http://127.0.0.1:8080/equ/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('053daeef075744bca54c634f2d3eb457', 1573635708, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 644, '登录', 1);
INSERT INTO `log` VALUES ('05697561675743ddab991cf9aa62852a', 1574650887, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('056a8d25314849bb9e5a30ebd9ebcdb1', 1575121256, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 11, '退出登录', 0);
INSERT INTO `log` VALUES ('057ad01004af46b4ad9fe44d5c4128be', 1575189370, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 251, '登录', 0);
INSERT INTO `log` VALUES ('057d7ef999f24f018673024b66af734c', 1580023517, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('05a4691150884e4fb2dfb98095619b06', 1575210202, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 51, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('062292fc61874c7a901347c87d9eae2e', 1575126411, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 52, '获取全部数据', 0);
INSERT INTO `log` VALUES ('0665eabcb29f4a77adc0c3d8a011a4e0', 1575190271, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 56, '获取全部数据', 0);
INSERT INTO `log` VALUES ('066dd9e731d844e5a7fecaff5cba48e6', 1574648795, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('068108e591224bdca54129f804883221', 1575113570, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('06b4be9d21d94c1a80ec9eb29f713f05', 1575203343, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('06d7bc31d9564b49a3501ec32270b28f', 1575205188, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部数据', 0);
INSERT INTO `log` VALUES ('06e9d8a415f04c9d8df6e0ef8fe47941', 1573477586, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取当前登录的admin基本信息', 1);
INSERT INTO `log` VALUES ('0718204172e44c2ea9c2edaac570b555', 1573352070, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('0720f8bea6ea4d8f973f75c81370495e', 1573356333, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 17, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('072ea886965645f4a969f141ce5f8895', 1575204964, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('073e70e2a0db413c8ca4a94adaaf42fe', 1575261308, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 113, '分页查询权限', 0);
INSERT INTO `log` VALUES ('0742ef1b6fe64604815af94cc5d82b92', 1575192397, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 36, '分页查询权限', 0);
INSERT INTO `log` VALUES ('075e2e34f12c443d8860bfbd6b12d70b', 1575200264, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 51, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('077a10df2ec04537bf0222da44a8af8a', 1575196919, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('07cbabb287574694bf3b204e9e212c9a', 1580023470, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('07d50e7d05194d9ca3e3f8173228698f', 1575188132, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页查询权限', 0);
INSERT INTO `log` VALUES ('07de3c6fb6704541990e1ea3818ef44a', 1575124064, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('08035747345a4fd89df5441c908d758b', 1580023461, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 31, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('082adf63a9ee40b1bcdce051430960d0', 1575183332, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('0886e4bd952b4df5975db5d4ae0bb380', 1573638316, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('088d6f53192c4e439e8dc3e95979a8e5', 1573353219, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 24, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('089e41f6e11546fdb6239d2161f849c8', 1575119160, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('08c8bae3f90d40bab666802ca3bf1d25', 1575117664, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 36, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('08d1a2eb698141249d6bd8d78a5e54cb', 1573637207, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 9247, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('08e9e9ad19304353b56c30981873e5e3', 1575188703, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页查询权限', 0);
INSERT INTO `log` VALUES ('08ef4580e9994f8dae1916e640e3e643', 1575261910, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('0902fd3fcced4eff862d2c1569be0f2f', 1575196233, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 9, '退出登录', 0);
INSERT INTO `log` VALUES ('091dd033b75a4f08b1b38e9ad746b418', 1575093928, 'http://127.0.0.1:8080/line/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('091ee671aa324134b7fd9d8d32106c59', 1575129223, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('0930d8c8c72243229b9a1c5c4eef92f0', 1575205195, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 67, '启用角色', 0);
INSERT INTO `log` VALUES ('09348b126f6443da9f27cfa328c658e7', 1575124064, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('093a0dd9ad08460eab438143ff46285e', 1581922627, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 203, '分页', 0);
INSERT INTO `log` VALUES ('0946ab2037544a48b6a4d06578cafcbb', 1575128001, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页', 0);
INSERT INTO `log` VALUES ('09571613d23b4e6ebf80f6caa0948b63', 1575183373, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('099b03d2b3464c639bd39339e04d4ff3', 1575125133, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '获取全部数据', 0);
INSERT INTO `log` VALUES ('09cd70d9ce6b481d983e74afc2e74112', 1575211581, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '分页', 0);
INSERT INTO `log` VALUES ('09e59b078a264e2b95cf01baa6ffa863', 1575193878, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '分页查询权限', 0);
INSERT INTO `log` VALUES ('09ed7b686f3f44b68361cfcce3b3e2f5', 1573355426, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('09f8d2c4682a451a90f6170a36bf727e', 1580023066, 'http://127.0.0.1:8080/message/look/asdfsafawerqwsaayfthgadfsa', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 43, '标记已读', 0);
INSERT INTO `log` VALUES ('0a48788d0c6549ac9ac9a9a12736bbcd', 1575128857, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 394, '登录', 0);
INSERT INTO `log` VALUES ('0a6310839c8045ff8fed394a58fef623', 1578226530, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('0ae27b4a9e34440da4fb25263d6237dd', 1575208580, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 25, '获取全部数据', 0);
INSERT INTO `log` VALUES ('0ae5ac822e5f4b4fb2e705255eff4a3c', 1574650193, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('0ae8295bdebf47cb9b703d4164659e55', 1583390480, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('0b0be774a04849099c389ead3ad83d95', 1575205296, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '分页', 0);
INSERT INTO `log` VALUES ('0b3c1ddcf56d472d80cff3648d23f012', 1575093952, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('0b7ac76d70b5440e8fcde58196be0c97', 1575210229, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('0b7bf283d4a34395a867c30096fce9ad', 1575197333, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页', 0);
INSERT INTO `log` VALUES ('0b8fcdbcf91f413996fcec04ec093a1d', 1575206204, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页', 0);
INSERT INTO `log` VALUES ('0b9f63a3aa0f41e7a7fd3cc593fb5084', 1581922609, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('0ba02f01d6de44e1812a1f99499d4db8', 1573460287, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 146, '退出登录', 0);
INSERT INTO `log` VALUES ('0bbd7e768e3943bc8a0548ca18dba46a', 1575114187, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('0be2215aefda41a89263cf3d9d15ffbc', 1575194271, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页查询权限', 0);
INSERT INTO `log` VALUES ('0bf2952f9f5f4d58a0022acbf3ae3202', 1575182664, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '分页', 0);
INSERT INTO `log` VALUES ('0bf2e302df8b4b6488ad512e604467de', 1575211936, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('0bf61f65ef574f569d5984b3b10ca0b3', 1574650265, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('0c0f5c568b2b45bcacd2ac6380cc301c', 1575205005, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('0c16a3bd5d4a4ef8bbdd552abe13e767', 1575194444, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('0c2c3ac3bca74d5c879749fc21b495e4', 1575183082, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('0c32c08a60704956b2739eea7e4e4175', 1575119230, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('0c5840f18fd6416caf9194e9f8f9e089', 1575211746, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('0c630e8f462e4bd593795d040f97c3ad', 1578231127, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('0c76491cf4674435afa57786691036d3', 1575093942, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('0cb6a83cd62a482aaa2db0e6683c738d', 1575190315, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页查询权限', 0);
INSERT INTO `log` VALUES ('0cbeaf1d7050443ab64585e552a88a35', 1573352063, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('0cd4e1d5e81e49be82689bc2d7040aca', 1578308507, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 340, '启用角色', 0);
INSERT INTO `log` VALUES ('0cfd162d5d0949ffb0a7208a8877d9e3', 1573477600, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取当前登录的admin基本信息', 1);
INSERT INTO `log` VALUES ('0d3a26014dbd4c52bf7336109e652dd8', 1575202543, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 39, '获取全部数据', 0);
INSERT INTO `log` VALUES ('0d3ae6871f254c16ac3a7ec5faf19c2f', 1573355792, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 14, '获取全部数据', 0);
INSERT INTO `log` VALUES ('0d3efa787a284fb884a7631b109ad915', 1575119311, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('0d5da6ef52774e4ea95a5ec6df788fa1', 1575190804, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部模块', 0);
INSERT INTO `log` VALUES ('0d6f979370114c088bde29fb8bf8e4f1', 1575114053, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 101, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('0d8bcb92ddbe45079eb269150ef177f2', 1575194453, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('0d9b87fee6a74c2f8ede023ef36902d2', 1575212239, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('0d9cd7414e2c4791988ecaca85950b6e', 1573356717, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('0db53826abee4efc924aceb0a8b3c7dc', 1578231082, 'http://127.0.0.1:8080/message/look/asdfsafasaaadfsa', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 106, '标记已读', 0);
INSERT INTO `log` VALUES ('0ddec93254f94e8f91c9026e46405b03', 1575193038, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('0ddee40174574e1d915636ce60683b81', 1575187906, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 9, '退出登录', 0);
INSERT INTO `log` VALUES ('0e44f9cf15634271b125d611c59d11b0', 1575206097, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 44, '启用角色', 0);
INSERT INTO `log` VALUES ('0e7115b4227441e6a8925b897be49c49', 1575211686, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('0ea02c97e8ee4acfa3e4f3968512c577', 1573354887, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('0eb03b2f9264446d98fc363ee01011ac', 1573633476, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 180, '登录', 0);
INSERT INTO `log` VALUES ('0eb63a1a682b434880da54817f15fa56', 1578226491, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 9, '退出登录', 0);
INSERT INTO `log` VALUES ('0ed3f5cbad48414c87e5eeebf38019d1', 1575199944, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('0eda17de057b4c48884cfd4b6ed8076e', 1575294426, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 235, '分页', 0);
INSERT INTO `log` VALUES ('0ef29ce7b44d49b989aa9c3cbf4b2856', 1573636939, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 7, '更新当前登录的admin基本信息', 1);
INSERT INTO `log` VALUES ('0f56c8f2f0f84b5aa4a5b6bf6c6741b4', 1583390140, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 582, '登录', 1);
INSERT INTO `log` VALUES ('0f96c3b6641142adbff6a8180d01982e', 1581922748, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部数据', 0);
INSERT INTO `log` VALUES ('0fa507fe5ee34382a0eb448ed1718e05', 1575183363, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('0fafce954ef84e219334dede53866f07', 1581922652, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('0fcbc3a262e540cf9f25a0747dc53afb', 1575196770, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('0fceae3ada2b413eab8c8dcb3af30f9a', 1575211936, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('0fd7c804b61c4b0ebffc87dcb31b139d', 1575124272, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部数据', 0);
INSERT INTO `log` VALUES ('10237008b9594751a8f0e7b92445464c', 1575204357, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('1034e5433d0d4b67ae11c799ec5ab460', 1573352060, 'http://127.0.0.1:8080/area/all/line', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '查询全部区域和对应的线路', 0);
INSERT INTO `log` VALUES ('10397d48bd134537ab14cb215b5f49e5', 1575190315, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部模块', 0);
INSERT INTO `log` VALUES ('107c5abbe32541a09e339d529ba267e8', 1575208429, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 37, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('10b50381e77c47729db2af434b36c04a', 1578304944, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 9, '退出登录', 0);
INSERT INTO `log` VALUES ('10ca8d32eca1425498fb77df4fbbea79', 1578229590, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 100, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('10f65f0fe728471a8ad9a754b3a98d38', 1575123767, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('110dc6208f0f40c9a6ad8053ec2f3a57', 1581922609, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 235, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1112d9b31c4e4626b8b23275cd11b32f', 1575210006, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '分页', 0);
INSERT INTO `log` VALUES ('11477d60dab04381b6c3f0f05b2abac0', 1573640874, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('11695cc4348740359d44c50a98b3dca8', 1573354878, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 7, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('11aaaaca91a1491e8c9740d9a0a98a6a', 1574607916, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 1271, '登录', 1);
INSERT INTO `log` VALUES ('11b072c9b31043c7bbe543924807c187', 1575205949, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('11b951e6929648e387456092611a01b8', 1573355456, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('11b9ed212d414d9eb98d1cf5da5d146a', 1575182506, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('11bbfaeb40c94e9a91dc07e7ddce827c', 1574648662, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('11fb02557f864c56b687105725b10c57', 1575204649, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('121100d8ee374948b4f0f6c34998b631', 1575201055, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 91, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1228fba5ca1945b488ef1ac69a08d24a', 1573352064, 'http://127.0.0.1:8080/equ/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('1231e46e6eb647c9964bd9556bdbcb33', 1575187944, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 42, '分页', 0);
INSERT INTO `log` VALUES ('123cbcc45baa4eab8f2b5e2d794a7f02', 1575196778, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1241c7c7dd4b4b1bb0312ced2bec63dc', 1575204890, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 51, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('127f969ec004485c8c92393b7d09aeda', 1581922611, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('1288044b407d40f8a51fbba55cfc5781', 1575196274, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('12a60904731d4c5cb2069b33601c13e5', 1583390511, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('12a802039e0b4ebfa7c7e5fcecce8dd9', 1575201057, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('12acc81d9ab94f128a4562587f95a247', 1573355781, 'http://127.0.0.1:8080/log/all/4/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('12ad39b0d4a347af97d99cf097ef63b6', 1580023519, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('12c5c4a8013e465a8ebf8bc2947b22ea', 1575206089, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部数据', 0);
INSERT INTO `log` VALUES ('12f12df26d4c4cbda8a2d675dadefd80', 1575128190, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('12f1938c7c9842fcb172d025ee2a5806', 1575206204, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('12fe9a1836f04c6ba7c4c91ddf92b606', 1575211968, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('130afbb049944f9bb746290702b8081b', 1575211753, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('1317558b2aca4187b88b7965346c05f3', 1575206286, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('132d8dd5bd154b90bb0eba63900690ca', 1575093952, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('133000b877d94ea5a6d726ffbffd54e7', 1575205895, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('1351350d7dfc49359f0939250128c12b', 1575127991, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('13994b161cb24e3093c33c56617eba9b', 1573352119, 'http://127.0.0.1:8080/area/all/line', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '查询全部区域和对应的线路', 0);
INSERT INTO `log` VALUES ('139d0290a4a642a19aec94250f028e03', 1575204835, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('13daaf46064e47cd97d9bef454cd5959', 1573357156, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 0, '退出登录', 0);
INSERT INTO `log` VALUES ('13ef9fbb19f541c9a3ddf06863767ff9', 1575114198, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('1404b3a055a24659acdd1fdbe76d2cf0', 1573637450, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('142619c4fb394ba09a9cc5dd57c803d3', 1575121519, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 50, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1428521e58744f36bf4e0d5302d9a73a', 1573456497, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 674, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('1446dae7c6fb4eac9585edd971a2a93f', 1575119160, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1454330e7dc7489e88d5af4c5efb2e82', 1573640335, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 29, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('1474bf4b12d043598d82b7daa491d8be', 1575191429, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页查询权限', 0);
INSERT INTO `log` VALUES ('1475bcee863240f788db63bddc3cf3a0', 1573638014, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('149304f192054ec5a47263e56824a04a', 1575196919, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 34, '分页', 0);
INSERT INTO `log` VALUES ('149ce533ab7042ecb55c93a65e1a36ff', 1575201053, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 54, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('14aa39922f84447281267830c536c238', 1575280887, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 296, '登录', 0);
INSERT INTO `log` VALUES ('14b21058a49b4e619749733c1f2a9b92', 1573355842, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('14c261e002c1453eb40f23d887470fe1', 1575281225, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 113, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('14de0da0817d408e96d729f8e5e6223d', 1575126395, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 24, '分页', 0);
INSERT INTO `log` VALUES ('14f29ed0d5454bc3b462c4809758bbad', 1575196274, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('14f8365384fc4e438be9e90e0e36442a', 1575188486, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页查询权限', 0);
INSERT INTO `log` VALUES ('14fc4eeb272340bbbf72a5e3cf092a1e', 1575210949, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部数据', 0);
INSERT INTO `log` VALUES ('153f8227dd0744faa7d90a995110123c', 1575128185, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 303, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('1566beb0ce2b4e5b9f3ab644a7382627', 1573634083, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 7, '退出登录', 0);
INSERT INTO `log` VALUES ('1573895a191443f983d9b60e345f8302', 1575126576, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 70, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1579727fa3474172bf1d301c9a319864', 1573353318, 'http://127.0.0.1:8080/line/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('159a517ddef34ddb9556efe82e8b1c4b', 1581922617, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('15fbb4493d604eb6a9e785ab1728aab3', 1575128846, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 11, '退出登录', 0);
INSERT INTO `log` VALUES ('160159099d254c87be93b0a711040bac', 1578231048, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('160dc943e2384f6d9defce1606738306', 1575206622, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 51, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('161d597bfac743c69820fd95848ba5a0', 1575196733, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('163f60beb14e4284bb310f841f7b7c3d', 1573352060, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1646282534454789af0dedc103ad43e2', 1578230043, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 773, '获取全部数据', 0);
INSERT INTO `log` VALUES ('167a4de76edd43ce9e653c5c8ca4bc3e', 1581922616, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('16809c21e14a4f77aae5fc8f859f7805', 1575181755, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('1682b1179b3b48de9805a75e9a7450ba', 1573456529, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 30, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('16b7502a987e49889269903ef736675c', 1573353164, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 113, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('171a9138024f4b669243019943499b1c', 1575186745, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 169, '获取全部数据', 0);
INSERT INTO `log` VALUES ('171e27defd964ee686498ffa654bea04', 1575114197, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('1726f6ec604e447787c2069a0e53319a', 1574650565, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('173b15549d83472c986fa649fd978166', 1575196774, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('177c17422b9c45a1b094148343aec452', 1575197338, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1799657ab3fa4678bef8163a6cc55ac1', 1573354879, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1807f32d8f7446e7878aaf9f8c5cad80', 1573352056, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1823b8c17a4b4c98a1a06084290165ac', 1573357134, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 3, '登录', 0);
INSERT INTO `log` VALUES ('18aa62a9e7b9477da1487a54eab767f6', 1575202970, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('18ba43daebb746fe8caf77b5696f0097', 1575199476, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 27, '分页', 0);
INSERT INTO `log` VALUES ('18c8e9770975459cbe6be9e6c96e5142', 1575187469, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 52, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('18e01e9b226b498ba504efbbc3dbe06a', 1575208153, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 245, '登录', 0);
INSERT INTO `log` VALUES ('190384978af7464ab05a75cf320d16a7', 1573637735, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('191ccfc81e67491f922ca96c9677ddc0', 1573356346, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 30, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('192e46027adc4f1a94b37db6253e4389', 1575193023, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('1940a564abec420f8979d528bfd322eb', 1573355695, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('194922073f8f43d3991937407dd731f9', 1573354032, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('195103137e0c4e98a742acb340d0b8a3', 1578229585, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 156, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('19652a6bf03a46e5996849d1b0c99018', 1575196825, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('19921980ef5148e7b8465530eeaccc2a', 1583390462, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('19cac3de9d864f5883e848f8b874b29b', 1575119464, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('19cd151c13aa45bab1ecb9e47063dcc6', 1575208628, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('1a0e36b6ec9f4c8a902c660f040da0f0', 1575208580, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 29, '分页', 0);
INSERT INTO `log` VALUES ('1a18543de4894563b35511cf7970e740', 1575210949, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页', 0);
INSERT INTO `log` VALUES ('1a3cc7c8b32c4976b4f20ec1152cb254', 1581922652, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 167, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('1a40c95f84d648d2809a0c9a0063b6aa', 1575189059, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 9, '退出登录', 0);
INSERT INTO `log` VALUES ('1a4e4ac280934bce8d3fbbdf4c8cdcf8', 1580022312, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 455, '分页', 0);
INSERT INTO `log` VALUES ('1a690100696c4b1a8af17f48d6255bdf', 1575210370, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('1a72c3f10faa4f66b08cca844cf77980', 1575122651, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 128, '分页', 0);
INSERT INTO `log` VALUES ('1ac9289ee70648bbbc5d7ecec07bce6c', 1573456529, 'http://127.0.0.1:8080/staff/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 400, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('1b4deb51c0b94a26a39293f42f181cf8', 1575194519, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1b500930f7614203b0b0efd05b8c16bd', 1575128163, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 172, '分页', 0);
INSERT INTO `log` VALUES ('1b6d4d617e51426eb62e8b50bc56d450', 1575193009, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 70, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('1b94862eec554611baa2a3edfc456ad7', 1573355848, 'http://127.0.0.1:8080/log/all/5/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('1b97c920ce9e47908b70860d62096555', 1575210218, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1ba83530c16349cdb7949e2d5b1d8d7b', 1573355686, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1bb3edba6a694fbf831641e4df0f2ff5', 1575285765, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 1025, '登录', 1);
INSERT INTO `log` VALUES ('1bca2c22aca843aea75548a13ef83a51', 1573480858, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 9, '退出登录', 0);
INSERT INTO `log` VALUES ('1bfb4e048c894ae5b17d9510e0d7b5f1', 1573638230, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('1bffd35d48294084a5e89ba917738104', 1575201047, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页查询权限', 0);
INSERT INTO `log` VALUES ('1c08ad05deec4869ade110d0fb5aeb69', 1575204845, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('1c576ca3747a42179ebf03a53acfd0b6', 1575119887, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('1cb085c7031d4728a9de20daa0400016', 1575113744, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('1cc4e7ddec48461c836efd5daf2d6f4e', 1575204890, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 50, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('1cd6177dc51d4eb6811dcbf0db2bacb0', 1575188172, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页查询权限', 0);
INSERT INTO `log` VALUES ('1cea0e38fc284732b2aab520a1b37341', 1575181424, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 84, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('1d0d492080b04fd6bc7d9b118d061d60', 1575206310, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('1d23d75435d44aab871d6c45ce2bd6d9', 1575122204, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 77, '登录', 0);
INSERT INTO `log` VALUES ('1d5aef1a01f54c0c9e02c6c26802ae1f', 1575194435, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('1d613f818f5f4f65a3ee50ce719def04', 1575196761, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('1d6ff65e12f94cf89fe3a5a2f33fdd8e', 1583390551, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 38, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('1d95b78b646e42a7a1b06a20f6b3d325', 1573456511, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('1d9ffe17a9b2408dbe286094bd8b6a9b', 1575196765, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('1da30e37059041ec9c7200aca99ccb02', 1578297960, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1071, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1dbd891de4244101b37064ea6a28fc02', 1581922603, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 138, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('1dc1c5023c5f4c29915b35f2e1cf906e', 1573633466, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 7, '退出登录', 0);
INSERT INTO `log` VALUES ('1dcf6c84fe4e471aaf573026d42e5487', 1575093917, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1e277ca4d2b047c490de7d18f795d20d', 1575113828, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('1e2fb5886fbe452f9d80f55eb4553567', 1583390451, 'http://127.0.0.1:8080/equ/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 116, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('1e4e801451f94faa81eb57192e58b15c', 1575201047, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部模块', 0);
INSERT INTO `log` VALUES ('1e9a08bf257b4ced9dedba09dbb84db0', 1575123799, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('1eaebd670f6a494abbe27ab9a544dfa1', 1575204898, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('1ecebe26613644849b5aa7bfeb8198e7', 1575200160, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 50, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('1ed3f17316654922bbed8a925ca16ef2', 1575261544, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('1edf2928c1bc438f994ea1f4f10dd124', 1575197452, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页', 0);
INSERT INTO `log` VALUES ('1efe11b1c04e47c19684a466b29bad80', 1574650821, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('1f23f6105ab043dfb0a7a7e05c7161f6', 1575205209, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1f2e319516b3493781d46068238816b2', 1575210949, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('1f5b79336bd44cc78b6d6d31291562e6', 1575093935, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 122, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('1f6ad786e64245228f80aa3b977ad24d', 1573355426, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1fa2963fdaab483dbf22f8cf3dd7ad20', 1573353659, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 26, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('1fb294d13a414a52b28a3c38964b5b48', 1575281552, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('1fb7a28a34e14c4596fef9a31e9761cf', 1575211687, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1fd2a40267fc42e9a7f96913246c56c7', 1581922652, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('1ff0660fdcc74cd2bde6e1538f6fa232', 1575128153, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 143, '登录', 0);
INSERT INTO `log` VALUES ('1ffd5c15a18745ea85facc9af7f12d87', 1575119307, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('20011c6444c94319b8af73bfe859c45f', 1575211889, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部数据', 0);
INSERT INTO `log` VALUES ('2003f44c4d024106ab846754858683a0', 1575121976, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 39, '获取全部数据', 0);
INSERT INTO `log` VALUES ('200baf8487374523a745a546ac25a0de', 1573352091, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('201c45bfaeca47c69ddfff0f5e73c3ca', 1573354026, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('20320a79721744f196960d0f67af1e35', 1581922654, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('20450401ac644178bc48c0e1cdf826e5', 1575129143, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 12, '退出登录', 0);
INSERT INTO `log` VALUES ('205ec3c39d2840cc9cc12219dfb63cb5', 1575279948, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 541, '分页', 0);
INSERT INTO `log` VALUES ('20f088cf6aad4052a1f7f8c904bc7f45', 1575123718, 'http://127.0.0.1:8080/roles/1/10/1', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 31, '搜索加分页', 0);
INSERT INTO `log` VALUES ('21319151e1394eae9c6f6d24837d03ee', 1575114242, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('2155cfee317b4dd4a50683a22a528be9', 1578235428, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 194, '登录', 0);
INSERT INTO `log` VALUES ('215de96c25434126ad688572bd596723', 1575205895, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('219fedf7360a4747b42b1f98ba75a8a6', 1575124172, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部数据', 0);
INSERT INTO `log` VALUES ('21f7fa97a6aa40cd8b9a2aaf81ae264d', 1575193032, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('221940bef70042c28263ab59b222fbfa', 1575293551, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('2241561c75044c6489fbe1ed801c047e', 1575210242, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('2248ead8d6a749f28a1d466100dba0a1', 1578230989, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 374, '分页', 0);
INSERT INTO `log` VALUES ('229e94ed21af45e08c370eb4a1543c95', 1581922609, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 53, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('22ba04c7df894220814d291f28a1c37f', 1583390459, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('22beef5622d5465f8e1243f3e97cc672', 1575208143, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 16, '退出登录', 0);
INSERT INTO `log` VALUES ('22cac819d72e4c19afc704cf11b8e4e8', 1575261289, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 33, '分页', 0);
INSERT INTO `log` VALUES ('22d999d24b7e4256a95d3bd541e4a58e', 1573356197, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('22e2ba1ced0443628c95694c6478cd27', 1575294544, 'http://127.0.0.1:8080/admin/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 91, '更新一个admin', 0);
INSERT INTO `log` VALUES ('22ed51095b644accb77c11d32f436bb5', 1575209951, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 27, '分页', 0);
INSERT INTO `log` VALUES ('22ef8bcfb1bb403baa6d2f919e9169cc', 1575190171, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 63, '分页', 0);
INSERT INTO `log` VALUES ('234711ef362343e5b6780ba003b4ff38', 1575128289, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 9, '退出登录', 0);
INSERT INTO `log` VALUES ('2349b77bd752414a9ca050d22d792284', 1573640073, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('2367faa186764a8794d88ca2f6d4d3f3', 1581922620, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('238f05968f3f435aa7918aa35e93d269', 1573356711, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 12, '获取全部数据', 0);
INSERT INTO `log` VALUES ('23b88e888cbf4760bd16e14797d5df91', 1575206285, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('23b9023fbe1141258edac09ab1812d99', 1575199954, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页', 0);
INSERT INTO `log` VALUES ('23bea22607b64b63ac9719a467f6d3b5', 1574649818, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 48, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('23cae70140ec46209a3e9cdb39051959', 1573352085, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('23f27f6978e547d79ec8618745af8c22', 1575122236, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('240a1c6b3b75484781ea63b785451428', 1575210370, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '分页', 0);
INSERT INTO `log` VALUES ('24192a5aaa6d4801b8489f3155aec9d2', 1575194435, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('241ea90a932942a49870ae32c3aed747', 1575294535, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页', 0);
INSERT INTO `log` VALUES ('241fb4ec4b95416397f11aadaed2da13', 1575206952, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 294, '登录', 0);
INSERT INTO `log` VALUES ('24680f9c958d42c0802f0e9873e81b22', 1575119649, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('249ef6dbe0fa4b4083f8158c88cad573', 1575121579, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('24a814bb32ea4c70a71b44a73157b1b4', 1575201071, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('24b2f07e1f6e41c6a34957e909d3d65d', 1575206661, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 9505, '启用角色', 0);
INSERT INTO `log` VALUES ('24c2b8f80a6b4299bfde6ce3d16c096b', 1575211721, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('24d190106d2d4cadbb85c49383092215', 1575194428, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('2521aab6aec54a67b35eb84376edb61a', 1578231162, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('2529d9f14bef4f19ab9341b36065abfd', 1575205554, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 77, '启用角色', 0);
INSERT INTO `log` VALUES ('2570dba100cb427596fe72ef67a3544c', 1573355148, 'http://127.0.0.1:8080/staff/search/chenjunan/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页获取全部数据', 1);
INSERT INTO `log` VALUES ('25afcde90b0047dba797782bfab519e9', 1575113845, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 96, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('25b372f3592f4b62b86db71524d8f1e5', 1574649615, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 30, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('25b94156c94e429ab7e62dd4cfc91467', 1575184026, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '分页', 0);
INSERT INTO `log` VALUES ('25ba58ce584f4a99ba674e479319f647', 1575128163, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 47, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('25e4f03d162e45d3a4c7792c17d22b1e', 1573352089, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部数据', 0);
INSERT INTO `log` VALUES ('25e5678577dc4f86848557d31c23ee59', 1575181755, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('25f2c3b25a2b42bb8e9cccf5adb8ade4', 1575183333, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页', 0);
INSERT INTO `log` VALUES ('266ccd85eee84d6eaeec156cef943b41', 1578229594, 'http://127.0.0.1:8080/area/all/line', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 469, '查询全部区域和对应的线路', 0);
INSERT INTO `log` VALUES ('2678c628504e4aa3bcb8bf5012db7028', 1575281263, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页', 0);
INSERT INTO `log` VALUES ('267a4f74ad29421ba578f59db7777156', 1575208167, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 178, '分页查询权限', 0);
INSERT INTO `log` VALUES ('269f9e8db0b343a99eb0e01f05b71791', 1575282240, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 220, '分页', 1);
INSERT INTO `log` VALUES ('26c246947cd64648873b4b7f9a895bb2', 1575208605, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('26ce7e90eace417b923da4571015ce94', 1575196733, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('26ec34c9a3da4be59ee4c723672ab4a5', 1575209902, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 12, '退出登录', 0);
INSERT INTO `log` VALUES ('27197825ac9b4e909adf2548576f2c4a', 1580023471, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2727b9e6bfef4dd981b69c92b0448f3d', 1575119188, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('274e596fc09642f49bfee97b390a0819', 1575204831, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页', 0);
INSERT INTO `log` VALUES ('27977f19f8f147c1a2fed056c26a5566', 1575197338, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('28119130c75d469b9ec1ac2e28dc1cd4', 1583390455, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2838a5d075b84c86952f3291b5579732', 1575199999, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('285286436313440daac3a3fa3e27a5cf', 1575212024, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('285579b0d6984ad3b40d53e86ab7ad84', 1575203931, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 29, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('286523ccd9f6478bba07db7f2ea89c3a', 1575261848, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('28a2a2497f0d4b72813696113afedef4', 1581922634, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页查询权限', 0);
INSERT INTO `log` VALUES ('28b97e3ff78f4bc3b154e898a0a154ea', 1575204369, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('28d934245c6645abb0b1e52b4384033a', 1575196765, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('290b023358eb4950a1041b19c985400d', 1575093950, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 65, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('293500a2ef5d4c178c3b2f0869d549de', 1573353225, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 60, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('297d1a9111134e589ec5c0744a0e2ab4', 1575211750, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('2987bf3e256c474aa1346812eeed587b', 1575292094, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 11, '退出登录', 0);
INSERT INTO `log` VALUES ('2988aea7cc0544cd88834924e55f7777', 1575183383, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('29a18703213c424aa912d99effc1e8a6', 1575197407, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '分页查询权限', 0);
INSERT INTO `log` VALUES ('29a25788cf9f4287b9c17ece04480ecf', 1573352796, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('29a5fae485134571a061d7e6fdbbb060', 1575187503, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页查询权限', 0);
INSERT INTO `log` VALUES ('29e041ce679b4755b4ba5b284f24b3ea', 1573351632, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2a0335202cf641d58e8d615767eee2be', 1575113788, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('2a1abe5c4ea5478fbec63afe5b16361f', 1575113615, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('2a2c47e7e35348cfb5d24fa5000f2551', 1575194494, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('2a49fe2a5aa4464a9d41ba263898d95e', 1575206671, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('2a55b9514eaf4fce8dede07138c5cd67', 1575196696, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页', 0);
INSERT INTO `log` VALUES ('2a8134b963c349e3aa967c12e302018f', 1575281284, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('2aa26d3f94d0414bb74ca9a6e97c8733', 1575203859, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部数据', 0);
INSERT INTO `log` VALUES ('2b1356b7374c4fcca477fd1303a6410a', 1575093880, 'http://127.0.0.1:8080/patrol/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 71, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('2b2afe6faed945c792de4c18f900f0ed', 1574650556, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 34, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('2b3b3be265b14dac95d2e1d4312ce005', 1575281241, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('2b3cf2cb52f14087bc67942139b2a25b', 1575188072, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 58, '分页查询权限', 0);
INSERT INTO `log` VALUES ('2b66cdc191e0490c82a5f16a3464cda9', 1575188402, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页查询权限', 0);
INSERT INTO `log` VALUES ('2b68fd7c64c941ceb4d4aeef4b73f4af', 1573636550, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 17, '退出登录', 0);
INSERT INTO `log` VALUES ('2b9fcd35105645e6b56e16f219960654', 1573353658, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 26, '获取全部数据', 0);
INSERT INTO `log` VALUES ('2bcb488a1c2c4ee286e465cf2281d61d', 1575194027, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页查询权限', 1);
INSERT INTO `log` VALUES ('2bf8ba946ec34ecab78fc904b053ba65', 1575122651, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 41, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2c2f0715d9ff4f46b0a56ce67a589d15', 1575206259, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 61, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2c332dd8476748f19a56643be290ffcc', 1578226540, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2c48b22b854c4f1e8ad3922f51421ede', 1575093946, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('2c589fa22cc14767b2927e3f5a32b96f', 1575118886, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2c7c08370cda43d684c139c2abf04822', 1575203146, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部数据', 0);
INSERT INTO `log` VALUES ('2c871c24dc9d46e2b8613c88c5824aac', 1575127991, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2cdbf9ecd5dd4cd9bd6df5b04319b321', 1575209939, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 154, '登录', 0);
INSERT INTO `log` VALUES ('2cfe9bd777144eb28b9754610bebef54', 1575209371, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取全部数据', 0);
INSERT INTO `log` VALUES ('2d078ca0b9fc4edf897f709544829db4', 1575198071, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 49, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2d386ea7b5454a8798d77fefbfad58bb', 1573353325, 'http://127.0.0.1:8080/equ/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 63, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('2d5c31fa4f6f478491427e18bc6e771b', 1575196825, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('2d65499730d94075b96e14c9ae7f8d04', 1575126511, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 204, '分页', 0);
INSERT INTO `log` VALUES ('2d6ebfd06d914a52a920a697d4512d96', 1578231040, 'http://127.0.0.1:8080/log/all/222/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('2d7ca20d0b0a499485e24cfbb53f40e2', 1583390478, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2d840d2b69d24221b7e309642d11bbfa', 1575196603, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 26, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('2d8ce5296bee4f3d87222bd06e219b28', 1573636899, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 9, '退出登录', 0);
INSERT INTO `log` VALUES ('2db4cb430c6e4d4eaff9ed53610fe445', 1574648838, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('2dd1ec7261cf4e76a45d72e3e5849cb6', 1575205895, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页', 0);
INSERT INTO `log` VALUES ('2dda4f1e6ee1480b871c41d681c3ddce', 1575119488, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2ddd0e4f40364718a8f1e849e58b07ad', 1578298050, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 230, '获取全部数据', 0);
INSERT INTO `log` VALUES ('2e15b4bfc61545459fb1b9e104e4d32d', 1575211644, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('2e2a33eb76d343fab347429859b31f0e', 1575188335, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '分页查询权限', 0);
INSERT INTO `log` VALUES ('2e3b5897731d453c85bb235cb8641bba', 1573352089, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2e62369e0eb74938ab2e10ac4994476f', 1573351659, 'http://127.0.0.1:8080/admin/changePassword', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 27, '修改密码', 1);
INSERT INTO `log` VALUES ('2ea3faab337f4ba4b2d21eac847d971f', 1575182412, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2ec2b2ac05344b9eaf906caad812ee49', 1573352062, 'http://127.0.0.1:8080/line/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('2ee28e794bc94e228c4c155aee1ca4cf', 1580023430, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页', 0);
INSERT INTO `log` VALUES ('2ef11f30d4de40ad81346c77aef31c0c', 1575192613, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2f062799a0564ab9a4e9be4b9f3bd5e3', 1580022305, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 54, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('2f0fa715b4a44d29bba6918687d49163', 1575117732, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('2f2019f2d1cc478094e49615e62d0bf4', 1583390480, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('2f36bb1b791646a094c48dd727cf38db', 1575281274, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('2f4f0421f5bf4511924d2882932a2ef9', 1573355278, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 69, '登录', 0);
INSERT INTO `log` VALUES ('2f6ceffda8f44579a4c1aa3ec2c22c07', 1578233034, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 379, '登录', 0);
INSERT INTO `log` VALUES ('2f743d2015084f89a7516e660299ff64', 1580022315, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 200, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('2f972237046c47e39073b975088a7d53', 1575093917, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 183, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('2fa6764df9d94b2984ed9ab12b8ec091', 1575211452, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('2fc6f0ff689d41e984eafd75984b6bbd', 1575198051, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页', 0);
INSERT INTO `log` VALUES ('2fd9ef84cb6146adb03e0c2ef925dd81', 1575209371, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 32, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('2fe64f4146f044f9a14d92c1a01fb1f4', 1575114070, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 43, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('2fe8f7a7f5f842f3aa026f077656d359', 1573637564, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('30146bcd01434b43b6e5b71dbdff50c3', 1578230114, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3016d2b2980f4f07ae078b1be8afe578', 1575114183, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 33, '获取全部数据', 0);
INSERT INTO `log` VALUES ('301c0b5d1df940fa8a2f12b52c15dc04', 1575114198, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部数据', 0);
INSERT INTO `log` VALUES ('303343fe55a14e84a7201975edb39e23', 1575204926, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('303c468db05e4addb515abdc139dbde8', 1573357163, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 3, '登录', 0);
INSERT INTO `log` VALUES ('3046d6af6cb64cf8adad06c57ada1963', 1575210684, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3074ed3b7a5445fa85c2c45a42c7c7ae', 1575119315, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('30ca416824e54182854845d2f7198355', 1575194422, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('30dc9a030ea04898831131968e660aad', 1580023865, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('31195a8a486b4df3984bdcbcfa315d38', 1575188176, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页查询权限', 0);
INSERT INTO `log` VALUES ('313133171a6a4155a7bde241d43a0bcc', 1575192161, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 91, '获取全部模块', 1);
INSERT INTO `log` VALUES ('313ce81da9874f3ea5e91766cf6dcec5', 1575197452, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('317544bcf0b14824b7841b0e5440d4e2', 1575113771, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 53, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('317ca8c18aff4da9b053998d659696ad', 1573352324, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('318448731d574a65a89165a8627cd245', 1573640896, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('3185350698724382a6a5194e031135ec', 1575121506, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 127, '登录', 0);
INSERT INTO `log` VALUES ('319bb51ad785467f90ae58b765273bb5', 1573635171, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 766, '登录', 1);
INSERT INTO `log` VALUES ('31a10cb0e36940b392851ec2a9b30f9c', 1575123452, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 49, '登录', 0);
INSERT INTO `log` VALUES ('31aed0bb39884a4e80fd957895744202', 1581922732, 'http://127.0.0.1:8080/message/look/asdfsafasaaadfsa', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 81, '标记已读', 0);
INSERT INTO `log` VALUES ('31dcd61e074840d0ab049a768010a144', 1575113821, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('31e04cce60074052828ab3bd922a93eb', 1575094982, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('320810f74bb34234b9e6535890bc7dcf', 1574607953, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('322c8d53617544f482ff5b4ed581a806', 1575190442, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部模块', 0);
INSERT INTO `log` VALUES ('3267498a58b04ae5b81108041730e503', 1575189081, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 113, '登录', 0);
INSERT INTO `log` VALUES ('327ffad0dbbb414ba44888290e259716', 1575119565, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('329562c57a4e40b5b5298840c3714028', 1573639971, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 45, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('32adb6fc9fc94bb08c533cae8e095b62', 1575128194, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('32be6051a2d040ae9750490f8cdc9d6e', 1575208628, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('32e2a8127bb84b79a5a0ec5b618b4143', 1575197333, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('32fea9d9989a4b219b3048804ff4f114', 1575204684, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('332eeab3a61347e5bfe302e5d75c6391', 1575128867, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 194, '分页', 0);
INSERT INTO `log` VALUES ('333c5f34d6c9436bad89db6ae74b296a', 1575281191, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页', 0);
INSERT INTO `log` VALUES ('336212ede5b24cd8a5d597d13f5e41e5', 1575211753, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('33803fe95beb427080e21e97b7cc46ae', 1573356215, 'http://127.0.0.1:8080/log/all/23/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('33a095bb7f0a4045881cab4c91e5ee60', 1575189485, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 31, '分页查询权限', 0);
INSERT INTO `log` VALUES ('33b4e856046945cb9fb6f0f415f61e35', 1573354936, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('33c1de3a940545979394ac8264f68398', 1575211862, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 294, '启用角色', 0);
INSERT INTO `log` VALUES ('3410a8ec8dfc4a52a5403983e1b19a8a', 1573476751, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 100, '登录', 1);
INSERT INTO `log` VALUES ('3416fd62f6ff4599a596ba26e7f5327a', 1573354003, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('341e7bcc19bb4ec98083fbe2c2f70abe', 1573351620, 'http://127.0.0.1:8080/log/delete/e498a43914a34feb83908dacbb17f021', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 108, '删除一条数据', 0);
INSERT INTO `log` VALUES ('344d012a5e2b4bbc89bad838642d9cca', 1573355142, 'http://127.0.0.1:8080/staff/search/chenjunan/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 122, '分页获取全部数据', 1);
INSERT INTO `log` VALUES ('346af8c2e9514e2fa0a74a7e522f2159', 1575126406, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('348b6303f2cb464598fa9907bf835acb', 1581922588, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 6, '退出登录', 0);
INSERT INTO `log` VALUES ('34cdfd424aaa4c6fa22c86a8b173be71', 1575205949, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('3503c1cfe80643509a1ba540c28943b8', 1573477567, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 804, '登录', 0);
INSERT INTO `log` VALUES ('35170c6e158545a1921b47d475178454', 1574648662, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 13, NULL, 0);
INSERT INTO `log` VALUES ('35190e56c7fb4759a3c11c5647d257c6', 1575193042, 'http://127.0.0.1:8080/point/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('35512560d3a74649a944b44295d68c79', 1580023470, 'http://127.0.0.1:8080/area/all/line', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '查询全部区域和对应的线路', 0);
INSERT INTO `log` VALUES ('35569bc856b54f3491ab8c780a4b6b7a', 1575194467, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('356ccf5bdd5d417c9f4fd8360588060f', 1580023709, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('356fb18d6161409bbcd8f6a79fcb0658', 1573638302, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('35721ed09f4b450f890689e69624517c', 1575203908, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 28, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('35874e9b6fe442b585bf85c97fc3f7d0', 1573356188, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('35a0a1fc6c474553859d6c9eb1c9ca47', 1573351665, 'http://127.0.0.1:8080/admin/changePassword', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 83, '修改密码', 0);
INSERT INTO `log` VALUES ('35a97c537ba944cb8481622f70c1f32b', 1575095588, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('35b2ca63c3954f2484a30bd65f0ebb8e', 1581922616, 'http://127.0.0.1:8080/point/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 144, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('35e7233fa65742998337f8971decffee', 1575128997, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 38, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3628311b35f346359315eb58c50a4ab8', 1578228581, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 741, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('367345b52049435b9a0f404243413fcb', 1575196733, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('3679837e89bd4b09b8a59a5006bcbe82', 1575204831, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('3687b1904cc8402c9a74a38b02b84d1f', 1575211452, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('36b0ef139e564cae96a7915eac40f981', 1573637636, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('36e46a8528cb4c4498589dc864c7ce6a', 1575187452, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 212, '登录', 0);
INSERT INTO `log` VALUES ('3700cb4f3b1842558f2fad69c8930ff8', 1574645910, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('371ec1ab055341158e84cebc671ce88e', 1575203343, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '分页', 0);
INSERT INTO `log` VALUES ('371fae846a0245b68a014c151c56d5ec', 1575119113, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部数据', 0);
INSERT INTO `log` VALUES ('372eb3857df04d99af7a815b6fd5ab52', 1573356845, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1f', 0, '退出登录', 0);
INSERT INTO `log` VALUES ('37491ba9ab444767b8fea28b78f91553', 1575194544, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('378f726d1aa342ab85603ee5607d50fe', 1574650127, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('37c3e2bdd63442d9944175ec701d5faf', 1578229544, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 59, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('37f0de52efe648c18240b6f56db2aa61', 1574607957, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 275, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('37f442f66a9b4649a357f4742ae3688d', 1578225908, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 4412, '登录', 0);
INSERT INTO `log` VALUES ('3823787b0e5c428aac329889cf08fd3a', 1575194499, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3823a0f756bf4cae8cb43651914b6c0f', 1575119464, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3853cabd658b4cde89908720fdc6ea94', 1573352078, 'http://127.0.0.1:8080/dept/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 77, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('3867db834d62451eaa8e84cb31bb12be', 1575095631, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('38698fb94d3349ca84278191a519ae4a', 1573637224, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('3870e3b285984d37a92461776ba57406', 1575204358, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('387bb08e51714747b2044bc1c4eabf40', 1575204246, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 132, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('3895d2d5ce8440eb9ebc307903d19613', 1575204894, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 24, '分页', 0);
INSERT INTO `log` VALUES ('389a7b743afb4eb6b30866bfc220f9c9', 1575123321, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 202, '分页', 0);
INSERT INTO `log` VALUES ('38cd6384ee7447a3a9e063c8f0b14759', 1573352070, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('38d923fde87845069903415933410024', 1581922614, 'http://127.0.0.1:8080/area/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('38f4d5a9cdaf440e9b8c77f9a70bfc97', 1580022190, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 1041, '登录', 1);
INSERT INTO `log` VALUES ('38fff59c85854a64816be4bd754bb28d', 1575114197, 'http://127.0.0.1:8080/area/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('390051762e41488eaed2b4a6a302f981', 1575210763, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 24, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('39102268d6bc423a983c22af869ab5eb', 1573355729, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 34, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('397490c715d44c69937cd587fd735829', 1575190172, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 33, '获取全部模块', 0);
INSERT INTO `log` VALUES ('397e2d7622b147e8b057160ff242395c', 1573637729, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('39990a1457374a44aa7a64ce6aa696a8', 1575261192, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 342, '分页', 0);
INSERT INTO `log` VALUES ('399a2266f6a64917b8cd06af7bbe6472', 1575201050, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 546, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('39c699568faf4ff094185e0586728d83', 1575211730, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('39d0c64a5e9a459a961425fcf04bf3e6', 1575093952, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('39daf51f0fdc482b85e1683aff93395e', 1575196705, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('39f55ac7aead43729475f577802b6c1b', 1575188332, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页查询权限', 0);
INSERT INTO `log` VALUES ('3a0de2fd55ef43378192cf0a1734ca9a', 1575192139, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 262, '登录', 0);
INSERT INTO `log` VALUES ('3a1df85d0f9f4e539222721dead89cdc', 1573355702, 'http://127.0.0.1:8080/task/delete/681639d5d06c435d9fd9', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 72, '删除一条数据', 0);
INSERT INTO `log` VALUES ('3a4af17817b84b5ca5eea9c4f2ed713b', 1578307989, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 524, '启用角色', 0);
INSERT INTO `log` VALUES ('3a635b37889b4486be36a715cf28c612', 1580023430, 'http://127.0.0.1:8080/admin/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 63, '更新一个admin', 0);
INSERT INTO `log` VALUES ('3a7410f81e7d4508a799ef10033f3538', 1575129167, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 68, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3a8dd85363a54890a0ec84f558cd1e6b', 1573356862, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 2, '登录', 0);
INSERT INTO `log` VALUES ('3a9a87259abf43bbb06de3195ba81efe', 1575093960, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 75, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('3ab376fb24ba4475b202a8bff6d3cb92', 1578308502, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 30, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('3ad23bbf8ce14d2ba8ab6edc0d3ebe3d', 1575281291, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('3ad4df5cbaa1405fa7068b21c48f527c', 1575208167, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 45, '获取全部模块', 0);
INSERT INTO `log` VALUES ('3b1a37127c3f4e1b89fef3221f21387f', 1575261552, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页查询权限', 0);
INSERT INTO `log` VALUES ('3b1de536c72c4a09b1d12eb5982cdc28', 1575294544, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('3b686de01c6e4882a5a2db7dc746edf3', 1575282491, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('3b72e844afd441aaae4981e892b4fe58', 1575183415, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 34, '分页', 0);
INSERT INTO `log` VALUES ('3b7321b513244eda9d37043fa73488f9', 1573460297, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 109, '登录', 1);
INSERT INTO `log` VALUES ('3b9868f32a894208b04e165d77f4b073', 1575211687, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('3ba8862d3b674508bce6626f812e226a', 1575208915, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('3bb76c0692d94d2ebedc37e8657414fd', 1573351632, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3c0aa1809e5a48cf88c12226497067c8', 1573352089, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('3c83feb37333480988cdb3daba6d1248', 1578230991, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 364, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('3cc77da33c304d889cbf7a5e3418dbbc', 1578229585, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 44, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3ce26ad2ec7b45cdb4f73c53e9426710', 1575196255, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 27, '获取全部模块', 0);
INSERT INTO `log` VALUES ('3ce62d3e912e402bae5442f752922ee4', 1575126395, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('3cecb19b656d4811a1749095e2c3109a', 1580023546, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('3cf3667b18d84c0bbe1a921b939c19b0', 1583390478, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3cf69e4122ea4ce8b2be3045d92ce2f1', 1575194027, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部模块', 0);
INSERT INTO `log` VALUES ('3d16fd8e22a245fa85708b6833f4c428', 1575204684, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('3d76d8f4c4094ef5a1c349da4c1bbc02', 1575128163, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 83, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3db6db82c25c4d3e85767df297d92d73', 1580022348, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('3dc962d9ba874d798791b05d7acd3a86', 1575293386, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 25, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('3de7cfc93ccb435684cf0b535d60eaa0', 1575192478, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 122, '分页查询权限', 0);
INSERT INTO `log` VALUES ('3de8cb71fd1c4f9d8a09210fbe142103', 1575196498, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('3e1037a2c3514723b5d6847ecb99df83', 1575211687, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3e1420adf2ce4427b1b9d1c14295a9d1', 1575197407, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部模块', 0);
INSERT INTO `log` VALUES ('3e320f32dae146b38b51aeff20ee7922', 1575118987, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3e468e00c51f448e84f5ba8fee508d2a', 1575204246, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 68, '分页', 0);
INSERT INTO `log` VALUES ('3e54681a609843f29dbed9d808a25d86', 1573352074, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('3e5b0f5910194214a72109f40eedd3d0', 1575182412, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '分页', 0);
INSERT INTO `log` VALUES ('3e60030c3256427da3e38c90dbba4880', 1575126511, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 88, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('3e6265e2e95e471ebdfd1ba614209d03', 1575211750, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('3e89de92805d4ee6bc34f1e1c0bb84d3', 1574650305, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('3ee79729a5704b81a547967c8fb3a65c', 1573352284, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('3ef4087597b4473bb7d45e9a1ce6ff93', 1575200264, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 49, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3f150544e6d84a3fa656ebc49846f75e', 1575292109, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 49, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('3f3c095fbdaf47468ac76e792873c731', 1573640059, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('3f4049eb783941e3ae59638c24df27f0', 1578305019, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 362, '登录', 0);
INSERT INTO `log` VALUES ('3f8ada7e35314bd0b5f30d13573567c4', 1573355482, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 73, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('3fc2281872cd470db5c110776772f649', 1575261544, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 288, '启用角色', 0);
INSERT INTO `log` VALUES ('3fc50b6e0a3449b897b68d009f35e974', 1575204964, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3fcd9a31c0174ed4bfb968fb30cf3ac3', 1573636561, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 77, '登录', 1);
INSERT INTO `log` VALUES ('3fdc325e4d714a6e99d74faab5115996', 1578226540, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 235, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3fe145ebc34c454a86a5a30e371b71d1', 1575281415, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 32, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('3fe1c397194742c8b584ae7d6592e6fa', 1575190171, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 150, '获取全部数据', 0);
INSERT INTO `log` VALUES ('3ff9ff8d163a42bd945cf3e3af3db801', 1575202911, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 29, '获取全部数据', 0);
INSERT INTO `log` VALUES ('40062fdbf20d442ba95b4f5754a8f9c7', 1575196770, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('400f44f3fc3a44c28f98674d3cac8804', 1573353983, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 9, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('4052c8d4fa96431984a878e19fcc470d', 1573353337, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 4, '登录', 0);
INSERT INTO `log` VALUES ('40933dcebf2642b996f92474ae75628f', 1573355288, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 122, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4097e21707c249a1a7672a2b39795c2e', 1575188162, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页查询权限', 0);
INSERT INTO `log` VALUES ('40c64c2c9b3348ec9c2d569148ea97fc', 1573638005, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('40c87c2bb647420db601d14fea3d69a3', 1574648847, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 25, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('40cb2c2f69714a1580352a17f9edae58', 1580022303, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('40d3471d92e34d049155c1dcedb2ed4e', 1575211167, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('40e7e0f2b48644c783a9102b9374ba2c', 1578297960, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1483, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('40f8f883ebdf451480703282ca58f6b8', 1575127988, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4111f882f4de43e6aa9dc2ec05e4b5de', 1575206971, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('413f5b15e3d04bb9b9529ea60f47a60c', 1575128867, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 89, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('415b6f51367046099944b34b8b19641d', 1573355850, 'http://127.0.0.1:8080/log/all/6/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('415f1065450e41cb9b6635dc049e2a7f', 1575205219, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 46, '启用角色', 0);
INSERT INTO `log` VALUES ('41641a29893144488352fe2a26f00265', 1575183333, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4185541d15e8427ab6120db9a0bee5b3', 1575194494, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('4199c9fdd85247e4b0dfb5d8c862cd20', 1575204840, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 158, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('421076ad30b946a8bcbb54488c71f63b', 1574648882, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 46, NULL, 0);
INSERT INTO `log` VALUES ('422a0216b14b4f8c98cc04699984a0ec', 1573355691, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '获取全部数据', 0);
INSERT INTO `log` VALUES ('42538664740747248cb9945eb29e7422', 1575281584, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('425ba6fa33d245108472dc05363b9d9e', 1575114183, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('42896e5dd3f34aa0814028aa5d4d7acf', 1573355456, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('42933d73e781410c9e95ecd4cb2013c3', 1575210006, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('42bd1cea4a4a49508c7f23b2c9c1facc', 1575119565, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('42be32d95dd54771a31cda0ee1b5d902', 1574651073, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('42cd1a30b8a4458484b63c5ce75153c5', 1575187927, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 150, '登录', 0);
INSERT INTO `log` VALUES ('42e1e491fc994558bf92767f9f99c701', 1575095622, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 0, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('43596e6055ec44aab743eb5d54016427', 1583390459, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('437caa66e5f444829d9fa1f0293b7102', 1573632876, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 3229, '登录', 1);
INSERT INTO `log` VALUES ('43804a477ff14c90a189239141312756', 1575208580, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('43927ce9134b4299958fecee2841adb5', 1573356347, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('43b3e4ba1071462f81e322db51e7587a', 1575113942, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('43b5571545d64b24baa0ad75870e1b1b', 1578231048, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取全部数据', 0);
INSERT INTO `log` VALUES ('43bd5e373b9d425face16aa26f24942a', 1575193032, 'http://127.0.0.1:8080/equ/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 91, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('4449a761051b4a9b9f8615bdd1ce3bfd', 1575197333, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4461ee796409470cac9df8c6e7d82cfa', 1575196733, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('447ea8126db1488d850a7caa0263edb1', 1575123706, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 36, '分页', 0);
INSERT INTO `log` VALUES ('4492ea9b652a4b04975b68265e806e35', 1575293394, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 50, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('44cc6c72c18b45bf9e64c362497205a7', 1575204358, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('44d4c3f95d164ad9a9dddb19e9ba9a72', 1573638177, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('44d60a7eb9be46909a90747e6259449c', 1573352197, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('44e673ddee834c3cad2bbd276e325525', 1575093928, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('44fabf3a9d9046229efcdc1126fe9090', 1573351638, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('4524e7dc8f8c462ea0316c997bd1db15', 1575205316, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页', 0);
INSERT INTO `log` VALUES ('456292e35b784de28858558c2927ea12', 1573355695, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 44, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('457cea6fea1e4c068b88c60b6bccff4a', 1575196783, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('457df60f6e9646aa8e019d2c8c21c591', 1575194265, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('4585a0c378fa448d93999255bca02d50', 1575196765, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('45b8c5a5555e4f8395bfad61514e805e', 1574649818, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('45b982dc8c8a4f3f888da50f1e39051e', 1575209951, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('45d1b41b077e4a28af68279e5980cc24', 1575261561, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 378, '获取全部数据', 0);
INSERT INTO `log` VALUES ('45d689198fba427bb02fc395a80a460e', 1578297998, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部数据', 0);
INSERT INTO `log` VALUES ('45fdd5617749427fb0be75ba82a10aaa', 1581922651, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 58, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('46079da4a88e4c4c9dbd00336a9aea4f', 1575293533, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '分页', 0);
INSERT INTO `log` VALUES ('46479c1ef8a14e47ab8eb4862b4b9a52', 1575206940, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 33, '退出登录', 0);
INSERT INTO `log` VALUES ('4648d57954ca4ca2b1c604e9873eb532', 1575211614, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('46551cb64ec84f3aae3b61ec0ac5728d', 1574650556, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('4668e8768db84ba08522a1c1d3df7b37', 1575114173, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 43, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('46732ceb2fce469e894e983abe52ab2b', 1583390469, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 54, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('46936e8963224381a03be6330c459039', 1575183368, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('46b295b4f7b4403b91d6d389ca9f4f6c', 1575095595, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('46e7f506cb0040bcbee5fec6b2bcdcde', 1573354887, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('46f56cef258e42b39d63fb6eb9179839', 1575113536, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('46fbdfc837a14cb6babe00a8223d8800', 1575196274, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('474d2be6d6c44e16b62cdb58b48966d9', 1578229594, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 219, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('475e49833db3430db96e7b0b7a07d86b', 1575282621, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页', 0);
INSERT INTO `log` VALUES ('4760131dfae54e40b61a34399d852f8f', 1575121741, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 134, '登录', 0);
INSERT INTO `log` VALUES ('4776a8b97f8a4d749dfdfff13c29923c', 1575119286, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('47a04869283d4f4bb417fe6aae4f0b62', 1581922671, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('47b313d8b45f4296a316c0a40e7fb4a5', 1575190442, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '分页查询权限', 0);
INSERT INTO `log` VALUES ('47d25af2a7da4c9094e7f3852d032696', 1575194457, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('481c9749a6214d548bbd130183a77dbf', 1575293534, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('484c19cef28e453bbf0ca33fb2d635b1', 1573456497, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 375, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4869612a30bc47f8bf0f9e2cba2ddb0b', 1575208913, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 117, '分页查询权限', 0);
INSERT INTO `log` VALUES ('487544f6a60143ca8d91546bf196f026', 1573356185, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 8, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('48cfcebed9684912a6de1e538442aec3', 1573355691, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 55, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('48e0ed0b6607429d8db3205d3f5d0505', 1575293369, 'http://127.0.0.1:8080/admin/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 117, '更新一个admin', 0);
INSERT INTO `log` VALUES ('48ecec1be7814415b58f1df98eb6d8c3', 1575206286, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('48edf549021740a78a2e93bfd3490bcc', 1581922748, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('48f4d0b0448047f68fcc9a94968ecf56', 1575196520, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('4908fbb819d34f9e9272f5a402c43b0c', 1575126395, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部数据', 0);
INSERT INTO `log` VALUES ('494907ea940243748456e34cd58a95de', 1575188131, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页查询权限', 0);
INSERT INTO `log` VALUES ('498dced866ec4e66a71c901852c31ccd', 1578297626, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 4785, '登录', 0);
INSERT INTO `log` VALUES ('49972b8a993d47b09762fed5ace2e9a0', 1575121976, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('49f418c10b844984ac460c2b590cf371', 1575189098, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 42, '分页', 0);
INSERT INTO `log` VALUES ('4a014ebe9de947679da16a0e36f861e6', 1575293398, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页', 0);
INSERT INTO `log` VALUES ('4a09a43cb58546d1aeec6d6f0a3a08d1', 1575202911, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 25, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('4a265d5d8a2b4014be8b95f842adb701', 1575204898, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('4a5683d7ed0b48449d0d9b5274434691', 1575204831, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('4a74c051c9874b3babc26a60891019b3', 1575193557, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 34, '分页查询权限', 0);
INSERT INTO `log` VALUES ('4a806119dc734202ac1ac5adbcd146c3', 1575261552, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部模块', 0);
INSERT INTO `log` VALUES ('4a99e4a772e54fdb946e64dc0e6866ce', 1573638319, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('4ad7ce376d094d24a838b345e537ef68', 1581922658, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4b4ea3b50ea24ae2826b9aea117dc659', 1575293533, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('4b5e23a200ea4a5093092b9f4cd77767', 1575188085, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页查询权限', 0);
INSERT INTO `log` VALUES ('4b8f08a46e4f489aa1020da0fe81b92c', 1575285785, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 40, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('4ba5ce14e94a4b4ba3c7f8ac8090e56a', 1573351695, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4bb9dd4521294536a66664d7b7c4d0b2', 1578139002, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 653, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('4bc329eb19a84fa7992ecb028c87ed57', 1573353294, 'http://127.0.0.1:8080/area/all/2/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('4bd254e7db304918af39b697a082572f', 1574648636, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 158, '登录', 0);
INSERT INTO `log` VALUES ('4be090c82b40410ebac39a79f5691d8c', 1574646101, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 370, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('4be3381a7b964a42b5e5a788232b78a6', 1575205188, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页', 0);
INSERT INTO `log` VALUES ('4c11ee793af04698bb11a65657ef1ae9', 1575113949, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('4c1c3cacf5ab45c691479a69c8ed87dc', 1578235420, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 12, '退出登录', 0);
INSERT INTO `log` VALUES ('4c31a7a54367433a8f7a17970488401f', 1581922596, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 118, '登录', 0);
INSERT INTO `log` VALUES ('4c3f767842c04d2c9c91219ca89caf4a', 1573355778, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('4c4e9579c13d41bfbcb4d6cdc1345cdb', 1580022307, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4c6889ec53d543d181a5524b8c5d1af9', 1575211721, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('4c7c9d77dd6c4dbab0436aadb022d7c7', 1575202777, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('4cb7fc11ef22473b89386c0d81c29618', 1573354032, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4cc7afa21d3b48ac987374c498f9c1dc', 1573633126, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 51, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('4d3fbb6da877459b90e3ca981b332f56', 1575194273, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4d44b37b84944e119861560bce916954', 1575280163, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('4d482aa5ec08409c8e0db49c586f43ba', 1578231053, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('4d6412711f6149c4a9630834f7339c6e', 1573355135, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 75, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('4d723ce116a04e478efb9c7d848a5ba3', 1575211167, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4d8e872e1cae47e6aea7ba6da4ba04b4', 1575129182, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('4da8e45d7890489d97cee590af91dd49', 1580023855, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 26, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('4dc8dedfa62940b9b6994b34c478da54', 1575281198, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页', 0);
INSERT INTO `log` VALUES ('4dd278beb2fc449a99d43878b6b0c57f', 1575114204, 'http://127.0.0.1:8080/equ/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 66, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('4e1d00f492114295887128e524ee1efd', 1575182506, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4e3dbde95f514d28bc32a8153c202e2b', 1573355708, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 1, '退出登录', 0);
INSERT INTO `log` VALUES ('4e4d225e574a4b73a1ee011056eca47b', 1575196520, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 33, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4e60f8975d894ee1a050dd494e5e2d9d', 1573354887, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('4e8f7251c3b445adbc8041004a84512e', 1575122236, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 36, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4e91e17982ad4223bc2817e4f11eadf5', 1574650533, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('4e95e17cbe2e4f1ca3f6b75a178cc85e', 1575128001, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4eb4d876e75548dabcff9bd8a7456ece', 1575119598, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('4eb4dcc9ae704e9bbd88254fe1356655', 1580023127, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4ed1d23ad2614ec6afde00897364f2a6', 1573355684, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4ef122be02234f1abafc3c8cd6ebc3f4', 1573353325, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('4f0268db8c04425fbb387d31b9a046da', 1573352093, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('4f500806cb3c44beba3c19daf793c0f9', 1575280113, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('4f5d390d1b974a08981f5fbc0fd34826', 1575121293, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 77, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4f601d8b8f6442db850024c506e27488', 1575196490, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('4f63f5f5bbe34c209a0495b29fdb086f', 1575206962, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 59, '获取全部数据', 0);
INSERT INTO `log` VALUES ('4fb45e81ae87413b8cd7f6f2c21b4bc1', 1573480864, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 63, '登录', 1);
INSERT INTO `log` VALUES ('4fd7f357c9db4037b2bd2f1f4f13bb58', 1575113626, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 59, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('4fe2c4a5f3154ae2bc3eaf342942ad15', 1575119272, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('500641b00bfa4617bc7332c20c992923', 1573352094, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('5021f25c346e44f38c5170388bb79096', 1573353288, 'http://127.0.0.1:8080/area/all/2/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('504a0d8d96694260be5d75e4650ea9ab', 1583390464, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 562, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('50c4b4c0718243a38528b57376d3db1f', 1575121256, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 1, '退出登录', 0);
INSERT INTO `log` VALUES ('50cc8365c9964a0aaf9e4abeca09a86c', 1575202543, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('50e48f9942074575a29c0a7ae8521c8f', 1573357462, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 4, '登录', 0);
INSERT INTO `log` VALUES ('51047aef74ca450693e466c4e25c9f0a', 1575194019, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 184, '分页查询权限', 1);
INSERT INTO `log` VALUES ('5114d65c53d84afea35d0e369e412611', 1575208915, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('51193cf7fc394d0a8a533aae1e808140', 1580022355, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部模块', 0);
INSERT INTO `log` VALUES ('512655fc97204cf894a69dce472c37db', 1575204840, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 45, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('5131564de78746fc8f7b7d4bc1391d40', 1575196603, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '获取全部数据', 0);
INSERT INTO `log` VALUES ('5147042902114190bae4a391e46391cf', 1573352064, 'http://127.0.0.1:8080/point/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('514b6f1717584a459aeaf63eb39df3f5', 1575203556, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 26, '分页', 0);
INSERT INTO `log` VALUES ('516b8390a21f400c91c5001e69100ab3', 1575113690, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('516c41e59daa4a52b175b9735599e56d', 1573355775, 'http://127.0.0.1:8080/log/all/5/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('51bd664cef4949d087f38e60c7ae1acd', 1573640076, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('51ec43d60a3d4191ac04680e2c403c06', 1575261477, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 40, '分页', 0);
INSERT INTO `log` VALUES ('51f5239bc99442a6ada827248631bdc6', 1580023711, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('51f79925c71c406ab871fdc44d7d68a4', 1575282240, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 118, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('5209fdfc64af4bbca207690c80091032', 1575208605, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('5242a4cf6abf401cba735b4b479e835f', 1575292109, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 174, '分页', 0);
INSERT INTO `log` VALUES ('525ca8e02aa748c0a1afa1e79200b777', 1575203908, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 39, '获取全部数据', 0);
INSERT INTO `log` VALUES ('526c0505cc224d1190b5ba92af9292b1', 1575201228, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 53, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('52745f8276154a84a1f2b431187dd03b', 1575201055, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 217, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('527ed8ae07e34517a20ad6a2832022af', 1575128867, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 78, '获取全部数据', 0);
INSERT INTO `log` VALUES ('5280c568ef964bfc9ce5fc946266ec82', 1575196435, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 7, '退出登录', 0);
INSERT INTO `log` VALUES ('528abf2bc34542648895240453829884', 1574650588, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('528d94ff38b04b7d8efcb2edabb6b4aa', 1575196783, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('528ec0f4f5114bdeb8fb32b0e3657bd9', 1575208628, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页', 0);
INSERT INTO `log` VALUES ('52932238947549d3a5ac344c2bf2c85f', 1575199954, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('52984a16f96d4685aff0e3b0a5787324', 1575196854, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('52a3368b5d744dcb8d3808f41a193a3d', 1574645799, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('52bc14ad3680420cab68404073d9a5ea', 1575095041, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('52cc0f9a2a5e4065846fb6a30ee17cf5', 1582468169, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 630, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('52d2c62dd15c4a4f985a931b18caee87', 1575212221, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('52e4ce582e204134ab3ae83d582a76a3', 1575207216, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('52ff08736e994682aa838f66f657d05d', 1581922748, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('531613bf9165412e93d395c7b8cff6f3', 1573640866, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('532480d028e6404784ca24f34e9013ef', 1573352341, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 26, '获取全部数据', 0);
INSERT INTO `log` VALUES ('5340f8a5b977419ea8172e63083f0ff9', 1575182319, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 39, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('5397cd1cef1a466a8527ff09bebaeac2', 1573637801, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 47, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('53c8bf977f3a4e17a1bb383d1d73e92c', 1575280160, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 32, '分页', 0);
INSERT INTO `log` VALUES ('53ec86ad5ea94427b5e4db9cdd0caa26', 1578308603, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页', 0);
INSERT INTO `log` VALUES ('5404ccdf11304cc9bc5627496c99f618', 1575192592, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 7, '退出登录', 0);
INSERT INTO `log` VALUES ('540c9de211234faaa068bd0c97501c38', 1575210684, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '分页', 0);
INSERT INTO `log` VALUES ('543a9c50144743b1ad712f316a9b1e51', 1575113897, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('545f72fb6a4243ebacecf34989360945', 1575196732, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('547d3333f23a40d6b033c1266049165c', 1575118289, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('54a907e23c1240f582a5fd71d4689ed0', 1575261820, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 68, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('54c48ab2b9ef48a7860aae6d2274d331', 1573355473, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('54d196635fb2421db3843dd6e5db93ae', 1573356215, 'http://127.0.0.1:8080/log/all/22/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('54f088e28b8b493892f17bbcf1ca3b78', 1575113846, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('5512511f034e410abedc1de7a01bf04f', 1580023417, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '分页', 0);
INSERT INTO `log` VALUES ('552c2df1ec674e5db1ee32e5a4b3e3f9', 1573357254, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 4, '登录', 0);
INSERT INTO `log` VALUES ('55724b8778e4409b82473cfeca5fe906', 1575199944, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部数据', 0);
INSERT INTO `log` VALUES ('557ad5c33f3645e7bfc82d2c28c37a66', 1578226575, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('5595c52503b04b768948f4e49bf41f8e', 1575095633, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('559d4842ea884749af8bfa84d641578e', 1575293363, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 179, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('55e1b300f5cf497eaa6ada8d781aadf5', 1573355135, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 57, '获取全部数据', 0);
INSERT INTO `log` VALUES ('55fed0a75ffc48f090462a22893d6a55', 1580022308, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 111, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('5609b94eed2a48ab9165913c11f36a15', 1575280196, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('5618f581053a40e4bee4f3cecad6e904', 1575093951, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 97, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('5654b83235c04166a180495b2cdab000', 1575194422, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('5655bb219d504b9ab8f10d13fc578831', 1575196778, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('565d9a9ddc604ef79b90de0e773e2328', 1575190823, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页查询权限', 0);
INSERT INTO `log` VALUES ('567e249e128c484cbf64af1fa0a828f8', 1575193058, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('5681b4056cbc4dce87b69b1b4c3ce8cd', 1575183638, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('5692e70141344b76b5ffc9879dddffed', 1575095591, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('569e2000621540debe4968687032fe61', 1575192613, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 54, '获取全部数据', 0);
INSERT INTO `log` VALUES ('56b1a83a58a8455493961b7ade1e1ca1', 1575281241, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('56e9ac7c644a436885fde676ed811ca6', 1575123470, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 47, '分页', 0);
INSERT INTO `log` VALUES ('56fd68e2e95c4be0b6e9825c8210a6bc', 1575188096, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页查询权限', 0);
INSERT INTO `log` VALUES ('56fe9173edaf437e910d44986ec5702a', 1575204645, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页', 0);
INSERT INTO `log` VALUES ('5702f7610f334c36a4f8b69239e2454e', 1574645482, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 234, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('5723ea88cfbd4274825e33bac8a46b83', 1574650547, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('573fb103a404406cab4a474f3bcd6570', 1575282621, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('574afe164c4a40d691df75a87ee4cf2b', 1575292712, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '分页', 0);
INSERT INTO `log` VALUES ('574b98ad21ab41cd90c1fef3f2b88f4c', 1575196261, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('57542ceca4a344e3bc3c0b2ca49f1e2c', 1575197045, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 25, '分页', 0);
INSERT INTO `log` VALUES ('576fb032c4ac4919920110a4baa8944a', 1573354000, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 22, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('5786d6f69a1b4fb4b0311fb3373b005a', 1574650237, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 31, NULL, 0);
INSERT INTO `log` VALUES ('579852b8a9964e6883e9273c740199af', 1575190813, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部模块', 0);
INSERT INTO `log` VALUES ('57a3bb6ac11b4464a3b2f4165e2072fb', 1575210218, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('57b6b9383a5540eeba6ddeb8834d7863', 1578307975, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 216, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('57dd2f00637e45e3bfb372c5d6053eed', 1575194232, 'http://127.0.0.1:8080/permission/1/10/1', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 31, '搜索分页查询权限', 0);
INSERT INTO `log` VALUES ('57df73e2d07142cc96fb9305a4f45778', 1575190429, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '分页查询权限', 0);
INSERT INTO `log` VALUES ('57e4b083f22c4811988309f081fa7c32', 1575261468, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 28, '分页', 0);
INSERT INTO `log` VALUES ('580baa06a2184ba6b8957c6941f96dbb', 1575206343, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('582bcb3a12cc4240b0929de677b5f8bc', 1575200160, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部数据', 0);
INSERT INTO `log` VALUES ('586d5ce85d7a4c60877fb79b9c1b70f8', 1575282563, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 119, '分页', 0);
INSERT INTO `log` VALUES ('586ea84562a5424aa8212b0526437449', 1573352086, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('5872cbb63dca4d848e39e26d00322c70', 1575189110, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页查询权限', 0);
INSERT INTO `log` VALUES ('5878fb567fc84892bc0f323ccfeba42a', 1575204835, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('588f6df0c9e54daaa4811ac68cb18b02', 1575112600, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 1461, '登录', 0);
INSERT INTO `log` VALUES ('5894824f08c24f8e841fe49525729e2a', 1575197448, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 28, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('5895ec91bbcc48859825e0b4ac44a8ff', 1575261820, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 59, '获取全部数据', 0);
INSERT INTO `log` VALUES ('58a3e176a8c24f53932a8e7b726d026e', 1575093952, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('58b7ecd2e7174f3481537b7e0b62c31f', 1575208902, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 171, '登录', 0);
INSERT INTO `log` VALUES ('58df1b1e9d154a1a8ea320be54b1e9b6', 1578227693, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 512, '登录', 0);
INSERT INTO `log` VALUES ('58e8764728a34e26b013fa4f19edfbd3', 1575123767, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '分页', 0);
INSERT INTO `log` VALUES ('58ee88058eb44eb0a4d337eed0b09666', 1575209542, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 71, '获取全部数据', 0);
INSERT INTO `log` VALUES ('58f196da032f4a4396edf3491e260071', 1573355847, 'http://127.0.0.1:8080/log/all/4/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('58fdab86b7094a21b664e5d8f28c9aea', 1574607965, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 52, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('5901672a462949f68922e33bec831ae8', 1573637348, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 10755, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('59166d984fe24047aec7cb9dd00af614', 1575209371, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 31, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('593025ba92d74e35a29bc22e1891a706', 1578231035, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 89, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('5936c42a0b614c54973ab24fd9dd8540', 1575206343, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('59499f1e7dca4d0489495e2c8a08c208', 1573355686, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('5961d52a13d741a4992433cf2c940cbb', 1575121731, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 10, '退出登录', 0);
INSERT INTO `log` VALUES ('5965c7b091654c78a546c791acec0d8a', 1573356347, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('5985d10a486a4c698e8fd7dd6393371d', 1575194494, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('59a32b7514ed40a285b2ebe6ff5c278b', 1575206285, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('59a3a1140486496b9c2328d21d609a88', 1575204280, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 57, '启用角色', 0);
INSERT INTO `log` VALUES ('59daf85785db44eabc2e2efb7206080a', 1573484420, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 10, '退出登录', 0);
INSERT INTO `log` VALUES ('5a0732d7d64547c1bce89f985e4a608f', 1575187469, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 91, '分页', 0);
INSERT INTO `log` VALUES ('5a1c3ce9192e46f295a82848744b8976', 1575203908, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 30, '分页', 0);
INSERT INTO `log` VALUES ('5a26a5181d4240f0a8d44b4f362d9cf5', 1578229594, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 66, '获取全部数据', 0);
INSERT INTO `log` VALUES ('5a2faa70b2fd464abf0a5a0576000b83', 1575204568, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 55, '启用角色', 0);
INSERT INTO `log` VALUES ('5a53fb5fcac64dadbe8490175fc88d34', 1574649559, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 33, NULL, 0);
INSERT INTO `log` VALUES ('5a90a21c1fd34db78c1bc8bdee5e99e9', 1573640081, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('5aa4f76d2a3e47338235b89e9530fada', 1573355695, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('5aa5832ebe4c447189c3ff13177ab6c8', 1575114191, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('5acc547692734158bdd661c1cb5f14b8', 1578308453, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 10, '退出登录', 0);
INSERT INTO `log` VALUES ('5b1bc5cbae47482881c7e9ac829411c3', 1575206263, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('5b59a5a70fb24aa7b7f5bd041e052d5e', 1578233446, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 14, '退出登录', 0);
INSERT INTO `log` VALUES ('5ba964b6438341c5bfcfdaf40316d182', 1573475462, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 170, '登录', 1);
INSERT INTO `log` VALUES ('5bb800ebc1194dc58caf266da4648c29', 1573354932, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 11, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('5bc2c991bbb24e6cb6d6c60d8f8765b0', 1575196825, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('5c07d2f00120424492b46e8f82c8469c', 1575282253, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 134, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('5c23d274540b4de1a56f15f7a5ff7157', 1575123869, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('5c553c2d506d474c9563259db0741bf0', 1575211889, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('5c6071bc898c4d3ca241dde69f1cda90', 1573637672, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('5c68b5af6e574586adc20a84632877b2', 1575193846, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 94, '登录', 0);
INSERT INTO `log` VALUES ('5c73b9c5900a40249b15f840260e934a', 1573637510, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('5c82a49712fe42d6b4a4458270777ce0', 1575186745, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 41, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('5c8f10d64c0b490da3a3067fb67faa0b', 1574670792, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 2090, '登录', 1);
INSERT INTO `log` VALUES ('5c90b8d1bf8946e4a396397ca2b46ed7', 1575211730, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('5c94d591706542b29f008b02d7e5e064', 1575114183, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 30, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('5c965d253bad421586f000d7ba4dfca0', 1575211636, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('5ce56dbc137a42e393281b6d8fc5b281', 1575210684, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 59, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('5d165eff9374469499e94bfe02901769', 1575201228, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 58, '分页', 0);
INSERT INTO `log` VALUES ('5d29e1ed5d6148d99fff5cd1012094c2', 1575118896, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('5d6e720eb29e47e1999f078402381f92', 1575205895, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部数据', 0);
INSERT INTO `log` VALUES ('5d722f6be1dd492f9e1dec1f78177c7a', 1575184026, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('5d7f0becc37f40b086badc61006313b6', 1575128969, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 2, '退出登录', 0);
INSERT INTO `log` VALUES ('5db25ccfe5234e3eab49f81c4427c0cd', 1575193504, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 7, '退出登录', 0);
INSERT INTO `log` VALUES ('5dbd929255794e3f9bed27c78da158a1', 1575183081, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '获取全部数据', 0);
INSERT INTO `log` VALUES ('5dc5360e44574f908b4c8f61be355181', 1573356711, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 17, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('5dd92263baac4631ac5bb5a92d4aeb2b', 1575114171, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('5dd9cd3fd12a42f7b35aadb933fa4986', 1575204246, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('5e0847c9c65542348096a6b068af9c21', 1575196774, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('5e1ea757be134e859abeb004a8580475', 1575188000, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页查询权限', 0);
INSERT INTO `log` VALUES ('5e881ff375c141c5bec98a484fa28740', 1575127893, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '获取全部数据', 0);
INSERT INTO `log` VALUES ('5ebf8b324b45463696f46b5afbc0b7ab', 1580023063, 'http://127.0.0.1:8080/message/look/asdfsafasaaadfsa', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 49, '标记已读', 0);
INSERT INTO `log` VALUES ('5ec84bc1a9444ae7ad429001f961c5ec', 1575281498, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('5f1835ba017446839358d6a34de006a0', 1575122128, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 10, '退出登录', 0);
INSERT INTO `log` VALUES ('5f21e85a6ea749c1ac4c1c49db5308f5', 1575181755, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('5f22dcfed70745ccb149a41618b0b6a5', 1581922667, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('5f3030c8eaea45c3b3ac460326281165', 1575183363, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('5f384242f03e43b4baf03ccb0772f16f', 1575183373, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部数据', 0);
INSERT INTO `log` VALUES ('5f43b0de1a314fe6b5d07ec3c3a59851', 1575204430, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 84, '启用角色', 0);
INSERT INTO `log` VALUES ('5f88d3b8c1a5441b82d60ecf46165a39', 1575113660, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('5f8c69eafabb44fb85aa9eae3121818a', 1575205209, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('5faa128c13b749c29898e70682687b22', 1578229594, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 296, '获取全部数据', 0);
INSERT INTO `log` VALUES ('5fdbfb73f1b5489c8b62fe53114cba03', 1575281263, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 132, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('5fe8ccf2a9ff407abb07effd7addf605', 1578226505, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 659, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('6000afe1a4a74c5686e2ff6d39839fca', 1575188294, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 29, '分页查询权限', 0);
INSERT INTO `log` VALUES ('60280ded65684bca84f1c14cf9da6b11', 1574607969, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 69, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('6038967d16554073b38e8384a6414ba9', 1575191366, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 81, '获取全部模块', 0);
INSERT INTO `log` VALUES ('6048649b0fb340e0bc0cb79422962eb7', 1573355695, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('6051b753895a443aa12290d1a16c7505', 1575122236, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '分页', 0);
INSERT INTO `log` VALUES ('6061cf07ffc74e028330654e30c556d0', 1575095625, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 0, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('608735ee925f4450a1c2b790758b28f8', 1578297950, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 261, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('609e75823b3d40e3b1131ea9a38bb44e', 1575281232, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('60d9ff513c97499b878c4e6e652adbd6', 1575193032, 'http://127.0.0.1:8080/point/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部数据', 0);
INSERT INTO `log` VALUES ('60dce810535d45f99134d6fe5e569493', 1574648842, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 53, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('60e236882e03411bbd25a163c18893a2', 1573352194, 'http://127.0.0.1:8080/area/all/line', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '查询全部区域和对应的线路', 0);
INSERT INTO `log` VALUES ('611910cc40ed4d0b94f732c8c07befa9', 1575119495, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('6128e07c43ec4f79b827d3a1124a4164', 1575119495, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('614de7e998aa443a858c58c991c49139', 1575182319, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部数据', 0);
INSERT INTO `log` VALUES ('61618e5629d14cb1a3a083e1516d53d4', 1573637725, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('61a6f78b51904ab1a9e880ca422a8c8c', 1575184049, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('61a8bbe42f0e4e6ab92f4e669ae6728a', 1575292726, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('61a92425c6ea4c55b6fa79f8e1a24269', 1575193546, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 84, '登录', 0);
INSERT INTO `log` VALUES ('61ed1a34b81f413481136db266f58f98', 1575189485, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 30, '获取全部模块', 0);
INSERT INTO `log` VALUES ('61fdadd0ecf24f0389ee474508e74d71', 1575203343, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取全部数据', 0);
INSERT INTO `log` VALUES ('6236ea8356fd4ad1ab83a70e9c9e9009', 1580022307, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 44, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('6277a1ba825c46eda1b92bc7c70f033a', 1578231044, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 98, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('62a51983dd7b4db8aa3a56c26c5ffb54', 1575210475, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('62b86b09cfde4e40b3c11f46e9c4f4cd', 1575197448, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 35, '获取全部数据', 0);
INSERT INTO `log` VALUES ('62da9b4fdcab4a33a8b7affb1a6647e2', 1575194258, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 141, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('62e47ab04d684e09a732fd9fa093bafe', 1583390480, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 32, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('631322b80dd6436990c3667fe51a2ef8', 1575190804, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 80, '分页查询权限', 0);
INSERT INTO `log` VALUES ('6321da37946c4d4e9163d626a0028ffa', 1575093875, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('6339cbf9727e4834aea95ef6a921ae36', 1575114187, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('6357201bac2c49fe81deccbc5ffad8fb', 1573640833, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('636557684adf48fc87e308d1b80b4c9b', 1575204684, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('636794fa92b343129cbdd61b8d69c25e', 1575194519, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('6373566fcebe465780c103404f79e400', 1575126362, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 74, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('638f5549df6842f1a249bdc3d3ed38ea', 1580023837, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('639c9c21adff4978a332081df2f6da6c', 1575207216, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '获取全部数据', 0);
INSERT INTO `log` VALUES ('63a902d2a414444ea70706d7a0aaec11', 1575196761, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('63c5309ff9b24950a82de60a90688c12', 1575194265, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 65, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('6401efaf59424171bd9048d88a70d20c', 1575211968, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('6414e59fb0bf4373835a22cf189bcef5', 1573356204, 'http://127.0.0.1:8080/log/all/30/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('64288f94e53e48f1ae4627d7b4641c81', 1573634718, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 95, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('6453d88ab76d4a649ac1ded626294383', 1575119311, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('645ce5c103bc4cda8ea46fbd736e279f', 1575206260, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 139, '获取全部数据', 0);
INSERT INTO `log` VALUES ('646b080247214dc59b399e011dafc577', 1575280160, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 139, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('646d31a913f64cf1a104db47400037a6', 1573353321, 'http://127.0.0.1:8080/point/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 40, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('64999a24c8d8491298ebad5f42125e46', 1575182884, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部数据', 0);
INSERT INTO `log` VALUES ('64a264114ff8415897cd1830434791f0', 1583390455, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 142, '获取全部数据', 0);
INSERT INTO `log` VALUES ('64ae129f337a4522867e4eed9067829a', 1575207216, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('64d7525f6ceb43c7b816ea6ba3eed700', 1573351697, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('650db79341734ed98acc585372575436', 1575261796, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('65915b3a43374f7c9436c7b81b9e38c5', 1575210242, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 25, '分页', 0);
INSERT INTO `log` VALUES ('65a3467f948e4db9b45e89839ca0008f', 1574650821, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 11, NULL, 0);
INSERT INTO `log` VALUES ('65a492c7d0964f15befb68a8cbefa4f5', 1575194444, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('65b14e7eafb649179e5a238fbcdf7930', 1575204357, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '获取全部数据', 0);
INSERT INTO `log` VALUES ('65b5db92a33d400290f67b374d13560a', 1575095033, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('65b7166cbcd2443a9ab37f1b210adbf4', 1575188329, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页查询权限', 0);
INSERT INTO `log` VALUES ('65d2266fce6c44f4b34e37181e756609', 1578231028, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部模块', 0);
INSERT INTO `log` VALUES ('65d7c682e6cd42caba21bbd8579dc5ef', 1573353146, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 6, '退出登录', 0);
INSERT INTO `log` VALUES ('65f125fe1342426d8fe076bb45deba06', 1575093242, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 994, '登录', 1);
INSERT INTO `log` VALUES ('65fed136412c4386a6b9538cd313a668', 1575210684, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('661443394c7e4d958d5cffcfc39c5367', 1573357045, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 4, '登录', 0);
INSERT INTO `log` VALUES ('661fcad2342e427aa9376fed1d41ecb3', 1575204894, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('6635d47d9063431d97a4d55e40426228', 1573480878, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4418, '获取当前登录的admin基本信息', 1);
INSERT INTO `log` VALUES ('66464c61692640eb9c62c03dca63cdda', 1575095637, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('66780b8bf31c4ed7ac66bb4670ca53e4', 1575113771, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('6681f0e8eb5b4bc78e1122bceec71a5a', 1575199769, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 24, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('668979e13df94a1ea7cf22533258fb1f', 1575196490, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 51, '获取全部数据', 0);
INSERT INTO `log` VALUES ('668c647b2dc04cb189d71443f3e8ab61', 1575114196, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('668e88d9965943a9a02a2869273214bf', 1575209529, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 247, '登录', 0);
INSERT INTO `log` VALUES ('66a994b81ffd48788daa89727a78348a', 1573484055, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 69, '登录', 1);
INSERT INTO `log` VALUES ('66b1eedbcc3e48e38c160482acdde3db', 1573356188, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 37, '获取全部数据', 0);
INSERT INTO `log` VALUES ('66d4483030284a77887d694b81c353fe', 1581922654, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('66d977ba688a45008eb28468757e94e9', 1575211686, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('67116b98278448019a80aae80c59bc65', 1575203556, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('6721476edc5b4babaf1c965bd4ba2aa1', 1575204854, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页', 0);
INSERT INTO `log` VALUES ('672a95a5278b416f825402a7a1122724', 1575096091, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 14, '退出登录', 0);
INSERT INTO `log` VALUES ('67449b4199574e22b91fc0048e986e32', 1575293551, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '分页', 0);
INSERT INTO `log` VALUES ('675fce93d64e41f292075307351ab94c', 1573351630, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 27, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('679443d8d0c348dca1756b8c6e62b0e1', 1575184026, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部数据', 0);
INSERT INTO `log` VALUES ('679d6f0963714403a2c88f7752ad8d4b', 1574646309, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 31, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('67ce7fb9353b4598a8ca89ef0fb67e73', 1581922609, 'http://127.0.0.1:8080/area/all/line', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 295, '查询全部区域和对应的线路', 0);
INSERT INTO `log` VALUES ('67d206852e24429e8c0955f4c6a18180', 1575118896, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('67dbc68f190c42d4bb1a14cd40428e27', 1573352091, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('67f46eeab31743c6be59b021fc93b6bc', 1575096119, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 42, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('67f7c7ffcd9042448116d505612b4abf', 1575285772, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 141, '登录', 0);
INSERT INTO `log` VALUES ('67fdd08219ac45b0a126e5431355b4b6', 1573633203, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('6826f68e12994c52b22740f69ca19838', 1573352097, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('68447fb91a614ae99c78971273cd8ef1', 1573352327, 'http://127.0.0.1:8080/patrolItem/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 81, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('687d43b4bfef4362bfdc512502834e76', 1575093930, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('688035f6f3a0466fb14a134da5bf5c68', 1573351633, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('689ff5c7f5bd4dddb7e8628dc3a23c29', 1575196733, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('68ac8956b1af424d972b488038d6973d', 1575201071, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('68bf6ca4c7d34bd19cb191c890dff62b', 1575093869, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('68e282496c14476fad66c7789da2cf5d', 1578298051, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('68ee526daf864d6e8a8ef783a9181e65', 1575196765, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('68f9fffd2162467b84fd386bba06d9a1', 1573637788, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('6907b8d31592483ab60c7d32f9404aa1', 1575205554, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('692d557e9bb04826be48b88918b8d118', 1575294498, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页', 0);
INSERT INTO `log` VALUES ('69666b0ab795458b8dd65060a2734283', 1575192847, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 76, '分页查询权限', 0);
INSERT INTO `log` VALUES ('6999c51b583a4e1f8fb0d2a3af9b54f4', 1575182664, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部数据', 0);
INSERT INTO `log` VALUES ('69a1b93f00614fdab9905606e529ac44', 1574649731, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('69b33fa2cbfc47099eb9aea8594942b2', 1575193051, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 172, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('69bd9ff2e9584537859a3909ad20ecb4', 1575201058, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 48, '分页查询权限', 0);
INSERT INTO `log` VALUES ('69ca6902315d40c9bd529b4b0a2a0ec7', 1575194215, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 62, '获取全部模块', 0);
INSERT INTO `log` VALUES ('69d26b0cce1d488cbc8ea20d2b88bcd2', 1580023065, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('6a4b573af91a43d2bc196b95077e007c', 1573352341, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部数据', 0);
INSERT INTO `log` VALUES ('6a74d0cdac4d4643a7ca3dbc116439a1', 1574649022, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('6b0daeb8b5964e57aba20ddeae32ec42', 1575200159, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '分页', 0);
INSERT INTO `log` VALUES ('6b0dd3de6b38428eb81f36c2a9e7edd0', 1573357034, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 0, '退出登录', 0);
INSERT INTO `log` VALUES ('6b2698415d144f90a3bf6e7efd56b08d', 1575119488, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '获取全部数据', 0);
INSERT INTO `log` VALUES ('6b2d5c36441e42f293ebd8785f24fbde', 1574648627, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 256, '登录', 1);
INSERT INTO `log` VALUES ('6b40d13119ab44789e6d763671fef8dc', 1573637115, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 8, '登录', 1);
INSERT INTO `log` VALUES ('6b4197ab5ed44ba79d23ebc6be266da4', 1575206089, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('6b53fa9882674338971eef61f4100f9f', 1575280893, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 114, '分页', 0);
INSERT INTO `log` VALUES ('6b55dd4607494c07b666aa37308b276c', 1574645456, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 3998, '登录', 0);
INSERT INTO `log` VALUES ('6b58122ab5584148aa95ec777a1fc61f', 1573352119, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('6b5c75999d4441aa8ea70ba68b30eee6', 1575190809, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 95, '分页查询权限', 0);
INSERT INTO `log` VALUES ('6b5d0ceac3b94ba58106b4e9e403feb7', 1575211687, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('6b609c7b50c748b7b95d0236e493957f', 1575095030, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('6b8a0f93a3c04cfe8b26c98f15d4b760', 1573354003, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('6bac85b6ade14029b2c97977a4667bb4', 1575121519, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 95, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('6bbf000fb1e94b4c81a1e52dc383eb25', 1575189151, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页查询权限', 0);
INSERT INTO `log` VALUES ('6bdb2099fbc543d3a02845349fd87c03', 1573352068, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('6c071cafb81c458c9844c6552decc4dd', 1575294417, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 222, '登录', 0);
INSERT INTO `log` VALUES ('6c0a0c9ce3d34630ae3215260f7ac237', 1575210883, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('6c372aa71cf546af9cc614c7fd5e6ee0', 1581922614, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('6c395456647544a299aef2a31abc17c7', 1580023127, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('6c6fc448d8f5416db2b20359a87d686e', 1575183638, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('6cbf568525cc4a63a4f18cfc77884637', 1575188480, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页查询权限', 0);
INSERT INTO `log` VALUES ('6cdda812cffe48be9b2182c81a34295c', 1580022305, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('6ce958cc44864a8b9822ce001d489a9a', 1573357002, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 3, '登录', 0);
INSERT INTO `log` VALUES ('6d2b54738d2b476eb3dd2dcc47e2dcb8', 1573640767, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('6d7889ff8c8447c0aeb87023ce1b755d', 1575280118, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('6d830294c0d64480bf26d3c6bef07f4a', 1575114194, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('6d91bf9d0d3e43e58a6ba9973a9ef2d3', 1573353659, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('6dc53ec7dfb0472e848e4fa1264f4afa', 1573637460, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('6dd0993e5bd84287b6798c6f8be057bb', 1573352327, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('6de418ca3e1445b49a1d636467e6c0f7', 1573637767, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('6e0827e17bf4448c85136186e111d91a', 1575118648, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('6e105568fcc44dbdb08df301f1ccac0a', 1575181437, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 68, '启用角色', 0);
INSERT INTO `log` VALUES ('6e1825bc567e48b3a0ec35312b6980f7', 1575196475, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 100, '登录', 0);
INSERT INTO `log` VALUES ('6e2262f05ef74e5a8c14e49d293444b9', 1573351695, 'http://127.0.0.1:8080/area/all/line', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '查询全部区域和对应的线路', 0);
INSERT INTO `log` VALUES ('6e300a911fe44b1ab210432777d3af3b', 1575094475, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 32, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('6e32534a863d4552965af6f42dd4fbb5', 1575197338, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('6e3c6053eedc44609b054eb2aa4482ae', 1573354003, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 8, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('6ea8ac9c7fe248e18ed3edf6b2388781', 1573355124, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 77, '登录', 0);
INSERT INTO `log` VALUES ('6eb19e4f61504564bfab86839b48e710', 1575093884, 'http://127.0.0.1:8080/patrol/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 71, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('6ebea033628845b1bf05168f32ae15a6', 1578230991, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 330, '分页', 0);
INSERT INTO `log` VALUES ('6ec5715afdcd417cbc079cdd544a18e1', 1573351633, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('6edbc365c8604fc39f5fd55adcca6b93', 1575203931, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('6edda710e9ab4b96b4003d98072c36bf', 1575198051, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部数据', 0);
INSERT INTO `log` VALUES ('6ee4537a7b7b41a3a296e7104142ba68', 1575205005, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('6ef00de79ca74d559ab6b6090895d297', 1575188139, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页查询权限', 0);
INSERT INTO `log` VALUES ('6ef34ca44fd74b6fa6fe086f0688890c', 1575199999, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页', 0);
INSERT INTO `log` VALUES ('6f00ed8eee8c49aab4144d77233a758f', 1575191429, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部模块', 0);
INSERT INTO `log` VALUES ('6f1d9da209d54973a018255f79b1fa29', 1575113830, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('6f3a1b76c29242628a60fad735b815c3', 1575211687, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('6fa41fad5e5247cba57db900c27aee92', 1578231127, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('6fbe2267811f405abb522d30f87f3aee', 1573352117, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('6ffd27f7899241eab511cfe4a685f713', 1575211614, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('700297bfb09746b398fe56fd14a7ea19', 1575206286, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('700e64a99b4a470980911dc90b8b8fb7', 1575190256, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 93, '登录', 0);
INSERT INTO `log` VALUES ('702453814a6c4061b826e38f294d2a86', 1575196783, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('7028e6ee33a849678423188defe39657', 1575127988, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '分页', 0);
INSERT INTO `log` VALUES ('70506a36115e46c4a62138acedf0ddb1', 1575204658, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 71, '启用角色', 0);
INSERT INTO `log` VALUES ('705b75f0dae44bf192532c46d581936c', 1573352341, 'http://127.0.0.1:8080/area/all/line', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '查询全部区域和对应的线路', 0);
INSERT INTO `log` VALUES ('70a125c2f4a64cd7815ac39ad8eb9898', 1575123788, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('70a4e57984fd4876a5ba2680a7217c69', 1575192478, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 24, '获取全部模块', 0);
INSERT INTO `log` VALUES ('70aa8f77ad09493dbc5510644e4a9564', 1573354878, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('70c07803bbda4c8281642b821be04295', 1578226498, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 297, '登录', 0);
INSERT INTO `log` VALUES ('70c24e642a5643de8fb3afcd98052945', 1575124296, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页', 0);
INSERT INTO `log` VALUES ('70d8540119e241e5afa6677e85afe0f2', 1575196854, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7112c9ac082f48f3af732e762bdcceb6', 1575123470, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 38, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7121236ba7464609bc66b39e3b97b48b', 1573637793, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('7123e39f950144a1b1775ac96659897b', 1575203821, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('7145a8cfdf5d41fb8f7c5bdb1735c4f2', 1573355792, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7145e8370ad64f7f94bedffb7a256acf', 1573358306, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 979, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('714f21be3a9f4db8a2a954370b4e84ff', 1575192613, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页查询权限', 0);
INSERT INTO `log` VALUES ('715db6bfeaae40c998f182185de70bd3', 1575118240, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('719bc6b3fb2a4532a75de03892d92eff', 1574650528, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('71a1ee747caa4b6fa900ce38f9271441', 1575095037, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('71ecadce73da4b5485c858b1970e8b5c', 1575211687, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('71f02ea9003a42728eda9ad71d8e64eb', 1581922634, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部模块', 0);
INSERT INTO `log` VALUES ('71f95a233bd04a09b93a2130ffdf80ae', 1573354023, 'http://127.0.0.1:8080/staff/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1f', 47, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('71fb223d67004af49258d79dfd632dbe', 1573356187, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 53, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('720a24afbfe54042832c670a1eee66ff', 1575196770, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('721523aceb3940a784dfc2bc529a1c24', 1575206286, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7238b6d644d64b698c47eeb4d301a006', 1575261561, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 300, '获取全部数据', 0);
INSERT INTO `log` VALUES ('723d6559dd3c4c91a193b012c7f1ebc0', 1575196498, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('726f2fd03d1545d1b2aea72735282cfb', 1578298051, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 58, '获取全部数据', 0);
INSERT INTO `log` VALUES ('72713df9e5ca470dafd7478d0bef2573', 1575211723, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('7278df5d05914df1a57369fa4f3d095e', 1580023461, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '获取全部数据', 0);
INSERT INTO `log` VALUES ('727cbf9c3bc44956aa3925d47c5950f4', 1575123689, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页', 0);
INSERT INTO `log` VALUES ('727cf274a92a49e9afe3f039b2df671f', 1575204358, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 30, '获取全部数据', 0);
INSERT INTO `log` VALUES ('72887faefe784a4eac63bc4a23d6ebbc', 1575204894, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '获取全部数据', 0);
INSERT INTO `log` VALUES ('728b650314a64744b6013d48b3bb30a6', 1573352061, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('729b0f2b629447c48ee76e6e0021a6a3', 1580023521, 'http://127.0.0.1:8080/point/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部数据', 0);
INSERT INTO `log` VALUES ('72b7e2d521b94ac2be402c32473370c6', 1575128308, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 154, '获取全部数据', 0);
INSERT INTO `log` VALUES ('72ce3564914c474dbd87d18600fdf390', 1575204926, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('7335f41dfac1447fbc8c1417a0ba74ef', 1575113830, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 37, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('735b7b28b01a418a8c2190c25a6a7d0a', 1575119280, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('737489d1fe93496888ab2d719ad8e736', 1583390175, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 99, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('738d2d9095304f22a3918a0afc0174ed', 1573353225, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('739a30a5ea914d9faf812a33cc2c5f68', 1581922738, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('73c521bb2a194fdc952595c29aeec80f', 1573352189, 'http://127.0.0.1:8080/point/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部数据', 0);
INSERT INTO `log` VALUES ('73f4350ee32d48248337efe63cf387c4', 1575123789, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('73fbf236134f401c9575f95cf3e04512', 1575187946, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 406, '分页查询权限', 1);
INSERT INTO `log` VALUES ('7432eb924340405c901f8e53dd1bc3bd', 1575211452, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7476eb2b68184e59a3828ec10b9fcccb', 1574649826, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 96, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('74896daae8da44bb92fd3f3f39ab861c', 1578307952, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 11, '退出登录', 0);
INSERT INTO `log` VALUES ('749d3cc254954ae78a46af1cc0486027', 1575196498, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 44, '分页', 0);
INSERT INTO `log` VALUES ('74a7edd08c4d45938221980c696d8417', 1575129223, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 38, '启用角色', 0);
INSERT INTO `log` VALUES ('74aee15943bb4eca8bb431e2226d04f6', 1575261796, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 44, '获取全部数据', 0);
INSERT INTO `log` VALUES ('74cb53b3c0cb444fae7fc4c286a69d32', 1573637528, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('74dc8e9e9b074c6f936dc2b99fe06145', 1575199782, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 66, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('74ddeb5f63c144658cf4301795422848', 1578231127, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('74f3f5369dc543aa9432c86aa1ab0e67', 1575197122, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部数据', 0);
INSERT INTO `log` VALUES ('750bb28aa1564aefb34e372ab0fa1530', 1573352057, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('7514f6ef8b9a47e08c657107a40d0d7b', 1575114194, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 161, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('75bb5d1efdf14e85a94c4043f8ab535e', 1575123321, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 82, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('75ed3c0a60ec4fa1869ae0f4bddc412b', 1575118640, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('76161cc93d664699a96b308f7506f1ed', 1575096110, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 179, '登录', 0);
INSERT INTO `log` VALUES ('76389d56584f422190fcac43b4c7a670', 1573353930, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 11, '获取全部数据', 0);
INSERT INTO `log` VALUES ('76565a907f67439d887f0ff7f961e667', 1578305362, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 31, '退出登录', 0);
INSERT INTO `log` VALUES ('76abd98244fa434d8a8f93fa497bf214', 1575119272, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('76d57fe3c39a4cd7ae9fbded704d382b', 1573351671, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 3, '登录', 0);
INSERT INTO `log` VALUES ('76e24842846640d2b62e972e370ddb3a', 1573634739, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('76e413e201b846959bba28ec9d8376de', 1575210218, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('76e9bd39b85a4e878570e5ff5b89eb66', 1575126501, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 212, '登录', 0);
INSERT INTO `log` VALUES ('76f87154c1e74994b3bba6c497a8bda7', 1583390164, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7717beaa7dc74e14a2e370d32b6a5681', 1574607940, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 471, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('77475d2a21db44d18c095d6fc25d3418', 1575208429, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 127, '分页', 0);
INSERT INTO `log` VALUES ('7747a977fb01477e816bf2e985b12fc1', 1575211687, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('7790e3be1db34f9582835f85a4243ede', 1575206089, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 77, '分页', 0);
INSERT INTO `log` VALUES ('77a6487b243548d79d34a7f676a41baf', 1575123689, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部数据', 0);
INSERT INTO `log` VALUES ('77a6b1be006d4a33932610af0904b6b4', 1575121752, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 115, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('77ba6707c16e468e9c55c5d8536f82d8', 1573355792, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 24, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('77ef7357930c4e369d389a29685fccba', 1575203146, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 113, '分页', 0);
INSERT INTO `log` VALUES ('7838486182f2463780dda23c9ef15f83', 1573353304, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('784f12d6f52b40f0aad2dee528a7d97a', 1575261820, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('78563bfe01c74befbedd969dfc83df10', 1575211687, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('785af6ede3c3452da580e9a47fe99e0b', 1575202911, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 26, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('786773e6b6324dc48d7230b029f0eda1', 1573352334, 'http://127.0.0.1:8080/patrolItem/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 72, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('786fa1cfee3840a4811619d7fda6e137', 1575184050, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7877740a82a74624826e0c7793654a4e', 1575126411, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('789048e3c14d4f479ee537da903817fb', 1573352094, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('78d69fd8db6c489392ddc640efcce1eb', 1573637715, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('78e275e1d8934402822e629c0f7a4623', 1575280294, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 96, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('791aeec6ee8541be872be9479f73b2e9', 1574649740, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 103, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('791c1db7c47b430799cd9e9d49a7b107', 1574648882, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('792d1f6dcb52461ab0f7b857ed79cca9', 1578231080, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 93, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('792e56f769f54a98993e07b1a0f8e15e', 1575119498, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('79762ee608fb41b58c3891c6337be971', 1573632884, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 185, '登录', 0);
INSERT INTO `log` VALUES ('797b3c98e7444e63b103c023b8f73af5', 1575199691, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('798f60e6f2714ce0a848e71cfd9a01fa', 1575119418, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('7991cbcd4173462497b020749b1f38cc', 1574650476, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('799b3470ec384a769fe6c1c9984dd4a1', 1578298050, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 195, '获取全部数据', 0);
INSERT INTO `log` VALUES ('79a3fb8903844a43890a46cb4c9f63a3', 1573456484, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 3061, '登录', 0);
INSERT INTO `log` VALUES ('79af29a73f0845178266fdd8d0cd77e3', 1575118648, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('79ec6116b8a54a84a6a9b11775d8db73', 1573352091, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('79f891c856744ac4b1d65b042e512256', 1575123321, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 97, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7a01b28b179142afbb81fbcbf7a5d855', 1575187498, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 32, '分页查询权限', 0);
INSERT INTO `log` VALUES ('7a1e34a6499d40febc22c2013d4b67f4', 1575094447, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 12, '退出登录', 0);
INSERT INTO `log` VALUES ('7a7015a864ef44dab65bd613fc5bb001', 1573355456, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('7a750aba67f94b1db0d42e1d99720696', 1575204357, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 32, '分页', 0);
INSERT INTO `log` VALUES ('7a7b2691fe664143b14368210b047653', 1583390485, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 95, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('7a95da610d1c47e8a1cd05b47648c946', 1573354330, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 20, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('7a9ad6679b9e4bc1a03900da27dac352', 1578298005, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 29, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('7ac649e8a02c452a9265d0179d43bab4', 1575204898, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7acc31b6bbb948bea0518e1b9998108f', 1575128978, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 84, '登录', 0);
INSERT INTO `log` VALUES ('7ae2a5a24e5f461f9c6bdb4a9b39fe2f', 1573356997, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 2, '退出登录', 0);
INSERT INTO `log` VALUES ('7af4ca6e4f2d4a40b6ceffbafd635327', 1575199954, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7af9ad5136da4fc784483069b613dee5', 1573355725, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 97, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('7b02c068dc2646a1b166cac9b5b19dea', 1575123433, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 8, '退出登录', 0);
INSERT INTO `log` VALUES ('7b40ae3dd57a4270b5568adb128a1d66', 1578230992, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页', 0);
INSERT INTO `log` VALUES ('7b4720fc5f1c4742abec85493b14f5ff', 1573354878, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 10, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7b5c42409c934839979b4d6b1fa18da6', 1575093880, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('7b892214cd5841089ef95b135b75c061', 1575201248, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('7b8f10b66784486bb89d98bb5fc50dfd', 1573637572, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('7ba4ae8e4bf24a6f9d51cd1b64308d88', 1575281208, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('7babe2f856e64deab46affff491686f7', 1575281552, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('7bb79f79f33d48ce8badf6e2f23de891', 1580022305, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 39, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7bbac93fef024e028125d7edf2e1d585', 1575183081, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('7bcd834cb3ab4c7ca003ad865b81b6b4', 1573635457, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 10, '登录', 1);
INSERT INTO `log` VALUES ('7bd8bc0a06f347b5b6734c05b74128f6', 1583390164, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 209, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('7bf568fbbc2a403694a4e79c79ae2400', 1578230043, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 988, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('7c2957bd8a63418d9b215aec69e1bb12', 1575119227, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('7c36d5658a0e4d10a95bd894d2fa5e86', 1575209949, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 33, '获取全部模块', 0);
INSERT INTO `log` VALUES ('7c3ba83f7d004306a80731b18120a2a0', 1573484068, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13242, '获取当前登录的admin基本信息', 1);
INSERT INTO `log` VALUES ('7c6013321e6b4a1ca58e5a7213722bbb', 1573356188, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('7c6a143a322a43719d24c347a1ee4750', 1573352117, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('7c8eba415b6e442aa45f64a3db62377c', 1575196854, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7c91a96db5b84a4482b10d55e7eac6e7', 1575193295, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取全部模块', 0);
INSERT INTO `log` VALUES ('7ce240226a214cdd9114cf3bf64628e6', 1575210862, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 26, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7ceb97bdee274308bfe4f78df9f571e2', 1575094544, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('7cfa6e8ccf6644f5876d51c3f7aba260', 1573638182, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('7d0897f113f34d2d873d75164427adfd', 1575199782, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 65, '分页', 0);
INSERT INTO `log` VALUES ('7d149b5659dd49a8b7d8e63c51e4d2a8', 1578230992, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('7d248d352318447d8586412f806f7739', 1575182345, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 0, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('7d486af209214e9da6508e745f32ab17', 1573354936, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7d68deebd8214bcda2652ba239ca448f', 1573352335, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('7d85765168e34419a9c06ffb1eb56151', 1573352115, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('7d878c5e6172475a9d626777411ad47f', 1575205219, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页', 0);
INSERT INTO `log` VALUES ('7d93d7db37ad4afa8e53d77d45d19864', 1575114070, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('7db623b3e8c34be39e992602540e9cbf', 1575122651, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 66, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7dc13430a7864ad48454af57d4914c58', 1574646099, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 343, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('7e29073ebdbe42d9bd71ebd3f94790e9', 1575128194, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('7e38373020894138a30ba3fa9448c112', 1573352336, 'http://127.0.0.1:8080/patrolItem/all/14/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('7e5df1cca83b441d96dcf94afbce0b7f', 1578298065, 'http://127.0.0.1:8080/message/look/asdfsafasaaadfsa', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 81, '标记已读', 0);
INSERT INTO `log` VALUES ('7e6a3d11c1d24f2595583723e2c58064', 1573356855, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 3, '登录', 0);
INSERT INTO `log` VALUES ('7e7994162efa43eeb43960876db57090', 1575205316, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 106, '启用角色', 0);
INSERT INTO `log` VALUES ('7e83ca5746684596a7c50d2b00ea58a6', 1573352086, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7eb7a3703a634597a41e8218e462f519', 1575206263, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7eb8336d589a48d79e1f21954516b905', 1574607957, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 221, '获取全部数据', 0);
INSERT INTO `log` VALUES ('7ed3e81624d54ce9890bd417541f8658', 1573353318, 'http://127.0.0.1:8080/line/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 62, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('7ed643151dcd49048930c3af608351e4', 1573354928, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('7ee24a23ba654d089b0702ce2d963359', 1573476612, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 413, '登录', 1);
INSERT INTO `log` VALUES ('7f0828a30c9e415794a33821d74a8c40', 1575203556, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('800191a18a0f4f529e6f6ef9ee4638f6', 1583390464, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 435, '分页', 0);
INSERT INTO `log` VALUES ('80187b90cc9c4c4a83d59934440aa9dc', 1575205005, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('80416928d5f8429e908892b096f4cd59', 1575119190, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('8063690adb3943edb9f7a889bf51c870', 1575197448, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('806ad7e2a4ed49fc93c66a23a684baff', 1575203821, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('807eccd26d2d4eccb577f761b25d1761', 1575206622, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 172, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('80cccbc98a57454bbc0aa10a2838ad38', 1573355845, 'http://127.0.0.1:8080/log/all/3/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('80dd73537bd44bb6a09a4658144d86b0', 1573355844, 'http://127.0.0.1:8080/log/all/2/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('80e7f303270b4f0eb13825e5bf5f346a', 1580023705, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 36, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('80ee01cd5ca348829963322c5c7dcc2a', 1574650227, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 0, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('81054955aa5e4dbea24bfbe87db207ac', 1575188148, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页查询权限', 0);
INSERT INTO `log` VALUES ('811782dd1ac74203a14d44b5b641f48e', 1575261313, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页', 0);
INSERT INTO `log` VALUES ('814070175efa497f9aef25d0a86faa13', 1575128185, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 72, '获取全部数据', 0);
INSERT INTO `log` VALUES ('814271236e3943c5b6d2fcdeba8dd973', 1573355695, 'http://127.0.0.1:8080/area/all/line', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 57, '查询全部区域和对应的线路', 0);
INSERT INTO `log` VALUES ('815b59ad1a67420cb33566eed9c1a01f', 1575127893, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '分页', 0);
INSERT INTO `log` VALUES ('8162ba68b2c24c468b0e3fcd3d1f04fb', 1575189099, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 44, '获取全部数据', 0);
INSERT INTO `log` VALUES ('816598878cda4b32aaa603c5df17d9e3', 1580023852, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('81747e6051de44c6ac0e278fe6952bd1', 1573355167, 'http://127.0.0.1:8080/staff/search/%E5%AD%A6/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页获取全部数据', 1);
INSERT INTO `log` VALUES ('8176992511ef471ea07b4dc1fa1891b7', 1575196520, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('817c12e0d3c94592aab6419a1da2cfc9', 1575261308, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 101, '获取全部模块', 0);
INSERT INTO `log` VALUES ('817f24cdf96240eaa9c1d4c89f6921d1', 1581922616, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('81971386c7a44f28bdbf8ef8e2e72e72', 1575182985, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '分页', 0);
INSERT INTO `log` VALUES ('825d9609554541dabb5275300280c915', 1575208168, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('82d7b90a14854ceea11e8ee70b1b8b9e', 1573355473, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('82eaa6c8f5e646baaf58d81634fd9fb7', 1575188405, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页查询权限', 0);
INSERT INTO `log` VALUES ('82eb20c78cac455184b3ad04525a3fba', 1574646089, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('82ed1b6f8fd445ff80a9c24c222a60cf', 1575186560, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 5, '退出登录', 0);
INSERT INTO `log` VALUES ('82f427e023194111b5d4acb79f206d84', 1575206969, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 2054, '启用角色', 0);
INSERT INTO `log` VALUES ('830268fecc6849cd9f1603b6fa1e2c4e', 1575196705, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('833467b3b2d24cc2b2603020b5cf57dd', 1573354330, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 22, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('833820670b6d443dbbd3129257d7e2e0', 1575124272, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8354c2f50e214d0e82e5f2a4eed3b279', 1581922617, 'http://127.0.0.1:8080/point/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部数据', 0);
INSERT INTO `log` VALUES ('837a7c01598c4622830caeb8d714665f', 1573351695, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('8390476b5a164b2eb4811cd138a23410', 1575206263, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('83ac20e2d6a84aa8a362d15a90f3d19f', 1575114198, 'http://127.0.0.1:8080/point/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 42, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('83f3fb83a8004839ae415686348ba88d', 1575196490, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页', 0);
INSERT INTO `log` VALUES ('845655f50ad144be9a7de2c64ec6211f', 1575183828, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('84607343a01e40bebe7c40ddd0aa7648', 1575118287, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('8479640a0dcf44ea8f5c2c0848cb8614', 1578298050, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('84ad13c52f24436b91516a1c62e2c054', 1573355286, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 39, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('84c0077d9da141eb815fe6c6c3883044', 1574648662, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('84c72567c7c34fc3ba36cee2cc16ba0b', 1575292102, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 187, '登录', 0);
INSERT INTO `log` VALUES ('84d82a65656f400d8dabcbf4ec7e0c70', 1575279936, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 3597, '登录', 0);
INSERT INTO `log` VALUES ('85066d317b074da88af569e4c976a55f', 1575124296, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部数据', 0);
INSERT INTO `log` VALUES ('8517e20c8dd8402f806741b8c277569d', 1575192381, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 204, '登录', 0);
INSERT INTO `log` VALUES ('85205d1045c24baeb6b96d2c21707912', 1573637722, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('85259e0c1b174928b7bd5b3e5f74aea2', 1575196854, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('852af8a78b5d4281af0bfdab296c9f82', 1575282230, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 156, '登录', 0);
INSERT INTO `log` VALUES ('8533c57d9e904be0ba46d052610dc53d', 1575183583, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '分页', 0);
INSERT INTO `log` VALUES ('8541f52e1ff64963a689305bc9f5aee0', 1575196770, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('8544c835fa4b4eceae9498c47771bd03', 1573352320, 'http://127.0.0.1:8080/patrolItem/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 101, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('85454b399f224d7fa5b1c5446add987f', 1574607940, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 250, '获取全部数据', 0);
INSERT INTO `log` VALUES ('85916cb8faef430aa06ae33d07910213', 1575201071, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('85b887977b3341b68fc6262c57606270', 1573353283, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('85bc06c539084885b0e122acee420372', 1575292222, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 36, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('85d4a9b3cd244a00b225336a5b4fc0c3', 1574651050, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('85e7d2a90d9c498aa42b790d405694c2', 1573353283, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('8648f03eeee647edbbfc0e95423b953a', 1575194535, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('8664b6f14ceb4f20a6cdaa96f4ce181f', 1575196261, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('867bb27e222e43e79fbb4ea6ac043727', 1574650305, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('8698311547b74e21a5232393a293ffae', 1581922627, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 62, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('869e3084f1714948af9cc0aefb5cfee0', 1573640018, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('86ba79b9aab1400495e96b50669a4584', 1575095293, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('86e1f24e4d2f43a49023a19d33a53a89', 1575190271, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 24, '分页', 0);
INSERT INTO `log` VALUES ('86eef263e304451694633400693620cd', 1575204854, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 88, '启用角色', 0);
INSERT INTO `log` VALUES ('86ff9bc5e251458286a1d21a939ab0f8', 1575094907, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 10, '退出登录', 0);
INSERT INTO `log` VALUES ('8712bb0863774d00a7936933a0aec113', 1574650547, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 124, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('8759058407ea42e8a8cd7eeb48458446', 1575094928, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 227, '登录', 0);
INSERT INTO `log` VALUES ('87649bdbfd374640abb1b87d9144ca68', 1575194442, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('8778c4c07a7240f981ce96336c4ff868', 1575183082, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('879ec8dbb762452dbe6acbab19c75228', 1573633487, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 32, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('87b266fe94c5416faada18b5c0d70bf0', 1573484428, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 203, '登录', 0);
INSERT INTO `log` VALUES ('87d9d8bcf2b74131b054e81ac7f0a2e4', 1574649022, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 61, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('881ccca486134fe0adf99afd460c8146', 1575209949, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 166, '分页查询权限', 0);
INSERT INTO `log` VALUES ('882b08e7f1a04f909bf27355dd0583c4', 1575294766, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 11, '退出登录', 0);
INSERT INTO `log` VALUES ('882b89fdd5c84ee9b95daf1ae413df2e', 1575293398, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('88405746910d4616b3d160073474931e', 1575208915, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 58, '获取全部数据', 0);
INSERT INTO `log` VALUES ('88a49cd6a5ea4aecb36e4e58009ad9f5', 1575189099, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 29, '分页查询权限', 0);
INSERT INTO `log` VALUES ('88a7d8f27ca14db8830314fb09ff675a', 1575261848, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('88ab78ae4d6546f188e7f63504c9de3c', 1575204645, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('88c3aa11d3f649ffbde0d50361fb1f2f', 1580022305, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 231, '获取全部数据', 0);
INSERT INTO `log` VALUES ('88ca61c69f53429690b8849eb23a2738', 1575199476, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('890ce1bfdc0b49ddaf203319da7aab80', 1575211644, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('893e786c663543778beb52c56b564cc9', 1575194404, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页', 0);
INSERT INTO `log` VALUES ('8959d464accc48878f04a33757b64a55', 1575183583, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('895a436eaeba417eaa683f2ca61511e2', 1575201228, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部数据', 0);
INSERT INTO `log` VALUES ('897e35109fb24719bf0ad35c5fa95957', 1575093956, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 54, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('89cdf6c4da9d4c62b9663c00dab30edf', 1575204262, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('89d7f1fb392246cdbb0859cef1e8c471', 1573355731, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 18, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('89dc602249404348afca6d1ea50f1203', 1574608057, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 51, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('89f08b92be1a46539dcf8cc0fdba4113', 1583390477, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 94, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('8a0671b9355147fdaccac420f2e97628', 1575293199, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 166, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('8a06c711c2c2435bbf637376074ccc87', 1575197338, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8a1d8bdfa5fa48bcb7c0300e2a938e6f', 1580023087, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('8a3281946a774004853d56c96dc5404a', 1575199473, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '获取全部数据', 0);
INSERT INTO `log` VALUES ('8a5b7d4e724d4c71885f650142ac452f', 1575119498, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('8a5ffc0946cc43dfa35ddc62c0143080', 1575212163, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('8a6b05ec619543d8a7691e71e8c325fd', 1575196733, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('8a7aa8249e9942c6b654da37df1bc553', 1573355426, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 36, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('8adedfcce02c4544b9966d4124913520', 1575292491, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '分页', 0);
INSERT INTO `log` VALUES ('8adffe49c6c547a6a1f723101c9796df', 1574646407, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('8af5da81dd674b2a80e0379c1351b4a1', 1580023521, 'http://127.0.0.1:8080/equ/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 29, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('8b1240ed82714db08bf745419b1046f8', 1573355742, 'http://127.0.0.1:8080/log/all/4/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 41, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('8b1d588f54ed465dadb2f67480e5d3bb', 1575196520, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('8b21da47a0f64c358107d4f5f539e76e', 1575192613, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页', 0);
INSERT INTO `log` VALUES ('8b36c58850de48c9b1c45e7b7cf38c5f', 1575205188, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8b4e60a689614f1da20180b08c7cfaa6', 1583390148, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 110, '登录', 0);
INSERT INTO `log` VALUES ('8b7ba0d82c0947779afbfe425e4804bb', 1583390155, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 700, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('8b9856e48bd24746a9942e6020b134cf', 1575182985, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8ba95accc8d841cabb03227187f919e5', 1575122230, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 33, '分页', 0);
INSERT INTO `log` VALUES ('8bbafc7eaccf46468dace5bc4062a824', 1575095546, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('8bd97b4bcd3746778027d3a826f52ac9', 1573636734, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 75, '登录', 1);
INSERT INTO `log` VALUES ('8bdea25693e8480ba9e27425c97a6c1f', 1580023461, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8be8bf4ceae94083b5c4e5564d4731be', 1575282491, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '分页', 0);
INSERT INTO `log` VALUES ('8beadc7033304b849d29966bff1b1891', 1573355831, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8c0c4aa1adcd4d6db2738d8a88503a8e', 1575126406, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8c236f725c914a2bb8e3061edaf510c2', 1574651069, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('8c3d42b0afd74345b99b87d48b557a07', 1573352081, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('8c625901db1e4f55964b58df1ccbbe21', 1575212056, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页查询权限', 0);
INSERT INTO `log` VALUES ('8c6cadb674e54f82887979baf92821bf', 1575205949, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 25, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('8c7a08ff194e4db0987a6cf7d052580f', 1573638170, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('8ca8739edb6d4e42a3b04f34d1484917', 1573355686, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8cb88e3434f64b548f13ff19fb3c2875', 1575206238, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 50, '分页', 0);
INSERT INTO `log` VALUES ('8cc3a1cb6e88457aac93afa3251bed5b', 1575121559, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8cdbe239314445cba3038d90a3ae9848', 1575197152, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8cdd3abfcd2c4d2db9f14fac60aa8dcc', 1575282362, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 255, '登录', 0);
INSERT INTO `log` VALUES ('8cf3844a5a8548e1b48c0569a0cc4a52', 1575199999, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8d542a149cea40589ca867496548b089', 1574649826, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 33, NULL, 0);
INSERT INTO `log` VALUES ('8d642b31bfa24bdaa3f72014a59d7788', 1575208891, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 13, '退出登录', 0);
INSERT INTO `log` VALUES ('8d6a19fe7a9d43c8b6dcec1d5e7d17ef', 1573352086, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8d6d47d24d94487ebe43ed3c8262c41b', 1575182345, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 89, '分页', 0);
INSERT INTO `log` VALUES ('8db1972cdab547f18e3251b0eb6b3ff0', 1578307975, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 437, '分页', 0);
INSERT INTO `log` VALUES ('8dc6d31e941744a2835a30471860e3d9', 1573355275, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 13, '退出登录', 0);
INSERT INTO `log` VALUES ('8dc875d7b4104d6284bad62f8afea6f9', 1575114191, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 81, '获取全部数据', 0);
INSERT INTO `log` VALUES ('8dc9a665b2ad4b4cb315ae75b33733d0', 1573635746, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('8dd8c13cec404950b38a03ecef8ab631', 1575126341, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 12, '退出登录', 0);
INSERT INTO `log` VALUES ('8ddeebd636e0456bb246e796f0d87531', 1573356210, 'http://127.0.0.1:8080/log/all/27/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('8dff2fbdce7a4074a4b5dcd00c2654dc', 1575211936, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('8e059a74a0aa4aac8dcbbcbcbf688707', 1575199944, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8e0c52dd0c6547e8a9442f4fa0535fe6', 1575202911, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 32, '分页', 0);
INSERT INTO `log` VALUES ('8e700457596840febd2ce3caac655fe6', 1573351633, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('8e734f2969ca4b639c51e690cd926e5c', 1580023483, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8e77e4955e9b4708bfd0cfa03e1e4bee', 1573355684, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8ea1282622444d1f8fb1b430697f4cb6', 1573634094, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 11, '登录', 1);
INSERT INTO `log` VALUES ('8eb69d1689714208a794219be35edad4', 1581922630, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 55, '分页', 0);
INSERT INTO `log` VALUES ('8eb6f08668964df8bcea4255242f8ef9', 1573356939, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 10, '退出登录', 0);
INSERT INTO `log` VALUES ('8ecdc7073fef46eb8eed0267acf97826', 1573356194, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('8ed799acf8d240ffba420341a7175031', 1575209542, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 31, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('8f1258f7127e4ad199fc2a243734ba92', 1575210202, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 49, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8f1cfa7ed3d644fcbfe3b4760c118fed', 1575118960, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('8f419090c38b4848a1163d8899d5fbf9', 1575182506, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 73, '分页', 0);
INSERT INTO `log` VALUES ('8f5b2fe8b82a4ebea1c6d7426c4dee6d', 1573351668, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 0, '退出登录', 0);
INSERT INTO `log` VALUES ('8f5b848ab79147eb9836039af20b4c1f', 1573637134, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 24, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('8fae6c4c9c8d4b6680b0545528cdc9b7', 1575281584, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页', 0);
INSERT INTO `log` VALUES ('8fd6acb832d84b6db8ab85b4a69e0016', 1575183333, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 25, '分页', 0);
INSERT INTO `log` VALUES ('8feca971daac4d1596db6d18d61ec0ca', 1575118262, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('8ff8ad0e22c34df2a2baa987aa8b8a83', 1580023127, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 26, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9022e4b15c694c9093ebb5fdf8d768f3', 1575194410, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页', 0);
INSERT INTO `log` VALUES ('9024b5c13b274b7586324c17c94dd9e7', 1574648794, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 96, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('902c260e216048f08a3fa4539e79a138', 1583390434, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 350, '登录', 0);
INSERT INTO `log` VALUES ('906f56de56d84d5db6a5b2892c743ad7', 1575280043, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 81, '分页', 0);
INSERT INTO `log` VALUES ('9070803a525d48c8ab3f6e53da07c7aa', 1573351543, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9086498efad04a098b661d7ee78986ad', 1581922725, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('90936ae0d5e6436096009b33ad6db88d', 1575187716, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '分页查询权限', 0);
INSERT INTO `log` VALUES ('90b009b799554dd2aa046c00e3df90d9', 1575113526, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 55, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('90b5399107b449be8e43c77659e5c643', 1575191376, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部模块', 0);
INSERT INTO `log` VALUES ('90b659dc2fda45d5a5e7f7cc97125d86', 1575193051, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('90bb65eb656e4207824d7ce2d7fc9c88', 1575113887, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('90cf40e8f9d7401fa73171ad8650c17c', 1575211746, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('90d430c785554ffbbdeadc119541a835', 1573356849, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 2, '登录', 0);
INSERT INTO `log` VALUES ('90d844cc742b485f9be0b68889ddbcc8', 1575203859, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 29, '分页', 0);
INSERT INTO `log` VALUES ('90e7b512266d41628fdfcdac6f1ca3c8', 1575118235, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('90e8cac3c6ec4dd8979725b2ade7b590', 1573637502, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('90f4537f12b74444a342bfe879154246', 1575113517, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('90f9931826ba46d694ffa13fedf2cb2f', 1575204649, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9116adf154bf4df68dd3a1698caa3b7f', 1573352320, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9118bbb906214e75b1aaea4ece2a0371', 1575199948, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('911e9b823fc3481987e1105ab6dda4e2', 1575199769, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('911fb2c419a94b92b40713e609ac915c', 1573637492, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('91568a441dcd4aaca044470c1929dd21', 1575119307, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('915f13e215c74deca8e5229d2e459b45', 1575183638, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('91998df474a645ddac9139908dae753f', 1575093951, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('91d5c76259644d3f874dfceee3f56af6', 1575194273, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('91e4f9cf185149fda7280389a30c8751', 1574645774, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 33, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('91f4de9a8458413b81ba283e8c429acc', 1575201228, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('920922e0885247ebaf7fb49cf995d046', 1575121496, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 10, '退出登录', 0);
INSERT INTO `log` VALUES ('92167908460e4018aa6bb2379e8ba688', 1574650832, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('922774812f5e4e40992164e2ac2ae794', 1580022355, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页查询权限', 0);
INSERT INTO `log` VALUES ('92381ea4b5c545f6b98bb607cbb2fabc', 1575206962, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 28, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('923cf686d70a4713b451f3c1f774cf7c', 1575189400, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 50, '获取全部模块', 0);
INSERT INTO `log` VALUES ('924ac64041d24a2c877ccb20a4759f0a', 1575209542, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 36, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('92517738be6448fa94d55b56c21f5b46', 1573636979, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('9268d0a290bc490b8282d7299c867f3b', 1575211452, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '分页', 0);
INSERT INTO `log` VALUES ('926dbb614d7743a3be0af7c7ee3f3420', 1575204246, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 62, '获取全部数据', 0);
INSERT INTO `log` VALUES ('92996dd692724421ab4ef59cca6038d2', 1574650469, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('92abd57410634fbfb370c64b23852664', 1573355473, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('92b8ca8ed5fa41808bc72fafbe7770b6', 1575211167, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('92c5fb832ee34a7baa72f2e3eaa9403b', 1575194435, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('92d2d58ba190449d8883d20cb1cc9bc9', 1575093935, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 109, '获取全部数据', 0);
INSERT INTO `log` VALUES ('92f95374037543c7931f3cc42650daf0', 1575197122, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('934134e41a3d4a6092c24adc7928a182', 1578231113, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('93496426c18840eaadcfe986eb77d424', 1573352337, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('934e404fbe0a4844a501158e86df73ee', 1575114187, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9356d2ec07084518ae0dbfaa00c2d458', 1573352085, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('937561eacc494b00a0b7558f88ae43bc', 1575293208, 'http://127.0.0.1:8080/admin/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 374, '更新一个admin', 1);
INSERT INTO `log` VALUES ('9399acce6c024651a7b08f4ba99f844d', 1575189098, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 29, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('93d3529a9677404d89738596f7834cd9', 1575201248, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 25, '分页', 0);
INSERT INTO `log` VALUES ('93ef5248147b48aeb7aab161f17a18b0', 1575121562, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('93f3d42bbc2b4ef5ac003f772c6244d8', 1574646102, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('93fc7ca7f3964a6ba7d016c2a01fd71b', 1575209515, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 11, '退出登录', 0);
INSERT INTO `log` VALUES ('94137b5d8e7648828dfa4d4f2bf4558d', 1573456511, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取全部数据', 0);
INSERT INTO `log` VALUES ('94454e520bfb4af9bfd8be01a2d9a468', 1573352189, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('94493435f42a494289b57393948e80c2', 1575114176, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 204, '获取全部数据', 0);
INSERT INTO `log` VALUES ('946168e9e9974763a9c66c88b609226b', 1573640063, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('946c8eb89acc4d5da782a6058f701188', 1573355831, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('94a25c0985f6479da8c81da515974241', 1573640941, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('94b64d062791482a8191f1fae824bb07', 1575211614, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('94ef51a3b43745938e4c0d5615bf39df', 1575193023, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 101, '获取全部数据', 0);
INSERT INTO `log` VALUES ('95014b9cb387475ea0498a978d0f7b6a', 1575123683, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('951394b3dea4419481e6d15ff20751d2', 1573356188, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 40, '获取全部数据', 0);
INSERT INTO `log` VALUES ('95180d2a208646a8afd7d8cdb8a12759', 1575093928, 'http://127.0.0.1:8080/area/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('951cb55075924c29801cdf0d9a7a0ce9', 1575293370, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页', 0);
INSERT INTO `log` VALUES ('955785a768184f94b37f74e5891290d0', 1573352117, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('955bceca48c3484cae578bba96056046', 1575181424, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 369, '分页', 0);
INSERT INTO `log` VALUES ('958dc262cc4b48c39ca0eaf93f4d2c31', 1575126362, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 97, '获取全部数据', 0);
INSERT INTO `log` VALUES ('95a546409a66473291b1fd9b61e7bc65', 1580023483, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('95b47a89238043ce940cfeb1f5b4b995', 1575093895, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 65, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('95c26b815c6849888fd496aabdbd0bfb', 1575128299, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 145, '登录', 0);
INSERT INTO `log` VALUES ('95d5e2e07cca4acd80d5b25fa821432a', 1573353659, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('95d8b4508a5c4242b8e50a93ac096f42', 1575206259, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 66, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('95dea4a5f6ff48a699af4075c662d1d2', 1573355135, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 169, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('95e8721095004307ba731f3e5e7fbe0f', 1575293394, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('95f5d7aa5b3243c78859d2f1f6802056', 1580023425, 'http://127.0.0.1:8080/admin/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 94, '更新一个admin', 0);
INSERT INTO `log` VALUES ('9636b741a4d6470bb583e444fd94aa74', 1575193038, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9661ed2917ae41efb45386a28422478d', 1575113818, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('96736eda9df2455bb4846e05aa1957a5', 1575281284, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('96e34164f0ad45fa87de184c32ac5a30', 1573353930, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 15, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('9702a29f0abc40fbbbb5180792c2f085', 1575114196, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('972baf86321948f498394c69d7cc641f', 1580022197, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 238, '登录', 0);
INSERT INTO `log` VALUES ('9739f3cd55d640f086dc00735ab0540f', 1575126411, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 53, '分页', 0);
INSERT INTO `log` VALUES ('9752bb0ec6c44b628d6c16a624a1d75e', 1581922609, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9776fc355bfc4d028de1650ef4fd83cb', 1575187429, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 112, '退出登录', 0);
INSERT INTO `log` VALUES ('977e75ed95f94e0788b6ad25debe80cb', 1575093930, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('97a6bbc0718546bda8cbff97c6033270', 1575196696, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部数据', 0);
INSERT INTO `log` VALUES ('97b42c7139da4146a683619702ed4e04', 1575194215, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 64, '分页查询权限', 0);
INSERT INTO `log` VALUES ('97d4be8435a54f918eb05911842eca81', 1575128308, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 86, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('97f849174b284e54b552282c7567aa0e', 1578231053, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 41, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('98163f6a508c402d88bdb9a877f5c160', 1583390455, 'http://127.0.0.1:8080/point/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 24, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('984e1ed4fae6400580d10e395174bd1f', 1575194410, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('98560f8d24954389bfbf839e3a5999ca', 1573484059, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 133, '登录', 0);
INSERT INTO `log` VALUES ('98661f69a6dc49c89e484b61740a1888', 1573353310, 'http://127.0.0.1:8080/area/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('987084e37fbd4e7190d9a65afd2774f2', 1575261863, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 133, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('98999fb102324e8b800049394ee1705d', 1575197152, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页', 0);
INSERT INTO `log` VALUES ('989e32895f4d424190e675f77d0f2667', 1575114176, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 99, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('98a350a4d1254c9380d26132602943b0', 1581922630, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 145, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('98ab923f9ff845df9bd4506b35a13d18', 1575206285, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('98ca4f68973d4d09b078c1381eb8022c', 1583390488, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 27, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('98d68e73d17a4d848f772d58c2b640a7', 1573640920, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('993363deab3546a4b007a8551181182e', 1575281163, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('994fd4b1dc2345d091a2b73e7791e083', 1575196853, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('99df0a5fce794dd6935ea7f522b91068', 1575191348, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 136, '登录', 0);
INSERT INTO `log` VALUES ('99e1b8b9329c4a62bf1d16eb1cac2910', 1575282351, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 9, '退出登录', 0);
INSERT INTO `log` VALUES ('9a12578abc4d468390b7a839cc034c93', 1573356197, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9a2759cf7938479eadcab63aceff73e4', 1580022323, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('9a32a02809b94b5e99a6fe4e20b3ab61', 1575208605, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('9a32bbb2e0594e10a8dea92b9cb0a1a9', 1574650547, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 8, NULL, 0);
INSERT INTO `log` VALUES ('9a332c1185ed4153b45f2664a5a27fbc', 1578231091, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('9a5d3dcd9428408cb369254e8301613b', 1575093875, 'http://127.0.0.1:8080/patrol/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 77, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('9a7d40e000ba4be494e611f1d9193c39', 1575190272, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '分页查询权限', 0);
INSERT INTO `log` VALUES ('9aada921b6724e30b5ddff1252d9491f', 1575198071, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('9ab00f5d03d74d5ea89a8467a5c2d60e', 1573353266, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9ab5fa81edf0469f87c91b9d2125da8e', 1575187945, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 145, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9ab75964310d4d0fb05beb8a18d3e78f', 1573354885, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9abeab1d9c1c4c97966b5e453991352e', 1575194444, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('9b0229d44f8b4f9198e5c3eeb1109ead', 1575128001, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('9b3722d715534f938c3f30e15ce706b5', 1575183383, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('9b4f7e3e9dc84204b4f8c1d179e58c75', 1575181750, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 45, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9b5105d750a94126898a03feba88acc3', 1574645888, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('9b6d47cf45e44e74b1a7ca2cc1040da5', 1573634274, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('9b889fa712d14429bd4a5c0c7e9be693', 1575210242, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('9b8901ccae2a44a99f2d7f13a463ab83', 1573355703, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9bb3117446bc4022b17ec1fc7bf6fdad', 1573354000, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 19, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9bb77b9d8e5443f193ec0cb08bae655a', 1575190818, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页查询权限', 0);
INSERT INTO `log` VALUES ('9bbed0f6c57e4b69ba563e4fa0ab070a', 1575126362, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 189, '分页', 0);
INSERT INTO `log` VALUES ('9bcb24a35768421e888295e9e1dff74f', 1573456497, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 207, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9bcc7f62d5ee46d4aef45f3ee9f298b9', 1575208580, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('9bce6600d29a4882aa9e78f8b44da29a', 1575197122, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '分页', 0);
INSERT INTO `log` VALUES ('9bef0b7a11fc4c7fa5f4a78da801ba9b', 1575202543, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 99, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('9c04707beeff4fd28251530053a179f0', 1573353321, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('9c20aafdba6c4505ad07916f83d3d220', 1573640474, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('9c23d59a4ccd47169e7e1758b5453d57', 1575194270, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 113, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9c290aad6fca4c3398b8f06d7f603430', 1575204358, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('9c50833f86c7497ea4404c9848f0b5a9', 1575280118, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('9c5e79099795435c8ab3ac8ef14a1a8c', 1575114191, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 219, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9c89d07767bd43acbd0a71406f56d469', 1575127988, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('9cae6e115edb492ab0fced6749a65192', 1575199476, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('9cd1ee156bf845248c2647c766c42807', 1575114204, 'http://127.0.0.1:8080/equ/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9cd8f9f65428412482fb55cef754dfc5', 1573355705, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9cf0ead5f719447aa7006ba31b1e0792', 1575113522, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('9cfb0cd7fb4d4bc48c5a46cc7c0af87b', 1575121579, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 39, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9d0d4a7ab73b4719a50f59864801809b', 1575210370, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('9d2e436c626e4c8784c1899d870e07b4', 1574607947, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 117, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9d3195cf0a34411789be6b28c2257bdc', 1575261906, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('9d3c2cb5969148da9fdcb44882627451', 1575204890, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('9d59594a7b4b4d9e988d4a26b9adc0ad', 1575119542, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9d890b1d8bbf4463bd365996f709880c', 1575196761, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9d89dde0a4894201a3d6cbdc91e74381', 1575126490, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 12, '退出登录', 0);
INSERT INTO `log` VALUES ('9dcd68f6c3134aca8329d90e608b2515', 1573356206, 'http://127.0.0.1:8080/log/all/29/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9df9084b4857499b98c14df9a3bb508b', 1573352119, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('9dfd690f5932495ba5a7194ecc834c62', 1575093951, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9e0d2d778a7b42edad797c6ca02128b2', 1573633181, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('9e20b2f0f9f148f69e90fc5911659e97', 1575193042, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9e527d83898e460b9b96d6b911f75e23', 1575210242, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('9ecc51fc80d84e95a6dbd5c29224caaf', 1575183828, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('9edf057e156748c09ce5d698fe30290b', 1575125133, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 26, '分页', 0);
INSERT INTO `log` VALUES ('9f3bd3764fea44edb94f8cf45ea0c860', 1573352119, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9f5f1174af664a759354245dc25e0c63', 1573352085, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9f6af14d874e41f3b2d6c1da9aa210d4', 1575193018, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 211, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9f78b1180071445c937f016d19a98684', 1575194404, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9f836ab1622a409b96cde1c89d1c0965', 1573356717, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('9fad82fca74e481ab9fc66e83e5df56b', 1575293294, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 6, '退出登录', 0);
INSERT INTO `log` VALUES ('9fc434642ad444319510064f6bba5280', 1575128190, 'http://127.0.0.1:8080/equFail/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 96, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('9fc8c347520140c59871c27d79c4b90b', 1581922658, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('9fec77da80c047ef808fc372815e9691', 1580023521, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a0000dca080a47febbaaac652dd7dffa', 1575123271, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 13, '退出登录', 0);
INSERT INTO `log` VALUES ('a00b4b4b7fec403a833a909752143dd7', 1575123836, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a0174d697efa4303907b255039285234', 1575207216, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '分页', 0);
INSERT INTO `log` VALUES ('a030afe180344f37a8f4dd17d0fd122e', 1573354000, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 9, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('a03512b8cf8c4818ab5fd9c924c86f1d', 1573356201, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('a046336ddef840a4a6c1e4896406c5a6', 1575128997, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页', 0);
INSERT INTO `log` VALUES ('a0698a7275e1456ea2621aa20e3e0a96', 1575123788, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a08f46572a574ade8c0ef2d824edc36c', 1575197412, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('a0a339d507e9439db1d72c68932645ff', 1575190429, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '获取全部模块', 0);
INSERT INTO `log` VALUES ('a0a342490f494f74972772d1d1f7c35a', 1575204358, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a0acd3e98df54fbea22a1fa4dfd3857b', 1575212163, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页', 0);
INSERT INTO `log` VALUES ('a0bc1d0c4f4348209596256ebeb2b4bf', 1575280196, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('a0c158fad61f4528bc349152e3188fbe', 1575204358, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a0d17ee3e92f4dd8a6623822fe535c4f', 1575281415, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '分页', 0);
INSERT INTO `log` VALUES ('a0e36a0466914673875ac31a20fffb34', 1575193878, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 35, '获取全部模块', 0);
INSERT INTO `log` VALUES ('a0edc6f701664745950654bfec720936', 1575194273, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('a0fd7b16aac740d2bc1fe45963f3d0b2', 1575188323, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页查询权限', 0);
INSERT INTO `log` VALUES ('a183ef5b8dcc4ae78f2dc7d59e11d61c', 1573358241, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 1, '退出登录', 0);
INSERT INTO `log` VALUES ('a1889f442a6d4f579427d32daf5f76ec', 1573638312, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('a19ed92735964946a2bdb951a79425ac', 1575113687, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('a1ea2f77d44f4b498c184c4e54d4e81c', 1575121976, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 147, '分页', 0);
INSERT INTO `log` VALUES ('a1f48d8c4ec64263b744df3e783a6da1', 1575211968, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a20731d10c4349ddb03950abcf5021ae', 1578231006, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('a209f25186524f709e3f949f2c65e16a', 1575261432, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 61, '分页', 0);
INSERT INTO `log` VALUES ('a20c3a8884cc4a9a9398e1b5db356b12', 1575197045, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 25, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a252d0209927451e8c8de12f3216cff7', 1575126576, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 70, '分页', 0);
INSERT INTO `log` VALUES ('a2536bb9e29943f0883029b361b12bd3', 1578231053, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a2789f8978c34496ba9735ae0f4bc2e4', 1578226575, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 58, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('a288edbd482e4bb68174e713c873e328', 1580022361, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 63, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('a29f5c7d8c934eb0a88166de96cc62bc', 1573357205, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 1, '退出登录', 0);
INSERT INTO `log` VALUES ('a2a9d47abcd34933bc5950fb6857d632', 1575128308, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 207, '分页', 0);
INSERT INTO `log` VALUES ('a2b209e71862469f9ab83f5e18c5a994', 1575204835, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('a2c8e4f992cb4065978913827c89c032', 1575187469, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 131, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a2f77536a63e4feead94dcd1e39b8276', 1575183828, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a303211ba9fd42d8b6a9e788ac7d0abb', 1573356212, 'http://127.0.0.1:8080/log/all/25/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('a315acf8dc9541baa8d59cd6a1d956be', 1573636906, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 71, '登录', 1);
INSERT INTO `log` VALUES ('a33d293d4b0a4d80bc795f7894a72638', 1578138435, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 2760, '登录', 1);
INSERT INTO `log` VALUES ('a35da39d78a24f55a9c653ebe5a58010', 1575204684, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a35df5502efc4d749b3249c7a3745b20', 1575261182, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 2035, '登录', 0);
INSERT INTO `log` VALUES ('a36365e747c246e9a40c7b60233dddc8', 1575113749, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('a36d6aae1a614ee1903de78f8f11bf24', 1574649740, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('a38e8b01a21f4360b63c846b2ed0f022', 1575197412, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a3960de8ef9346448aa1a91459eca340', 1575280880, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 14, '退出登录', 0);
INSERT INTO `log` VALUES ('a3a35c6acf0d4248b86ae769096d7033', 1575126576, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 61, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a3c90b25e99b4f9bb4b9ebdaae8d1071', 1575190232, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 7, '退出登录', 0);
INSERT INTO `log` VALUES ('a3ceb37811894f0db1da8978d475332a', 1581922620, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 61, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('a414206160824bd5bac28dc41862e07f', 1575093853, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 154, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a4333447f7b94aaf8d96982062b8f751', 1581922654, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a449b4c999234e9cb689a6755e3c6533', 1575094607, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('a45347fb58a740a5a5da3a78f93bbc9b', 1575204831, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a4fdc88779504ae09f0d2d66f53fdb4e', 1575119542, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a51574b4ad81406ca01584fe5d50bc3f', 1573353236, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a571d62024b447bdaa6706e4550bf5ea', 1573637109, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 6, '退出登录', 0);
INSERT INTO `log` VALUES ('a5824b3411e045779866e2da35cde16e', 1574649826, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('a5860fc642284cdea8899930262be167', 1575211968, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a5a2b92334874205ab4d6c65b7700d7b', 1573352081, 'http://127.0.0.1:8080/dept/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 76, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('a5af92ebd55648958070ee23d6e0e8d1', 1574645942, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('a5b34acb78344515b58120d531acd9c3', 1573637801, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('a5d065bf83704c62b2b7277b5ae3e6ed', 1575188301, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页查询权限', 0);
INSERT INTO `log` VALUES ('a5ea48b9746b46e8ac6f9de0ae046937', 1575123792, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a5fdf187b1a44083ade7269150967bc9', 1575197152, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('a608f200a65b4a00a7b84a91802a7dab', 1583390465, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页查询权限', 0);
INSERT INTO `log` VALUES ('a60c68b82be44d6eaa74464499bc2ab2', 1580022348, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('a6101429541e44cd8a63068ee97ba1e1', 1573352194, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('a628c50c19b74f8e9fa0aea5a34132be', 1575210202, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 47, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a62fdbc22f5248648f92c1d3892e737d', 1574650588, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 45, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('a66ad4bb07b649bb93d29543d432800e', 1575200159, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a69368ba88294797abfe937bba9f4a4f', 1575118960, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a69386ce63554e7f8a742407decd12d2', 1575119750, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a695388dc26940c795ce54ee993175bb', 1575211167, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 40, '分页', 0);
INSERT INTO `log` VALUES ('a6ac001c9436459d96bb630b3689b478', 1573352189, 'http://127.0.0.1:8080/equ/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('a6b13b88edbf4a76b9051ba4c28a4653', 1575281530, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('a6b165bcd27a4c86af561fe769a7389c', 1575197412, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a6b60ffe3f9643d6bc47b448b7fa238e', 1575122624, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 137, '登录', 0);
INSERT INTO `log` VALUES ('a6fa704315a746f0b7dd93b736e3b48d', 1575194544, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a6fbe1ec49f748d1b4beb615280e1349', 1575129167, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 150, '分页', 0);
INSERT INTO `log` VALUES ('a72d05fc0a3f491a981114792b87b6ef', 1573357457, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 0, '退出登录', 0);
INSERT INTO `log` VALUES ('a72fe35073d742ef95b324f51b8268d6', 1573352194, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a74297633e4a46989596c94d82306071', 1575282373, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 77, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('a7498eea43804e55a1273edba6283d6e', 1580023471, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a74a63739c9a46e1b280d8c8ba098242', 1575203146, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 94, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('a76581518f454c37917119a34b29dc71', 1574650144, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('a774dc1516174d369ea363fbe3a21fbf', 1575196705, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('a78f20dee6c544de8706a54899b3f8eb', 1575123836, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('a7aeb4e4683648dd8d31f60c23f43806', 1573484179, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 66, '登录', 1);
INSERT INTO `log` VALUES ('a7cb1f97344f43808fb3c4a6aba6fc67', 1573355288, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 133, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a7fb3ad88cfa4c2487bb1fd533ab4abf', 1580023769, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 28, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('a803027f9d474fbaaecc145892fa97bc', 1575194235, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页查询权限', 0);
INSERT INTO `log` VALUES ('a8567a1b6b7244ae9b1bb2734c0267b1', 1575196745, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a874b5bb0da84e69bacfbfc3dc73d13a', 1575194467, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a8ba4bb42efd4069bf69c7198aecd4e6', 1575128194, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '分页', 0);
INSERT INTO `log` VALUES ('a8cbe2514cd04fe084cec3f4832c7641', 1575292712, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('a8d5792a2a7d427fafff18d3424c51f9', 1575193058, 'http://127.0.0.1:8080/area/all/line', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 37, '查询全部区域和对应的线路', 0);
INSERT INTO `log` VALUES ('a8e46b6d3df749b99ae2dbb70f4e1111', 1575114060, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 167, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('a8f428b62ad841559c0ae7e1fcdf1d56', 1575206238, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 38, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('a905005eba9d4c1ebd278b06aedf9799', 1575209371, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 45, '分页', 0);
INSERT INTO `log` VALUES ('a9152787a19b4b74bf510197dbcf68a6', 1578138445, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 195, '登录', 0);
INSERT INTO `log` VALUES ('a92fc14e480d44e69620d1245457f3d8', 1575123470, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a93201e607704dd98b5209e0c28e8e33', 1575121562, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a96731d82e8547d4b6175c97e9f0f6bf', 1578231006, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('a985c56aff3d4a62a2e3e2a882922ca6', 1575282373, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 381, '分页', 0);
INSERT INTO `log` VALUES ('a988656d145a4e10ba8b150bb8e9d78a', 1575183415, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('a9a1dc5ccae4434d995b9c8433d8f393', 1575194535, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('a9b0cbf774a44f428448b535ebeec38f', 1575114199, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a9b1365382114cada531ced3f4485d09', 1583390480, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('a9badec8877343668202ba1cb3582668', 1575182799, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('aa2098858fc64d16b2b3e5b09c8d54a8', 1575121752, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 357, '分页', 0);
INSERT INTO `log` VALUES ('aa5aa8e1337243bda81cfb3acf03ec99', 1575204894, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 27, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('aa5e1e374b2048f69db2eefa0c140c81', 1578298050, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 251, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('aa7ada29e40f4fabadbb7d55664e87a3', 1575113910, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('aa956513dda84aed84baded813ddda19', 1573354330, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 13, '获取全部数据', 0);
INSERT INTO `log` VALUES ('aaa89c1679614c80ac4b654a10db3bf5', 1575202777, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 41, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('aaac30ac8efb4de2b32d2650834ac482', 1573353274, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('aab82c7ee45b45f0b4162468e45cd1cc', 1578231023, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('aabdbbdb4d334a518ead2803d0929633', 1575128144, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 12, '退出登录', 0);
INSERT INTO `log` VALUES ('aaf5329823694d068bf7d3314dba1cba', 1574648794, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 6, NULL, 0);
INSERT INTO `log` VALUES ('aafbfed59d60493a8cb9b2034a8a7ec2', 1575211581, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('ab07e0ee270540529e1165a5cf53e601', 1573353534, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 55, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('ab256acbc10f4000b3e64cf52ac1e4ca', 1574670854, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 186, '登录', 0);
INSERT INTO `log` VALUES ('ab32125b7cab43368571ea7e1c9d47d1', 1583390511, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('ab3e4eec7d1b49f380f495b9f2e5d4fd', 1573640066, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('ab4cd2f9211142db8fc3d2fc87453162', 1573356209, 'http://127.0.0.1:8080/log/all/28/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('ab612747a4734c8a9f6143c490a5b21d', 1575113713, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('ab7aa209624842cf916863569969adf9', 1575208429, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 57, '获取全部数据', 0);
INSERT INTO `log` VALUES ('aba00813e1d14bbe97901545df69b921', 1573355288, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 193, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('aba04ae155c44c449ece429c0c757bf8', 1575203931, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('abcfc8e66c484321980ecdb8d02b719b', 1578230989, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 58, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('abdad87ab33c4bd9a14067b63deecd52', 1573637456, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('abdafeeeae00462f90510fc064aacca0', 1575203931, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('abdcb39f5b6340dc821ee299bc69286f', 1575114199, 'http://127.0.0.1:8080/point/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部数据', 0);
INSERT INTO `log` VALUES ('abfaf921750c4386af63408e2b861305', 1575113771, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 19, NULL, 0);
INSERT INTO `log` VALUES ('ac01cb4a4d73402f9cf0494962726c01', 1575196246, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 227, '登录', 0);
INSERT INTO `log` VALUES ('ac79315fc57045cb82523a7948cc3bea', 1575182799, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '分页', 0);
INSERT INTO `log` VALUES ('acc092985de84eac99db05827e4a0699', 1575196745, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('ad0fe6213e4446da9eeb1e6ceb749de2', 1574649631, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('ad2600f0cc014f649e3b9e0cef786c24', 1575212024, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页', 0);
INSERT INTO `log` VALUES ('ad3562090a0a40e89a5b50d80baf6940', 1575206622, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 345, '分页', 0);
INSERT INTO `log` VALUES ('ad4561c24ba3417daca44e644e21b2ae', 1575192396, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 110, '获取全部数据', 0);
INSERT INTO `log` VALUES ('ad61fe032c294bd39ef644aed1877acf', 1575119649, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ad83b3cb8ce44e9792c488852eb90936', 1575190172, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 91, '分页查询权限', 0);
INSERT INTO `log` VALUES ('ad8a680ebbaa4d66acb38222f67e9088', 1575211889, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ad99f4e06573430eb1a88d741ca8852e', 1575190818, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 42, '获取全部模块', 0);
INSERT INTO `log` VALUES ('ad9bfe4187484d9cb4f4ac8ad98df608', 1575187471, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 55, '分页查询权限', 0);
INSERT INTO `log` VALUES ('adbbea2fd5674dc0a0e5dd1cfb56f2c7', 1573637785, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('add6d37b50ba411fb3dd44107323fae1', 1578230043, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 97, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ade392ca5557492babdeffe51dccdf45', 1575199782, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 53, '获取全部数据', 0);
INSERT INTO `log` VALUES ('ae042329301d4788ad934ef289fe6c27', 1575200264, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 50, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ae086bbb620c4bdb894733764509afcc', 1574649022, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 38, NULL, 0);
INSERT INTO `log` VALUES ('ae4ef24bf65b461b9df008e1710bd2f5', 1574649740, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 47, NULL, 0);
INSERT INTO `log` VALUES ('ae4fa7b3a236460ba3f18a4bd1ca2072', 1573353294, 'http://127.0.0.1:8080/area/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 145, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('ae6e2bd70f0e4e959a28f6fd3ad14120', 1573352789, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('ae73f59f7def4ecfad0149ad1c774596', 1573352086, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('ae8b009cd634467e8d064bc91d058fb7', 1575206604, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 1011, '登录', 0);
INSERT INTO `log` VALUES ('aea5e34f14d84365ab49c4973f5cc59b', 1575206632, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 14241, '启用角色', 0);
INSERT INTO `log` VALUES ('aedccebc0b7e4152852459acf27bb7b8', 1575199944, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 26, '分页', 0);
INSERT INTO `log` VALUES ('aef4709bb5f84e8eb26ba5ba60d2a5ae', 1575204898, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('aef86508275f4de7b704806e2e92943b', 1575261820, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('af220174ec154134befdfae1a0033e56', 1575212052, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页', 0);
INSERT INTO `log` VALUES ('af9475742a56470890b3cd483a10bbd3', 1575294513, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('afb8467b4f1d461eb6ea98b822a57f80', 1575189399, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 95, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('afc6e73f44564fb2be480c63eead8341', 1575294498, 'http://127.0.0.1:8080/admin/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 74, '更新一个admin', 0);
INSERT INTO `log` VALUES ('afdee8b0d30440f9a1698ccf4e75e591', 1573352070, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('affb48b1505d49498ebbbb9784193fc9', 1575193018, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('b030eb6fed5846d6b5d95fa0f790726a', 1575190271, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 66, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('b05012c7f38740ae8907e90993d0383e', 1575119421, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('b05679e182104f49997c0356667e73df', 1575119595, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b06ee022c57f44f086bbc3b1e79cfd78', 1575199948, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b08f9fd02bd14e52955664cdfb37ad24', 1575119415, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b0a6ae2154eb4a4a961fbd39adad5a25', 1575113481, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('b0a89a6110cd4d54b06101e03b442a9d', 1574650237, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 57, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('b0b9c55c05d7484694b9324efe349bbf', 1583390175, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 365, '分页', 0);
INSERT INTO `log` VALUES ('b0cdc3478e79425f8ae3bed4b56948a5', 1575095542, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('b11a6663118f4c84bebeb27920a13cc1', 1575182510, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b1292c9b83034dd586d6f288981e2bfa', 1575206260, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 151, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('b13dbe2c417b4d39a7d51b6c48ea4475', 1575199691, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b142340a9cb6430a8466d14fa456f481', 1575119315, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b1606abd173b461a92a61d5be8aec45a', 1575280294, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 68, '分页', 0);
INSERT INTO `log` VALUES ('b180b512463c441aa65455f95c9dcd62', 1575196498, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b18fb1c7b2884e5682493b9c0a0960a0', 1575204964, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('b195043b12514359846667eb37b9d0f9', 1575211723, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('b1dc2f217ac14bf3aac2b6767c258711', 1575211742, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('b1e429d584b34f4ab75b39a3f3ff4165', 1580023837, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b1f46318a0a14df9b24b5d740ba1081d', 1573354879, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('b1fdf0ff984843118c1e98810999329a', 1573355831, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('b234223af94e440986dddc7e11589d37', 1574649548, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 37, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('b29c66c65cc94c87acb4c3a261301d94', 1575204933, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 48, '启用角色', 0);
INSERT INTO `log` VALUES ('b2b617dfb59e4fc797aeb4252ef0ad63', 1575127991, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('b2c8011d82594f839c76f0c5682cd33d', 1574646407, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 29, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('b348fd4b0f4a4b7ab96cd21513c237db', 1573353534, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 16, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b36422b77ae84e8ab1aec1becf0a9fc1', 1575212056, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部模块', 0);
INSERT INTO `log` VALUES ('b36d87dc2e4f42c8b14b4a3008b06bf2', 1573355482, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b3c74639a1d64f2c8610bb651cf842b8', 1575117697, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('b3d3f335d0b546b38d59d0e24462414e', 1574650808, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('b3fe6fd71527496da540f1ca7b2e684d', 1575199744, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b40bcfff62464fd0badf841ba37e7a79', 1575194418, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('b423e28251bf4b2882533088c3e3bbca', 1575114187, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 31, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('b43d33ace5e243fb9bae7c4710be5c29', 1575190813, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页查询权限', 0);
INSERT INTO `log` VALUES ('b43dce1c68db48eda0d5003c0892d0d1', 1573352126, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 40, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b451d8f47b0349af86533e543c24f3f3', 1583390448, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 28, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('b46efc55c07d46bab81b6b3908366409', 1575212231, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('b4ce5cc291f946aab6143bb085ca39a0', 1575119750, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('b4da9a2462f04477a9745fdb4b67aad4', 1575183368, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('b4f9e71330cb4218b4bdbf141e8e79bc', 1575193058, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b50e03ca673c465e9cdd586078e9bb53', 1578233014, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 111, '退出登录', 0);
INSERT INTO `log` VALUES ('b542e2e8709846bab5c623a5855fbaf3', 1573640548, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('b54fee132a2a443eaa97bb69ba198235', 1580023425, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('b58479636a2446b2a2b5c4064681025a', 1575121279, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 194, '登录', 0);
INSERT INTO `log` VALUES ('b5910a0949f846b49ae268d756b73e8c', 1575194544, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('b598411a7aeb4470b9b444621554405b', 1575113956, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('b5a686ab81e34eb6bfbd13e827ebd325', 1575118266, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('b5bcb2c328cb4610a3e6a2c6d0bd4439', 1575204645, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('b5ccd1771b1f417b8e2237d69ac16ce3', 1573640070, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('b5da71c3eebe4c339c6e92efa605a8a8', 1575206310, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 76, '启用角色', 0);
INSERT INTO `log` VALUES ('b63e28f6e29c4a5880dd041e80e35e5a', 1573635713, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 301, '登录', 0);
INSERT INTO `log` VALUES ('b642de217c704bd7a29e484a855c7db1', 1573638298, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('b65587bfda2a4d5b816f3d197de57d45', 1574645913, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('b6bd1211a5bc47c190ecc8163d082f91', 1581922614, 'http://127.0.0.1:8080/line/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 30, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('b6f085f5458b424eb44b1ca4cdb47f95', 1581922426, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 478, '登录', 1);
INSERT INTO `log` VALUES ('b6fae2c289a84bdaa7078fbeaafab1f2', 1580023470, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('b70516cb0982417bb8970ed89b8b306b', 1575190301, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 88, '分页查询权限', 0);
INSERT INTO `log` VALUES ('b713a53f0bd44d07a04b063f35633938', 1575196919, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 29, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b72e0555e04543478eae2a653a9d66a2', 1575203821, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 37, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b741c889d5494ae39a68e9aa620a4fc6', 1575122613, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 8, '退出登录', 0);
INSERT INTO `log` VALUES ('b7638a8b12774ec49f0dcde1100d5d31', 1573636578, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 32, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('b77bd9946b8247bb9f1e92ef70b6e2d5', 1575205209, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('b78b0330a56d4502baff5dbfbca5dffa', 1575121304, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('b78c407fe6de43a286d76034d2805c6f', 1575129181, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 1530, '启用角色', 0);
INSERT INTO `log` VALUES ('b7b8d538561e477f87f89ecaba313351', 1581922431, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 4, '登录', 1);
INSERT INTO `log` VALUES ('b7bb95dd8e234bd0b4c047b7e0c83a40', 1575281214, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('b7ed99a27c764fcdb811f92aad4c18f1', 1575123962, 'http://127.0.0.1:8080/roles/1/20', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 31, '分页', 0);
INSERT INTO `log` VALUES ('b8082ce99bee4a1394e077fa39d4350b', 1575199691, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('b83ebab8ec1945c0b91253bbd53ef5f7', 1575204262, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 142, '启用角色', 0);
INSERT INTO `log` VALUES ('b840579b608e47a58735e331cdefaa24', 1575183368, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('b844428c3752465a928225e215ca4edc', 1575211743, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b8453c18f411428bb167be4582df0bb1', 1575194410, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 74, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b84608d18f7e4f299bf1d5875c10bf31', 1575121599, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b84edf68377c4bd89f6bfaa8883d8df1', 1575194457, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('b84f5b6d3ce640feab08603b374ad980', 1575123867, 'http://127.0.0.1:8080/roles/1/10/1', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '搜索加分页', 0);
INSERT INTO `log` VALUES ('b86b1695cac54d1c81b7002c1facea4e', 1575119227, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('b86dbdea99dd48a0ac1dfcd925d9a6f9', 1573640397, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('b8716728ccbc4192a6610235889463aa', 1574670849, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 0, '登录', 1);
INSERT INTO `log` VALUES ('b8dde600510747bf826be752faf88a3d', 1578231162, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('b8e103d388744f4e8f021480d3f349ef', 1575190823, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部模块', 0);
INSERT INTO `log` VALUES ('b90f67dd8a4041b692a9e007d7005492', 1581922654, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('b91e28f57d0a474384487bce352fdb3a', 1573480869, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 102, '登录', 0);
INSERT INTO `log` VALUES ('b927f0214c114f9c8e76f4be13171bca', 1574645919, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('b93bbca2bfb34fcf9cd563ebb0578e67', 1575129167, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 72, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('b93dc2d411d54aa899b057796852d6e0', 1580022315, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 70, '分页', 0);
INSERT INTO `log` VALUES ('b9401b1f983e41f3b32aff839a811ec4', 1575292491, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 33, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('b976ef42998a4b74920fd001895438d0', 1580022316, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('b99698c9d1f846fbae08aed5d70ef050', 1578231048, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 213, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('b9acc0d0a92b4d11ad548501b9db7bdb', 1575114176, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 138, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('b9b08eb0d62341f18a2c6a456529c2a4', 1578308487, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 415, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('b9c780e8096d4f5abef682c8274380f3', 1575183373, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('b9fe6974a5e14d2eabe2c43d443407a4', 1575118266, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('ba2275cd492b400d9b5505ec03f0a100', 1573355684, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 41, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('ba324c7e8ffc42d48074b16ac6216723', 1575196487, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 138, '获取全部模块', 0);
INSERT INTO `log` VALUES ('ba362dda3ce84cc4be332b30ff89e104', 1573354023, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('ba593c8ffe10404a8697139becac9162', 1580022316, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('babd779009f34009867ed2d90657be49', 1573352126, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 44, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('bac04904bee24fc49620dd4c14b0de40', 1573484183, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 114, '登录', 0);
INSERT INTO `log` VALUES ('bacc0f261e154e20a4c30c3f9009c7cf', 1575204907, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('bacf88b7b7df46178fdea7e9fa263a51', 1573352194, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('baf230f3b87c4b968191b7d1f504bb94', 1575211644, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('bb10e55f4a2d4cf28aa87c3ed774479f', 1573355782, 'http://127.0.0.1:8080/log/all/3/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('bb37373a436e478896fed3965638b17f', 1575261561, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 122, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('bb43175644d34fba98d1a791ea8e9725', 1573456497, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 137, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('bb77535b68d944599abb68ecce3756d1', 1575281275, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('bbb5678837ac4dbc82770ca03b2e6050', 1573352056, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('bbc91bc1365848fbb4c04d3b9e2bc6e0', 1575204907, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 36, '启用角色', 0);
INSERT INTO `log` VALUES ('bbf9cda5902a4e5f80980131202f5e51', 1573637793, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 33, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('bbfed216618a44f4997d3fe2cfa49d40', 1575117705, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('bc0224b8e9bc48278ab27e03b90e84e4', 1573354936, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('bc23bb5f857943ae8f9d973f83b7e844', 1573355683, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('bc37bcb47f8f4372a87ab45ae238cce7', 1573638305, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('bc404ddae3cb47fcaa9a010d91a87612', 1575199691, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页', 0);
INSERT INTO `log` VALUES ('bc5c1e9e97734b20a6c1662947454c09', 1575206238, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('bc5c30aea2684b02bc518d5b0aab5810', 1573353274, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('bc60fe183eff40049e3fd4c3b87cbd91', 1573353534, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 14, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('bc6bb093dc5e449b8134ee90d23b6c0f', 1578231028, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 27, '分页查询权限', 0);
INSERT INTO `log` VALUES ('bc763e0da8964604b8a710016e0f0c54', 1575196732, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('bc7e1342d8a94fddbe33373e3bf16126', 1575125133, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 29, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('bcb0d903e816494094ea6512f6d9d6b6', 1573637759, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 55, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('bcc410781df8415bbb5ba2241530b352', 1575202970, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('bcccf2d7e4564a05b0ea164ed19279ee', 1575114194, 'http://127.0.0.1:8080/area/all/line', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 161, '查询全部区域和对应的线路', 0);
INSERT INTO `log` VALUES ('bcda4a372a3340f4808316a2b845064e', 1574646406, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 58, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('bcf05e62a89f4a3792d3dd401909688c', 1573352060, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('bd03b4bb3328465ab200a9beeb8d12ae', 1575196705, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('bd1cae2bf39a4f8ea4dfd5e3eab2a038', 1575183081, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '分页', 0);
INSERT INTO `log` VALUES ('bd2cfe7abf454db3ab504b6eba139449', 1578231037, 'http://127.0.0.1:8080/log/all/2/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('bd4b2c84392440949878da19bafb83f8', 1575261468, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 111, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('bd7e1d08928d49dba2d82e98fd4406c1', 1573353310, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('bda0742c914e488ab14da225d0101502', 1575093917, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('bdbd61e3cdbe4b0184d4c388e742b6a7', 1575119704, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('bdcce5b6b819455d8c5568478d01aacc', 1575123541, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '获取全部数据', 0);
INSERT INTO `log` VALUES ('bdda68aa7b2d4e6e9560c90e0a81c2be', 1573354928, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 10, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('bddaaf3203b5456c9881399ba75e13f0', 1573353266, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('bde8535b6f1e41fbaf68b8bca82b7954', 1575209951, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 85, '获取全部数据', 0);
INSERT INTO `log` VALUES ('bdf58d54019c47a1ae59dd1e89315238', 1575204357, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('be099e15e7bf4ebdaf2516d05a6686e4', 1575093884, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('be47c00f61734c86ac567f73ada123ce', 1575204658, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('be4f5a2a3d984dafa3a70d40b72f6cc4', 1580023517, 'http://127.0.0.1:8080/line/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('be53712531a94105afa03acecb0b9b51', 1575122233, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 145, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('be5911e45de940659acdad944333d3ab', 1575208409, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 8, '退出登录', 0);
INSERT INTO `log` VALUES ('be7b80f031704044b9668f64c03187f2', 1575210475, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 81, '启用角色', 0);
INSERT INTO `log` VALUES ('be8b00a897e24730b8ae86dbf794ed39', 1573638173, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('be8f27f9a4b04e9998d96976e29cbd02', 1583390465, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部模块', 0);
INSERT INTO `log` VALUES ('bea507ac434149b3a313871128f2f656', 1575181750, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 43, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('bee358ebe9654f9bb429f1b193f75535', 1573355288, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 143, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('bf04fc6e86bb4c4c89387dfa31f48f97', 1575261873, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('bf07a939cbe947bfb9bbb51631ba6b05', 1575196761, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('bf280cbbf2634ae2b8cb1e5a1f06c77c', 1575199476, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('bf4271cecd984b3b95691127b7528621', 1575204430, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 27, '分页', 0);
INSERT INTO `log` VALUES ('bfaad938932a4548a0b2e90a22b9b77e', 1575093853, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 286, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('c041651f297f4ae7995041de6aef9ab3', 1573456526, 'http://127.0.0.1:8080/upload/staff/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 17, NULL, 0);
INSERT INTO `log` VALUES ('c05ac49fcdc84290b93f0bc6c2e5b32f', 1574650147, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('c061734c7cf14c379d004691243e3421', 1575206343, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('c066ada0385a491aa275fcc957b31276', 1575293033, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 8, '退出登录', 0);
INSERT INTO `log` VALUES ('c075c58c8e19400e836224a3bfc6d936', 1574650119, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('c08907a24c8842be917337df80cca344', 1575188394, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页查询权限', 0);
INSERT INTO `log` VALUES ('c094350040ea46e3b6852704a8ae099b', 1573353658, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 20, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('c0b4e8bbd14647429f09512f9762ff7a', 1575181437, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页', 0);
INSERT INTO `log` VALUES ('c0bda79bf6074123baeb6d4208448e1b', 1575123673, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 25, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('c101c18b1a224ae3915d349eb2d4c940', 1573353236, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('c11d771b4fae4b81a758ef56a4e37b19', 1575114194, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('c174609b04c945c5a1d4380ddf866e53', 1575121954, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 7, '退出登录', 0);
INSERT INTO `log` VALUES ('c1a9302964b8412a80b095ec20ba1350', 1574646406, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 86, NULL, 1);
INSERT INTO `log` VALUES ('c1c67b1d94724c0598195dde7a8236f8', 1575210949, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('c1d429b81922439aab3e2a9fa8c54f90', 1574645919, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 68, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('c1f45e67c20e41e988c2ecc76900ca56', 1575123689, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('c215ff224a254332b8d2ba2bfadf0f98', 1575261796, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 46, '获取全部数据', 0);
INSERT INTO `log` VALUES ('c23b33c7ec2f481f9f8331e77ff2c384', 1575211721, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('c26a0e9041094e4883c2c6ee988d827f', 1575118289, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('c279b13c463947a882cce7e4c9e9822c', 1578305378, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 458, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('c2cd2a58a4b94c988524bdc2dcffa1e0', 1575119230, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('c2d5c61deb3348188947de5a666c20b3', 1575114208, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 33, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('c2def037f34b4ad4843517340a54b4f2', 1575204845, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('c2f9442084b941ceb4b27d8e2c875105', 1580022305, 'http://127.0.0.1:8080/area/all/line', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 262, '查询全部区域和对应的线路', 0);
INSERT INTO `log` VALUES ('c2f95d0556654710ac02e581831bd256', 1575205188, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 70, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('c32d54a531684bc0be59ef5a3375df2f', 1575203859, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('c3350924643a45fe90bd4a6f50d767eb', 1573352064, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('c33ad6375b774775bbd0cc5c209bb69b', 1581922611, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('c392a3e5535547c384853d6ca9877241', 1578226563, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 218, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('c3a4102b520f42a2b0081d3813666de8', 1573356947, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 61, '登录', 0);
INSERT INTO `log` VALUES ('c3c19b1e9cab4ba9ad8e5953e0653e5c', 1573351695, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('c3c7ffccdde2440f9753d746b9c5fec6', 1575294534, 'http://127.0.0.1:8080/admin/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 66, '更新一个admin', 0);
INSERT INTO `log` VALUES ('c3d27ade608a42739023b2a41a1f829c', 1573637463, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('c3d7bdd17d204c3e839d181f844caae9', 1575182510, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('c3e9f0991aea4b7dbb5e338cbb79df20', 1575113660, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('c3f468ea50b64f4fa0835b56f283bc67', 1573357846, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 0, '退出登录', 0);
INSERT INTO `log` VALUES ('c4637eb0f7c84ec5a0d10ad09521770e', 1575194442, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('c46bc098861d460c9988042aa1c72b12', 1575191366, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 112, '分页查询权限', 0);
INSERT INTO `log` VALUES ('c47c320bc6a7435eafa9d2bcff8c02d1', 1575194535, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('c4ab2a0f64f94c50881adc19f73ec9a9', 1573637442, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('c4b19b1cb2074302900157f11da1152e', 1575211743, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('c4b80da05ee04a0f8e2594007357cdb5', 1575281159, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 192, '分页', 0);
INSERT INTO `log` VALUES ('c4d6792370154da4bb067e59a40e07b1', 1575197412, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('c4db46626f914549af13743c39a6488b', 1575204845, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('c4ff30bd619f4bd8905db6132817a7ea', 1573355854, 'http://127.0.0.1:8080/log/all/29/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('c521c070989e43d4988a6df2477eb755', 1575281291, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('c52e10ea065648739afd2c95b3ce40fa', 1575129153, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 145, '登录', 0);
INSERT INTO `log` VALUES ('c533fdd427d34ed4a6f2b41c9a4be4f2', 1574650262, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('c570a05839fc45289e27c0b215b751ca', 1573353325, 'http://127.0.0.1:8080/point/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取全部数据', 0);
INSERT INTO `log` VALUES ('c571d31c4cd84dd7988a5d4713aab928', 1578305371, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 156, '登录', 0);
INSERT INTO `log` VALUES ('c5ce8b33b7174e1b95c53da71faa0e6d', 1575281194, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('c5ec209ab7f448569fc7e8d7cebd877c', 1575189400, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '分页查询权限', 0);
INSERT INTO `log` VALUES ('c5f09cfbfe2e4726865af6c1e34e25b7', 1575196487, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '分页查询权限', 0);
INSERT INTO `log` VALUES ('c61c3e0705a04310bc60e2e7e96c56fb', 1575201058, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 32, '获取全部模块', 0);
INSERT INTO `log` VALUES ('c664dfa603184b0da1c0edb3564dadb1', 1573635326, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 17, '登录', 1);
INSERT INTO `log` VALUES ('c692da2833e6492893fe295374e89ed9', 1575280113, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '分页', 0);
INSERT INTO `log` VALUES ('c6994826e40d41ff84cbe2b17e7f3e5d', 1575281152, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '分页', 0);
INSERT INTO `log` VALUES ('c6b85b997e91461ba9502f76fe1f0f55', 1582468159, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 803, '登录', 0);
INSERT INTO `log` VALUES ('c6c817473daa4deba6f19676ddfbb7c9', 1575204926, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 30, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('c6e7c34a88ec492fb74b46d84133355d', 1574650115, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('c7260f80bb6a405ba4e5cc00fec3391a', 1580023709, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('c727388fe66a4b7d822d869a67396db4', 1575261232, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '分页', 0);
INSERT INTO `log` VALUES ('c752d9b8dc884000b52dc8068bc226c1', 1578307971, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 326, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('c76ecc5d20c14baf9b16e780c99c234d', 1575261477, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('c798e03616b84caebe5c97201aa8834f', 1575210862, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('c7ae28b322a64a2fa3079616e6e20c92', 1573354879, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('c7afeed1cb4a49a39eb84b2f0fafddc5', 1573634089, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 50, '登录', 1);
INSERT INTO `log` VALUES ('c7b0345b5dc3468fbcfc606db65dc92c', 1575183784, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部数据', 0);
INSERT INTO `log` VALUES ('c7b44c1bf24e494e88ec07c420045491', 1575202543, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页', 0);
INSERT INTO `log` VALUES ('c7dda91955294780b2f053f7eb20b885', 1575206259, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 74, '分页', 0);
INSERT INTO `log` VALUES ('c7e27172ac5f4c0b9d520afcc5e4f561', 1573637750, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 42, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('c7e3854fa27242c08eb342abeceb2e79', 1573634246, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 41, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('c7f4bfda4ff14ce6bd97f93c6cfd03eb', 1575124178, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('c81f1ef5fb274d61a06fb90d4b0ce862', 1575201057, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('c81f1f3bb4f748c5997fb733c23c9f26', 1575204890, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 50, '获取全部数据', 0);
INSERT INTO `log` VALUES ('c83a53eed5bd43f99e98c449f4fb03c7', 1575187945, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 63, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('c8665e1916dd4bc0aa490da0b5fd236a', 1573636726, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 10, '退出登录', 0);
INSERT INTO `log` VALUES ('c8708125b42140648b12ff8950287e02', 1573355719, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 3, '登录', 0);
INSERT INTO `log` VALUES ('c8727fd0ff6a43e4be8ffa16917b80c4', 1575197452, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('c882a8d94b3546b0bdd80562fa1bbe74', 1573638308, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('c89a912ac23f4c8997382b3912990b18', 1575119188, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('c8b424335d504c09a8de4484f7016916', 1573354877, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 22, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('c8ba75bd5ed74f9299dce422fcd32b99', 1580023544, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部数据', 0);
INSERT INTO `log` VALUES ('c8c7ea3a709f4678b79b0cf355477bff', 1575190272, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 30, '获取全部模块', 0);
INSERT INTO `log` VALUES ('c8d754672ce3481ba62da3db93afae34', 1575201055, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 51, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('c9c0c9b36a49429296bbd1b0d807b1ea', 1573355792, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 12, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('c9ea88fd872e403aa9b9e5269c581947', 1575193058, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 86, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('ca154fa02e6b4d2a9afa9e2217cae443', 1575208913, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 42, '获取全部模块', 0);
INSERT INTO `log` VALUES ('ca1f5b0ad5eb4bda8a960efc0bf91cd0', 1573632895, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 167, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('ca21d74d165c4dfd8eaa027a54fe255e', 1578233276, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 325, '登录', 0);
INSERT INTO `log` VALUES ('ca752ab91a9c430db5a525efdd4594f3', 1575261848, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 115, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ca8aff853bf54c79949a16d7cb475068', 1575196745, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '分页', 0);
INSERT INTO `log` VALUES ('caad0dca79bd41cb9a239d97cc7367a7', 1575095640, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('cac3564b70764a73b1879cdfd626079a', 1575188398, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页查询权限', 0);
INSERT INTO `log` VALUES ('cace82c024a84de0b2914ac68492a38d', 1575197045, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('caee1e2bddcc457b856df1cab7c6f52b', 1575188722, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '分页查询权限', 0);
INSERT INTO `log` VALUES ('cb0b02d4f8b14018822da4f892aa046c', 1575197448, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('cb493ae4e0574eb9b7136c36b9364e55', 1575199744, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('cb6a19866d2648e7a5f4ab2f474832c8', 1575192347, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 9, '退出登录', 0);
INSERT INTO `log` VALUES ('cb6a940beac24b15acdb5bb2a893930f', 1575196696, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('cb70595d9b204bc187a34caab84f61f0', 1575123541, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('cb7f97e711f745ba9ed5b48d346de6f5', 1575294407, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 13, '退出登录', 0);
INSERT INTO `log` VALUES ('cb83052ca42b47c48535053ce2177d93', 1575261918, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('cba08dd7813744dc912add0f9de61e93', 1575181408, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 2833, '登录', 0);
INSERT INTO `log` VALUES ('cbc0db6df06040f8bcfbffa04a007510', 1578226536, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 363, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('cbc33d3e3d2045f3a41e092a57fea7fc', 1573637495, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('cbef7af9c74f40c0a10e4d0bcd79e957', 1575192396, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 59, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('cc075e737c874131a126179fe4bad1a9', 1575211746, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('cc2a0c21e3304e26a9fb7013306295c3', 1573637742, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('cc30d8640b3340738e37007945ba2a95', 1575194442, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('cc48a2d7f5874d45ba9847d0cc346ad0', 1575209981, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 320, '启用角色', 0);
INSERT INTO `log` VALUES ('cc74bd6db29e4ce89204dfea16906a37', 1573352126, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部数据', 0);
INSERT INTO `log` VALUES ('cc7e970438374aacb320fa6e23faed10', 1573355777, 'http://127.0.0.1:8080/log/all/27/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 20, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('cc80215c12054b1c81033bcd409dec6f', 1575211581, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部数据', 0);
INSERT INTO `log` VALUES ('cc939ea59aa04f89b7d97fee2adee907', 1578298063, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 82, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('cc9810c878ab4db9992d83a1fc1c5c2c', 1575208605, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('ccaff191c0294304bead1bdd27cf2866', 1574649559, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('ccb9b5727b8942f6b1747b186e0910ad', 1573354928, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('ccc109e7cdf74be381fd0ac850fda566', 1575126511, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 83, '获取全部数据', 0);
INSERT INTO `log` VALUES ('ccd9f287e63646f98e018c4c10070ba3', 1573353983, 'http://127.0.0.1:8080/staff/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1f', 129, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('cd3310bb22ed4ef5ae18c4c7668b435e', 1575206285, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('cd7f9766e2524535bfead161d54dc101', 1583390478, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 229, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('cd999d0084e54d6ca6a608b77be5bb4a', 1575206260, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页', 0);
INSERT INTO `log` VALUES ('cd9aa01f191a44448edf58bdc6c55b8c', 1575119280, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('cdec9bde0e974ea489fa6ada76df938a', 1575206962, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 140, '分页', 0);
INSERT INTO `log` VALUES ('cdfc0dda38564a39a8dd7526084d0e19', 1575124039, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 58, '获取全部数据', 0);
INSERT INTO `log` VALUES ('ce0332de1008496bba1c80a16b6780cc', 1573476743, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 590, '登录', 1);
INSERT INTO `log` VALUES ('ce07cc586651433ab77db6ba082fdc52', 1574645942, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 69, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('ce35f78300b54a0a86d22b149a51fec2', 1575182799, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ce8d201200c6477d829ae912c66dea49', 1573354932, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 10, '获取全部数据', 0);
INSERT INTO `log` VALUES ('ce97adb020e74d3ab9ff786f002d5aa9', 1573355705, 'http://127.0.0.1:8080/task/delete/cdf2a5d5089940a6a406e007a77a77c7', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 54, '删除一条数据', 0);
INSERT INTO `log` VALUES ('ce9b0c40d44b43649a0fb818ee1eb083', 1575126351, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 209, '登录', 0);
INSERT INTO `log` VALUES ('cea44b0890a84512a760921f4b28dfd7', 1575183784, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '分页', 0);
INSERT INTO `log` VALUES ('ceb151f1a7c74ecf814d7df993688b22', 1575292259, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('ceb167b442394184945d606a78bda409', 1575183363, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('cec6badc22844423bf10642de3baf427', 1575194418, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('cf0b716d46b942eaaba80a8c2455d2a0', 1575204845, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('cf1040d6e1f04a7e8ebdb57abe39e21a', 1575202777, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 86, '分页', 0);
INSERT INTO `log` VALUES ('cf2869c465db4041b50061b9912c96a9', 1573640443, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('cf3336d4a38f45baa25e13a791022c0d', 1575119569, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('cf43e5a680a0417eb6a00593e2d8af5e', 1575183333, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('cf58d28e30fe40ed9f85f7ee3e0ec0e3', 1575206619, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 47, '分页查询权限', 0);
INSERT INTO `log` VALUES ('cf5908fd6ba54fb6aa4c3f214e8e286b', 1578297998, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 49, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('cf711e4b3d4d4099b260f29152ab0444', 1575204358, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('cf73a7953a7d4ac6855f45812ae7501a', 1575203908, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('cfa17a05979644a5b6f33a20cd25edc0', 1583390243, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 2, '退出登录', 0);
INSERT INTO `log` VALUES ('cfb58a70ec0d4173a5ddab22ea0ac1c0', 1573352119, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('cfe64fad21a84d37ac75459aad2f405a', 1575114194, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('cfe651617dea4e26b147d730ac40d784', 1580023519, 'http://127.0.0.1:8080/point/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 123, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('cff3997de19b47448e5c4119cfc1c832', 1575210202, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 26, '分页', 0);
INSERT INTO `log` VALUES ('d03aa25a7b7a4b82b355c5eddcbaa4e6', 1573355831, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d04be8652be14bc19315c6def24f9f38', 1575119421, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d06021b6f7b7425f9afc9b00196f3540', 1575119418, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d08df40ae8be4d83983e8fdb87a3ba1c', 1575194000, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 168, '登录', 0);
INSERT INTO `log` VALUES ('d0a17839ad41467dbaae7a92db3b3f4a', 1575119415, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d0af7d8269cd4354b979010baa31dfe5', 1580023087, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 202, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('d0b2a8e528c84d5b95cf4b41dead696f', 1573354928, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d0b3623a8d6248d28d5822aad502fb39', 1573354936, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d0d262a0d8b743568183ec419795f583', 1575212246, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('d0f56be3144c42aeb0704fefc3c6c1d6', 1575261848, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('d1378f874e5d417387e1c84969fe150c', 1575183415, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d14efd3d2fcd4b699ec5493a802fb1b2', 1573637535, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('d159a1348c5948089a47b8e1d2fa74ba', 1573354932, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 1, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d1675139f5a944db8dd2b99f038e34c0', 1575196745, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('d16bb60fec1e4d2383ce6e0251b8773d', 1573356213, 'http://127.0.0.1:8080/log/all/24/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('d176c1dc75a64634b841ba9516524c15', 1575211723, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d1c32cea34f447c58035add5eccf34f9', 1575206259, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 64, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d1d45efdeb154f7483f8bcf7ef883bd7', 1575196733, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d2193694a6524b2e9fb6c8ec9e1a0c8f', 1575212024, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d22454bb5337479a8ae13a0cb758bba0', 1573352126, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d24a8fdb3bca450584da99976fff72c4', 1573352796, 'http://127.0.0.1:8080/area/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 66, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('d26a4a3f1f7246b5938b64c0b542e8f0', 1575199782, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d2b8bb23dd424244ad1ef11fa6874486', 1581922605, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 29, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d2bf1d819c19490ba5b69e4c4a782eae', 1575280893, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 98, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('d2e311786fdf42ee83e8914d4b5b44cf', 1578308603, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 269, '启用角色', 0);
INSERT INTO `log` VALUES ('d2f0086d89d845bd856f8c8dc8ee624e', 1575196603, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 46, '分页', 0);
INSERT INTO `log` VALUES ('d2f86adb8fa14c3c815790f9f6af61df', 1575204926, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d307638eb318488683a92cf8dae7fc55', 1575124172, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 230, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('d30ee8019bf9411c9f7f6f53fe2dffe6', 1573637633, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('d31b61f17de54997a099508fc032ec95', 1575204839, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 56, '分页', 0);
INSERT INTO `log` VALUES ('d32e535440a5422589250cc8bb595839', 1575118987, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d3348d4c2dd94aa6a7c0b4d496a35d30', 1575188133, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页查询权限', 0);
INSERT INTO `log` VALUES ('d33cb4a4e4044c2ba99f0d8b8bf1d883', 1575188133, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页查询权限', 0);
INSERT INTO `log` VALUES ('d371ad13b72e43a5bf3a0d6c540995be', 1573638325, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('d37db2f08ddd4f628421dfabab7fcfaf', 1573636566, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 144, '登录', 0);
INSERT INTO `log` VALUES ('d3847283580048b6a24e7c3c36a43dff', 1575292726, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页', 0);
INSERT INTO `log` VALUES ('d3a066ba63694cbd9f0530aefe66c81a', 1575197152, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d3a3a78cc751461180383b996b0d0021', 1573354879, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 9, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d3a6c17bbd5a450190e8bcddf0e53174', 1575210370, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 28, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d3be0e81e5574ea087bcfb9b9c2bc318', 1575118287, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d3c21e81b85e488c8cfc49b1bef4e8ed', 1575204649, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d3d80ac5e01040f0b83907b5af029573', 1575182412, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 75, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d414cb87e3394158a7b4f6bf9b0da011', 1575293316, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 97, '登录', 0);
INSERT INTO `log` VALUES ('d427e648486b4f5d904a05e0d53e3924', 1575093935, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d4319747815643b288e2f8f1bc951525', 1575196854, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d438f0ac868245148fe38434fcdb686f', 1575121599, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d454d42fdd09477b8cb7bc3f6348e530', 1575114061, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('d469d6d53bdf40cca48fc56929c1c108', 1575186720, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 138, '登录', 0);
INSERT INTO `log` VALUES ('d472187bc5524f1b9983ee208f022d67', 1575095615, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('d4cc1d96533a4b23b95ebb9bfd42c194', 1575205949, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d4d6d4358bef42f695e6ad90212dcebb', 1575281155, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('d4d7bd52f60543f28d7dbb26ccd6ec74', 1574607957, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d518b781f93049dab6456d4a160225b3', 1575293534, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('d5407c5b4b924c3f9b2fecd6e72d55d1', 1575280163, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('d567b3212d5f425482de91d8d32ee08e', 1575121752, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 99, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d599003d5bb84561a82785b02ba61251', 1573636910, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 81, '登录', 0);
INSERT INTO `log` VALUES ('d5b7b92ded244e578492a1a2caac505e', 1575201071, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('d5eca7a68a5e41c09ad85f292b47d967', 1573637277, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('d5fc49efbb894b9aade8132214e80906', 1575281232, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('d600f200417442cd8003fde7c8841d6c', 1578305437, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 38, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('d62505d88af4422eaaa0861e221d9f43', 1573357851, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 3, '登录', 0);
INSERT INTO `log` VALUES ('d639cb491bcf4221aced6bbb9821fe81', 1575211686, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d653acb6e2f84e168c725e7cdd831398', 1575209562, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页', 0);
INSERT INTO `log` VALUES ('d656fde332bc45f1a52c441d24b57805', 1575196774, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页', 0);
INSERT INTO `log` VALUES ('d65eab14361c419c9f03f2341e676704', 1578139002, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 486, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d67be30f396b40b7890353bab2b07c5e', 1575122230, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 26, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d69ee55c057943aab96846cc55454350', 1575281217, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('d6b543b6261b4edaa1c3d2bca41640d2', 1580022303, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 346, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('d6e742a132d24275921ebd13c4402cf2', 1573637568, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('d6f20a9a51934072868ddf8bd3a5fb31', 1574650237, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('d6f3c77a76ba45f2ac93a20ca7462773', 1575121559, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d6f9c20b72cf465f9f4647171f2b0e38', 1575124039, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 55, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d709b16749d240bb8dc3820e865434ce', 1573353659, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d7166c45f6cf432dbb8c92451ecefa6c', 1575192160, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 195, '分页查询权限', 0);
INSERT INTO `log` VALUES ('d72230aae23c44fdaef819c6dace1761', 1575192599, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 82, '登录', 0);
INSERT INTO `log` VALUES ('d73822a8dae9406a91d35413291917c7', 1575279948, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 272, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('d7623e0c5bb64e8cb771c1941af0fd64', 1575199769, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d76b7d2ca2454d58bed243fcf67b8006', 1583390448, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d76c49a1f6964bab99d96d9c132e28b5', 1575113660, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('d77baa46b811469fb94e82f41464c095', 1575181424, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 103, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d78095d2f266466dbaf12161e97bd717', 1580023764, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('d78b639baca84ea39b165e6812b4dfea', 1575194467, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d797be34f5e644f9922a13338c98070c', 1575206238, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 28, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d7a13cb7e1934b9a99fd8681488f2f7d', 1580023071, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 107, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('d7fc946f598d4086ab02cb624df5a4fd', 1580023087, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d841a3be537f4283a59bee3cb65b1b3c', 1573456511, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 130, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d854f2cbb7e24dc8a6d3f9a8b574e43b', 1573352060, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('d8576cfe3c864b8c853b1dad8a2bb611', 1573355293, 'http://127.0.0.1:8080/staff/search/chenjunan/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 25, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('d876b540904f4135adff6a98d424622e', 1575210862, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '分页', 0);
INSERT INTO `log` VALUES ('d89fea77474e4e008bd6e6468bc28cd7', 1573355426, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d8aa8560b25f4378bb4e33dc495a5fcb', 1574648662, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 85, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('d8b3ecbe9a42445898affe181eda46a7', 1575113934, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('d8bdf4c5ed3f47d59b627a3a9bedd8e2', 1575210883, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 197, '启用角色', 0);
INSERT INTO `log` VALUES ('d8e2167e2ed9480d8ebab0e49c913490', 1580023544, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 26, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('d90fb1a5046e42e4883175f8986bb842', 1580022342, 'http://127.0.0.1:8080/admin/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 61, '更新一个admin', 0);
INSERT INTO `log` VALUES ('d927c518bc194c2ab5e71663fe1dd922', 1575194453, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('d9296e43cfde467fb269d7f9bb9f15f8', 1573635452, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 43, '登录', 1);
INSERT INTO `log` VALUES ('d9363aa08a5145e9bf62c505533acdab', 1575119190, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d944c1aeac8e489e9e6566fdb584e9e3', 1575193557, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 34, '获取全部模块', 0);
INSERT INTO `log` VALUES ('d983ee0e196d4e1bb9bd6fe4317d954a', 1581922658, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d987620bbbdb46a8b1a2730352ca07fe', 1575201057, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('d9c076e747b744bdba97dd820e6acab7', 1573636922, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 38, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('d9dd0351d5204e3094aae458ceff33e2', 1574650707, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('d9fa9cae5ff947fab5b9eab8b56265f7', 1575113795, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('da4c3ff3ec4b4f78963ef05bba51f92b', 1575124296, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('da4c6af664934130aee529e1353ef862', 1575206204, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 41, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('da67c5c59a76456db5055568ae5d8a6a', 1575203343, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('da740f4cc5e24baba84275bc1464f893', 1575196919, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('da7c0637573c45b793cf4bf388d88de6', 1575206260, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 151, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('dab1a776a6764d95be0ac3483404bda2', 1573637172, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('dab68aac49854546a3e742204d0bc34c', 1575208168, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 46, '分页', 0);
INSERT INTO `log` VALUES ('dad558c9ee304f269838d6c7889a0bec', 1575182884, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('dadfd12d2cb4487dbeffef35aecaf8cf', 1575282563, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('daf9c47d74714e569fe3ba2f4d3229b7', 1575206962, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 53, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('db20da48272248de874296f9afc47c0b', 1575122230, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 65, '获取全部数据', 0);
INSERT INTO `log` VALUES ('db244f0f60fa42a889c98caa6bd821cd', 1575199999, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部数据', 0);
INSERT INTO `log` VALUES ('db24b711f11f49d6974ff4b47809afc3', 1573352078, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('db2c11e40b5445879bbddd1d0885620e', 1575211686, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('db69068ec4374ba8b7be243f37657751', 1573352341, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('db84c42ee2894139b3577a015aea24f2', 1580023061, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 124, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('dbbd29e005344991a786eb48f0f7af9b', 1575186745, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 65, '分页', 0);
INSERT INTO `log` VALUES ('dbc2439a58a14a1191f92c61d1b447fe', 1573355456, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部数据', 0);
INSERT INTO `log` VALUES ('dbc8e6d37f934e2ca32e3c6347b9b651', 1575206204, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 43, '获取全部数据', 0);
INSERT INTO `log` VALUES ('dbd7980e9be04404a2924d47918fb64b', 1573352194, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('dc0122ed944f4775936a8d78d5551d8f', 1575199473, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 103, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('dc3c69b47ff940f29fe4c0ff0e7e5402', 1575093920, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('dc6b9418901a4ea5aa6396225b83b638', 1573352062, 'http://127.0.0.1:8080/area/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('dc784fdfb2bb43318f89b7a98d91cd1f', 1575194270, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '分页', 0);
INSERT INTO `log` VALUES ('dc82f930087a476fba5bd91b40bb2e6e', 1575211743, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('dcb636f3ae114b02b20ae36e306b18cb', 1575119113, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('dcd017778e1d424aa8b2fc8df6e41b0a', 1575211721, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('dcd3d09e190742e8937a5c4793015789', 1573634820, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 9, '退出登录', 0);
INSERT INTO `log` VALUES ('dcf40b7a59b34b4197de0f8527fa9b14', 1575202777, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '获取全部数据', 0);
INSERT INTO `log` VALUES ('dd02841f792e4b258519106a7f562b48', 1575118640, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部数据', 0);
INSERT INTO `log` VALUES ('dd046ea6c07b4bffaf09f00d4a48b86c', 1575211636, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('dd0a8aff31fe4341bdb725a9da39f687', 1573352063, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('dd1c7f8104ed48e695db2aee5d925310', 1578226540, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部数据', 0);
INSERT INTO `log` VALUES ('dd2242fd76604d9181dfe2107413636e', 1575292222, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 93, '分页', 0);
INSERT INTO `log` VALUES ('dd25d80891a247b7accc7ff29262d154', 1575183583, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 55, '获取全部数据', 0);
INSERT INTO `log` VALUES ('dd2854b43eaf42afaf1ed508b0c0074d', 1575183784, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('dd3555fdf0e74068957b5becbfba5411', 1575211636, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页', 0);
INSERT INTO `log` VALUES ('dd474b93ad604c6ca5008fa280dffc1e', 1573633197, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('dd62d10b0ce949129f0feb41b83fb535', 1575204649, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('dd6b368c742c4b15a77764f0914ed4a3', 1575193058, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部数据', 0);
INSERT INTO `log` VALUES ('dd75440d84154f0fb91c7f6ec6c82ba5', 1575293199, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 217, '分页', 0);
INSERT INTO `log` VALUES ('dd771ba15b6e44ab99902cd0d38abede', 1573636751, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 31, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('dd8514f93fd14c30882914f42982b4fe', 1575188076, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页查询权限', 0);
INSERT INTO `log` VALUES ('dd8f73e6083d4a4db5dc3b463af79146', 1575093917, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 99, '获取全部数据', 0);
INSERT INTO `log` VALUES ('dda361c0aee64867acb04a68a8bee588', 1583390169, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 69, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('de05937e44084c1597759b536c3cab77', 1575193295, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 44, '分页查询权限', 0);
INSERT INTO `log` VALUES ('de464ad5d9c846d1a7f52dd4ccf12cf8', 1574645913, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 100, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('de4f191efc72469082fae6a14cfb4372', 1574649763, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('de5cc8657f4a46aea9fa55b1d293630f', 1575114183, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 65, '获取全部数据', 0);
INSERT INTO `log` VALUES ('de7f466ab90343e3b845e44a95895bfb', 1581922658, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('de92d30dcbca4c08948e80726993d731', 1573355686, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('deac79ab69124b2891a8ec43e089d6cf', 1575293090, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 238, '登录', 0);
INSERT INTO `log` VALUES ('debba2473eb3406484c25ed51b83837f', 1575196696, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('def9522cfd2d44edbd8e8494045c4a89', 1575210763, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('df040c4a29404a7195fbec1f0a077d7a', 1578228593, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 224, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('df177eab3f77489893abd8176d465dc9', 1575114053, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('df2e6eb76a234e47b94c6d5d87c0a00a', 1575192397, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 35, '获取全部模块', 0);
INSERT INTO `log` VALUES ('df37b2d4685e440b87de9cbee3def570', 1575280043, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 89, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('df3819b20ada4a7abddcbcfb0c1127cd', 1575197122, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('df3fd1a57a614d418db30d1f19e6a9dc', 1578226551, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('df722b1982774b36aec217ee09e3fc6f', 1575193747, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 4, '退出登录', 0);
INSERT INTO `log` VALUES ('df79efa4c46c4ddbb932fed89b8aede0', 1575123673, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '获取全部数据', 0);
INSERT INTO `log` VALUES ('df96ab965f304d76bd6eacccc7779ffe', 1574648882, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 79, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('dfa239618da54a17911a48a8e985c6cb', 1575194499, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('e01433aec3c74344aa559d0367ab7fdb', 1573356333, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 15, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e01696ef4ca247f6a98db9d5930358cb', 1575123298, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 193, '登录', 0);
INSERT INTO `log` VALUES ('e03adf68e000471d8ec85982bdf7c5e4', 1573634208, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 242, '登录', 0);
INSERT INTO `log` VALUES ('e05494b8f12b4f07ad9f646951c08e53', 1575194457, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('e068ede7f00f4358a483ff3d50ff2f68', 1574650383, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('e0763e366821428684c5d3c86222f8a9', 1575194271, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部模块', 0);
INSERT INTO `log` VALUES ('e07a481af78c447583e148b14bba7b17', 1575190301, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 64, '获取全部模块', 0);
INSERT INTO `log` VALUES ('e081585e29f2442c8690bd918ff59292', 1575210006, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e081e4a7ba1648eca0fe8bd284b7b47d', 1575194422, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('e08cd20ed3564f97856ecf9fa63c0fb7', 1583390459, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 166, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('e09604b6d0784e629b05c0708754907c', 1573352324, 'http://127.0.0.1:8080/patrolItem/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 36, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('e09deb91b90343c886dfdceed2680822', 1575194404, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('e0fe0c18f8e84c00a2f11f07c996a4ae', 1578226551, 'http://127.0.0.1:8080/task/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 79, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('e11d38ca09e144478e5b90f4d7ff4526', 1575211723, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('e146134390a74e5598a977f1673b0216', 1573637650, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('e15a8aef02ac45009f23d9f50b399a83', 1575093869, 'http://127.0.0.1:8080/patrol/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 150, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('e15e95c8b6dd4d3b9b2960988a844a65', 1575190809, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 25, '获取全部模块', 0);
INSERT INTO `log` VALUES ('e1644b8a91cd496098312cd32105f48a', 1575206622, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 187, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e17c50ec924c4190b90fee304b2523c5', 1575292333, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('e1816e9803d24302b32ba56f85b1d327', 1575204645, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e1c40ce7ac3c4cfd8efec1ba971d7891', 1574646407, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 139, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('e1fac815c8fe49c3a8281000f2f08024', 1578226540, 'http://127.0.0.1:8080/area/all/line', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 610, '查询全部区域和对应的线路', 0);
INSERT INTO `log` VALUES ('e23e890998814cbba65812320b82e074', 1575196261, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 77, '分页', 0);
INSERT INTO `log` VALUES ('e240fd1ee2f044bda034ebd9b052436a', 1573640927, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('e267ef724935496eb7935a013020a528', 1575206097, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('e278b284000b4fb3ac95259c7164797a', 1575208168, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('e27cc435ec2d4cba9328a3435543dd7b', 1573353658, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 26, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e2c78fc445a2413fbbeb4f75bf4d4fe7', 1575191376, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 28, '分页查询权限', 0);
INSERT INTO `log` VALUES ('e2cc7ba56d91493da9bfeea29c63168e', 1573353930, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 25, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('e31d7895fe1f4f989c92a3897b185a36', 1575208419, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 164, '登录', 0);
INSERT INTO `log` VALUES ('e330046ede144014b561ac3e7d784762', 1575208915, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 55, '分页', 0);
INSERT INTO `log` VALUES ('e3a57205ed5e40f7b446fc4e44f9fe82', 1575282253, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页', 1);
INSERT INTO `log` VALUES ('e3adda87c47c483fbd32c42e11518cbf', 1581922605, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 191, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('e3d5bca636574753a634ad40a6c0d9a4', 1575113536, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 72, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('e3e778a8f0614078ac8d07900d742a68', 1575292259, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页', 0);
INSERT INTO `log` VALUES ('e3e7c987d10a4f14a0a1b875afe3da23', 1573477575, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 153, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('e4070e27128a4fe099667696b6728441', 1573352089, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e409860633974cb8b9024f3d711240d7', 1575209542, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 171, '分页', 0);
INSERT INTO `log` VALUES ('e4154dba7b3346fd80d29aa22a80e536', 1573354032, 'http://127.0.0.1:8080/atten/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 216, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('e443a00a65af4faf8a9a726b10185474', 1573637119, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 83, '登录', 0);
INSERT INTO `log` VALUES ('e44f87c6aadf4c7e93690bb0dcff3041', 1574650253, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('e477125d854e4027b7495269e5c7c2f4', 1575211730, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e49368ae87344beabe8950ecf9c4bc79', 1574648652, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 113, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('e497f7d67d624d3a8b01b3f2ed828d45', 1575197333, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('e4b71541eecd49999c1126d629b66101', 1575188463, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页查询权限', 0);
INSERT INTO `log` VALUES ('e4bd9de85f514a2aaf35ec627a951894', 1581922730, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('e4c2f0ec411540919da86d76d88a0ae7', 1580022400, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('e4ff145a39eb4f4bbc9baadef3904d20', 1573356187, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 57, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e50382ad45a3411c915a77c69166abe2', 1573352062, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('e50787594c0a46f191eeba7af85f80a3', 1573351697, 'http://127.0.0.1:8080/patrol/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('e50ad3314e9e4818a7804915d58559e6', 1580022410, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('e56c82c62ab343638ba3e4a541ba4c42', 1575196778, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('e56d3b59d62a4e1ba936b0257723f081', 1575198071, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 37, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e58151496ef547a4b7ab175288fab224', 1578307962, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 293, '登录', 0);
INSERT INTO `log` VALUES ('e581cb21862f4f0f87d1837f2dc907b2', 1575210218, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页', 0);
INSERT INTO `log` VALUES ('e58bb0b3f842465d97d31470d9d620ce', 1575191313, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 8, '退出登录', 0);
INSERT INTO `log` VALUES ('e59935f031c44500828e5fc71d1d8d12', 1575211192, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 257, '启用角色', 0);
INSERT INTO `log` VALUES ('e5c61703b56649c0bee7db40ae7619d7', 1573475275, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 4449, '登录', 1);
INSERT INTO `log` VALUES ('e5d206f1f1554e45aae84a607f9b7b7f', 1575211581, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('e5e01f98af9b4448b8845ca51d77f38c', 1575198051, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('e5e15a8534404613bab83257306aebdb', 1575199473, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('e61990d094b348d69c488aea0d06b4ab', 1578226530, 'http://127.0.0.1:8080/patrol/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 73, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('e61b9a1d4995439b8f329260f3a33aa3', 1575094044, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('e63df702719e4d3cbdbeb77965e79dc2', 1575205014, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 36, '启用角色', 0);
INSERT INTO `log` VALUES ('e667a7482f5a462c9b79523cb3bd8a5a', 1575119704, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('e6741c34ced84275a5cfae3469201377', 1575204568, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('e689907f0d6949b9bd0264b54e5eff09', 1578231023, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('e69050c2f5354dd7b4646f8fc1c9d33b', 1575200263, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('e69a04c0a0774046a0ee2ec6ebbaaf12', 1575208628, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e6abaebab07a4066bc2d16cfaddfa7dc', 1575094465, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 150, '登录', 0);
INSERT INTO `log` VALUES ('e6d72aa5ab6a47a89311a2817a95abcb', 1575194241, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页查询权限', 0);
INSERT INTO `log` VALUES ('e73dc6ea9da9443ab922a6093087f14a', 1575197045, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 22, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('e740fb1d938d4403bc5bf760cf8d7617', 1575113771, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 111, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('e74c3577c687457bb17d073700e58b61', 1578229594, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('e76e690314654c83b96d6438a360dae8', 1573353930, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 17, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e78a55566ba84063975524db58787ff3', 1575203859, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('e7c14996e61b4cf493966ec2b8723bbf', 1580023511, 'http://127.0.0.1:8080/area/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('e7f038fe0c0546eebd3688eeb84e08a8', 1575285785, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 194, '分页', 0);
INSERT INTO `log` VALUES ('e804e6dbd0904624bb9546ef9b42a297', 1580022342, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页', 0);
INSERT INTO `log` VALUES ('e8099526bd4d465ab933bbc9c008120b', 1575206263, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('e839d7168e8140c1ad9338370247cc69', 1575192120, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 31, '退出登录', 0);
INSERT INTO `log` VALUES ('e8493331cad34de89cc1c22ccbc1c455', 1573358306, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 310, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e87fc070adfa41adb1273eeb458d6393', 1575093917, 'http://127.0.0.1:8080/area/all/line', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 234, '查询全部区域和对应的线路', 0);
INSERT INTO `log` VALUES ('e89ac1a98cd94d73991289fc5d4ac4de', 1575211750, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('e8c33eb4234d4a8e9efac84ad0e251c3', 1575189399, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 132, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e8df6c424aa242eb9a27c166f533fc5e', 1573354031, 'http://127.0.0.1:8080/dept/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 4, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('e8e44ad9d1e749b9917115a2e677f896', 1575281530, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('e9205ab62ddf4b8999e267c3e520da21', 1573355380, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('e922ab5c0a1540fb990ca5ca94832bab', 1575123789, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('e96d2f1bad9a459c85999e5907a1c103', 1575211753, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e998e63ad4cc4d3187c73a8479913abb', 1575196854, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('e99b8c85f2f745f1a3850ea13bebc87d', 1575196261, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 55, '获取全部数据', 0);
INSERT INTO `log` VALUES ('e9b4e1fbf83e43138dfa31833dd31956', 1578308502, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 178, '分页', 0);
INSERT INTO `log` VALUES ('e9bc15549d324058bf1b0354b0437b2d', 1575203229, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('e9c23d607ee84a4da484216a1f88829a', 1583390439, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 41, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('e9dc6fc0a82f4ee3a0f50f48a70acfd2', 1578233457, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 196, '登录', 0);
INSERT INTO `log` VALUES ('e9e70e3115e74eafba98950870d89623', 1573356211, 'http://127.0.0.1:8080/log/all/26/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('ea0293d42cea45b993baccfdcdc461fc', 1575123541, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 32, '分页', 0);
INSERT INTO `log` VALUES ('ea0d56341712499c97a7321e2e8097df', 1575188442, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页查询权限', 0);
INSERT INTO `log` VALUES ('ea11680621bc4d938013072d7d6e8925', 1573355725, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ea22a1b964cc436d86efe6f9fb24a839', 1573352063, 'http://127.0.0.1:8080/point/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 91, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('ea2654292aba4c01846f978acc3e964d', 1573353328, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 2, '退出登录', 0);
INSERT INTO `log` VALUES ('ea4df95f2cc44b7fa70180f16afd612e', 1575114197, 'http://127.0.0.1:8080/line/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('ea81327f06af42a08bb683a40cdaedb3', 1575204358, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ea8e9d5aab894b599260525edceac911', 1575211636, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('eaab7a928dbc4f6abf990d12c841b36a', 1573351692, 'http://127.0.0.1:8080/equ/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('eac1579a17f94d94a8856978bfee26f5', 1574648662, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 218, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('eaca84c736e148efa4c334f11e5b6dde', 1575183332, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部数据', 0);
INSERT INTO `log` VALUES ('ead5ddd051d1424b8d8905cde75cb6d4', 1574645489, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 100, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('eae21ff071d440bc9cde20d2ff3b5913', 1575127893, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('eb1ccd7cc1e544a19703b4f7ee094b38', 1573637150, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 8429, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('eb2cdb6a7f3141adbf14d8d86c3974de', 1575126406, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('eb57c66a6fb0406b94be300d7438d55c', 1574650728, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('eb962f708d604315b51850f87f15e135', 1580022416, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('eb99ed2c203e4770b1c654d177312831', 1580023510, 'http://127.0.0.1:8080/area/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 80, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('eb9f40d1a9844991b4e08ac53b7efa56', 1574650884, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('ebafb3d8c49e40629bfd9dbc1dfb5e28', 1575211753, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ebb6a933423940a89747d7b0a69249cf', 1575205295, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 67, '启用角色', 0);
INSERT INTO `log` VALUES ('ebb9b221ca7641dabc8e9d08c0f3fdb5', 1580023065, 'http://127.0.0.1:8080/message/look/all', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 64, '标记已读', 0);
INSERT INTO `log` VALUES ('ebed560b718c42cdbe58a26dfdf45d96', 1575261296, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 24, '分页', 0);
INSERT INTO `log` VALUES ('ec209126b62d41b0a0cb7e75a6907c72', 1575196603, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 16, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ec2409ba1ead46ca837451afe0ca395a', 1578305028, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 478, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('ec3564d4301d4db089a6dcf9479fa312', 1575190153, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 121, '登录', 0);
INSERT INTO `log` VALUES ('ec86ada7452f48068d705d603a6b11fc', 1578230114, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 119, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('ec8c135478f14b219c24a4cc0f00218d', 1575199948, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('eca2919e71304cba8980a82d77b89b0e', 1573456511, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ecd3a448cb9d4b639cfe490ee4540330', 1575196255, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 155, '分页查询权限', 0);
INSERT INTO `log` VALUES ('eceeed11e29a4e39af55ce3f9f64a45e', 1575121966, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 68, '登录', 0);
INSERT INTO `log` VALUES ('ecf6b3f98e564a0fa04f29e219b9696c', 1578231113, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '分页', 0);
INSERT INTO `log` VALUES ('ed021c01ee7647b3a0b93e17c34dee20', 1573351692, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ed1fc04845554cdfa5f2f3acbbba34c0', 1573475454, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 619, '登录', 1);
INSERT INTO `log` VALUES ('ed41f35168554c7b9ff891ab38fd21b3', 1575211936, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('ed444b9d93ee43a6bf5460ae45f5fc83', 1575187637, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页查询权限', 0);
INSERT INTO `log` VALUES ('ed5bf3b0495049f2a7f20ef07c93b535', 1575182664, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 136, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ed659ff8658b4a21b531cc05dcddcb2d', 1575205014, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('ed6c8eb448984b9b9053d71a44da5506', 1575196854, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ed92e57708c84a6ebfa8cb3b0b6666ed', 1575192396, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 237, '分页', 0);
INSERT INTO `log` VALUES ('ed983a8debb9451192dd1788b163c95f', 1575211730, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('eda176fcddb0462783b702c0ee62df1f', 1583390451, 'http://127.0.0.1:8080/point/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 164, '获取全部数据', 0);
INSERT INTO `log` VALUES ('ee0d22a35a79446a94892abce29429b1', 1574607975, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 88, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('ee4ed150212748618dd472b392013f5e', 1575114165, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 208, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('ee5d9779c1704a2bbaf8cf6d1a84aa87', 1573355691, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ee6c70e85ca64a928c9241d8a70153c0', 1575194270, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ee79bb2ff89a40c286368ba6e043d2e6', 1574650556, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 48, NULL, 0);
INSERT INTO `log` VALUES ('ee8bf4ff456e45f284cc1fad0146c005', 1573354887, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('eefb059aaf3048acaa27d7d40378f9bb', 1575204933, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('ef033f20eb594967b4f5031c05cd25af', 1575113795, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 71, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('ef0f100bed0345cb8198ad42fcd0c200', 1578298051, 'http://127.0.0.1:8080/dept/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('ef30ee143fbc4ee7ac24bbba63003d04', 1574649818, 'http://127.0.0.1:8080/upload/admin/avatar', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 60, NULL, 0);
INSERT INTO `log` VALUES ('ef544c1dbd6047a3938033c29c92b934', 1575281225, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('ef6fe33363374267aebe98ae6d953c41', 1574649559, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 112, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('ef8cc2b0b0354c438327e7b0d53fb79e', 1575183383, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('ef92b558206746cb95a23253e8d122cc', 1575203821, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '分页', 0);
INSERT INTO `log` VALUES ('efa2ab25bc224c3da0fefed347f0b5b0', 1573355116, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 9, '退出登录', 0);
INSERT INTO `log` VALUES ('efa831b5bc1d4030a55aa15d86190478', 1575281155, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 98, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('efa94f732b32485dac08765131e6f564', 1575123799, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('efb019e8aca045acb6a1e7443565e8f8', 1575196774, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('efb92788a69c40c99dc09d37543ee221', 1580022204, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 674, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('eff8c89a5cd54838bb1e8174a3a06557', 1575202970, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('f073c346d73a4f01bd80561ee6b85fc1', 1575183082, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f07abf35279e4a3f95bf7ca891c1bfde', 1581922620, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f0905db4506844acad78fa89939141ab', 1573358306, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 324, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f098b08cd20f480caa238cf28d855362', 1581922662, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 101, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('f09b180deab04a96afebeda044f87e6a', 1575209981, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('f0ad199f7d4141d8a65138a3c00aed39', 1575113771, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('f0b38e0de78746c3bc54208330e5a756', 1573636739, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 140, '登录', 0);
INSERT INTO `log` VALUES ('f0b945623eac461ab93c6fa5cd03d6a7', 1580022312, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 53, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('f0babd997e0c47eeb074317c949848ef', 1575114170, 'http://127.0.0.1:8080/message/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('f0c015c2b2a34ddcb1841df99761aa0e', 1575199744, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('f0c655e64de44de39288c7ccef11b840', 1575093930, 'http://127.0.0.1:8080/point/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 79, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('f0cc1fcd52c140f29acac89a4a01dbd1', 1578298051, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f0dacb1983934436b41363621541c1e5', 1575181750, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 196, '分页', 0);
INSERT INTO `log` VALUES ('f10a5ddf91c749f794185d8b5c1af655', 1578308479, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 252, '登录', 0);
INSERT INTO `log` VALUES ('f121dc0f5e00419d8d2978322caa5373', 1574607924, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 206, '登录', 0);
INSERT INTO `log` VALUES ('f15d15bebb344484aacdb6be8de7af53', 1573358246, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 4, '登录', 0);
INSERT INTO `log` VALUES ('f171223659944c1893146adcd79ec194', 1575189399, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 425, '分页', 0);
INSERT INTO `log` VALUES ('f18c6a56ec5841f2b728c3128d8492ce', 1575211750, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f19183f370d74f609e3c0aba02e91f22', 1575196778, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('f1c2b7da454048a79a59f6a84c874edf', 1575210862, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f1c5d2c9eb9b4508b48fd5c88e6545f0', 1575193971, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 6, '退出登录', 0);
INSERT INTO `log` VALUES ('f1de2dd7209048768dd4831d225b3268', 1575188143, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页查询权限', 0);
INSERT INTO `log` VALUES ('f1ecfad2f500466e8efb74891ae5dbfc', 1575203229, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f2053ef88eb8406d8eaf443322ab38e7', 1575095549, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('f20eacf6d4644775ba0e4b016322cdbf', 1575192613, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 27, '获取全部模块', 0);
INSERT INTO `log` VALUES ('f21c3091780f4c49a1c8ff4d6d687e1b', 1575203229, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '分页', 0);
INSERT INTO `log` VALUES ('f24f879fcc4741fa8bf8e589c4f54934', 1575212163, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f25c83028fa34083a97f58bf9928827a', 1578230114, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f25dd43866474b7eb239217f3a1b049d', 1575212024, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('f2625ab50829430e8d4d7e23e9a817a1', 1573477578, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '获取当前登录的admin基本信息', 1);
INSERT INTO `log` VALUES ('f26eb6809343445eb3e54aa1233d2808', 1575282221, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 5, '退出登录', 0);
INSERT INTO `log` VALUES ('f271dec710704ead9923fb27b5d944c8', 1574645803, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 37, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('f274d6ec9139432f9b64107ee2fb405d', 1575196825, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f281b409e84a45d8b473c9b938b4f446', 1573351692, 'http://127.0.0.1:8080/equFail/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('f29140431d804f88b90cc9724b2b4819', 1581922637, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 84, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('f2a06dd6bd2a42f68791676228b47298', 1575189328, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 28, '退出登录', 0);
INSERT INTO `log` VALUES ('f30adb38c67640c4997e7de3f473defa', 1573356982, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 5, '登录', 0);
INSERT INTO `log` VALUES ('f33c08be7e204b15be962189c2180ed3', 1575211862, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '分页', 0);
INSERT INTO `log` VALUES ('f33dbee06ce3417abb5fc7d81f149a06', 1573352060, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f34449b128de46008c541f65bd458165', 1580022323, 'http://127.0.0.1:8080/admin/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 70, '更新一个admin', 0);
INSERT INTO `log` VALUES ('f34e30da039f4b6590ec502fe30df58e', 1575193042, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f361aec2d7b04baf97f2c9d1318cac86', 1575121293, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 95, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f364dbad62ad4a59a1620bdf9fb7b29f', 1575182345, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 88, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f3d47eb706634e38970f35997c2392dd', 1573355725, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f3df40c638f74364bc5c88765c9607ff', 1573484189, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18731, '获取当前登录的admin基本信息', 1);
INSERT INTO `log` VALUES ('f3fb33c7927346fdb50ee1bb1f38712a', 1575294426, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 65, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('f3fd7c6cc2f14d748b7411786d866687', 1575203229, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 61, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('f405adfa398e42fc9c820e54a63ed6d5', 1578231038, 'http://127.0.0.1:8080/log/all/224/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 101, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('f405b4f80064417fb5f9b2cc7caa1093', 1575206619, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 48, '获取全部模块', 0);
INSERT INTO `log` VALUES ('f4385e37b43345048ab6b565133f659b', 1573355780, 'http://127.0.0.1:8080/log/all/3/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 6, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('f43c2ae8522b4352ba1db06bc540cfe8', 1575211746, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('f48984ba20fa4b5b832c53a8c5f37c45', 1581922438, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 114, '登录', 0);
INSERT INTO `log` VALUES ('f4978584b0a14282b2d55730fa389e8e', 1575294513, 'http://127.0.0.1:8080/admin/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 71, '更新一个admin', 0);
INSERT INTO `log` VALUES ('f49ed6246af040f0b04d336386087e45', 1575281498, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页', 0);
INSERT INTO `log` VALUES ('f4a4c93eda0742dcb9b50d44d1fc139c', 1575093249, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 131, '登录', 0);
INSERT INTO `log` VALUES ('f4bf28c45dd949b0840e0826d38ce2f0', 1575205195, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '分页', 0);
INSERT INTO `log` VALUES ('f4ed77dfbd374caa9cbf79b92524fb23', 1575194519, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f4f80149459b45e0bc67c4446cfcdbb0', 1575201248, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f4fedff523464c8ab4abfe234faaae41', 1575210763, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f5026036d649457899e4e199725fb8bf', 1573484171, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 6, '退出登录', 0);
INSERT INTO `log` VALUES ('f50dce9d096541a2b0b99e93061dd3b2', 1575196783, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('f510a91773f6488aa2e6f6b40d51791e', 1575123767, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f512452309824782813c7e62c7985721', 1575208429, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 38, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f54783c9e99748d7bf34bc53a436d062', 1575210006, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('f553ac1c51b9430198f8c1c596fec92c', 1575123792, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f56bb1f882ea4c86b77b58a40fa34fa8', 1573353151, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 132, '登录', 0);
INSERT INTO `log` VALUES ('f578a74c56314c41a60a82d48216950e', 1580023852, 'http://127.0.0.1:8080/patrol/save', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 97, '插入一条数据', 0);
INSERT INTO `log` VALUES ('f59a1250c9d74e64aae92d3176315365', 1575193023, 'http://127.0.0.1:8080/point/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 130, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('f5bb1cb4d0ad4541960dadb1a8cb85e0', 1575293363, 'http://127.0.0.1:8080/admin/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 136, '分页', 0);
INSERT INTO `log` VALUES ('f5f49f1a65994bf4a9ef1f5e4280e5ce', 1575261796, 'http://127.0.0.1:8080/staff/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 54, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('f5f59dd722ce401aa73ac10486855477', 1575204964, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f5fd85aa1ac1463d90ec084d76f01022', 1575196274, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f62a7b426013402eb0b6158d56199a21', 1575182985, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f62ba8d1fadd4a7f8c463b4675399d5d', 1580023127, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f64f83416daf4c1683c572fb06fffd86', 1575194499, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f66f5f92a9534267af73330a1a219c06', 1575118886, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f67bbd65d9a94a7e8a5f89dd06a24686', 1575199744, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('f6837ea9ee464985b0a8d41bc6948636', 1575199769, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 39, '分页', 0);
INSERT INTO `log` VALUES ('f69f0df7c6a74de88b50132254f43e22', 1575119286, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f6b0dd4c963c49bf94ded599faf7b65e', 1575203556, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 26, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f6d1d0c191024afd88ed72487aa20174', 1575199473, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '分页', 0);
INSERT INTO `log` VALUES ('f6dd30023b8944fd833a5577476ac421', 1573354026, 'http://127.0.0.1:8080/staff/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1f', 176, '通过id更新一条数据', 0);
INSERT INTO `log` VALUES ('f6fef700a1754a7f805927c4b605ab5f', 1573635177, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 12, '登录', 1);
INSERT INTO `log` VALUES ('f6ff722dc3b24d5abd42ec6627500375', 1575095305, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('f7030903c67b41338a11c2d8c1db0239', 1574648783, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 20, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('f7064b2762ea4375b8d53b8c9bcac4a1', 1575194453, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f72e835f92c44af5918ad0582d6c81df', 1578228581, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 505, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f74b1917e2504549b1a44f50eab8ca20', 1575210229, 'http://127.0.0.1:8080/roles/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 258, '启用角色', 0);
INSERT INTO `log` VALUES ('f76bb210c8e949aa93537c500b78c3ac', 1575123683, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 41, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f78e3cf72d274397b18d761d28ebd029', 1580023541, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('f7c8546fe4f8429eafeb35a48973b9c8', 1575204840, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 113, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f7e1437314394e7d8fa04c5a4045b758', 1575201248, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f7eda34379c3446f891c4d8d16e51267', 1575211193, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '分页', 0);
INSERT INTO `log` VALUES ('f7f44923598e4ff59947332ef8931721', 1575211644, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f8413a76118f458c83f858b80f4114fb', 1573640923, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('f8795ea8049840c788db9ac7103d9670', 1573637732, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('f8c40102bcbc4820927544e6b03e4e3b', 1580022410, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 65, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('f8f395832c3344218dc7f16747dd7842', 1573353658, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 34, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f8f8ba339a31489091a278d26a02703a', 1573354000, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 29, '获取全部数据', 0);
INSERT INTO `log` VALUES ('f924936f2a4e4371bcae1418e2cb8d50', 1581922445, 'http://127.0.0.1:8080/index/header/data', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 556, '获取首页header部分的数据', 0);
INSERT INTO `log` VALUES ('f92bf694007647dd9e743e96ff700168', 1575184050, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f92faba963b94bac987afd69d3a24dad', 1575124177, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f93bc9a75288434299cd94f82586618c', 1575201057, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('f949ef97a9dd47e0acb2ce06805007e2', 1575113526, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('f971ee87906748efaccb28dcc179bd31', 1575198071, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 10, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('f9b816b3785e43ed9124ec571555bfbe', 1573637927, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('f9b98f87f8c84025812f3907b60480c8', 1575198051, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 71, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('f9c8762ef8d64468a07048302838fdfc', 1573637466, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('f9c9e4e23564424d8681058778a83f9f', 1575190125, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 5, '退出登录', 0);
INSERT INTO `log` VALUES ('f9db65213624466baae565bb021ad3d7', 1573357128, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 0, '退出登录', 0);
INSERT INTO `log` VALUES ('f9e56bee4f7148529d6ea0b92499615d', 1574648619, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 13, '退出登录', 0);
INSERT INTO `log` VALUES ('f9f06135add546ec833751c9d0bf29a1', 1575209951, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 19, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('f9fe3c57df5b405295d4cdcca6ff0812', 1573351620, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('f9fe5d3903e14d5cb121bd01ce7ed43d', 1575194239, 'http://127.0.0.1:8080/permission/1/10/sys:data:report:read', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '搜索分页查询权限', 0);
INSERT INTO `log` VALUES ('fa20e2291d9443a6a82f630210413307', 1578231053, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部数据', 0);
INSERT INTO `log` VALUES ('fa9d8ecc4f8e47e88b19ab405a1527ef', 1575206343, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '分页', 0);
INSERT INTO `log` VALUES ('fb0be86df24e430d887c43d71500842e', 1573353321, 'http://127.0.0.1:8080/line/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('fb156d1672f1429e9b03bb4474ae7c0d', 1580023517, 'http://127.0.0.1:8080/area/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '获取全部数据', 0);
INSERT INTO `log` VALUES ('fb29043dbdc5473f9eea34685a281d75', 1573637588, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('fb2cbbc5c1f345f395ae41a5836ec857', 1578226540, 'http://127.0.0.1:8080/task/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 302, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('fb412945906747c48530b41e09292353', 1578307990, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 11, '分页', 0);
INSERT INTO `log` VALUES ('fb45ab08dad34449a46cf594a6836020', 1575123706, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('fb4cd1fc40cc4eb19272936b2ff4f56f', 1573484740, 'http://localhost:8080/admin/login', '127.0.0.1', 1, NULL, 794, '登录', 0);
INSERT INTO `log` VALUES ('fb9ca31269d4443cae149051eb507d18', 1575113749, 'http://127.0.0.1:8080/admin/info/update', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 79, '更新当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('fbd2fb69746345ee9f4167bb3ef5cf8e', 1575128997, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 15, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('fbdc7619485a4637bea0369b3f09d203', 1575196733, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取全部数据', 0);
INSERT INTO `log` VALUES ('fbe74cfcd9bd4db89482fe77fcdb705c', 1580023417, 'http://127.0.0.1:8080/roles/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取所有的角色信息', 0);
INSERT INTO `log` VALUES ('fbfb5d8341af4970a0ce07c6c87ac57e', 1583390451, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('fc1d9b7b6554400eb1bb5cc34e81ba1d', 1574646100, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('fc3d94adcee74e7999455cbe4e1b8d0c', 1575119598, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 2, '获取全部数据', 0);
INSERT INTO `log` VALUES ('fc47cab09d914df99f361b3c59d4a1af', 1574650923, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('fc5be4a841ab4fbe8435ae908c27405e', 1573355544, 'http://127.0.0.1:8080/patrol/save/batch', '127.0.0.1', 1, '18a7560ad0124394bbdddfccea485c1e', 365, '批量插入数据', 1);
INSERT INTO `log` VALUES ('fcb8e51412894ed7bc2e727d91cd79d1', 1575113680, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 6, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('fcd2b7262aa3410eb5c74e102ac61f5b', 1573355473, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 1, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('fcdcc6a59bd14dbab324d3a6a7f4980b', 1578308507, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '分页', 0);
INSERT INTO `log` VALUES ('fcf1fb574300453d8ed93c2753fef971', 1575182884, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 41, '分页', 0);
INSERT INTO `log` VALUES ('fd1a667e01784ad295b033263b97123d', 1575206089, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 18, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('fd1e786344ae44489f51f0b9b93b50fb', 1575210763, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '分页', 0);
INSERT INTO `log` VALUES ('fd29292b360141339a72b02f80bf2a0a', 1573354932, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1f', 2, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('fd586f031cea4815ab83dfa274a10185', 1575123706, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('fd862cdad3f34379a93fc5f3a8333986', 1575203146, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 8, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('fdaad296a14e45b19cba2f27fe7cdc91', 1575119887, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部数据', 0);
INSERT INTO `log` VALUES ('fdd6ce656c4645388989b7bb61c19d53', 1575182510, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('fe04cad1e6e9469ebe66fcec8e642590', 1575199954, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 3, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('fe3f50a9aacf4255ae598fd9d6de453e', 1575194419, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 5, '获取全部数据', 0);
INSERT INTO `log` VALUES ('fe413babf6dd438cb4e913e74d030d34', 1575196490, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 21, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('fe559de316d8471bab71add7cb1d5212', 1581922606, 'http://127.0.0.1:8080/patrolItem/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 79, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('fe7d87c306534be4a70586be4956b574', 1573351695, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 14, '获取全部数据', 0);
INSERT INTO `log` VALUES ('fe9ded747467454a9057a633dc4060ab', 1573353310, 'http://127.0.0.1:8080/line/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 100, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('fe9f18feb0af4b45aa7e26ec093fde64', 1575204280, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页', 0);
INSERT INTO `log` VALUES ('feafa15244e14b539412345918b2df31', 1575187633, 'http://127.0.0.1:8080/permission/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 72, '分页查询权限', 0);
INSERT INTO `log` VALUES ('feb5e147e1614da99ca18050b71f3156', 1575113626, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 17, '获取当前登录的admin基本信息', 0);
INSERT INTO `log` VALUES ('fece04165593491ca3e0af721f4a6a57', 1575123836, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 13, '获取全部数据', 0);
INSERT INTO `log` VALUES ('fee61bb041204ee0bda037f5d3256c4e', 1575182319, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 34, '分页', 0);
INSERT INTO `log` VALUES ('ff1093fe1c194f1e99dea1fcbcb09a6d', 1575194019, 'http://127.0.0.1:8080/module/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 30, '获取全部模块', 0);
INSERT INTO `log` VALUES ('ff1cf731ccb7409bbb7a2a00e3425ccf', 1573635427, 'http://127.0.0.1:8080/admin/login', '127.0.0.1', 1, NULL, 15, '登录', 1);
INSERT INTO `log` VALUES ('ff2bf12b729949bfacc1e759c53ab7f5', 1575212163, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 9, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ff2eaad7d47943a995ce01245de873cf', 1575206592, 'http://127.0.0.1:8080/admin/logOut', '127.0.0.1', 1, NULL, 4, '退出登录', 0);
INSERT INTO `log` VALUES ('ff36bb6467e4454693b9e3467ae62f7a', 1575117742, 'http://127.0.0.1:8080/log/all/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 7, '分页获取全部数据', 0);
INSERT INTO `log` VALUES ('ff836c4e61614bd9bd0546edd13fd0b0', 1575211889, 'http://127.0.0.1:8080/permission/all/tree', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 23, '获取全部权限，以 tree 显示', 0);
INSERT INTO `log` VALUES ('ff9053edab1148f4af1ca3da2613d866', 1575093920, 'http://127.0.0.1:8080/admin/info/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部admin基本信息', 0);
INSERT INTO `log` VALUES ('ff9fcf6ee461486eb16af7f0e38fa0b2', 1575194428, 'http://127.0.0.1:8080/staff/all', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 4, '获取全部数据', 0);
INSERT INTO `log` VALUES ('ffc48df9799d4436a45104437f600807', 1575206647, 'http://127.0.0.1:8080/roles/1/10', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 28, '分页', 0);
INSERT INTO `log` VALUES ('ffd08e1b4b9a4911ac5591245d621359', 1574650111, 'http://127.0.0.1:8080/admin/info', '127.0.0.1', 0, '18a7560ad0124394bbdddfccea485c1e', 12, '获取当前登录的admin基本信息', 0);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `mess_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mess_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mess_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mess_time` int(10) NULL DEFAULT NULL,
  `mess_stat` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`mess_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('asdfsafasaaadfsa', '俊安', '希望开设更多的功能', 1572008943, 1);
INSERT INTO `message` VALUES ('asdfsafasaayfthgadfsa', '俊安', '希望开设更多的功能', 1572008943, 1);
INSERT INTO `message` VALUES ('asdfsafasaayfthgaghjkgjgfdfsa', '俊安', '希望开设更多的功能', 1572008943, 1);
INSERT INTO `message` VALUES ('asdfsafawerqwsaayfthgadfsa', '俊安', '希望开设更多的功能', 1572008943, 1);

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module`  (
  `module_id` int(10) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module_parent` int(10) NULL DEFAULT NULL,
  `module_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES (1, '数据管理', 'data', NULL, '数据管理', 1575185836);
INSERT INTO `module` VALUES (2, '巡检管理', 'patrol', NULL, '巡检管理', 1575185836);
INSERT INTO `module` VALUES (3, '告警管理', 'fail', NULL, '告警管理', 1575185836);
INSERT INTO `module` VALUES (4, '系统管理', 'system', NULL, '系统管理', 1575185836);
INSERT INTO `module` VALUES (5, '日常管理', 'daily', NULL, '日常管理', 1575185836);
INSERT INTO `module` VALUES (6, '消息管理', 'message', NULL, '消息管理', 1575185836);
INSERT INTO `module` VALUES (7, '其他管理', 'other', NULL, '其他管理', 1575185836);
INSERT INTO `module` VALUES (8, '巡检报告', 'report', 1, '巡检报告', 1575185836);
INSERT INTO `module` VALUES (9, '巡检报告项', 'report_item', 1, '巡检报告项', 1575185836);
INSERT INTO `module` VALUES (10, '巡检计划', 'plan', 2, '巡检计划', 1575185836);
INSERT INTO `module` VALUES (11, '区域管理', 'area', 2, '区域管理', 1575185836);
INSERT INTO `module` VALUES (12, '线路管理', 'line', 2, '线路管理', 1575185836);
INSERT INTO `module` VALUES (13, '点位管理', 'point', 2, '点位管理', 1575185836);
INSERT INTO `module` VALUES (14, '设备管理', 'equ', 2, '设备管理', 1575185836);
INSERT INTO `module` VALUES (15, '设备异常', 'equ_fail', 3, '设备异常', 1575185836);
INSERT INTO `module` VALUES (16, '设备故障统计', 'equ_fail_', 3, '设备故障统计', 1575185836);
INSERT INTO `module` VALUES (17, '角色管理', 'role', 4, '角色管理', 1575185836);
INSERT INTO `module` VALUES (18, '权限管理', 'permission', 4, '权限管理', 1575185836);
INSERT INTO `module` VALUES (19, '系统设置', 'system_setting', 4, '系统设置', 1575185836);
INSERT INTO `module` VALUES (20, '日志管理', 'system_logging', 4, '日志管理', 1575185836);
INSERT INTO `module` VALUES (21, '部门管理', 'dept', 5, '部门管理', 1575185836);
INSERT INTO `module` VALUES (23, '考勤签到', 'atten', 5, '考勤签到', 1575185836);
INSERT INTO `module` VALUES (24, '人员管理', 'staff', 5, '人员管理', 1575185836);
INSERT INTO `module` VALUES (25, '绩效考核', NULL, 5, '绩效考核', 1575185836);
INSERT INTO `module` VALUES (26, '留言管理', 'message', 6, '留言管理', 1575185836);
INSERT INTO `module` VALUES (27, '反馈管理', 'feedback', 6, '反馈管理', 1575185836);

-- ----------------------------
-- Table structure for patrol
-- ----------------------------
DROP TABLE IF EXISTS `patrol`;
CREATE TABLE `patrol`  (
  `patrol_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '巡检报告表编号',
  `patrol_time` int(10) NULL DEFAULT NULL COMMENT '巡检报告提交的时间',
  `patrol_task` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应的巡检任务（由管理员发布的巡检任务编号）',
  `patrol_statu` tinyint(4) NULL DEFAULT NULL COMMENT '巡检情况  0：正常     1：异常     2：紧急异常',
  `patrol_staff` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该巡检报告的提交人',
  `patrol_deal` tinyint(4) NULL DEFAULT 0 COMMENT '该报告是否已经处理（如果有异常） 0：未处理   1：待处理    2：已处理',
  PRIMARY KEY (`patrol_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patrol
-- ----------------------------
INSERT INTO `patrol` VALUES ('17313fa355b54414976c', 1557739992, 'ed1f3bc372574120ac77', 2, '1', 2);
INSERT INTO `patrol` VALUES ('1c254ca2559149eda310', 1557739704, 'ed1f3bc372574120ac77', 0, '1', 1);
INSERT INTO `patrol` VALUES ('20184df8205a44199353', 1557741247, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('21003979f7c24aa3aceb', 1557738490, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('21c941c7eb9d46888a1b', 1558011857, 'abd7cb1fb73a49ff8645', 0, '1', 0);
INSERT INTO `patrol` VALUES ('23904c6c75e94d5bb395', 1557741154, 'ed1f3bc372574120ac77', 0, '1', 0);
INSERT INTO `patrol` VALUES ('25e353f5bb39483c897a', 1575093883, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('2705a5f1f9d24706b82e', 1557741247, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('279c1e46f9104d608d82', 1557739620, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('27fde8dd849d47e2956e', 1557739387, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('2c3d223b409440d286a5', 1557736164, '87c7eb56b04b4b628ae4', 2, '1', 0);
INSERT INTO `patrol` VALUES ('30e798c177344e98bdc1', 1557739386, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('329d034707c44f77b81f', 1557739190, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('34d28ba4faa34f36b560', 1557740218, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('3699359b7c12490eaf6c', 1557739992, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('36b5f26583df48e997e1', 1557739060, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('39ddbdb2a1a64bd385cd', 1557921324, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('3a2b2712546847b1a0c2a8ef4d2d4cb9', 1571112000, 'asfsaddf', 2, '1', 0);
INSERT INTO `patrol` VALUES ('3b4ce76c4f6642edac5d', 1557739949, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('3d8c3236d1b04fd19a2f', 1557739622, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('4393f3427bab4b5f9ad1', 1557740944, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('4474b7bb6116435aa409', 1557740944, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('45f4c1df7f8448d0bdcd', 1557740944, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('4b810a7f8f9242cfb6e8', 1557738247, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('4d91aa73799b4c4d83ba', 1557741543, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('4fb5ab721e3d4d119269', 1557738331, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('521c12a83e5046e58d0d7a20f9f8dd0f', 1571112000, 'sdfasd', 0, '1', 1);
INSERT INTO `patrol` VALUES ('54c4772cf205421abf4ebaf2f7f4fbec', 1571580213, 'ssssss', 0, '1', 0);
INSERT INTO `patrol` VALUES ('54de2a95040949939c5d', 1557739949, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('58447da6859d4155b8b2', 1557740944, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('5845ffcd129a4d85b577', 1557740218, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('5bcb0018818c445bac36', 1557738246, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('5de3077a26e643558d01', 1557739389, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('5e2f7454c2d742a088b0', 1557741542, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('60338c55baa544a69e18', 1557739061, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('60e903e6bea84037b7d0', 1557739992, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('651db590895242dfa24a', 1557736164, '87c7eb56b04b4b628ae4', 2, '1', 0);
INSERT INTO `patrol` VALUES ('6690cefee0964d0f9126', 1557739178, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('67e8800a91974bdea77222fa28dd4e09', 1571025600, 'asdfsda', 0, '1', 0);
INSERT INTO `patrol` VALUES ('68449d37336346309c2836bbe593001c', 1571025600, 'sdfsad', 0, '1', 0);
INSERT INTO `patrol` VALUES ('6ad43d701f9340d69efc', 1557739703, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('6b96936d11954aabb0b7', 1557738331, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('6c010f24f4844d229999', 1557741154, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('6e732f1cb8704ab2a6ee', 1557741543, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('6e96cb884976418faeac', 1557736164, '87c7eb56b04b4b628ae4', 2, '1', 0);
INSERT INTO `patrol` VALUES ('6f8de549d50a4aeda6d6', 1557741154, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('717dc07de48a48b88b4f', 1557739178, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('79e70797af674ca8a5b4', 1557741154, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('7c06441bbb79419691f3', 1557739178, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('7c96c902edde492fabec', 1557738330, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('7cd1b01762f742f5a8b29513bf8d5fb9', 1571569092, 'sssssssssssss', 0, '1', 0);
INSERT INTO `patrol` VALUES ('7efc1b5c0e0e4874845f', 1557741154, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('8533eae2c9fc4bf68312', 1558011858, 'abd7cb1fb73a49ff8645', 2, '1', 0);
INSERT INTO `patrol` VALUES ('89a4b0aea4df4902816c', 1557739992, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('8c66648228354795a44b', 1557738434, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('8db2afcf79bf444caed7', 1557739533, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('949dec1869934cce9a75', 1557741542, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('98ff95d2037a414896b4', 1557739137, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('9e347c8b057a4e80b694', 1557739934, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('a35ef0c59580445c9586', 1557739623, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('a550822398d74b219df9', 1557738434, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('a693ba8985ae47ada280c7807edf2ef6', 1571716800, 'asdfsd', 2, '1', 0);
INSERT INTO `patrol` VALUES ('ad8eb9d0b11a42679ff6', 1557921324, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('b03c6022c6b346c190a1', 1557739152, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('b2afa7d1b08f41a3be47', 1557921323, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('b5bb90d96222433586e7', 1558011858, 'abd7cb1fb73a49ff8645', 2, '1', 0);
INSERT INTO `patrol` VALUES ('bb63a6f358004caab508', 1557739039, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('bd53ed0d964041f5abc0', 1557738434, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('be0ac30154c84a92a4a9', 1557738247, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('bf53cd83baa447938511', 1557741542, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('c26878d1cbc643c5bffe', 1557736164, '87c7eb56b04b4b628ae4', 2, '1', 0);
INSERT INTO `patrol` VALUES ('cb6811c709674237a351', 1557739706, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('cf2fa230b3d54050b871', 1557738247, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('d0a1e0665f3d421ba99112e94aac7712', 1557738330, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('d5c401f6f884459995a0', 1557739949, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('e41fce39a6674e55a091', 1557739992, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('e6efd40863d94c5581c5', 1557738330, 'ed1f3bc372574120ac77', 2, '1', 0);
INSERT INTO `patrol` VALUES ('fe7062146cdd40aa9ccb4354486958e3', 1578456000, 'sdfa', 0, '2', 1);

-- ----------------------------
-- Table structure for patrol_item
-- ----------------------------
DROP TABLE IF EXISTS `patrol_item`;
CREATE TABLE `patrol_item`  (
  `item_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对巡检报的每一项的保存',
  `item_patrol` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应的巡检报告id',
  `item_question_id` int(3) NULL DEFAULT NULL COMMENT '巡检报告的问题编号',
  `item_question_select` int(2) NULL DEFAULT NULL COMMENT '巡检报的问题选中项',
  `item_question_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patrol_item
-- ----------------------------
INSERT INTO `patrol_item` VALUES ('017401de6d844ac895f1', 'fef7108032ab4370aa0b', 10, 2, 'ok');
INSERT INTO `patrol_item` VALUES ('03664dcd30304dcc93b0', 'a8a29d524a044c4a996c', 5, 2, '。。');
INSERT INTO `patrol_item` VALUES ('04775f2a811941b6845f', 'b2afa7d1b08f41a3be47', 12, 1, '');
INSERT INTO `patrol_item` VALUES ('0666d30ae78045e0bdef', '39ddbdb2a1a64bd385cd', 2, 2, '');
INSERT INTO `patrol_item` VALUES ('07f4998c72a04258bcb7', 'fa6bb633c1e340c6bb90', 2, 2, '');
INSERT INTO `patrol_item` VALUES ('08087dcff59148428a2c', 'b2afa7d1b08f41a3be47', 7, 2, '');
INSERT INTO `patrol_item` VALUES ('0a55a4c89e2d4cc48e5a', 'fa6bb633c1e340c6bb90', 7, 0, '');
INSERT INTO `patrol_item` VALUES ('0ac116b6592d41cea3a3', 'ad8eb9d0b11a42679ff6', 7, 2, '');
INSERT INTO `patrol_item` VALUES ('0acae7c8672d435993d8', 'fa6bb633c1e340c6bb90', 9, 2, '');
INSERT INTO `patrol_item` VALUES ('0bb4603daaf049b9bea7', 'b5bb90d96222433586e7', 12, 2, '');
INSERT INTO `patrol_item` VALUES ('0bd6022d8b78468c9ac3', 'b2afa7d1b08f41a3be47', 6, 2, '');
INSERT INTO `patrol_item` VALUES ('0c6a577aaac0456eba1f', 'fef7108032ab4370aa0b', 9, 2, '');
INSERT INTO `patrol_item` VALUES ('0c80dc043c5e4e2da29a', '21c941c7eb9d46888a1b', 3, 2, '');
INSERT INTO `patrol_item` VALUES ('0cbd13afc56b48dabe69', 'b5bb90d96222433586e7', 5, 2, '');
INSERT INTO `patrol_item` VALUES ('0d8d09bad48940329b5c', '21c941c7eb9d46888a1b', 9, 2, '');
INSERT INTO `patrol_item` VALUES ('1898115f1ebe4e51b503', 'a8a29d524a044c4a996c', 7, 2, '');
INSERT INTO `patrol_item` VALUES ('18f54d95871e403381bd', '8533eae2c9fc4bf68312', 9, 2, '');
INSERT INTO `patrol_item` VALUES ('1a78837b188149d7a1e7', '21c941c7eb9d46888a1b', 4, 2, '');
INSERT INTO `patrol_item` VALUES ('1da045561a08428f8daf', 'b0d5ef8667ac46fb9466', 8, 2, '');
INSERT INTO `patrol_item` VALUES ('1e1958983ee447b9a4df', 'fa6bb633c1e340c6bb90', 10, 2, '');
INSERT INTO `patrol_item` VALUES ('1eb7954c29414b8b9a56', 'a8a29d524a044c4a996c', 9, 2, '');
INSERT INTO `patrol_item` VALUES ('20a04cabecd945dba130', '39ddbdb2a1a64bd385cd', 1, 2, '');
INSERT INTO `patrol_item` VALUES ('23484c1088874438845b', 'fef7108032ab4370aa0b', 5, 2, '');
INSERT INTO `patrol_item` VALUES ('26d16baf1378408ea6fa', '8533eae2c9fc4bf68312', 11, 2, '');
INSERT INTO `patrol_item` VALUES ('2a6ed368e0c34d939936', 'fa6bb633c1e340c6bb90', 12, 2, '');
INSERT INTO `patrol_item` VALUES ('2be38da578164e4fb4ce', 'ad8eb9d0b11a42679ff6', 1, 2, '');
INSERT INTO `patrol_item` VALUES ('2eec6cf957b041cd93ec', 'b5bb90d96222433586e7', 2, 2, '');
INSERT INTO `patrol_item` VALUES ('2fabeb9652fa4ee7aec2', 'fef7108032ab4370aa0b', 1, 2, '');
INSERT INTO `patrol_item` VALUES ('320874ef70404b23ae33', 'b2afa7d1b08f41a3be47', 2, 2, '');
INSERT INTO `patrol_item` VALUES ('330099b915d74b33ad83', 'b5bb90d96222433586e7', 9, 2, '');
INSERT INTO `patrol_item` VALUES ('3438661fa958436291a7', 'b2afa7d1b08f41a3be47', 4, 2, '');
INSERT INTO `patrol_item` VALUES ('3847f07d91b74dd6807f', 'b5bb90d96222433586e7', 10, 2, '');
INSERT INTO `patrol_item` VALUES ('387d545547c7494988a5', 'b5bb90d96222433586e7', 3, 2, '');
INSERT INTO `patrol_item` VALUES ('39b3a67aee02462aa0e2', 'b0d5ef8667ac46fb9466', 10, 2, '');
INSERT INTO `patrol_item` VALUES ('3a5f7e647b67459886ef', 'a8a29d524a044c4a996c', 6, 2, '');
INSERT INTO `patrol_item` VALUES ('3c3e4626490e4577854f', 'fa6bb633c1e340c6bb90', 11, 2, '');
INSERT INTO `patrol_item` VALUES ('3fb46b525e874b27887c', 'b5bb90d96222433586e7', 8, 2, '');
INSERT INTO `patrol_item` VALUES ('40591128cd45482aa8a5', 'b2afa7d1b08f41a3be47', 8, 2, '');
INSERT INTO `patrol_item` VALUES ('41f1dab60c074ee5a6f6', 'ad8eb9d0b11a42679ff6', 5, 2, '');
INSERT INTO `patrol_item` VALUES ('42d045cacc0e48619782', '21c941c7eb9d46888a1b', 5, 2, '');
INSERT INTO `patrol_item` VALUES ('46beaf0bc6ca48bdae42', 'fa6bb633c1e340c6bb90', 6, 2, '');
INSERT INTO `patrol_item` VALUES ('4705b40f96604178812e', '39ddbdb2a1a64bd385cd', 12, 2, '');
INSERT INTO `patrol_item` VALUES ('4b7a8f4f240b4794af34', '39ddbdb2a1a64bd385cd', 7, 2, '');
INSERT INTO `patrol_item` VALUES ('4f93bf27fe494322939e', 'fef7108032ab4370aa0b', 11, 2, '');
INSERT INTO `patrol_item` VALUES ('5209dec0dfc94122b4e6', 'fa6bb633c1e340c6bb90', 8, 2, '');
INSERT INTO `patrol_item` VALUES ('53ae8f80379b4b879a3d', 'b0d5ef8667ac46fb9466', 7, 2, '');
INSERT INTO `patrol_item` VALUES ('585b811b62a04e699478', '21c941c7eb9d46888a1b', 12, 2, '');
INSERT INTO `patrol_item` VALUES ('58898d5c8d604d67b7c5', 'fef7108032ab4370aa0b', 8, 2, '');
INSERT INTO `patrol_item` VALUES ('58c538d03a6f43ae85df', '39ddbdb2a1a64bd385cd', 6, 2, '');
INSERT INTO `patrol_item` VALUES ('5999afde5dc142caacb4', '39ddbdb2a1a64bd385cd', 10, 2, '');
INSERT INTO `patrol_item` VALUES ('5cfa9a7b89c2488da85f', 'b2afa7d1b08f41a3be47', 11, 2, '');
INSERT INTO `patrol_item` VALUES ('5e22f45d646446bdb91d', 'a8a29d524a044c4a996c', 2, 2, '');
INSERT INTO `patrol_item` VALUES ('5e2e9f3274b54bb6b2d6', 'fa6bb633c1e340c6bb90', 5, 2, '');
INSERT INTO `patrol_item` VALUES ('649a3364bdc04de38f99', 'fef7108032ab4370aa0b', 7, 2, '');
INSERT INTO `patrol_item` VALUES ('68a6ef3d472d4ff48cc6', 'b0d5ef8667ac46fb9466', 1, 2, '');
INSERT INTO `patrol_item` VALUES ('68ff17618c4647529a8d', '8533eae2c9fc4bf68312', 6, 2, '');
INSERT INTO `patrol_item` VALUES ('6f95715f5d1a482495b7', 'a8a29d524a044c4a996c', 11, 2, '');
INSERT INTO `patrol_item` VALUES ('7414b95e143b433685fb', 'ad8eb9d0b11a42679ff6', 10, 2, '');
INSERT INTO `patrol_item` VALUES ('754e79d574bf4e848fed', 'b0d5ef8667ac46fb9466', 12, 2, '');
INSERT INTO `patrol_item` VALUES ('7a279b412d3c413dafb6', 'b0d5ef8667ac46fb9466', 11, 2, '');
INSERT INTO `patrol_item` VALUES ('7b0dd087b76f47d1b328', 'a8a29d524a044c4a996c', 4, 2, '');
INSERT INTO `patrol_item` VALUES ('7c83e3396363433380cf', 'b2afa7d1b08f41a3be47', 10, 2, '');
INSERT INTO `patrol_item` VALUES ('7dc5cdd3ee094d1e863b', '21c941c7eb9d46888a1b', 1, 2, '');
INSERT INTO `patrol_item` VALUES ('8004b8bdc24d47e7842a', 'b0d5ef8667ac46fb9466', 9, 2, '');
INSERT INTO `patrol_item` VALUES ('81734ab6d0544fc484f8', '21c941c7eb9d46888a1b', 8, 2, '”');
INSERT INTO `patrol_item` VALUES ('82d38f136f8148c4a31a', 'b0d5ef8667ac46fb9466', 3, 2, '');
INSERT INTO `patrol_item` VALUES ('84f79c1b52d1427a8316', 'ad8eb9d0b11a42679ff6', 9, 2, '');
INSERT INTO `patrol_item` VALUES ('85d93d3298b743caa975', 'b0d5ef8667ac46fb9466', 4, 2, '');
INSERT INTO `patrol_item` VALUES ('864bdc66fd974a58bb05', '8533eae2c9fc4bf68312', 8, 2, '');
INSERT INTO `patrol_item` VALUES ('8801d920099b4fba99b7', 'a8a29d524a044c4a996c', 12, 2, '');
INSERT INTO `patrol_item` VALUES ('89627ef00b5249b7bbd0', 'a8a29d524a044c4a996c', 10, 2, '');
INSERT INTO `patrol_item` VALUES ('8bf16081290b465f8e90', 'fef7108032ab4370aa0b', 4, 2, '');
INSERT INTO `patrol_item` VALUES ('91e213889c3a48cabd09', '39ddbdb2a1a64bd385cd', 4, 2, '');
INSERT INTO `patrol_item` VALUES ('92f9e26a5fe743799261', 'ad8eb9d0b11a42679ff6', 4, 2, '');
INSERT INTO `patrol_item` VALUES ('95ab2462010c4a6e9d6c', 'fa6bb633c1e340c6bb90', 1, 2, '');
INSERT INTO `patrol_item` VALUES ('96c7198b0928471eb4c6', '8533eae2c9fc4bf68312', 4, 2, '');
INSERT INTO `patrol_item` VALUES ('96c7b9e79f7249528eae', 'b5bb90d96222433586e7', 1, 2, '');
INSERT INTO `patrol_item` VALUES ('97cd0b93c51f48149c72', 'b5bb90d96222433586e7', 7, 2, '');
INSERT INTO `patrol_item` VALUES ('9975b8242fb942ba9eb5', '39ddbdb2a1a64bd385cd', 8, 2, '');
INSERT INTO `patrol_item` VALUES ('9c348bf4ac124a2a9359', 'fa6bb633c1e340c6bb90', 3, 2, '');
INSERT INTO `patrol_item` VALUES ('9d740ae3324f410fb29f', 'b2afa7d1b08f41a3be47', 5, 2, '');
INSERT INTO `patrol_item` VALUES ('9da2baed02c64d8b9944', 'ad8eb9d0b11a42679ff6', 12, 2, '');
INSERT INTO `patrol_item` VALUES ('9f017b3486874788b7c5', 'b0d5ef8667ac46fb9466', 2, 2, '');
INSERT INTO `patrol_item` VALUES ('a33dbb68418846b9a24c', 'a8a29d524a044c4a996c', 8, 2, '');
INSERT INTO `patrol_item` VALUES ('a3d8b7582fa84052ab51', '8533eae2c9fc4bf68312', 10, 2, '');
INSERT INTO `patrol_item` VALUES ('a6f9feaf80884717920e', '39ddbdb2a1a64bd385cd', 11, 2, '');
INSERT INTO `patrol_item` VALUES ('a7979cadf5514cf183dd', '21c941c7eb9d46888a1b', 11, 2, '');
INSERT INTO `patrol_item` VALUES ('aaaf6d0f96fa4578af22', 'fef7108032ab4370aa0b', 6, 2, '');
INSERT INTO `patrol_item` VALUES ('adb4c166bc9e40d9b0e3', 'ad8eb9d0b11a42679ff6', 6, 2, '');
INSERT INTO `patrol_item` VALUES ('ae4ae1540079488481cd', 'b5bb90d96222433586e7', 11, 2, '');
INSERT INTO `patrol_item` VALUES ('aec12c9f206849abba33', '39ddbdb2a1a64bd385cd', 5, 2, '');
INSERT INTO `patrol_item` VALUES ('b3febed30c0e4057830b', 'ad8eb9d0b11a42679ff6', 3, 2, '');
INSERT INTO `patrol_item` VALUES ('b589a64167f54023a507', '8533eae2c9fc4bf68312', 3, 2, '');
INSERT INTO `patrol_item` VALUES ('b8016d8d549640df8b20', '21c941c7eb9d46888a1b', 10, 2, '');
INSERT INTO `patrol_item` VALUES ('c0a6d6ee1971410c8594', 'a8a29d524a044c4a996c', 1, 2, '');
INSERT INTO `patrol_item` VALUES ('c25051739f05406c9d99', 'fef7108032ab4370aa0b', 12, 2, '');
INSERT INTO `patrol_item` VALUES ('cb3baa0a83504ddab1eb', 'ad8eb9d0b11a42679ff6', 2, 2, '');
INSERT INTO `patrol_item` VALUES ('d123583577f94eaf9665', '8533eae2c9fc4bf68312', 5, 2, '');
INSERT INTO `patrol_item` VALUES ('d2446a69f71f44fb8da8', 'b5bb90d96222433586e7', 6, 2, '');
INSERT INTO `patrol_item` VALUES ('d5163e105e8d43fc8935', 'fef7108032ab4370aa0b', 3, 2, '');
INSERT INTO `patrol_item` VALUES ('d7739ddcdc03444782a7', 'b0d5ef8667ac46fb9466', 5, 2, '');
INSERT INTO `patrol_item` VALUES ('d7d3806ae5d446318f59', '39ddbdb2a1a64bd385cd', 3, 2, '');
INSERT INTO `patrol_item` VALUES ('dc7da4843dbb43cb93ea', 'fef7108032ab4370aa0b', 2, 2, '');
INSERT INTO `patrol_item` VALUES ('dca0d803d70b44e197ee', 'b0d5ef8667ac46fb9466', 6, 2, '');
INSERT INTO `patrol_item` VALUES ('de62db2fad2043e9a87e', '21c941c7eb9d46888a1b', 6, 2, '');
INSERT INTO `patrol_item` VALUES ('e1e85d8560af47beb33c', 'fa6bb633c1e340c6bb90', 4, 2, '');
INSERT INTO `patrol_item` VALUES ('e36b63a39370471d8435', '39ddbdb2a1a64bd385cd', 9, 2, '');
INSERT INTO `patrol_item` VALUES ('e73c8834f2ba43ab8ee6', '8533eae2c9fc4bf68312', 7, 2, '');
INSERT INTO `patrol_item` VALUES ('e7431d62847947e5bca3', '8533eae2c9fc4bf68312', 1, 2, '');
INSERT INTO `patrol_item` VALUES ('e96f6f8b73c84083a548', '21c941c7eb9d46888a1b', 7, 2, '');
INSERT INTO `patrol_item` VALUES ('eacf8b682f6f432ba3e3', '21c941c7eb9d46888a1b', 2, 2, '');
INSERT INTO `patrol_item` VALUES ('eb806c08d2d043808ddd', 'b2afa7d1b08f41a3be47', 9, 2, '');
INSERT INTO `patrol_item` VALUES ('f1cf355c22f143cbbf5e', 'b2afa7d1b08f41a3be47', 3, 2, '');
INSERT INTO `patrol_item` VALUES ('f50585ab31dc45e88488', 'b5bb90d96222433586e7', 4, 2, '');
INSERT INTO `patrol_item` VALUES ('f50a75287c514fbbaf51', 'ad8eb9d0b11a42679ff6', 11, 2, '');
INSERT INTO `patrol_item` VALUES ('f5edd0bba5c94a7fbfa5', '8533eae2c9fc4bf68312', 12, 2, '');
INSERT INTO `patrol_item` VALUES ('f821233d14844ca584da', 'a8a29d524a044c4a996c', 3, 2, '');
INSERT INTO `patrol_item` VALUES ('fa40e91b9af94764b9a1', '13175963488c4352975c', 11, 2, '');
INSERT INTO `patrol_item` VALUES ('fa8f0ae4b5794fe2b50e', '21003979f7c24aa3aceb', 3, 2, '');
INSERT INTO `patrol_item` VALUES ('faba66a8afad46e39e17', '06948570d33143858b1e', 6, 2, '');
INSERT INTO `patrol_item` VALUES ('fb20b209ed344693bef1', '30e798c177344e98bdc1', 4, 2, '');
INSERT INTO `patrol_item` VALUES ('fb55ee0202bc4ac39531', '116eaf0cc9344547bb36', 6, 2, '');
INSERT INTO `patrol_item` VALUES ('fb8817da62c54ccb8c4c', 'c26878d1cbc643c5bffe', 6, 2, '');
INSERT INTO `patrol_item` VALUES ('fc4ac5bac366424b8672', '0357d770627044aca599', 5, 2, '');
INSERT INTO `patrol_item` VALUES ('fd247ec7b76f422aa4f1', 'b0f60c50a8fb48408e3f', 3, 2, '');
INSERT INTO `patrol_item` VALUES ('fd4b2639c9dc47d19c42', '27fde8dd849d47e2956e', 2, 2, '');
INSERT INTO `patrol_item` VALUES ('fd6a88846cb241e395b7', 'ad8eb9d0b11a42679ff6', 8, 2, '');
INSERT INTO `patrol_item` VALUES ('fe21c2f1f38e469e9f1c', 'b2afa7d1b08f41a3be47', 1, 2, '');
INSERT INTO `patrol_item` VALUES ('fe54766567f541aaadcc', '8533eae2c9fc4bf68312', 2, 2, '');
INSERT INTO `patrol_item` VALUES ('fe554752bf4748f2a058', '5e2f7454c2d742a088b0', 6, 2, '');
INSERT INTO `patrol_item` VALUES ('fe6e89a41cde42db90d0', '0267bf750bfa4e02a092', 12, 2, '');
INSERT INTO `patrol_item` VALUES ('feb7610b2b9342b7977d', '54de2a95040949939c5d', 2, 2, '');
INSERT INTO `patrol_item` VALUES ('ff016a26cc7a473eb5e1', 'e8ab2a1f5e634396b81a', 5, 2, '');
INSERT INTO `patrol_item` VALUES ('ff0a1ce987374b7eaf63', '3fab8b342c2e480c90f3', 11, 2, '');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permission_id` int(10) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名',
  `permission_module` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限的描述',
  `permission_statu` tinyint(2) NOT NULL DEFAULT 0 COMMENT '权限的状态 0：可用  1：禁用',
  `update_time` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'sys:data:report:read', '8', '系统巡检报告读', 0, 1575185836);
INSERT INTO `permission` VALUES (2, 'sys:data:report:write', '8', '系统巡检报告写', 0, 1575185836);
INSERT INTO `permission` VALUES (3, 'sys:data:report_item:read', '9', '系统巡检报告项读', 0, 1575185836);
INSERT INTO `permission` VALUES (4, 'sys:data:report_item:write', '9', '系统巡检报告项写', 0, 1575185836);

-- ----------------------------
-- Table structure for point
-- ----------------------------
DROP TABLE IF EXISTS `point`;
CREATE TABLE `point`  (
  `point_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `point_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点位名',
  `point_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `point_line` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属线路',
  `point_stat` tinyint(2) NULL DEFAULT NULL COMMENT '点位的状态  0：可用   1：不可用  2：维护中',
  `create_time` int(10) NULL DEFAULT NULL,
  `create_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` int(10) NULL DEFAULT NULL,
  `update_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`point_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of point
-- ----------------------------
INSERT INTO `point` VALUES ('A101001001', 'A区急诊楼1楼001点位', '点位的描述', '10', 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `point` VALUES ('A101001002', 'A区急诊楼1楼002点位', '点位的描述', '12', 1, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `point` VALUES ('A101001003', 'A区急诊楼1楼003点位', '点位的描述', '1', 1, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572603651, '18a7560ad0124394bbdddfccea485c1e');
INSERT INTO `point` VALUES ('A101001004', 'A区急诊楼1楼004点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A101001005', 'A区急诊楼1楼005点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A101002006', 'A区急诊楼1楼006点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A101002007', 'A区急诊楼1楼007点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A101002008', 'A区急诊楼1楼008点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A101002009', 'A区急诊楼1楼009点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A101002010', 'A区急诊楼1楼010点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A102003011', 'A区急诊楼2楼011点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A102003012', 'A区急诊楼2楼012点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A102003013', 'A区急诊楼2楼013点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A102003014', 'A区急诊楼2楼014点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A102003015', 'A区急诊楼2楼015点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A102004016', 'A区急诊楼2楼016点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A102004017', 'A区急诊楼2楼017点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A102004018', 'A区急诊楼2楼018点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A102004019', 'A区急诊楼2楼019点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A102004020', 'A区急诊楼2楼020点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A103005021', 'A区急诊楼3楼021点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A103005022', 'A区急诊楼3楼022点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A103005023', 'A区急诊楼3楼023点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A103005024', 'A区急诊楼3楼024点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A103005025', 'A区急诊楼3楼025点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A103006026', 'A区急诊楼3楼026点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A103006027', 'A区急诊楼3楼027点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A103006028', 'A区急诊楼3楼028点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A103006029', 'A区急诊楼3楼029点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A103006030', 'A区急诊楼3楼030点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A201007031', 'A区门诊楼1楼031点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A201007032', 'A区门诊楼1楼032点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A201007033', 'A区门诊楼1楼033点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A201007034', 'A区门诊楼1楼034点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A201007035', 'A区门诊楼1楼035点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A201008036', 'A区门诊楼1楼036点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A201008037', 'A区门诊楼1楼037点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A201008038', 'A区门诊楼1楼038点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A201008039', 'A区门诊楼1楼039点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A201008040', 'A区门诊楼1楼040点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A202009041', 'A区门诊楼2楼041点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A202009042', 'A区门诊楼2楼042点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A202009043', 'A区门诊楼2楼043点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A202009044', 'A区门诊楼2楼044点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A202009045', 'A区门诊楼2楼045点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A202010046', 'A区门诊楼2楼046点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A202010047', 'A区门诊楼2楼047点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A202010048', 'A区门诊楼2楼048点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A202010049', 'A区门诊楼2楼049点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A202010050', 'A区门诊楼2楼050点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A203011051', 'A区门诊楼3楼051点位', '点位的描述', '1', 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A203011052', 'A区门诊楼3楼052点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A203011053', 'A区门诊楼3楼053点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A203011054', 'A区门诊楼3楼054点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A203011055', 'A区门诊楼3楼055点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A203012056', 'A区门诊楼3楼056点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A203012057', 'A区门诊楼3楼057点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A203012058', 'A区门诊楼3楼058点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A203012059', 'A区门诊楼3楼059点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);
INSERT INTO `point` VALUES ('A203012060', 'A区门诊楼3楼060点位', '点位的描述', NULL, 0, 1572068628, '18a7560ad0124394bbdddfccea485c1e', 1572068628, NULL);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
  `role_order` smallint(5) NULL DEFAULT NULL,
  `role_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `role_statu` tinyint(2) NOT NULL DEFAULT 0 COMMENT '角色状态  0：可用   1：禁用',
  `update_time` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '系统管理员', 1, 'dba', '超级管理员权限，最高权限', 0, 1578308603);
INSERT INTO `roles` VALUES (2, '项目经理', 2, 'manager', '只能查看和修改员工信息', 0, 1575261544);

-- ----------------------------
-- Table structure for roles_permission
-- ----------------------------
DROP TABLE IF EXISTS `roles_permission`;
CREATE TABLE `roles_permission`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) NULL DEFAULT NULL,
  `permission_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles_permission
-- ----------------------------
INSERT INTO `roles_permission` VALUES (52, 2, 1);
INSERT INTO `roles_permission` VALUES (53, 2, 4);
INSERT INTO `roles_permission` VALUES (59, 1, 3);
INSERT INTO `roles_permission` VALUES (60, 1, 4);

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `staff_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '巡检员表的索引',
  `staff_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '巡检员的名字',
  `staff_password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '员工密码',
  `staff_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工照片',
  `staff_sex` tinyint(2) NULL DEFAULT NULL COMMENT '巡检员的性别    1：男    0：女',
  `staff_dept` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '隶属部门',
  `staff_id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '巡检员的家庭住址',
  `staff_tele` bigint(11) NULL DEFAULT NULL,
  `staff_stat` tinyint(2) NULL DEFAULT NULL COMMENT '巡检员的在职状态  0：在职   1：离职',
  `create_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` int(10) NULL DEFAULT NULL,
  `update_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`staff_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('1', 'chenjunan', '41b5283bdc67155e640efcff0e39d36f', 'http://127.0.0.1:8080/static/staffLocation/11d978796da34655923cc7ed21055671.jpg', 0, 'a886bde835b6448dac3b60ab4ea2162e', '510821199706203739', '四川省', 13699044470, 1, '18a7560ad0124394bbdddfccea485c1e', 1571997425, '18a7560ad0124394bbdddfccea485c1e', 1573456529);
INSERT INTO `staff` VALUES ('2', '张学友', '', 'http://127.0.0.1:8080/static/staffLocation/a6e6051746444ae6a6eaae3769da1634.jpg', 0, 'a886bde835b6448dac3b60ab4ea2162b', '510181199610302212', '四川省', 13656215160, 0, '18a7560ad0124394bbdddfccea485c1e', 1571997425, '18a7560ad0124394bbdddfccea485c1e', 1572007335);
INSERT INTO `staff` VALUES ('3', '刘德华', '', NULL, 0, 'a886bde835b6448dac3b60ab4ea2162b', '510156448458515612', '四川省', 13151651651, 0, '18a7560ad0124394bbdddfccea485c1e', 1571997425, '18a7560ad0124394bbdddfccea485c1e', 1572007317);
INSERT INTO `staff` VALUES ('4', '周星驰', '', NULL, 0, 'a886bde835b6448dac3b60ab4ea2162b', '510154684645654548', '四川省', 15121545615, 1, '18a7560ad0124394bbdddfccea485c1e', 1571997425, '18a7560ad0124394bbdddfccea485c1e', 1573315038);
INSERT INTO `staff` VALUES ('4865c086896e4caf88d2968f69408cc5', 'junan', '', 'http://127.0.0.1:8080/static/staffLocation/4f8ececbaa6846208113b31b32e3ea3f.jpg', 0, 'a886bde835b6448dac3b60ab4ea2162b', '5465465454165', '四川', 13699044479, 1, '18a7560ad0124394bbdddfccea485c1e', 1571997425, '18a7560ad0124394bbdddfccea485c1f', 1573354023);
INSERT INTO `staff` VALUES ('5', '阿斯顿', '', NULL, 1, 'a886bde835b6448dac3b60ab4ea2162b', '810216546522626625', '四川省', 21116556523, 0, '18a7560ad0124394bbdddfccea485c1e', 1571997425, '18a7560ad0124394bbdddfccea485c1f', 1573354026);

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `task_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务编号',
  `task_staff` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该任务指派的巡检人员的编号',
  `task_line` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务需要巡检的线路',
  `create_by` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` int(10) NULL DEFAULT NULL COMMENT '任务发布时间',
  `start_time` int(10) NULL DEFAULT NULL,
  `end_time` int(10) NULL DEFAULT NULL,
  `task_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `task_stat` tinyint(2) NULL DEFAULT NULL COMMENT '任务状态   0：未执行     1:执行中   2：已执行'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('ed1f3bc372574120ac77', '4', '8', '18a7560ad0124394bbdddfccea485c1e', 1557676800, 1557882000, 1557928800, 'ok', 2);
INSERT INTO `task` VALUES ('fd3c1467e23849e1b81d', '5', '12', '18a7560ad0124394bbdddfccea485c1e', 1557849600, 1557882000, 1557928800, '', 0);
INSERT INTO `task` VALUES ('abd7cb1fb73a49ff8645', '3', '9', '18a7560ad0124394bbdddfccea485c1e', 1557936000, 1558141200, 1558188000, '', 0);
INSERT INTO `task` VALUES ('8ec5695a87f54c9aa470daa40c86f3b2', '2', '10', '18a7560ad0124394bbdddfccea485c1e', 1572064526, 1571198400, 1571803200, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
