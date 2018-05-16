/*
Navicat MySQL Data Transfer

Source Server         : wepull
Source Server Version : 50528
Source Host           : localhost:3308
Source Database       : isec

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-05-16 12:27:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', '张三', '内容');
INSERT INTO `blog` VALUES ('2', '李四', '信息');
INSERT INTO `blog` VALUES ('3', '陈时超', '大煞笔');

-- ----------------------------
-- Table structure for btn
-- ----------------------------
DROP TABLE IF EXISTS `btn`;
CREATE TABLE `btn` (
  `pkid` varchar(20) NOT NULL COMMENT '按钮(权限)表主键',
  `btname` varchar(100) DEFAULT NULL COMMENT '按钮名称(select)',
  `modal` varchar(100) DEFAULT NULL COMMENT '所属模块(nameSpace)',
  `memo` varchar(300) DEFAULT NULL COMMENT '按钮权限 备注信息',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of btn
-- ----------------------------
INSERT INTO `btn` VALUES ('11271236548', 'delete', 'btn', '按钮/删除');
INSERT INTO `btn` VALUES ('11271587415', 'search', 'btn', '按钮/查询');
INSERT INTO `btn` VALUES ('11271748569', 'add', 'btn', '按钮/添加');
INSERT INTO `btn` VALUES ('11275412594', 'edit', 'btn', '按钮/编辑');
INSERT INTO `btn` VALUES ('11278451296', 'clean', 'btn', '按钮/清空');
INSERT INTO `btn` VALUES ('12535124895', 'add', 'userRole', '用户角色/添加');
INSERT INTO `btn` VALUES ('12543518654', 'clean', 'userRole', '用户角色/清空');
INSERT INTO `btn` VALUES ('12565485942', 'search', 'userRole', '用户角色/查询');
INSERT INTO `btn` VALUES ('12574596715', 'edit', 'userRole', '用户角色/编辑');
INSERT INTO `btn` VALUES ('12584512564', 'delete', 'userRole', '用户角色/删除');
INSERT INTO `btn` VALUES ('15741254864', 'search', 'clientUser', '用户/查询');
INSERT INTO `btn` VALUES ('15774584892', 'add', 'clientUser', '用户/添加');
INSERT INTO `btn` VALUES ('15782364857', 'delete', 'clientUser', '用户/删除');
INSERT INTO `btn` VALUES ('15784225171', 'clean', 'clientUser', '用户/清空');
INSERT INTO `btn` VALUES ('15795841257', 'edit', 'clientUser', '用户/编辑');
INSERT INTO `btn` VALUES ('16741584942', 'search', 'staff', '职员/查询');
INSERT INTO `btn` VALUES ('16784515954', 'add', 'staff', '职员/添加');
INSERT INTO `btn` VALUES ('16845248964', 'delete', 'staff', '职员/删除');
INSERT INTO `btn` VALUES ('16857481295', 'edit', 'staff', '职员/编辑');
INSERT INTO `btn` VALUES ('16895745128', 'clean', 'staff', '职员/清空');

-- ----------------------------
-- Table structure for client_role
-- ----------------------------
DROP TABLE IF EXISTS `client_role`;
CREATE TABLE `client_role` (
  `pkid` varchar(20) NOT NULL,
  `roleName` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `level` varchar(2) DEFAULT NULL COMMENT '角色的级别',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client_role
-- ----------------------------
INSERT INTO `client_role` VALUES ('123456789', '游客', '1', '这是游客');
INSERT INTO `client_role` VALUES ('147258369', '管理员', '0', '这是系统管理员');

-- ----------------------------
-- Table structure for client_user
-- ----------------------------
DROP TABLE IF EXISTS `client_user`;
CREATE TABLE `client_user` (
  `pkid` varchar(20) NOT NULL,
  `uname` varchar(60) DEFAULT NULL COMMENT '用户名',
  `password` varchar(60) DEFAULT NULL COMMENT '登录密码(MD5加密）',
  `status` varchar(2) DEFAULT NULL COMMENT '用户状态0:冻结1 启用 2注销 3未激活',
  `memo` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `create_date` datetime DEFAULT NULL COMMENT '用户创建时间',
  `login_date` datetime DEFAULT NULL COMMENT '最近登录时间',
  `email` varchar(200) DEFAULT NULL COMMENT '用户邮箱',
  `activedate` date DEFAULT NULL COMMENT '账号激活时间',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱激活的验证码',
  `remark1` varchar(300) DEFAULT NULL COMMENT '忘记密码时，存储用户唯一操作码',
  `remark2` varchar(300) DEFAULT NULL COMMENT '备用字段2',
  `remark3` varchar(300) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (`pkid`),
  UNIQUE KEY `uname` (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client_user
-- ----------------------------
INSERT INTO `client_user` VALUES ('123456789', 'zhangsan', 'b65f414eaa7caf8914faacb2a211570f', '1', '管理员', '2015-11-12 00:00:00', '2017-04-13 09:55:47', '835897006@qq.com', null, null, '', null, null);
INSERT INTO `client_user` VALUES ('251417485', 'lisi', '0ba2a0b52e87db7b14dab5f78c02437a', '1', '普通用户', '2015-11-11 00:00:00', '2015-11-27 14:38:46', '408847559@qq.com', null, null, null, null, null);

-- ----------------------------
-- Table structure for data_break_log
-- ----------------------------
DROP TABLE IF EXISTS `data_break_log`;
CREATE TABLE `data_break_log` (
  `STATUS` varchar(2) DEFAULT NULL,
  `BREAK_SOURCE` varchar(2) DEFAULT NULL,
  `IMPORT_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_break_log
-- ----------------------------
INSERT INTO `data_break_log` VALUES ('1', '1', '2017-05-16 18:26:23', '2017-05-15 18:26:25', '2017-05-23 18:26:34');
INSERT INTO `data_break_log` VALUES ('1', '1', '2017-05-15 18:26:44', '2017-05-10 18:26:47', '2017-05-10 18:26:51');
INSERT INTO `data_break_log` VALUES ('2', '2', '2017-05-16 14:59:32', '2017-05-06 14:59:36', '2017-05-23 14:59:41');
INSERT INTO `data_break_log` VALUES ('2', '1', '2017-05-24 17:08:53', '2017-05-24 17:08:53', '2017-05-24 17:08:53');
INSERT INTO `data_break_log` VALUES ('1', '2', '2017-06-28 11:20:43', '2017-06-13 11:20:47', '2017-06-14 11:20:50');
INSERT INTO `data_break_log` VALUES ('1', '1', '2017-12-23 07:41:01', '2017-12-23 07:41:01', '2017-12-23 07:41:01');
INSERT INTO `data_break_log` VALUES ('1', '1', '2017-12-23 07:47:22', '2017-12-23 07:47:22', '2017-12-23 07:47:22');
INSERT INTO `data_break_log` VALUES ('1', '1', '2018-01-06 15:48:05', '2018-01-06 15:48:05', '2018-01-06 15:48:05');
INSERT INTO `data_break_log` VALUES ('1', '1', '2018-01-06 15:49:40', '2018-01-06 15:49:40', '2018-01-06 15:49:40');

-- ----------------------------
-- Table structure for job_execution_log
-- ----------------------------
DROP TABLE IF EXISTS `job_execution_log`;
CREATE TABLE `job_execution_log` (
  `id` varchar(40) NOT NULL,
  `job_name` varchar(100) NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `sharding_item` int(11) NOT NULL,
  `execution_source` varchar(20) NOT NULL,
  `failure_cause` varchar(4000) DEFAULT NULL,
  `is_success` int(11) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `complete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_execution_log
-- ----------------------------
INSERT INTO `job_execution_log` VALUES ('0144a849-c786-4dd6-8dd1-15add834d761', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@11488', 'PF10XHWW', '10.36.7.86', '0', 'NORMAL_TRIGGER', null, '1', '2018-05-11 17:00:00', '2018-05-11 17:00:00');
INSERT INTO `job_execution_log` VALUES ('21eb8266-71a2-432a-86e7-f45f2853210a', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@8420', 'PF10XHWW', '10.36.7.86', '1', 'NORMAL_TRIGGER', null, '1', '2018-05-16 11:00:00', '2018-05-16 11:00:00');
INSERT INTO `job_execution_log` VALUES ('39d64885-47a1-4248-8471-d6fa4d4897e1', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@11488', 'PF10XHWW', '10.36.7.86', '1', 'NORMAL_TRIGGER', null, '1', '2018-05-11 18:00:00', '2018-05-11 18:00:00');
INSERT INTO `job_execution_log` VALUES ('3beca85c-939d-4ef6-811f-cabb14bce4dc', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@12640', 'PF10XHWW', '10.36.7.86', '1', 'NORMAL_TRIGGER', null, '1', '2018-05-15 18:00:00', '2018-05-15 18:00:00');
INSERT INTO `job_execution_log` VALUES ('4da204bb-4c76-4d29-8f0a-584d4405c4d5', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@1364', 'PF10XHWW', '10.36.7.86', '0', 'NORMAL_TRIGGER', null, '1', '2018-05-14 10:00:00', '2018-05-14 10:00:00');
INSERT INTO `job_execution_log` VALUES ('5d53e537-fff5-46ae-b3d4-9b1a5ca85bd5', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@9648', 'PF10XHWW', '10.36.7.86', '0', 'NORMAL_TRIGGER', null, '1', '2018-05-15 16:00:00', '2018-05-15 16:00:00');
INSERT INTO `job_execution_log` VALUES ('70958055-978d-456f-b8e7-269a668d5cca', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@11488', 'PF10XHWW', '10.36.7.86', '0', 'NORMAL_TRIGGER', null, '1', '2018-05-11 18:00:00', '2018-05-11 18:00:00');
INSERT INTO `job_execution_log` VALUES ('7307067d-9d64-4ee2-8f2e-3b9e689765b9', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@1364', 'PF10XHWW', '10.36.7.86', '2', 'NORMAL_TRIGGER', null, '1', '2018-05-14 10:00:00', '2018-05-14 10:00:00');
INSERT INTO `job_execution_log` VALUES ('746736f1-3874-49f3-9e8d-f06c8f33d337', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@8420', 'PF10XHWW', '10.36.7.86', '2', 'NORMAL_TRIGGER', null, '1', '2018-05-16 11:00:00', '2018-05-16 11:00:00');
INSERT INTO `job_execution_log` VALUES ('77cd0060-a36f-49e3-ac59-542ffb616a47', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@12984', 'PF10XHWW', '10.36.7.86', '2', 'NORMAL_TRIGGER', null, '1', '2018-05-11 16:00:00', '2018-05-11 16:00:00');
INSERT INTO `job_execution_log` VALUES ('84575760-7bb7-4cd4-9f39-0f6cb990fd73', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@2280', 'PF10XHWW', '10.36.7.86', '2', 'NORMAL_TRIGGER', null, '1', '2018-05-15 17:00:00', '2018-05-15 17:00:00');
INSERT INTO `job_execution_log` VALUES ('86fbf988-165a-4efe-b7e1-86d814e3a4bb', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@12984', 'PF10XHWW', '10.36.7.86', '1', 'NORMAL_TRIGGER', null, '1', '2018-05-11 16:00:00', '2018-05-11 16:00:00');
INSERT INTO `job_execution_log` VALUES ('8bf7045e-2395-4f7d-bcfe-111db4af2c34', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@8420', 'PF10XHWW', '10.36.7.86', '0', 'NORMAL_TRIGGER', null, '1', '2018-05-16 11:00:00', '2018-05-16 11:00:00');
INSERT INTO `job_execution_log` VALUES ('917003dc-eaa3-4ed0-87d0-371e72f75384', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@2280', 'PF10XHWW', '10.36.7.86', '0', 'NORMAL_TRIGGER', null, '1', '2018-05-15 17:00:00', '2018-05-15 17:00:00');
INSERT INTO `job_execution_log` VALUES ('af5bcb43-b125-4eb9-b553-4f4036f481ba', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@12640', 'PF10XHWW', '10.36.7.86', '2', 'NORMAL_TRIGGER', null, '1', '2018-05-15 18:00:00', '2018-05-15 18:00:00');
INSERT INTO `job_execution_log` VALUES ('b11cf3d9-428d-4fe9-bb7f-103ad52b7c3d', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@12984', 'PF10XHWW', '10.36.7.86', '0', 'NORMAL_TRIGGER', null, '1', '2018-05-11 16:00:00', '2018-05-11 16:00:00');
INSERT INTO `job_execution_log` VALUES ('c668999e-4174-460c-8517-c6b62dc9b2f5', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@1364', 'PF10XHWW', '10.36.7.86', '1', 'NORMAL_TRIGGER', null, '1', '2018-05-14 10:00:00', '2018-05-14 10:00:00');
INSERT INTO `job_execution_log` VALUES ('d0304f20-0f7d-48ab-8b62-5f5b2d6931fe', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@12640', 'PF10XHWW', '10.36.7.86', '0', 'NORMAL_TRIGGER', null, '1', '2018-05-15 18:00:00', '2018-05-15 18:00:00');
INSERT INTO `job_execution_log` VALUES ('d1b0783d-4966-422a-a572-10dd6fb235fe', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@11488', 'PF10XHWW', '10.36.7.86', '2', 'NORMAL_TRIGGER', null, '1', '2018-05-11 18:00:00', '2018-05-11 18:00:00');
INSERT INTO `job_execution_log` VALUES ('d6c3f60f-eb8f-4ec7-8742-f94f23e6c1e8', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@11488', 'PF10XHWW', '10.36.7.86', '1', 'NORMAL_TRIGGER', null, '1', '2018-05-11 17:00:00', '2018-05-11 17:00:00');
INSERT INTO `job_execution_log` VALUES ('d8d786a7-9430-4543-b980-aabb8d36d8c8', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@9648', 'PF10XHWW', '10.36.7.86', '2', 'NORMAL_TRIGGER', null, '1', '2018-05-15 16:00:00', '2018-05-15 16:00:00');
INSERT INTO `job_execution_log` VALUES ('f2b53db0-ba88-4dd3-ab46-7574688b4d5d', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@9648', 'PF10XHWW', '10.36.7.86', '1', 'NORMAL_TRIGGER', null, '1', '2018-05-15 16:00:00', '2018-05-15 16:00:00');
INSERT INTO `job_execution_log` VALUES ('f83ade89-25df-4b3e-b999-3134ead494d4', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@2280', 'PF10XHWW', '10.36.7.86', '1', 'NORMAL_TRIGGER', null, '1', '2018-05-15 17:00:00', '2018-05-15 17:00:00');
INSERT INTO `job_execution_log` VALUES ('f892a9c4-e6a7-42f0-b4bc-ad973422d6d3', 'com.qdone.common.job.SpringSimpleJob', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@11488', 'PF10XHWW', '10.36.7.86', '2', 'NORMAL_TRIGGER', null, '1', '2018-05-11 17:00:00', '2018-05-11 17:00:00');

-- ----------------------------
-- Table structure for job_status_trace_log
-- ----------------------------
DROP TABLE IF EXISTS `job_status_trace_log`;
CREATE TABLE `job_status_trace_log` (
  `id` varchar(40) NOT NULL,
  `job_name` varchar(100) NOT NULL,
  `original_task_id` varchar(255) NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `slave_id` varchar(50) NOT NULL,
  `source` varchar(50) NOT NULL,
  `execution_type` varchar(20) NOT NULL,
  `sharding_item` varchar(100) NOT NULL,
  `state` varchar(20) NOT NULL,
  `message` varchar(4000) DEFAULT NULL,
  `creation_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TASK_ID_STATE_INDEX` (`task_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_status_trace_log
-- ----------------------------
INSERT INTO `job_status_trace_log` VALUES ('0c8f5973-6a2c-4d6c-be37-63efc3fae96f', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@1364', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'com.qdone.common.job.SpringSimpleJob\' execute begin.', '2018-05-14 10:00:00');
INSERT INTO `job_status_trace_log` VALUES ('1a082442-ace3-44dc-8239-d7548bda90f5', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@2280', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2018-05-15 17:00:00');
INSERT INTO `job_status_trace_log` VALUES ('1b77f5d5-ba18-46ef-8d4c-ea379083bcc9', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@1364', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2018-05-14 10:00:00');
INSERT INTO `job_status_trace_log` VALUES ('3a8c2000-e875-47b8-8e25-fa8d05109c92', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@11488', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2018-05-11 17:00:00');
INSERT INTO `job_status_trace_log` VALUES ('4c716ee0-3fc6-4e3f-8972-9e7e05f164fa', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@8420', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2018-05-16 11:00:00');
INSERT INTO `job_status_trace_log` VALUES ('5d6bbc50-8db5-4ef8-b4bb-049f7c3908c1', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@9648', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2018-05-15 16:00:00');
INSERT INTO `job_status_trace_log` VALUES ('62fb600a-a25f-4086-9b7a-879f0b027361', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@8420', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2018-05-16 11:00:00');
INSERT INTO `job_status_trace_log` VALUES ('6800c8be-2d19-4353-b8a5-838dea3bfac1', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@2280', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2018-05-15 17:00:00');
INSERT INTO `job_status_trace_log` VALUES ('6b8fd739-ee72-4f0b-95f1-00ab68cd2940', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@12984', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2018-05-11 16:00:00');
INSERT INTO `job_status_trace_log` VALUES ('6d9e4b8d-4812-4e00-b71f-c5ce5e87f8de', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@12640', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2018-05-15 18:00:00');
INSERT INTO `job_status_trace_log` VALUES ('759836ca-eb32-48c1-ada4-a7f9f26f1fbb', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@12640', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'com.qdone.common.job.SpringSimpleJob\' execute begin.', '2018-05-15 18:00:00');
INSERT INTO `job_status_trace_log` VALUES ('8e2251a5-c205-4e9c-8877-714958517a85', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@11488', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'com.qdone.common.job.SpringSimpleJob\' execute begin.', '2018-05-11 17:00:00');
INSERT INTO `job_status_trace_log` VALUES ('9545f781-d60c-4040-80b5-daa661df3130', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@12984', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2018-05-11 16:00:00');
INSERT INTO `job_status_trace_log` VALUES ('adb32b67-0b23-4705-9c1a-e0f9927ef69a', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@2280', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'com.qdone.common.job.SpringSimpleJob\' execute begin.', '2018-05-15 17:00:00');
INSERT INTO `job_status_trace_log` VALUES ('b039c047-91c0-4d39-91b5-1c3b2895ae7a', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@12640', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2018-05-15 18:00:00');
INSERT INTO `job_status_trace_log` VALUES ('c31ea3b5-d996-4e8b-92d0-3650fa0a8025', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@11488', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2018-05-11 17:00:00');
INSERT INTO `job_status_trace_log` VALUES ('c58055cf-1a04-41f1-9769-4746986edbd3', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@11488', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2018-05-11 18:00:00');
INSERT INTO `job_status_trace_log` VALUES ('d21412b4-3b39-41dc-b256-5d015511525a', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@11488', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'com.qdone.common.job.SpringSimpleJob\' execute begin.', '2018-05-11 18:00:00');
INSERT INTO `job_status_trace_log` VALUES ('dbe6d1a3-25d0-46b1-9ccf-c3e79c99bd8b', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@12984', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'com.qdone.common.job.SpringSimpleJob\' execute begin.', '2018-05-11 16:00:00');
INSERT INTO `job_status_trace_log` VALUES ('e51d7834-13dc-4dcd-9106-cf51d52e6074', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@11488', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_FINISHED', '', '2018-05-11 18:00:00');
INSERT INTO `job_status_trace_log` VALUES ('eae4ceaf-3899-4ebc-a6c7-522bd1b3b703', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@1364', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2018-05-14 10:00:00');
INSERT INTO `job_status_trace_log` VALUES ('ebc394d5-c2b9-4464-8b6b-3f95d49c3f2c', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@9648', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'com.qdone.common.job.SpringSimpleJob\' execute begin.', '2018-05-15 16:00:00');
INSERT INTO `job_status_trace_log` VALUES ('fb3fcc82-3dad-4aee-9f8e-3a397b1269f0', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@8420', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_STAGING', 'Job \'com.qdone.common.job.SpringSimpleJob\' execute begin.', '2018-05-16 11:00:00');
INSERT INTO `job_status_trace_log` VALUES ('fcd36103-712a-410c-8b7f-7c851ad8d590', 'com.qdone.common.job.SpringSimpleJob', '', 'com.qdone.common.job.SpringSimpleJob@-@0,1,2@-@READY@-@10.36.7.86@-@9648', '10.36.7.86', 'LITE_EXECUTOR', 'READY', '[0, 1, 2]', 'TASK_RUNNING', '', '2018-05-15 16:00:00');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(255) NOT NULL DEFAULT '' COMMENT '优先级',
  `category` varchar(255) NOT NULL DEFAULT '' COMMENT '类目',
  `thread` varchar(255) NOT NULL DEFAULT '' COMMENT '进程',
  `time` varchar(30) NOT NULL DEFAULT '' COMMENT '时间',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '位置',
  `note` text COMMENT '日志信息',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('10295', 'DEBUG', 'com.rainsoft.mvc.mapper.SysUsers.select', 'http-bio-8088-exec-6', '2017-03-23 11:55:01:239', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: SELECT ID,NAME,DESCN,LOGINID,PASSWD,EMAIL, STATUS,UNIT_ID,PHONE FROM SYS_USERS WHERE LOGINID = ? AND PASSWD = ? ');
INSERT INTO `logs` VALUES ('10296', 'DEBUG', 'com.rainsoft.mvc.mapper.SysUsers.select', 'http-bio-8088-exec-6', '2017-03-23 11:55:01:541', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: admin(String), e10adc3949ba59abbe56e057f20f883e(String)');
INSERT INTO `logs` VALUES ('10297', 'DEBUG', 'com.rainsoft.mvc.mapper.SysUsers.select', 'http-bio-8088-exec-6', '2017-03-23 11:55:01:606', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 1');
INSERT INTO `logs` VALUES ('10298', 'INFO', 'com.rainsoft.common.util.LogAspect', 'http-bio-8088-exec-2', '2017-03-23 11:55:25:163', 'com.rainsoft.common.util.LogAspect.doBefore(LogAspect.java:92)', '用户:admin [数据中断列表] 执行:DataInterruptController.getPage() 传入参数:{\"limit\":\"10\",\"order\":\"asc\",\"_\":\"1490241324408\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10299', 'DEBUG', 'com.rainsoft.mvc.mapper.DataInterrupt.select', 'http-bio-8088-exec-2', '2017-03-23 11:55:25:228', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from ( SELECT START_TIME,END_TIME,IMPORT_TIME,BREAK_SOURCE,STATUS FROM DATA_BREAK_LOG ) where rownum <= ? ');
INSERT INTO `logs` VALUES ('10300', 'DEBUG', 'com.rainsoft.mvc.mapper.DataInterrupt.select', 'http-bio-8088-exec-2', '2017-03-23 11:55:25:252', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10301', 'DEBUG', 'com.rainsoft.mvc.mapper.DataInterrupt.select', 'http-bio-8088-exec-2', '2017-03-23 11:55:25:280', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10302', 'INFO', 'com.rainsoft.common.util.LogAspect', 'http-bio-8088-exec-2', '2017-03-23 11:55:25:347', 'com.rainsoft.common.util.LogAspect.doAfter(LogAspect.java:105)', '用户:admin [数据中断列表] 执行:DataInterruptController.getPage() 执行结果:{\"total\":11,\"rows\":[{\"breakSource\":\"1\",\"endTime\":1489680000000,\"importTime\":1488862625000,\"startTime\":1490112000000,\"status\":\"2\"},{\"breakSource\":\"1\",\"endTime\":1490245019000,\"importTime\":1490115422000,\"startTime\":1490025783000,\"status\":\"2\"},{\"breakSource\":\"1\",\"endTime\":1488902404000,\"importTime\":1490025783000,\"startTime\":1488816300000,\"status\":\"1\"},{\"breakSource\":\"1\",\"endTime\":1488992277000,\"importTime\":1490198457000,\"startTime\":1488816055000,\"status\":\"1\"},{\"breakSource\":\"1\",\"endTime\":1488513725000,\"importTime\":1488384003000,\"startTime\":1488387366000,\"status\":\"2\"},{\"breakSource\":\"0\",\"endTime\":1488992160000,\"importTime\":1488905937000,\"startTime\":1488902404000,\"status\":\"1\"},{\"breakSource\":\"1\",\"endTime\":1490115478000,\"importTime\":1490112122000,\"startTime\":1490112121000,\"status\":\"1\"},{\"breakSource\":\"1\",\"endTime\":1490544243000,\"importTime\":1490112243000,\"startTime\":1490673778000,\"status\":\"1\"},{\"breakSource\":\"1\",\"endTime\":1489939382000,\"importTime\":1489939319000,\"startTime\":1490025661000,\"status\":\"1\"},{\"breakSource\":\"1\",\"endTime\":1490544297000,\"importTime\":1490544299000,\"startTime\":1490029084000,\"status\":\"1\"}]}');
INSERT INTO `logs` VALUES ('10303', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-6', '2017-03-23 18:01:55:496', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313613}]');
INSERT INTO `logs` VALUES ('10304', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-8', '2017-03-23 18:01:55:496', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490263313614}]');
INSERT INTO `logs` VALUES ('10305', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-8', '2017-03-23 18:01:56:241', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@63a2aa39 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490263313614}]');
INSERT INTO `logs` VALUES ('10306', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-23 18:01:56:446', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10307', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-23 18:01:56:518', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10308', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-23 18:01:56:771', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10309', 'ERROR', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-6', '2017-03-23 18:01:58:190', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:176)', '执行StaffController.selectPage() 查询表格数据 异常: ');
INSERT INTO `logs` VALUES ('10310', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-8', '2017-03-23 18:02:08:123', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313615}]');
INSERT INTO `logs` VALUES ('10311', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-23 18:02:08:127', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490263313616}]');
INSERT INTO `logs` VALUES ('10312', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-8', '2017-03-23 18:02:08:154', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@40bee2b9 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313615}]');
INSERT INTO `logs` VALUES ('10313', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-23 18:02:08:177', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@72d9a000 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490263313616}]');
INSERT INTO `logs` VALUES ('10314', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-23 18:02:08:196', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10315', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:02:08:218', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10316', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-23 18:02:08:240', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10317', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:02:08:262', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10318', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-23 18:02:08:294', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10319', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:02:08:312', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10320', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-23 18:02:08:839', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313617}]');
INSERT INTO `logs` VALUES ('10321', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-7', '2017-03-23 18:02:08:841', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490263313618}]');
INSERT INTO `logs` VALUES ('10322', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-23 18:02:08:866', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@644e7171 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313617}]');
INSERT INTO `logs` VALUES ('10323', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-7', '2017-03-23 18:02:08:887', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@4004e6ed ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490263313618}]');
INSERT INTO `logs` VALUES ('10324', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:02:08:907', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10325', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-23 18:02:08:930', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10326', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:02:08:951', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10327', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-23 18:02:08:973', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10328', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:02:08:998', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10329', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-23 18:02:09:023', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10330', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-7', '2017-03-23 18:02:09:610', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313619}]');
INSERT INTO `logs` VALUES ('10331', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-4', '2017-03-23 18:02:09:612', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490263313620}]');
INSERT INTO `logs` VALUES ('10332', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-7', '2017-03-23 18:02:09:681', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@62b782d9 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313619}]');
INSERT INTO `logs` VALUES ('10333', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-4', '2017-03-23 18:02:09:711', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@74c754e0 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490263313620}]');
INSERT INTO `logs` VALUES ('10334', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-23 18:02:09:730', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10335', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-23 18:02:09:752', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10336', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-23 18:02:09:773', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10337', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-23 18:02:09:795', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10338', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-23 18:02:09:822', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10339', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-23 18:02:09:845', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10340', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-4', '2017-03-23 18:02:10:478', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313621}]');
INSERT INTO `logs` VALUES ('10341', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-23 18:02:10:481', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490263313622}]');
INSERT INTO `logs` VALUES ('10342', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-4', '2017-03-23 18:02:10:498', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@42a3618c ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313621}]');
INSERT INTO `logs` VALUES ('10343', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-23 18:02:10:521', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@6ef159d3 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490263313622}]');
INSERT INTO `logs` VALUES ('10344', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-23 18:02:10:540', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10345', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:02:10:563', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10346', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-23 18:02:10:584', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10347', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:02:10:606', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10348', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-23 18:02:10:634', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10349', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:02:10:661', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10350', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-23 18:02:11:653', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313623}]');
INSERT INTO `logs` VALUES ('10351', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-2', '2017-03-23 18:02:11:656', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490263313624}]');
INSERT INTO `logs` VALUES ('10352', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-23 18:02:11:678', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@5cb204c7 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313623}]');
INSERT INTO `logs` VALUES ('10353', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-2', '2017-03-23 18:02:11:699', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@fa385cf ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490263313624}]');
INSERT INTO `logs` VALUES ('10354', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:02:11:718', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10355', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-23 18:02:11:740', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10356', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:02:11:762', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10357', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-23 18:02:11:784', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10358', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:02:11:811', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10359', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-23 18:02:11:833', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10360', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-2', '2017-03-23 18:02:12:610', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313625}]');
INSERT INTO `logs` VALUES ('10361', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-3', '2017-03-23 18:02:12:612', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490263313626}]');
INSERT INTO `logs` VALUES ('10362', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-2', '2017-03-23 18:02:12:643', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@4fc73afc ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313625}]');
INSERT INTO `logs` VALUES ('10363', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-3', '2017-03-23 18:02:12:665', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@72e21f85 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490263313626}]');
INSERT INTO `logs` VALUES ('10364', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-23 18:02:12:685', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10365', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-23 18:02:12:760', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10366', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-23 18:02:12:795', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10367', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-23 18:02:12:817', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10368', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-23 18:02:12:845', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10369', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-23 18:02:12:867', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10370', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-3', '2017-03-23 18:02:13:721', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313627}]');
INSERT INTO `logs` VALUES ('10371', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-5', '2017-03-23 18:02:13:723', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490263313628}]');
INSERT INTO `logs` VALUES ('10372', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-3', '2017-03-23 18:02:13:788', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@7899ebdc ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313627}]');
INSERT INTO `logs` VALUES ('10373', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-5', '2017-03-23 18:02:13:810', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@449931f2 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490263313628}]');
INSERT INTO `logs` VALUES ('10374', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-23 18:02:13:829', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10375', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-23 18:02:13:851', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10376', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-23 18:02:13:872', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10377', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-23 18:02:13:895', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10378', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-23 18:02:13:922', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10379', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-23 18:02:13:956', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10380', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-5', '2017-03-23 18:02:14:766', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313629}]');
INSERT INTO `logs` VALUES ('10381', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-1', '2017-03-23 18:02:14:767', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490263313630}]');
INSERT INTO `logs` VALUES ('10382', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-5', '2017-03-23 18:02:14:799', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@2a6ff ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313629}]');
INSERT INTO `logs` VALUES ('10383', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-1', '2017-03-23 18:02:14:821', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@f97db29 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490263313630}]');
INSERT INTO `logs` VALUES ('10384', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-23 18:02:14:842', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10385', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:02:14:862', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10386', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-23 18:02:14:887', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10387', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:02:14:917', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10388', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-23 18:02:14:946', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10389', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:02:14:966', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10390', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-1', '2017-03-23 18:02:20:999', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313631}]');
INSERT INTO `logs` VALUES ('10391', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-6', '2017-03-23 18:02:21:002', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490263313632}]');
INSERT INTO `logs` VALUES ('10392', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-1', '2017-03-23 18:02:21:031', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@21043563 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313631}]');
INSERT INTO `logs` VALUES ('10393', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-6', '2017-03-23 18:02:21:054', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@508abfa4 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490263313632}]');
INSERT INTO `logs` VALUES ('10394', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:02:21:118', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10395', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-23 18:02:21:197', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10396', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:02:21:239', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10397', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-23 18:02:21:261', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10398', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:02:21:288', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10399', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-23 18:02:21:310', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10400', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-6', '2017-03-23 18:02:35:532', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313633}]');
INSERT INTO `logs` VALUES ('10401', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-8', '2017-03-23 18:02:35:535', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490263313634}]');
INSERT INTO `logs` VALUES ('10402', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-6', '2017-03-23 18:02:35:553', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@3db4cfdc ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313633}]');
INSERT INTO `logs` VALUES ('10403', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-8', '2017-03-23 18:02:35:575', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@1ed244f3 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490263313634}]');
INSERT INTO `logs` VALUES ('10404', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-23 18:02:35:595', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10405', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-23 18:02:35:644', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10406', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-23 18:02:35:694', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10407', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-23 18:02:35:742', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10408', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-23 18:02:35:788', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10409', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-23 18:02:35:810', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10410', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-8', '2017-03-23 18:02:40:506', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313635}]');
INSERT INTO `logs` VALUES ('10411', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-23 18:02:40:508', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490263313636}]');
INSERT INTO `logs` VALUES ('10412', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-8', '2017-03-23 18:02:40:533', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@6dd46f7 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263313635}]');
INSERT INTO `logs` VALUES ('10413', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-23 18:02:40:554', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@7ee7f487 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490263313636}]');
INSERT INTO `logs` VALUES ('10414', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-23 18:02:40:573', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10415', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:02:40:595', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10416', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-23 18:02:40:617', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10417', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:02:40:639', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10418', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-23 18:02:40:664', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10419', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:02:40:686', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10420', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-5', '2017-03-23 18:03:40:580', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263420407}]');
INSERT INTO `logs` VALUES ('10421', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-5', '2017-03-23 18:03:40:619', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@7c9c3475 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263420407}]');
INSERT INTO `logs` VALUES ('10422', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-23 18:03:40:637', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10423', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-23 18:03:40:670', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10424', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-23 18:03:40:697', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10425', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-1', '2017-03-23 18:03:46:852', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263426786}]');
INSERT INTO `logs` VALUES ('10426', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-1', '2017-03-23 18:03:46:884', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@4e18bf8b ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263426786}]');
INSERT INTO `logs` VALUES ('10427', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:46:914', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10428', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:46:936', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10429', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:46:963', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10430', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-1', '2017-03-23 18:03:47:994', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263427930}]');
INSERT INTO `logs` VALUES ('10431', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-1', '2017-03-23 18:03:48:029', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@512e3240 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263427930}]');
INSERT INTO `logs` VALUES ('10432', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:48:059', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10433', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:48:080', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10434', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:48:108', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10435', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-1', '2017-03-23 18:03:48:843', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263428777}]');
INSERT INTO `logs` VALUES ('10436', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-1', '2017-03-23 18:03:48:873', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@6cb83ecc ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263428777}]');
INSERT INTO `logs` VALUES ('10437', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:48:903', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10438', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:48:936', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10439', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:48:963', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10440', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-1', '2017-03-23 18:03:49:548', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263429487}]');
INSERT INTO `logs` VALUES ('10441', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-1', '2017-03-23 18:03:49:573', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@45fa20fe ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263429487}]');
INSERT INTO `logs` VALUES ('10442', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:49:605', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10443', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:49:717', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10444', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:49:752', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10445', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-1', '2017-03-23 18:03:53:236', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263433175}]');
INSERT INTO `logs` VALUES ('10446', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-1', '2017-03-23 18:03:53:262', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@7eafbdcc ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263433175}]');
INSERT INTO `logs` VALUES ('10447', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:53:293', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10448', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:53:315', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10449', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:53:342', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10450', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-1', '2017-03-23 18:03:53:936', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263433874}]');
INSERT INTO `logs` VALUES ('10451', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-1', '2017-03-23 18:03:53:974', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@7a7c25fb ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263433874}]');
INSERT INTO `logs` VALUES ('10452', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:54:004', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10453', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:54:025', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10454', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-23 18:03:54:053', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10455', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-3', '2017-03-23 18:07:35:899', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263654357}]');
INSERT INTO `logs` VALUES ('10456', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-23 18:07:35:904', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490263654358}]');
INSERT INTO `logs` VALUES ('10457', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-3', '2017-03-23 18:07:35:947', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@2b8224ca ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263654357}]');
INSERT INTO `logs` VALUES ('10458', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-23 18:07:35:966', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@262979c0 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490263654358}]');
INSERT INTO `logs` VALUES ('10459', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-23 18:07:35:986', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10460', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:07:36:011', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10461', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-23 18:07:36:029', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10462', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:07:36:052', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10463', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-23 18:07:36:077', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10464', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:07:36:099', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10465', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-23 18:07:50:266', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=26, _=1490263654359}]');
INSERT INTO `logs` VALUES ('10466', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-23 18:07:50:289', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@44d8b552 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=26, _=1490263654359}]');
INSERT INTO `logs` VALUES ('10467', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:07:50:319', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ?, ? ');
INSERT INTO `logs` VALUES ('10468', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:07:50:341', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 250(Integer), 10(Integer)');
INSERT INTO `logs` VALUES ('10469', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:07:50:437', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10470', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-23 18:07:54:478', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=26, _=1490263654360}]');
INSERT INTO `logs` VALUES ('10471', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-23 18:07:54:511', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@4477ca01 ] params=[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=26, _=1490263654360}]');
INSERT INTO `logs` VALUES ('10472', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:07:54:530', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ?, ? ');
INSERT INTO `logs` VALUES ('10473', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:07:54:551', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 2500(Integer), 100(Integer)');
INSERT INTO `logs` VALUES ('10474', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:07:54:662', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 100');
INSERT INTO `logs` VALUES ('10475', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-23 18:07:58:547', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=38, _=1490263654361}]');
INSERT INTO `logs` VALUES ('10476', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-23 18:07:58:578', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@6ae011a5 ] params=[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=38, _=1490263654361}]');
INSERT INTO `logs` VALUES ('10477', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:07:58:597', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ?, ? ');
INSERT INTO `logs` VALUES ('10478', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:07:58:618', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 3700(Integer), 100(Integer)');
INSERT INTO `logs` VALUES ('10479', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:07:58:711', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 100');
INSERT INTO `logs` VALUES ('10480', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-23 18:08:03:729', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=28, _=1490263654362}]');
INSERT INTO `logs` VALUES ('10481', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-23 18:08:03:755', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@68d279ef ] params=[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=28, _=1490263654362}]');
INSERT INTO `logs` VALUES ('10482', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:03:774', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ?, ? ');
INSERT INTO `logs` VALUES ('10483', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:03:796', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 2700(Integer), 100(Integer)');
INSERT INTO `logs` VALUES ('10484', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:03:902', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 100');
INSERT INTO `logs` VALUES ('10485', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-23 18:08:07:696', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=37, _=1490263654363}]');
INSERT INTO `logs` VALUES ('10486', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-23 18:08:07:733', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@3eadc753 ] params=[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=37, _=1490263654363}]');
INSERT INTO `logs` VALUES ('10487', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:07:751', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ?, ? ');
INSERT INTO `logs` VALUES ('10488', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:07:773', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 3600(Integer), 100(Integer)');
INSERT INTO `logs` VALUES ('10489', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:07:865', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 100');
INSERT INTO `logs` VALUES ('10490', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-23 18:08:10:861', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=38, _=1490263654364}]');
INSERT INTO `logs` VALUES ('10491', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-23 18:08:10:899', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@3851229e ] params=[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=38, _=1490263654364}]');
INSERT INTO `logs` VALUES ('10492', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:10:918', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ?, ? ');
INSERT INTO `logs` VALUES ('10493', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:10:940', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 3700(Integer), 100(Integer)');
INSERT INTO `logs` VALUES ('10494', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:10:990', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 100');
INSERT INTO `logs` VALUES ('10495', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-23 18:08:22:959', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263702828}]');
INSERT INTO `logs` VALUES ('10496', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-23 18:08:22:999', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@28eecbe ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263702828}]');
INSERT INTO `logs` VALUES ('10497', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:23:018', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10498', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:23:040', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10499', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:23:064', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10500', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-23 18:08:26:718', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=1, _=1490263702829}]');
INSERT INTO `logs` VALUES ('10501', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-23 18:08:26:743', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@2d872762 ] params=[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=1, _=1490263702829}]');
INSERT INTO `logs` VALUES ('10502', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:26:768', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10503', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:26:784', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 100(Integer)');
INSERT INTO `logs` VALUES ('10504', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:26:898', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 100');
INSERT INTO `logs` VALUES ('10505', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-23 18:08:38:750', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263716744}]');
INSERT INTO `logs` VALUES ('10506', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-23 18:08:38:754', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490263716745}]');
INSERT INTO `logs` VALUES ('10507', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-23 18:08:38:787', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@97cf9fb ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490263716744}]');
INSERT INTO `logs` VALUES ('10508', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-23 18:08:38:810', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@6fec0789 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490263716745}]');
INSERT INTO `logs` VALUES ('10509', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:38:829', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10510', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:08:38:852', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10511', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:38:873', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10512', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:08:38:895', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10513', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-23 18:08:38:930', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10514', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:08:38:954', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10515', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-23 18:08:49:495', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=1, _=1490263716746}]');
INSERT INTO `logs` VALUES ('10516', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-23 18:08:49:521', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@e8af51f ] params=[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=1, _=1490263716746}]');
INSERT INTO `logs` VALUES ('10517', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:08:49:540', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10518', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:08:49:562', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 100(Integer)');
INSERT INTO `logs` VALUES ('10519', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:08:49:623', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 100');
INSERT INTO `logs` VALUES ('10520', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-23 18:08:54:676', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=3, _=1490263702830}]');
INSERT INTO `logs` VALUES ('10521', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-23 18:08:54:709', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@68838ef5 ] params=[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=3, _=1490263702830}]');
INSERT INTO `logs` VALUES ('10522', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:08:54:728', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ?, ? ');
INSERT INTO `logs` VALUES ('10523', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:08:54:750', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 200(Integer), 100(Integer)');
INSERT INTO `logs` VALUES ('10524', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:08:54:866', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 100');
INSERT INTO `logs` VALUES ('10525', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-23 18:08:59:030', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=5, _=1490263716747}]');
INSERT INTO `logs` VALUES ('10526', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-23 18:08:59:054', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@d2bc7d6 ] params=[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=5, _=1490263716747}]');
INSERT INTO `logs` VALUES ('10527', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:08:59:072', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ?, ? ');
INSERT INTO `logs` VALUES ('10528', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:08:59:094', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 400(Integer), 100(Integer)');
INSERT INTO `logs` VALUES ('10529', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:08:59:192', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 100');
INSERT INTO `logs` VALUES ('10530', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-23 18:09:02:955', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=4, _=1490263702831}]');
INSERT INTO `logs` VALUES ('10531', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-23 18:09:02:998', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@12439460 ] params=[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=4, _=1490263702831}]');
INSERT INTO `logs` VALUES ('10532', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:03:017', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ?, ? ');
INSERT INTO `logs` VALUES ('10533', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:03:038', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 300(Integer), 100(Integer)');
INSERT INTO `logs` VALUES ('10534', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:03:125', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 100');
INSERT INTO `logs` VALUES ('10535', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-23 18:09:05:943', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=228, _=1490263716748}]');
INSERT INTO `logs` VALUES ('10536', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-23 18:09:05:988', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@26e05a53 ] params=[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=228, _=1490263716748}]');
INSERT INTO `logs` VALUES ('10537', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:06:006', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ?, ? ');
INSERT INTO `logs` VALUES ('10538', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:06:028', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 22700(Integer), 100(Integer)');
INSERT INTO `logs` VALUES ('10539', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:06:138', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 31');
INSERT INTO `logs` VALUES ('10540', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-23 18:09:09:459', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=228, _=1490263702832}]');
INSERT INTO `logs` VALUES ('10541', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-23 18:09:09:487', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@4460dce2 ] params=[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=228, _=1490263702832}]');
INSERT INTO `logs` VALUES ('10542', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:09:506', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ?, ? ');
INSERT INTO `logs` VALUES ('10543', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:09:528', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 22700(Integer), 100(Integer)');
INSERT INTO `logs` VALUES ('10544', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:09:557', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 31');
INSERT INTO `logs` VALUES ('10545', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-23 18:09:13:620', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=224, _=1490263716749}]');
INSERT INTO `logs` VALUES ('10546', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-23 18:09:13:654', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@70a23031 ] params=[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=224, _=1490263716749}]');
INSERT INTO `logs` VALUES ('10547', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:13:672', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ?, ? ');
INSERT INTO `logs` VALUES ('10548', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:13:694', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 22300(Integer), 100(Integer)');
INSERT INTO `logs` VALUES ('10549', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:13:799', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 100');
INSERT INTO `logs` VALUES ('10550', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-23 18:09:18:228', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=224, _=1490263702833}]');
INSERT INTO `logs` VALUES ('10551', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-23 18:09:18:265', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@4f97abe8 ] params=[{sortName=pkid, sortOrder=asc, pageSize=100, pageNumber=224, _=1490263702833}]');
INSERT INTO `logs` VALUES ('10552', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:18:283', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ?, ? ');
INSERT INTO `logs` VALUES ('10553', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:18:305', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 22300(Integer), 100(Integer)');
INSERT INTO `logs` VALUES ('10554', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-23 18:09:18:356', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 100');
INSERT INTO `logs` VALUES ('10555', 'INFO', 'org.quartz.core.QuartzScheduler', 'localhost-startStop-1', '2017-03-27 10:13:30:062', '', 'Quartz Scheduler v.1.5.1 created.');
INSERT INTO `logs` VALUES ('10556', 'INFO', 'org.quartz.simpl.RAMJobStore', 'localhost-startStop-1', '2017-03-27 10:13:30:066', '', 'RAMJobStore initialized.');
INSERT INTO `logs` VALUES ('10557', 'INFO', 'org.quartz.impl.StdSchedulerFactory', 'localhost-startStop-1', '2017-03-27 10:13:30:066', '', 'Quartz scheduler version: 1.5.1');
INSERT INTO `logs` VALUES ('10558', 'INFO', 'org.quartz.core.QuartzScheduler', 'localhost-startStop-1', '2017-03-27 10:13:30:068', '', 'JobFactory set to: org.springframework.scheduling.quartz.AdaptableJobFactory@1a8be626');
INSERT INTO `logs` VALUES ('10559', 'INFO', 'org.quartz.core.QuartzScheduler', 'localhost-startStop-1', '2017-03-27 10:13:30:083', '', 'Scheduler org.springframework.scheduling.quartz.SchedulerFactoryBean#0_$_NON_CLUSTERED started.');
INSERT INTO `logs` VALUES ('10560', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-9', '2017-03-27 10:13:30:088', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10561', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-9', '2017-03-27 10:13:35:017', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10562', 'INFO', 'com.fwd.common.filter.PageEhCacheFilter', 'http-bio-8088-exec-4', '2017-03-27 10:13:35:920', 'org.apache.ibatis.logging.log4j.Log4jImpl.debug(Log4jImpl.java:57)', '当前被缓存地址：/mybatis_mvc/preLogin.do	 查询参数：null');
INSERT INTO `logs` VALUES ('10563', 'INFO', 'com.fwd.common.CommonController', 'http-bio-8088-exec-4', '2017-03-27 10:13:35:937', '', '执行ClientUserController.preLogin()  开始');
INSERT INTO `logs` VALUES ('10564', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-8', '2017-03-27 10:13:40:011', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10565', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-1', '2017-03-27 10:13:45:016', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10566', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-1', '2017-03-27 10:13:50:017', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10567', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-1', '2017-03-27 10:13:55:018', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10568', 'DEBUG', 'com.fwd.common.CommonController', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:299', '', '执行CommonController.login()  开始');
INSERT INTO `logs` VALUES ('10569', 'INFO', 'com.fwd.mvc.service.impl.UserLoginfServiceImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:300', '', '执行UserLoginfServiceImpl.queryData： mp=>{username=zhangsan}');
INSERT INTO `logs` VALUES ('10570', 'DEBUG', 'com.fwd.mvc.dao.impl.UserLoginfDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:300', '', '执行UserLoginfDaoImpl.queryData： mp=>{username=zhangsan}');
INSERT INTO `logs` VALUES ('10571', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:300', '', '执行BaseDaoImpl.queryData： mp=>{username=zhangsan}');
INSERT INTO `logs` VALUES ('10572', 'DEBUG', 'com.fwd.mvc.mapper.UserLoginf.select', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:666', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: SELECT ID,USERNAME,PASSWORD,SUCCESS,LOGINTIME FROM USER_LOGINF WHERE USERNAME = ? ');
INSERT INTO `logs` VALUES ('10573', 'DEBUG', 'com.fwd.mvc.mapper.UserLoginf.select', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:698', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: zhangsan(String)');
INSERT INTO `logs` VALUES ('10574', 'DEBUG', 'com.fwd.mvc.mapper.UserLoginf.select', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:779', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 0');
INSERT INTO `logs` VALUES ('10575', 'INFO', 'com.fwd.mvc.service.impl.ClientUserServiceImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:783', '', '执行ClientUserServiceImpl.queryData： mp=>{uname=zhangsan, password=b65f414eaa7caf8914faacb2a211570f}');
INSERT INTO `logs` VALUES ('10576', 'DEBUG', 'com.fwd.mvc.dao.impl.ClientUserDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:785', '', '执行ClientUserDaoImpl.queryData： mp=>{uname=zhangsan, password=b65f414eaa7caf8914faacb2a211570f}');
INSERT INTO `logs` VALUES ('10577', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:786', '', '执行BaseDaoImpl.queryData： mp=>{uname=zhangsan, password=b65f414eaa7caf8914faacb2a211570f}');
INSERT INTO `logs` VALUES ('10578', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.select', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:787', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: SELECT PKID,UNAME,PASSWORD,STATUS,MEMO,CREATE_DATE, LOGIN_DATE,EMAIL,ACTIVEDATE,REMARK,REMARK1,REMARK2, REMARK3 FROM CLIENT_USER WHERE UNAME = ? AND PASSWORD = ? ');
INSERT INTO `logs` VALUES ('10579', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.select', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:788', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: zhangsan(String), b65f414eaa7caf8914faacb2a211570f(String)');
INSERT INTO `logs` VALUES ('10580', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.select', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:828', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 1');
INSERT INTO `logs` VALUES ('10581', 'INFO', 'com.fwd.mvc.service.impl.ClientUserServiceImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:829', '', '执行ClientUserServiceImpl.update： object=>com.fwd.mvc.model.ClientUser@fc02c2f');
INSERT INTO `logs` VALUES ('10582', 'DEBUG', 'com.fwd.mvc.dao.impl.ClientUserDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:829', '', '执行ClientUserDaoImpl.update： object=[com.fwd.mvc.model.ClientUser@fc02c2f]');
INSERT INTO `logs` VALUES ('10583', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:829', '', '执行BaseDaoImpl.update： object=[com.fwd.mvc.model.ClientUser@fc02c2f]');
INSERT INTO `logs` VALUES ('10584', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.update', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:830', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: UPDATE CLIENT_USER SET UNAME = ?, PASSWORD = ?, STATUS = ?, MEMO = ?, CREATE_DATE = ?, LOGIN_DATE = ?, EMAIL = ?, REMARK1 = ? WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10585', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.update', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:831', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: zhangsan(String), b65f414eaa7caf8914faacb2a211570f(String), 1(String), 管理员(String), 2015-11-12 00:00:00.0(Timestamp), 2017-03-27 10:13:55.829(Timestamp), 835897006@qq.com(String), (String), 123456789(String)');
INSERT INTO `logs` VALUES ('10586', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.update', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:868', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10587', 'INFO', 'com.fwd.mvc.service.impl.ClientUserServiceImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:868', '', '执行ClientUserServiceImpl.queryLoginRights： mp=>{pkid=123456789}');
INSERT INTO `logs` VALUES ('10588', 'DEBUG', 'com.fwd.mvc.dao.impl.ClientUserDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:869', '', '执行ClientUserDaoImpl.queryData： mp=>{pkid=123456789}');
INSERT INTO `logs` VALUES ('10589', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:869', '', '执行BaseDaoImpl.queryData： mp=>{pkid=123456789}');
INSERT INTO `logs` VALUES ('10590', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRights', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:869', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: SELECT P.* FROM CLIENT_USER U, CLIENT_ROLE R, USER_ROLE UR, POPEDOM P, ROLE_POPEDOM RP WHERE U.PKID=? AND U.PKID=UR.USER_ID AND UR.ROLE_ID=R.PKID AND RP.ROLE_ID=R.PKID AND RP.POP_ID=P.PKID ');
INSERT INTO `logs` VALUES ('10591', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRights', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:870', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 123456789(String)');
INSERT INTO `logs` VALUES ('10592', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRights', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:922', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 6');
INSERT INTO `logs` VALUES ('10593', 'INFO', 'com.fwd.mvc.service.impl.ClientUserServiceImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:929', '', '执行ClientUserServiceImpl.queryLoginRoles： mp=>{pkid=123456789}');
INSERT INTO `logs` VALUES ('10594', 'DEBUG', 'com.fwd.mvc.dao.impl.ClientUserDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:929', '', '执行ClientUserDaoImpl.queryLoginRoles： mp=>{pkid=123456789}');
INSERT INTO `logs` VALUES ('10595', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:929', '', '执行BaseDaoImpl.queryData： mp=>{pkid=123456789}');
INSERT INTO `logs` VALUES ('10596', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRoles', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:930', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: SELECT R.* FROM CLIENT_USER U, CLIENT_ROLE R, USER_ROLE UR WHERE U.PKID=? AND U.PKID=UR.USER_ID AND UR.ROLE_ID=R.PKID ');
INSERT INTO `logs` VALUES ('10597', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRoles', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:930', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 123456789(String)');
INSERT INTO `logs` VALUES ('10598', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRoles', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:932', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 1');
INSERT INTO `logs` VALUES ('10599', 'INFO', 'com.fwd.common.filter.PageEhCacheFilter', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:942', 'org.apache.ibatis.logging.log4j.Log4jImpl.debug(Log4jImpl.java:57)', '当前被缓存地址：/mybatis_mvc/index.do	 查询参数：null');
INSERT INTO `logs` VALUES ('10600', 'DEBUG', 'com.fwd.common.CommonController', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:950', '', '执行CommonController.index()  开始');
INSERT INTO `logs` VALUES ('10601', 'INFO', 'com.fwd.mvc.service.impl.ClientUserServiceImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:55:950', '', '执行ClientUserServiceImpl.queryLoginRoleTree： mp=>{role_Id=147258369}');
INSERT INTO `logs` VALUES ('10602', 'DEBUG', 'com.fwd.mvc.dao.impl.ClientUserDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:56:003', '', '执行ClientUserDaoImpl.queryLoginRoleTree： mp=>{role_Id=147258369}');
INSERT INTO `logs` VALUES ('10603', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 10:13:56:003', '', '执行BaseDaoImpl.queryData： mp=>{role_Id=147258369}');
INSERT INTO `logs` VALUES ('10604', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRoleTree', 'http-bio-8088-exec-10', '2017-03-27 10:13:56:004', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: SELECT RT.nodeId as id, RT.nodeName as name, RT.parentId as pId, RT.exeUrl FROM ROLE_TREE RT WHERE RT.ROLE_ID=? ORDER BY RT.NODEID ASC,RT.PARENTID ASC ');
INSERT INTO `logs` VALUES ('10605', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRoleTree', 'http-bio-8088-exec-10', '2017-03-27 10:13:56:004', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 147258369(String)');
INSERT INTO `logs` VALUES ('10606', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRoleTree', 'http-bio-8088-exec-10', '2017-03-27 10:13:56:009', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 13');
INSERT INTO `logs` VALUES ('10607', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-5', '2017-03-27 10:14:00:014', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10608', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-2', '2017-03-27 10:14:05:016', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10609', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-3', '2017-03-27 10:14:10:016', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10610', 'DEBUG', 'com.fwd.mvc.dao.impl.ClientUserDaoImpl', 'http-bio-8088-exec-6', '2017-03-27 10:14:13:797', '', '执行ClientUserDaoImpl.queryLoginBtnRights： mp=>{modal=staff, roleId=147258369}');
INSERT INTO `logs` VALUES ('10611', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-6', '2017-03-27 10:14:13:799', '', '执行BaseDaoImpl.queryData： mp=>{modal=staff, roleId=147258369}');
INSERT INTO `logs` VALUES ('10612', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginBtnRights', 'http-bio-8088-exec-6', '2017-03-27 10:14:13:800', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: SELECT distinct B.* FROM BTN B,ROLE_BTN RB WHERE RB.ROLE_ID=? AND RB.BTN_ID=B.PKID AND B.MODAL = ? ');
INSERT INTO `logs` VALUES ('10613', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginBtnRights', 'http-bio-8088-exec-6', '2017-03-27 10:14:13:800', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 147258369(String), staff(String)');
INSERT INTO `logs` VALUES ('10614', 'DEBUG', 'com.fwd.mvc.dao.impl.ClientUserDaoImpl', 'http-bio-8088-exec-8', '2017-03-27 10:14:13:802', '', '执行ClientUserDaoImpl.queryLoginBtnRights： mp=>{modal=staff, roleId=147258369}');
INSERT INTO `logs` VALUES ('10615', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-8', '2017-03-27 10:14:13:803', '', '执行BaseDaoImpl.queryData： mp=>{modal=staff, roleId=147258369}');
INSERT INTO `logs` VALUES ('10616', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginBtnRights', 'http-bio-8088-exec-8', '2017-03-27 10:14:13:803', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: SELECT distinct B.* FROM BTN B,ROLE_BTN RB WHERE RB.ROLE_ID=? AND RB.BTN_ID=B.PKID AND B.MODAL = ? ');
INSERT INTO `logs` VALUES ('10617', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginBtnRights', 'http-bio-8088-exec-8', '2017-03-27 10:14:13:805', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 147258369(String), staff(String)');
INSERT INTO `logs` VALUES ('10618', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginBtnRights', 'http-bio-8088-exec-8', '2017-03-27 10:14:13:844', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 5');
INSERT INTO `logs` VALUES ('10619', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginBtnRights', 'http-bio-8088-exec-6', '2017-03-27 10:14:13:844', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 5');
INSERT INTO `logs` VALUES ('10620', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-3', '2017-03-27 10:14:14:299', '', '执行StaffController.selectPage() 查询表格数据 param[{page=1, rows=1, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10621', 'INFO', 'com.fwd.mvc.service.impl.StaffServiceImpl', 'http-bio-8088-exec-3', '2017-03-27 10:14:14:299', '', '执行StaffServiceImpl.selectPage： pageInfo=>com.fwd.common.page.PageInfo@1f53b2b3params=>{page=1, rows=1, sort=pkid, order=asc}');
INSERT INTO `logs` VALUES ('10622', 'DEBUG', 'com.fwd.mvc.dao.impl.StaffDaoImpl', 'http-bio-8088-exec-3', '2017-03-27 10:14:14:299', '', '执行StaffDaoImpl.selectPage： pageInfo=[com.fwd.common.page.PageInfo@1f53b2b3 ] params=[{page=1, rows=1, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10623', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-3', '2017-03-27 10:14:14:300', '', '执行BaseDaoImpl.selectPage： pageInfo=[com.fwd.common.page.PageInfo@1f53b2b3 ] params=[{page=1, rows=1, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10624', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-27 10:14:14:306', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10625', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-27 10:14:14:307', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 1(Integer)');
INSERT INTO `logs` VALUES ('10626', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-27 10:14:14:461', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 1');
INSERT INTO `logs` VALUES ('10627', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-2', '2017-03-27 10:14:15:013', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10628', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-9', '2017-03-27 10:14:20:015', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10629', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-3', '2017-03-27 10:14:24:038', '', '执行StaffController.selectPage() 查询表格数据 param[{page=1, rows=5, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10630', 'INFO', 'com.fwd.mvc.service.impl.StaffServiceImpl', 'http-bio-8088-exec-3', '2017-03-27 10:14:24:038', '', '执行StaffServiceImpl.selectPage： pageInfo=>com.fwd.common.page.PageInfo@34fa49bbparams=>{page=1, rows=5, sort=pkid, order=asc}');
INSERT INTO `logs` VALUES ('10631', 'DEBUG', 'com.fwd.mvc.dao.impl.StaffDaoImpl', 'http-bio-8088-exec-3', '2017-03-27 10:14:24:038', '', '执行StaffDaoImpl.selectPage： pageInfo=[com.fwd.common.page.PageInfo@34fa49bb ] params=[{page=1, rows=5, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10632', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-3', '2017-03-27 10:14:24:038', '', '执行BaseDaoImpl.selectPage： pageInfo=[com.fwd.common.page.PageInfo@34fa49bb ] params=[{page=1, rows=5, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10633', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-27 10:14:24:039', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10634', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-27 10:14:24:039', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 5(Integer)');
INSERT INTO `logs` VALUES ('10635', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-3', '2017-03-27 10:14:24:093', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 5');
INSERT INTO `logs` VALUES ('10636', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-6', '2017-03-27 10:14:25:016', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10637', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-4', '2017-03-27 10:14:30:017', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10638', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-7', '2017-03-27 10:14:35:013', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10639', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-3', '2017-03-27 10:14:40:015', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10640', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-9', '2017-03-27 10:14:45:017', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10641', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-9', '2017-03-27 10:14:50:019', '', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10642', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-6', '2017-03-27 10:14:52:089', '', '执行StaffController.saveData() 保存表格数据 param[{EditType=Delete, jsonData=[{\"age\":129,\"createDate\":\"2016-08-18 09:20:00\",\"pkid\":\"16081821200083495571\",\"sex\":\"女\",\"sname\":\"马容\"}]}]');
INSERT INTO `logs` VALUES ('10643', 'INFO', 'com.fwd.mvc.service.impl.StaffServiceImpl', 'http-bio-8088-exec-6', '2017-03-27 10:14:52:129', '', 'StaffServiceImpl.delete： pk=>16081821200083495571');
INSERT INTO `logs` VALUES ('10644', 'DEBUG', 'com.fwd.mvc.dao.impl.StaffDaoImpl', 'http-bio-8088-exec-6', '2017-03-27 10:14:52:129', '', 'StaffDaoImpl.delete： pk==[16081821200083495571]');
INSERT INTO `logs` VALUES ('10645', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-6', '2017-03-27 10:14:52:129', '', 'BaseDaoImpl.delete： pk==[16081821200083495571]');
INSERT INTO `logs` VALUES ('10646', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-6', '2017-03-27 10:14:52:129', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: DELETE FROM STAFF WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10647', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-6', '2017-03-27 10:14:52:130', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 16081821200083495571(String)');
INSERT INTO `logs` VALUES ('10648', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-6', '2017-03-27 10:14:52:154', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10649', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-6', '2017-03-27 10:14:52:182', '', '执行StaffController.selectPage() 查询表格数据 param[{page=1, rows=5, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10650', 'INFO', 'com.fwd.mvc.service.impl.StaffServiceImpl', 'http-bio-8088-exec-6', '2017-03-27 10:14:52:182', '', '执行StaffServiceImpl.selectPage： pageInfo=>com.fwd.common.page.PageInfo@644e60eeparams=>{page=1, rows=5, sort=pkid, order=asc}');
INSERT INTO `logs` VALUES ('10651', 'DEBUG', 'com.fwd.mvc.dao.impl.StaffDaoImpl', 'http-bio-8088-exec-6', '2017-03-27 10:14:52:182', '', '执行StaffDaoImpl.selectPage： pageInfo=[com.fwd.common.page.PageInfo@644e60ee ] params=[{page=1, rows=5, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10652', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-6', '2017-03-27 10:14:52:182', '', '执行BaseDaoImpl.selectPage： pageInfo=[com.fwd.common.page.PageInfo@644e60ee ] params=[{page=1, rows=5, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10653', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 10:14:52:183', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10654', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-6', '2017-03-27 10:35:17:110', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490582116844}]');
INSERT INTO `logs` VALUES ('10655', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-6', '2017-03-27 10:35:17:382', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@397c1057 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490582116844}]');
INSERT INTO `logs` VALUES ('10656', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 10:35:17:553', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10657', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 10:35:17:653', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10658', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 10:35:17:759', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10659', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-8', '2017-03-27 10:35:30:658', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490582121366}]');
INSERT INTO `logs` VALUES ('10660', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-27 10:35:30:668', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490582121367}]');
INSERT INTO `logs` VALUES ('10661', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-8', '2017-03-27 10:35:30:690', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@4014ab56 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490582121366}]');
INSERT INTO `logs` VALUES ('10662', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-27 10:35:30:712', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@29a04491 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490582121367}]');
INSERT INTO `logs` VALUES ('10663', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 10:35:30:741', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10664', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-27 10:35:30:764', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10665', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 10:35:30:785', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10666', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-27 10:35:30:807', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10667', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 10:35:30:836', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10668', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-27 10:35:30:855', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10669', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-1', '2017-03-27 10:36:12:416', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490582121369}]');
INSERT INTO `logs` VALUES ('10670', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-1', '2017-03-27 10:36:12:455', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@2bce105 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490582121369}]');
INSERT INTO `logs` VALUES ('10671', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 10:36:12:473', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10672', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 10:36:12:495', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10673', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 10:36:12:521', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10674', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-4', '2017-03-27 10:36:30:829', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490582189108}]');
INSERT INTO `logs` VALUES ('10675', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-7', '2017-03-27 10:36:30:837', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490582189109}]');
INSERT INTO `logs` VALUES ('10676', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-4', '2017-03-27 10:36:30:866', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@aa01b70 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490582189108}]');
INSERT INTO `logs` VALUES ('10677', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-7', '2017-03-27 10:36:30:884', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@5dee330c ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490582189109}]');
INSERT INTO `logs` VALUES ('10678', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 10:36:30:907', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10679', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-27 10:36:30:929', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10680', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 10:36:30:951', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10681', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-27 10:36:30:974', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10682', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 10:36:31:102', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10683', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-27 10:36:31:133', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10684', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-27 10:36:50:557', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sort=pkid, order=asc, offset=0, limit=10, _=1490582210347}]');
INSERT INTO `logs` VALUES ('10685', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-8', '2017-03-27 10:36:50:586', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sort=pkid, order=asc, offset=0, limit=10, _=1490582210348}]');
INSERT INTO `logs` VALUES ('10686', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-27 10:36:50:609', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@1d4fc1f8 ] params=[{sort=pkid, order=asc, offset=0, limit=10, _=1490582210347}]');
INSERT INTO `logs` VALUES ('10687', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-8', '2017-03-27 10:36:50:631', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@50fbd0a5 ] params=[{sort=pkid, order=asc, offset=0, limit=10, _=1490582210348}]');
INSERT INTO `logs` VALUES ('10688', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-27 10:36:50:651', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10689', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 10:36:50:673', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10690', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-27 10:36:50:694', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10691', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 10:36:50:728', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10692', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-27 10:36:50:753', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10693', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 10:36:50:777', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10694', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-8', '2017-03-27 10:36:59:908', 'com.fwd.mvc.controller.StaffController.saveData(StaffController.java:252)', '执行StaffController.saveData() 保存表格数据 param[{EditType=Edit, jsonData=[{\"pkid\":\"16081821200083327873\",\"sname\":\"王尼玛\",\"sex\":\"女\",\"age\":126,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":false}]}]');
INSERT INTO `logs` VALUES ('10695', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-8', '2017-03-27 10:37:00:061', 'com.fwd.common.dao.BaseDao.update(BaseDao.java:82)', '执行BaseDao.update： object=[com.fwd.mvc.model.Staff@193f239e]');
INSERT INTO `logs` VALUES ('10696', 'DEBUG', 'com.fwd.mvc.mapper.Staff.update', 'http-bio-8088-exec-8', '2017-03-27 10:37:00:083', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: UPDATE STAFF SET SNAME = ?, SEX = ?, AGE = ?, CREATE_DATE = ? WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10697', 'DEBUG', 'com.fwd.mvc.mapper.Staff.update', 'http-bio-8088-exec-8', '2017-03-27 10:37:00:109', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 王尼玛(String), 女(String), 126(Integer), 2016-08-18 21:20:00.0(Timestamp), 16081821200083327873(String)');
INSERT INTO `logs` VALUES ('10698', 'DEBUG', 'com.fwd.mvc.mapper.Staff.update', 'http-bio-8088-exec-8', '2017-03-27 10:37:00:149', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10699', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-8', '2017-03-27 10:37:01:864', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sort=pkid, order=asc, offset=0, limit=10, _=1490582210349}]');
INSERT INTO `logs` VALUES ('10700', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-8', '2017-03-27 10:37:01:888', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@275dc77a ] params=[{sort=pkid, order=asc, offset=0, limit=10, _=1490582210349}]');
INSERT INTO `logs` VALUES ('10701', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 10:37:01:905', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10702', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 10:37:01:928', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10703', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 10:37:02:006', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10704', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-5', '2017-03-27 10:38:00:703', 'com.fwd.mvc.controller.StaffController.saveData(StaffController.java:252)', '执行StaffController.saveData() 保存表格数据 param[{EditType=Edit, jsonData=[{\"pkid\":\"16081821200083352705\",\"sname\":\"王尼玛dsad\",\"sex\":\"男\",\"age\":120,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true}]}]');
INSERT INTO `logs` VALUES ('10705', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-5', '2017-03-27 10:38:00:760', 'com.fwd.common.dao.BaseDao.update(BaseDao.java:82)', '执行BaseDao.update： object=[com.fwd.mvc.model.Staff@5c658e0]');
INSERT INTO `logs` VALUES ('10706', 'DEBUG', 'com.fwd.mvc.mapper.Staff.update', 'http-bio-8088-exec-5', '2017-03-27 10:38:00:782', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: UPDATE STAFF SET SNAME = ?, SEX = ?, AGE = ?, CREATE_DATE = ? WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10707', 'DEBUG', 'com.fwd.mvc.mapper.Staff.update', 'http-bio-8088-exec-5', '2017-03-27 10:38:00:815', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 王尼玛dsad(String), 男(String), 120(Integer), 2016-08-18 21:20:00.0(Timestamp), 16081821200083352705(String)');
INSERT INTO `logs` VALUES ('10708', 'DEBUG', 'com.fwd.mvc.mapper.Staff.update', 'http-bio-8088-exec-5', '2017-03-27 10:38:00:859', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10709', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-5', '2017-03-27 10:38:02:270', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sort=pkid, order=asc, offset=0, limit=10, _=1490582210350}]');
INSERT INTO `logs` VALUES ('10710', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-5', '2017-03-27 10:38:02:309', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@4980de76 ] params=[{sort=pkid, order=asc, offset=0, limit=10, _=1490582210350}]');
INSERT INTO `logs` VALUES ('10711', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-27 10:38:02:338', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10712', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-27 10:38:02:359', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10713', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-27 10:38:02:475', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10714', 'INFO', 'org.quartz.core.QuartzScheduler', 'localhost-startStop-1', '2017-03-27 13:06:09:596', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Quartz Scheduler v.1.5.1 created.');
INSERT INTO `logs` VALUES ('10715', 'INFO', 'org.quartz.simpl.RAMJobStore', 'localhost-startStop-1', '2017-03-27 13:06:09:600', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'RAMJobStore initialized.');
INSERT INTO `logs` VALUES ('10716', 'INFO', 'org.quartz.impl.StdSchedulerFactory', 'localhost-startStop-1', '2017-03-27 13:06:09:601', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Quartz scheduler version: 1.5.1');
INSERT INTO `logs` VALUES ('10717', 'INFO', 'org.quartz.core.QuartzScheduler', 'localhost-startStop-1', '2017-03-27 13:06:09:602', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'JobFactory set to: org.springframework.scheduling.quartz.AdaptableJobFactory@43592469');
INSERT INTO `logs` VALUES ('10718', 'INFO', 'org.quartz.core.QuartzScheduler', 'localhost-startStop-1', '2017-03-27 13:06:09:617', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Scheduler org.springframework.scheduling.quartz.SchedulerFactoryBean#0_$_NON_CLUSTERED started.');
INSERT INTO `logs` VALUES ('10719', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-8', '2017-03-27 13:06:10:018', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10720', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-8', '2017-03-27 13:06:15:013', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10721', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-7', '2017-03-27 13:06:20:011', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10722', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-9', '2017-03-27 13:06:25:012', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10723', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-9', '2017-03-27 13:06:30:013', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10724', 'INFO', 'com.fwd.common.filter.PageEhCacheFilter', 'http-bio-8088-exec-10', '2017-03-27 13:06:31:640', 'org.apache.commons.logging.impl.Log4JLogger.debug(Log4JLogger.java:155)', '当前被缓存地址：/mybatis_mvc/preLogin.do	 查询参数：null');
INSERT INTO `logs` VALUES ('10725', 'INFO', 'com.fwd.common.CommonController', 'http-bio-8088-exec-10', '2017-03-27 13:06:31:664', '', '执行ClientUserController.preLogin()  开始');
INSERT INTO `logs` VALUES ('10726', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-6', '2017-03-27 13:06:35:012', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10727', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-6', '2017-03-27 13:06:40:013', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10728', 'DEBUG', 'com.fwd.common.CommonController', 'http-bio-8088-exec-10', '2017-03-27 13:06:43:621', '', '执行CommonController.login()  开始');
INSERT INTO `logs` VALUES ('10729', 'INFO', 'com.fwd.mvc.service.impl.UserLoginfServiceImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:43:621', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行UserLoginfServiceImpl.queryData： mp=>{username=zhangsan}');
INSERT INTO `logs` VALUES ('10730', 'DEBUG', 'com.fwd.mvc.dao.impl.UserLoginfDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:43:621', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行UserLoginfDaoImpl.queryData： mp=>{username=zhangsan}');
INSERT INTO `logs` VALUES ('10731', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:43:622', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行BaseDaoImpl.queryData： mp=>{username=zhangsan}');
INSERT INTO `logs` VALUES ('10732', 'DEBUG', 'com.fwd.mvc.mapper.UserLoginf.select', 'http-bio-8088-exec-10', '2017-03-27 13:06:43:960', '', '==>  Preparing: SELECT ID,USERNAME,PASSWORD,SUCCESS,LOGINTIME FROM USER_LOGINF WHERE USERNAME = ? ');
INSERT INTO `logs` VALUES ('10733', 'DEBUG', 'com.fwd.mvc.mapper.UserLoginf.select', 'http-bio-8088-exec-10', '2017-03-27 13:06:43:991', '', '==> Parameters: zhangsan(String)');
INSERT INTO `logs` VALUES ('10734', 'DEBUG', 'com.fwd.mvc.mapper.UserLoginf.select', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:015', '', '<==      Total: 0');
INSERT INTO `logs` VALUES ('10735', 'INFO', 'com.fwd.mvc.service.impl.ClientUserServiceImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:018', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行ClientUserServiceImpl.queryData： mp=>{uname=zhangsan, password=b65f414eaa7caf8914faacb2a211570f}');
INSERT INTO `logs` VALUES ('10736', 'DEBUG', 'com.fwd.mvc.dao.impl.ClientUserDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:021', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行ClientUserDaoImpl.queryData： mp=>{uname=zhangsan, password=b65f414eaa7caf8914faacb2a211570f}');
INSERT INTO `logs` VALUES ('10737', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:021', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行BaseDaoImpl.queryData： mp=>{uname=zhangsan, password=b65f414eaa7caf8914faacb2a211570f}');
INSERT INTO `logs` VALUES ('10738', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.select', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:023', '', '==>  Preparing: SELECT PKID,UNAME,PASSWORD,STATUS,MEMO,CREATE_DATE, LOGIN_DATE,EMAIL,ACTIVEDATE,REMARK,REMARK1,REMARK2, REMARK3 FROM CLIENT_USER WHERE UNAME = ? AND PASSWORD = ? ');
INSERT INTO `logs` VALUES ('10739', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.select', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:023', '', '==> Parameters: zhangsan(String), b65f414eaa7caf8914faacb2a211570f(String)');
INSERT INTO `logs` VALUES ('10740', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.select', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:032', '', '<==      Total: 1');
INSERT INTO `logs` VALUES ('10741', 'INFO', 'com.fwd.mvc.service.impl.ClientUserServiceImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:032', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行ClientUserServiceImpl.update： object=>com.fwd.mvc.model.ClientUser@2583fda0');
INSERT INTO `logs` VALUES ('10742', 'DEBUG', 'com.fwd.mvc.dao.impl.ClientUserDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:032', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行ClientUserDaoImpl.update： object=[com.fwd.mvc.model.ClientUser@2583fda0]');
INSERT INTO `logs` VALUES ('10743', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:032', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行BaseDaoImpl.update： object=[com.fwd.mvc.model.ClientUser@2583fda0]');
INSERT INTO `logs` VALUES ('10744', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.update', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:033', '', '==>  Preparing: UPDATE CLIENT_USER SET UNAME = ?, PASSWORD = ?, STATUS = ?, MEMO = ?, CREATE_DATE = ?, LOGIN_DATE = ?, EMAIL = ?, REMARK1 = ? WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10745', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.update', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:035', '', '==> Parameters: zhangsan(String), b65f414eaa7caf8914faacb2a211570f(String), 1(String), 管理员(String), 2015-11-12 00:00:00.0(Timestamp), 2017-03-27 13:06:44.032(Timestamp), 835897006@qq.com(String), (String), 123456789(String)');
INSERT INTO `logs` VALUES ('10746', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.update', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:074', '', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10747', 'INFO', 'com.fwd.mvc.service.impl.ClientUserServiceImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:074', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行ClientUserServiceImpl.queryLoginRights： mp=>{pkid=123456789}');
INSERT INTO `logs` VALUES ('10748', 'DEBUG', 'com.fwd.mvc.dao.impl.ClientUserDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:074', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行ClientUserDaoImpl.queryData： mp=>{pkid=123456789}');
INSERT INTO `logs` VALUES ('10749', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:074', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行BaseDaoImpl.queryData： mp=>{pkid=123456789}');
INSERT INTO `logs` VALUES ('10750', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRights', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:075', '', '==>  Preparing: SELECT P.* FROM CLIENT_USER U, CLIENT_ROLE R, USER_ROLE UR, POPEDOM P, ROLE_POPEDOM RP WHERE U.PKID=? AND U.PKID=UR.USER_ID AND UR.ROLE_ID=R.PKID AND RP.ROLE_ID=R.PKID AND RP.POP_ID=P.PKID ');
INSERT INTO `logs` VALUES ('10751', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRights', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:075', '', '==> Parameters: 123456789(String)');
INSERT INTO `logs` VALUES ('10752', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRights', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:080', '', '<==      Total: 6');
INSERT INTO `logs` VALUES ('10753', 'INFO', 'com.fwd.mvc.service.impl.ClientUserServiceImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:087', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行ClientUserServiceImpl.queryLoginRoles： mp=>{pkid=123456789}');
INSERT INTO `logs` VALUES ('10754', 'DEBUG', 'com.fwd.mvc.dao.impl.ClientUserDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:088', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行ClientUserDaoImpl.queryLoginRoles： mp=>{pkid=123456789}');
INSERT INTO `logs` VALUES ('10755', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:088', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行BaseDaoImpl.queryData： mp=>{pkid=123456789}');
INSERT INTO `logs` VALUES ('10756', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRoles', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:090', '', '==>  Preparing: SELECT R.* FROM CLIENT_USER U, CLIENT_ROLE R, USER_ROLE UR WHERE U.PKID=? AND U.PKID=UR.USER_ID AND UR.ROLE_ID=R.PKID ');
INSERT INTO `logs` VALUES ('10757', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRoles', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:091', '', '==> Parameters: 123456789(String)');
INSERT INTO `logs` VALUES ('10758', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRoles', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:093', '', '<==      Total: 1');
INSERT INTO `logs` VALUES ('10759', 'INFO', 'com.fwd.common.filter.PageEhCacheFilter', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:101', 'org.apache.commons.logging.impl.Log4JLogger.debug(Log4JLogger.java:155)', '当前被缓存地址：/mybatis_mvc/index.do	 查询参数：null');
INSERT INTO `logs` VALUES ('10760', 'DEBUG', 'com.fwd.common.CommonController', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:107', '', '执行CommonController.index()  开始');
INSERT INTO `logs` VALUES ('10761', 'INFO', 'com.fwd.mvc.service.impl.ClientUserServiceImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:108', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行ClientUserServiceImpl.queryLoginRoleTree： mp=>{role_Id=147258369}');
INSERT INTO `logs` VALUES ('10762', 'DEBUG', 'com.fwd.mvc.dao.impl.ClientUserDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:158', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行ClientUserDaoImpl.queryLoginRoleTree： mp=>{role_Id=147258369}');
INSERT INTO `logs` VALUES ('10763', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:158', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行BaseDaoImpl.queryData： mp=>{role_Id=147258369}');
INSERT INTO `logs` VALUES ('10764', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRoleTree', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:159', '', '==>  Preparing: SELECT RT.nodeId as id, RT.nodeName as name, RT.parentId as pId, RT.exeUrl FROM ROLE_TREE RT WHERE RT.ROLE_ID=? ORDER BY RT.NODEID ASC,RT.PARENTID ASC ');
INSERT INTO `logs` VALUES ('10765', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRoleTree', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:159', '', '==> Parameters: 147258369(String)');
INSERT INTO `logs` VALUES ('10766', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginRoleTree', 'http-bio-8088-exec-10', '2017-03-27 13:06:44:162', '', '<==      Total: 13');
INSERT INTO `logs` VALUES ('10767', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-7', '2017-03-27 13:06:45:015', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10768', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-2', '2017-03-27 13:06:50:017', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10769', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-2', '2017-03-27 13:06:55:018', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10770', 'DEBUG', 'com.fwd.mvc.dao.impl.ClientUserDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:59:165', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行ClientUserDaoImpl.queryLoginBtnRights： mp=>{modal=staff, roleId=147258369}');
INSERT INTO `logs` VALUES ('10771', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-10', '2017-03-27 13:06:59:165', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行BaseDaoImpl.queryData： mp=>{modal=staff, roleId=147258369}');
INSERT INTO `logs` VALUES ('10772', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginBtnRights', 'http-bio-8088-exec-10', '2017-03-27 13:06:59:166', '', '==>  Preparing: SELECT distinct B.* FROM BTN B,ROLE_BTN RB WHERE RB.ROLE_ID=? AND RB.BTN_ID=B.PKID AND B.MODAL = ? ');
INSERT INTO `logs` VALUES ('10773', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginBtnRights', 'http-bio-8088-exec-10', '2017-03-27 13:06:59:167', '', '==> Parameters: 147258369(String), staff(String)');
INSERT INTO `logs` VALUES ('10774', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginBtnRights', 'http-bio-8088-exec-10', '2017-03-27 13:06:59:170', '', '<==      Total: 5');
INSERT INTO `logs` VALUES ('10775', 'DEBUG', 'com.fwd.mvc.dao.impl.ClientUserDaoImpl', 'http-bio-8088-exec-7', '2017-03-27 13:06:59:171', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行ClientUserDaoImpl.queryLoginBtnRights： mp=>{modal=staff, roleId=147258369}');
INSERT INTO `logs` VALUES ('10776', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-7', '2017-03-27 13:06:59:171', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行BaseDaoImpl.queryData： mp=>{modal=staff, roleId=147258369}');
INSERT INTO `logs` VALUES ('10777', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginBtnRights', 'http-bio-8088-exec-7', '2017-03-27 13:06:59:172', '', '==>  Preparing: SELECT distinct B.* FROM BTN B,ROLE_BTN RB WHERE RB.ROLE_ID=? AND RB.BTN_ID=B.PKID AND B.MODAL = ? ');
INSERT INTO `logs` VALUES ('10778', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginBtnRights', 'http-bio-8088-exec-7', '2017-03-27 13:06:59:173', '', '==> Parameters: 147258369(String), staff(String)');
INSERT INTO `logs` VALUES ('10779', 'DEBUG', 'com.fwd.mvc.mapper.ClientUser.queryLoginBtnRights', 'http-bio-8088-exec-7', '2017-03-27 13:06:59:182', '', '<==      Total: 5');
INSERT INTO `logs` VALUES ('10780', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-7', '2017-03-27 13:06:59:601', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行StaffController.selectPage() 查询表格数据 param[{page=1, rows=1, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10781', 'INFO', 'com.fwd.mvc.service.impl.StaffServiceImpl', 'http-bio-8088-exec-7', '2017-03-27 13:06:59:602', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行StaffServiceImpl.selectPage： pageInfo=>com.fwd.common.page.PageInfo@618da39bparams=>{page=1, rows=1, sort=pkid, order=asc}');
INSERT INTO `logs` VALUES ('10782', 'DEBUG', 'com.fwd.mvc.dao.impl.StaffDaoImpl', 'http-bio-8088-exec-7', '2017-03-27 13:06:59:602', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行StaffDaoImpl.selectPage： pageInfo=[com.fwd.common.page.PageInfo@618da39b ] params=[{page=1, rows=1, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10783', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-7', '2017-03-27 13:06:59:602', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行BaseDaoImpl.selectPage： pageInfo=[com.fwd.common.page.PageInfo@618da39b ] params=[{page=1, rows=1, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10784', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-27 13:06:59:608', '', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10785', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-27 13:06:59:609', '', '==> Parameters: 1(Integer)');
INSERT INTO `logs` VALUES ('10786', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-27 13:06:59:661', '', '<==      Total: 1');
INSERT INTO `logs` VALUES ('10787', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-1', '2017-03-27 13:07:00:017', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10788', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-7', '2017-03-27 13:07:01:590', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行StaffController.selectPage() 查询表格数据 param[{page=1, rows=5, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10789', 'INFO', 'com.fwd.mvc.service.impl.StaffServiceImpl', 'http-bio-8088-exec-7', '2017-03-27 13:07:01:591', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行StaffServiceImpl.selectPage： pageInfo=>com.fwd.common.page.PageInfo@2b004b45params=>{page=1, rows=5, sort=pkid, order=asc}');
INSERT INTO `logs` VALUES ('10790', 'DEBUG', 'com.fwd.mvc.dao.impl.StaffDaoImpl', 'http-bio-8088-exec-7', '2017-03-27 13:07:01:591', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行StaffDaoImpl.selectPage： pageInfo=[com.fwd.common.page.PageInfo@2b004b45 ] params=[{page=1, rows=5, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10791', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-7', '2017-03-27 13:07:01:591', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行BaseDaoImpl.selectPage： pageInfo=[com.fwd.common.page.PageInfo@2b004b45 ] params=[{page=1, rows=5, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10792', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-27 13:07:01:592', '', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10793', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-27 13:07:01:593', '', '==> Parameters: 5(Integer)');
INSERT INTO `logs` VALUES ('10794', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-27 13:07:01:645', '', '<==      Total: 5');
INSERT INTO `logs` VALUES ('10795', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-6', '2017-03-27 13:07:05:018', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10796', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-7', '2017-03-27 13:07:05:166', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行StaffController.saveData() 保存表格数据 param[{EditType=Delete, jsonData=[{\"age\":133,\"createDate\":\"2016-08-18 09:20:00\",\"pkid\":\"16081821200083499584\",\"sex\":\"女\",\"sname\":\"马容S\"}]}]');
INSERT INTO `logs` VALUES ('10797', 'INFO', 'com.fwd.mvc.service.impl.StaffServiceImpl', 'http-bio-8088-exec-7', '2017-03-27 13:07:05:206', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'StaffServiceImpl.delete： pk=>16081821200083499584');
INSERT INTO `logs` VALUES ('10798', 'DEBUG', 'com.fwd.mvc.dao.impl.StaffDaoImpl', 'http-bio-8088-exec-7', '2017-03-27 13:07:05:206', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'StaffDaoImpl.delete： pk==[16081821200083499584]');
INSERT INTO `logs` VALUES ('10799', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-7', '2017-03-27 13:07:05:206', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'BaseDaoImpl.delete： pk==[16081821200083499584]');
INSERT INTO `logs` VALUES ('10800', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-7', '2017-03-27 13:07:05:206', '', '==>  Preparing: DELETE FROM STAFF WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10801', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-7', '2017-03-27 13:07:05:207', '', '==> Parameters: 16081821200083499584(String)');
INSERT INTO `logs` VALUES ('10802', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-7', '2017-03-27 13:07:05:228', '', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10803', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-7', '2017-03-27 13:07:05:252', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行StaffController.selectPage() 查询表格数据 param[{page=1, rows=5, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10804', 'INFO', 'com.fwd.mvc.service.impl.StaffServiceImpl', 'http-bio-8088-exec-7', '2017-03-27 13:07:05:253', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行StaffServiceImpl.selectPage： pageInfo=>com.fwd.common.page.PageInfo@343caddaparams=>{page=1, rows=5, sort=pkid, order=asc}');
INSERT INTO `logs` VALUES ('10805', 'DEBUG', 'com.fwd.mvc.dao.impl.StaffDaoImpl', 'http-bio-8088-exec-7', '2017-03-27 13:07:05:253', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行StaffDaoImpl.selectPage： pageInfo=[com.fwd.common.page.PageInfo@343cadda ] params=[{page=1, rows=5, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10806', 'DEBUG', 'com.fwd.common.dao.impl.BaseDaoImpl', 'http-bio-8088-exec-7', '2017-03-27 13:07:05:253', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', '执行BaseDaoImpl.selectPage： pageInfo=[com.fwd.common.page.PageInfo@343cadda ] params=[{page=1, rows=5, sort=pkid, order=asc}]');
INSERT INTO `logs` VALUES ('10807', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-27 13:07:05:254', '', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10808', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-27 13:07:05:254', '', '==> Parameters: 5(Integer)');
INSERT INTO `logs` VALUES ('10809', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-27 13:07:05:306', '', '<==      Total: 5');
INSERT INTO `logs` VALUES ('10810', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-1', '2017-03-27 13:07:10:011', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10811', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-6', '2017-03-27 13:07:15:012', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10812', 'DEBUG', 'org.quartz.core.JobRunShell', 'org.springframework.scheduling.quartz.SchedulerFactoryBean#0_Worker-2', '2017-03-27 13:07:20:013', 'org.quartz.core.JobRunShell.run(JobRunShell.java:194)', 'Calling execute on job DEFAULT.pushToAppJobDetail');
INSERT INTO `logs` VALUES ('10813', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 14:13:19:254', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10814', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-9', '2017-03-27 14:13:25:039', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490595204699\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10815', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-27 14:13:25:839', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10816', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-27 14:13:25:909', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10817', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-27 14:13:26:026', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10818', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-9', '2017-03-27 14:13:26:159', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22728,\"rows\":[{\"age\":126,\"createDate\":1471526400000,\"pkid\":\"16081821200083327873\",\"sex\":\"女\",\"sname\":\"王尼玛\"},{\"age\":122,\"createDate\":1471526400000,\"pkid\":\"16081821200083380515\",\"sex\":\"女\",\"sname\":\"王尼玛\"},{\"age\":130,\"createDate\":1471526400000,\"pkid\":\"16081821200083484610\",\"sex\":\"女\",\"sname\":\"王尼玛1\"},{\"age\":138,\"createDate\":1471526400000,\"pkid\":\"16081821200083503585\",\"sex\":\"男\",\"sname\":\"王尼玛138男\"},{\"age\":144,\"createDate\":1471526400000,\"pkid\":\"16081821200083506681\",\"sex\":\"男\",\"sname\":\"王尼玛144男\"},{\"age\":139,\"createDate\":1471526400000,\"pkid\":\"16081821200083518842\",\"sex\":\"女\",\"sname\":\"马容139女\"},{\"age\":145,\"createDate\":1471526400000,\"pkid\":\"16081821200083547694\",\"sex\":\"女\",\"sname\":\"马容145女\"},{\"age\":141,\"createDate\":1471526400000,\"pkid\":\"16081821200083554386\",\"sex\":\"女\",\"sname\":\"马容141女\"},{\"age\":142,\"createDate\":1471526400000,\"pkid\":\"16081821200083563976\",\"sex\":\"男\",\"sname\":\"王尼玛142男\"},{\"age\":143,\"createDate\":1471526400000,\"pkid\":\"16081821200083577435\",\"sex\":\"女\",\"sname\":\"马容143女\"}]}');
INSERT INTO `logs` VALUES ('10819', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-1', '2017-03-27 14:14:24:500', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490595204700\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10820', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:14:24:546', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10821', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:14:24:563', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10822', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:14:24:668', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10823', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-1', '2017-03-27 14:14:24:706', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22728,\"rows\":[{\"age\":126,\"createDate\":1471526400000,\"pkid\":\"16081821200083327873\",\"sex\":\"女\",\"sname\":\"王尼玛\"},{\"age\":122,\"createDate\":1471526400000,\"pkid\":\"16081821200083380515\",\"sex\":\"女\",\"sname\":\"王尼玛\"},{\"age\":130,\"createDate\":1471526400000,\"pkid\":\"16081821200083484610\",\"sex\":\"女\",\"sname\":\"王尼玛1\"},{\"age\":138,\"createDate\":1471526400000,\"pkid\":\"16081821200083503585\",\"sex\":\"男\",\"sname\":\"王尼玛138男\"},{\"age\":144,\"createDate\":1471526400000,\"pkid\":\"16081821200083506681\",\"sex\":\"男\",\"sname\":\"王尼玛144男\"},{\"age\":139,\"createDate\":1471526400000,\"pkid\":\"16081821200083518842\",\"sex\":\"女\",\"sname\":\"马容139女\"},{\"age\":145,\"createDate\":1471526400000,\"pkid\":\"16081821200083547694\",\"sex\":\"女\",\"sname\":\"马容145女\"},{\"age\":141,\"createDate\":1471526400000,\"pkid\":\"16081821200083554386\",\"sex\":\"女\",\"sname\":\"马容141女\"},{\"age\":142,\"createDate\":1471526400000,\"pkid\":\"16081821200083563976\",\"sex\":\"男\",\"sname\":\"王尼玛142男\"},{\"age\":143,\"createDate\":1471526400000,\"pkid\":\"16081821200083577435\",\"sex\":\"女\",\"sname\":\"马容143女\"}]}');
INSERT INTO `logs` VALUES ('10824', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-1', '2017-03-27 14:14:43:784', 'com.fwd.mvc.controller.StaffController.saveData(StaffController.java:171)', '执行StaffController.saveData() 保存表格数据 param[{EditType=Delete, jsonData=[{\"pkid\":\"16081821200083327873\",\"sname\":\"王尼玛\",\"sex\":\"女\",\"age\":126,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true}]}]');
INSERT INTO `logs` VALUES ('10825', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-1', '2017-03-27 14:14:43:825', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: DELETE FROM STAFF WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10826', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-1', '2017-03-27 14:14:43:841', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 16081821200083327873(String)');
INSERT INTO `logs` VALUES ('10827', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-1', '2017-03-27 14:14:43:865', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10828', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-1', '2017-03-27 14:14:43:921', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490595204701\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10829', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:14:43:943', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10830', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:14:43:964', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10831', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:14:44:051', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10832', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-1', '2017-03-27 14:14:44:119', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22727,\"rows\":[{\"age\":122,\"createDate\":1471526400000,\"pkid\":\"16081821200083380515\",\"sex\":\"女\",\"sname\":\"王尼玛\"},{\"age\":130,\"createDate\":1471526400000,\"pkid\":\"16081821200083484610\",\"sex\":\"女\",\"sname\":\"王尼玛1\"},{\"age\":138,\"createDate\":1471526400000,\"pkid\":\"16081821200083503585\",\"sex\":\"男\",\"sname\":\"王尼玛138男\"},{\"age\":144,\"createDate\":1471526400000,\"pkid\":\"16081821200083506681\",\"sex\":\"男\",\"sname\":\"王尼玛144男\"},{\"age\":139,\"createDate\":1471526400000,\"pkid\":\"16081821200083518842\",\"sex\":\"女\",\"sname\":\"马容139女\"},{\"age\":145,\"createDate\":1471526400000,\"pkid\":\"16081821200083547694\",\"sex\":\"女\",\"sname\":\"马容145女\"},{\"age\":141,\"createDate\":1471526400000,\"pkid\":\"16081821200083554386\",\"sex\":\"女\",\"sname\":\"马容141女\"},{\"age\":142,\"createDate\":1471526400000,\"pkid\":\"16081821200083563976\",\"sex\":\"男\",\"sname\":\"王尼玛142男\"},{\"age\":143,\"createDate\":1471526400000,\"pkid\":\"16081821200083577435\",\"sex\":\"女\",\"sname\":\"马容143女\"},{\"age\":146,\"createDate\":1471526400000,\"pkid\":\"16081821200083577459\",\"sex\":\"男\",\"sname\":\"王尼玛146男\"}]}');
INSERT INTO `logs` VALUES ('10833', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-8', '2017-03-27 14:15:45:250', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490595345039\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10834', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 14:15:45:274', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10835', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 14:15:45:295', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10836', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 14:15:45:370', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10837', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-8', '2017-03-27 14:15:45:403', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22727,\"rows\":[{\"age\":122,\"createDate\":1471526400000,\"pkid\":\"16081821200083380515\",\"sex\":\"女\",\"sname\":\"王尼玛\"},{\"age\":130,\"createDate\":1471526400000,\"pkid\":\"16081821200083484610\",\"sex\":\"女\",\"sname\":\"王尼玛1\"},{\"age\":138,\"createDate\":1471526400000,\"pkid\":\"16081821200083503585\",\"sex\":\"男\",\"sname\":\"王尼玛138男\"},{\"age\":144,\"createDate\":1471526400000,\"pkid\":\"16081821200083506681\",\"sex\":\"男\",\"sname\":\"王尼玛144男\"},{\"age\":139,\"createDate\":1471526400000,\"pkid\":\"16081821200083518842\",\"sex\":\"女\",\"sname\":\"马容139女\"},{\"age\":145,\"createDate\":1471526400000,\"pkid\":\"16081821200083547694\",\"sex\":\"女\",\"sname\":\"马容145女\"},{\"age\":141,\"createDate\":1471526400000,\"pkid\":\"16081821200083554386\",\"sex\":\"女\",\"sname\":\"马容141女\"},{\"age\":142,\"createDate\":1471526400000,\"pkid\":\"16081821200083563976\",\"sex\":\"男\",\"sname\":\"王尼玛142男\"},{\"age\":143,\"createDate\":1471526400000,\"pkid\":\"16081821200083577435\",\"sex\":\"女\",\"sname\":\"马容143女\"},{\"age\":146,\"createDate\":1471526400000,\"pkid\":\"16081821200083577459\",\"sex\":\"男\",\"sname\":\"王尼玛146男\"}]}');
INSERT INTO `logs` VALUES ('10838', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-8', '2017-03-27 14:15:50:242', 'com.fwd.mvc.controller.StaffController.saveData(StaffController.java:171)', '执行StaffController.saveData() 保存表格数据 param[{EditType=Delete, jsonData=[{\"pkid\":\"16081821200083380515\",\"sname\":\"王尼玛\",\"sex\":\"女\",\"age\":122,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083484610\",\"sname\":\"王尼玛1\",\"sex\":\"女\",\"age\":130,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083503585\",\"sname\":\"王尼玛138男\",\"sex\":\"男\",\"age\":138,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083506681\",\"sname\":\"王尼玛144男\",\"sex\":\"男\",\"age\":144,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083518842\",\"sname\":\"马容139女\",\"sex\":\"女\",\"age\":139,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083547694\",\"sname\":\"马容145女\",\"sex\":\"女\",\"age\":145,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083554386\",\"sname\":\"马容141女\",\"sex\":\"女\",\"age\":141,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083563976\",\"sname\":\"王尼玛142男\",\"sex\":\"男\",\"age\":142,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083577435\",\"sname\":\"马容143女\",\"sex\":\"女\",\"age\":143,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083577459\",\"sname\":\"王尼玛146男\",\"sex\":\"男\",\"age\":146,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true}]}]');
INSERT INTO `logs` VALUES ('10839', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-8', '2017-03-27 14:15:50:265', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: DELETE FROM STAFF WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10840', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-8', '2017-03-27 14:15:50:283', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 16081821200083380515(String)');
INSERT INTO `logs` VALUES ('10841', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-8', '2017-03-27 14:15:50:307', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10842', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-8', '2017-03-27 14:15:50:357', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: DELETE FROM STAFF WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10843', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-8', '2017-03-27 14:15:50:372', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 16081821200083484610(String)');
INSERT INTO `logs` VALUES ('10844', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-8', '2017-03-27 14:15:50:396', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10845', 'ERROR', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-8', '2017-03-27 14:15:50:452', 'com.fwd.mvc.controller.StaffController.saveData(StaffController.java:202)', '执行StaffController.saveData()  保存表格数据 异常 ');
INSERT INTO `logs` VALUES ('10846', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-8', '2017-03-27 14:15:50:484', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490595345040\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10847', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 14:15:50:510', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10848', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 14:15:50:527', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10849', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-27 14:15:50:603', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10850', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-8', '2017-03-27 14:15:50:675', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22725,\"rows\":[{\"age\":138,\"createDate\":1471526400000,\"pkid\":\"16081821200083503585\",\"sex\":\"男\",\"sname\":\"王尼玛138男\"},{\"age\":144,\"createDate\":1471526400000,\"pkid\":\"16081821200083506681\",\"sex\":\"男\",\"sname\":\"王尼玛144男\"},{\"age\":139,\"createDate\":1471526400000,\"pkid\":\"16081821200083518842\",\"sex\":\"女\",\"sname\":\"马容139女\"},{\"age\":145,\"createDate\":1471526400000,\"pkid\":\"16081821200083547694\",\"sex\":\"女\",\"sname\":\"马容145女\"},{\"age\":141,\"createDate\":1471526400000,\"pkid\":\"16081821200083554386\",\"sex\":\"女\",\"sname\":\"马容141女\"},{\"age\":142,\"createDate\":1471526400000,\"pkid\":\"16081821200083563976\",\"sex\":\"男\",\"sname\":\"王尼玛142男\"},{\"age\":143,\"createDate\":1471526400000,\"pkid\":\"16081821200083577435\",\"sex\":\"女\",\"sname\":\"马容143女\"},{\"age\":146,\"createDate\":1471526400000,\"pkid\":\"16081821200083577459\",\"sex\":\"男\",\"sname\":\"王尼玛146男\"},{\"age\":140,\"createDate\":1471526400000,\"pkid\":\"16081821200083599200\",\"sex\":\"男\",\"sname\":\"王尼玛140男\"},{\"age\":153,\"createDate\":1471526400000,\"pkid\":\"16081821200083611573\",\"sex\":\"女\",\"sname\":\"马容153女\"}]}');
INSERT INTO `logs` VALUES ('10851', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-1', '2017-03-27 14:16:58:716', 'com.fwd.mvc.controller.StaffController.saveData(StaffController.java:171)', '执行StaffController.saveData() 保存表格数据 param[{EditType=Delete, jsonData=[{\"pkid\":\"16081821200083503585\",\"sname\":\"王尼玛138男\",\"sex\":\"男\",\"age\":138,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083506681\",\"sname\":\"王尼玛144男\",\"sex\":\"男\",\"age\":144,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083518842\",\"sname\":\"马容139女\",\"sex\":\"女\",\"age\":139,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083547694\",\"sname\":\"马容145女\",\"sex\":\"女\",\"age\":145,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083554386\",\"sname\":\"马容141女\",\"sex\":\"女\",\"age\":141,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083563976\",\"sname\":\"王尼玛142男\",\"sex\":\"男\",\"age\":142,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083577435\",\"sname\":\"马容143女\",\"sex\":\"女\",\"age\":143,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083577459\",\"sname\":\"王尼玛146男\",\"sex\":\"男\",\"age\":146,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083599200\",\"sname\":\"王尼玛140男\",\"sex\":\"男\",\"age\":140,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083611573\",\"sname\":\"马容153女\",\"sex\":\"女\",\"age\":153,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true}]}]');
INSERT INTO `logs` VALUES ('10852', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-1', '2017-03-27 14:16:58:762', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: DELETE FROM STAFF WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10853', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-1', '2017-03-27 14:16:58:781', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 16081821200083503585(String)');
INSERT INTO `logs` VALUES ('10854', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-1', '2017-03-27 14:16:58:805', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10855', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-1', '2017-03-27 14:16:58:856', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: DELETE FROM STAFF WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10856', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-1', '2017-03-27 14:16:58:870', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 16081821200083506681(String)');
INSERT INTO `logs` VALUES ('10857', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-1', '2017-03-27 14:16:58:894', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10858', 'ERROR', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-1', '2017-03-27 14:16:58:954', 'com.fwd.mvc.controller.StaffController.saveData(StaffController.java:202)', '执行StaffController.saveData()  保存表格数据 异常 ');
INSERT INTO `logs` VALUES ('10859', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-1', '2017-03-27 14:16:59:112', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490595345041\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10860', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:16:59:253', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10861', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:16:59:270', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10862', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:16:59:360', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10863', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-1', '2017-03-27 14:16:59:438', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22723,\"rows\":[{\"age\":139,\"createDate\":1471526400000,\"pkid\":\"16081821200083518842\",\"sex\":\"女\",\"sname\":\"马容139女\"},{\"age\":145,\"createDate\":1471526400000,\"pkid\":\"16081821200083547694\",\"sex\":\"女\",\"sname\":\"马容145女\"},{\"age\":141,\"createDate\":1471526400000,\"pkid\":\"16081821200083554386\",\"sex\":\"女\",\"sname\":\"马容141女\"},{\"age\":142,\"createDate\":1471526400000,\"pkid\":\"16081821200083563976\",\"sex\":\"男\",\"sname\":\"王尼玛142男\"},{\"age\":143,\"createDate\":1471526400000,\"pkid\":\"16081821200083577435\",\"sex\":\"女\",\"sname\":\"马容143女\"},{\"age\":146,\"createDate\":1471526400000,\"pkid\":\"16081821200083577459\",\"sex\":\"男\",\"sname\":\"王尼玛146男\"},{\"age\":140,\"createDate\":1471526400000,\"pkid\":\"16081821200083599200\",\"sex\":\"男\",\"sname\":\"王尼玛140男\"},{\"age\":153,\"createDate\":1471526400000,\"pkid\":\"16081821200083611573\",\"sex\":\"女\",\"sname\":\"马容153女\"},{\"age\":154,\"createDate\":1471526400000,\"pkid\":\"16081821200083629080\",\"sex\":\"男\",\"sname\":\"王尼玛154男\"},{\"age\":155,\"createDate\":1471526400000,\"pkid\":\"16081821200083631014\",\"sex\":\"女\",\"sname\":\"马容155女\"}]}');
INSERT INTO `logs` VALUES ('10864', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-1', '2017-03-27 14:17:04:711', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490595424494\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10865', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:17:04:752', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10866', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:17:04:769', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10867', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:17:04:848', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10868', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-1', '2017-03-27 14:17:04:889', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22723,\"rows\":[{\"age\":139,\"createDate\":1471526400000,\"pkid\":\"16081821200083518842\",\"sex\":\"女\",\"sname\":\"马容139女\"},{\"age\":145,\"createDate\":1471526400000,\"pkid\":\"16081821200083547694\",\"sex\":\"女\",\"sname\":\"马容145女\"},{\"age\":141,\"createDate\":1471526400000,\"pkid\":\"16081821200083554386\",\"sex\":\"女\",\"sname\":\"马容141女\"},{\"age\":142,\"createDate\":1471526400000,\"pkid\":\"16081821200083563976\",\"sex\":\"男\",\"sname\":\"王尼玛142男\"},{\"age\":143,\"createDate\":1471526400000,\"pkid\":\"16081821200083577435\",\"sex\":\"女\",\"sname\":\"马容143女\"},{\"age\":146,\"createDate\":1471526400000,\"pkid\":\"16081821200083577459\",\"sex\":\"男\",\"sname\":\"王尼玛146男\"},{\"age\":140,\"createDate\":1471526400000,\"pkid\":\"16081821200083599200\",\"sex\":\"男\",\"sname\":\"王尼玛140男\"},{\"age\":153,\"createDate\":1471526400000,\"pkid\":\"16081821200083611573\",\"sex\":\"女\",\"sname\":\"马容153女\"},{\"age\":154,\"createDate\":1471526400000,\"pkid\":\"16081821200083629080\",\"sex\":\"男\",\"sname\":\"王尼玛154男\"},{\"age\":155,\"createDate\":1471526400000,\"pkid\":\"16081821200083631014\",\"sex\":\"女\",\"sname\":\"马容155女\"}]}');
INSERT INTO `logs` VALUES ('10869', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-1', '2017-03-27 14:17:08:601', 'com.fwd.mvc.controller.StaffController.saveData(StaffController.java:171)', '执行StaffController.saveData() 保存表格数据 param[{EditType=Delete, jsonData=[{\"pkid\":\"16081821200083518842\",\"sname\":\"马容139女\",\"sex\":\"女\",\"age\":139,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true}]}]');
INSERT INTO `logs` VALUES ('10870', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-1', '2017-03-27 14:17:08:639', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: DELETE FROM STAFF WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10871', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-1', '2017-03-27 14:17:08:658', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 16081821200083518842(String)');
INSERT INTO `logs` VALUES ('10872', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-1', '2017-03-27 14:17:08:683', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10873', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-1', '2017-03-27 14:17:08:741', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490595424495\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10874', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:17:08:762', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10875', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:17:08:872', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10876', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-1', '2017-03-27 14:17:09:032', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10877', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-1', '2017-03-27 14:17:09:369', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22722,\"rows\":[{\"age\":145,\"createDate\":1471526400000,\"pkid\":\"16081821200083547694\",\"sex\":\"女\",\"sname\":\"马容145女\"},{\"age\":141,\"createDate\":1471526400000,\"pkid\":\"16081821200083554386\",\"sex\":\"女\",\"sname\":\"马容141女\"},{\"age\":142,\"createDate\":1471526400000,\"pkid\":\"16081821200083563976\",\"sex\":\"男\",\"sname\":\"王尼玛142男\"},{\"age\":143,\"createDate\":1471526400000,\"pkid\":\"16081821200083577435\",\"sex\":\"女\",\"sname\":\"马容143女\"},{\"age\":146,\"createDate\":1471526400000,\"pkid\":\"16081821200083577459\",\"sex\":\"男\",\"sname\":\"王尼玛146男\"},{\"age\":140,\"createDate\":1471526400000,\"pkid\":\"16081821200083599200\",\"sex\":\"男\",\"sname\":\"王尼玛140男\"},{\"age\":153,\"createDate\":1471526400000,\"pkid\":\"16081821200083611573\",\"sex\":\"女\",\"sname\":\"马容153女\"},{\"age\":154,\"createDate\":1471526400000,\"pkid\":\"16081821200083629080\",\"sex\":\"男\",\"sname\":\"王尼玛154男\"},{\"age\":155,\"createDate\":1471526400000,\"pkid\":\"16081821200083631014\",\"sex\":\"女\",\"sname\":\"马容155女\"},{\"age\":152,\"createDate\":1471526400000,\"pkid\":\"16081821200083645370\",\"sex\":\"男\",\"sname\":\"王尼玛152男\"}]}');
INSERT INTO `logs` VALUES ('10878', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-4', '2017-03-27 14:17:35:938', 'com.fwd.mvc.controller.StaffController.saveData(StaffController.java:171)', '执行StaffController.saveData() 保存表格数据 param[{EditType=Delete, jsonData=[{\"pkid\":\"16081821200083547694\",\"sname\":\"马容145女\",\"sex\":\"女\",\"age\":145,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true}]}]');
INSERT INTO `logs` VALUES ('10879', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-4', '2017-03-27 14:17:35:959', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: DELETE FROM STAFF WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10880', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-4', '2017-03-27 14:17:35:981', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 16081821200083547694(String)');
INSERT INTO `logs` VALUES ('10881', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-4', '2017-03-27 14:17:36:021', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10882', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-4', '2017-03-27 14:17:36:074', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490595424496\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10883', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 14:17:36:096', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10884', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 14:17:36:116', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10885', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 14:17:36:214', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10886', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-4', '2017-03-27 14:17:36:292', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22721,\"rows\":[{\"age\":141,\"createDate\":1471526400000,\"pkid\":\"16081821200083554386\",\"sex\":\"女\",\"sname\":\"马容141女\"},{\"age\":142,\"createDate\":1471526400000,\"pkid\":\"16081821200083563976\",\"sex\":\"男\",\"sname\":\"王尼玛142男\"},{\"age\":143,\"createDate\":1471526400000,\"pkid\":\"16081821200083577435\",\"sex\":\"女\",\"sname\":\"马容143女\"},{\"age\":146,\"createDate\":1471526400000,\"pkid\":\"16081821200083577459\",\"sex\":\"男\",\"sname\":\"王尼玛146男\"},{\"age\":140,\"createDate\":1471526400000,\"pkid\":\"16081821200083599200\",\"sex\":\"男\",\"sname\":\"王尼玛140男\"},{\"age\":153,\"createDate\":1471526400000,\"pkid\":\"16081821200083611573\",\"sex\":\"女\",\"sname\":\"马容153女\"},{\"age\":154,\"createDate\":1471526400000,\"pkid\":\"16081821200083629080\",\"sex\":\"男\",\"sname\":\"王尼玛154男\"},{\"age\":155,\"createDate\":1471526400000,\"pkid\":\"16081821200083631014\",\"sex\":\"女\",\"sname\":\"马容155女\"},{\"age\":152,\"createDate\":1471526400000,\"pkid\":\"16081821200083645370\",\"sex\":\"男\",\"sname\":\"王尼玛152男\"},{\"age\":147,\"createDate\":1471526400000,\"pkid\":\"16081821200083660638\",\"sex\":\"女\",\"sname\":\"马容147女\"}]}');
INSERT INTO `logs` VALUES ('10887', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-4', '2017-03-27 14:17:42:072', 'com.fwd.mvc.controller.StaffController.saveData(StaffController.java:171)', '执行StaffController.saveData() 保存表格数据 param[{EditType=Delete, jsonData=[{\"pkid\":\"16081821200083554386\",\"sname\":\"马容141女\",\"sex\":\"女\",\"age\":141,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true}]}]');
INSERT INTO `logs` VALUES ('10888', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-4', '2017-03-27 14:17:42:105', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: DELETE FROM STAFF WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10889', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-4', '2017-03-27 14:17:42:124', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 16081821200083554386(String)');
INSERT INTO `logs` VALUES ('10890', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-4', '2017-03-27 14:17:42:148', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10891', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-4', '2017-03-27 14:17:42:217', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490595424497\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10892', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 14:17:42:238', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10893', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 14:17:42:259', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10894', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 14:17:42:345', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10895', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-4', '2017-03-27 14:17:42:449', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22720,\"rows\":[{\"age\":142,\"createDate\":1471526400000,\"pkid\":\"16081821200083563976\",\"sex\":\"男\",\"sname\":\"王尼玛142男\"},{\"age\":143,\"createDate\":1471526400000,\"pkid\":\"16081821200083577435\",\"sex\":\"女\",\"sname\":\"马容143女\"},{\"age\":146,\"createDate\":1471526400000,\"pkid\":\"16081821200083577459\",\"sex\":\"男\",\"sname\":\"王尼玛146男\"},{\"age\":140,\"createDate\":1471526400000,\"pkid\":\"16081821200083599200\",\"sex\":\"男\",\"sname\":\"王尼玛140男\"},{\"age\":153,\"createDate\":1471526400000,\"pkid\":\"16081821200083611573\",\"sex\":\"女\",\"sname\":\"马容153女\"},{\"age\":154,\"createDate\":1471526400000,\"pkid\":\"16081821200083629080\",\"sex\":\"男\",\"sname\":\"王尼玛154男\"},{\"age\":155,\"createDate\":1471526400000,\"pkid\":\"16081821200083631014\",\"sex\":\"女\",\"sname\":\"马容155女\"},{\"age\":152,\"createDate\":1471526400000,\"pkid\":\"16081821200083645370\",\"sex\":\"男\",\"sname\":\"王尼玛152男\"},{\"age\":147,\"createDate\":1471526400000,\"pkid\":\"16081821200083660638\",\"sex\":\"女\",\"sname\":\"马容147女\"},{\"age\":149,\"createDate\":1471526400000,\"pkid\":\"16081821200083679617\",\"sex\":\"女\",\"sname\":\"马容149女\"}]}');
INSERT INTO `logs` VALUES ('10896', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-4', '2017-03-27 14:17:45:777', 'com.fwd.mvc.controller.StaffController.saveData(StaffController.java:171)', '执行StaffController.saveData() 保存表格数据 param[{EditType=Delete, jsonData=[{\"pkid\":\"16081821200083563976\",\"sname\":\"王尼玛142男\",\"sex\":\"男\",\"age\":142,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true}]}]');
INSERT INTO `logs` VALUES ('10897', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-4', '2017-03-27 14:17:45:815', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: DELETE FROM STAFF WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10898', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-4', '2017-03-27 14:17:45:846', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 16081821200083563976(String)');
INSERT INTO `logs` VALUES ('10899', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-4', '2017-03-27 14:17:45:870', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10900', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-4', '2017-03-27 14:17:45:928', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490595424498\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10901', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 14:17:45:949', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10902', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 14:17:45:969', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10903', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 14:17:46:173', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10904', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-4', '2017-03-27 14:17:46:282', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22719,\"rows\":[{\"age\":143,\"createDate\":1471526400000,\"pkid\":\"16081821200083577435\",\"sex\":\"女\",\"sname\":\"马容143女\"},{\"age\":146,\"createDate\":1471526400000,\"pkid\":\"16081821200083577459\",\"sex\":\"男\",\"sname\":\"王尼玛146男\"},{\"age\":140,\"createDate\":1471526400000,\"pkid\":\"16081821200083599200\",\"sex\":\"男\",\"sname\":\"王尼玛140男\"},{\"age\":153,\"createDate\":1471526400000,\"pkid\":\"16081821200083611573\",\"sex\":\"女\",\"sname\":\"马容153女\"},{\"age\":154,\"createDate\":1471526400000,\"pkid\":\"16081821200083629080\",\"sex\":\"男\",\"sname\":\"王尼玛154男\"},{\"age\":155,\"createDate\":1471526400000,\"pkid\":\"16081821200083631014\",\"sex\":\"女\",\"sname\":\"马容155女\"},{\"age\":152,\"createDate\":1471526400000,\"pkid\":\"16081821200083645370\",\"sex\":\"男\",\"sname\":\"王尼玛152男\"},{\"age\":147,\"createDate\":1471526400000,\"pkid\":\"16081821200083660638\",\"sex\":\"女\",\"sname\":\"马容147女\"},{\"age\":149,\"createDate\":1471526400000,\"pkid\":\"16081821200083679617\",\"sex\":\"女\",\"sname\":\"马容149女\"},{\"age\":165,\"createDate\":1471526400000,\"pkid\":\"16081821200083768465\",\"sex\":\"女\",\"sname\":\"马容165女\"}]}');
INSERT INTO `logs` VALUES ('10905', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-2', '2017-03-27 14:18:09:257', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeDestruction(LifecycleBeanPostProcessor.java:118)', 'Destroying bean [securityManager]...');
INSERT INTO `logs` VALUES ('10906', 'DEBUG', 'org.apache.shiro.session.mgt.quartz.QuartzSessionValidationScheduler', 'localhost-startStop-2', '2017-03-27 14:18:09:305', 'org.apache.shiro.session.mgt.quartz.QuartzSessionValidationScheduler.disableSessionValidation(QuartzSessionValidationScheduler.java:188)', 'Stopping Quartz session validation job...');
INSERT INTO `logs` VALUES ('10907', 'INFO', 'org.quartz.simpl.SimpleThreadPool', 'localhost-startStop-2', '2017-03-27 14:18:09:355', 'org.quartz.simpl.SimpleThreadPool.initialize(SimpleThreadPool.java:258)', 'Job execution threads will use class loader of thread: localhost-startStop-2');
INSERT INTO `logs` VALUES ('10908', 'INFO', 'org.quartz.core.SchedulerSignalerImpl', 'localhost-startStop-2', '2017-03-27 14:18:09:418', 'org.quartz.core.SchedulerSignalerImpl.<init>(SchedulerSignalerImpl.java:63)', 'Initialized Scheduler Signaller of type: class org.quartz.core.SchedulerSignalerImpl');
INSERT INTO `logs` VALUES ('10909', 'INFO', 'org.quartz.core.QuartzScheduler', 'localhost-startStop-2', '2017-03-27 14:18:09:434', 'org.quartz.core.QuartzScheduler.<init>(QuartzScheduler.java:215)', 'Quartz Scheduler v.1.6.1 created.');
INSERT INTO `logs` VALUES ('10910', 'INFO', 'org.quartz.simpl.RAMJobStore', 'localhost-startStop-2', '2017-03-27 14:18:09:461', 'org.quartz.simpl.RAMJobStore.initialize(RAMJobStore.java:141)', 'RAMJobStore initialized.');
INSERT INTO `logs` VALUES ('10911', 'INFO', 'org.quartz.impl.StdSchedulerFactory', 'localhost-startStop-2', '2017-03-27 14:18:09:485', 'org.quartz.impl.StdSchedulerFactory.instantiate(StdSchedulerFactory.java:1228)', 'Quartz scheduler version: 1.6.1');
INSERT INTO `logs` VALUES ('10912', 'DEBUG', 'org.apache.shiro.session.mgt.quartz.QuartzSessionValidationScheduler', 'localhost-startStop-2', '2017-03-27 14:18:09:504', 'org.apache.shiro.session.mgt.quartz.QuartzSessionValidationScheduler.disableSessionValidation(QuartzSessionValidationScheduler.java:212)', 'Quartz session validation job stopped successfully.');
INSERT INTO `logs` VALUES ('10913', 'INFO', 'org.quartz.core.QuartzScheduler', 'localhost-startStop-2', '2017-03-27 14:18:09:523', 'org.quartz.core.QuartzScheduler.shutdown(QuartzScheduler.java:570)', 'Scheduler DefaultQuartzScheduler_$_NON_CLUSTERED shutting down.');
INSERT INTO `logs` VALUES ('10914', 'INFO', 'org.quartz.core.QuartzScheduler', 'localhost-startStop-2', '2017-03-27 14:18:09:558', 'org.quartz.core.QuartzScheduler.standby(QuartzScheduler.java:496)', 'Scheduler DefaultQuartzScheduler_$_NON_CLUSTERED paused.');
INSERT INTO `logs` VALUES ('10915', 'INFO', 'org.quartz.core.QuartzScheduler', 'localhost-startStop-2', '2017-03-27 14:18:09:581', 'org.quartz.core.QuartzScheduler.shutdown(QuartzScheduler.java:621)', 'Scheduler DefaultQuartzScheduler_$_NON_CLUSTERED shutdown complete.');
INSERT INTO `logs` VALUES ('10916', 'INFO', 'org.apache.shiro.session.mgt.AbstractValidatingSessionManager', 'localhost-startStop-2', '2017-03-27 14:18:09:603', 'org.apache.shiro.session.mgt.AbstractValidatingSessionManager.disableSessionValidation(AbstractValidatingSessionManager.java:246)', 'Disabled session validation scheduler.');
INSERT INTO `logs` VALUES ('10917', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-2', '2017-03-27 14:18:09:625', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeDestruction(LifecycleBeanPostProcessor.java:118)', 'Destroying bean [sessionManager]...');
INSERT INTO `logs` VALUES ('10918', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 14:18:24:541', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10919', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 14:19:34:635', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10920', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 14:21:12:132', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10921', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 14:26:50:675', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10922', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 14:29:44:317', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10923', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 14:30:58:950', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10924', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 14:34:20:551', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10925', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 14:38:13:852', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10926', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 15:00:28:469', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10927', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 15:08:11:204', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10928', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 15:39:29:833', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10929', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 15:42:15:188', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10930', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 15:47:14:449', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10931', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 15:49:19:618', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10932', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 16:06:25:913', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10933', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 16:09:51:119', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10934', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 16:12:38:905', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10935', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 16:15:03:952', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10936', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 16:19:32:619', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10937', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 16:22:31:866', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10938', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 16:23:36:037', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10939', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 16:42:14:496', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10940', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 16:43:13:498', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10941', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 16:44:43:603', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10942', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 16:47:44:395', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10943', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 17:25:09:932', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10944', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 17:28:24:123', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10945', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-6', '2017-03-27 17:30:12:649', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490607012380\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10946', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 17:30:12:901', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10947', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 17:30:12:944', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10948', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 17:30:13:031', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10949', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-6', '2017-03-27 17:30:13:218', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22719,\"rows\":[{\"age\":143,\"createDate\":1471526400000,\"pkid\":\"16081821200083577435\",\"sex\":\"女\",\"sname\":\"马容143女\"},{\"age\":146,\"createDate\":1471526400000,\"pkid\":\"16081821200083577459\",\"sex\":\"男\",\"sname\":\"王尼玛146男\"},{\"age\":140,\"createDate\":1471526400000,\"pkid\":\"16081821200083599200\",\"sex\":\"男\",\"sname\":\"王尼玛140男\"},{\"age\":153,\"createDate\":1471526400000,\"pkid\":\"16081821200083611573\",\"sex\":\"女\",\"sname\":\"马容153女\"},{\"age\":154,\"createDate\":1471526400000,\"pkid\":\"16081821200083629080\",\"sex\":\"男\",\"sname\":\"王尼玛154男\"},{\"age\":155,\"createDate\":1471526400000,\"pkid\":\"16081821200083631014\",\"sex\":\"女\",\"sname\":\"马容155女\"},{\"age\":152,\"createDate\":1471526400000,\"pkid\":\"16081821200083645370\",\"sex\":\"男\",\"sname\":\"王尼玛152男\"},{\"age\":147,\"createDate\":1471526400000,\"pkid\":\"16081821200083660638\",\"sex\":\"女\",\"sname\":\"马容147女\"},{\"age\":149,\"createDate\":1471526400000,\"pkid\":\"16081821200083679617\",\"sex\":\"女\",\"sname\":\"马容149女\"},{\"age\":165,\"createDate\":1471526400000,\"pkid\":\"16081821200083768465\",\"sex\":\"女\",\"sname\":\"马容165女\"}]}');
INSERT INTO `logs` VALUES ('10950', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-6', '2017-03-27 17:30:20:292', 'com.fwd.mvc.controller.StaffController.saveData(StaffController.java:171)', '执行StaffController.saveData() 保存表格数据 param[{EditType=Delete, jsonData=[{\"pkid\":\"16081821200083577435\",\"sname\":\"马容143女\",\"sex\":\"女\",\"age\":143,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true},{\"pkid\":\"16081821200083577459\",\"sname\":\"王尼玛146男\",\"sex\":\"男\",\"age\":146,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true}]}]');
INSERT INTO `logs` VALUES ('10951', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-6', '2017-03-27 17:30:20:347', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: DELETE FROM STAFF WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10952', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-6', '2017-03-27 17:30:20:371', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 16081821200083577435(String)');
INSERT INTO `logs` VALUES ('10953', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-6', '2017-03-27 17:30:20:391', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10954', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-6', '2017-03-27 17:30:20:446', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: DELETE FROM STAFF WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10955', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-6', '2017-03-27 17:30:20:470', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 16081821200083577459(String)');
INSERT INTO `logs` VALUES ('10956', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-6', '2017-03-27 17:30:20:497', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10957', 'ERROR', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-6', '2017-03-27 17:30:20:558', 'com.fwd.mvc.controller.StaffController.saveData(StaffController.java:202)', '执行StaffController.saveData()  保存表格数据 异常 ');
INSERT INTO `logs` VALUES ('10958', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-6', '2017-03-27 17:30:20:614', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490607012381\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10959', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 17:30:20:637', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10960', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 17:30:20:659', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10961', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 17:30:20:735', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10962', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-6', '2017-03-27 17:30:20:801', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22717,\"rows\":[{\"age\":140,\"createDate\":1471526400000,\"pkid\":\"16081821200083599200\",\"sex\":\"男\",\"sname\":\"王尼玛140男\"},{\"age\":153,\"createDate\":1471526400000,\"pkid\":\"16081821200083611573\",\"sex\":\"女\",\"sname\":\"马容153女\"},{\"age\":154,\"createDate\":1471526400000,\"pkid\":\"16081821200083629080\",\"sex\":\"男\",\"sname\":\"王尼玛154男\"},{\"age\":155,\"createDate\":1471526400000,\"pkid\":\"16081821200083631014\",\"sex\":\"女\",\"sname\":\"马容155女\"},{\"age\":152,\"createDate\":1471526400000,\"pkid\":\"16081821200083645370\",\"sex\":\"男\",\"sname\":\"王尼玛152男\"},{\"age\":147,\"createDate\":1471526400000,\"pkid\":\"16081821200083660638\",\"sex\":\"女\",\"sname\":\"马容147女\"},{\"age\":149,\"createDate\":1471526400000,\"pkid\":\"16081821200083679617\",\"sex\":\"女\",\"sname\":\"马容149女\"},{\"age\":165,\"createDate\":1471526400000,\"pkid\":\"16081821200083768465\",\"sex\":\"女\",\"sname\":\"马容165女\"},{\"age\":163,\"createDate\":1471526400000,\"pkid\":\"16081821200083773875\",\"sex\":\"女\",\"sname\":\"马容163女\"},{\"age\":161,\"createDate\":1471526400000,\"pkid\":\"16081821200083777697\",\"sex\":\"女\",\"sname\":\"马容161女\"}]}');
INSERT INTO `logs` VALUES ('10963', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-6', '2017-03-27 17:30:34:151', 'com.fwd.mvc.controller.StaffController.saveData(StaffController.java:171)', '执行StaffController.saveData() 保存表格数据 param[{EditType=Delete, jsonData=[{\"pkid\":\"16081821200083599200\",\"sname\":\"王尼玛140男\",\"sex\":\"男\",\"age\":140,\"createDate\":1471526400000,\"createby\":null,\"updateDate\":null,\"updateby\":null,\"state\":true}]}]');
INSERT INTO `logs` VALUES ('10964', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-6', '2017-03-27 17:30:34:182', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: DELETE FROM STAFF WHERE pkid = ? ');
INSERT INTO `logs` VALUES ('10965', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-6', '2017-03-27 17:30:34:208', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 16081821200083599200(String)');
INSERT INTO `logs` VALUES ('10966', 'DEBUG', 'com.fwd.mvc.mapper.Staff.delete', 'http-bio-8088-exec-6', '2017-03-27 17:30:34:237', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==    Updates: 1');
INSERT INTO `logs` VALUES ('10967', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-6', '2017-03-27 17:30:34:294', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490607012382\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10968', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 17:30:34:316', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10969', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 17:30:34:337', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10970', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 17:30:34:428', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10971', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-6', '2017-03-27 17:30:34:489', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22716,\"rows\":[{\"age\":153,\"createDate\":1471526400000,\"pkid\":\"16081821200083611573\",\"sex\":\"女\",\"sname\":\"马容153女\"},{\"age\":154,\"createDate\":1471526400000,\"pkid\":\"16081821200083629080\",\"sex\":\"男\",\"sname\":\"王尼玛154男\"},{\"age\":155,\"createDate\":1471526400000,\"pkid\":\"16081821200083631014\",\"sex\":\"女\",\"sname\":\"马容155女\"},{\"age\":152,\"createDate\":1471526400000,\"pkid\":\"16081821200083645370\",\"sex\":\"男\",\"sname\":\"王尼玛152男\"},{\"age\":147,\"createDate\":1471526400000,\"pkid\":\"16081821200083660638\",\"sex\":\"女\",\"sname\":\"马容147女\"},{\"age\":149,\"createDate\":1471526400000,\"pkid\":\"16081821200083679617\",\"sex\":\"女\",\"sname\":\"马容149女\"},{\"age\":165,\"createDate\":1471526400000,\"pkid\":\"16081821200083768465\",\"sex\":\"女\",\"sname\":\"马容165女\"},{\"age\":163,\"createDate\":1471526400000,\"pkid\":\"16081821200083773875\",\"sex\":\"女\",\"sname\":\"马容163女\"},{\"age\":161,\"createDate\":1471526400000,\"pkid\":\"16081821200083777697\",\"sex\":\"女\",\"sname\":\"马容161女\"},{\"age\":157,\"createDate\":1471526400000,\"pkid\":\"16081821200083799882\",\"sex\":\"女\",\"sname\":\"马容157女\"}]}');
INSERT INTO `logs` VALUES ('10972', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-5', '2017-03-27 17:33:41:998', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490607221846\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10973', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-27 17:33:42:045', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10974', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-27 17:33:42:064', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10975', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-27 17:33:42:137', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10976', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-5', '2017-03-27 17:33:42:181', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22716,\"rows\":[{\"age\":153,\"createDate\":1471526400000,\"pkid\":\"16081821200083611573\",\"sex\":\"女\",\"sname\":\"马容153女\"},{\"age\":154,\"createDate\":1471526400000,\"pkid\":\"16081821200083629080\",\"sex\":\"男\",\"sname\":\"王尼玛154男\"},{\"age\":155,\"createDate\":1471526400000,\"pkid\":\"16081821200083631014\",\"sex\":\"女\",\"sname\":\"马容155女\"},{\"age\":152,\"createDate\":1471526400000,\"pkid\":\"16081821200083645370\",\"sex\":\"男\",\"sname\":\"王尼玛152男\"},{\"age\":147,\"createDate\":1471526400000,\"pkid\":\"16081821200083660638\",\"sex\":\"女\",\"sname\":\"马容147女\"},{\"age\":149,\"createDate\":1471526400000,\"pkid\":\"16081821200083679617\",\"sex\":\"女\",\"sname\":\"马容149女\"},{\"age\":165,\"createDate\":1471526400000,\"pkid\":\"16081821200083768465\",\"sex\":\"女\",\"sname\":\"马容165女\"},{\"age\":163,\"createDate\":1471526400000,\"pkid\":\"16081821200083773875\",\"sex\":\"女\",\"sname\":\"马容163女\"},{\"age\":161,\"createDate\":1471526400000,\"pkid\":\"16081821200083777697\",\"sex\":\"女\",\"sname\":\"马容161女\"},{\"age\":157,\"createDate\":1471526400000,\"pkid\":\"16081821200083799882\",\"sex\":\"女\",\"sname\":\"马容157女\"}]}');
INSERT INTO `logs` VALUES ('10977', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 17:46:02:676', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10978', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 17:48:27:479', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10979', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 17:53:27:079', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10980', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 18:00:46:871', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('10981', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-6', '2017-03-27 18:02:52:752', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"limit\":\"10\",\"sort\":\"pkid\",\"order\":\"asc\",\"_\":\"1490608972420\",\"offset\":\"0\"}');
INSERT INTO `logs` VALUES ('10982', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 18:02:53:043', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('10983', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 18:02:53:194', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10984', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-27 18:02:53:390', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10985', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-6', '2017-03-27 18:02:53:483', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22716,\"rows\":[{\"age\":153,\"createDate\":1471526400000,\"pkid\":\"16081821200083611573\",\"sex\":\"女\",\"sname\":\"马容153女\"},{\"age\":154,\"createDate\":1471526400000,\"pkid\":\"16081821200083629080\",\"sex\":\"男\",\"sname\":\"王尼玛154男\"},{\"age\":155,\"createDate\":1471526400000,\"pkid\":\"16081821200083631014\",\"sex\":\"女\",\"sname\":\"马容155女\"},{\"age\":152,\"createDate\":1471526400000,\"pkid\":\"16081821200083645370\",\"sex\":\"男\",\"sname\":\"王尼玛152男\"},{\"age\":147,\"createDate\":1471526400000,\"pkid\":\"16081821200083660638\",\"sex\":\"女\",\"sname\":\"马容147女\"},{\"age\":149,\"createDate\":1471526400000,\"pkid\":\"16081821200083679617\",\"sex\":\"女\",\"sname\":\"马容149女\"},{\"age\":165,\"createDate\":1471526400000,\"pkid\":\"16081821200083768465\",\"sex\":\"女\",\"sname\":\"马容165女\"},{\"age\":163,\"createDate\":1471526400000,\"pkid\":\"16081821200083773875\",\"sex\":\"女\",\"sname\":\"马容163女\"},{\"age\":161,\"createDate\":1471526400000,\"pkid\":\"16081821200083777697\",\"sex\":\"女\",\"sname\":\"马容161女\"},{\"age\":157,\"createDate\":1471526400000,\"pkid\":\"16081821200083799882\",\"sex\":\"女\",\"sname\":\"马容157女\"}]}');
INSERT INTO `logs` VALUES ('10986', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-4', '2017-03-27 18:02:58:652', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"multiSort[1][sortName]\":\"sname\",\"limit\":\"10\",\"multiSort[0][sortOrder]\":\"asc\",\"sort\":\"\",\"order\":\"asc\",\"multiSort[1][sortOrder]\":\"desc\",\"_\":\"1490608972421\",\"offset\":\"0\",\"multiSort[0][sortName]\":\"pkid\"}');
INSERT INTO `logs` VALUES ('10987', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 18:02:58:719', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC, SNAME DESC limit ? ');
INSERT INTO `logs` VALUES ('10988', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 18:02:58:746', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10989', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 18:02:58:825', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10990', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-4', '2017-03-27 18:02:58:863', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22716,\"rows\":[{\"age\":153,\"createDate\":1471526400000,\"pkid\":\"16081821200083611573\",\"sex\":\"女\",\"sname\":\"马容153女\"},{\"age\":154,\"createDate\":1471526400000,\"pkid\":\"16081821200083629080\",\"sex\":\"男\",\"sname\":\"王尼玛154男\"},{\"age\":155,\"createDate\":1471526400000,\"pkid\":\"16081821200083631014\",\"sex\":\"女\",\"sname\":\"马容155女\"},{\"age\":152,\"createDate\":1471526400000,\"pkid\":\"16081821200083645370\",\"sex\":\"男\",\"sname\":\"王尼玛152男\"},{\"age\":147,\"createDate\":1471526400000,\"pkid\":\"16081821200083660638\",\"sex\":\"女\",\"sname\":\"马容147女\"},{\"age\":149,\"createDate\":1471526400000,\"pkid\":\"16081821200083679617\",\"sex\":\"女\",\"sname\":\"马容149女\"},{\"age\":165,\"createDate\":1471526400000,\"pkid\":\"16081821200083768465\",\"sex\":\"女\",\"sname\":\"马容165女\"},{\"age\":163,\"createDate\":1471526400000,\"pkid\":\"16081821200083773875\",\"sex\":\"女\",\"sname\":\"马容163女\"},{\"age\":161,\"createDate\":1471526400000,\"pkid\":\"16081821200083777697\",\"sex\":\"女\",\"sname\":\"马容161女\"},{\"age\":157,\"createDate\":1471526400000,\"pkid\":\"16081821200083799882\",\"sex\":\"女\",\"sname\":\"马容157女\"}]}');
INSERT INTO `logs` VALUES ('10991', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-4', '2017-03-27 18:03:10:900', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"multiSort[1][sortName]\":\"sname\",\"limit\":\"10\",\"multiSort[0][sortOrder]\":\"desc\",\"sort\":\"\",\"order\":\"asc\",\"multiSort[1][sortOrder]\":\"desc\",\"_\":\"1490608972422\",\"offset\":\"0\",\"multiSort[0][sortName]\":\"sname\"}');
INSERT INTO `logs` VALUES ('10992', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 18:03:10:939', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by SNAME DESC, SNAME DESC limit ? ');
INSERT INTO `logs` VALUES ('10993', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 18:03:10:955', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10994', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 18:03:11:077', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('10995', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-4', '2017-03-27 18:03:11:120', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22716,\"rows\":[{\"age\":36,\"createDate\":1471351512000,\"pkid\":\"17061511505520524338\",\"sex\":\"男\",\"sname\":\"鬼见愁\"},{\"age\":999,\"createDate\":1471526400000,\"pkid\":\"16081821200092515243\",\"sex\":\"女\",\"sname\":\"马容999女\"},{\"age\":997,\"createDate\":1471526400000,\"pkid\":\"16081821200092555196\",\"sex\":\"女\",\"sname\":\"马容997女\"},{\"age\":995,\"createDate\":1471526400000,\"pkid\":\"16081821200092532129\",\"sex\":\"女\",\"sname\":\"马容995女\"},{\"age\":993,\"createDate\":1471526400000,\"pkid\":\"16081821200092583177\",\"sex\":\"女\",\"sname\":\"马容993女\"},{\"age\":991,\"createDate\":1471526400000,\"pkid\":\"16081821200092504091\",\"sex\":\"女\",\"sname\":\"马容991女\"},{\"age\":989,\"createDate\":1471526400000,\"pkid\":\"16081821200092478624\",\"sex\":\"女\",\"sname\":\"马容989女\"},{\"age\":987,\"createDate\":1471526400000,\"pkid\":\"16081821200092432909\",\"sex\":\"女\",\"sname\":\"马容987女\"},{\"age\":985,\"createDate\":1471526400000,\"pkid\":\"16081821200092400042\",\"sex\":\"女\",\"sname\":\"马容985女\"},{\"age\":983,\"createDate\":1471526400000,\"pkid\":\"16081821200092437686\",\"sex\":\"女\",\"sname\":\"马容983女\"}]}');
INSERT INTO `logs` VALUES ('10996', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-4', '2017-03-27 18:03:12:906', 'com.fwd.common.util.LogAspect.doBefore(LogAspect.java:89)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 传入参数:{\"multiSort[1][sortName]\":\"sname\",\"limit\":\"10\",\"multiSort[0][sortOrder]\":\"desc\",\"sort\":\"\",\"order\":\"asc\",\"multiSort[1][sortOrder]\":\"desc\",\"_\":\"1490608972423\",\"offset\":\"0\",\"multiSort[0][sortName]\":\"sname\"}');
INSERT INTO `logs` VALUES ('10997', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 18:03:12:939', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by SNAME DESC, SNAME DESC limit ? ');
INSERT INTO `logs` VALUES ('10998', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 18:03:12:954', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('10999', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-4', '2017-03-27 18:03:13:090', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:145)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11000', 'INFO', 'com.fwd.common.util.LogAspect', 'http-bio-8088-exec-4', '2017-03-27 18:03:13:140', 'com.fwd.common.util.LogAspect.doAfter(LogAspect.java:107)', '用户:未登录 [查询列表] 执行:StaffController.getPage() 执行结果:{\"total\":22716,\"rows\":[{\"age\":36,\"createDate\":1471351512000,\"pkid\":\"17061511505520524338\",\"sex\":\"男\",\"sname\":\"鬼见愁\"},{\"age\":999,\"createDate\":1471526400000,\"pkid\":\"16081821200092515243\",\"sex\":\"女\",\"sname\":\"马容999女\"},{\"age\":997,\"createDate\":1471526400000,\"pkid\":\"16081821200092555196\",\"sex\":\"女\",\"sname\":\"马容997女\"},{\"age\":995,\"createDate\":1471526400000,\"pkid\":\"16081821200092532129\",\"sex\":\"女\",\"sname\":\"马容995女\"},{\"age\":993,\"createDate\":1471526400000,\"pkid\":\"16081821200092583177\",\"sex\":\"女\",\"sname\":\"马容993女\"},{\"age\":991,\"createDate\":1471526400000,\"pkid\":\"16081821200092504091\",\"sex\":\"女\",\"sname\":\"马容991女\"},{\"age\":989,\"createDate\":1471526400000,\"pkid\":\"16081821200092478624\",\"sex\":\"女\",\"sname\":\"马容989女\"},{\"age\":987,\"createDate\":1471526400000,\"pkid\":\"16081821200092432909\",\"sex\":\"女\",\"sname\":\"马容987女\"},{\"age\":985,\"createDate\":1471526400000,\"pkid\":\"16081821200092400042\",\"sex\":\"女\",\"sname\":\"马容985女\"},{\"age\":983,\"createDate\":1471526400000,\"pkid\":\"16081821200092437686\",\"sex\":\"女\",\"sname\":\"马容983女\"}]}');
INSERT INTO `logs` VALUES ('11001', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 18:12:37:516', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('11002', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 18:14:39:824', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('11003', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 18:17:03:359', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('11004', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-2', '2017-03-27 18:19:50:241', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeDestruction(LifecycleBeanPostProcessor.java:118)', 'Destroying bean [securityManager]...');
INSERT INTO `logs` VALUES ('11005', 'DEBUG', 'org.apache.shiro.session.mgt.quartz.QuartzSessionValidationScheduler', 'localhost-startStop-2', '2017-03-27 18:19:50:272', 'org.apache.shiro.session.mgt.quartz.QuartzSessionValidationScheduler.disableSessionValidation(QuartzSessionValidationScheduler.java:188)', 'Stopping Quartz session validation job...');
INSERT INTO `logs` VALUES ('11006', 'INFO', 'org.quartz.simpl.SimpleThreadPool', 'localhost-startStop-2', '2017-03-27 18:19:50:322', 'org.quartz.simpl.SimpleThreadPool.initialize(SimpleThreadPool.java:258)', 'Job execution threads will use class loader of thread: localhost-startStop-2');
INSERT INTO `logs` VALUES ('11007', 'INFO', 'org.quartz.core.SchedulerSignalerImpl', 'localhost-startStop-2', '2017-03-27 18:19:50:366', 'org.quartz.core.SchedulerSignalerImpl.<init>(SchedulerSignalerImpl.java:63)', 'Initialized Scheduler Signaller of type: class org.quartz.core.SchedulerSignalerImpl');
INSERT INTO `logs` VALUES ('11008', 'INFO', 'org.quartz.core.QuartzScheduler', 'localhost-startStop-2', '2017-03-27 18:19:50:380', 'org.quartz.core.QuartzScheduler.<init>(QuartzScheduler.java:215)', 'Quartz Scheduler v.1.6.1 created.');
INSERT INTO `logs` VALUES ('11009', 'INFO', 'org.quartz.simpl.RAMJobStore', 'localhost-startStop-2', '2017-03-27 18:19:50:406', 'org.quartz.simpl.RAMJobStore.initialize(RAMJobStore.java:141)', 'RAMJobStore initialized.');
INSERT INTO `logs` VALUES ('11010', 'INFO', 'org.quartz.impl.StdSchedulerFactory', 'localhost-startStop-2', '2017-03-27 18:19:50:429', 'org.quartz.impl.StdSchedulerFactory.instantiate(StdSchedulerFactory.java:1228)', 'Quartz scheduler version: 1.6.1');
INSERT INTO `logs` VALUES ('11011', 'DEBUG', 'org.apache.shiro.session.mgt.quartz.QuartzSessionValidationScheduler', 'localhost-startStop-2', '2017-03-27 18:19:50:449', 'org.apache.shiro.session.mgt.quartz.QuartzSessionValidationScheduler.disableSessionValidation(QuartzSessionValidationScheduler.java:212)', 'Quartz session validation job stopped successfully.');
INSERT INTO `logs` VALUES ('11012', 'INFO', 'org.quartz.core.QuartzScheduler', 'localhost-startStop-2', '2017-03-27 18:19:50:468', 'org.quartz.core.QuartzScheduler.shutdown(QuartzScheduler.java:570)', 'Scheduler DefaultQuartzScheduler_$_NON_CLUSTERED shutting down.');
INSERT INTO `logs` VALUES ('11013', 'INFO', 'org.quartz.core.QuartzScheduler', 'localhost-startStop-2', '2017-03-27 18:19:50:493', 'org.quartz.core.QuartzScheduler.standby(QuartzScheduler.java:496)', 'Scheduler DefaultQuartzScheduler_$_NON_CLUSTERED paused.');
INSERT INTO `logs` VALUES ('11014', 'INFO', 'org.quartz.core.QuartzScheduler', 'localhost-startStop-2', '2017-03-27 18:19:50:515', 'org.quartz.core.QuartzScheduler.shutdown(QuartzScheduler.java:621)', 'Scheduler DefaultQuartzScheduler_$_NON_CLUSTERED shutdown complete.');
INSERT INTO `logs` VALUES ('11015', 'INFO', 'org.apache.shiro.session.mgt.AbstractValidatingSessionManager', 'localhost-startStop-2', '2017-03-27 18:19:50:537', 'org.apache.shiro.session.mgt.AbstractValidatingSessionManager.disableSessionValidation(AbstractValidatingSessionManager.java:246)', 'Disabled session validation scheduler.');
INSERT INTO `logs` VALUES ('11016', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-2', '2017-03-27 18:19:50:560', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeDestruction(LifecycleBeanPostProcessor.java:118)', 'Destroying bean [sessionManager]...');
INSERT INTO `logs` VALUES ('11017', 'DEBUG', 'org.apache.shiro.spring.LifecycleBeanPostProcessor', 'localhost-startStop-1', '2017-03-27 18:20:00:316', 'org.apache.shiro.spring.LifecycleBeanPostProcessor.postProcessBeforeInitialization(LifecycleBeanPostProcessor.java:86)', 'Initializing bean [userRealm]...');
INSERT INTO `logs` VALUES ('11018', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-5', '2017-03-28 11:38:00:286', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268940}]');
INSERT INTO `logs` VALUES ('11019', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-6', '2017-03-28 11:38:00:286', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490672268941}]');
INSERT INTO `logs` VALUES ('11020', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-6', '2017-03-28 11:38:00:548', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@2df96371 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490672268941}]');
INSERT INTO `logs` VALUES ('11021', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-28 11:38:00:734', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11022', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-28 11:38:00:787', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11023', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-28 11:38:00:842', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11024', 'ERROR', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-5', '2017-03-28 11:38:02:520', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:176)', '执行StaffController.selectPage() 查询表格数据 异常: ');
INSERT INTO `logs` VALUES ('11025', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-7', '2017-03-28 11:38:18:598', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268942}]');
INSERT INTO `logs` VALUES ('11026', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-8', '2017-03-28 11:38:18:602', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=111, age=, export=, _=1490672268943}]');
INSERT INTO `logs` VALUES ('11027', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-7', '2017-03-28 11:38:18:634', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@3a191ba9 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268942}]');
INSERT INTO `logs` VALUES ('11028', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-8', '2017-03-28 11:38:18:656', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@5cc06b51 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=111, age=null, export=null, _=1490672268943}]');
INSERT INTO `logs` VALUES ('11029', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-28 11:38:18:675', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11030', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-28 11:38:18:698', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF WHERE SEX = ?) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11031', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-28 11:38:18:719', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11032', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-28 11:38:18:743', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 111(String), 10(Integer)');
INSERT INTO `logs` VALUES ('11033', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-28 11:38:18:769', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11034', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-28 11:38:18:807', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 0');
INSERT INTO `logs` VALUES ('11035', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-28 11:38:25:678', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268944}]');
INSERT INTO `logs` VALUES ('11036', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-28 11:38:25:685', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490672268945}]');
INSERT INTO `logs` VALUES ('11037', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-28 11:38:25:711', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@75626cd5 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268944}]');
INSERT INTO `logs` VALUES ('11038', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-28 11:38:25:733', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@6bbea496 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490672268945}]');
INSERT INTO `logs` VALUES ('11039', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:38:25:752', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11040', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-28 11:38:25:775', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11041', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:38:25:796', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11042', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-28 11:38:25:819', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11043', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:38:25:846', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11044', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-28 11:38:25:868', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11045', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-28 11:38:40:296', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268946}]');
INSERT INTO `logs` VALUES ('11046', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-2', '2017-03-28 11:38:40:299', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=å¼ ä¸, sex=, age=, export=, _=1490672268947}]');
INSERT INTO `logs` VALUES ('11047', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-28 11:38:40:333', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@56d6a93c ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268946}]');
INSERT INTO `logs` VALUES ('11048', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-2', '2017-03-28 11:38:40:356', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@3f1cc4f8 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=å¼ ä¸, sex=null, age=null, export=null, _=1490672268947}]');
INSERT INTO `logs` VALUES ('11049', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-28 11:38:40:375', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11050', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-28 11:38:40:397', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF WHERE SNAME = ?) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11051', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-28 11:38:40:418', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11052', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-28 11:38:40:441', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: å¼ ä¸(String), 10(Integer)');
INSERT INTO `logs` VALUES ('11053', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-28 11:38:40:468', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11054', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-28 11:38:40:505', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 0');
INSERT INTO `logs` VALUES ('11055', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-2', '2017-03-28 11:38:53:883', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268948}]');
INSERT INTO `logs` VALUES ('11056', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-6', '2017-03-28 11:38:53:886', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=121, export=, _=1490672268949}]');
INSERT INTO `logs` VALUES ('11057', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-2', '2017-03-28 11:38:53:922', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@6e0f1d21 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268948}]');
INSERT INTO `logs` VALUES ('11058', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-6', '2017-03-28 11:38:53:945', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@4163606a ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=121, export=null, _=1490672268949}]');
INSERT INTO `logs` VALUES ('11059', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-28 11:38:53:964', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11060', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-28 11:38:53:986', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF WHERE AGE = ?) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11061', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-28 11:38:54:007', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11062', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-28 11:38:54:030', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 121(String), 10(Integer)');
INSERT INTO `logs` VALUES ('11063', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-28 11:38:54:057', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11064', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-28 11:38:54:098', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 2');
INSERT INTO `logs` VALUES ('11065', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-6', '2017-03-28 11:39:03:132', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268950}]');
INSERT INTO `logs` VALUES ('11066', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-7', '2017-03-28 11:39:03:135', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490672268951}]');
INSERT INTO `logs` VALUES ('11067', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-6', '2017-03-28 11:39:03:177', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@28ff4d5f ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268950}]');
INSERT INTO `logs` VALUES ('11068', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-7', '2017-03-28 11:39:03:199', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@356e0dc6 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490672268951}]');
INSERT INTO `logs` VALUES ('11069', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-28 11:39:03:218', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11070', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-28 11:39:03:240', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11071', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-28 11:39:03:273', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11072', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-28 11:39:03:295', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11073', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-6', '2017-03-28 11:39:03:320', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11074', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-28 11:39:03:345', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11075', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-7', '2017-03-28 11:39:12:904', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268952}]');
INSERT INTO `logs` VALUES ('11076', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-28 11:39:12:907', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=258, age=, export=, _=1490672268953}]');
INSERT INTO `logs` VALUES ('11077', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-7', '2017-03-28 11:39:12:943', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@67c39241 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268952}]');
INSERT INTO `logs` VALUES ('11078', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-28 11:39:12:966', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@8223d2c ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=258, age=null, export=null, _=1490672268953}]');
INSERT INTO `logs` VALUES ('11079', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-28 11:39:13:053', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11080', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:39:13:085', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF WHERE SEX = ?) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11081', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-28 11:39:13:112', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11082', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:39:13:140', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 258(String), 10(Integer)');
INSERT INTO `logs` VALUES ('11083', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-28 11:39:13:165', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11084', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:39:13:205', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 0');
INSERT INTO `logs` VALUES ('11085', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-28 11:39:21:364', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268954}]');
INSERT INTO `logs` VALUES ('11086', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-28 11:39:21:368', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=, sex=, age=, export=, _=1490672268955}]');
INSERT INTO `logs` VALUES ('11087', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-28 11:39:21:385', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@2df491cd ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672268954}]');
INSERT INTO `logs` VALUES ('11088', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-28 11:39:21:410', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@2ff92596 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, sname=null, sex=null, age=null, export=null, _=1490672268955}]');
INSERT INTO `logs` VALUES ('11089', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:39:21:429', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11090', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-28 11:39:21:451', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11091', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:39:21:472', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11092', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-28 11:39:21:506', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11093', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:39:21:533', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11094', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-28 11:39:21:555', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11095', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-7', '2017-03-28 11:41:04:370', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672449350}]');
INSERT INTO `logs` VALUES ('11096', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-8', '2017-03-28 11:41:04:378', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, search[sname]=, search[sex]=, search[age]=, search[export]=, _=1490672449351}]');
INSERT INTO `logs` VALUES ('11097', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-7', '2017-03-28 11:41:04:408', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@1668383 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672449350}]');
INSERT INTO `logs` VALUES ('11098', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-8', '2017-03-28 11:41:04:429', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@1429c13c ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, search[sname]=null, search[sex]=null, search[age]=null, search[export]=null, _=1490672449351}]');
INSERT INTO `logs` VALUES ('11099', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-28 11:41:04:449', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11100', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-28 11:41:04:470', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11101', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-28 11:41:04:493', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11102', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-28 11:41:04:514', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11103', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-7', '2017-03-28 11:41:04:543', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11104', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-28 11:41:04:563', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11105', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-8', '2017-03-28 11:41:13:534', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672449352}]');
INSERT INTO `logs` VALUES ('11106', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-10', '2017-03-28 11:41:13:538', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, search[sname]=, search[sex]=dsada, search[age]=, search[export]=, _=1490672449353}]');
INSERT INTO `logs` VALUES ('11107', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-8', '2017-03-28 11:41:13:573', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@73d36210 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672449352}]');
INSERT INTO `logs` VALUES ('11108', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-10', '2017-03-28 11:41:13:596', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@4ccd3768 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, search[sname]=null, search[sex]=dsada, search[age]=null, search[export]=null, _=1490672449353}]');
INSERT INTO `logs` VALUES ('11109', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-28 11:41:13:615', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11110', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-28 11:41:13:637', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11111', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-28 11:41:13:659', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11112', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-28 11:41:13:681', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11113', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-8', '2017-03-28 11:41:13:706', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11114', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-10', '2017-03-28 11:41:13:728', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11115', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-2', '2017-03-28 11:42:19:702', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672538060}]');
INSERT INTO `logs` VALUES ('11116', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-28 11:42:19:709', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, search={\"sname\":\"\",\"sex\":\"\",\"age\":\"\",\"export\":\"\"}, _=1490672538061}]');
INSERT INTO `logs` VALUES ('11117', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-2', '2017-03-28 11:42:19:738', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@6ea9cf0a ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672538060}]');
INSERT INTO `logs` VALUES ('11118', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-28 11:42:19:761', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@5033dfe5 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, search={\"sname\":\"\",\"sex\":\"\",\"age\":\"\",\"export\":\"\"}, _=1490672538061}]');
INSERT INTO `logs` VALUES ('11119', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-28 11:42:19:780', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11120', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:42:19:802', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11121', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-28 11:42:19:824', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11122', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:42:19:846', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11123', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-2', '2017-03-28 11:42:19:871', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11124', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:42:19:893', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11125', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-9', '2017-03-28 11:42:33:643', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672538062}]');
INSERT INTO `logs` VALUES ('11126', 'INFO', 'com.fwd.mvc.controller.StaffController', 'http-bio-8088-exec-5', '2017-03-28 11:42:33:647', 'com.fwd.mvc.controller.StaffController.getPage(StaffController.java:133)', '执行StaffController.getPage() 查询表格数据 param[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, search={\"sname\":\"sss\",\"sex\":\"\",\"age\":\"\",\"export\":\"\"}, _=1490672538063}]');
INSERT INTO `logs` VALUES ('11127', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-9', '2017-03-28 11:42:33:692', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@269e80b8 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, _=1490672538062}]');
INSERT INTO `logs` VALUES ('11128', 'INFO', 'com.fwd.common.dao.BaseDao', 'http-bio-8088-exec-5', '2017-03-28 11:42:33:715', 'com.fwd.common.dao.BaseDao.selectPage(BaseDao.java:56)', '执行BaseDao.selectPage： pageInfo=[com.fwd.common.page.PageInfo@136a1cf0 ] params=[{sortName=pkid, sortOrder=asc, pageSize=10, pageNumber=1, search={\"sname\":\"sss\",\"sex\":\"\",\"age\":\"\",\"export\":\"\"}, _=1490672538063}]');
INSERT INTO `logs` VALUES ('11129', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:42:33:734', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11130', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-28 11:42:33:756', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==>  Preparing: select * from (SELECT PKID,SNAME,SEX,AGE,CREATE_DATE,CREATEBY, UPDATE_DATE,UPDATEBY FROM STAFF) temp_order order by PKID ASC limit ? ');
INSERT INTO `logs` VALUES ('11131', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:42:33:778', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11132', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-28 11:42:33:800', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '==> Parameters: 10(Integer)');
INSERT INTO `logs` VALUES ('11133', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-9', '2017-03-28 11:42:33:826', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');
INSERT INTO `logs` VALUES ('11134', 'DEBUG', 'com.fwd.mvc.mapper.Staff.select', 'http-bio-8088-exec-5', '2017-03-28 11:42:33:850', 'org.apache.ibatis.logging.jdbc.BaseJdbcLogger.debug(BaseJdbcLogger.java:142)', '<==      Total: 10');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `CONTENT` varchar(255) DEFAULT NULL,
  `TOPIC` varchar(255) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for platform
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `platform_name` varchar(50) NOT NULL COMMENT '平台名称',
  `platform_about` varchar(500) NOT NULL COMMENT '平台简介',
  `platform_site` varchar(50) DEFAULT NULL COMMENT '平台官网',
  `online_time` varchar(20) NOT NULL COMMENT '平台上线时间',
  `company_name` varchar(100) NOT NULL COMMENT '公司名称',
  `legal` varchar(50) NOT NULL COMMENT '公司法人',
  `register_capita` varchar(50) NOT NULL COMMENT '注册资金',
  `scale` varchar(20) DEFAULT NULL COMMENT '公司规模',
  `address` varchar(200) NOT NULL COMMENT '公司地址',
  `qq_group` varchar(50) DEFAULT NULL COMMENT 'QQ群',
  `trusteeship` varchar(100) DEFAULT NULL COMMENT '资金托管',
  `kefu_phone` varchar(100) NOT NULL COMMENT '客服电话',
  `logo` varchar(100) NOT NULL COMMENT '公司logo',
  `province` varchar(100) DEFAULT NULL COMMENT '省份',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `sta` varchar(50) DEFAULT NULL COMMENT '状态（0：终止合作 1：合作）',
  `bank_bg` varchar(200) DEFAULT NULL COMMENT '银行背景',
  `vc_bg` varchar(200) DEFAULT NULL COMMENT '风投背景',
  `icp_bg` varchar(200) DEFAULT NULL COMMENT 'ICP背景',
  `gz_bg` varchar(200) DEFAULT NULL COMMENT '国资背景',
  `market_bg` varchar(200) DEFAULT NULL COMMENT '上市公司背景',
  `my_bg` varchar(200) DEFAULT NULL COMMENT '民营背景',
  `bd_attorn` varchar(100) DEFAULT NULL COMMENT '可否转让（标的流动性 ）',
  `bd_interest_day` varchar(100) DEFAULT NULL COMMENT '起息时间（标的流动性 ）',
  `bd_auto` varchar(100) DEFAULT NULL COMMENT '自动投标（标的流动性 ）',
  `bd_exit` varchar(100) DEFAULT NULL COMMENT '退出方式（标的流动性 ）',
  `with_cah_day` varchar(100) DEFAULT NULL COMMENT '提现到账时间（标的流动性 ）',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台表';

-- ----------------------------
-- Records of platform
-- ----------------------------

-- ----------------------------
-- Table structure for popedom
-- ----------------------------
DROP TABLE IF EXISTS `popedom`;
CREATE TABLE `popedom` (
  `pkid` varchar(20) NOT NULL COMMENT '权限主键',
  `url` varchar(200) DEFAULT NULL COMMENT '请求的权限URL(本处都是到.do级别)',
  `memo` varchar(500) DEFAULT NULL COMMENT '权限描述',
  `modal` varchar(100) DEFAULT NULL COMMENT '模块名(nameSpace名字)',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of popedom
-- ----------------------------
INSERT INTO `popedom` VALUES ('213212542', 'staff/saveData.do', '修改职员', 'staff');
INSERT INTO `popedom` VALUES ('241556241', 'staff/selectPage.do', '查询职员', 'staff');
INSERT INTO `popedom` VALUES ('254123541', 'staff/init.do', '初始化职员', 'staff');
INSERT INTO `popedom` VALUES ('341542684', 'clientUser/saveData.do', '修改用户', 'clientUser');
INSERT INTO `popedom` VALUES ('351475954', 'clientUser/init.do', '初始化用户', 'clientUser');
INSERT INTO `popedom` VALUES ('369258147', 'clientUser/selectPage.do', '查询用户', 'clientUser');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('FwdScheduler', 'TASK_6', 'DEFAULT', '0 0/1 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_6', 'DEFAULT', '0 0/1 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('FwdScheduler', 'TASK_6', 'DEFAULT', null, 'com.rainsoft.module.job.utils.ScheduleJob', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720030636F6D2E7261696E736F66742E6D6F64756C652E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7872001A636F6D2E7261696E736F66742E7574696C2E4D757469536F7274000000000000000102000A4900056C696D69744900066F666673657449000D6F706572617465526573756C7449000A706167654E756D6265724900087061676553697A654C00096D756C7469536F72747400104C6A6176612F7574696C2F4C6973743B4C00056F7264657271007E00094C0004736F727471007E00094C0008736F72744E616D6571007E00094C0009736F72744F7264657271007E0009787000000000000000000000000000000000000000007070707070740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000160F9D6624F7874000D3020302F31202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000067400047465737474000CE7AE80E58D95E6B58BE8AF95740027E8BF99E698AFE7AE80E58D95E5B8A6E69C89E58F82E695B0E5AE9AE697B6E599A8E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0015000000007800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_6', 'DEFAULT', null, 'com.rainsoft.module.job.utils.ScheduleJob', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720030636F6D2E7261696E736F66742E6D6F64756C652E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7872001A636F6D2E7261696E736F66742E7574696C2E4D757469536F7274000000000000000102000A4900056C696D69744900066F666673657449000D6F706572617465526573756C7449000A706167654E756D6265724900087061676553697A654C00096D756C7469536F72747400104C6A6176612F7574696C2F4C6973743B4C00056F7264657271007E00094C0004736F727471007E00094C0008736F72744E616D6571007E00094C0009736F72744F7264657271007E0009787000000000000000000000000000000000000000007070707070740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000160F9D65F007874000D3020302F31202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000067400047465737474000CE7AE80E58D95E6B58BE8AF95740027E8BF99E698AFE7AE80E58D95E5B8A6E69C89E58F82E695B0E5AE9AE697B6E599A8E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0015000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('FwdScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('FwdScheduler', 'TRIGGER_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('FwdScheduler', 'PF10XHWW1526442702502', '1526442799215', '15000');
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'JK37JJKO790I3Y41516156441581', '1516171273097', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('FwdScheduler', 'TASK_6', 'DEFAULT', 'TASK_6', 'DEFAULT', null, '1526442840000', '1526442780000', '5', 'WAITING', 'CRON', '1516020064000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720030636F6D2E7261696E736F66742E6D6F64756C652E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7872001A636F6D2E7261696E736F66742E7574696C2E4D757469536F7274000000000000000102000A4900056C696D69744900066F666673657449000D6F706572617465526573756C7449000A706167654E756D6265724900087061676553697A654C00096D756C7469536F72747400104C6A6176612F7574696C2F4C6973743B4C00056F7264657271007E00094C0004736F727471007E00094C0008736F72744E616D6571007E00094C0009736F72744F7264657271007E0009787000000000000000000000000000000000000000007070707070740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000160F9D65F007874000D3020302F31202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000067400047465737474000CE7AE80E58D95E6B58BE8AF95740027E8BF99E698AFE7AE80E58D95E5B8A6E69C89E58F82E695B0E5AE9AE697B6E599A8E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0015000000007800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_6', 'DEFAULT', 'TASK_6', 'DEFAULT', null, '1516171320000', '1516171260000', '5', 'WAITING', 'CRON', '1516105227000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720030636F6D2E7261696E736F66742E6D6F64756C652E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7872001A636F6D2E7261696E736F66742E7574696C2E4D757469536F7274000000000000000102000A4900056C696D69744900066F666673657449000D6F706572617465526573756C7449000A706167654E756D6265724900087061676553697A654C00096D756C7469536F72747400104C6A6176612F7574696C2F4C6973743B4C00056F7264657271007E00094C0004736F727471007E00094C0008736F72744E616D6571007E00094C0009736F72744F7264657271007E0009787000000000000000000000000000000000000000007070707070740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000160F9D65F007874000D3020302F31202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000067400047465737474000CE7AE80E58D95E6B58BE8AF95740027E8BF99E698AFE7AE80E58D95E5B8A6E69C89E58F82E695B0E5AE9AE697B6E599A8E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0015000000007800);

-- ----------------------------
-- Table structure for role_btn
-- ----------------------------
DROP TABLE IF EXISTS `role_btn`;
CREATE TABLE `role_btn` (
  `pkid` varchar(20) NOT NULL COMMENT '角色_按钮关联表主键',
  `role_id` varchar(20) DEFAULT NULL COMMENT '角色id',
  `btn_id` varchar(20) DEFAULT NULL COMMENT '按钮ID',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_btn
-- ----------------------------
INSERT INTO `role_btn` VALUES ('147193514', '147258369', '11271748569');
INSERT INTO `role_btn` VALUES ('147241562', '147258369', '11275412594');
INSERT INTO `role_btn` VALUES ('147241587', '147258369', '16895745128');
INSERT INTO `role_btn` VALUES ('147254152', '147258369', '12543518654');
INSERT INTO `role_btn` VALUES ('147265481', '147258369', '16845248964');
INSERT INTO `role_btn` VALUES ('147358426', '147258369', '15784225171');
INSERT INTO `role_btn` VALUES ('147425841', '147258369', '12574596715');
INSERT INTO `role_btn` VALUES ('147451485', '147258369', '15741254864');
INSERT INTO `role_btn` VALUES ('147541258', '147258369', '11278451296');
INSERT INTO `role_btn` VALUES ('147548268', '147258369', '15795841257');
INSERT INTO `role_btn` VALUES ('147548269', '147258369', '12584512564');
INSERT INTO `role_btn` VALUES ('147654128', '147258369', '16741584942');
INSERT INTO `role_btn` VALUES ('147741257', '147258369', '16857481295');
INSERT INTO `role_btn` VALUES ('147842169', '147258369', '12535124895');
INSERT INTO `role_btn` VALUES ('147854268', '147258369', '12565485942');
INSERT INTO `role_btn` VALUES ('147954126', '147258369', '16784515954');
INSERT INTO `role_btn` VALUES ('147954196', '147258369', '11271587415');
INSERT INTO `role_btn` VALUES ('147954926', '147258369', '11271236548');
INSERT INTO `role_btn` VALUES ('157412584', '123456789', '16741584942');
INSERT INTO `role_btn` VALUES ('157841258', '123456789', '16895745128');

-- ----------------------------
-- Table structure for role_popedom
-- ----------------------------
DROP TABLE IF EXISTS `role_popedom`;
CREATE TABLE `role_popedom` (
  `pkid` varchar(20) NOT NULL COMMENT '角色_权限表关联表主键(多对多)',
  `role_id` varchar(20) DEFAULT NULL COMMENT '角色主键',
  `pop_id` varchar(20) DEFAULT NULL COMMENT '权限主键',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_popedom
-- ----------------------------
INSERT INTO `role_popedom` VALUES ('14254748153', '147258369', '351475954');
INSERT INTO `role_popedom` VALUES ('14785479542', '147258369', '369258147');
INSERT INTO `role_popedom` VALUES ('14857458957', '147258369', '254123541');
INSERT INTO `role_popedom` VALUES ('14864754958', '147258369', '241556241');
INSERT INTO `role_popedom` VALUES ('14957451428', '147258369', '213212542');
INSERT INTO `role_popedom` VALUES ('15834596838', '147258369', '341542684');
INSERT INTO `role_popedom` VALUES ('24518485232', '123456789', '241556241');
INSERT INTO `role_popedom` VALUES ('24535168456', '123456789', '341542684');
INSERT INTO `role_popedom` VALUES ('24548574519', '123456789', '254123541');
INSERT INTO `role_popedom` VALUES ('24568459587', '123456789', '213212542');
INSERT INTO `role_popedom` VALUES ('24595441287', '123456789', '351475954');
INSERT INTO `role_popedom` VALUES ('24598745126', '123456789', '369258147');

-- ----------------------------
-- Table structure for role_tree
-- ----------------------------
DROP TABLE IF EXISTS `role_tree`;
CREATE TABLE `role_tree` (
  `pkid` varchar(20) NOT NULL DEFAULT '' COMMENT '角色_菜单关联表主键(1对多)',
  `nodeId` varchar(20) DEFAULT NULL COMMENT '子节点ID',
  `nodeName` varchar(500) DEFAULT NULL COMMENT '树菜单显示标题',
  `exeUrl` varchar(500) DEFAULT NULL COMMENT '菜单树执行URL',
  `role_id` varchar(20) DEFAULT NULL COMMENT '拥有树菜单的角色',
  `parentId` varchar(20) DEFAULT NULL COMMENT '父节点ID(父节点本处默认:0级节点，1表示1级节点，2表示2级节点)',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_tree
-- ----------------------------
INSERT INTO `role_tree` VALUES ('11111', '2', '权限管理', '', '147258369', '1');
INSERT INTO `role_tree` VALUES ('12222', '21', '基础资料', '', '147258369', '1');
INSERT INTO `role_tree` VALUES ('12321', '31', '职员信息', 'staff/init.do', '147258369', '21');
INSERT INTO `role_tree` VALUES ('22222', '3', '用户管理', 'clientUser/init.do', '147258369', '2');
INSERT INTO `role_tree` VALUES ('31111', '3', '角色管理', 'clientRole/init.do', '147258369', '2');
INSERT INTO `role_tree` VALUES ('31211', '3', '用户关联角色', 'userRole/init.do', '147258369', '2');
INSERT INTO `role_tree` VALUES ('31212', '3', '角色关联地址', 'rolePopedom/init.do', '147258369', '2');
INSERT INTO `role_tree` VALUES ('31213', '3', '角色关联按钮', 'roleBtn/init.do', '147258369', '2');
INSERT INTO `role_tree` VALUES ('31214', '3', '角色关联树菜单', 'roleTree/init.do', '147258369', '2');
INSERT INTO `role_tree` VALUES ('33333', '1', '系统管理', null, '147258369', '0');
INSERT INTO `role_tree` VALUES ('44444', '3', '地址权限管理', 'popedom/init.do', '147258369', '2');
INSERT INTO `role_tree` VALUES ('55555', '1', '系统管理', null, '123456789', '0');
INSERT INTO `role_tree` VALUES ('66666', '2', '基础资料', null, '123456789', '1');
INSERT INTO `role_tree` VALUES ('77777', '3', '职员信息', 'staff/init.do', '123456789', '2');
INSERT INTO `role_tree` VALUES ('88888', '3', '用户管理', 'clientUser/init.do', '123456789', '2');
INSERT INTO `role_tree` VALUES ('98745', '32', '文档上传管理', 'toUploadFile.do', '147258369', '21');
INSERT INTO `role_tree` VALUES ('99999', '3', '按钮权限管理', 'btn/init.do', '147258369', '2');

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('6', 'testTask', 'test', '简单测试', '0 0/1 * * * ?', '0', '这是简单带有参数定时器测试', '2018-01-15 20:41:04');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2195 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('364', '6', 'testTask', 'test', '简单测试', '0', null, '1006', '2018-01-15 20:42:00');
INSERT INTO `schedule_job_log` VALUES ('365', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 20:43:00');
INSERT INTO `schedule_job_log` VALUES ('366', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 20:44:00');
INSERT INTO `schedule_job_log` VALUES ('367', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 20:45:00');
INSERT INTO `schedule_job_log` VALUES ('368', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 20:46:00');
INSERT INTO `schedule_job_log` VALUES ('369', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 20:47:00');
INSERT INTO `schedule_job_log` VALUES ('370', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 20:48:00');
INSERT INTO `schedule_job_log` VALUES ('371', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 20:49:00');
INSERT INTO `schedule_job_log` VALUES ('372', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 20:50:00');
INSERT INTO `schedule_job_log` VALUES ('373', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 20:51:00');
INSERT INTO `schedule_job_log` VALUES ('374', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 20:52:00');
INSERT INTO `schedule_job_log` VALUES ('375', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 20:53:00');
INSERT INTO `schedule_job_log` VALUES ('376', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 20:54:00');
INSERT INTO `schedule_job_log` VALUES ('377', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 20:55:00');
INSERT INTO `schedule_job_log` VALUES ('378', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 20:56:00');
INSERT INTO `schedule_job_log` VALUES ('379', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-15 20:57:00');
INSERT INTO `schedule_job_log` VALUES ('380', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 20:58:00');
INSERT INTO `schedule_job_log` VALUES ('381', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-15 20:59:00');
INSERT INTO `schedule_job_log` VALUES ('382', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-15 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('383', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 21:01:00');
INSERT INTO `schedule_job_log` VALUES ('384', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:02:00');
INSERT INTO `schedule_job_log` VALUES ('385', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:03:00');
INSERT INTO `schedule_job_log` VALUES ('386', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:04:00');
INSERT INTO `schedule_job_log` VALUES ('387', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 21:05:00');
INSERT INTO `schedule_job_log` VALUES ('388', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 21:06:00');
INSERT INTO `schedule_job_log` VALUES ('389', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 21:07:00');
INSERT INTO `schedule_job_log` VALUES ('390', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:08:00');
INSERT INTO `schedule_job_log` VALUES ('391', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:09:00');
INSERT INTO `schedule_job_log` VALUES ('392', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-15 21:10:00');
INSERT INTO `schedule_job_log` VALUES ('393', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:11:00');
INSERT INTO `schedule_job_log` VALUES ('394', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:12:00');
INSERT INTO `schedule_job_log` VALUES ('395', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 21:13:00');
INSERT INTO `schedule_job_log` VALUES ('396', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:14:00');
INSERT INTO `schedule_job_log` VALUES ('397', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:15:00');
INSERT INTO `schedule_job_log` VALUES ('398', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:16:00');
INSERT INTO `schedule_job_log` VALUES ('399', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:17:00');
INSERT INTO `schedule_job_log` VALUES ('400', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:18:00');
INSERT INTO `schedule_job_log` VALUES ('401', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:19:00');
INSERT INTO `schedule_job_log` VALUES ('402', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:20:00');
INSERT INTO `schedule_job_log` VALUES ('403', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:21:00');
INSERT INTO `schedule_job_log` VALUES ('404', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:22:00');
INSERT INTO `schedule_job_log` VALUES ('405', '6', 'testTask', 'test', '简单测试', '0', null, '1006', '2018-01-15 21:23:00');
INSERT INTO `schedule_job_log` VALUES ('406', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:24:00');
INSERT INTO `schedule_job_log` VALUES ('407', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 21:25:00');
INSERT INTO `schedule_job_log` VALUES ('408', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:26:00');
INSERT INTO `schedule_job_log` VALUES ('409', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:27:00');
INSERT INTO `schedule_job_log` VALUES ('410', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:28:00');
INSERT INTO `schedule_job_log` VALUES ('411', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:29:00');
INSERT INTO `schedule_job_log` VALUES ('412', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-15 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('413', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:31:00');
INSERT INTO `schedule_job_log` VALUES ('414', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-15 21:32:00');
INSERT INTO `schedule_job_log` VALUES ('415', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:33:00');
INSERT INTO `schedule_job_log` VALUES ('416', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:34:00');
INSERT INTO `schedule_job_log` VALUES ('417', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:35:00');
INSERT INTO `schedule_job_log` VALUES ('418', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:36:00');
INSERT INTO `schedule_job_log` VALUES ('419', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 21:37:00');
INSERT INTO `schedule_job_log` VALUES ('420', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:38:00');
INSERT INTO `schedule_job_log` VALUES ('421', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:39:00');
INSERT INTO `schedule_job_log` VALUES ('422', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:40:00');
INSERT INTO `schedule_job_log` VALUES ('423', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:41:00');
INSERT INTO `schedule_job_log` VALUES ('424', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:42:00');
INSERT INTO `schedule_job_log` VALUES ('425', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 21:43:00');
INSERT INTO `schedule_job_log` VALUES ('426', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:44:00');
INSERT INTO `schedule_job_log` VALUES ('427', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:45:00');
INSERT INTO `schedule_job_log` VALUES ('428', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:46:00');
INSERT INTO `schedule_job_log` VALUES ('429', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:47:00');
INSERT INTO `schedule_job_log` VALUES ('430', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:48:00');
INSERT INTO `schedule_job_log` VALUES ('431', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:49:00');
INSERT INTO `schedule_job_log` VALUES ('432', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-15 21:50:00');
INSERT INTO `schedule_job_log` VALUES ('433', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 21:51:00');
INSERT INTO `schedule_job_log` VALUES ('434', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:52:00');
INSERT INTO `schedule_job_log` VALUES ('435', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:53:00');
INSERT INTO `schedule_job_log` VALUES ('436', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:54:00');
INSERT INTO `schedule_job_log` VALUES ('437', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:55:00');
INSERT INTO `schedule_job_log` VALUES ('438', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:56:00');
INSERT INTO `schedule_job_log` VALUES ('439', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-15 21:57:00');
INSERT INTO `schedule_job_log` VALUES ('440', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 21:58:00');
INSERT INTO `schedule_job_log` VALUES ('441', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 21:59:00');
INSERT INTO `schedule_job_log` VALUES ('442', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('443', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:01:00');
INSERT INTO `schedule_job_log` VALUES ('444', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:02:00');
INSERT INTO `schedule_job_log` VALUES ('445', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:03:00');
INSERT INTO `schedule_job_log` VALUES ('446', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:04:00');
INSERT INTO `schedule_job_log` VALUES ('447', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-15 22:05:00');
INSERT INTO `schedule_job_log` VALUES ('448', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:06:00');
INSERT INTO `schedule_job_log` VALUES ('449', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 22:07:00');
INSERT INTO `schedule_job_log` VALUES ('450', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:08:00');
INSERT INTO `schedule_job_log` VALUES ('451', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:09:00');
INSERT INTO `schedule_job_log` VALUES ('452', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 22:10:00');
INSERT INTO `schedule_job_log` VALUES ('453', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:11:00');
INSERT INTO `schedule_job_log` VALUES ('454', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:12:00');
INSERT INTO `schedule_job_log` VALUES ('455', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 22:13:00');
INSERT INTO `schedule_job_log` VALUES ('456', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:14:00');
INSERT INTO `schedule_job_log` VALUES ('457', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 22:15:00');
INSERT INTO `schedule_job_log` VALUES ('458', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:16:00');
INSERT INTO `schedule_job_log` VALUES ('459', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 22:17:00');
INSERT INTO `schedule_job_log` VALUES ('460', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:18:00');
INSERT INTO `schedule_job_log` VALUES ('461', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:19:00');
INSERT INTO `schedule_job_log` VALUES ('462', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:20:00');
INSERT INTO `schedule_job_log` VALUES ('463', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:21:00');
INSERT INTO `schedule_job_log` VALUES ('464', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:22:00');
INSERT INTO `schedule_job_log` VALUES ('465', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:23:00');
INSERT INTO `schedule_job_log` VALUES ('466', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:24:00');
INSERT INTO `schedule_job_log` VALUES ('467', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:25:00');
INSERT INTO `schedule_job_log` VALUES ('468', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 22:26:00');
INSERT INTO `schedule_job_log` VALUES ('469', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:27:00');
INSERT INTO `schedule_job_log` VALUES ('470', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:28:00');
INSERT INTO `schedule_job_log` VALUES ('471', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:29:00');
INSERT INTO `schedule_job_log` VALUES ('472', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('473', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:31:00');
INSERT INTO `schedule_job_log` VALUES ('474', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:32:00');
INSERT INTO `schedule_job_log` VALUES ('475', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:33:00');
INSERT INTO `schedule_job_log` VALUES ('476', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 22:34:00');
INSERT INTO `schedule_job_log` VALUES ('477', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:35:00');
INSERT INTO `schedule_job_log` VALUES ('478', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-15 22:36:00');
INSERT INTO `schedule_job_log` VALUES ('479', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:37:00');
INSERT INTO `schedule_job_log` VALUES ('480', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:38:00');
INSERT INTO `schedule_job_log` VALUES ('481', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:39:00');
INSERT INTO `schedule_job_log` VALUES ('482', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:40:00');
INSERT INTO `schedule_job_log` VALUES ('483', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 22:41:00');
INSERT INTO `schedule_job_log` VALUES ('484', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:42:00');
INSERT INTO `schedule_job_log` VALUES ('485', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 22:43:00');
INSERT INTO `schedule_job_log` VALUES ('486', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 22:44:00');
INSERT INTO `schedule_job_log` VALUES ('487', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:45:00');
INSERT INTO `schedule_job_log` VALUES ('488', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:46:00');
INSERT INTO `schedule_job_log` VALUES ('489', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:47:00');
INSERT INTO `schedule_job_log` VALUES ('490', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 22:48:00');
INSERT INTO `schedule_job_log` VALUES ('491', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:49:00');
INSERT INTO `schedule_job_log` VALUES ('492', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 22:50:00');
INSERT INTO `schedule_job_log` VALUES ('493', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:51:00');
INSERT INTO `schedule_job_log` VALUES ('494', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:52:00');
INSERT INTO `schedule_job_log` VALUES ('495', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:53:00');
INSERT INTO `schedule_job_log` VALUES ('496', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:54:00');
INSERT INTO `schedule_job_log` VALUES ('497', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:55:00');
INSERT INTO `schedule_job_log` VALUES ('498', '6', 'testTask', 'test', '简单测试', '0', null, '1012', '2018-01-15 22:56:00');
INSERT INTO `schedule_job_log` VALUES ('499', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:57:00');
INSERT INTO `schedule_job_log` VALUES ('500', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:58:00');
INSERT INTO `schedule_job_log` VALUES ('501', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 22:59:00');
INSERT INTO `schedule_job_log` VALUES ('502', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('503', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:01:00');
INSERT INTO `schedule_job_log` VALUES ('504', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:02:00');
INSERT INTO `schedule_job_log` VALUES ('505', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:03:00');
INSERT INTO `schedule_job_log` VALUES ('506', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 23:04:00');
INSERT INTO `schedule_job_log` VALUES ('507', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:05:00');
INSERT INTO `schedule_job_log` VALUES ('508', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-15 23:06:00');
INSERT INTO `schedule_job_log` VALUES ('509', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:07:00');
INSERT INTO `schedule_job_log` VALUES ('510', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:08:00');
INSERT INTO `schedule_job_log` VALUES ('511', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:09:00');
INSERT INTO `schedule_job_log` VALUES ('512', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 23:10:00');
INSERT INTO `schedule_job_log` VALUES ('513', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 23:11:00');
INSERT INTO `schedule_job_log` VALUES ('514', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:12:00');
INSERT INTO `schedule_job_log` VALUES ('515', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 23:13:00');
INSERT INTO `schedule_job_log` VALUES ('516', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:14:00');
INSERT INTO `schedule_job_log` VALUES ('517', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:15:00');
INSERT INTO `schedule_job_log` VALUES ('518', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:16:00');
INSERT INTO `schedule_job_log` VALUES ('519', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:17:00');
INSERT INTO `schedule_job_log` VALUES ('520', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 23:18:00');
INSERT INTO `schedule_job_log` VALUES ('521', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:19:00');
INSERT INTO `schedule_job_log` VALUES ('522', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:20:00');
INSERT INTO `schedule_job_log` VALUES ('523', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:21:00');
INSERT INTO `schedule_job_log` VALUES ('524', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:22:00');
INSERT INTO `schedule_job_log` VALUES ('525', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:23:00');
INSERT INTO `schedule_job_log` VALUES ('526', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:24:00');
INSERT INTO `schedule_job_log` VALUES ('527', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 23:25:00');
INSERT INTO `schedule_job_log` VALUES ('528', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:26:00');
INSERT INTO `schedule_job_log` VALUES ('529', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:27:00');
INSERT INTO `schedule_job_log` VALUES ('530', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:28:00');
INSERT INTO `schedule_job_log` VALUES ('531', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:29:00');
INSERT INTO `schedule_job_log` VALUES ('532', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('533', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:31:00');
INSERT INTO `schedule_job_log` VALUES ('534', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:32:00');
INSERT INTO `schedule_job_log` VALUES ('535', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:33:00');
INSERT INTO `schedule_job_log` VALUES ('536', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:34:00');
INSERT INTO `schedule_job_log` VALUES ('537', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:35:00');
INSERT INTO `schedule_job_log` VALUES ('538', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:36:00');
INSERT INTO `schedule_job_log` VALUES ('539', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 23:37:00');
INSERT INTO `schedule_job_log` VALUES ('540', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:38:00');
INSERT INTO `schedule_job_log` VALUES ('541', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 23:39:00');
INSERT INTO `schedule_job_log` VALUES ('542', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-15 23:40:00');
INSERT INTO `schedule_job_log` VALUES ('543', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:41:00');
INSERT INTO `schedule_job_log` VALUES ('544', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:42:00');
INSERT INTO `schedule_job_log` VALUES ('545', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:43:00');
INSERT INTO `schedule_job_log` VALUES ('546', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:44:00');
INSERT INTO `schedule_job_log` VALUES ('547', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 23:45:00');
INSERT INTO `schedule_job_log` VALUES ('548', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:46:00');
INSERT INTO `schedule_job_log` VALUES ('549', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-15 23:47:00');
INSERT INTO `schedule_job_log` VALUES ('550', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:48:00');
INSERT INTO `schedule_job_log` VALUES ('551', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:49:00');
INSERT INTO `schedule_job_log` VALUES ('552', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 23:50:00');
INSERT INTO `schedule_job_log` VALUES ('553', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-15 23:51:00');
INSERT INTO `schedule_job_log` VALUES ('554', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:52:00');
INSERT INTO `schedule_job_log` VALUES ('555', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:53:00');
INSERT INTO `schedule_job_log` VALUES ('556', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:54:00');
INSERT INTO `schedule_job_log` VALUES ('557', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-15 23:55:00');
INSERT INTO `schedule_job_log` VALUES ('558', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:56:00');
INSERT INTO `schedule_job_log` VALUES ('559', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:57:00');
INSERT INTO `schedule_job_log` VALUES ('560', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:58:00');
INSERT INTO `schedule_job_log` VALUES ('561', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-15 23:59:00');
INSERT INTO `schedule_job_log` VALUES ('562', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('563', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:01:00');
INSERT INTO `schedule_job_log` VALUES ('564', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 00:02:00');
INSERT INTO `schedule_job_log` VALUES ('565', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:03:00');
INSERT INTO `schedule_job_log` VALUES ('566', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:04:00');
INSERT INTO `schedule_job_log` VALUES ('567', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:05:00');
INSERT INTO `schedule_job_log` VALUES ('568', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:06:00');
INSERT INTO `schedule_job_log` VALUES ('569', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:07:00');
INSERT INTO `schedule_job_log` VALUES ('570', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:08:00');
INSERT INTO `schedule_job_log` VALUES ('571', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 00:09:00');
INSERT INTO `schedule_job_log` VALUES ('572', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 00:10:00');
INSERT INTO `schedule_job_log` VALUES ('573', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:11:00');
INSERT INTO `schedule_job_log` VALUES ('574', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:12:00');
INSERT INTO `schedule_job_log` VALUES ('575', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:13:00');
INSERT INTO `schedule_job_log` VALUES ('576', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:14:00');
INSERT INTO `schedule_job_log` VALUES ('577', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:15:00');
INSERT INTO `schedule_job_log` VALUES ('578', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:16:00');
INSERT INTO `schedule_job_log` VALUES ('579', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 00:17:00');
INSERT INTO `schedule_job_log` VALUES ('580', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 00:18:00');
INSERT INTO `schedule_job_log` VALUES ('581', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 00:19:00');
INSERT INTO `schedule_job_log` VALUES ('582', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:20:00');
INSERT INTO `schedule_job_log` VALUES ('583', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 00:21:00');
INSERT INTO `schedule_job_log` VALUES ('584', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:22:00');
INSERT INTO `schedule_job_log` VALUES ('585', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:23:00');
INSERT INTO `schedule_job_log` VALUES ('586', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:24:00');
INSERT INTO `schedule_job_log` VALUES ('587', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:25:00');
INSERT INTO `schedule_job_log` VALUES ('588', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:26:00');
INSERT INTO `schedule_job_log` VALUES ('589', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:27:00');
INSERT INTO `schedule_job_log` VALUES ('590', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:28:00');
INSERT INTO `schedule_job_log` VALUES ('591', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:29:00');
INSERT INTO `schedule_job_log` VALUES ('592', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('593', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:31:00');
INSERT INTO `schedule_job_log` VALUES ('594', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:32:00');
INSERT INTO `schedule_job_log` VALUES ('595', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:33:00');
INSERT INTO `schedule_job_log` VALUES ('596', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:34:00');
INSERT INTO `schedule_job_log` VALUES ('597', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:35:00');
INSERT INTO `schedule_job_log` VALUES ('598', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:36:00');
INSERT INTO `schedule_job_log` VALUES ('599', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 00:37:00');
INSERT INTO `schedule_job_log` VALUES ('600', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:38:00');
INSERT INTO `schedule_job_log` VALUES ('601', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:39:00');
INSERT INTO `schedule_job_log` VALUES ('602', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:40:00');
INSERT INTO `schedule_job_log` VALUES ('603', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:41:00');
INSERT INTO `schedule_job_log` VALUES ('604', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 00:42:00');
INSERT INTO `schedule_job_log` VALUES ('605', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:43:00');
INSERT INTO `schedule_job_log` VALUES ('606', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 00:44:00');
INSERT INTO `schedule_job_log` VALUES ('607', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:45:00');
INSERT INTO `schedule_job_log` VALUES ('608', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 00:46:00');
INSERT INTO `schedule_job_log` VALUES ('609', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:47:00');
INSERT INTO `schedule_job_log` VALUES ('610', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 00:48:00');
INSERT INTO `schedule_job_log` VALUES ('611', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 00:49:00');
INSERT INTO `schedule_job_log` VALUES ('612', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 00:50:00');
INSERT INTO `schedule_job_log` VALUES ('613', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:51:00');
INSERT INTO `schedule_job_log` VALUES ('614', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:52:00');
INSERT INTO `schedule_job_log` VALUES ('615', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 00:53:00');
INSERT INTO `schedule_job_log` VALUES ('616', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:54:00');
INSERT INTO `schedule_job_log` VALUES ('617', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:55:00');
INSERT INTO `schedule_job_log` VALUES ('618', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:56:00');
INSERT INTO `schedule_job_log` VALUES ('619', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 00:57:00');
INSERT INTO `schedule_job_log` VALUES ('620', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:58:00');
INSERT INTO `schedule_job_log` VALUES ('621', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 00:59:00');
INSERT INTO `schedule_job_log` VALUES ('622', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('623', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:01:00');
INSERT INTO `schedule_job_log` VALUES ('624', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:02:00');
INSERT INTO `schedule_job_log` VALUES ('625', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 01:03:00');
INSERT INTO `schedule_job_log` VALUES ('626', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:04:00');
INSERT INTO `schedule_job_log` VALUES ('627', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:05:00');
INSERT INTO `schedule_job_log` VALUES ('628', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:06:00');
INSERT INTO `schedule_job_log` VALUES ('629', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:07:00');
INSERT INTO `schedule_job_log` VALUES ('630', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 01:08:00');
INSERT INTO `schedule_job_log` VALUES ('631', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:09:00');
INSERT INTO `schedule_job_log` VALUES ('632', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:10:00');
INSERT INTO `schedule_job_log` VALUES ('633', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 01:11:00');
INSERT INTO `schedule_job_log` VALUES ('634', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:12:00');
INSERT INTO `schedule_job_log` VALUES ('635', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:13:00');
INSERT INTO `schedule_job_log` VALUES ('636', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:14:00');
INSERT INTO `schedule_job_log` VALUES ('637', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:15:00');
INSERT INTO `schedule_job_log` VALUES ('638', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:16:00');
INSERT INTO `schedule_job_log` VALUES ('639', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:17:00');
INSERT INTO `schedule_job_log` VALUES ('640', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:18:00');
INSERT INTO `schedule_job_log` VALUES ('641', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:19:00');
INSERT INTO `schedule_job_log` VALUES ('642', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:20:00');
INSERT INTO `schedule_job_log` VALUES ('643', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:21:00');
INSERT INTO `schedule_job_log` VALUES ('644', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:22:00');
INSERT INTO `schedule_job_log` VALUES ('645', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 01:23:00');
INSERT INTO `schedule_job_log` VALUES ('646', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 01:24:00');
INSERT INTO `schedule_job_log` VALUES ('647', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:25:00');
INSERT INTO `schedule_job_log` VALUES ('648', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 01:26:00');
INSERT INTO `schedule_job_log` VALUES ('649', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:27:00');
INSERT INTO `schedule_job_log` VALUES ('650', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:28:00');
INSERT INTO `schedule_job_log` VALUES ('651', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:29:00');
INSERT INTO `schedule_job_log` VALUES ('652', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('653', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:31:00');
INSERT INTO `schedule_job_log` VALUES ('654', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:32:00');
INSERT INTO `schedule_job_log` VALUES ('655', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:33:00');
INSERT INTO `schedule_job_log` VALUES ('656', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:34:00');
INSERT INTO `schedule_job_log` VALUES ('657', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:35:00');
INSERT INTO `schedule_job_log` VALUES ('658', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:36:00');
INSERT INTO `schedule_job_log` VALUES ('659', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 01:37:00');
INSERT INTO `schedule_job_log` VALUES ('660', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 01:38:00');
INSERT INTO `schedule_job_log` VALUES ('661', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:39:00');
INSERT INTO `schedule_job_log` VALUES ('662', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:40:00');
INSERT INTO `schedule_job_log` VALUES ('663', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:41:00');
INSERT INTO `schedule_job_log` VALUES ('664', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:42:00');
INSERT INTO `schedule_job_log` VALUES ('665', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:43:00');
INSERT INTO `schedule_job_log` VALUES ('666', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 01:44:00');
INSERT INTO `schedule_job_log` VALUES ('667', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:45:00');
INSERT INTO `schedule_job_log` VALUES ('668', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:46:00');
INSERT INTO `schedule_job_log` VALUES ('669', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:47:00');
INSERT INTO `schedule_job_log` VALUES ('670', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:48:00');
INSERT INTO `schedule_job_log` VALUES ('671', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:49:00');
INSERT INTO `schedule_job_log` VALUES ('672', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 01:50:00');
INSERT INTO `schedule_job_log` VALUES ('673', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:51:00');
INSERT INTO `schedule_job_log` VALUES ('674', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:52:00');
INSERT INTO `schedule_job_log` VALUES ('675', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:53:00');
INSERT INTO `schedule_job_log` VALUES ('676', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 01:54:00');
INSERT INTO `schedule_job_log` VALUES ('677', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:55:00');
INSERT INTO `schedule_job_log` VALUES ('678', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:56:00');
INSERT INTO `schedule_job_log` VALUES ('679', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 01:57:00');
INSERT INTO `schedule_job_log` VALUES ('680', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:58:00');
INSERT INTO `schedule_job_log` VALUES ('681', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 01:59:00');
INSERT INTO `schedule_job_log` VALUES ('682', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('683', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:01:00');
INSERT INTO `schedule_job_log` VALUES ('684', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:02:00');
INSERT INTO `schedule_job_log` VALUES ('685', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 02:03:00');
INSERT INTO `schedule_job_log` VALUES ('686', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 02:04:00');
INSERT INTO `schedule_job_log` VALUES ('687', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 02:05:00');
INSERT INTO `schedule_job_log` VALUES ('688', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:06:00');
INSERT INTO `schedule_job_log` VALUES ('689', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 02:07:00');
INSERT INTO `schedule_job_log` VALUES ('690', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 02:08:00');
INSERT INTO `schedule_job_log` VALUES ('691', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:09:00');
INSERT INTO `schedule_job_log` VALUES ('692', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 02:10:00');
INSERT INTO `schedule_job_log` VALUES ('693', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:11:00');
INSERT INTO `schedule_job_log` VALUES ('694', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:12:00');
INSERT INTO `schedule_job_log` VALUES ('695', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:13:00');
INSERT INTO `schedule_job_log` VALUES ('696', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 02:14:00');
INSERT INTO `schedule_job_log` VALUES ('697', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:15:00');
INSERT INTO `schedule_job_log` VALUES ('698', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:16:00');
INSERT INTO `schedule_job_log` VALUES ('699', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 02:17:00');
INSERT INTO `schedule_job_log` VALUES ('700', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:18:00');
INSERT INTO `schedule_job_log` VALUES ('701', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:19:00');
INSERT INTO `schedule_job_log` VALUES ('702', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:20:00');
INSERT INTO `schedule_job_log` VALUES ('703', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 02:21:00');
INSERT INTO `schedule_job_log` VALUES ('704', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:22:00');
INSERT INTO `schedule_job_log` VALUES ('705', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:23:00');
INSERT INTO `schedule_job_log` VALUES ('706', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:24:00');
INSERT INTO `schedule_job_log` VALUES ('707', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:25:00');
INSERT INTO `schedule_job_log` VALUES ('708', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:26:00');
INSERT INTO `schedule_job_log` VALUES ('709', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:27:00');
INSERT INTO `schedule_job_log` VALUES ('710', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:28:00');
INSERT INTO `schedule_job_log` VALUES ('711', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:29:00');
INSERT INTO `schedule_job_log` VALUES ('712', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('713', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:31:00');
INSERT INTO `schedule_job_log` VALUES ('714', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:32:00');
INSERT INTO `schedule_job_log` VALUES ('715', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:33:00');
INSERT INTO `schedule_job_log` VALUES ('716', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 02:34:00');
INSERT INTO `schedule_job_log` VALUES ('717', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:35:00');
INSERT INTO `schedule_job_log` VALUES ('718', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:36:00');
INSERT INTO `schedule_job_log` VALUES ('719', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 02:37:00');
INSERT INTO `schedule_job_log` VALUES ('720', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:38:00');
INSERT INTO `schedule_job_log` VALUES ('721', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:39:00');
INSERT INTO `schedule_job_log` VALUES ('722', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 02:40:00');
INSERT INTO `schedule_job_log` VALUES ('723', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 02:41:00');
INSERT INTO `schedule_job_log` VALUES ('724', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:42:00');
INSERT INTO `schedule_job_log` VALUES ('725', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:43:00');
INSERT INTO `schedule_job_log` VALUES ('726', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:44:00');
INSERT INTO `schedule_job_log` VALUES ('727', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:45:00');
INSERT INTO `schedule_job_log` VALUES ('728', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:46:00');
INSERT INTO `schedule_job_log` VALUES ('729', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:47:00');
INSERT INTO `schedule_job_log` VALUES ('730', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 02:48:00');
INSERT INTO `schedule_job_log` VALUES ('731', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:49:00');
INSERT INTO `schedule_job_log` VALUES ('732', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 02:50:00');
INSERT INTO `schedule_job_log` VALUES ('733', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 02:51:00');
INSERT INTO `schedule_job_log` VALUES ('734', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 02:52:00');
INSERT INTO `schedule_job_log` VALUES ('735', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:53:00');
INSERT INTO `schedule_job_log` VALUES ('736', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:54:00');
INSERT INTO `schedule_job_log` VALUES ('737', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:55:00');
INSERT INTO `schedule_job_log` VALUES ('738', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 02:56:00');
INSERT INTO `schedule_job_log` VALUES ('739', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 02:57:00');
INSERT INTO `schedule_job_log` VALUES ('740', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 02:58:00');
INSERT INTO `schedule_job_log` VALUES ('741', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 02:59:00');
INSERT INTO `schedule_job_log` VALUES ('742', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('743', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:01:00');
INSERT INTO `schedule_job_log` VALUES ('744', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:02:00');
INSERT INTO `schedule_job_log` VALUES ('745', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:03:00');
INSERT INTO `schedule_job_log` VALUES ('746', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:04:00');
INSERT INTO `schedule_job_log` VALUES ('747', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 03:05:00');
INSERT INTO `schedule_job_log` VALUES ('748', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:06:00');
INSERT INTO `schedule_job_log` VALUES ('749', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 03:07:00');
INSERT INTO `schedule_job_log` VALUES ('750', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:08:00');
INSERT INTO `schedule_job_log` VALUES ('751', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:09:00');
INSERT INTO `schedule_job_log` VALUES ('752', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 03:10:00');
INSERT INTO `schedule_job_log` VALUES ('753', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:11:00');
INSERT INTO `schedule_job_log` VALUES ('754', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:12:00');
INSERT INTO `schedule_job_log` VALUES ('755', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:13:00');
INSERT INTO `schedule_job_log` VALUES ('756', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:14:00');
INSERT INTO `schedule_job_log` VALUES ('757', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:15:00');
INSERT INTO `schedule_job_log` VALUES ('758', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:16:00');
INSERT INTO `schedule_job_log` VALUES ('759', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 03:17:00');
INSERT INTO `schedule_job_log` VALUES ('760', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 03:18:00');
INSERT INTO `schedule_job_log` VALUES ('761', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:19:00');
INSERT INTO `schedule_job_log` VALUES ('762', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:20:00');
INSERT INTO `schedule_job_log` VALUES ('763', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 03:21:00');
INSERT INTO `schedule_job_log` VALUES ('764', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:22:00');
INSERT INTO `schedule_job_log` VALUES ('765', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:23:00');
INSERT INTO `schedule_job_log` VALUES ('766', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:24:00');
INSERT INTO `schedule_job_log` VALUES ('767', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:25:00');
INSERT INTO `schedule_job_log` VALUES ('768', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:26:00');
INSERT INTO `schedule_job_log` VALUES ('769', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:27:00');
INSERT INTO `schedule_job_log` VALUES ('770', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:28:00');
INSERT INTO `schedule_job_log` VALUES ('771', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 03:29:00');
INSERT INTO `schedule_job_log` VALUES ('772', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('773', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:31:00');
INSERT INTO `schedule_job_log` VALUES ('774', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:32:00');
INSERT INTO `schedule_job_log` VALUES ('775', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:33:00');
INSERT INTO `schedule_job_log` VALUES ('776', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:34:00');
INSERT INTO `schedule_job_log` VALUES ('777', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 03:35:00');
INSERT INTO `schedule_job_log` VALUES ('778', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:36:00');
INSERT INTO `schedule_job_log` VALUES ('779', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:37:00');
INSERT INTO `schedule_job_log` VALUES ('780', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:38:00');
INSERT INTO `schedule_job_log` VALUES ('781', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:39:00');
INSERT INTO `schedule_job_log` VALUES ('782', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:40:00');
INSERT INTO `schedule_job_log` VALUES ('783', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:41:00');
INSERT INTO `schedule_job_log` VALUES ('784', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 03:42:00');
INSERT INTO `schedule_job_log` VALUES ('785', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:43:00');
INSERT INTO `schedule_job_log` VALUES ('786', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:44:00');
INSERT INTO `schedule_job_log` VALUES ('787', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:45:00');
INSERT INTO `schedule_job_log` VALUES ('788', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:46:00');
INSERT INTO `schedule_job_log` VALUES ('789', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:47:00');
INSERT INTO `schedule_job_log` VALUES ('790', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:48:00');
INSERT INTO `schedule_job_log` VALUES ('791', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 03:49:00');
INSERT INTO `schedule_job_log` VALUES ('792', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 03:50:00');
INSERT INTO `schedule_job_log` VALUES ('793', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:51:00');
INSERT INTO `schedule_job_log` VALUES ('794', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:52:00');
INSERT INTO `schedule_job_log` VALUES ('795', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:53:00');
INSERT INTO `schedule_job_log` VALUES ('796', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:54:00');
INSERT INTO `schedule_job_log` VALUES ('797', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:55:00');
INSERT INTO `schedule_job_log` VALUES ('798', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:56:00');
INSERT INTO `schedule_job_log` VALUES ('799', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 03:57:00');
INSERT INTO `schedule_job_log` VALUES ('800', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 03:58:00');
INSERT INTO `schedule_job_log` VALUES ('801', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 03:59:00');
INSERT INTO `schedule_job_log` VALUES ('802', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('803', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 04:01:00');
INSERT INTO `schedule_job_log` VALUES ('804', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:02:00');
INSERT INTO `schedule_job_log` VALUES ('805', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:03:00');
INSERT INTO `schedule_job_log` VALUES ('806', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:04:00');
INSERT INTO `schedule_job_log` VALUES ('807', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:05:00');
INSERT INTO `schedule_job_log` VALUES ('808', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:06:00');
INSERT INTO `schedule_job_log` VALUES ('809', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:07:00');
INSERT INTO `schedule_job_log` VALUES ('810', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 04:08:00');
INSERT INTO `schedule_job_log` VALUES ('811', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:09:00');
INSERT INTO `schedule_job_log` VALUES ('812', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:10:00');
INSERT INTO `schedule_job_log` VALUES ('813', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:11:00');
INSERT INTO `schedule_job_log` VALUES ('814', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:12:00');
INSERT INTO `schedule_job_log` VALUES ('815', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:13:00');
INSERT INTO `schedule_job_log` VALUES ('816', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:14:00');
INSERT INTO `schedule_job_log` VALUES ('817', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:15:00');
INSERT INTO `schedule_job_log` VALUES ('818', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:16:00');
INSERT INTO `schedule_job_log` VALUES ('819', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:17:00');
INSERT INTO `schedule_job_log` VALUES ('820', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:18:00');
INSERT INTO `schedule_job_log` VALUES ('821', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 04:19:00');
INSERT INTO `schedule_job_log` VALUES ('822', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:20:00');
INSERT INTO `schedule_job_log` VALUES ('823', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:21:00');
INSERT INTO `schedule_job_log` VALUES ('824', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:22:00');
INSERT INTO `schedule_job_log` VALUES ('825', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:23:00');
INSERT INTO `schedule_job_log` VALUES ('826', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:24:00');
INSERT INTO `schedule_job_log` VALUES ('827', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 04:25:00');
INSERT INTO `schedule_job_log` VALUES ('828', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 04:26:00');
INSERT INTO `schedule_job_log` VALUES ('829', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:27:00');
INSERT INTO `schedule_job_log` VALUES ('830', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:28:00');
INSERT INTO `schedule_job_log` VALUES ('831', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:29:00');
INSERT INTO `schedule_job_log` VALUES ('832', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('833', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:31:00');
INSERT INTO `schedule_job_log` VALUES ('834', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:32:00');
INSERT INTO `schedule_job_log` VALUES ('835', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:33:00');
INSERT INTO `schedule_job_log` VALUES ('836', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:34:00');
INSERT INTO `schedule_job_log` VALUES ('837', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 04:35:00');
INSERT INTO `schedule_job_log` VALUES ('838', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:36:00');
INSERT INTO `schedule_job_log` VALUES ('839', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:37:00');
INSERT INTO `schedule_job_log` VALUES ('840', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:38:00');
INSERT INTO `schedule_job_log` VALUES ('841', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:39:00');
INSERT INTO `schedule_job_log` VALUES ('842', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:40:00');
INSERT INTO `schedule_job_log` VALUES ('843', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 04:41:00');
INSERT INTO `schedule_job_log` VALUES ('844', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:42:00');
INSERT INTO `schedule_job_log` VALUES ('845', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:43:00');
INSERT INTO `schedule_job_log` VALUES ('846', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:44:00');
INSERT INTO `schedule_job_log` VALUES ('847', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 04:45:00');
INSERT INTO `schedule_job_log` VALUES ('848', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 04:46:00');
INSERT INTO `schedule_job_log` VALUES ('849', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:47:00');
INSERT INTO `schedule_job_log` VALUES ('850', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:48:00');
INSERT INTO `schedule_job_log` VALUES ('851', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:49:00');
INSERT INTO `schedule_job_log` VALUES ('852', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 04:50:00');
INSERT INTO `schedule_job_log` VALUES ('853', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 04:51:00');
INSERT INTO `schedule_job_log` VALUES ('854', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:52:00');
INSERT INTO `schedule_job_log` VALUES ('855', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:53:00');
INSERT INTO `schedule_job_log` VALUES ('856', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:54:00');
INSERT INTO `schedule_job_log` VALUES ('857', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:55:00');
INSERT INTO `schedule_job_log` VALUES ('858', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:56:00');
INSERT INTO `schedule_job_log` VALUES ('859', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:57:00');
INSERT INTO `schedule_job_log` VALUES ('860', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:58:00');
INSERT INTO `schedule_job_log` VALUES ('861', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 04:59:00');
INSERT INTO `schedule_job_log` VALUES ('862', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('863', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:01:00');
INSERT INTO `schedule_job_log` VALUES ('864', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:02:00');
INSERT INTO `schedule_job_log` VALUES ('865', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:03:00');
INSERT INTO `schedule_job_log` VALUES ('866', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:04:00');
INSERT INTO `schedule_job_log` VALUES ('867', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 05:05:00');
INSERT INTO `schedule_job_log` VALUES ('868', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 05:06:00');
INSERT INTO `schedule_job_log` VALUES ('869', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:07:00');
INSERT INTO `schedule_job_log` VALUES ('870', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:08:00');
INSERT INTO `schedule_job_log` VALUES ('871', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:09:00');
INSERT INTO `schedule_job_log` VALUES ('872', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 05:10:00');
INSERT INTO `schedule_job_log` VALUES ('873', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:11:00');
INSERT INTO `schedule_job_log` VALUES ('874', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:12:00');
INSERT INTO `schedule_job_log` VALUES ('875', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 05:13:00');
INSERT INTO `schedule_job_log` VALUES ('876', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:14:00');
INSERT INTO `schedule_job_log` VALUES ('877', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 05:15:00');
INSERT INTO `schedule_job_log` VALUES ('878', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:16:00');
INSERT INTO `schedule_job_log` VALUES ('879', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 05:17:00');
INSERT INTO `schedule_job_log` VALUES ('880', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:18:00');
INSERT INTO `schedule_job_log` VALUES ('881', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:19:00');
INSERT INTO `schedule_job_log` VALUES ('882', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:20:00');
INSERT INTO `schedule_job_log` VALUES ('883', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:21:00');
INSERT INTO `schedule_job_log` VALUES ('884', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:22:00');
INSERT INTO `schedule_job_log` VALUES ('885', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:23:00');
INSERT INTO `schedule_job_log` VALUES ('886', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:24:00');
INSERT INTO `schedule_job_log` VALUES ('887', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 05:25:00');
INSERT INTO `schedule_job_log` VALUES ('888', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:26:00');
INSERT INTO `schedule_job_log` VALUES ('889', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:27:00');
INSERT INTO `schedule_job_log` VALUES ('890', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:28:00');
INSERT INTO `schedule_job_log` VALUES ('891', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:29:00');
INSERT INTO `schedule_job_log` VALUES ('892', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('893', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:31:00');
INSERT INTO `schedule_job_log` VALUES ('894', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:32:00');
INSERT INTO `schedule_job_log` VALUES ('895', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:33:00');
INSERT INTO `schedule_job_log` VALUES ('896', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:34:00');
INSERT INTO `schedule_job_log` VALUES ('897', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:35:00');
INSERT INTO `schedule_job_log` VALUES ('898', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:36:00');
INSERT INTO `schedule_job_log` VALUES ('899', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:37:00');
INSERT INTO `schedule_job_log` VALUES ('900', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:38:00');
INSERT INTO `schedule_job_log` VALUES ('901', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:39:00');
INSERT INTO `schedule_job_log` VALUES ('902', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:40:00');
INSERT INTO `schedule_job_log` VALUES ('903', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:41:00');
INSERT INTO `schedule_job_log` VALUES ('904', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:42:00');
INSERT INTO `schedule_job_log` VALUES ('905', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:43:00');
INSERT INTO `schedule_job_log` VALUES ('906', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:44:00');
INSERT INTO `schedule_job_log` VALUES ('907', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:45:00');
INSERT INTO `schedule_job_log` VALUES ('908', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:46:00');
INSERT INTO `schedule_job_log` VALUES ('909', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 05:47:00');
INSERT INTO `schedule_job_log` VALUES ('910', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 05:48:00');
INSERT INTO `schedule_job_log` VALUES ('911', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:49:00');
INSERT INTO `schedule_job_log` VALUES ('912', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:50:00');
INSERT INTO `schedule_job_log` VALUES ('913', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 05:51:00');
INSERT INTO `schedule_job_log` VALUES ('914', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:52:00');
INSERT INTO `schedule_job_log` VALUES ('915', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:53:00');
INSERT INTO `schedule_job_log` VALUES ('916', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:54:00');
INSERT INTO `schedule_job_log` VALUES ('917', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:55:00');
INSERT INTO `schedule_job_log` VALUES ('918', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 05:56:00');
INSERT INTO `schedule_job_log` VALUES ('919', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 05:57:00');
INSERT INTO `schedule_job_log` VALUES ('920', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 05:58:00');
INSERT INTO `schedule_job_log` VALUES ('921', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 05:59:00');
INSERT INTO `schedule_job_log` VALUES ('922', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('923', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 06:01:00');
INSERT INTO `schedule_job_log` VALUES ('924', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:02:00');
INSERT INTO `schedule_job_log` VALUES ('925', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:03:00');
INSERT INTO `schedule_job_log` VALUES ('926', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 06:04:00');
INSERT INTO `schedule_job_log` VALUES ('927', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:05:00');
INSERT INTO `schedule_job_log` VALUES ('928', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:06:00');
INSERT INTO `schedule_job_log` VALUES ('929', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 06:07:00');
INSERT INTO `schedule_job_log` VALUES ('930', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:08:00');
INSERT INTO `schedule_job_log` VALUES ('931', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:09:00');
INSERT INTO `schedule_job_log` VALUES ('932', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 06:10:00');
INSERT INTO `schedule_job_log` VALUES ('933', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:11:00');
INSERT INTO `schedule_job_log` VALUES ('934', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:12:00');
INSERT INTO `schedule_job_log` VALUES ('935', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:13:00');
INSERT INTO `schedule_job_log` VALUES ('936', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:14:00');
INSERT INTO `schedule_job_log` VALUES ('937', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:15:00');
INSERT INTO `schedule_job_log` VALUES ('938', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:16:00');
INSERT INTO `schedule_job_log` VALUES ('939', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:17:00');
INSERT INTO `schedule_job_log` VALUES ('940', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:18:00');
INSERT INTO `schedule_job_log` VALUES ('941', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:19:00');
INSERT INTO `schedule_job_log` VALUES ('942', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:20:00');
INSERT INTO `schedule_job_log` VALUES ('943', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:21:00');
INSERT INTO `schedule_job_log` VALUES ('944', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:22:00');
INSERT INTO `schedule_job_log` VALUES ('945', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:23:00');
INSERT INTO `schedule_job_log` VALUES ('946', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:24:00');
INSERT INTO `schedule_job_log` VALUES ('947', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:25:00');
INSERT INTO `schedule_job_log` VALUES ('948', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 06:26:00');
INSERT INTO `schedule_job_log` VALUES ('949', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:27:00');
INSERT INTO `schedule_job_log` VALUES ('950', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:28:00');
INSERT INTO `schedule_job_log` VALUES ('951', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:29:00');
INSERT INTO `schedule_job_log` VALUES ('952', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('953', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 06:31:00');
INSERT INTO `schedule_job_log` VALUES ('954', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:32:00');
INSERT INTO `schedule_job_log` VALUES ('955', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:33:00');
INSERT INTO `schedule_job_log` VALUES ('956', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 06:34:00');
INSERT INTO `schedule_job_log` VALUES ('957', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 06:35:00');
INSERT INTO `schedule_job_log` VALUES ('958', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 06:36:00');
INSERT INTO `schedule_job_log` VALUES ('959', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 06:37:00');
INSERT INTO `schedule_job_log` VALUES ('960', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 06:38:00');
INSERT INTO `schedule_job_log` VALUES ('961', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 06:39:00');
INSERT INTO `schedule_job_log` VALUES ('962', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:40:00');
INSERT INTO `schedule_job_log` VALUES ('963', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:41:00');
INSERT INTO `schedule_job_log` VALUES ('964', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:42:00');
INSERT INTO `schedule_job_log` VALUES ('965', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:43:00');
INSERT INTO `schedule_job_log` VALUES ('966', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:44:00');
INSERT INTO `schedule_job_log` VALUES ('967', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:45:00');
INSERT INTO `schedule_job_log` VALUES ('968', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:46:00');
INSERT INTO `schedule_job_log` VALUES ('969', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:47:00');
INSERT INTO `schedule_job_log` VALUES ('970', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:48:00');
INSERT INTO `schedule_job_log` VALUES ('971', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:49:00');
INSERT INTO `schedule_job_log` VALUES ('972', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 06:50:00');
INSERT INTO `schedule_job_log` VALUES ('973', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:51:00');
INSERT INTO `schedule_job_log` VALUES ('974', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:52:00');
INSERT INTO `schedule_job_log` VALUES ('975', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:53:00');
INSERT INTO `schedule_job_log` VALUES ('976', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:54:00');
INSERT INTO `schedule_job_log` VALUES ('977', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:55:00');
INSERT INTO `schedule_job_log` VALUES ('978', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:56:00');
INSERT INTO `schedule_job_log` VALUES ('979', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 06:57:00');
INSERT INTO `schedule_job_log` VALUES ('980', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:58:00');
INSERT INTO `schedule_job_log` VALUES ('981', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 06:59:00');
INSERT INTO `schedule_job_log` VALUES ('982', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('983', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:01:00');
INSERT INTO `schedule_job_log` VALUES ('984', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 07:02:00');
INSERT INTO `schedule_job_log` VALUES ('985', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:03:00');
INSERT INTO `schedule_job_log` VALUES ('986', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:04:00');
INSERT INTO `schedule_job_log` VALUES ('987', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:05:00');
INSERT INTO `schedule_job_log` VALUES ('988', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:06:00');
INSERT INTO `schedule_job_log` VALUES ('989', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:07:00');
INSERT INTO `schedule_job_log` VALUES ('990', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:08:00');
INSERT INTO `schedule_job_log` VALUES ('991', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:09:00');
INSERT INTO `schedule_job_log` VALUES ('992', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:10:00');
INSERT INTO `schedule_job_log` VALUES ('993', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:11:00');
INSERT INTO `schedule_job_log` VALUES ('994', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:12:00');
INSERT INTO `schedule_job_log` VALUES ('995', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:13:00');
INSERT INTO `schedule_job_log` VALUES ('996', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 07:14:00');
INSERT INTO `schedule_job_log` VALUES ('997', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:15:00');
INSERT INTO `schedule_job_log` VALUES ('998', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:16:00');
INSERT INTO `schedule_job_log` VALUES ('999', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:17:00');
INSERT INTO `schedule_job_log` VALUES ('1000', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:18:00');
INSERT INTO `schedule_job_log` VALUES ('1001', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:19:00');
INSERT INTO `schedule_job_log` VALUES ('1002', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:20:00');
INSERT INTO `schedule_job_log` VALUES ('1003', '6', 'testTask', 'test', '简单测试', '0', null, '1006', '2018-01-16 07:21:00');
INSERT INTO `schedule_job_log` VALUES ('1004', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:22:00');
INSERT INTO `schedule_job_log` VALUES ('1005', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:23:00');
INSERT INTO `schedule_job_log` VALUES ('1006', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:24:00');
INSERT INTO `schedule_job_log` VALUES ('1007', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:25:00');
INSERT INTO `schedule_job_log` VALUES ('1008', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:26:00');
INSERT INTO `schedule_job_log` VALUES ('1009', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:27:00');
INSERT INTO `schedule_job_log` VALUES ('1010', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:28:00');
INSERT INTO `schedule_job_log` VALUES ('1011', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:29:00');
INSERT INTO `schedule_job_log` VALUES ('1012', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('1013', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:31:00');
INSERT INTO `schedule_job_log` VALUES ('1014', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:32:00');
INSERT INTO `schedule_job_log` VALUES ('1015', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:33:00');
INSERT INTO `schedule_job_log` VALUES ('1016', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:34:00');
INSERT INTO `schedule_job_log` VALUES ('1017', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:35:00');
INSERT INTO `schedule_job_log` VALUES ('1018', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:36:00');
INSERT INTO `schedule_job_log` VALUES ('1019', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:37:00');
INSERT INTO `schedule_job_log` VALUES ('1020', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:38:00');
INSERT INTO `schedule_job_log` VALUES ('1021', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:39:00');
INSERT INTO `schedule_job_log` VALUES ('1022', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:40:00');
INSERT INTO `schedule_job_log` VALUES ('1023', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:41:00');
INSERT INTO `schedule_job_log` VALUES ('1024', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:42:00');
INSERT INTO `schedule_job_log` VALUES ('1025', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:43:00');
INSERT INTO `schedule_job_log` VALUES ('1026', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:44:00');
INSERT INTO `schedule_job_log` VALUES ('1027', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:45:00');
INSERT INTO `schedule_job_log` VALUES ('1028', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:46:00');
INSERT INTO `schedule_job_log` VALUES ('1029', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:47:00');
INSERT INTO `schedule_job_log` VALUES ('1030', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:48:00');
INSERT INTO `schedule_job_log` VALUES ('1031', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:49:00');
INSERT INTO `schedule_job_log` VALUES ('1032', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:50:00');
INSERT INTO `schedule_job_log` VALUES ('1033', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:51:00');
INSERT INTO `schedule_job_log` VALUES ('1034', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:52:00');
INSERT INTO `schedule_job_log` VALUES ('1035', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:53:00');
INSERT INTO `schedule_job_log` VALUES ('1036', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:54:00');
INSERT INTO `schedule_job_log` VALUES ('1037', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:55:00');
INSERT INTO `schedule_job_log` VALUES ('1038', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:56:00');
INSERT INTO `schedule_job_log` VALUES ('1039', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 07:57:00');
INSERT INTO `schedule_job_log` VALUES ('1040', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:58:00');
INSERT INTO `schedule_job_log` VALUES ('1041', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 07:59:00');
INSERT INTO `schedule_job_log` VALUES ('1042', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('1043', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:01:00');
INSERT INTO `schedule_job_log` VALUES ('1044', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 08:02:00');
INSERT INTO `schedule_job_log` VALUES ('1045', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 08:03:00');
INSERT INTO `schedule_job_log` VALUES ('1046', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 08:04:00');
INSERT INTO `schedule_job_log` VALUES ('1047', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:05:00');
INSERT INTO `schedule_job_log` VALUES ('1048', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 08:06:00');
INSERT INTO `schedule_job_log` VALUES ('1049', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:07:00');
INSERT INTO `schedule_job_log` VALUES ('1050', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:08:00');
INSERT INTO `schedule_job_log` VALUES ('1051', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:09:00');
INSERT INTO `schedule_job_log` VALUES ('1052', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 08:10:00');
INSERT INTO `schedule_job_log` VALUES ('1053', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:11:00');
INSERT INTO `schedule_job_log` VALUES ('1054', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:12:00');
INSERT INTO `schedule_job_log` VALUES ('1055', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 08:13:00');
INSERT INTO `schedule_job_log` VALUES ('1056', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 08:14:00');
INSERT INTO `schedule_job_log` VALUES ('1057', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:15:00');
INSERT INTO `schedule_job_log` VALUES ('1058', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:16:00');
INSERT INTO `schedule_job_log` VALUES ('1059', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 08:17:00');
INSERT INTO `schedule_job_log` VALUES ('1060', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:18:00');
INSERT INTO `schedule_job_log` VALUES ('1061', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:19:00');
INSERT INTO `schedule_job_log` VALUES ('1062', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:20:00');
INSERT INTO `schedule_job_log` VALUES ('1063', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:21:00');
INSERT INTO `schedule_job_log` VALUES ('1064', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 08:22:00');
INSERT INTO `schedule_job_log` VALUES ('1065', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:23:00');
INSERT INTO `schedule_job_log` VALUES ('1066', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 08:24:00');
INSERT INTO `schedule_job_log` VALUES ('1067', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 08:25:00');
INSERT INTO `schedule_job_log` VALUES ('1068', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 08:26:00');
INSERT INTO `schedule_job_log` VALUES ('1069', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:27:00');
INSERT INTO `schedule_job_log` VALUES ('1070', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:28:00');
INSERT INTO `schedule_job_log` VALUES ('1071', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:29:00');
INSERT INTO `schedule_job_log` VALUES ('1072', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('1073', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 08:31:00');
INSERT INTO `schedule_job_log` VALUES ('1074', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:32:00');
INSERT INTO `schedule_job_log` VALUES ('1075', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:33:00');
INSERT INTO `schedule_job_log` VALUES ('1076', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:34:00');
INSERT INTO `schedule_job_log` VALUES ('1077', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:35:00');
INSERT INTO `schedule_job_log` VALUES ('1078', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:36:00');
INSERT INTO `schedule_job_log` VALUES ('1079', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 08:37:00');
INSERT INTO `schedule_job_log` VALUES ('1080', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:38:00');
INSERT INTO `schedule_job_log` VALUES ('1081', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:39:00');
INSERT INTO `schedule_job_log` VALUES ('1082', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:40:00');
INSERT INTO `schedule_job_log` VALUES ('1083', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:41:00');
INSERT INTO `schedule_job_log` VALUES ('1084', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:42:00');
INSERT INTO `schedule_job_log` VALUES ('1085', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:43:00');
INSERT INTO `schedule_job_log` VALUES ('1086', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 08:44:00');
INSERT INTO `schedule_job_log` VALUES ('1087', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:45:00');
INSERT INTO `schedule_job_log` VALUES ('1088', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 08:46:00');
INSERT INTO `schedule_job_log` VALUES ('1089', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 08:47:00');
INSERT INTO `schedule_job_log` VALUES ('1090', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:48:00');
INSERT INTO `schedule_job_log` VALUES ('1091', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:49:00');
INSERT INTO `schedule_job_log` VALUES ('1092', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 08:50:00');
INSERT INTO `schedule_job_log` VALUES ('1093', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 08:51:00');
INSERT INTO `schedule_job_log` VALUES ('1094', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:52:00');
INSERT INTO `schedule_job_log` VALUES ('1095', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 08:53:00');
INSERT INTO `schedule_job_log` VALUES ('1096', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 08:54:00');
INSERT INTO `schedule_job_log` VALUES ('1097', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:55:00');
INSERT INTO `schedule_job_log` VALUES ('1098', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:56:00');
INSERT INTO `schedule_job_log` VALUES ('1099', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 08:57:00');
INSERT INTO `schedule_job_log` VALUES ('1100', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:58:00');
INSERT INTO `schedule_job_log` VALUES ('1101', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 08:59:00');
INSERT INTO `schedule_job_log` VALUES ('1102', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('1103', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:01:00');
INSERT INTO `schedule_job_log` VALUES ('1104', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:02:00');
INSERT INTO `schedule_job_log` VALUES ('1105', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:03:00');
INSERT INTO `schedule_job_log` VALUES ('1106', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:04:00');
INSERT INTO `schedule_job_log` VALUES ('1107', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:05:00');
INSERT INTO `schedule_job_log` VALUES ('1108', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:06:00');
INSERT INTO `schedule_job_log` VALUES ('1109', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:07:00');
INSERT INTO `schedule_job_log` VALUES ('1110', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:08:00');
INSERT INTO `schedule_job_log` VALUES ('1111', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:09:00');
INSERT INTO `schedule_job_log` VALUES ('1112', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:10:00');
INSERT INTO `schedule_job_log` VALUES ('1113', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:11:00');
INSERT INTO `schedule_job_log` VALUES ('1114', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:12:00');
INSERT INTO `schedule_job_log` VALUES ('1115', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:13:00');
INSERT INTO `schedule_job_log` VALUES ('1116', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:14:00');
INSERT INTO `schedule_job_log` VALUES ('1117', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:15:00');
INSERT INTO `schedule_job_log` VALUES ('1118', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:16:00');
INSERT INTO `schedule_job_log` VALUES ('1119', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:17:00');
INSERT INTO `schedule_job_log` VALUES ('1120', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:18:00');
INSERT INTO `schedule_job_log` VALUES ('1121', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:19:00');
INSERT INTO `schedule_job_log` VALUES ('1122', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:20:00');
INSERT INTO `schedule_job_log` VALUES ('1123', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:21:00');
INSERT INTO `schedule_job_log` VALUES ('1124', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:22:00');
INSERT INTO `schedule_job_log` VALUES ('1125', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:23:00');
INSERT INTO `schedule_job_log` VALUES ('1126', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:24:00');
INSERT INTO `schedule_job_log` VALUES ('1127', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:25:00');
INSERT INTO `schedule_job_log` VALUES ('1128', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:26:00');
INSERT INTO `schedule_job_log` VALUES ('1129', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:27:00');
INSERT INTO `schedule_job_log` VALUES ('1130', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:28:00');
INSERT INTO `schedule_job_log` VALUES ('1131', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:29:00');
INSERT INTO `schedule_job_log` VALUES ('1132', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('1133', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:31:00');
INSERT INTO `schedule_job_log` VALUES ('1134', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:32:00');
INSERT INTO `schedule_job_log` VALUES ('1135', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:33:00');
INSERT INTO `schedule_job_log` VALUES ('1136', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:34:00');
INSERT INTO `schedule_job_log` VALUES ('1137', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:35:00');
INSERT INTO `schedule_job_log` VALUES ('1138', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:36:00');
INSERT INTO `schedule_job_log` VALUES ('1139', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:37:00');
INSERT INTO `schedule_job_log` VALUES ('1140', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:38:00');
INSERT INTO `schedule_job_log` VALUES ('1141', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:39:00');
INSERT INTO `schedule_job_log` VALUES ('1142', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:40:00');
INSERT INTO `schedule_job_log` VALUES ('1143', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 09:41:00');
INSERT INTO `schedule_job_log` VALUES ('1144', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:42:00');
INSERT INTO `schedule_job_log` VALUES ('1145', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:43:00');
INSERT INTO `schedule_job_log` VALUES ('1146', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:44:00');
INSERT INTO `schedule_job_log` VALUES ('1147', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:45:00');
INSERT INTO `schedule_job_log` VALUES ('1148', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:46:00');
INSERT INTO `schedule_job_log` VALUES ('1149', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:47:00');
INSERT INTO `schedule_job_log` VALUES ('1150', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:48:00');
INSERT INTO `schedule_job_log` VALUES ('1151', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:49:00');
INSERT INTO `schedule_job_log` VALUES ('1152', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:50:00');
INSERT INTO `schedule_job_log` VALUES ('1153', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:51:00');
INSERT INTO `schedule_job_log` VALUES ('1154', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:52:00');
INSERT INTO `schedule_job_log` VALUES ('1155', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:53:00');
INSERT INTO `schedule_job_log` VALUES ('1156', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:54:00');
INSERT INTO `schedule_job_log` VALUES ('1157', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:55:00');
INSERT INTO `schedule_job_log` VALUES ('1158', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:56:00');
INSERT INTO `schedule_job_log` VALUES ('1159', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:57:00');
INSERT INTO `schedule_job_log` VALUES ('1160', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 09:58:00');
INSERT INTO `schedule_job_log` VALUES ('1161', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 09:59:00');
INSERT INTO `schedule_job_log` VALUES ('1162', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('1163', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:01:00');
INSERT INTO `schedule_job_log` VALUES ('1164', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:02:00');
INSERT INTO `schedule_job_log` VALUES ('1165', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:03:00');
INSERT INTO `schedule_job_log` VALUES ('1166', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:04:00');
INSERT INTO `schedule_job_log` VALUES ('1167', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:05:00');
INSERT INTO `schedule_job_log` VALUES ('1168', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:06:00');
INSERT INTO `schedule_job_log` VALUES ('1169', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:07:00');
INSERT INTO `schedule_job_log` VALUES ('1170', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:08:00');
INSERT INTO `schedule_job_log` VALUES ('1171', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:09:00');
INSERT INTO `schedule_job_log` VALUES ('1172', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 10:10:00');
INSERT INTO `schedule_job_log` VALUES ('1173', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:11:00');
INSERT INTO `schedule_job_log` VALUES ('1174', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:12:00');
INSERT INTO `schedule_job_log` VALUES ('1175', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:13:00');
INSERT INTO `schedule_job_log` VALUES ('1176', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:14:00');
INSERT INTO `schedule_job_log` VALUES ('1177', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:15:00');
INSERT INTO `schedule_job_log` VALUES ('1178', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:16:00');
INSERT INTO `schedule_job_log` VALUES ('1179', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:17:00');
INSERT INTO `schedule_job_log` VALUES ('1180', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 10:18:00');
INSERT INTO `schedule_job_log` VALUES ('1181', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:19:00');
INSERT INTO `schedule_job_log` VALUES ('1182', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:20:00');
INSERT INTO `schedule_job_log` VALUES ('1183', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 10:21:00');
INSERT INTO `schedule_job_log` VALUES ('1184', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:22:00');
INSERT INTO `schedule_job_log` VALUES ('1185', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:23:00');
INSERT INTO `schedule_job_log` VALUES ('1186', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:24:00');
INSERT INTO `schedule_job_log` VALUES ('1187', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 10:25:00');
INSERT INTO `schedule_job_log` VALUES ('1188', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 10:26:00');
INSERT INTO `schedule_job_log` VALUES ('1189', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:27:00');
INSERT INTO `schedule_job_log` VALUES ('1190', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:28:00');
INSERT INTO `schedule_job_log` VALUES ('1191', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:29:00');
INSERT INTO `schedule_job_log` VALUES ('1192', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('1193', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:31:00');
INSERT INTO `schedule_job_log` VALUES ('1194', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 10:32:00');
INSERT INTO `schedule_job_log` VALUES ('1195', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:33:00');
INSERT INTO `schedule_job_log` VALUES ('1196', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:34:00');
INSERT INTO `schedule_job_log` VALUES ('1197', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:35:00');
INSERT INTO `schedule_job_log` VALUES ('1198', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:36:00');
INSERT INTO `schedule_job_log` VALUES ('1199', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:37:00');
INSERT INTO `schedule_job_log` VALUES ('1200', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:38:00');
INSERT INTO `schedule_job_log` VALUES ('1201', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:39:00');
INSERT INTO `schedule_job_log` VALUES ('1202', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:40:00');
INSERT INTO `schedule_job_log` VALUES ('1203', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:41:00');
INSERT INTO `schedule_job_log` VALUES ('1204', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 10:42:00');
INSERT INTO `schedule_job_log` VALUES ('1205', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:43:00');
INSERT INTO `schedule_job_log` VALUES ('1206', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:44:00');
INSERT INTO `schedule_job_log` VALUES ('1207', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:45:00');
INSERT INTO `schedule_job_log` VALUES ('1208', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:46:00');
INSERT INTO `schedule_job_log` VALUES ('1209', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:47:00');
INSERT INTO `schedule_job_log` VALUES ('1210', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:48:00');
INSERT INTO `schedule_job_log` VALUES ('1211', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:49:00');
INSERT INTO `schedule_job_log` VALUES ('1212', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:50:00');
INSERT INTO `schedule_job_log` VALUES ('1213', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:51:00');
INSERT INTO `schedule_job_log` VALUES ('1214', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:52:00');
INSERT INTO `schedule_job_log` VALUES ('1215', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:53:00');
INSERT INTO `schedule_job_log` VALUES ('1216', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:54:00');
INSERT INTO `schedule_job_log` VALUES ('1217', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:55:00');
INSERT INTO `schedule_job_log` VALUES ('1218', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:56:00');
INSERT INTO `schedule_job_log` VALUES ('1219', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:57:00');
INSERT INTO `schedule_job_log` VALUES ('1220', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 10:58:00');
INSERT INTO `schedule_job_log` VALUES ('1221', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 10:59:00');
INSERT INTO `schedule_job_log` VALUES ('1222', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1223', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 11:01:00');
INSERT INTO `schedule_job_log` VALUES ('1224', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:02:00');
INSERT INTO `schedule_job_log` VALUES ('1225', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 11:03:00');
INSERT INTO `schedule_job_log` VALUES ('1226', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:04:00');
INSERT INTO `schedule_job_log` VALUES ('1227', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:05:00');
INSERT INTO `schedule_job_log` VALUES ('1228', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:06:00');
INSERT INTO `schedule_job_log` VALUES ('1229', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 11:07:00');
INSERT INTO `schedule_job_log` VALUES ('1230', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:08:00');
INSERT INTO `schedule_job_log` VALUES ('1231', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 11:09:00');
INSERT INTO `schedule_job_log` VALUES ('1232', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:10:00');
INSERT INTO `schedule_job_log` VALUES ('1233', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 11:11:00');
INSERT INTO `schedule_job_log` VALUES ('1234', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:12:00');
INSERT INTO `schedule_job_log` VALUES ('1235', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:13:00');
INSERT INTO `schedule_job_log` VALUES ('1236', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:14:00');
INSERT INTO `schedule_job_log` VALUES ('1237', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 11:15:00');
INSERT INTO `schedule_job_log` VALUES ('1238', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:16:00');
INSERT INTO `schedule_job_log` VALUES ('1239', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:17:00');
INSERT INTO `schedule_job_log` VALUES ('1240', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:18:00');
INSERT INTO `schedule_job_log` VALUES ('1241', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:19:00');
INSERT INTO `schedule_job_log` VALUES ('1242', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:20:00');
INSERT INTO `schedule_job_log` VALUES ('1243', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:21:00');
INSERT INTO `schedule_job_log` VALUES ('1244', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:22:00');
INSERT INTO `schedule_job_log` VALUES ('1245', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 11:23:00');
INSERT INTO `schedule_job_log` VALUES ('1246', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:24:00');
INSERT INTO `schedule_job_log` VALUES ('1247', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:25:00');
INSERT INTO `schedule_job_log` VALUES ('1248', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 11:26:00');
INSERT INTO `schedule_job_log` VALUES ('1249', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 11:27:00');
INSERT INTO `schedule_job_log` VALUES ('1250', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:28:00');
INSERT INTO `schedule_job_log` VALUES ('1251', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 11:29:00');
INSERT INTO `schedule_job_log` VALUES ('1252', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1253', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:31:00');
INSERT INTO `schedule_job_log` VALUES ('1254', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:32:00');
INSERT INTO `schedule_job_log` VALUES ('1255', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 11:33:00');
INSERT INTO `schedule_job_log` VALUES ('1256', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:34:00');
INSERT INTO `schedule_job_log` VALUES ('1257', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:35:00');
INSERT INTO `schedule_job_log` VALUES ('1258', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 11:36:00');
INSERT INTO `schedule_job_log` VALUES ('1259', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:37:00');
INSERT INTO `schedule_job_log` VALUES ('1260', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:38:00');
INSERT INTO `schedule_job_log` VALUES ('1261', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:39:00');
INSERT INTO `schedule_job_log` VALUES ('1262', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 11:40:00');
INSERT INTO `schedule_job_log` VALUES ('1263', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 11:41:00');
INSERT INTO `schedule_job_log` VALUES ('1264', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:42:00');
INSERT INTO `schedule_job_log` VALUES ('1265', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:43:00');
INSERT INTO `schedule_job_log` VALUES ('1266', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:44:00');
INSERT INTO `schedule_job_log` VALUES ('1267', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:45:00');
INSERT INTO `schedule_job_log` VALUES ('1268', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:46:00');
INSERT INTO `schedule_job_log` VALUES ('1269', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 11:47:00');
INSERT INTO `schedule_job_log` VALUES ('1270', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:48:00');
INSERT INTO `schedule_job_log` VALUES ('1271', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:49:00');
INSERT INTO `schedule_job_log` VALUES ('1272', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:50:00');
INSERT INTO `schedule_job_log` VALUES ('1273', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 11:51:00');
INSERT INTO `schedule_job_log` VALUES ('1274', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:52:00');
INSERT INTO `schedule_job_log` VALUES ('1275', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 11:53:00');
INSERT INTO `schedule_job_log` VALUES ('1276', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 11:54:00');
INSERT INTO `schedule_job_log` VALUES ('1277', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:55:00');
INSERT INTO `schedule_job_log` VALUES ('1278', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:56:00');
INSERT INTO `schedule_job_log` VALUES ('1279', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:57:00');
INSERT INTO `schedule_job_log` VALUES ('1280', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:58:00');
INSERT INTO `schedule_job_log` VALUES ('1281', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 11:59:00');
INSERT INTO `schedule_job_log` VALUES ('1282', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1283', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:01:00');
INSERT INTO `schedule_job_log` VALUES ('1284', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:02:00');
INSERT INTO `schedule_job_log` VALUES ('1285', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 12:03:00');
INSERT INTO `schedule_job_log` VALUES ('1286', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:04:00');
INSERT INTO `schedule_job_log` VALUES ('1287', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:05:00');
INSERT INTO `schedule_job_log` VALUES ('1288', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:06:00');
INSERT INTO `schedule_job_log` VALUES ('1289', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:07:00');
INSERT INTO `schedule_job_log` VALUES ('1290', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:08:00');
INSERT INTO `schedule_job_log` VALUES ('1291', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:09:00');
INSERT INTO `schedule_job_log` VALUES ('1292', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 12:10:00');
INSERT INTO `schedule_job_log` VALUES ('1293', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:11:00');
INSERT INTO `schedule_job_log` VALUES ('1294', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:12:00');
INSERT INTO `schedule_job_log` VALUES ('1295', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:13:00');
INSERT INTO `schedule_job_log` VALUES ('1296', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:14:00');
INSERT INTO `schedule_job_log` VALUES ('1297', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:15:00');
INSERT INTO `schedule_job_log` VALUES ('1298', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:16:00');
INSERT INTO `schedule_job_log` VALUES ('1299', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:17:00');
INSERT INTO `schedule_job_log` VALUES ('1300', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:18:00');
INSERT INTO `schedule_job_log` VALUES ('1301', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:19:00');
INSERT INTO `schedule_job_log` VALUES ('1302', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:20:00');
INSERT INTO `schedule_job_log` VALUES ('1303', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 12:21:00');
INSERT INTO `schedule_job_log` VALUES ('1304', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:22:00');
INSERT INTO `schedule_job_log` VALUES ('1305', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:23:00');
INSERT INTO `schedule_job_log` VALUES ('1306', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:24:00');
INSERT INTO `schedule_job_log` VALUES ('1307', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:25:00');
INSERT INTO `schedule_job_log` VALUES ('1308', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:26:00');
INSERT INTO `schedule_job_log` VALUES ('1309', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:27:00');
INSERT INTO `schedule_job_log` VALUES ('1310', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:28:00');
INSERT INTO `schedule_job_log` VALUES ('1311', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:29:00');
INSERT INTO `schedule_job_log` VALUES ('1312', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1313', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:31:00');
INSERT INTO `schedule_job_log` VALUES ('1314', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:32:00');
INSERT INTO `schedule_job_log` VALUES ('1315', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:33:00');
INSERT INTO `schedule_job_log` VALUES ('1316', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:34:00');
INSERT INTO `schedule_job_log` VALUES ('1317', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:35:00');
INSERT INTO `schedule_job_log` VALUES ('1318', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:36:00');
INSERT INTO `schedule_job_log` VALUES ('1319', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 12:37:00');
INSERT INTO `schedule_job_log` VALUES ('1320', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:38:00');
INSERT INTO `schedule_job_log` VALUES ('1321', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:39:00');
INSERT INTO `schedule_job_log` VALUES ('1322', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:40:00');
INSERT INTO `schedule_job_log` VALUES ('1323', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:41:00');
INSERT INTO `schedule_job_log` VALUES ('1324', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:42:00');
INSERT INTO `schedule_job_log` VALUES ('1325', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:43:00');
INSERT INTO `schedule_job_log` VALUES ('1326', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:44:00');
INSERT INTO `schedule_job_log` VALUES ('1327', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:45:00');
INSERT INTO `schedule_job_log` VALUES ('1328', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:46:00');
INSERT INTO `schedule_job_log` VALUES ('1329', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:47:00');
INSERT INTO `schedule_job_log` VALUES ('1330', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:48:00');
INSERT INTO `schedule_job_log` VALUES ('1331', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:49:00');
INSERT INTO `schedule_job_log` VALUES ('1332', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:50:00');
INSERT INTO `schedule_job_log` VALUES ('1333', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:51:00');
INSERT INTO `schedule_job_log` VALUES ('1334', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:52:00');
INSERT INTO `schedule_job_log` VALUES ('1335', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:53:00');
INSERT INTO `schedule_job_log` VALUES ('1336', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:54:00');
INSERT INTO `schedule_job_log` VALUES ('1337', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:55:00');
INSERT INTO `schedule_job_log` VALUES ('1338', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:56:00');
INSERT INTO `schedule_job_log` VALUES ('1339', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:57:00');
INSERT INTO `schedule_job_log` VALUES ('1340', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 12:58:00');
INSERT INTO `schedule_job_log` VALUES ('1341', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 12:59:00');
INSERT INTO `schedule_job_log` VALUES ('1342', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1343', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:01:00');
INSERT INTO `schedule_job_log` VALUES ('1344', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:02:00');
INSERT INTO `schedule_job_log` VALUES ('1345', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:03:00');
INSERT INTO `schedule_job_log` VALUES ('1346', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:04:00');
INSERT INTO `schedule_job_log` VALUES ('1347', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:05:00');
INSERT INTO `schedule_job_log` VALUES ('1348', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:06:00');
INSERT INTO `schedule_job_log` VALUES ('1349', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:07:00');
INSERT INTO `schedule_job_log` VALUES ('1350', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:08:00');
INSERT INTO `schedule_job_log` VALUES ('1351', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:09:00');
INSERT INTO `schedule_job_log` VALUES ('1352', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 13:10:00');
INSERT INTO `schedule_job_log` VALUES ('1353', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:11:00');
INSERT INTO `schedule_job_log` VALUES ('1354', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:12:00');
INSERT INTO `schedule_job_log` VALUES ('1355', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:13:00');
INSERT INTO `schedule_job_log` VALUES ('1356', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 13:14:00');
INSERT INTO `schedule_job_log` VALUES ('1357', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:15:00');
INSERT INTO `schedule_job_log` VALUES ('1358', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:16:00');
INSERT INTO `schedule_job_log` VALUES ('1359', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:17:00');
INSERT INTO `schedule_job_log` VALUES ('1360', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:18:00');
INSERT INTO `schedule_job_log` VALUES ('1361', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:19:00');
INSERT INTO `schedule_job_log` VALUES ('1362', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:20:00');
INSERT INTO `schedule_job_log` VALUES ('1363', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 13:21:00');
INSERT INTO `schedule_job_log` VALUES ('1364', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:22:00');
INSERT INTO `schedule_job_log` VALUES ('1365', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:23:00');
INSERT INTO `schedule_job_log` VALUES ('1366', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:24:00');
INSERT INTO `schedule_job_log` VALUES ('1367', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:25:00');
INSERT INTO `schedule_job_log` VALUES ('1368', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:26:00');
INSERT INTO `schedule_job_log` VALUES ('1369', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:27:00');
INSERT INTO `schedule_job_log` VALUES ('1370', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:28:00');
INSERT INTO `schedule_job_log` VALUES ('1371', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:29:00');
INSERT INTO `schedule_job_log` VALUES ('1372', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1373', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:31:00');
INSERT INTO `schedule_job_log` VALUES ('1374', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:32:00');
INSERT INTO `schedule_job_log` VALUES ('1375', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:33:00');
INSERT INTO `schedule_job_log` VALUES ('1376', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:34:00');
INSERT INTO `schedule_job_log` VALUES ('1377', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:35:00');
INSERT INTO `schedule_job_log` VALUES ('1378', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:36:00');
INSERT INTO `schedule_job_log` VALUES ('1379', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:37:00');
INSERT INTO `schedule_job_log` VALUES ('1380', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:38:00');
INSERT INTO `schedule_job_log` VALUES ('1381', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:39:00');
INSERT INTO `schedule_job_log` VALUES ('1382', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:40:00');
INSERT INTO `schedule_job_log` VALUES ('1383', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:41:00');
INSERT INTO `schedule_job_log` VALUES ('1384', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:42:00');
INSERT INTO `schedule_job_log` VALUES ('1385', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:43:00');
INSERT INTO `schedule_job_log` VALUES ('1386', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:44:00');
INSERT INTO `schedule_job_log` VALUES ('1387', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:45:00');
INSERT INTO `schedule_job_log` VALUES ('1388', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:46:00');
INSERT INTO `schedule_job_log` VALUES ('1389', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:47:00');
INSERT INTO `schedule_job_log` VALUES ('1390', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:48:00');
INSERT INTO `schedule_job_log` VALUES ('1391', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:49:00');
INSERT INTO `schedule_job_log` VALUES ('1392', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:50:00');
INSERT INTO `schedule_job_log` VALUES ('1393', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:51:00');
INSERT INTO `schedule_job_log` VALUES ('1394', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:52:00');
INSERT INTO `schedule_job_log` VALUES ('1395', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:53:00');
INSERT INTO `schedule_job_log` VALUES ('1396', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:54:00');
INSERT INTO `schedule_job_log` VALUES ('1397', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:55:00');
INSERT INTO `schedule_job_log` VALUES ('1398', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:56:00');
INSERT INTO `schedule_job_log` VALUES ('1399', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 13:57:00');
INSERT INTO `schedule_job_log` VALUES ('1400', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 13:58:00');
INSERT INTO `schedule_job_log` VALUES ('1401', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 13:59:00');
INSERT INTO `schedule_job_log` VALUES ('1402', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1403', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('1404', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('1405', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('1406', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('1407', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('1408', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:06:00');
INSERT INTO `schedule_job_log` VALUES ('1409', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:07:00');
INSERT INTO `schedule_job_log` VALUES ('1410', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:08:00');
INSERT INTO `schedule_job_log` VALUES ('1411', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:09:00');
INSERT INTO `schedule_job_log` VALUES ('1412', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:10:00');
INSERT INTO `schedule_job_log` VALUES ('1413', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:11:00');
INSERT INTO `schedule_job_log` VALUES ('1414', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:12:00');
INSERT INTO `schedule_job_log` VALUES ('1415', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:13:00');
INSERT INTO `schedule_job_log` VALUES ('1416', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:14:00');
INSERT INTO `schedule_job_log` VALUES ('1417', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:15:00');
INSERT INTO `schedule_job_log` VALUES ('1418', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:16:00');
INSERT INTO `schedule_job_log` VALUES ('1419', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:17:00');
INSERT INTO `schedule_job_log` VALUES ('1420', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:18:00');
INSERT INTO `schedule_job_log` VALUES ('1421', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:19:00');
INSERT INTO `schedule_job_log` VALUES ('1422', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:20:00');
INSERT INTO `schedule_job_log` VALUES ('1423', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:21:00');
INSERT INTO `schedule_job_log` VALUES ('1424', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:22:00');
INSERT INTO `schedule_job_log` VALUES ('1425', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:23:00');
INSERT INTO `schedule_job_log` VALUES ('1426', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:24:00');
INSERT INTO `schedule_job_log` VALUES ('1427', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:25:00');
INSERT INTO `schedule_job_log` VALUES ('1428', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:26:00');
INSERT INTO `schedule_job_log` VALUES ('1429', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:27:00');
INSERT INTO `schedule_job_log` VALUES ('1430', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:28:00');
INSERT INTO `schedule_job_log` VALUES ('1431', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:29:00');
INSERT INTO `schedule_job_log` VALUES ('1432', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1433', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:31:00');
INSERT INTO `schedule_job_log` VALUES ('1434', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:32:00');
INSERT INTO `schedule_job_log` VALUES ('1435', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:33:00');
INSERT INTO `schedule_job_log` VALUES ('1436', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:34:00');
INSERT INTO `schedule_job_log` VALUES ('1437', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:35:00');
INSERT INTO `schedule_job_log` VALUES ('1438', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:36:00');
INSERT INTO `schedule_job_log` VALUES ('1439', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:37:00');
INSERT INTO `schedule_job_log` VALUES ('1440', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:38:00');
INSERT INTO `schedule_job_log` VALUES ('1441', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:39:00');
INSERT INTO `schedule_job_log` VALUES ('1442', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:40:00');
INSERT INTO `schedule_job_log` VALUES ('1443', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:41:00');
INSERT INTO `schedule_job_log` VALUES ('1444', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:42:00');
INSERT INTO `schedule_job_log` VALUES ('1445', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:43:00');
INSERT INTO `schedule_job_log` VALUES ('1446', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:44:00');
INSERT INTO `schedule_job_log` VALUES ('1447', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:45:00');
INSERT INTO `schedule_job_log` VALUES ('1448', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:46:00');
INSERT INTO `schedule_job_log` VALUES ('1449', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:47:00');
INSERT INTO `schedule_job_log` VALUES ('1450', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:48:00');
INSERT INTO `schedule_job_log` VALUES ('1451', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 14:49:00');
INSERT INTO `schedule_job_log` VALUES ('1452', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:50:00');
INSERT INTO `schedule_job_log` VALUES ('1453', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:51:00');
INSERT INTO `schedule_job_log` VALUES ('1454', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:52:00');
INSERT INTO `schedule_job_log` VALUES ('1455', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:53:00');
INSERT INTO `schedule_job_log` VALUES ('1456', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 14:54:00');
INSERT INTO `schedule_job_log` VALUES ('1457', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:55:00');
INSERT INTO `schedule_job_log` VALUES ('1458', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:56:00');
INSERT INTO `schedule_job_log` VALUES ('1459', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:57:00');
INSERT INTO `schedule_job_log` VALUES ('1460', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 14:58:00');
INSERT INTO `schedule_job_log` VALUES ('1461', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 14:59:00');
INSERT INTO `schedule_job_log` VALUES ('1462', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1463', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:01:00');
INSERT INTO `schedule_job_log` VALUES ('1464', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:02:00');
INSERT INTO `schedule_job_log` VALUES ('1465', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:03:00');
INSERT INTO `schedule_job_log` VALUES ('1466', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:04:00');
INSERT INTO `schedule_job_log` VALUES ('1467', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:05:00');
INSERT INTO `schedule_job_log` VALUES ('1468', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:06:00');
INSERT INTO `schedule_job_log` VALUES ('1469', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:07:00');
INSERT INTO `schedule_job_log` VALUES ('1470', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:08:00');
INSERT INTO `schedule_job_log` VALUES ('1471', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:09:00');
INSERT INTO `schedule_job_log` VALUES ('1472', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:10:00');
INSERT INTO `schedule_job_log` VALUES ('1473', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:11:00');
INSERT INTO `schedule_job_log` VALUES ('1474', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:12:00');
INSERT INTO `schedule_job_log` VALUES ('1475', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:13:00');
INSERT INTO `schedule_job_log` VALUES ('1476', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:14:00');
INSERT INTO `schedule_job_log` VALUES ('1477', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:15:00');
INSERT INTO `schedule_job_log` VALUES ('1478', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:16:00');
INSERT INTO `schedule_job_log` VALUES ('1479', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 15:17:00');
INSERT INTO `schedule_job_log` VALUES ('1480', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:18:00');
INSERT INTO `schedule_job_log` VALUES ('1481', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:19:00');
INSERT INTO `schedule_job_log` VALUES ('1482', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:20:00');
INSERT INTO `schedule_job_log` VALUES ('1483', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:21:00');
INSERT INTO `schedule_job_log` VALUES ('1484', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:22:00');
INSERT INTO `schedule_job_log` VALUES ('1485', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:23:00');
INSERT INTO `schedule_job_log` VALUES ('1486', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:24:00');
INSERT INTO `schedule_job_log` VALUES ('1487', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:25:00');
INSERT INTO `schedule_job_log` VALUES ('1488', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 15:26:00');
INSERT INTO `schedule_job_log` VALUES ('1489', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:27:00');
INSERT INTO `schedule_job_log` VALUES ('1490', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:28:00');
INSERT INTO `schedule_job_log` VALUES ('1491', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:29:00');
INSERT INTO `schedule_job_log` VALUES ('1492', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1493', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:31:00');
INSERT INTO `schedule_job_log` VALUES ('1494', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:32:00');
INSERT INTO `schedule_job_log` VALUES ('1495', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 15:33:00');
INSERT INTO `schedule_job_log` VALUES ('1496', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 15:34:00');
INSERT INTO `schedule_job_log` VALUES ('1497', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:35:00');
INSERT INTO `schedule_job_log` VALUES ('1498', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:36:00');
INSERT INTO `schedule_job_log` VALUES ('1499', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:37:00');
INSERT INTO `schedule_job_log` VALUES ('1500', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:38:00');
INSERT INTO `schedule_job_log` VALUES ('1501', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:39:00');
INSERT INTO `schedule_job_log` VALUES ('1502', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:40:00');
INSERT INTO `schedule_job_log` VALUES ('1503', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:41:00');
INSERT INTO `schedule_job_log` VALUES ('1504', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:42:00');
INSERT INTO `schedule_job_log` VALUES ('1505', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:43:00');
INSERT INTO `schedule_job_log` VALUES ('1506', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:44:00');
INSERT INTO `schedule_job_log` VALUES ('1507', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:45:00');
INSERT INTO `schedule_job_log` VALUES ('1508', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:46:00');
INSERT INTO `schedule_job_log` VALUES ('1509', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:47:00');
INSERT INTO `schedule_job_log` VALUES ('1510', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:48:00');
INSERT INTO `schedule_job_log` VALUES ('1511', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:49:00');
INSERT INTO `schedule_job_log` VALUES ('1512', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 15:50:00');
INSERT INTO `schedule_job_log` VALUES ('1513', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:51:00');
INSERT INTO `schedule_job_log` VALUES ('1514', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:52:00');
INSERT INTO `schedule_job_log` VALUES ('1515', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:53:00');
INSERT INTO `schedule_job_log` VALUES ('1516', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:54:00');
INSERT INTO `schedule_job_log` VALUES ('1517', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:55:00');
INSERT INTO `schedule_job_log` VALUES ('1518', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:56:00');
INSERT INTO `schedule_job_log` VALUES ('1519', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:57:00');
INSERT INTO `schedule_job_log` VALUES ('1520', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 15:58:00');
INSERT INTO `schedule_job_log` VALUES ('1521', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 15:59:00');
INSERT INTO `schedule_job_log` VALUES ('1522', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1523', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 16:01:00');
INSERT INTO `schedule_job_log` VALUES ('1524', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:02:00');
INSERT INTO `schedule_job_log` VALUES ('1525', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:03:00');
INSERT INTO `schedule_job_log` VALUES ('1526', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:04:00');
INSERT INTO `schedule_job_log` VALUES ('1527', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:05:00');
INSERT INTO `schedule_job_log` VALUES ('1528', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:06:00');
INSERT INTO `schedule_job_log` VALUES ('1529', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:07:00');
INSERT INTO `schedule_job_log` VALUES ('1530', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:08:00');
INSERT INTO `schedule_job_log` VALUES ('1531', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:09:00');
INSERT INTO `schedule_job_log` VALUES ('1532', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 16:10:00');
INSERT INTO `schedule_job_log` VALUES ('1533', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:11:00');
INSERT INTO `schedule_job_log` VALUES ('1534', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:12:00');
INSERT INTO `schedule_job_log` VALUES ('1535', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:13:00');
INSERT INTO `schedule_job_log` VALUES ('1536', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:14:00');
INSERT INTO `schedule_job_log` VALUES ('1537', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:15:00');
INSERT INTO `schedule_job_log` VALUES ('1538', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:16:00');
INSERT INTO `schedule_job_log` VALUES ('1539', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 16:17:00');
INSERT INTO `schedule_job_log` VALUES ('1540', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:18:00');
INSERT INTO `schedule_job_log` VALUES ('1541', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:19:00');
INSERT INTO `schedule_job_log` VALUES ('1542', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:20:00');
INSERT INTO `schedule_job_log` VALUES ('1543', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:21:00');
INSERT INTO `schedule_job_log` VALUES ('1544', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:22:00');
INSERT INTO `schedule_job_log` VALUES ('1545', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:23:00');
INSERT INTO `schedule_job_log` VALUES ('1546', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:24:00');
INSERT INTO `schedule_job_log` VALUES ('1547', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:25:00');
INSERT INTO `schedule_job_log` VALUES ('1548', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:26:00');
INSERT INTO `schedule_job_log` VALUES ('1549', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:27:00');
INSERT INTO `schedule_job_log` VALUES ('1550', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:28:00');
INSERT INTO `schedule_job_log` VALUES ('1551', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:29:00');
INSERT INTO `schedule_job_log` VALUES ('1552', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1553', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:31:00');
INSERT INTO `schedule_job_log` VALUES ('1554', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:32:00');
INSERT INTO `schedule_job_log` VALUES ('1555', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:33:00');
INSERT INTO `schedule_job_log` VALUES ('1556', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:34:00');
INSERT INTO `schedule_job_log` VALUES ('1557', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:35:00');
INSERT INTO `schedule_job_log` VALUES ('1558', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:36:00');
INSERT INTO `schedule_job_log` VALUES ('1559', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:37:00');
INSERT INTO `schedule_job_log` VALUES ('1560', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:38:00');
INSERT INTO `schedule_job_log` VALUES ('1561', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:39:00');
INSERT INTO `schedule_job_log` VALUES ('1562', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:40:00');
INSERT INTO `schedule_job_log` VALUES ('1563', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:41:00');
INSERT INTO `schedule_job_log` VALUES ('1564', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:42:00');
INSERT INTO `schedule_job_log` VALUES ('1565', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:43:00');
INSERT INTO `schedule_job_log` VALUES ('1566', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:44:00');
INSERT INTO `schedule_job_log` VALUES ('1567', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:45:00');
INSERT INTO `schedule_job_log` VALUES ('1568', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:46:00');
INSERT INTO `schedule_job_log` VALUES ('1569', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:47:00');
INSERT INTO `schedule_job_log` VALUES ('1570', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:48:00');
INSERT INTO `schedule_job_log` VALUES ('1571', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:49:00');
INSERT INTO `schedule_job_log` VALUES ('1572', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:50:00');
INSERT INTO `schedule_job_log` VALUES ('1573', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:51:00');
INSERT INTO `schedule_job_log` VALUES ('1574', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:52:00');
INSERT INTO `schedule_job_log` VALUES ('1575', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:53:00');
INSERT INTO `schedule_job_log` VALUES ('1576', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:54:00');
INSERT INTO `schedule_job_log` VALUES ('1577', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:55:00');
INSERT INTO `schedule_job_log` VALUES ('1578', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:56:00');
INSERT INTO `schedule_job_log` VALUES ('1579', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:57:00');
INSERT INTO `schedule_job_log` VALUES ('1580', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 16:58:00');
INSERT INTO `schedule_job_log` VALUES ('1581', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 16:59:00');
INSERT INTO `schedule_job_log` VALUES ('1582', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1583', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 17:01:00');
INSERT INTO `schedule_job_log` VALUES ('1584', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:02:00');
INSERT INTO `schedule_job_log` VALUES ('1585', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:03:00');
INSERT INTO `schedule_job_log` VALUES ('1586', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:04:00');
INSERT INTO `schedule_job_log` VALUES ('1587', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:05:00');
INSERT INTO `schedule_job_log` VALUES ('1588', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:06:00');
INSERT INTO `schedule_job_log` VALUES ('1589', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:07:00');
INSERT INTO `schedule_job_log` VALUES ('1590', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:08:00');
INSERT INTO `schedule_job_log` VALUES ('1591', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:09:00');
INSERT INTO `schedule_job_log` VALUES ('1592', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 17:10:00');
INSERT INTO `schedule_job_log` VALUES ('1593', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:11:00');
INSERT INTO `schedule_job_log` VALUES ('1594', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:12:00');
INSERT INTO `schedule_job_log` VALUES ('1595', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:13:00');
INSERT INTO `schedule_job_log` VALUES ('1596', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:14:00');
INSERT INTO `schedule_job_log` VALUES ('1597', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:15:00');
INSERT INTO `schedule_job_log` VALUES ('1598', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:16:00');
INSERT INTO `schedule_job_log` VALUES ('1599', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:17:00');
INSERT INTO `schedule_job_log` VALUES ('1600', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:18:00');
INSERT INTO `schedule_job_log` VALUES ('1601', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:19:00');
INSERT INTO `schedule_job_log` VALUES ('1602', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:20:00');
INSERT INTO `schedule_job_log` VALUES ('1603', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:21:00');
INSERT INTO `schedule_job_log` VALUES ('1604', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:22:00');
INSERT INTO `schedule_job_log` VALUES ('1605', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:23:00');
INSERT INTO `schedule_job_log` VALUES ('1606', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:24:00');
INSERT INTO `schedule_job_log` VALUES ('1607', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:25:00');
INSERT INTO `schedule_job_log` VALUES ('1608', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:26:00');
INSERT INTO `schedule_job_log` VALUES ('1609', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:27:00');
INSERT INTO `schedule_job_log` VALUES ('1610', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:28:00');
INSERT INTO `schedule_job_log` VALUES ('1611', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:29:00');
INSERT INTO `schedule_job_log` VALUES ('1612', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1613', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:31:00');
INSERT INTO `schedule_job_log` VALUES ('1614', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:32:00');
INSERT INTO `schedule_job_log` VALUES ('1615', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:33:00');
INSERT INTO `schedule_job_log` VALUES ('1616', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:34:00');
INSERT INTO `schedule_job_log` VALUES ('1617', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:35:00');
INSERT INTO `schedule_job_log` VALUES ('1618', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:36:00');
INSERT INTO `schedule_job_log` VALUES ('1619', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:37:00');
INSERT INTO `schedule_job_log` VALUES ('1620', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:38:00');
INSERT INTO `schedule_job_log` VALUES ('1621', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:39:00');
INSERT INTO `schedule_job_log` VALUES ('1622', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:40:00');
INSERT INTO `schedule_job_log` VALUES ('1623', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 17:41:00');
INSERT INTO `schedule_job_log` VALUES ('1624', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:42:00');
INSERT INTO `schedule_job_log` VALUES ('1625', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:43:00');
INSERT INTO `schedule_job_log` VALUES ('1626', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:44:00');
INSERT INTO `schedule_job_log` VALUES ('1627', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 17:45:00');
INSERT INTO `schedule_job_log` VALUES ('1628', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:46:00');
INSERT INTO `schedule_job_log` VALUES ('1629', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:47:00');
INSERT INTO `schedule_job_log` VALUES ('1630', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:48:00');
INSERT INTO `schedule_job_log` VALUES ('1631', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:49:00');
INSERT INTO `schedule_job_log` VALUES ('1632', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:50:00');
INSERT INTO `schedule_job_log` VALUES ('1633', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:51:00');
INSERT INTO `schedule_job_log` VALUES ('1634', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:52:00');
INSERT INTO `schedule_job_log` VALUES ('1635', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:53:00');
INSERT INTO `schedule_job_log` VALUES ('1636', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:54:00');
INSERT INTO `schedule_job_log` VALUES ('1637', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 17:55:00');
INSERT INTO `schedule_job_log` VALUES ('1638', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:56:00');
INSERT INTO `schedule_job_log` VALUES ('1639', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:57:00');
INSERT INTO `schedule_job_log` VALUES ('1640', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:58:00');
INSERT INTO `schedule_job_log` VALUES ('1641', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 17:59:00');
INSERT INTO `schedule_job_log` VALUES ('1642', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1643', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:01:00');
INSERT INTO `schedule_job_log` VALUES ('1644', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:02:00');
INSERT INTO `schedule_job_log` VALUES ('1645', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:03:00');
INSERT INTO `schedule_job_log` VALUES ('1646', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:04:00');
INSERT INTO `schedule_job_log` VALUES ('1647', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:05:00');
INSERT INTO `schedule_job_log` VALUES ('1648', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:06:00');
INSERT INTO `schedule_job_log` VALUES ('1649', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:07:00');
INSERT INTO `schedule_job_log` VALUES ('1650', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:08:00');
INSERT INTO `schedule_job_log` VALUES ('1651', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 18:09:00');
INSERT INTO `schedule_job_log` VALUES ('1652', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 18:10:00');
INSERT INTO `schedule_job_log` VALUES ('1653', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:11:00');
INSERT INTO `schedule_job_log` VALUES ('1654', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:12:00');
INSERT INTO `schedule_job_log` VALUES ('1655', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:13:00');
INSERT INTO `schedule_job_log` VALUES ('1656', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:14:00');
INSERT INTO `schedule_job_log` VALUES ('1657', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:15:00');
INSERT INTO `schedule_job_log` VALUES ('1658', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:16:00');
INSERT INTO `schedule_job_log` VALUES ('1659', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:17:00');
INSERT INTO `schedule_job_log` VALUES ('1660', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:18:00');
INSERT INTO `schedule_job_log` VALUES ('1661', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:19:00');
INSERT INTO `schedule_job_log` VALUES ('1662', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:20:00');
INSERT INTO `schedule_job_log` VALUES ('1663', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:21:00');
INSERT INTO `schedule_job_log` VALUES ('1664', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 18:22:00');
INSERT INTO `schedule_job_log` VALUES ('1665', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:23:00');
INSERT INTO `schedule_job_log` VALUES ('1666', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:24:00');
INSERT INTO `schedule_job_log` VALUES ('1667', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:25:00');
INSERT INTO `schedule_job_log` VALUES ('1668', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:26:00');
INSERT INTO `schedule_job_log` VALUES ('1669', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:27:00');
INSERT INTO `schedule_job_log` VALUES ('1670', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:28:00');
INSERT INTO `schedule_job_log` VALUES ('1671', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:29:00');
INSERT INTO `schedule_job_log` VALUES ('1672', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1673', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:31:00');
INSERT INTO `schedule_job_log` VALUES ('1674', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:32:00');
INSERT INTO `schedule_job_log` VALUES ('1675', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:33:00');
INSERT INTO `schedule_job_log` VALUES ('1676', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:34:00');
INSERT INTO `schedule_job_log` VALUES ('1677', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:35:00');
INSERT INTO `schedule_job_log` VALUES ('1678', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:36:00');
INSERT INTO `schedule_job_log` VALUES ('1679', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:37:00');
INSERT INTO `schedule_job_log` VALUES ('1680', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:38:00');
INSERT INTO `schedule_job_log` VALUES ('1681', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:39:00');
INSERT INTO `schedule_job_log` VALUES ('1682', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:40:00');
INSERT INTO `schedule_job_log` VALUES ('1683', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:41:00');
INSERT INTO `schedule_job_log` VALUES ('1684', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:42:00');
INSERT INTO `schedule_job_log` VALUES ('1685', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:43:00');
INSERT INTO `schedule_job_log` VALUES ('1686', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:44:00');
INSERT INTO `schedule_job_log` VALUES ('1687', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:45:00');
INSERT INTO `schedule_job_log` VALUES ('1688', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:46:00');
INSERT INTO `schedule_job_log` VALUES ('1689', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:47:00');
INSERT INTO `schedule_job_log` VALUES ('1690', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:48:00');
INSERT INTO `schedule_job_log` VALUES ('1691', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:49:00');
INSERT INTO `schedule_job_log` VALUES ('1692', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 18:50:00');
INSERT INTO `schedule_job_log` VALUES ('1693', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:51:00');
INSERT INTO `schedule_job_log` VALUES ('1694', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:52:00');
INSERT INTO `schedule_job_log` VALUES ('1695', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:53:00');
INSERT INTO `schedule_job_log` VALUES ('1696', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:54:00');
INSERT INTO `schedule_job_log` VALUES ('1697', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:55:00');
INSERT INTO `schedule_job_log` VALUES ('1698', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 18:56:00');
INSERT INTO `schedule_job_log` VALUES ('1699', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:57:00');
INSERT INTO `schedule_job_log` VALUES ('1700', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:58:00');
INSERT INTO `schedule_job_log` VALUES ('1701', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 18:59:00');
INSERT INTO `schedule_job_log` VALUES ('1702', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1703', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:01:00');
INSERT INTO `schedule_job_log` VALUES ('1704', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:02:00');
INSERT INTO `schedule_job_log` VALUES ('1705', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:03:00');
INSERT INTO `schedule_job_log` VALUES ('1706', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:04:00');
INSERT INTO `schedule_job_log` VALUES ('1707', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:05:00');
INSERT INTO `schedule_job_log` VALUES ('1708', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:06:00');
INSERT INTO `schedule_job_log` VALUES ('1709', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:07:00');
INSERT INTO `schedule_job_log` VALUES ('1710', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:08:00');
INSERT INTO `schedule_job_log` VALUES ('1711', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:09:00');
INSERT INTO `schedule_job_log` VALUES ('1712', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:10:00');
INSERT INTO `schedule_job_log` VALUES ('1713', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:11:00');
INSERT INTO `schedule_job_log` VALUES ('1714', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:12:00');
INSERT INTO `schedule_job_log` VALUES ('1715', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:13:00');
INSERT INTO `schedule_job_log` VALUES ('1716', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:14:00');
INSERT INTO `schedule_job_log` VALUES ('1717', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:15:00');
INSERT INTO `schedule_job_log` VALUES ('1718', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:16:00');
INSERT INTO `schedule_job_log` VALUES ('1719', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 19:17:00');
INSERT INTO `schedule_job_log` VALUES ('1720', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:18:00');
INSERT INTO `schedule_job_log` VALUES ('1721', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:19:00');
INSERT INTO `schedule_job_log` VALUES ('1722', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 19:20:00');
INSERT INTO `schedule_job_log` VALUES ('1723', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:21:00');
INSERT INTO `schedule_job_log` VALUES ('1724', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:22:00');
INSERT INTO `schedule_job_log` VALUES ('1725', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:23:00');
INSERT INTO `schedule_job_log` VALUES ('1726', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:24:00');
INSERT INTO `schedule_job_log` VALUES ('1727', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:25:00');
INSERT INTO `schedule_job_log` VALUES ('1728', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:26:00');
INSERT INTO `schedule_job_log` VALUES ('1729', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:27:00');
INSERT INTO `schedule_job_log` VALUES ('1730', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:28:00');
INSERT INTO `schedule_job_log` VALUES ('1731', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:29:00');
INSERT INTO `schedule_job_log` VALUES ('1732', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1733', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:31:00');
INSERT INTO `schedule_job_log` VALUES ('1734', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:32:00');
INSERT INTO `schedule_job_log` VALUES ('1735', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:33:00');
INSERT INTO `schedule_job_log` VALUES ('1736', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:34:00');
INSERT INTO `schedule_job_log` VALUES ('1737', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:35:00');
INSERT INTO `schedule_job_log` VALUES ('1738', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:36:00');
INSERT INTO `schedule_job_log` VALUES ('1739', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:37:00');
INSERT INTO `schedule_job_log` VALUES ('1740', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:38:00');
INSERT INTO `schedule_job_log` VALUES ('1741', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:39:00');
INSERT INTO `schedule_job_log` VALUES ('1742', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:40:00');
INSERT INTO `schedule_job_log` VALUES ('1743', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:41:00');
INSERT INTO `schedule_job_log` VALUES ('1744', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:42:00');
INSERT INTO `schedule_job_log` VALUES ('1745', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:43:00');
INSERT INTO `schedule_job_log` VALUES ('1746', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:44:00');
INSERT INTO `schedule_job_log` VALUES ('1747', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:45:00');
INSERT INTO `schedule_job_log` VALUES ('1748', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:46:00');
INSERT INTO `schedule_job_log` VALUES ('1749', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:47:00');
INSERT INTO `schedule_job_log` VALUES ('1750', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:48:00');
INSERT INTO `schedule_job_log` VALUES ('1751', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:49:00');
INSERT INTO `schedule_job_log` VALUES ('1752', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 19:50:00');
INSERT INTO `schedule_job_log` VALUES ('1753', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:51:00');
INSERT INTO `schedule_job_log` VALUES ('1754', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:52:00');
INSERT INTO `schedule_job_log` VALUES ('1755', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:53:00');
INSERT INTO `schedule_job_log` VALUES ('1756', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:54:00');
INSERT INTO `schedule_job_log` VALUES ('1757', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:55:00');
INSERT INTO `schedule_job_log` VALUES ('1758', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 19:56:00');
INSERT INTO `schedule_job_log` VALUES ('1759', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 19:57:00');
INSERT INTO `schedule_job_log` VALUES ('1760', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:58:00');
INSERT INTO `schedule_job_log` VALUES ('1761', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 19:59:00');
INSERT INTO `schedule_job_log` VALUES ('1762', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1763', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 20:01:00');
INSERT INTO `schedule_job_log` VALUES ('1764', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 20:02:00');
INSERT INTO `schedule_job_log` VALUES ('1765', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 20:03:00');
INSERT INTO `schedule_job_log` VALUES ('1766', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 20:04:00');
INSERT INTO `schedule_job_log` VALUES ('1767', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 20:05:00');
INSERT INTO `schedule_job_log` VALUES ('1768', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 20:06:00');
INSERT INTO `schedule_job_log` VALUES ('1769', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-16 20:07:00');
INSERT INTO `schedule_job_log` VALUES ('1770', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-16 20:08:00');
INSERT INTO `schedule_job_log` VALUES ('1771', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 20:21:04');
INSERT INTO `schedule_job_log` VALUES ('1772', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-16 20:22:00');
INSERT INTO `schedule_job_log` VALUES ('1773', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 20:23:00');
INSERT INTO `schedule_job_log` VALUES ('1774', '6', 'testTask', 'test', '简单测试', '0', null, '1006', '2018-01-16 20:24:00');
INSERT INTO `schedule_job_log` VALUES ('1775', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-16 20:25:00');
INSERT INTO `schedule_job_log` VALUES ('1776', '6', 'testTask', 'test', '简单测试', '0', null, '1008', '2018-01-16 20:26:00');
INSERT INTO `schedule_job_log` VALUES ('1777', '6', 'testTask', 'test', '简单测试', '0', null, '1006', '2018-01-17 10:19:00');
INSERT INTO `schedule_job_log` VALUES ('1778', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:20:00');
INSERT INTO `schedule_job_log` VALUES ('1779', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:21:00');
INSERT INTO `schedule_job_log` VALUES ('1780', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:22:00');
INSERT INTO `schedule_job_log` VALUES ('1781', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 10:23:00');
INSERT INTO `schedule_job_log` VALUES ('1782', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:24:00');
INSERT INTO `schedule_job_log` VALUES ('1783', '6', 'testTask', 'test', '简单测试', '0', null, '1011', '2018-01-17 10:25:00');
INSERT INTO `schedule_job_log` VALUES ('1784', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:26:00');
INSERT INTO `schedule_job_log` VALUES ('1785', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:27:00');
INSERT INTO `schedule_job_log` VALUES ('1786', '6', 'testTask', 'test', '简单测试', '0', null, '1012', '2018-01-17 10:35:00');
INSERT INTO `schedule_job_log` VALUES ('1787', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:36:00');
INSERT INTO `schedule_job_log` VALUES ('1788', '6', 'testTask', 'test', '简单测试', '0', null, '1006', '2018-01-17 10:37:00');
INSERT INTO `schedule_job_log` VALUES ('1789', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:38:00');
INSERT INTO `schedule_job_log` VALUES ('1790', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:39:00');
INSERT INTO `schedule_job_log` VALUES ('1791', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 10:40:00');
INSERT INTO `schedule_job_log` VALUES ('1792', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 10:41:00');
INSERT INTO `schedule_job_log` VALUES ('1793', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 10:42:00');
INSERT INTO `schedule_job_log` VALUES ('1794', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 10:43:00');
INSERT INTO `schedule_job_log` VALUES ('1795', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 10:44:00');
INSERT INTO `schedule_job_log` VALUES ('1796', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 10:45:00');
INSERT INTO `schedule_job_log` VALUES ('1797', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:46:00');
INSERT INTO `schedule_job_log` VALUES ('1798', '6', 'testTask', 'test', '简单测试', '0', null, '1008', '2018-01-17 10:47:00');
INSERT INTO `schedule_job_log` VALUES ('1799', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 10:48:00');
INSERT INTO `schedule_job_log` VALUES ('1800', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:49:00');
INSERT INTO `schedule_job_log` VALUES ('1801', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:50:00');
INSERT INTO `schedule_job_log` VALUES ('1802', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:51:00');
INSERT INTO `schedule_job_log` VALUES ('1803', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 10:52:00');
INSERT INTO `schedule_job_log` VALUES ('1804', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 10:53:00');
INSERT INTO `schedule_job_log` VALUES ('1805', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:54:00');
INSERT INTO `schedule_job_log` VALUES ('1806', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 10:55:00');
INSERT INTO `schedule_job_log` VALUES ('1807', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 10:56:00');
INSERT INTO `schedule_job_log` VALUES ('1808', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:57:00');
INSERT INTO `schedule_job_log` VALUES ('1809', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:58:00');
INSERT INTO `schedule_job_log` VALUES ('1810', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 10:59:00');
INSERT INTO `schedule_job_log` VALUES ('1811', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1812', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:01:00');
INSERT INTO `schedule_job_log` VALUES ('1813', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:02:00');
INSERT INTO `schedule_job_log` VALUES ('1814', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:03:00');
INSERT INTO `schedule_job_log` VALUES ('1815', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:04:00');
INSERT INTO `schedule_job_log` VALUES ('1816', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:05:00');
INSERT INTO `schedule_job_log` VALUES ('1817', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-17 11:06:00');
INSERT INTO `schedule_job_log` VALUES ('1818', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:07:00');
INSERT INTO `schedule_job_log` VALUES ('1819', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:08:00');
INSERT INTO `schedule_job_log` VALUES ('1820', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:09:00');
INSERT INTO `schedule_job_log` VALUES ('1821', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:10:00');
INSERT INTO `schedule_job_log` VALUES ('1822', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:11:00');
INSERT INTO `schedule_job_log` VALUES ('1823', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:12:00');
INSERT INTO `schedule_job_log` VALUES ('1824', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:13:00');
INSERT INTO `schedule_job_log` VALUES ('1825', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:14:00');
INSERT INTO `schedule_job_log` VALUES ('1826', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:15:00');
INSERT INTO `schedule_job_log` VALUES ('1827', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 11:16:00');
INSERT INTO `schedule_job_log` VALUES ('1828', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 11:17:00');
INSERT INTO `schedule_job_log` VALUES ('1829', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:18:00');
INSERT INTO `schedule_job_log` VALUES ('1830', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:19:00');
INSERT INTO `schedule_job_log` VALUES ('1831', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:20:00');
INSERT INTO `schedule_job_log` VALUES ('1832', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:21:00');
INSERT INTO `schedule_job_log` VALUES ('1833', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:22:00');
INSERT INTO `schedule_job_log` VALUES ('1834', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:23:00');
INSERT INTO `schedule_job_log` VALUES ('1835', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:24:00');
INSERT INTO `schedule_job_log` VALUES ('1836', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:25:00');
INSERT INTO `schedule_job_log` VALUES ('1837', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:26:00');
INSERT INTO `schedule_job_log` VALUES ('1838', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:27:00');
INSERT INTO `schedule_job_log` VALUES ('1839', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:28:00');
INSERT INTO `schedule_job_log` VALUES ('1840', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:29:00');
INSERT INTO `schedule_job_log` VALUES ('1841', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1842', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:31:00');
INSERT INTO `schedule_job_log` VALUES ('1843', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:32:00');
INSERT INTO `schedule_job_log` VALUES ('1844', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:33:00');
INSERT INTO `schedule_job_log` VALUES ('1845', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:34:00');
INSERT INTO `schedule_job_log` VALUES ('1846', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:35:00');
INSERT INTO `schedule_job_log` VALUES ('1847', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:36:00');
INSERT INTO `schedule_job_log` VALUES ('1848', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:37:00');
INSERT INTO `schedule_job_log` VALUES ('1849', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:38:00');
INSERT INTO `schedule_job_log` VALUES ('1850', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:39:00');
INSERT INTO `schedule_job_log` VALUES ('1851', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:40:00');
INSERT INTO `schedule_job_log` VALUES ('1852', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:41:00');
INSERT INTO `schedule_job_log` VALUES ('1853', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:42:00');
INSERT INTO `schedule_job_log` VALUES ('1854', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:43:00');
INSERT INTO `schedule_job_log` VALUES ('1855', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:44:00');
INSERT INTO `schedule_job_log` VALUES ('1856', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:45:00');
INSERT INTO `schedule_job_log` VALUES ('1857', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:46:00');
INSERT INTO `schedule_job_log` VALUES ('1858', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:47:00');
INSERT INTO `schedule_job_log` VALUES ('1859', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:48:00');
INSERT INTO `schedule_job_log` VALUES ('1860', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:49:00');
INSERT INTO `schedule_job_log` VALUES ('1861', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:50:00');
INSERT INTO `schedule_job_log` VALUES ('1862', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:51:00');
INSERT INTO `schedule_job_log` VALUES ('1863', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:52:00');
INSERT INTO `schedule_job_log` VALUES ('1864', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:53:00');
INSERT INTO `schedule_job_log` VALUES ('1865', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:54:00');
INSERT INTO `schedule_job_log` VALUES ('1866', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:55:00');
INSERT INTO `schedule_job_log` VALUES ('1867', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:56:00');
INSERT INTO `schedule_job_log` VALUES ('1868', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:57:00');
INSERT INTO `schedule_job_log` VALUES ('1869', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 11:58:00');
INSERT INTO `schedule_job_log` VALUES ('1870', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 11:59:00');
INSERT INTO `schedule_job_log` VALUES ('1871', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1872', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:01:00');
INSERT INTO `schedule_job_log` VALUES ('1873', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:02:00');
INSERT INTO `schedule_job_log` VALUES ('1874', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:03:00');
INSERT INTO `schedule_job_log` VALUES ('1875', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:04:00');
INSERT INTO `schedule_job_log` VALUES ('1876', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 12:05:00');
INSERT INTO `schedule_job_log` VALUES ('1877', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:06:00');
INSERT INTO `schedule_job_log` VALUES ('1878', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:07:00');
INSERT INTO `schedule_job_log` VALUES ('1879', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:08:00');
INSERT INTO `schedule_job_log` VALUES ('1880', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:09:00');
INSERT INTO `schedule_job_log` VALUES ('1881', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:10:00');
INSERT INTO `schedule_job_log` VALUES ('1882', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 12:11:00');
INSERT INTO `schedule_job_log` VALUES ('1883', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 12:12:00');
INSERT INTO `schedule_job_log` VALUES ('1884', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:13:00');
INSERT INTO `schedule_job_log` VALUES ('1885', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:14:00');
INSERT INTO `schedule_job_log` VALUES ('1886', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 12:15:00');
INSERT INTO `schedule_job_log` VALUES ('1887', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:16:00');
INSERT INTO `schedule_job_log` VALUES ('1888', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:17:00');
INSERT INTO `schedule_job_log` VALUES ('1889', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:18:00');
INSERT INTO `schedule_job_log` VALUES ('1890', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:19:00');
INSERT INTO `schedule_job_log` VALUES ('1891', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:20:00');
INSERT INTO `schedule_job_log` VALUES ('1892', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:21:00');
INSERT INTO `schedule_job_log` VALUES ('1893', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:22:00');
INSERT INTO `schedule_job_log` VALUES ('1894', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 12:23:00');
INSERT INTO `schedule_job_log` VALUES ('1895', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:24:00');
INSERT INTO `schedule_job_log` VALUES ('1896', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:25:00');
INSERT INTO `schedule_job_log` VALUES ('1897', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:26:00');
INSERT INTO `schedule_job_log` VALUES ('1898', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:27:00');
INSERT INTO `schedule_job_log` VALUES ('1899', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:28:00');
INSERT INTO `schedule_job_log` VALUES ('1900', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:29:00');
INSERT INTO `schedule_job_log` VALUES ('1901', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1902', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 12:31:00');
INSERT INTO `schedule_job_log` VALUES ('1903', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-17 12:32:00');
INSERT INTO `schedule_job_log` VALUES ('1904', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:33:00');
INSERT INTO `schedule_job_log` VALUES ('1905', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:34:00');
INSERT INTO `schedule_job_log` VALUES ('1906', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:35:00');
INSERT INTO `schedule_job_log` VALUES ('1907', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 12:36:00');
INSERT INTO `schedule_job_log` VALUES ('1908', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:37:00');
INSERT INTO `schedule_job_log` VALUES ('1909', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:38:00');
INSERT INTO `schedule_job_log` VALUES ('1910', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:39:00');
INSERT INTO `schedule_job_log` VALUES ('1911', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:40:00');
INSERT INTO `schedule_job_log` VALUES ('1912', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 12:41:00');
INSERT INTO `schedule_job_log` VALUES ('1913', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-17 12:42:00');
INSERT INTO `schedule_job_log` VALUES ('1914', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:43:00');
INSERT INTO `schedule_job_log` VALUES ('1915', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:44:00');
INSERT INTO `schedule_job_log` VALUES ('1916', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:45:00');
INSERT INTO `schedule_job_log` VALUES ('1917', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:46:00');
INSERT INTO `schedule_job_log` VALUES ('1918', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:47:00');
INSERT INTO `schedule_job_log` VALUES ('1919', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:48:00');
INSERT INTO `schedule_job_log` VALUES ('1920', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 12:49:00');
INSERT INTO `schedule_job_log` VALUES ('1921', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:50:00');
INSERT INTO `schedule_job_log` VALUES ('1922', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 12:51:00');
INSERT INTO `schedule_job_log` VALUES ('1923', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 12:52:00');
INSERT INTO `schedule_job_log` VALUES ('1924', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:53:00');
INSERT INTO `schedule_job_log` VALUES ('1925', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:54:00');
INSERT INTO `schedule_job_log` VALUES ('1926', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:55:00');
INSERT INTO `schedule_job_log` VALUES ('1927', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 12:56:00');
INSERT INTO `schedule_job_log` VALUES ('1928', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 12:57:00');
INSERT INTO `schedule_job_log` VALUES ('1929', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:58:00');
INSERT INTO `schedule_job_log` VALUES ('1930', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 12:59:00');
INSERT INTO `schedule_job_log` VALUES ('1931', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1932', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:01:00');
INSERT INTO `schedule_job_log` VALUES ('1933', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 13:02:00');
INSERT INTO `schedule_job_log` VALUES ('1934', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 13:03:00');
INSERT INTO `schedule_job_log` VALUES ('1935', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:04:00');
INSERT INTO `schedule_job_log` VALUES ('1936', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:05:00');
INSERT INTO `schedule_job_log` VALUES ('1937', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 13:06:00');
INSERT INTO `schedule_job_log` VALUES ('1938', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:07:00');
INSERT INTO `schedule_job_log` VALUES ('1939', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:08:00');
INSERT INTO `schedule_job_log` VALUES ('1940', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:09:00');
INSERT INTO `schedule_job_log` VALUES ('1941', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:10:00');
INSERT INTO `schedule_job_log` VALUES ('1942', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 13:11:00');
INSERT INTO `schedule_job_log` VALUES ('1943', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:12:00');
INSERT INTO `schedule_job_log` VALUES ('1944', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:13:00');
INSERT INTO `schedule_job_log` VALUES ('1945', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:14:00');
INSERT INTO `schedule_job_log` VALUES ('1946', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:15:00');
INSERT INTO `schedule_job_log` VALUES ('1947', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 13:16:00');
INSERT INTO `schedule_job_log` VALUES ('1948', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:17:00');
INSERT INTO `schedule_job_log` VALUES ('1949', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 13:18:00');
INSERT INTO `schedule_job_log` VALUES ('1950', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:19:00');
INSERT INTO `schedule_job_log` VALUES ('1951', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:20:00');
INSERT INTO `schedule_job_log` VALUES ('1952', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:21:00');
INSERT INTO `schedule_job_log` VALUES ('1953', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 13:22:00');
INSERT INTO `schedule_job_log` VALUES ('1954', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:23:00');
INSERT INTO `schedule_job_log` VALUES ('1955', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:24:00');
INSERT INTO `schedule_job_log` VALUES ('1956', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:25:00');
INSERT INTO `schedule_job_log` VALUES ('1957', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:26:00');
INSERT INTO `schedule_job_log` VALUES ('1958', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:27:00');
INSERT INTO `schedule_job_log` VALUES ('1959', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:28:00');
INSERT INTO `schedule_job_log` VALUES ('1960', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:29:00');
INSERT INTO `schedule_job_log` VALUES ('1961', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1962', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 13:31:00');
INSERT INTO `schedule_job_log` VALUES ('1963', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:32:00');
INSERT INTO `schedule_job_log` VALUES ('1964', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 13:33:00');
INSERT INTO `schedule_job_log` VALUES ('1965', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:34:00');
INSERT INTO `schedule_job_log` VALUES ('1966', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 13:35:00');
INSERT INTO `schedule_job_log` VALUES ('1967', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:36:00');
INSERT INTO `schedule_job_log` VALUES ('1968', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 13:37:00');
INSERT INTO `schedule_job_log` VALUES ('1969', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:38:00');
INSERT INTO `schedule_job_log` VALUES ('1970', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:39:00');
INSERT INTO `schedule_job_log` VALUES ('1971', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 13:40:00');
INSERT INTO `schedule_job_log` VALUES ('1972', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:41:00');
INSERT INTO `schedule_job_log` VALUES ('1973', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-17 13:42:00');
INSERT INTO `schedule_job_log` VALUES ('1974', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:43:00');
INSERT INTO `schedule_job_log` VALUES ('1975', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:44:00');
INSERT INTO `schedule_job_log` VALUES ('1976', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:45:00');
INSERT INTO `schedule_job_log` VALUES ('1977', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 13:46:00');
INSERT INTO `schedule_job_log` VALUES ('1978', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:47:00');
INSERT INTO `schedule_job_log` VALUES ('1979', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:48:00');
INSERT INTO `schedule_job_log` VALUES ('1980', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:49:00');
INSERT INTO `schedule_job_log` VALUES ('1981', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:50:00');
INSERT INTO `schedule_job_log` VALUES ('1982', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 13:51:00');
INSERT INTO `schedule_job_log` VALUES ('1983', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-17 13:52:00');
INSERT INTO `schedule_job_log` VALUES ('1984', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:53:00');
INSERT INTO `schedule_job_log` VALUES ('1985', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 13:54:00');
INSERT INTO `schedule_job_log` VALUES ('1986', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:55:00');
INSERT INTO `schedule_job_log` VALUES ('1987', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:56:00');
INSERT INTO `schedule_job_log` VALUES ('1988', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 13:57:00');
INSERT INTO `schedule_job_log` VALUES ('1989', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:58:00');
INSERT INTO `schedule_job_log` VALUES ('1990', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 13:59:00');
INSERT INTO `schedule_job_log` VALUES ('1991', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1992', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:01:00');
INSERT INTO `schedule_job_log` VALUES ('1993', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:02:00');
INSERT INTO `schedule_job_log` VALUES ('1994', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:03:00');
INSERT INTO `schedule_job_log` VALUES ('1995', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:04:00');
INSERT INTO `schedule_job_log` VALUES ('1996', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:05:00');
INSERT INTO `schedule_job_log` VALUES ('1997', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:06:00');
INSERT INTO `schedule_job_log` VALUES ('1998', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:07:00');
INSERT INTO `schedule_job_log` VALUES ('1999', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-17 14:08:00');
INSERT INTO `schedule_job_log` VALUES ('2000', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:09:00');
INSERT INTO `schedule_job_log` VALUES ('2001', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:10:00');
INSERT INTO `schedule_job_log` VALUES ('2002', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:11:00');
INSERT INTO `schedule_job_log` VALUES ('2003', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:12:00');
INSERT INTO `schedule_job_log` VALUES ('2004', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:13:00');
INSERT INTO `schedule_job_log` VALUES ('2005', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:14:00');
INSERT INTO `schedule_job_log` VALUES ('2006', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:15:00');
INSERT INTO `schedule_job_log` VALUES ('2007', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-17 14:16:00');
INSERT INTO `schedule_job_log` VALUES ('2008', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 14:17:00');
INSERT INTO `schedule_job_log` VALUES ('2009', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:18:00');
INSERT INTO `schedule_job_log` VALUES ('2010', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:19:00');
INSERT INTO `schedule_job_log` VALUES ('2011', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:20:00');
INSERT INTO `schedule_job_log` VALUES ('2012', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:21:00');
INSERT INTO `schedule_job_log` VALUES ('2013', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:22:00');
INSERT INTO `schedule_job_log` VALUES ('2014', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-17 14:23:00');
INSERT INTO `schedule_job_log` VALUES ('2015', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 14:24:00');
INSERT INTO `schedule_job_log` VALUES ('2016', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:25:00');
INSERT INTO `schedule_job_log` VALUES ('2017', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:26:00');
INSERT INTO `schedule_job_log` VALUES ('2018', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 14:27:00');
INSERT INTO `schedule_job_log` VALUES ('2019', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:28:00');
INSERT INTO `schedule_job_log` VALUES ('2020', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:29:00');
INSERT INTO `schedule_job_log` VALUES ('2021', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('2022', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 14:31:00');
INSERT INTO `schedule_job_log` VALUES ('2023', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:32:00');
INSERT INTO `schedule_job_log` VALUES ('2024', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 14:33:00');
INSERT INTO `schedule_job_log` VALUES ('2025', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:34:00');
INSERT INTO `schedule_job_log` VALUES ('2026', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:35:00');
INSERT INTO `schedule_job_log` VALUES ('2027', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:36:00');
INSERT INTO `schedule_job_log` VALUES ('2028', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 14:37:00');
INSERT INTO `schedule_job_log` VALUES ('2029', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:38:00');
INSERT INTO `schedule_job_log` VALUES ('2030', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:39:00');
INSERT INTO `schedule_job_log` VALUES ('2031', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:40:00');
INSERT INTO `schedule_job_log` VALUES ('2032', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 14:41:00');
INSERT INTO `schedule_job_log` VALUES ('2033', '6', 'testTask', 'test', '简单测试', '0', null, '1013', '2018-01-17 14:45:00');
INSERT INTO `schedule_job_log` VALUES ('2034', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 14:46:00');
INSERT INTO `schedule_job_log` VALUES ('2035', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 14:47:00');
INSERT INTO `schedule_job_log` VALUES ('2036', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 14:48:00');
INSERT INTO `schedule_job_log` VALUES ('2037', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 14:49:00');
INSERT INTO `schedule_job_log` VALUES ('2038', '6', 'testTask', 'test', '简单测试', '0', null, '1006', '2018-01-17 14:50:00');
INSERT INTO `schedule_job_log` VALUES ('2039', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 14:51:00');
INSERT INTO `schedule_job_log` VALUES ('2040', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 14:52:00');
INSERT INTO `schedule_job_log` VALUES ('2041', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 14:53:00');
INSERT INTO `schedule_job_log` VALUES ('2042', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 14:54:00');
INSERT INTO `schedule_job_log` VALUES ('2043', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:55:00');
INSERT INTO `schedule_job_log` VALUES ('2044', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:56:00');
INSERT INTO `schedule_job_log` VALUES ('2045', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 14:57:00');
INSERT INTO `schedule_job_log` VALUES ('2046', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 14:58:00');
INSERT INTO `schedule_job_log` VALUES ('2047', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-17 14:59:00');
INSERT INTO `schedule_job_log` VALUES ('2048', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('2049', '6', 'testTask', 'test', '简单测试', '0', null, '1007', '2018-01-17 15:01:00');
INSERT INTO `schedule_job_log` VALUES ('2050', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:02:00');
INSERT INTO `schedule_job_log` VALUES ('2051', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 15:03:00');
INSERT INTO `schedule_job_log` VALUES ('2052', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 15:04:00');
INSERT INTO `schedule_job_log` VALUES ('2053', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:05:00');
INSERT INTO `schedule_job_log` VALUES ('2054', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:06:00');
INSERT INTO `schedule_job_log` VALUES ('2055', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 15:07:00');
INSERT INTO `schedule_job_log` VALUES ('2056', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 15:08:00');
INSERT INTO `schedule_job_log` VALUES ('2057', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 15:09:00');
INSERT INTO `schedule_job_log` VALUES ('2058', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:10:00');
INSERT INTO `schedule_job_log` VALUES ('2059', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:11:00');
INSERT INTO `schedule_job_log` VALUES ('2060', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:12:00');
INSERT INTO `schedule_job_log` VALUES ('2061', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 15:13:00');
INSERT INTO `schedule_job_log` VALUES ('2062', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:14:00');
INSERT INTO `schedule_job_log` VALUES ('2063', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:15:00');
INSERT INTO `schedule_job_log` VALUES ('2064', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:16:00');
INSERT INTO `schedule_job_log` VALUES ('2065', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:17:00');
INSERT INTO `schedule_job_log` VALUES ('2066', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:18:00');
INSERT INTO `schedule_job_log` VALUES ('2067', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:19:00');
INSERT INTO `schedule_job_log` VALUES ('2068', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:20:00');
INSERT INTO `schedule_job_log` VALUES ('2069', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:21:00');
INSERT INTO `schedule_job_log` VALUES ('2070', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:22:00');
INSERT INTO `schedule_job_log` VALUES ('2071', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:23:00');
INSERT INTO `schedule_job_log` VALUES ('2072', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:24:00');
INSERT INTO `schedule_job_log` VALUES ('2073', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:25:00');
INSERT INTO `schedule_job_log` VALUES ('2074', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 15:26:00');
INSERT INTO `schedule_job_log` VALUES ('2075', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:27:00');
INSERT INTO `schedule_job_log` VALUES ('2076', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:28:00');
INSERT INTO `schedule_job_log` VALUES ('2077', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:29:00');
INSERT INTO `schedule_job_log` VALUES ('2078', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('2079', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:31:00');
INSERT INTO `schedule_job_log` VALUES ('2080', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:32:00');
INSERT INTO `schedule_job_log` VALUES ('2081', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:33:00');
INSERT INTO `schedule_job_log` VALUES ('2082', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:34:00');
INSERT INTO `schedule_job_log` VALUES ('2083', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:35:00');
INSERT INTO `schedule_job_log` VALUES ('2084', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:36:00');
INSERT INTO `schedule_job_log` VALUES ('2085', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:37:00');
INSERT INTO `schedule_job_log` VALUES ('2086', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:38:00');
INSERT INTO `schedule_job_log` VALUES ('2087', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:39:00');
INSERT INTO `schedule_job_log` VALUES ('2088', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:40:00');
INSERT INTO `schedule_job_log` VALUES ('2089', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:41:00');
INSERT INTO `schedule_job_log` VALUES ('2090', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:42:00');
INSERT INTO `schedule_job_log` VALUES ('2091', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:43:00');
INSERT INTO `schedule_job_log` VALUES ('2092', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:44:00');
INSERT INTO `schedule_job_log` VALUES ('2093', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 15:45:00');
INSERT INTO `schedule_job_log` VALUES ('2094', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:46:00');
INSERT INTO `schedule_job_log` VALUES ('2095', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 15:47:00');
INSERT INTO `schedule_job_log` VALUES ('2096', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:48:00');
INSERT INTO `schedule_job_log` VALUES ('2097', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 15:49:00');
INSERT INTO `schedule_job_log` VALUES ('2098', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:50:00');
INSERT INTO `schedule_job_log` VALUES ('2099', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:51:00');
INSERT INTO `schedule_job_log` VALUES ('2100', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 15:52:00');
INSERT INTO `schedule_job_log` VALUES ('2101', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:53:00');
INSERT INTO `schedule_job_log` VALUES ('2102', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:54:00');
INSERT INTO `schedule_job_log` VALUES ('2103', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:55:00');
INSERT INTO `schedule_job_log` VALUES ('2104', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:56:00');
INSERT INTO `schedule_job_log` VALUES ('2105', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:57:00');
INSERT INTO `schedule_job_log` VALUES ('2106', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:58:00');
INSERT INTO `schedule_job_log` VALUES ('2107', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 15:59:00');
INSERT INTO `schedule_job_log` VALUES ('2108', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('2109', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 16:01:00');
INSERT INTO `schedule_job_log` VALUES ('2110', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 16:02:00');
INSERT INTO `schedule_job_log` VALUES ('2111', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 16:03:00');
INSERT INTO `schedule_job_log` VALUES ('2112', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-17 16:04:00');
INSERT INTO `schedule_job_log` VALUES ('2113', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 16:05:00');
INSERT INTO `schedule_job_log` VALUES ('2114', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 16:06:00');
INSERT INTO `schedule_job_log` VALUES ('2115', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 16:07:00');
INSERT INTO `schedule_job_log` VALUES ('2116', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 16:08:00');
INSERT INTO `schedule_job_log` VALUES ('2117', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 16:09:00');
INSERT INTO `schedule_job_log` VALUES ('2118', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 16:10:00');
INSERT INTO `schedule_job_log` VALUES ('2119', '6', 'testTask', 'test', '简单测试', '0', null, '1003', '2018-01-17 16:11:00');
INSERT INTO `schedule_job_log` VALUES ('2120', '6', 'testTask', 'test', '简单测试', '0', null, '1002', '2018-01-17 16:12:00');
INSERT INTO `schedule_job_log` VALUES ('2121', '6', 'testTask', 'test', '简单测试', '0', null, '1011', '2018-01-17 17:46:00');
INSERT INTO `schedule_job_log` VALUES ('2122', '6', 'testTask', 'test', '简单测试', '0', null, '1007', '2018-01-17 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('2123', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-01-17 18:02:00');
INSERT INTO `schedule_job_log` VALUES ('2124', '6', 'testTask', 'test', '简单测试', '0', null, '1012', '2018-01-17 18:03:00');
INSERT INTO `schedule_job_log` VALUES ('2125', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-01-17 18:05:00');
INSERT INTO `schedule_job_log` VALUES ('2126', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 18:06:00');
INSERT INTO `schedule_job_log` VALUES ('2127', '6', 'testTask', 'test', '简单测试', '0', null, '1013', '2018-01-17 18:07:00');
INSERT INTO `schedule_job_log` VALUES ('2128', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-01-17 18:08:00');
INSERT INTO `schedule_job_log` VALUES ('2129', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 18:09:00');
INSERT INTO `schedule_job_log` VALUES ('2130', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 18:10:00');
INSERT INTO `schedule_job_log` VALUES ('2131', '6', 'testTask', 'test', '简单测试', '0', null, '1004', '2018-01-17 18:11:00');
INSERT INTO `schedule_job_log` VALUES ('2132', '6', 'testTask', 'test', '简单测试', '0', null, '1017', '2018-05-14 12:08:00');
INSERT INTO `schedule_job_log` VALUES ('2133', '6', 'testTask', 'test', '简单测试', '0', null, '1012', '2018-05-14 12:09:00');
INSERT INTO `schedule_job_log` VALUES ('2134', '6', 'testTask', 'test', '简单测试', '0', null, '1013', '2018-05-14 12:10:00');
INSERT INTO `schedule_job_log` VALUES ('2135', '6', 'testTask', 'test', '简单测试', '0', null, '1011', '2018-05-14 12:11:00');
INSERT INTO `schedule_job_log` VALUES ('2136', '6', 'testTask', 'test', '简单测试', '0', null, '1012', '2018-05-14 12:12:00');
INSERT INTO `schedule_job_log` VALUES ('2137', '6', 'testTask', 'test', '简单测试', '0', null, '1015', '2018-05-14 12:13:00');
INSERT INTO `schedule_job_log` VALUES ('2138', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-05-14 12:14:00');
INSERT INTO `schedule_job_log` VALUES ('2139', '6', 'testTask', 'test', '简单测试', '0', null, '1012', '2018-05-14 12:15:00');
INSERT INTO `schedule_job_log` VALUES ('2140', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-05-14 12:16:00');
INSERT INTO `schedule_job_log` VALUES ('2141', '6', 'testTask', 'test', '简单测试', '0', null, '1013', '2018-05-14 12:17:00');
INSERT INTO `schedule_job_log` VALUES ('2142', '6', 'testTask', 'test', '简单测试', '0', null, '1009', '2018-05-14 12:18:00');
INSERT INTO `schedule_job_log` VALUES ('2143', '6', 'testTask', 'test', '简单测试', '0', null, '1054', '2018-05-14 12:19:00');
INSERT INTO `schedule_job_log` VALUES ('2144', '6', 'testTask', 'test', '简单测试', '0', null, '1009', '2018-05-14 12:20:00');
INSERT INTO `schedule_job_log` VALUES ('2145', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-05-14 12:21:00');
INSERT INTO `schedule_job_log` VALUES ('2146', '6', 'testTask', 'test', '简单测试', '0', null, '1015', '2018-05-14 12:22:00');
INSERT INTO `schedule_job_log` VALUES ('2147', '6', 'testTask', 'test', '简单测试', '0', null, '1012', '2018-05-14 12:23:00');
INSERT INTO `schedule_job_log` VALUES ('2148', '6', 'testTask', 'test', '简单测试', '0', null, '1011', '2018-05-14 12:24:00');
INSERT INTO `schedule_job_log` VALUES ('2149', '6', 'testTask', 'test', '简单测试', '0', null, '1009', '2018-05-14 12:25:00');
INSERT INTO `schedule_job_log` VALUES ('2150', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-05-14 12:26:00');
INSERT INTO `schedule_job_log` VALUES ('2151', '6', 'testTask', 'test', '简单测试', '0', null, '1025', '2018-05-14 12:27:00');
INSERT INTO `schedule_job_log` VALUES ('2152', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-05-14 12:28:00');
INSERT INTO `schedule_job_log` VALUES ('2153', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-05-14 12:29:00');
INSERT INTO `schedule_job_log` VALUES ('2154', '6', 'testTask', 'test', '简单测试', '0', null, '1009', '2018-05-14 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('2155', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-05-14 12:31:00');
INSERT INTO `schedule_job_log` VALUES ('2156', '6', 'testTask', 'test', '简单测试', '0', null, '1013', '2018-05-14 12:32:00');
INSERT INTO `schedule_job_log` VALUES ('2157', '6', 'testTask', 'test', '简单测试', '0', null, '1011', '2018-05-14 12:33:00');
INSERT INTO `schedule_job_log` VALUES ('2158', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-05-14 12:34:00');
INSERT INTO `schedule_job_log` VALUES ('2159', '6', 'testTask', 'test', '简单测试', '0', null, '1007', '2018-05-14 12:35:00');
INSERT INTO `schedule_job_log` VALUES ('2160', '6', 'testTask', 'test', '简单测试', '0', null, '1014', '2018-05-14 12:36:00');
INSERT INTO `schedule_job_log` VALUES ('2161', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-05-14 12:37:00');
INSERT INTO `schedule_job_log` VALUES ('2162', '6', 'testTask', 'test', '简单测试', '0', null, '1008', '2018-05-14 12:38:00');
INSERT INTO `schedule_job_log` VALUES ('2163', '6', 'testTask', 'test', '简单测试', '0', null, '1014', '2018-05-14 12:39:00');
INSERT INTO `schedule_job_log` VALUES ('2164', '6', 'testTask', 'test', '简单测试', '0', null, '1009', '2018-05-14 12:40:00');
INSERT INTO `schedule_job_log` VALUES ('2165', '6', 'testTask', 'test', '简单测试', '0', null, '1009', '2018-05-14 12:41:00');
INSERT INTO `schedule_job_log` VALUES ('2166', '6', 'testTask', 'test', '简单测试', '0', null, '1008', '2018-05-14 12:42:00');
INSERT INTO `schedule_job_log` VALUES ('2167', '6', 'testTask', 'test', '简单测试', '0', null, '1012', '2018-05-14 12:43:00');
INSERT INTO `schedule_job_log` VALUES ('2168', '6', 'testTask', 'test', '简单测试', '0', null, '1011', '2018-05-14 12:44:00');
INSERT INTO `schedule_job_log` VALUES ('2169', '6', 'testTask', 'test', '简单测试', '0', null, '1008', '2018-05-14 12:45:00');
INSERT INTO `schedule_job_log` VALUES ('2170', '6', 'testTask', 'test', '简单测试', '0', null, '1009', '2018-05-14 12:46:00');
INSERT INTO `schedule_job_log` VALUES ('2171', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-05-14 12:47:00');
INSERT INTO `schedule_job_log` VALUES ('2172', '6', 'testTask', 'test', '简单测试', '0', null, '1008', '2018-05-14 12:48:00');
INSERT INTO `schedule_job_log` VALUES ('2173', '6', 'testTask', 'test', '简单测试', '0', null, '1009', '2018-05-14 12:49:00');
INSERT INTO `schedule_job_log` VALUES ('2174', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-05-14 12:50:00');
INSERT INTO `schedule_job_log` VALUES ('2175', '6', 'testTask', 'test', '简单测试', '0', null, '1011', '2018-05-14 12:51:00');
INSERT INTO `schedule_job_log` VALUES ('2176', '6', 'testTask', 'test', '简单测试', '0', null, '1007', '2018-05-14 12:52:00');
INSERT INTO `schedule_job_log` VALUES ('2177', '6', 'testTask', 'test', '简单测试', '0', null, '1009', '2018-05-14 12:53:00');
INSERT INTO `schedule_job_log` VALUES ('2178', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-05-14 12:54:00');
INSERT INTO `schedule_job_log` VALUES ('2179', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-05-14 12:55:00');
INSERT INTO `schedule_job_log` VALUES ('2180', '6', 'testTask', 'test', '简单测试', '0', null, '1010', '2018-05-14 12:56:00');
INSERT INTO `schedule_job_log` VALUES ('2181', '6', 'testTask', 'test', '简单测试', '0', null, '1007', '2018-05-14 12:57:00');
INSERT INTO `schedule_job_log` VALUES ('2182', '6', 'testTask', 'test', '简单测试', '0', null, '1008', '2018-05-14 12:58:00');
INSERT INTO `schedule_job_log` VALUES ('2183', '6', 'testTask', 'test', '简单测试', '0', null, '1013', '2018-05-14 12:59:00');
INSERT INTO `schedule_job_log` VALUES ('2184', '6', 'testTask', 'test', '简单测试', '0', null, '1011', '2018-05-14 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('2185', '6', 'testTask', 'test', '简单测试', '0', null, '1005', '2018-05-14 13:01:00');
INSERT INTO `schedule_job_log` VALUES ('2186', '6', 'testTask', 'test', '简单测试', '0', null, '1008', '2018-05-14 13:02:00');
INSERT INTO `schedule_job_log` VALUES ('2187', '6', 'testTask', 'test', '简单测试', '0', null, '1008', '2018-05-14 13:03:00');
INSERT INTO `schedule_job_log` VALUES ('2188', '6', 'testTask', 'test', '简单测试', '0', null, '1034', '2018-05-14 13:47:00');
INSERT INTO `schedule_job_log` VALUES ('2189', '6', 'testTask', 'test', '简单测试', '0', null, '1017', '2018-05-14 13:48:00');
INSERT INTO `schedule_job_log` VALUES ('2190', '6', 'testTask', 'test', '简单测试', '0', null, '1017', '2018-05-15 13:56:00');
INSERT INTO `schedule_job_log` VALUES ('2191', '6', 'testTask', 'test', '简单测试', '0', null, '1012', '2018-05-15 13:57:00');
INSERT INTO `schedule_job_log` VALUES ('2192', '6', 'testTask', 'test', '简单测试', '0', null, '1009', '2018-05-15 13:58:00');
INSERT INTO `schedule_job_log` VALUES ('2193', '6', 'testTask', 'test', '简单测试', '0', null, '1011', '2018-05-15 13:59:00');
INSERT INTO `schedule_job_log` VALUES ('2194', '6', 'testTask', 'test', '简单测试', '0', null, '1025', '2018-05-16 11:53:00');

-- ----------------------------
-- Table structure for solr
-- ----------------------------
DROP TABLE IF EXISTS `solr`;
CREATE TABLE `solr` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `title` varchar(2000) DEFAULT NULL COMMENT '标题',
  `name` varchar(200) DEFAULT NULL COMMENT '称呼',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of solr
-- ----------------------------
INSERT INTO `solr` VALUES ('18051515201153644734', '150', 'zookeeper', 'zookeeper是一款分布式协处理框架', '2018-05-15 00:00:00');
INSERT INTO `solr` VALUES ('18051515425082279162', '230', 'redis', 'redis是一款高性能的key-value缓存工具', '2018-05-07 00:00:00');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `pkid` varchar(20) NOT NULL,
  `sname` varchar(30) NOT NULL COMMENT '职员姓名',
  `sex` varchar(2) DEFAULT NULL COMMENT '职员性别',
  `age` int(2) DEFAULT NULL COMMENT '职员年龄',
  `create_date` datetime DEFAULT NULL COMMENT '创建职员时间',
  `createBy` varchar(60) DEFAULT NULL COMMENT '职员创建者',
  `update_date` datetime DEFAULT NULL COMMENT '更新职员时间',
  `updateBy` varchar(60) DEFAULT NULL COMMENT '职员信息更新人',
  `police` blob,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('18051413573214791081', '张三', '1', '22', '2018-05-07 00:00:00', '张三', '2018-05-01 00:00:00', '张三', 0xFFD8FFE000104A46494600010101012C012C0000FFDB004300080606070605080707070909080A0C140D0C0B0B0C1912130F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F27393D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232FFC000110802AB040003012200021101031101FFC4001C0000020301010101000000000000000000000102030405060708FFC4004610000202010303020404040405030203090001021103042131124151056106132271328191A114B1C1D14252E1F007233362F1151672243443639425354553558283C2D2FFC4001801010101010100000000000000000000000001020304FFC400221101010101000203010100030100000000000102112131031241516122328191FFDA000C03010002110311003F00EEA248491248F23D86892A12434031A408690021A40874008690050050E80601430400030A1D040868120A0043002874080600001401430A1808614300A04800006000000301050C002860010000140000000000000000218801880004000000000000000000000000002001808600000000000000000000000000200001000800018008000000000041601458086100001000001498000080000060000218804C4C6C4C04218804E84362650B6130600458893134406C2B00602B16C000200061452621F702855B8A8614411A0A18980A90B62445F202A06140C042636005E90D21224881A4348489A0048120448028690500050D050C0121D021EE50921A01D000C431C00C4865403A01A0048281219021D050C007408000100C05430000A01800000000C0000000A000008000000000000000043100800004000000000000000C00000000004000000014C04010C04000310C0000403100580082C40310005001FE2FBA00100010020B130000000000018080062600002188000000600000263132819163EE26400A86201342689322C04D11689B22C08B11264590260C2828042255F9851446844A828411A0A24201508603AA4268620150340C18116263620131126440D29124243440D124244900244921218021A40868006810140348121D00863A028280121800C06904000300430000185010143000001D00000C00430000A0000000000000000002A0000000000000100000008000281000400000000000002000B1000C4001400800600040C0432A000000010000AC00281276BF663B22BF135E52604800004FB3F0C18A5BC65F61DDEE0020020424EDB5E3906DB74B64B96092526970806000000000000000000002188A0000206001600C4020100C540000002A10E84C04C4C6C4C7045A234498011A0A24D0A808D6E1436840141EE00409886C4C05F6006D014210C440818C4E8290A891160262A24C54068449091248068684892018021A004892121A00180CA0A1801600280600860010E80100021A01A00A1A41404050C0600800600000000000000000000000000000050000040000000000021880000400218828000080000000040002020043115400C081003136FB72F801B696DDFC05FF00DA0925C7EA0017FAF819174D531A6DADF95B32A180BF9109E58415B9A4BCB7B01315B7C2BF7EC659EBF4505793538E2BDE68C393E28F41C529465EA38AE3B3493743C9D8EC7D4FBA4FEC45DBDFAB65CEDC9E7B2FC6BE850A51D5CE6B9B8C2E88AF8E7D1BBE49A4DD5B86CCBF5A9D8F49F52EC9AF6D88B9A528DDADDADF63CFC3E35F4592DF5325BD2B83DC9BF8AFD26718BC7AA8B6E4B663957B1E840F3EFD7B4791A7A7D4E2734ED41CA933760F535A8C7D78941BE1E372A9221D745EFB79D88C778A7EC531D5A69394251F668943341AA6EA9B56F802D22DB5B2E5EC893229F549BECB6B22849254B840BF14BF21897E297DD20180080602001800140000C8010C4000000000000218008000A130002040C0008B13436051060C6C54021771805210C444021B06022249910A1898D880400C088400014086002A10D801A122488A24806892228920044909224801020486807D80680A0001A2806001050D002001850C006014400C06800006000080000060201800806002000000000000000000000002800002100C400218800431000000000082810C004000408600540000149F20DB4AFB77FB03E2D760000219670C18E59324D42095B6F848F29EAFF1CE974B1963D0A59F26E9CD2FA532C96FA4B647AACB9B1608DE49A8AF0F9670F5FF001568B47271F9914F66928F549FE5FDCF9DFAA7C4BABD6C9BCFA9694B7F978FE95FDCE1CF5991CA4A09DF6A7B9B9F1FF5CEFC9FC7BAD7FC739DCA4B4D8B2B4ED2791D2AF34BFB9E6F55EBFADD429396549778A95B7FCCE24F2648E14DCD46591B4D376D457F733CF3C2118B52EA6B6B5E4DCCC8C5D5ADF3D4F5A939E4BBA95C93DCAB34B2E1938E54E33AB5172A697B98E3ADCAB22718AD9DAEBFA9DF92C6F2E7BC8DB83BB74ED7DFCFE46912F9B296DF35B6FB28A763BCD275D5D517BB4E34C8D4E31A5916FCB71A5F92FEE535394BFEADB5C7D4455D0967C72A528D374EA56A88CB53A9C5369B769B54D5114FA5D649C722EF17FDC96475297E24A4F87F545845F8FD464E9354FB37B23A5A6D7E5975FF00CDCB19A5716A54ED1C5C7A67A87D18F69DD28B75BFB7BFF3366271C381637D5194AA3D72D9464BFC2D7B81EA741F12FA962874ACBF31A69D3DA4D7F53BBA0F8C7E6E458E787ADB6DBE95FD3B9F39D33CD8F3A83525F554325D24DF09FF0043A5FC3E6C128E6C79694A6D39476A7DD78F725C4AD4DD8FABE8FD4B06AE3D5A79C943FC517BA4FC1D18658A514DAAAD9AE19F37F43D7E5D17AA64C79B2358D45B725BD7F73DBE87D4F4FAC52C527184E349D3B4FEC72D66C74CEA5755BF6BFB118B4E2DAE1B6CAA378A2EE6E514AD3E4B1DC62DABD953B32D24C49DFD84B7AF7FE44935BDF15FA11400000C0000018000008000000A10001000005008008000100086051160C6260458A89342A01508977101115120682A201402A13224D912293540C02804C54310008600200000A10C00D086810D103434086806868102018D02432800068A8121A01A402A1D021D0086143200614000310C006000030000000001886000000000000218008000A000008000000000000040000200000000100030060020000A00008800045500001000802838BEBBF12E93D162F1B92CBA96AD628BB6BEFE0E5FC47F18C747D5A4F4C9C679DA6A5956EB1FDBDCF9ECE7932CE7966E4E5376E72777FDCE99C77CD73D6F9E23A1EAFEBBACF54949EAB2B50BB5860E925EE7127294935FF4F1F092D9B25972A8C1A4F756DCA5B2B39B9B51271715B5F327CB3AC9C72AB734E116E2BA9AF0BFAB324F33FC31928A7FE182DD906DCAEADADADBEE5B8F14BAAA1176F66D6EDFB220A9A9CFA138B6D2692E689C313B9416F7CC62B8FCCD6F1470A5D524DB54E29DB7FE85597338524D24BFC20E1470C71DB73E396D89EAB0E3926B349B5CD2DBFDFD8AFAE191BB49784E75FA0B225D5F4C5CFDAB75FEFD80BDCB0658AC98E94DBFC12DD3FB3FE8CAE7822A9FCAE86F7BBAFE647162C53C952CEA1171BB78DECFDD73F9AB36E39668E358B2C63962AE9A95A6BD8BC3AC8B066E97D6B34555A9A8DA4BDFCAF7EC5905386253C91F9B1B50947BD79F6FBF73A7A4CB0845E994E6B16449493DA50FBAF1EE8D51C58A1862B2423971C6350CB1694FA7FCB5C3FB3E47066D362C79A2F22C89B8A6BADC76717FE65FEEB945F2C0F1CA6B3E9D4E5197CB9E26E9E555FE6F2B94532C987D3B33BC91C9A5D445AC79D269C5F892E7DB7E08AD4AE9962C97192A71927BA6BFB72809BCDA6860962C4BE6E2C8BE626F6924B98BF276BD27D4639239704A18F23CBD0E1171D94F8E3DE3CFD8F293CAF1EAA4FF000CA3536D6D7E7F527A4D64B4FACC79A0EA516A55EF65EA3D66B7260D2EAE4F413FA3149CB1C9ECD5D5ADFCF05DE999E70AD4E1C4927350F956D251775F927B1E3F26AE599CA4E74E72A937E2F63ADE9DAD962C718393572B696EBA39FE62F959E1F56D36A32C61A7C5D1D2F226E78F9E966C84A328C71A95A576EF9A3CC68756B3CB2FA8CF511C5149C6137CC9D2B5FD0EE6927F330E3EA71519AA8A5C35FEFB1E7DE795DB37B1B14E53FA94693E2BC1293A54B97C209C9412B6B756BD90934EA49AA7C37DCCB49D7FE40574DAE6BBAE0645301000C04050000102000000002804004000014021810200001098C450828000421B10007202015099213013224989854406200621BB0022C062204143DC450500001A50D09124643434244900D0D09124008684346814304348201802018D08680286004000C0006000030000001800000000000000000000000014021804200000000000000010C400218800000040000000000218008000004026D2E580C4177C2BF7E115B9BBA5BBF6D9202539C60B77BBECB76CF0DF14FC53965297A76866A29BACB386ED3F17FD8D1F147C42B0465A0D0E652D44B6CB923BF4C7C2F0787B8C25D0BEA93E1B7BD7B9D318FDAE7AD7E4553C5D31573BBBBB776519B3C70B934F75B2A1E7CAF883726D5F52D9518A6D39527D6DA6A35B2FF7EE767351972E49CDB9DB5CF42DF72BF9537252CABED15BA4684A5156E93AE16D4BFDF72CC1A79E677BC61B7D4B96414E2C13CADA8D28C796F85FEBEC5AD430627D32E95C3935BB2CCFA9C7830A8C12508DA55DDFFBEE7272E6CDA996CB65C7D88AB32EA525D3154978D9FEA6579257718FE66BC5E9F972537697B1BB17A537CC5B7E5ED44EC5FADAE32C93BA6F6E1A44E191F4B4E2A69F67DBEC7A087A14A7556DF6B8EC5CBE1C9CA3BC575794A87DA1F4AF3B19B8730EA83E1356AFC047517F4A952BDA2FC9DE97A24E11716DA7E7B1CBCDA19C64E3284934DADB72CA5C538658E597FCE9CB1E55BC1A569AF7F1F7E0D90D4E5846494D4E6F69C5F2FF002EEBDD1CC58271A6BEB8ADD2E1A34C162CB18C66DC669FD0DBA6AFDFC7B065B659F067D3A84F1C657B36D5BFF5AFD4C738AC7F42B7D2B693DFE909E29AC8E19125295549ECA4FF00A329C929397CBCB16A714BA5BD9944A72729393FA95249BDDB8F833C257D29EE9BA6BEC39CA94578B7EE56A72C792391422D2B95356A822FDDDA5CBBFCD1AF4DA958A2F152B96EA4B9A39F9659A9CA70E96DB7D29524DFF4F6162C8DCADCAA82BDFF00A249EA22A3A46E4F14AD45C6DB93A3DC69312F49C4F0659C67931A7BF55ADCF8E6835F9F459D64D3E4E9A7769F07B1D0FC4FA192AD74B50D3DDC93B4DED6FEC6773AD66F1EF74F37A8839F4B494ADB9EDD5EFF006F6345BEA6DCB76ADDEE72BD3B5BA2C987E661CF29296F14E5B35E4DC94E591CA09B492A7C2671B38EB3CB54135BB769F2BC12B69EFC32316E704DED7CA5D8925DC8D18077BEE20180080602020001880000000000000000040160020130000028040C3701086C400C4313010860C29098C181101D0805403100086140210D800A843101A9124451246434491144900D0D090F628680068A0248543080680006860040000C00028600300000018000000000000000000000000140000400001500000080000000000430010000080000400000000002000013692B1907F892F7B01D37CBFC90B68F0B7E6C6DA4ADF05339AE94F23A8AE15D580E536D377B2E6B83CF7C47EB7FFA6E9DE1C4DCB3CD3A8F68FDFF00B177AEFAFC7D374D271A8CF88DAB6DFB2FEE7CE73EA72EA734B3659B96495BB93BA379C759D6B8AE59272949A9465924DCE52970BDD98F2E551824ADDBE5ECE6FDFD89CDAAE985D276EDD37EFF00E853D0A5194F25A5B34AB77FE877715493C89B73B82DDB5B5BF1F61A8462E4DC1B6FB71F6FC8B5D2A8C69E47BD56D1F77FD88B70846D36E095B93E5B2511860539272A94DAB515B261EA1AB5A7C72C3D4AF6B6BB7D8965CF1D160964C9B6692E1F28E4E1C3975D9D4A56EDDA5E08D73F10C78B2EB269B4D2E12E5247A6F4CF4094E9B8BDFBB3A7E89F0FB7D2DC3F368F79A1F468E38C5A85FDCE5AD3B67E3E7B798D27C3B18A4DC2DAEEFB1D6C7E89151551E7F267A7868D41574A55FA135A7BA556BB1874F0F36BD1A118EF14D787C89FA674EEA2E35ED67A5969D52DB7FB14CF04971C760AF3197D392524A29A7BBDAD1C8D4FA2426E5D10DDBECF83DB4F16F549D79E4A65A684D36D53E2F812D4B257CDF57E8928EE92525B464955FDCE66A3D2DFD4A50B75BD763E9FA9D24649AE9A6F6BE53479FD6FA74B164EB84778EFB6ED1B9B73B878A5A79638D25D4A9C7A5ABDBFB94E571CF15873E16E29B50C907F527FEFF23D367D32AB50A4DDDA5B197F80C5195E4937D34DCBB347495CAE78F3B0D14BA9AA538C536A754BFDFB1A1683EA58F1CA108B57394B74AFCF8FB1AB3B963D4C9C62A2924D25C5FB98B3EA64D3C77D0AD3E9BA5FEFEE561665F9B51C53CB09A8B69456F451F2F164934A14D6D4B6DFFA8A33738D7D377CC785F73A7A7D32CB866F23E8708A9493E52DBEA4CA39EF14E2ED41F4ADF67698F0668CA7D136D6F524B66BEC7A1C109E8B0C323863CB359149E2AB6E2FBAFF00B5FF00733FAA6831E1D54357086258A7B2E85705E3F27E4715BBD316AB4F08E6C5B6149253AB8BAF1EFE51EEFD1B5B3D4639432252CD1A6DDF4BF63C7FA6FA869B4B8278F228FC9CA93753AF972F1F9F9213F59C9A4D6BCDA7F9937865736F978DF28CEB3D8D675C7D134F92E52555F56F17B34CD29A6ACE568B52B5BA4C7971CA3353829C322D9B4CDF8A6E514DBB4F9ADA99C1D9736973FA06FF006FB82AADB87E008000100C400000000000000000002060002000010C4001600509898C40021B130100C4C040310520A43100098C005FC84F91898080018008000560C1880D68684868C8921A121A28921A121A2811244512410C28068010D00D100003001D00000C000000600003000000100C0043002843000010C0040300840000000002018800000000000400200001000001002188A001000119B5169B7B2B1B6F85C99B53351CB18ECDA8B9B4F848073C9396D0A57DD9CDD7FA8E2D1E2CB3535D58D7D7965BA4FC47DCB67924F13EB974A92B94DBA7F91E0BE23F595ADD4474DA58A5A5C0DD3EF297793359CF6A6AF1CFF51D6CB57A9966C8DF4B6FA6376D7FAFB9CEEB7965F4ED05BA7DBFF045BF98F7571BA8C57F8DFF0062CC5153B769413A727BAFF7EC779E1C11F957F5D395ED1BEFFE83941A96FBE44B9E547FD4B14251973D2F9B7BBAF2FEE519B35CBE5A4E976F2CAB109C947AB1E37B37726F7B6511CD08F567C8938627508DED29FF0065CB0C925397C98CFA52DF2CF9515FDCA3169B27A9EAA38B041AC305508F34BFBBE4CD593B544219BD4B55FE269BBDCF77F0FF00C38D74B70DF6EC747E1CF83DE38C32658577DCF7BA4F4D8E9E092825472D5EBBE73232FA7FA6430412514BDE8EAC30A85B5FE85D0C5D31DD0DAA5B19E35D57D355B7E43E85E29F259CA7FC88B7CA5FA320A9C77E29714552826DF6F72E6F76FC762B6EDB5DBC019278F7AE7C14B8269A7C1B66AE3BF14513839477E3F40AC13C49EF5B709518F538E128BEA7C77E1A3AB913BAEF462CF0EA4DA5BEDCBD98579AD4C31C5C97D2D794EAFF00238DA9D32945BC6D38BD9B6EA47A4D5E38DBB8B4FBB5BD9C7CD085BAE9B7FE24EB7359AE7A8F3BAF4E9B85F545571BD1C0CD18BEAA56F94DBEC7A8F51C2DC9B6EE4955A3CDEA62A0E51ABEED9D6571D465C5965865B2AB67A0F4AD4C2E2F242F1C6A16F88DFF0047DFF5EC79D9AA69D6CF9B377A6656B50E09B6E5555DEBB1A61EADCE58612D2E38C2DC6F1CDEEDC6F78FDFDCCDAED6C9E970C273EBD2B4E15254D5BE3EDE3C3B289EA63D54E3D1FE19EF693FF32F7FE66086570CD9743A99D62CB1FA5DFD3D5FE17FD0BD12D4E48E9E515867D781C52EB71A6A55BC5AF70C5AB9C66975B6DD74B5FC8C5972E6D1CB2E3936F0678C7E7637C4D26E9FDE2F70D328FCE787ADB4D5C1D73E0948F79F077AAB8669FA7B69E3927974FBDA4FFC50FCF93DCC271791B4EBE62EA49F0DF73E2DA5D6E5D0E6C3ABC33E99E39A96DDDAE4FAF687578B55A58EA3134F1CEB245ADD53E551C77397AED8BF8E9A6E2DFEE8959553554E9AEFCA68926D731D9F8EC61B4C0134F8DC0800000000000000B0010000000800400C00000004C0194260C040000000C431000AC620010000050000843105260D0C4100A8620A04C05606C434243464490D090D1434340868A8092121A00180D10086801002180C0000600000003018000000000140000000000000000000108062000000010C40000000000400030010862280431000001020002840322DD2F2F84BCB0219722C51EA6AEF6A47333E550728B7D7A8CCBA9C5768AFE869D567508CE57B457D52EC8F27EAFEA72D2E9B3655351C995A49276FA7C3FEC593A8ABE23F5B5822F458269E5714B2E54FE982FF00243FAB3C2E49F5B4DC9B8B6DF4F761A8CF2CD964DBDAEDA41A782946527BA8EF6F64CEF9CF1C6DED590C6A118BC9F8A5BB6B7518F8343E9C318CB2A57778F1A5B2FF007E09E34B0C7AA7F5CAEE96C51972283FE232454A72DA0BB45FD8D21E7C8A295ED37BD5D98B24D4524939E6C8EB1C7FDFF3279671C70964CBCEEE5E0C89E59CDA6BFE7E5DA5FF00E5C5F6FBBEFF00A117DB3EA723AFE1B03EAA7D5926BFC4FF00B7FBEE7AEF83D2D26583CB0849369BB6932CF44F833F8F829A9F44AEFEA5699DD9FC27A9D0CE31CD8BAB1BDFAE0ADC3DD18B657499B1F45F4BCDA2D4625F2E552B569EF475FF00868A5691F2FD063F53F4BD427D78F3E2554DFD32AF37B1EEBD2BD5A59925395A5B38BFC489C5B6BA92C0AB8299E17FA9D05D328DA777FB109C153FA7F3271657367069ABFD4AA9F7EC6E9E3575CFB144E3D4DD56DDFB19B1A959269EF4FED652DB6D56FEFD8D33C6DEEF7F0FC14CA2E3B7864695B7DDBB7FB154DF6BEDC939B6AED19E6EBB11509A4FAB6FB7933CD5AA49F1BA2C93EEF9299C977E5F0C2B0EA61156EA92F071B529A7269452E6973F99DDCE935C5B471757825293BFC29F0B6B08E06AF14A71B54A0F8AE5B3CF6B74D183D9A69DF1B9EAF509755524945D3F27035F1A7B2557C5773A66B96E3CFCF1A5174B8D9BF628539E0CB1C98E5D338B4FA97835E55D2DB4F6926A8CB35194D2FF0032AFB1D23858ED669A9C965C76965574B7A7DFFB9972BF9BA7FAD7D589B56BC6DFF923A0CBF334EF0CFF001634A516B94BBFE85935D1A99C3B492927D8AB11D42792307965BB6D293E14B6FD9A31C94B0357169E39557746A83797064C6D5A4B6496F68AF1CA39E2B1CDDCD24A2F8EB8F6FCD7EFC04688C9658B6D2B9BBDB657FEA7D07E06D67CCF4C9E9A4EDE193493FF002BDCF9BE14E1F43DD3E1F1C7F53D5FC19AC783D5BE45FD1957E6DEE73DCEC6F1EDF528B74D3FB5F626924DAECF7A2AC726D43E9B528ADFCB277D0D269D717C9C9D93693E7F27DC375DEFDBB893BE091024FF002F61D8987D806046C60000201898000080000002800000040C0450086200000DC0043EE20010C4C05600D000005000843620A4036208188601516224C406B44911449190D0D09122868684868A86868102018C10103000018C000600000310C0062180000000000000000000140000400001508000000000043100000000001002188A010C4002000000001003744777DE9785C80DB4B97453966EA4A0B7E137B16ED14DD71BD944E4A1194E4E9462E4DB038BEADA9E85874B069E4C8D36B84BC7F73E75EBFAE5A9D5FCBC12B51B49AE17FDDF99E8BD7FD4DE1D2E7D5B9279B2BF978135BA8FF89FE7C1E115E4C8D3727DE72EEFD8EB89FAE7BBF8961C4B349F3F2A2F777BCD9B936A514BA545715C2FF52982724B0E3DA97D534B64BD8B2738C12C78A29492B56F64BFCCCE8E69CF254DB9B8A8C526D35C22124D7FCCC94A4D5F4BDFA3FD7F90E1154A936A2FAAE6B772FF0033FB78316B35309A939393D3E3D9EFBE497F97FB8567D4E751E9CCD2B6FF00E541F7AFF13F6F08E9FC3DE9D9357AA8E4716D36DDBE59E71647A8D5A9649257BBAE12F1F63E99F0BFA9FA56970ABCB38D2E5E3B4675DFC6FE3E77CBDBFA368D69F0469535C9DF718E4C5D328A6BBA383A3F5CF4FD5E28BC3AAC2DC926A2DF4CBFB1BB1EB7A724537F8BC6C99CBBC76E756E7F4C8E5C71A8D5269A5DCC5A4D1CF4DA95173928AD937BAFF6CF418271C904D3B4FC16AD3C6538C92DED32B37FD68D2351C514DEED70FB22F9B556FF0072B841C5D728B1D737B2E3C1A8C33CA29BDD6D5C154D5A55DF62CC938C399257FB1967A9838B5D5BAD88D1BC6A9BECCAB2E24927C5EE51A9F508E08DF5477DEEEF6393A8F8930C64E324DA5BB69EC87163765C6DB7E53FD8C7962EDAF1DCC72F88F469EF274FBDF211F5BD1EA126B2C53BE1EC678DCA9CEE356EADD22A9357BF6FDCB7E762CAAA338BF6B2B9AE95BC6D138BD553492B4B9FD28E7E7C49DB775E0DEDAA6B855C228CB0D9B4AC83CE6B216E9FBA3CEFA8B518D35B3BA67A9F504A2AD70F74798F5049A9269B4F755CA66F2E7B79CCDDE2FBEDE2999136F2A55BAE0DBA9838C95EE9B54D70CC4A5D3953AB4A4D34F83AC70ABB1B5875D16F68B96EBFED674942D615276D49C2324B87E0E56A6319CA2E169D2FA5BDFBF0CEAF5B9604A49AB92BF29ED4CA463C6DE3CD2524D352AF05571EA941ECA49F0EA9F935EA1296694EADA6BA9787E7ECCC99129605956FBB8C9AECFF00D4895B29CB1AD4BFAA32928E44B67196F4FF003FEE6CF4ACF2D27AAE9B2C29B8E44D35C34CE569B3B87BC5A71924ADD3FF005DCDB4E325525D4BEA4970E3CDA2558FB6619B9E970645C349AFCCD15CDBBF2737D173C753E9583A5FE2C319453F074A2FAA09F94707A057EA87D80100C400400C40031000008620001880280620006000210D88A0100000007B80087620100000980C401B8860020A00B01089313010000520062035A2488A268C8112445124683434244904304090D1031A10C0062180C00680000006003000000000000000000000000028000403100040000000000020000000200000A100000988620000000100102E64FD804D3BB5BBEEBC8269AB4F628534FA5D3E4E67ACE6962F4ED42528A738A8A6D709D59D3934A2DADF8A3CBFC55AE8E934924E6BE63C89C63CB75C167B47CFBD773FCFD73829B70C6E96FB598E305054FE94B66FBB7E06EE591E6C8DDB93693EFEE427D5925D30AA4EDBBE0EF27238DF69BC8E578F1C526F77BF0BCB25834EA51B936B0DA7293E7230C1820D49CA558E34E4DF764F579DF4CA974A8D5BADB1FF0076FB2FCD944753A88B524A4E104EA525DBFD4F3DA9CCF579E38E11E9C704EA2B84BFBB2DD5EA6535D30DA296CBDBC96E8B4BD185BE6725FB84F6CFA4C0F3EAA31A6B1F525B2E123EB0BE0FF48D1FC1BA9F55CDA7CD973E2C0F246F3349F8381F0E7C311D4634E71AEEA5EE7BFC1A4D6693D272E8125ACD167C72C73C3355249EDF4CBB7E64CEA3771E1F2BD768A5E8FE938B571D62CB2A8B963BD9B7FEFB1D0F877E28C8E50C7932CFE44A4974E476F13F29F7462F58F853D6B0C94678A59F0E35516A493AF7ED7F6337A4FA2396A14B5D25A7C714E31C4DFD536FFA135CBE173F6CD7DDFD273B969D5BDD3AAF73B585BD9BDECF2DF0AC734BD3312CC9B9C62A3293E5B56BF951EA712A692EDBB39BADF6D6936BF915E7771D9D4578D9B09CD46318F1D524BF2DCC5AAD5A6A496C96CA875951972A8A7D3B7BF932659393DA4DBE5AEC472E74DD36421372945ADE89D6F8E7FA9E17971CBA7137394545764B7679AD5E0D4CEB1AC4DA56F7877F27BB589CA36F7B456F4C9BBE9DD7763B49C7CC3369250726F1C9456EE4E34D99A6FA64D45CF75CCE2EA8FA9BD24322945C134F9B5765197D1343AAC69CF124FF00CCB666A692E5F37C1EA3ABD1493C736E2B7A4ECF43E9DF10E1D53F9795A849D6EDD265DEA5F0938C5CB4D3BE6A354D1E433E93369B2BB5D1960DA9464878A9E63E80D2EDBA7DD14CE9277C3E59E7BD13D66519AD36A24DC788B6F747A39D495AE1A336352B87EA3072C52D9BA6DFB9E475ABA64E3769EE9FB1EEB530EA8B55B33C67AD6078A5696C9B686536F359E7D0DAED7BA7C339F2519432B8BA6A9EEF635EA65791AF731C1B6B227DE124BEE768F3D59A84DE9D5C784D5ADFC33A1A6C929E895DB5D2B6F14CE745F5E965BD34F8FD4D9E9D3BD1ABB69269F90912CD24B55977B5D2938F0CC89BC72C896EBA9AE97B271668D4AACD252E5D5BF632294949B4DDA69A5FA02AC8354A49FD2ED5F8FB9B314D3D33C793FC3F825DEBC7F5FD4E7C66D6596F693B49F866D834E49EEAFB766163EA7F066A56A3D03127BCB15D3E1DAE7FB9E9A126949575453D9AE68F05F01EA9C70E5C2DBA8E4E170AFF00D4F77826A39670ED4A51F6470D7B77CFA5B6E4BC2EEC9096D2AECF8032A6020B01808006200000006EBEFE0002EF8FD45CF3C781F000001600218804C436260000145000000802D80081800008762000000A400201D88002100300A08B18981B11244512464344A88A248A817B124243450D0C486881A188680060300430000188600310C000000006200000280000800000010C0A800000400000000002000000000000010009800862000002040022804D34ED73DD791B75F6FD08F578DFEDB815659258E72549255BF93E65F16FA82D57ABE48A69E3C54977DEB73DDFAAEA1E3D3C5297426DBC92E5AD9F07CA3D46719EAB2B8A49393749DD1BC4F2CEBD31B72CADB6EAF64BC16E2846AB68C155CB9AFEED95635D5258F84B79BED6592CB1836B1FE28A6EFBAF7FBFB9D9C93CB26945752C78F1DB6BC7DFDCE6EB756A718A4AA2ADA8BF7EEFDD92CB9D746CD35CDBE11971629EB73C524DB93A5E7EE10F4DA6797FE64B872B6DF147A7F4DF4E739624D7BB1BF4E8E3CDA6D2455DCBA655D9AAB3D47A168639F54E492F976E31976A46357C3AE33E5EA7E1EF4F5874B1A8AB747A096894A349F4EDDB60D0E050C6A955706F51749198DDAE265F4A8E58F4E46A49AEEAECE7E5F833D33552BCD86F7B693A47AC705B1169B7496DE596D18B49A4C7A0C18F0608F4E38A4A315D91D2C31E88DBDDBEE47160A76F9F2C795F4636D3A3232EBF52A0F1D736D2FBD338B9F50E76FA9AA17A8EA1DDF56C9D9CACBA97C2769AE4CF5BE71A5EA1CE54AD9D3D041CA372E1763CEC26E724BB9EA344BA74B05DE91644B5B135149767C0A6E35BB4BC763C9FA9FC67E9DA3D4CF4D8F538A7960DA94AFE983F1EEFD91CFF00FDF5E9F193EAD44E72F2A355FD4BCB7D2789EDECA738C52A92FBF0655A94925C3F28F30FE39F4D9C2694F2271695A76ACB717ADE9B3C92C7923913BA78FF00157D89658D66CAF4EF2C67177FB1CDD77A7E9B596F2638B6D55D6F467C5ABEA8294649C5FE192DD335C332955F2B927579C787F59F40CDA17FC469FEA82DE9734747D13D41EAF4AF1E477921B34F93D3658C72E3716AD35BA679F97A5AD26B96A34FB45BA9417146FF0018E795D24EFD99C0F59D2ACB8E4EBEEBC33D1E44D2AAA5E4E7EB31A941A68CABE51AF83C5A8927B34CC789FD6FDE2D7ECCEFFC43A6E8C929255CD9E7F0AEACB4F8E97FC99D737C3CFB9E4E0D46126F749FF6377A7DAD3B5E2F7F639F6D61953D9B5B9D2D2574422B649537E4D5662BD4BBCF26FBF832DBEA5E1DA5EE68CEDF5C9ED6B9333AE9C4D3DE98137F4CA12ECD38FE66AD3B526E0FDEBEE649D7CA4FC4ACBB0C975ADB75B3FB108F63F056451F57CB81CE965C4D74AE5B5BFEA7D1F14DACD8EE5769AF367CA7D0B3CB4FEADA5CD1DA719FD4FB347D39B8C722C9097D2E9DADF67C7EE71DFB76C7A749DA4B6B56A895FB34453B8D774D6C4ACCB62D791A6BC8874BC1016BC85852F08125E002D790BF6FE800014FBBFD03EC0000000C00560000201808431360000C0A0EE00200B00100087B0A8000000000560020000100050000E80426484C0D88684868C86892121A2864911449150124243403408011034310D00C00000621800C4003000000188A001810201880000000000A804000000201880000000000008010C4C00431008000A0001000009F0FEC041253FAA4AD764F84826AA2D45D3A7F61C5D417B10CB3E8C526D36DF6EE079BF5BD4A58F2AAB70C7D728BE29F1F96C7CBE49E6CB6A9DB6E93D959EDBD775325E919FAE52797539D63EAE146114B64788D46550852D9F2DF0923AE27873DD2C995462A38DEEADB9764619E55920D63DB127729B75D6FFB11CB2799BC6BF0452727C5BFF7D8A1E4FE2128455628B57D93FF004F0747358D7CE692558E34A36AAFDFEDEC7A4F85741D59B36B249358A9634F6EAC8FF0FF007FC8E243138C556CDEF6CF6FE9D823E9BE833CD3C3D4B041E695F7C92A515F97F5269BC4F3D64C09475BEA39E36E1A58BC517C75E475FD59F46F873D3569F49871B5BC31A527EFCB3C47A0E872655A3C79AE5933E47AACB6B7A8FF0076D1F5AF4DD2B8618B6AE4F7FCCE77DBB4F11A30E2518D2EDD8D115D892C6E9265B1C6BC0654B85ECF8F03515CB5C708BA715149B7B7845139BBEA4ADA5B25C1039CD70B9399AFD4A8C1C53D8BF2E7F97193BDDF93CF6BB50E4DB69FD896B7230EB72B94F776BF99CD926E54DFBA7E51A334D4A4F7BDF922A1D6B6E56E991AA9E9A29CA37E51E966A72F4FC9184AA4F1C945F74DA67034DF8D3AA92DDAEC7A2D3B52C3576D2499ACB1A7CBFD0FE1ECDE9395CB5DA0C7AAC2E94A4A3724AEDBFB9F46CF97D3F0FC1DEA3AEF4CD269E59B1E9E728CA389269D7EDF99666C1F4B695A7B53399A8D374C65934F2969F3B8F4C9AFC324FF00CD1E248E99BC6353ECF8FF00AECFD331FA4E97268332FE26718C9F4C6A4BCD98341EA1A8C19E19633E9CDC26B87F73B1EAFF00096A349AA93C32C7D0DB6A2F64BEDFD99A3D0FD2349A3CDFC5EBDBC99A29A862847E957DDB7CB2F7AC4CD8ED7A37ADC7598AD4AB37FF00898EE94BFD4F51A6CEA5894949B4FBB3E67AAC0B47AE96A34CE515D4DC617BA5EE7ACF47F525A8C29F52FAAAFB6E72D67F8EF9D77C57ABEB5249AE1919ABF77FCCCD8727D292768D3D4AB622D5138269FB7639FA98FD32FB1D4925D3FD0E7EA52DEBB8A91E17E21C49C64EB83C763874EA5DEC945D23DE7ADE34E33F3C9E1E551D44E4F76A2F6EC8DE1C7E48CF37F4452D9B9269783A1A25F4C577E96FF3DCE5CDBFA7CB4B73A706A38654F78C52BF26EB9C65CF35BD3DDA4C8CE97CA5C271688E4929CE72ECDD12C89F4E17E2F8F05126BAA2E3DDA638CD45A9774E9A5DD114DBAF2A555F722A93927DD26BEE41DDF4FCEE1A9C534F8926933EAD81A5FF002E4D74BC4D24BBBDA47C734992E31696E9A7F73EB9E9AE32D06872C77A8A4DF3BEFF00F839EDD70EC62937871657C2493FB17BD9AFD0A74CD4F4B1F0D5138B6E14F98BA393A2C00001A015800C043000000013000106C000140000201F711401C00B6000B00000D8400021898000586DF900988958804001DC2900058000588005D862B036A1A121A3224868486ACA1A2488A248A863424488000A1800C060000000310C000060000003000000002804311000005080002000001000050000100000000000800400218800000004300109ADABC8C4D015A752E97CB337A86658F1494776E2DFB2FB9A7228B4AF769A7E699C5F54CEE58A78B1C6A52BEA6FFC293E00F9EFACE7DBE5E46DB8CA514B85CF83CD6794A4DC57E294A91D8F5BCB28FA94B149DCF04A5177CDAB38999BC704FF00C4D6D7E59E8CFA71D7B63D5648C23F271DF42DE57CBFBFDCBB45893553569EE9776FB18F1C259B35EFD29DDBEE75B4D069A926A93A827DD95974349A779F550C69DA8AFA9AE0F49AA59F51974FE938F65971C6724F65D37B5FF6F730FA168EA5F3A5BE38BFADD559D6F4E9A97A9EBFD47245CA38E2F25B7C27B457E7FD4CDAED99E1EA7E1DD1C73EB72CE3BC7138E14D2E3A69B5FAB5FA1EFF004F0E9824F67DBC1E7BE15F4C7A2F4BC309DBC924E791BDDB94ADBFE67A9505D29330DEA9A4BEC97625697D97F329A7074AD7BA7D82338A9A4FBBDDB0C2C962964772751E6BB92708B8D2AA7C9E1FE35F89FD63D2E58E3E938A139AB949CA1D4A976FCFC9E87D27D6F07ADFA1E93D4F027086785CA12E71C96D28BFB324D4ADDC6B325BFA5EA38DC136BEC798D527294AF8F27A0F51D52517724D7279FC93F992F2BC3337DB73D39329AEAFBBE5EC68C2D4AD5DB7C56C51ADC528CBE9E3929D3676F25374F8A2C2BAD8E1D4F674D6FD4B9475F4795C57CB9AE993FD1FDBFB1CDC50BA6F67E51D0C49AA528F52AE16E2335BE4BF3F63364C7192AE9B5DC943A924F1CFAA09EF193DD7D9FF00713CABABA251716DF1556699E393ABF4CC399493826E9A57D8E06A3D1D45A9462E292AAE5367AFC952E25C5B4FBA32CA29A69AA6B6AF62755E367E8CF22935177D932383D2569DDE2B83E5AEC99EB9E2526F8F72B78637BA545EA39BA3949251C91A9AD9AECCDFD2DD57E4C1E0BDD2B7E172FF00D4945A549BB6F755DD1151E87DCC9A9828A76ADBE17737B52BDB65FAB33678D45D3A6F7F2C8B1E3BD720D41B74934F83E7BA8A52D4797F4A3E8BEBED4304956E937EE7CE35324A52BEEDC8DE1CBE567753CB05E649D7D8E8B6A3865E136FEE91CFD3252D4E3BE15B66AD44AB4AFB36B8F766EB9464BFA55F2F7668945B504BBC5FE666DDCA97B235B92966824A946296DEC5452AEE4D6E924ED760CDF4CE4FBFD2FF0098E0DC72B71749FEC5995432C637509528B93FC282ACD2BFA6970EDA3EB7F0FCD4FD220D5AF97962F7E3749A3E478A12C397A27CABE1DA67D43E119BC9E95A88ADD5C1C6FCA39EDD3E37ACD2B8F4492FF0CE4A97DD96B553978693FCCCFA269F5B5FE27D5FC8D2FF0012FB2393AA400040C100000C4160160000021B10000098000014000200007C8807B580BB81002000063D841B050C431517A010000086C4C800013A006C43117A800008ADA86848688248922286915124315B1A0192424345021A1124400C4340000080600000300000000018860000000000002188A804300100010200028000000431000000080000040000000027B00C83B8F0AD7801B6D76B5EC26E2FBB609A7DC1B495B7480AF2BE8C6E52B4B8515CB6719AE9D3EA334D45B82EA69F0EBB9D66DCDCA6F68A5F4A6717D666B07A25ECA538C629F1BB607CAFD4A4F2FA96AF2B76B26572AE5D3DE8E36B9B94A5CDAA55DB73B1AD5D1A89B54ADC9B4B8B391A85D536DDD2B7BEDE0F4471A86920D24A3CCB8F14773458949A7D36A0AEBCAFEECC3A6C6BA62E9AB551554CED7A4E29E6758E3D729E44A296CDBFBF85CD8A6675DAC10C91D263C38649CB2CBA249BA5D5DFEF4BF933D1FA5FA77F139F4BA68C57CA725A8CC92E52DA1F95D7EE73341874B972C1A87560845D4A3BB6B86D7BCBF0C7DBA9F73E83F0F7A7CB1E379B36350CD95A94E2B7505DA2BD92FEA62BBC7774983E5E389AAD4797C77145A8C524427BADF8233ED09CAEFF00DD19B33728BAE571EC5F3A656E2DF7FCC95A8C3069E69BCD85494B6E2ECD73C518E9D431E3508477492A4598D463BB5BAEE29EA16A24F0C1DAAE57933C2D78CF883D532E9EA3A5C18F2E5BFF00F1254BF63C5E83E3E78FD7E3E9DEADA2C7861924A11CD864DF4B7C3927DBEC7B5F5DD1C71E5964827D516DABDD9E6B0FA7FA4FA86B31CF50E10CD19534D53B1DFEBA59DF4F55ADD2C545C5ADD773CA629A7EB32C09D54AD9EB7D4F578A38DE473518455DB7B1E47D0B4F975BEAD9756D351949B4F86C653F1ED7060A8AA575D8D50C6A3155E69D704F1E070C517DA96DD8B1C5F8DD3E0D30AE934D38DA6ABF3070555D52A7DAED127F4C7DC8B7D2924B67FA8565CB824ADC3273C26B73364EB8CB7A77DDECD1BE4D74F3B99F253D9D34FB11593E6393E96E29FBF0C6E0F6B973EC3C98156CE9787B94B9E5C3B349AF29EDFEFEC5678B1C52F2D786C8B8A56D2A4DDD2F3E511595CD2FA39FFBAD30B9EC9D2FDC28726F674DB576B868CD9DA7175BBEEFB22E9C13B6DB7BDB5C7FB665D4E44B0CAE934AB6D89478AF88F328C651BDDF2D9F3DCF3EA94DD72923D67C4DA9EB9B4BECCF1F3975297972A475CCF0E1BBDAB74CBEA94BC47A7F527A995B847B5DFE81A485E255FE26E5EF5FF8457965D796725C2548AE658139493EDD4DD8D4DF5639BE5B6FF71A4A1864FD947EE56F849F29228BDA6B24E95A5BB5DEC7993E949EF096456FDA88B6D658CE2E9BDACB26D4F1A4A2954ADC7B3AF01469A5791A7C753D9F63E9FF0003C24A334FF0B8A6AF64DEE7CCF06384A7271C8A2DBBE99ED7F99F4EF8313C514A4D36B1ADD3B473DFA6FE37A7F4C7D5093ECAD1B5F3F918BD325781B4B96EBC1B2DB9D7DACE4EC9800C80010C040000000201B62060500003202C400505831058E02C04C028F70B002002C3F3000B10017800DC008841B000526030EE1084C6D030A40161C0082862036A1A2289220921AA121A454490D204080921A121A004342180C6218000000C000060218000000000C0000000000000432A10000080620100C400000000000200001310C00043100003153F20322F8B0DFCA232BADD80DD56FB909A55F86BD9724DD453641B6A9BEDF53FB810946E51C7FAFDCF2BF13EA3AF4FA6D3C126949B936E96D7FF0093D34F2286394DBDDEC91E03D7B52B26B72B6D2C50B5F9EC6B33B52FA792CEDC94DD53527BA39CF175668BE64F7F28E836F262935176DDD3EDC957CB5156A54FA6BA8ECE28B527178D2B6BF135E3C7FA9EABE1FD1FCDF4F9B96471C2E0FE6CFABA6E0F9847C5F0DF35F73CC252941DED8E2ADB7B2FCCFA87C2DE80A3A1D3EA754D649CBA658B157D29F67EEFBFB1355D313CBA9F0DFA54A58F1E4CD8D452A928A8D7DAFC6DC2EC8F75A7C2B1E3568C9A0D32C695ABB777E59D5A4A2B6E0C37AAAE94655CB2B926D93C93508B7CBF072B3FABE3C3F31369B8ECD782125BE9B27F4C5B724979652F2C14ABE6AF74B73CC67F5C8E5CD28BCBCBDAB8169F5BF326E0A7525E5D8E4769F0DFD7A0D6BC8F4CDE09F5BF6EC63F4AD4CB1C724F530709EEEDF14677AF7A4D2CF264D9F4B6A3E59E6D7AE6A2797A653B4EF7A259CF2D4F86F1DCD7E58E7949A7699E7F53E8F873DB6BA5DDA6B937C32B92F991A69D6D7745B1719A5EC658F4E1C7D0A73928E4CD39E34E945CAD33D3FA4E821A571E9A49B5697633E38D28FF00337E9A4A0917A96F876A49746DE38F06676A4D2D8B3E65C578E6CCD927D2DB7DBF734CC853924DA7CFB1539BEADFED4BC116DDB93E5F7F0424DB49377F60D1B9AFD4A5CA95DD776C8CE754B96F8456FEA97D4EDF65C2440E595497D3172F75B22A7395574A4D797639B525C91BDADF3EE05338492B4924F957B107A950974E65D0DBAEA7C3343696DD9F62A924AD38F541DDA6AE9151272718D3569AE57738BEB3A9847135D5BA5B34E9D9AB52E1A5C2DE0CAF17882FAA2DFDBB7E4790F58F516E32791EFDDAE0466DE3C9FABE759334D39356DEFCAB38D0C309C9279656ED5471DB5FC923A59678734E49471B9F537FF324F729875466F3649E271852C78E0AE2E5E5A5E0ED1E6BE6ADCD931E0D34B1618382697536EE4D2E17B79A460E96A2A2BF136B7F05F9DA9648C54A53C927D5294F66D944DC6339356E31551F7610B2C936A11FC3054BDC8ADE75DE911577BF7B2515F52AECC0BE0D28DFB7EE189BA4BC26EFF52154A976B43C6DF4DFB2415A312528C5B6BA92FD51F4FF0083E2B1E832E44A9FC96EFCB3E6385555F3B9F50F408FC8F45C893A6F1C629BEE72DFA74F8DEA3D320A1A1C6AB9566886EE52ECDD22BC5F4696104F75156D762D5F4C524B64A8E6EA9037414DF2E8124B801EE0200000000000200000001803010008A00B013F00000040000762800044500C04001F60EE05006C1616442000B0A0004000201C40C07B88AADA90D090D194490D090D012A1AFDC4868D068922289244021A12180C6218000000C000006218000000C0430100014000000000100000008000000400000000026D256F65DD8009B575CBF083797B2F1DD8EA952E008DBFF2FEE3B7FE5FDC1BECB761B80B7F60B7E13FCC00057E535FBA04D3E1A189D55B57FB803D8837169AEDE781F42E5EDF67B213BB572DBB26AEC083936936AEB949EE91564CADBE94DDBDDAEE90F3649C654BA5396CD2E68CAFA529E6C9149276E4A74D7E7E40CFEABA9FE1B4B50579A69A8FB23E73EB139294A0B275CD36E4D6D72FF43BDEB1EA395EA1A8CE4F336D42376E2BB1E67D4EF0CA38E725756D72D7DCE988CEAB1E2C72F952B8DB934BD884DE2834F24BA9A4E92E0597337156E953DBD8E56AF3BEA78F74DBFA97B1D5CD5FA8FA864D5B7871ED862EA97767E8EF40C0FF0084D3B6ABA70C125E1523F31B6E2AFF00C57DB85FEA7EA9F405197A66927DA5860EFF00FED4634DFC7FAEEE08A8257C22D9CEF8210BE9FB7EE126BF232D2BC89BBBEFC33C47AFFA0CF27AC47363D465C70C916A718BFA5B3DC49EDB7066D5E28E6C3E6517C9237F1EBEB5F25F51F8432BD761D4AD5E792C4EDE27BC327F2A3A9E9187D3A5AA92D72FE1A718A5056D754BBBBF63D5CB0E2C9AAF97997D3E7C3397A9F488BC2F234E4E57276AE92E17DDEC6B9C7AFEB8DFF9547A82CD2CD8F4DA6C9FC5C73B4A29D2692F2CF3F9F1CB4FA89E3CF8326195A5152556BF91B72E9F55E99AA7934F3962C98EE34F74FC993D67D77D4357E9D3D266C18AE4D3734A9D6DFA5227B5FAFC989FD8D9832BC75173DDEEAF86CE9627171B5B2E5AF0CF1EBD67063CD18E692863B5184E72DD78B3D1E935F8A5169CD37DD77B336396F9A9D8EA62B5057F634E37463865835B4F66AD6C68C79616AA716FEFB91C5D38E4FA527FA14E4937269BD915A934909BB4FCB6D95526D3F62A9B6B8A6DF67C136FA63BEEBF72949EF39732575D92288CAA31DF76DEECADBFAB8FFC0F23AF67EC452E37E10116ED6DE454EAC1EDBD0392516DBE0888B6D73FB99E7976B4E9767E42795CDA5FE1F1E4E7EB754B1E396F6FC81CFF0057D6C611924EDA5BCBB9E07D5B5AE69A55BBDD728EBFABEB65393C7076DFE27D91E635AD43796EDF115CB37972DD6594F2658AC57F4B7F525B243828464947F063EFEE24DA8D357393A8A5C213928A50876EFCB6CDB8926E4E5926DF97F72B9BDD2F1BBFB939C97D2AF8DDBF2CA5BE5F76CA813FA92269D4FECCAEAA4DF774916453EABE7601B7F4DA7C35FA1387E0AF0ECAE14DCA0F871A2D49C545FBD01AF4CBAA5C3774A91F52F448ACDA6C69AB8CF22497FDA8F986913F9B1ADEE5B247D6BE1AC4A1A5C696FF002D3497BB396DDBE37A18A569254A3BBFB935C904BA62972DEEFEE4D6C7274000000000500001000005000000000BB80AC004C286160D8888762015A01D858005000C4106E00001B8800AA001810160000021D8042A000B0A2C560051B50D090D19124342434544921A12180D124451240086243018C434000000300001800000000000C00000004031150000009F800EEFF200000100000000003692B7B2F2026D256F81536EDFE9E015B76FF24300001002EE02BA76F860DF85F9805EFF00615AF2456F27D4F67BA5C225714B9402EA5E77175A6ED26D2E2904A718C6DC92ADEECA1E5EBDD29283E2296EC0B1E5727B45A5E5ED6465276D252727DA853C8E117397D30F176CC1A9F53860C326A7D2DD2492FA80B72E4FE1E126DC55ED29376EFF00DF638DEABA850C49CE6A0D7D4972A31EEEBBB613D4B92F9D2834A29A8A7BA5F7F7679ECD932EBF5528F5B58DBBC99794EBB7E5E0B216AB83C308EAB5B9215049B56EE49F6FBB7FB1E6B5591C9E4D464E5F6E59D2F55D7472C9618452C18F68D77F77EE71353922B1EFB257DFC9D731CF558F2656A3D72E65BA8BDDBFFC1CF9CFAA6DF349DB7CB6593C8DA6DF29547EE52E941FE499A615745C293B4D6FE51FA6BE02D6C7D43E0EF49D4755B7A78C64FF00EE8FD2FF0091F9A1269C5A755BEC7D83FE0CFAEA9E8F5BE8B9A494F04FF88C4BBB8CBF17E8F7FCCCEBD358BE5F655F8534269D31636A50B4ED3E095735C7830E8A5B65536D6EBF434356FC14644BA656BB7E4071F56A126DE48B569DB5DCE7CF5B97146A9658A69A9AFC4BEE76F51084A2ED6FC7B9CBC9A6849BAB8B6EA97344FB58EF8D71CECBEA3A6869638DC1E4714D3B8F2DDFF53CB6AA38B34A09DC524DB49F73D84FD321922D254D765BA7F91CFD47A6628C5AC98926B7B4CBF677CFCD2478CF50F4AD2E6D3CDCA2E70ADE2E3667F4EC9EA183363D3E9F14B2E28A4A293A925B7EA7B77A2C4D7D304D3F3C32CD268A38F345D453FF000D21751CB5B97CB76870E57E9F8E59B6938DD3D9A7EE4528C9FE0EAF76B866D53BC7D2D5BECDEE5338372B8F3DEF830E7D57D13845384BA17097287195C6A52BA74DA7B0DD3953E53E195C9252EA4926D5576650657F5462A4E9ED760DC9DAEA6BD9EE67526E5278F6DEBA65C31A9F53AB6A6BB3E4D0B1BDD5AA7C2DF6641C93FEE88657D51E36E1AEE56E5D1B49EFCDF902DBEEF64B9B2993727BF1E2B9249B96F26956E95954F2469BE7EC4A28CF93A2326A934BBF63CC7AA6ADCA2D464E9F7EECEAEBF51BC937495F7B3C96BF53F3B2B8A7715E1F2233AAE46B3570C12DDF5CE4DBAF271F2E496A32FCC9EC970BB1AF3E91754F34E7726EDB7DCC72A8DAF1D8EB2386909CD45393FB25E48AB8AB7BCE5CFB0A4FA9DBE570BC109CD462EB9E2CAC2129272A8BDBF993D93AEFC95439B7C963772B2A12B72FD0B6174DF82B5B5BFD7EE4D3E9AF376011573B5B74BB6BD8BDA4EAB6ADE8AE946555CEED97C5274FBBE5823A7E858565D55B56B1A72FBBF07D73D060E3A49E494526DA492E11F31F86B4FD39A19E4D28BCAA3ED7B1F54F4449E86D6CBA9BAF071DBBE3D3A29777C8C056736CEC0568600200286162001808600160220004C0004C1B060162B000100C5C006D6000146C02001882C0000180058008062000000000100040C417B801B90D091244534304054490C48680689222892001A10C06868434000000300000180000C4300001000C00A84031050C000217F8BEE00F742B6BDD79EE0310BA977B5F743EA8F940002EA4F8B7F641727C2A5E5EEC01B4B9FCBCB1256EDF6EDE0124B7E5F97C8C000040000B800155B69EFEC464FA62EF75E7BA24FCF721966A30BF0F75DE806E9454AEEB714A4945B749797C919CE305D4DA4DF1BEC51D7F5753FADDFD29EC9302D49CF76BA23D977629E58C13AB9BF174BF52ACCDE38F5E69C546ADAEAA47175BEAB8F1CE5F2F229CA2AAB1AEA51FBBFE806DD5EA1464DB9466D272514AA11F76FB9CF841EB334B36594A38E11A4E2B79AFE88C6B56FA5E6D4F54E727F81B55FE95E0E76A7E247284B1C1E3D2E38B6D55CE6FF5DBF32CCDA8D5EB5AAC3A7D157445E57518A6EA38D3FE6FDD9E6F3FA8AD3691E0C51B94B69C9B55F97F7306AB5AE73799CA4A12BE9795F548E6CF2A93B95A8BDDDF2CE932C5D2CCD9D74CA6E4E96F7E4E7CF34B363C8EB6724B62BCF99E493ED8D709776598A125A48B6B76DBAF63A39F59A71B492EEDB2A9FE093EDD48BE7F4C5BE124922997FD15DAED810493935DA924FC1BBD07D6751F0EFAEE97D534E9B9609B5287FF00CC83DA51FCD18927DB974C270FA77DBBA6C847EAFF0047F50D3FA968706B347359306782C90A7CA7FD7B1D64956CED3EE7C0BFE137C5FF00FA67A83F40D764AD3EA26E5A5949D2C791F31FB4BF9FDCFBC432A71535BF9473B38ED2F62E504FFB99F3C128BEEFB17A9AE9BEDD994659AE993FB2B22B165C5CB7BB660CB8D55F8B5EE756738CA2FF0091CED44E36D24E4F9A4896372B1432B849A6AD32593A276D24D99B23CAF7518C3D9BB7FD8A1B95EE9CB97F8B632DD859618F1CA9CD46DD269918BA4D3839C7CC62465AAC71B4A1275B3A8D94FF0012A34D5417894AFF009046C8675154D4DA4BF1354FF32D84EFFC12FD0C72D43717D708B4D728A16AB3E0571D3E69413DAD5D7F503A592509A69B4AFB354CCD95C941C549A9BE13DE8CB93D5E118A5930E58B7BA4E171FD782B7ADC4D5E3C977F8A328B4CD422DB7C5DAEEAB7B0C90725BCDB49269A552466FE2F065B4B225916FD2DD340F3CB1AFF009DB26F94AE2FFB14A93CF72E996F2AFC49D26BFA324DC5C94F6693A4CAF24B14E372749F74F839B2CF3C2E5F5C2514EDC5BAB03ACE6946EABC1875BABF971E94D5D6F7D8E76A7D7618A2ED4D3FD59E63D67D724E32C78DCFE64B96E34A24E752EA44FD4FD5BF88D4BD2E19EFCC9A39F29C5C5E3C7BD7E27E4F3D2D4471E5792326E6B6BB357FEA729E99AF97D0DECBC1BFAF1C7EFD1AACEE52DDDF8EC60C92E96EC6F510849CE7BCBB2EC8C9973CB34DB7B27D97634E76F5373B77CD154E5D52496E97EE46526952E7B8A09DDF77B151724BA9782505717EEEEFDC8C775DAD8D6ED24BF3F054591DEAF8E5B1DA8ABE5B7FA09BADD77DC69545B7BBE409B4DC22972DBB3463DE315F97D8CD06E517E7935E99279237DDA544AB1EABD0F046787E5BDA4F5106BC2D99F47F44957A6E2EAD9C936FDF93E7DA49BC5EADF2D4538CA31CC93D929533DF7A4CBA7498E0EAD274BC9C74EF9756F6B157764526B67DB764ADBE17E665A30234FC920000020000000620006C560C400C2C008010EFC08A01000501620080000280000000008004D80500162B0180AC2C03606C416001602B018856007410D090D104912445723454490D093194344911449100310C06312180000000C430018800600000000500000000000086208000002C5631000000008620010C402DD3B5C306D274D8C8B9A5C6EFC201392BB534978AB32E4CAE526949B696CE31D91A1A75727F64B8296E7724BA528A4E4F76073B53AFC5E92E2B26396AF2CEDE38AFC4BF5EDEE72BD4FD575DF29E4C9AED2E9A33E31635D73AFB97E97339E7D5EA32C64F24ADA6DDAE9575F6461F53D6E0F4F781E1C317EA1A88B94A728A92827E11A9ED2BCF6A757AACB962A4F34E09DCA591B4DBFCCAB2EB71C62BADE38AC6F88DC9B7E599F5BA98AC9396A72E4CD372694724F7FD3FB9CDD4EAE53C5D2FA6296E970EFF00DF93A71CFAD397D55E5949C2791A76E4FF000A6BF99832EB54E2DC2118C2F675BFE727BD7B18B2EA7ADA8C37A556D14E46E4FEA6D37494796FF235233D593D43727573C8FBBEC52E6F7949DA4E9BEDF97914EA11A9AA6F7714F7FCC9C31394A2E6B68AFA60972CA8A6107969BD95D246ECAD42318F09257EC8962C4A128A7BBB4E5455A99A736B6ABE5785CFEAC2C64CF36FA62F6FF1345191B7D317CBA458DB9E4DFF00149DB1634A7A9EA7C437DC888CEE33956D5B13493854A357B26B6F05595DC2DF32936689FE04FCBBFE4159E51715CBB8B54D6D24CFB7FF00C3EFF882FD43478F41EAB3AD6634A30CEFF0E65EFE25FCCF88E4B5B72AED23D57C2F8D4F32554E9357B99D7A6B1EDFA256AD55A7F4BE5782197511E9A4EDC96D15DCF21E9DABD563C31C71975D2576ED44E82D74E16A38EE4F77272B4FEE73EBBFD5D853728AEB95FB2D9228CF3518754A518C579748C6B53369BC925083EF8F769FE7FD10A4F1C9F5D56DBCA5BC9FF61D5E33E5D4A7271C709E46AF74AA3FAB324E39E7BCA504B9AE51BEE2E2D72D3774ACAA69F2A35EECCB518FE549ED29B92F1549096284934A37E64DEC5B35776ED2EDC2139A8A6DB492EEC22B8E9A1077094A32F29D1273CF06E31A9B5DF8A20B2B6D53718F97CBFEC4BE6A85452BAE1764054F26285B929639BE5BE599B2E0C59249B4F1BED3C2FA64FEE8DB27D4ADD49FBF08A26F1296F0A7E23C869967854A094A5F320B89249B5F932A9608CDD63D4C697F85AAA44B3E3C73BB94A2FC395B32CF45824D39FCC94BB273DCBD38AF3E93146326F50A293A7D3B5A30384272AC325936B52E9B6FFA1B27E9DA6DE524DD7693EA57F99C9F57F59C5A1D3CB1E39DE66ABA56C97DFF00B1654BE3DB17AA6B7F838B84671591AD924AD1E3B53A979B2497536B9726F927ADD6CF239372772DDB6F7661C1383C8D38DC172FCB3A48F36B5DF09A8393EA6EA2BBF08867CDF2E2A96EF86F848DD8713D44BAF22AC69EC96D675716931E58A8BC7171EC9A2DA9F4EC791727295BDDB1DA8AF7EC8F41EA5F0C65C189EA748A53C695CB1F2D7D8F396DB6DF259E58B2CF67BB7FBB64E2AE5B10EDF72C87E2F7E0A270F0BF264B8E376DFE80B65E3B7B8D34952E0226A94657BB4B61F64BB356C8A6F9EDC125C57E4C0941538F65C1B302BC89FE6D1917DB774CD7A675937E362558F549F4FA8E9B237F4B4A1D5F91EF74EDC3438DB75D2DB4D736783D4A58F1CDC637931C6138F84957F43DAFA765FE26558FFE8BE9949BE7838D778ED6924F369F1E49732574CD0FC14E9DAF931AD926D7E45BC3FB99683000200056301808006446C400C000000404058080A010000005805002B0B20761646C2CA1B620B000B0105800000000588076218804C36060002185947410D0204651243424348A248684868A1A2488A1A20686243018C434000000030000001940000400008A1880000620200000A800000040C0000000426C626EB6AB6FB0009CD70B77FB0BA2FF0017E889525B2540469CB9DFD96C84DA8DB7C2E12E0991E5C57BDB022D39349ECDBDDFB10514F0E47CA936DFD8B1B4ADBEC88E37D50492B5C6FB2B03CB699BC787D53157FD195C7AB85176785F53F55CB9FD57265D3E5928C63D119ADA54B93D3FAEEA968F26BA52A93CD89E3ABDA124FBFE47818352CD051AB6AE57C3674C4FD6377F138C32E7C97149272FAA49EF7F998B50945B83B7BDECEDB376A73C71C65831BB49D49A7B3665718B826DA6DF092BA47473ACABABA5B4BA3B26B9174B8C5F441B9CB7B36A839C22E6BE8DF6EED176834AB5BA98E25B63EADEB90718B4BA2792F34D3708EED3EECD79F0FF000B250C8AB235726B9499BF553C5A69B582BE562FA52ADA52F2733ADDE59B7D527BCA4F76D93BD5F48BBC585C9F6DDF930E4956C97D4D6EBB1A32CFAE2937B5DCBC18DDE46DAE64F828AD3718BC9F748714E18EBBCB7681A539C60B68A7B3EF44D3FAE591F1157F98466CAAB2F4AE211E9FCCD338FD2D2F6FE85108EF6F76DD9A65194F13715B2E5B749302A9AEA716B869347B3F8470B9664D6D715B9E4B0C63294547EA75BF847BCF83B039C54A5C52BBEFC98D7A74C4F2F79A1C5D58D27D4B1BE12E65F7F63A9085541452555BF064D2C6A2BD8E828D35E0E6ECCF3D338DCA2ED99FE6CB05F55B877F2BFD0EB74AEFC33367C09EEBBEF6459597F8884B74F77DBCA29CBA8825F892F243369BE5BB4DA8BEEBB7FA18B3432C7BA7F953275AE2CC9A94F65C3EEF64532CB1BB94936B757B2461CD29AEDBF84F7287D4DA6DDFB5DA0BC745E7EA95A74AEDC9FF0042C596318D2DD776FB9CA799C7CAFD8ADEB5C38BFCB760E3B12CD27F87655F6450F2C55AEAA5DD2D8E4E4F53715BA918B27AA3774D7D9BA07876E7A88C6EA92FE663CBAE8628B939C55F2DBAA479FD4FABCA3694EDAECB847075BADC99ADE69B93ED05C1A93ACDDC8ECFAB7C4EFA5E3D26EAABADF097B1E4F3E794E52C9295B6EDC9F9213C929B6DB492D9F8334E7D72A514E0B95C59D6678F3EB76AB7D59A4DDD479B6591C39A7150D3619CDBD924ACF6BE9DF01BD461C52CB3C92EA8A974C7E98AB3D6E83E098E9F12BC9D092E231175167C57F5F38D27A67AB658AEBD228D2A4D4AACEAE3865D1CA31CF8658DBEED6CCF6DA9F47CDA14A507F361E2A9A238A3A7D641C32C1493D9A68C75D66791CAD14A39F15527F73C9FC57F0B4F0B9FA8E8A178F9CB8D731F747BCC9E813D37FCDD1BFA6EFA1F059A79ACAA5832C6A7C38B45978CEB32C7C396FBF62D549D5F27A7F8B7E1997A56A65ACD3637FC1E47724BFF00C37FD99E5D573DF84CE93CBCF672F139FD5BDECFF6250776BB2E0AD5F535CA2704927EE5459BFEA4BCAEF4577CEC4E2AE6EFD822C82DA3669C54B77DF665305D557CBDCBF12B9452DD3DFF0032558F5F070D768F4FF2DB5916358F2787FED1E83E19CD96708E194D46504E1375BBA3C8FA2674BAF1BBDD7D2FEC7AFF0086AA3EA7A8974AB9C6D7DCE75DA797AEC5150C5187B5D93BE1908A724937C206DC655CA6726D60AC569FB3F03BDCA0000A207DC40003130B0B201898C4021880A00011000160CA105808298800000000043000B100100000002631140800403100AC062060383A48688A1A222681090CA248688A248A1A1A22892206310D00C0000600003010C0062180000000001402000000020004050C4001000000000009F9125B5F763234D70EBD9EE8090857D9AA7E7B0EC0082DD3ECEF924DD10B5B25DF76046D2849B5527BBB28592792328C1B8462DF535CBFEC599DB9E2952FA534BEE27058E0E9BABE1720780F8D3AB4FE9BA8C508ECF3A7B2BA3C062CF2C59A737BB7071BEC7BFF008D5BCDA5CEFA6E37D1774BB1F3FA8BA5D29B4EA37B59DB1E9CF7EC60C4F2E459271B51A74DECD9A7234949CEE72549BEC912D262EBC8E59B7C516E4D2D92A2B9C9CF12518A845372C926ED5F8FC8ACAB6E7A8CEB1ADEF68416C923B786B069E4F4CBA14615293756FB98B43871AC53C9D49541F4B7B364B3E78E3C2B1D6F24D49F3488B146A3509E358616D376DDDDB33CAA389A4E92B6E5DDB06A51935254FC2EC427255BB4A95A46919F34BE8A7BCDEC9156D8F0BDF76A932EE8539B6DB6D73F72A9B5295A8AA5C77208C22D45B6A9FB91CBF446315CB7B9A126B9DDAA6DBF2679A73CE92DD455BF709F8315638B938DBBA57BA44B2CE53C6ADDA74D2EC88E57F852E2DAB4371EB974F094777E1155ABD3F1AE9736A92B75EE7D1BE13C0F1618B6B9AB7F91E174589C9E3C6A34E4D24BC2EE7D47D074FD1A785ABB7672DBB623D269A296DD91B62B74BB7633E0496DFF009355C52B7249AEC663556455478F614A2BA49424A49A49BEF490A726A37D0D76B6E85230E7C4B9EC72F3C1C2D5FD1FE67BD1D4CF9A72938C71A6972DCB6A31675964A9431B7E1B6911B8E4668C15D5C9BEE95B660CBD495AC6D2F2DD1D0D4C3518E2DB5897FDB1952FDCE5E7D465DDE4C3349774ED7EC4564CB3C8E5BC38EC9EC63CB9E69B4ADBF09248B73EA213E2577B6D239D9F2C209A50B6FD8B21D473EAE71D9A56FB27473B3EA5C935269FB47648B32CD2E20937FE2660CF37D34E9A7C237239DAA33666DB50A492BBBD91CDC996EDA74BCBDDB2ED565E95D2EA29731E4E7CE6E7BBD92EC6E471D5139F5FD977299E44D744765DD919B72E5D2EC88D334C3EA5F05FC5F8B51A786835738C3558A294252692CA97F5F63E8DE9DAFC3ACC91C2A49CD26E8FCD1B78DD776777E12F59CBE8DF13FA7EB3E64FE52CCB1E48B95A7096CFF9D99B9FE3B4F97C72BF4567D1AC909523C87A8FA6E4D3E796A34F176B79C17747D070C14A324DDAB399ADD262799A96EBD9D3473E3A7795C2F4AD563D56349D37DECBF55E8D8B32F98928CD6EA496E61D7E897A6668EBB4D3BC52C8A3963C537C3FCCEEC73465862DEF714217FB1C2D4FA6B5A792CF18E6C335D324D76F73E4FF0017FC253F41CF1D569AE7E9F9A5516F9C72FF002BF6F0CFB7C73A535074D37BA7DCF21F1DCF1FFED0F505256AE2A16B87D48B2F96353B1F17BBE387DC941DB4DF2479492FF689A5F527D9707679CD7E17EF2A27893EA7DDF245DD5F15BB64F1A518BAE1F2C0BA2AE29DF3DCBE0D45B8A74DF729E31A7C2AA482D295ADEC8AEB68B23535069F5369C1AE6CF6BE85AB87CE8E5C6B7B517B9E174B2B926A5D324AD3EE77F4DA996251CF8E4927249C576662CEB79BC7D4F1494B1A7DD7E25E06DDE3935BD6E99CEF4DD7E1D6E971E685F54A3538BED23727D30924EF6BA672755AEA5157DD095A74C707D518BEED0DADD3F04000058000AC081D85911D800AC1880002C00000000400148062000B1000EC4161FC8A18082C20000B228B0B1588A242158000080001F20000001607450D090D10490D11449150D1244512400491144900C10000C6243018000000000C00006000500000008622000040000050000000000400000200001322E2AED6CFD895EF42022DC9276AF6E515C9A9CE293DA97532CC93E8849F2D27B1535050A9BA972DB74EC03334AA3FF75D233CE797E4E59F4A828AB49BB641E573D5C63D1692B6DEC8C7EA997A164705D7D107293AFA6FB01E3BE2ED4A70960C6EF1C6772BE2FF00B9E1E5F3652AC70492B5D4F63D0FAACDE5C59F35BAB5EF6FB9E71B538CA2BAA9B5B71677CCE472D79AD381AC18BA37964692AE1596E587CE78F1A8DBE94E55C329C7D318CB24F6A8B492EECDB8E5F2348A0E9E4CAEE5E52FB8195E4718B4EFA7BBE1B2AEB729A9E4A72AB4BB21E5929E4E94AD4768A5CB04A38D3EB6AD77E4A884E7F2E2DF327C5F2538EE5172EAA776FCB6466E59B2B4B85FA25FDC9C92E9515B452FB36C8212FA214B76F6138A8A8F4EED73F7251836EDF2955F613A94A96C972C0526D45797E4A5AE8C76B694F85E1172A9CA5965B412A89972E5729B692B7FB20511B9678F4F09525E4D5821F3325249C52DE4955B2AC51708D24949F3B6E91D2D0E9A796708A5B5F725AB23B3E89A473CCF274369523E93E998F2460928462972DBB6798F42D225D314AA2ADDF9E0F67A38355DB87672B5E8CCE46DC789C9353EA6FC5D234C23D2A9422BEFB8B12D9597A8AA4129C14B8727BF8DA853494A515B37F8A5CB4869F4469BB6F64BBB22D4A0924B7BDDBEE1109E38A8EE92497E48E7678B76E17ECDF074A74D5BB6DF77C231EA2BA586E383A984D4ADCDDF9E4E56AA1182DDB6DFEACEAEB276DA5CAE5BE11C6D4B4A4DB77EFDD91A727578E32B6E0935BEDC9CBC97D5B34D25DD1D0D5674AD3957B7738FABCEE0AE34B6ADF93519AAB51395BDE08E46AB56A16A3BB7FE27BB65FABCFD2ADDBB5B27DD98B0E925922F365DA3D979371CB57CF864F972C9F5CB8E7729CA96EAF8E4DFA99D476E5F0BB2461E9EFCB34E75525DDFDE8834DBEE5CD1192717B73CDF82A20E2EF9DCEFFC23F0DEA3E26F5EC1A1C4FA31C5ACB9F2D5FCBC69EEFEEF848E0A549BE5ECBEECFD11FF000DBE13FF00DBBE80A5A8856BB5759751E60BFC30FC973EEC5A6676BD7251C1853F1C59C5D5E76DCDA7BEFB9D0D7677D2D2FB23899B2C2319CF2CAB1E38B94A4FB2472AF44707E20D73861C1A0836F2659AC935E22B8FD59D7D1CE4F4B8EF9AE0F33A28CFD53D4B2EBB2A69E495C63E23D97E48F55861D318AE16C891AA250708CB25FD5C457B9CBD660C7A992D1678A9E19C5FCC4D5A699D59C94F551C4B750572FBB30CE31FE272E46E97555BE15047C3FD6FD37FF47F59D5687771C52FA5F769F0616B74971B6CBB9D1F5DD6AF52F5ED6EABAAE13CAD41F88AD91CF69C25BEDEECED3D3C97DF813D936F9EC8B31F0DBE2B644134DB496EBC9283FA5EF6FB946849B8D71B041269A7D9D7E410FC29A7C6C58E6BE4CB1A8AB525252EE413C193A3225754E8EEE8E77194B775B492F079D6B64FB3EE747D3753D32E97FA12B52BDB7A5EBA5A36B1B95C1BB84BB35E19ECB166864845D3B92BF647CFF4D9238F0D35D71C916A9F3167AAF86B5AF2E95E9E724E5054AF968E35D63D0457D0B7B43628AE9825E0665A262B1B11000200188000000000180052188600218980801880000002C00002C2C4165005882C8001580000000000580585858ACA060D8800E9A1A22892206892DC8A248A86AC6889201A2488A1A0240243018C88D00C62180000000C40031886000000021814210C0040001000005000208602000100009FB6CD0BA970F66BB0EC8CD29469EE9B405796E518AAE649D14679629CA4F26D8A156FBC992D4E5E86D755A4ADB7CA47367AD87CE7D372517B45BA7603CEF512CBFC4C65F29463F4B9AB6D7FBF279CF59D6C547E5CE52C99251EA947AE947FA1DBD56A213847E6C9B93FAA94AD5AECBC9E4FD49E3D77A827D7082BE53A518FDFB9A912D717D4A3921A15293AA97E1EF4705B72AD9EEEDAE2CECFABE5FE2333C70778A32FA7A5DB6732B1E395A4DCB8B7BB3ACF4E77DA78314F2FD725D18E1DAA9363CB99C9F42C9251569C93E4AB3E6947E873A6BB2DDB160C4E52529271EE92DD951349A83F97149ADEDECDA21D5296192749BDE537CA45B91C71754545B93ECDEE50EE54DADFB76A022946314926A3CD7760A12772C9B2E29F62514A326D3BBD93EE432656F68D36BBF6441193692E9BBF2412EA8D27B092EA6EDB6BBBF229C9BD92DB8F60219723928E3870B7697018B174C65924B68D73DD8E389B75577C9D0C7A47351C7D97297764B5667AAB4B81CA49D36E5BDF767A4F4CD24A314A30B93DAF8451A3D149F4A841F3CBD91EABD3341D328B6ADADCC5AED9CBA9E99A5F911845ECD4777E59E834EE36D395F75461D269D27D4A2BC71674F1271E97D36B8B461B6CC5BC768BAF2F645AA327CCB6ED5B15426D710935E28B2DCE4D462D25F8ACAC258E1F53956DC22534A5B3EE38F576A4BB0A71774FBF67B9519332E97CBFCB7473B533938EF54FB23A595F4ECE7BF64B9391AB8CA6DAAE85E5BB665D2389AED5420DA7B76A5B9E7F57A9CB37504D2F2F93BDA9D3462DF37776F738DAB6A0A4DEE96F4B90D38B954A36DBE76DB76CC195471A79326ED26DDFFBEC6FCEDA6E72E5FE18F8393AE729F4E04F76EE6D2EC6E317C473A18A5A9D43C937516AFEC8D1A971692C7B636AF6F08E862D22C71AAA4F97C9CDD7C13CD4B76E924BC167B639C8E64BEB9393E12E0A1BDA971CD9D0C9A6708CA374F6462C989E356F84F7F736E562B496CBBF8299CAAE9DBB2726E104B872DAF9767D4FE02FF85D2D4470FAB7C4186B1D29E1D14B96BB4B27B7FDBFAF82A49D63FF0085BF05BF50D647D7FD470DE8F0493D3639AFFAD917F8BFF8C7F767DAB265F971694BEA7BB64D63869B1F4A514924924A92472B579EA4D27C98B5D73993C29D4E56DB776DDFE8796F89356DE1C7E9F8DFD79DF564AED05FDDFF0023B79F2A49B6E924DC9F84796F4EC793D53D4B36BB2C69647704F8515C2FD0C3AC767D2B48B0E18FD35B5D9D2535072C8FF0C536461150824BB1975B2750C2BFC5F549FB16A2FD127D1933CF97726FDCF39F156BDFA77C29ABCD19564CABE5C5F74E47A59A78BD3D456CE5513E75FF0013B58A11D07A7C65BD3CD34BF4424EDE33ABC96BE76928AAF02BEA5BEED6E82AA2D2E69B2117F85773B3CA942FE6FB348B20928B6F9641ED1BBE193BB8B7E6A9017C6BA57E4CBD38CD26E3E16DC94429DAF316598E12946D72B95EC46A27508DA53D9BBA689E25D39554B9DF6125092B69D3D9B43C5E2A9AD9322BD47A5CBF8A92C39574B6B692E19DBD037A7CD283974E584D384B8B89E5F4396508C32465F545EF677F2E45AB963D660B58F1B8B9A7E4E763A65F4083728A6FC1329D2E659F4B09C55A69532CDCE6D860004080040301005301000EC560201A188600200604580300001058000AF60B0001580058580000082C06162B0018800000000400C4074D122289201A1A121A2A1924457034049002040490C48600310C063121A000000000001800000C40030100000014000208000028620000001580030B15EE00B82191F4C1B7D89375BF6336AF228C526E9732F688472B5DA89647F231BA949A726B948CFA97834F2963EB865D4D5CDCDD471AF7662CFEA2B17CFD54A718B949D496EDF84BEC8E64D66F528F4E49FC8D3FE2C916B76BFEE7FD0BC2D55ADF559E49655A0FAA118D65C896F2F65FE5472B169333D3E5D567C91863DD753A6DFD8E87A9EA21A2D3430608420B23B9AAA93FEC70F5FAD7930AC38E1D114AA5296CD9D27F8C573B3E49B9B505B5ED6B92BC5708C9CE5D727B2F0909C9C5DA92A5FB9194DCD56DF99B616F5C526E2926B975641EA1F0B76FC3E451C73C89251724BB708B31E827374E514DFF00861FDC74E334A6FA9DD5D70BB093727B2726BB2E11D3C5E933FF0025AE76DD1AB1FA7AE9A70D978D919EB5336B82F1E59F6D9765DC9C74936AE7B7FDAB967A287A7453B9476F08BE1E9F8935F4A7F733F66A61E6969652A495AF08BB1FA6CE5BB874AE15F27A65A48C552A4BC22E8689B76A2DD7E48CFD9A987070FA74612B71FCCEB69B40AA2D4767CB3A50D0AEA56B75E3836E2D224B68EE4B7ADCCA9D368D2A4A34D7EC8EE68F0AE954AEF6B5E0AB069945254DB7B5F27570E34A2BB571B115A70E34BE95E0D104E3169118570B775D959654A4E92E94B97CB0CAD849CA5D2B67C37E0D504A31AE2BC99E0E308A5DB8496ED96A4DB4DF1E1725164A6A3BA577D884E729A56E9785C8DBE98BA5C94B938EEB8F25429A518B6B6BE5F7673752AD5F29F837CF2271AEE73753357BB465B8E0EBE9CA4A32692EC9F73CDEB7A94945355776F93BFACC9F4B6B66DB383A992EB6FBBD908D5733246307D736E52B74D9834F8BE666C99251B774AB737EA1B862949F6BD9F621A0C4D6923251BEB777C337F8E77CD5396528616FB71EE73925F33AA4AE4F7BF07535B0BD3CB7A6B7F6A3898E6E7296F6DC9EFEC589AF68E692524FCB666CB079236F64B8BF069CAFAA297F43D7FC01F04CBD7B3AF51D7C1BF4CC52A841AAFE224BFF00F55DDF7E0B19B1D0FF0086DFF0FA39278BD77D5B0DA752D1E9E6B65FFE6497F25F99F62845457BA7BB7DC58B1C70C23D549D524B64910CB95460DF7BD8A93FC67D5C96F4EADEE71350D755B7B1BF559EDD7299CBCF963C330DC61D5C5CB4D9E2B9941C53EFB8BD37491D3E96114B75148B54D4F23EF16CD304946AA93E08A8C139E6504B9DFEC553C4E7994A51DDBAFB23A3A7C5184949F04678D3C97EF6CA9D65D52BD562C29FE187535EECF8A7C69AD5EA1F166B64A578F149608F8A8FFA9F5CF59D747431F53F5072FA74F8DB8BED696DFB9F02C79279A53C991DCE7272937DDBE4D63DF58F92F89035F53FB15C3F137DB8A2D6E9EFC34549737CF08E8E2937727FB16249C576A65577F75C96C7C76D9A02D8351945B973B25468C2BF155DA572F6464A6945796CB6191C72A9374A4945FBA2117C1A849A69496EB7E0BA18A7972A6A34EEAD6C8A1A8A937D551BE7B96FCE94E1D16D463B52EE469D7C4E3823970F5C724E493A8BB4BF33D37A765C2BD0DC5C1C527BB5DECF21A1C3252EB92E88A49DBDACF43A1CD2CBA18E8B1ABEAC9BCBD8C69BCBDC7A17CCFF00D234FD69D74B69FB1D329D243E5E930E3AA518A45ACE4E80188080621898000800000414C688A2480621830103022D8031360C5600D8AC0000040031000000000000005000C04000000000200028E922488224881AA2688264904343424099A1340848680921A223206312040480430180860000000310C0000000000000405000000000008001808002D00BC82E01B5CD95CF228AABAF708939469DBD972794F883D6238F1CB0E19252C8DF549BDABC23D34F065D4250C692835BCA5B23043E0AD0CF52F55AF94F5795BB517F4638FD91641E131655AFCB0C992126F1CAB0E2847AABFEEA5C9D29FA7FACCF0C569B492C71EABE8CD2B6FF00EE97BFB1F41C5A3D368E3D1870E3C314AAB1C6BFD453576955783547CBB53F0A7ABEAB2CB2EAF551537DB1C7639B3F857538A7729CE6AF7B54CFADCE0A49ED7EE64CBA584EFE9FCC7DAAFD72F96BF40493EA84AFB36E870F46C31A53C29FBAE4FA067D0425751DFF00639F3F4F57555EC4FB55FA479787A6E962D5E1B5EFD8D9874B82095628FB7D3D8EA4F44FAAD3DD782B861A9535CF03A714C71271A8C125EFD85FC25D5AB5E7C1B143A693FCCBE105D2FB91AE39DFC22A5B516434D7B38DB5FC8DEA173AAA4CD38F06D692E3820E6C748925B6FE68BE1A64D5D5366EF909B5DD762E86075D5DB8682F585699C5C655C6CFEC6BC7A7BE387FB1AA381A5495AF72E862A5E1D77DD138755E0C4AF869ADA8DB8E355D88431BB49BAA5CA2F8E3DF6E3BBEECACA4937B478F3E0946F855B775C21A8A4ABFD10D3A6FC2EDD80B60A31E55FBF72C6F7285275B2FB93537D3DA8A9C58DB748A2749B6B61CA6FC3FC9D953C917CB77E1EC538AE73E696FE0E66AE4DA7B6FE0DD376DD3FD4C3A9B49BD9BEC8CD6E3CEEB54F75B24EDFD8E5E583724DAB6F6F14773549B949D5FB9CCC91B9AEFC869C1F53C727A2CD2ADD2D8B3451EAD26077F8A31A57B706CD5E9DC94F0F0B2C5D49F6661F4E93F92F4CDA59B037169ECDADEBF266BBE1CF9E54EBB12F9324DEEE357E11E7B0C9E3D42C6F66A6F67C1E9B52D4BAD354DAA69F664FE1CF8332FC55EA8DB94B16830497CFCD1D9C9FF00923EEFF62E59DCFD5DF077C1D97E25D57CED5C650F4CC52A9493A799AFF047DBCB3EE3A5D2E2D269E38F1638E3C78E2A30845546315D90B45A0C1E9FA5C5830628E2C38A2A38E115492239F2F56C9EC6E473B464CA9EFE0C59F3DAA6F61CE7D29A4F76737539B7A4C9AADE629D4EA3EA74FB1CDEA7927272DD2EDEE3CF91CA75DB722A694525B330DACC518ABDCD4A6BA76E7839D29B6D25C792E8E5E84979DDB22BA39750B1C71C36BAB35699C6718B972D9C1797AF2753776E8DB8B52FA928B692FD917ACF1E43FE2464969BE11D5256BF88D5471BFB5B7FD0F8EE17F54976BA3EB9FF001532C63F0EFA7616F7CBAA949AFB45FF0073E46D2865AECF7474CFA70F93FECB9DB57E36642ABF9937BC1B4F72327708C91B615DFD69F7E0BA1F571B6D656E3DD76DD16C1A52BBDBF9105AA9C1795DDF606E93756D3E58D34DB5DFC0E76E2DA77B7EA153E9FA54DCA93A7B97425D392E1B3AE5EE618CDCA34DB69793441F0FCAA20E8E9A729E472949C9B54DB767A6F87F1ACB9ADCA9AC89248F35E9F052CD25274B93D77C271EBCD29552537BF931B74CC7D0124A314B84900A17D34C67174000014098C4C21086C414300100C9222810120B10802C1809805911B1580300B00100000005880602001D85882C060200180800602B0B00B1300B03A48684869812434450CA8958C4868068922286806992444680900AC6031A10C0000006000000000031000C4000000000000002BDC04F7E39286DD7DFC11DFEC35557E790022D25CDB5EEC6D2AE106F274BBEC8E9697D2D52C99E36F9E8EC8B2752DE30E1D264D47114A1FE66A8DB8BD2F0637D4E0A535DE4AE8E97CB51D92FD08B692A7B7B9A9389D67E98C36492BFC8A676FF00B9A26935BBB7D8CF36E2DA7FA8564CAD3D9EC669B7135E5569BBB30E56D77D88445C95B688349BFEA26EC5D54F60A270525549DF6466C9A74F74B8EC6A8C95ABECFF0032C70EA569EFE7C85EB89930369D46FF009A3067D3B8BB4B73D1CF0A4BEFD8CB974BD49BF24595E7EDF7E5792EC734F8D997EA3452526D2673E6A78256D5AEFEC46A3A104A54EB7B366383A4BF739DA7CF17BA7B33A9864A515DE822E86254D97431B7CAD984170D7E85F14BF52B2A943A66AB8EE8B7A174FDFB7725D2A716973D992845AFBAE7DC7144216D37BA5DBB22F6BA527FA30C7149FB3EC5AE2B66B80CAB693DFB77234DBDF8F058D26D27C589A5744546DF8D81CB6A07B3F62B9B7D3EC829C9B4B6DA8AA525254F714B23AE4826F96F628AA6DA7B2BAF263CCED36D35FB9AF2BDF796DE4CB356FBD7B91A8E5E75169B977EC73A78DBB493496EAFB1D7CE9EE92DFCF830E45E137FD48DC60CB8BAA0AFE992769BEECE2FA8E966B27F13860BE74798AD94D7F747A2C906A2EFBF61E9BD3337AB6AE1A5C105D6F7736BF02F2CB3C33A8E2FC3DE913F8A7D425830C278F1E3A7A9CAD7FD35E1796FB23ED1E97E9BA6F4DD162D2E9712C583146A305FCDF96FC91F48F48C1E93A186974D1A8477949AFAA72EEDFB9BE72E88DADAFB783B49C79F5A433E5E98D2D9B39D9B2478BDD93D4656E5B1832E46DD27497716A488E6CA927B9C9D4E656CD39E6B7A673323E6F9662BAC454DCAFCF00D251A4ADF7051FA492E985B6453518C23D53E16E6694DE4936BECBC50659CB249571E01358E3756FC19549BE9E94B79BE176239F5DA7F4ED2CB36AB3C71628EF29C9F2FFDF633EB35FA7F4ED2CF53A9C8A105CB7BB6FC2F2CF997AF7ACE6F5BD4A94AE1A7837F2F1377F9BF72C9D4D6B90BE2DF895FC45EA5194212868B4F178F045FE27E64FDD9E7670B8D3DD729F834BC5DFA2D792328A4ABA5D7ECCED3C3CD7B6F6A88BE9A4F71B6A0E9F0F7D85287DD2F016A51A97E4CAC93D938AE7B7B91849D27E36232728B49ECD70FB0D3DD56D7CAF0C0D4DDB4D6DEE5B09ABA96D666C73EA8AF3C7E64E2D4BEE82A73C6E33B5C3E513C4EA29F8688A9B8B49EE9762E8C2338B70926F9E9E1906FD12DF235CA8DFD8F79F056153D147274BDE6DB7E59F3DC12E88CA9FE25BD1F55F8430BC5E83A76D737473DBA67DBD0D78E04C6072742601B030A04D83646C018862000000043421A000000022C62602600002000010C000043001000000000000080000002C00000005607486848680921A121A01EE488A24540892228900C100201A24888C068621A018C4003000000000000000000000000010C0A12626D2E583DB7124B9E58039D6EA2DA22F224AE9A27659A4D2CB55AB8E34FE94EE5F603A1E95A45D2B53923CFE04FF99D5AE7C8D454524924AA921D7FE0EB271CEDEAA6BC15BEE8BE45325B37CD014497D8CF916DDA8D33AF3CF2669EDF6234CB93F55DD98732E68DB9778B461CBF4DFF00332B199B7654DBBFB704A6DF56C52DB4D92B6B1646996C3226D764CC4E6D6F5B771C26FCDAF1DD01D26D4F9E50BA2EFBA6518B2FF234E392E3F34567D213D32947F239F9FD3A338B6E3F73BD08A6956E58F4F19C6AB9EE5E1F6E3C1E7D065D3CBAF1EF1E5AF069D16A96C9ECFBA3D3E7D1269A71387ADF4C71939E3552462CE372CADF8A6A755C792F4EF65B2EEFC9C4C19E789A5354F8BEC7471674D6CC74B1B935497145897572F733427BEEF63441B74D3FCCD32B537156D6DCDF92D53EAE29F94569BA5BD2F1E092FF0074443693A6B92B69D6E36DA7C53F61DA7B3FC985256AACAE6E9BDB66596F8455376BDC8ACF36D4BD8875455A7C86469F1BBF3D8AD2F2DB7FA22A94E692EC8A67F5274DB6FC22D945B92BD97B034B6DB7F246A39D9F1CBA9AAD9FB9972425D2D52B474F2C7C7EA659E274DBEE45EB9AB4F97366863C71EAC936A318A5BB67D0BD0FD1B17A5693A1352CD3A7972572FF00B239BF0CFA62B96BB246E4EE18AFB2EEFF00A1EA928F4F1D8E989FAE5F26BF09B8C22B7E4CDA89EDB70B8B2796775DE8C9A89D26DEFEC6DC79D63CD3ED7C6ECC39F2FD34BBF72CCF9767DBB9CECB91C999B5D64539F2DCAB946749CA56F70CADB6DDD24C4A69525C33355626973D8A32CDCDF4C785FB8B249B6D45EFC107358B1FFDCD7E865AE06D4135DFF918B5BAFC3A0D34B3E693A5B57793F08AB5DAFC3A3C4F2E695AED15CC99E3F5FADCDEA1A8F9B99D25B420B88A1274B78CDEA7ACD4FABEA9E6CCD2846D63C69ED0FF005F730AD2ABBEC8D6D753A45B1C5B6EAFC1D27872B3BEDCFF00E122F749D9196893EDB9D658A907445FD8753EAE24B40A5CA2A9FA6B7DAD7667A158A32749162D2292E122F53EAF273F4ECB14D2DD7831E4D2E487F85A6BBA3DDFF05171571B233F4884F771AF645FB33F478383E99352757DCD09EF69ECF93D467F86A1916CA9F6397A8F8735B81378E1D69765C96589735CE4D4A2EF95DCB21F893EAFCD14CE1934F371CD09424F676A932CC57BB5BA7DBDC23A3A65F35C1249B6E9A5DCFB3FA5E9D69BD274D8AA9C71AB47C9FE19D27F13EAF831BD97526D7D8FB0CE4A2A315BCAAA91CBE4AEB889A7714C0492514BC0CE6E804C6C8B0130006000020000000010C062010058800000000000004016000020000B000001000C5617DC2C002C561601602B001D8985880E9A2488A248068926450D14493191B1A089224446994481090C81A1A10C0600003188009008007600000000000000000000200013134AEFF90DBE18144767FE26773D1B4DF2B4EF2C97D591DA6FC1C7C589E7CD0C696F2691EAA105084629524A92F63596354FB51169DD324F7F613E557E66D941ADFF00A954EEAD705B2BDE8AA4DD05512F265CAF77E3C1A66D25E0C59654E9BF6B23519F2B4926DED661CAD3BEE99A72A4D3BEDB98F237E4CD6A33CAEF6765735DFB929BA77FB15C9BEC65A5337F53B127D2D2EC4E493DDF8E0ADA54D5D817E39AEC6AC4DDAADCE7C5EE8D78A6F6F62C2BAD866FABD8DB0A6AFB2EC72F04D5A7C9D0C4EE3B3D8DB0B7241495D7064CDA652DEAD3FD99B1BF1BD721572AABB5B02570353A04E554B630CB04B0BDACF4F9712BDF8F28C197026DBA3163734E563CCD2A9726AC79DD2EFEC433E9945BDB9E195C54A265AF6E963CBD5B3E577F28B54E936B8EEBC1CDC793A1A4DEC5F1CB6F669A65EB3C6C537C72BC86FDCCCA6D4A96FDEAFB16C72A9FB594E2EA7B3EC519A9DA4E93E59629DAAE4AF22BEAB5BBADC832CEAEBBAE122A52B7DD22735526D7288DBE9BADCAD137E5DFB12ABE5EE4545DB6CB14556CB7F2C229946EEB7212C2F24A38D2FAA4D246A58EBB517E8B07FF005F85BDD295938BD7A4D2618E0C10C505518A497D8B5B56DBD95724A152C691193A4D3FD4ED1C2B2E592EAE7630EA64BA6EF9346769753B39BA89B77B92AC8C59DEEFBB673B34F7A5C2F06BCB3E57EE73B2CBAA4DF632DAB6EF76F9E06A51845777C2F714525BBDEBC95E4CA97F869F65D8C5AD485D6B1DB7F899CDF50F51C5A4C7737D527C4572D956BFD4161B51FAF23E3C238197AF36479272729BEEFB0F6B6F19F579F2EAF33CB99DC9EC9764BD8CEB1393E0E8434DBDBDD972C095BE19A73AE747056F5B926945559AE71E9334E0E4CA8AA52EC96E4B1627276CBF1E99BEC6CC581AAD80A31E99CAACD4B4CF86F6FB1AB169D249D17C712032474F18F6B65B1C0DF635C3026D3AB6688E04DA4BB13AD718E1A6BA4D6FEC75345E8D2D435D4BA63FB9AF49A28AA9495D6F6CEC6087D294364F960AC6FE10F47D5E2F95ABD2C73B6ABDD1E4FD77FE0EE7C5096ABD0B25A56FF86C92B6FECCFA6E9E51C69282DDF2FB9D1C395D24A46E573D4EBE2BF06FA26A745A8CD9359A79E2D4C5F4F4E454D1EE611515E5BE59EDB51E9BA6D7E3AC98D29D6D35B34799F50F4ACFE9F26DAEBC5DA68C6E5F6B9B3D30BE6805DD8CE6D810C40213189803103100C00000004031008000040301000C5616201B10000008000002C00000056218800001B001058580030B003A4491144900D0D090D1448131218124C684868A8921A64512403191449103000400312180C00006021800000000080620000010000B75EEBF71801D1F46C5D7A996469D4152FBB3BA97939DE918FA348A55BCA4DFE47453EEF83AE7D39EBD9B20ED0DF95F9A132A2B93E53299D245D275FD519E6EED2EE159F2BE76E3C18734DDEFC23565934FFB183336AD11A8CD926D5AECF8334DF9FD8B66DD3BE3C19DCB7A7C99ADC5136EAFF72B6DEFE0B66971455555E1F67D8CA84B96F721283DDF72D4AF95C84925B7602A8C78EC5F06F6D8AE2A9B5CF82D82A75DCA36E9E5BABFC8DD866AE8E7E2DA956E6CC4EDEFC9A8C56E8BB6BF9965A557F62A86FB5EE5A927C9A4427BEE9ECFB99A6B7AFDCD525BB4F8F08A3226934458C9971F5277FB19258FBF637E45C7BF252D5BF7F266C6A560707BB7BD0945C6569EEFB76363C69F53AE7B2299C29F4AE170678DCA2334B6689C722EAA5FAF629E97C3DD7824ABDB60786A849AE3F725369AB7E2999FAB75E0975B6B75B32A7154DA4EBB323BDAB56BB21CAD4B613B7BADDFEC1786AAEDECDEC917415ED565518B6D3E5B3563C6E3BA748A86B1BAA5BB7DBC1AB43897F198FDADBA084635B9AF4104F512696C93DC466DF0E9C2A2ABF32193BB45B15B595E65E0E8E4E5EA9A49FB1C7CF36E4D1D9D441C93D8E567C6F7D8CD6E397A897D0D18525DF666FCD0B4D3E4C135D32ADEBC18ADC4672495F091C7F50D638B7183FADADDFF0094DDACCEB1E374EDBD92385913949B6EDBEE46999DCADB76DF9DDB1C31AABADFB92E9A268A84A092E2A884B62D75F995B57F7656544D362862DCD0B1DCADF62D862DF82A210C2E95F06AC58F7BFD8B218B86D6FE0D50C5DDEC4EAAB847DBEC5B0C6FB6F65B182AF25B083EAD957B10471E37D49237E1C1D3BB8AB162C5DE4BF33524A2F77FA055905B6EB6EC8D38A4D6D7B2EC674D369F65D8D10B555DF9411B314F7D8DF8723B5BFE67371BA5669849EC8D335DED26656AD9B73431E6C4E2D2926AA99C3D3E5716BB59D4C59DCA3E4DCAE763CA7ABFA53D16579312BC2DF1E0E61EE73C219F14A1357192A699E3757A69697533C4F84FE97E51CB59E379AA04C6230D9098D8801886C400002000B01300000001000008000000403EE020018AC00000056030105800AC2C560315831301D8AC4C180EC420B03AA98D090D012432286995124344492286B724411340089222860490D0902024322320631000C620018C400300100C400C00040000026F85E4056DBA5FA8EA5C5F3B03A4B7E09E9B1BCBAAC516F6725B328F4BA787CBD3E382ED148BDBAE08C6BAAC1EEDF83AB913E5BECC4DAA1B7DBB9094B602A9BBFB99F23756FB16CDD26D71DD19F2CDFE4FB86A33E59AA7E7BA31E577C76EE69CB6FDACC936FBFE865A63C9CB289DADFB1A32BB95B289AFA5A465A8A5A4D5D3DC2AD2BFD0B62B6A138B6AD6DF6EC4554A3BD7EE3E9BE774D16A83E58DAA49D1451D1D2EFB762C8ADD3EC49C3B2FC822BB7702E83F7DCD789A8B4CC904D3E0D506A5146A335AE0DD5F62E52B45189ABE78E4B53A75568329369C5A65535D5F75FB926EB8DFD88B6F77575B9559B2A7B25C762A768D334A4BEFFCCA2714FEFF00C88A8377F721349BBBDBC13757F6D85B3774469435F97B8927CED6BB9734BB8A49571BF9EC45EA29297D5C7B127BC79A688A4E3CF1E474B9E7CB07554BF6F2462AA4FBAFD8BA516D24B914235B0538C5ECAAACD7892AAFE655087D56FF005344556FFCFB1595F08BAD9706ED1A4A52A55B2461834A91BB42EDCBC5A2CF6CEBD3A2D7D2AF648AA74ECB1B6E345327E0DB932675EC629E15297F43766757DCCD36A29F9466B71CCD668D74B6B67D8F3BA94E0DA7CADACF51A9CCBA5A7B33CD7A9D29292EFB18D37970B5AFAB224F85FCCC528ABB66BCCDB937DACCD3F62474AA5A5DB607B3DB91BA41B274B92B2556096F4B9F24E289A86FF72A14609D2E4BE106B85B86385CB8E0D98B1EFC7E604218BBDDB7CB34C61BA4C9C209BA48D11C2A952DD9155E2C3D5BB55E28D78F0A86E96FEE4A18A9A55C7765BD1BBBE3B1115B4EE96DEE58A2FF00B92E94D27C164216F7601057CF6EE68827B11505C96C534ECB11641355D91A21275B73E4A15BDDF04E0E8D32D78B234FCAF06EC5955DA74CE5A9EF69EEFF00634639B4B7E0B19B1D3EBBE1F271FD77029E18E64B78BA7F637C325B4FB7823AB5F3B4B931BDED3FD46BCC48F2601C6CFB6C238BA81318800400020602000000010C4C04160201D8AC0000000002C400016162B01B61646C2C062B0B0000B10000802C004000000203AA8684868A248688924CB034491144821A1A22892603431001243121A603191B1A206310C0062180C04300188000004000000043AAE4E95BE0949D47DD896D1AEE0093E6AD9B7D320E5AE4DD54536636EBEE747D1E0DE4CB37E12D8B3DA5F4ED2FDFC924F616F5CF1DC7DB7E51D5CD06ED5BE4849AA2726533F0162A934F933E469756E5ED7733CD5FBAF24699F2BB5B18F25ADD1AA69DB5FB19B2F3C115932A77656D5AA2D9DB93F1E0874F622A092BA0E96A5EC0E2E2FCB2C4BA95B22953D83A6F9FBA2C49A540D275FA845496DBF20A352DF62D70E585708022ADAEE5B89D3AECFB9182AE392C49F15B945F075B1626ADFEC569D476EC596D95117290AFC8DD45FDFB117C009BE7C14B4EED7DCB25E3840D7D3CDBAD981452936DEDEE45FD369ECCB25ECAFDCADA6DEFC0691AB76D6E14970E892495DEC269D5FEC45274DF95DC924E4F7E012DB75B0E0E97BB0071493F61A8FD3B3E7B8D2DB7E7C92514B8404631B4AF76688A6D55522316A349162DDDD8135B2E7EC6FF004E5F4CFEE73DF09DF074FD3D7FC993AE64CB3DB3AF4D5275654D72CB5F055236E6CF93BF839F99D59D0CAE91CBD4B76CCD6A39BA99B93696FE0E5EBE0DE08EDBA675671B97D8A73E053C6D3DACC57495E3F2BB4FDCCB375EDEC6DCD1719493D9A935663C9BF1F991BAA5B56AB9409A6F61D6F6492497BB2B294536E9705D18DED45504EF6E0DB8F1EDE48258A1557B7B1B71C36FE48AB1626F76AAB835C20925EE516E2C692B695B2E841B95F2BC0F1C55525BF92FC715176F92221D32E12A2C5064AADAD89D37B25C815F4F1FC8B941256C146E48B5452ADED84EA2A3D5FDCB52A7490452BDD8DC69EC6929F6F604A97215B7B2E056FB951641ADACBE3371B4BF73345DBD8B53556F72A35C26ABD8B54BAA2D79DACC707C6E5F09FEE11E732AE9CD35D949902DD43FFEA72FFF002654726C980011484C6201300000060200100008180005880000040016160200B0B00B00001580C402018AC056C002C2C2C01B0B109B01B684C2C56075932488A248A1A1A22892286862434048684A802248624C680634243018D08082432230180000C64460301000C416BC8AD79018AEC2D76136FB2DFB0037724BC04BDB922FAA1BB97247A677BCA9B289F525BDDB676FD1D5695CD3BEA93DCF3D3C724DD4F7EF6B63D37A662F95A0C2B96D5B2C66B75A5F6F6077F90220DFD3B7274609F35D8AB23FD8B1A2B9AB544552DEEE8CF34E9D7EA5F25B522A9ADBDC34CD913E3BF932655F99AE69EED332E4DFFB91595A69589D2EFF00916CAB82A69A32A8F4A7244D2DD6DB1149A916AECD850A3BEE3A57EC4D2DAFF7135BAF01116AFEE24AEED704DA49A6B640E2EF6EE1528ADAC92493B12B4A99348A86B77B1357DC825B27EE58BBDF25445A6FEE437EADFF0062C6EF613AB020DD3DF8F245DF9DBC929BD9BE7D8ADB4FBEC8056BBBDDF1EC41AD893DEDF722DD11A88B4F9F026EBB5264DAADC8B6BA5BAB0A2B6B7FB02926EAB90B6F749824F95BFB813AB5CF25A9248AD35B27BB2D4B7D8012F1C962B4B65EC416CA9792D555FD40691D5D0C7A74B17E6D9CA4F9DF7476B043A70C57151565CB1BF4727B72573FFC1397E2F62A9B7DB736C4519DFD35DCE46A1BB6BF43A99778B7E0E6E5DDBF1E4CB4CCA17FD472C5B535F62C82FA8B92BA6D2F0655E07D5717CAD7668716ECE6B5BF3F91DFF8971287A926B8941347025499976FC26B648708DEE382B7BFE85D085D25C04E1C216D25FA9D0C38F64558712A4EA8DD8A14ABC85A94634A93E7F534E2C49536471C175234C52412A4A3D2F6D8695BFEA0DAFD49C571B01349456DB8E9BEF40AEF75F91349D844A1048B146F9082AE377DD93A7C5D16335169AA6A249269782554F67B213FD4D324D5AAE5F820E2D6D658DD6FF95907CEC038269EF459BDF3B155DAD869BEDC7728BA2D24996A9546FDB9294D573B0B3E5E8C527D945911C7C8FAB2C9F993202BDEFC8ECE4D810C40020130006000200001301916C0001B10000310000800002C40310080620100C40000D83158360026C2C4C02D8360D880762158581D74C688A1A604D0D11434512431219434493228680958D114C92610C911434C82402B1800C400486446034161D81200DFEC14BEE3000A5E04F6E103690EDF8602B7E05B2DDF20E75CA64549CB7DBD90127152E7B94A9B8C9AE5D6C5AD37C906928A696E8A2327F425772934A8F5F820A1871C7C248F25821F335B81729CD33D876D8D659D15B4EAB6F226EF6ADC13B6C4DAE11A64AD2EFBA2A9F3C936F92B95B0AAA6E8A272BFB17CD72ACCF9234B77645679B6F82895D1A24BB94646EE82C52EA937C94B6DFD8B66B6DC828DFDCCAA14E89A7B5BF20F8FB11B488D34636A6BC126970FF223855C5782D4ADEFF702BAB49F81A4EEC6F6BF60BF1DFB041BD6FC31A7B35CD02DA36FB822C44937CDDA269ED75B104F6E36EE4E92EFF99A427BF1B09DA4D3FD49B48ADDDD7280A936D6C0D2AA7C924926EB864269777BF622A3CADBB106F7DFEC4FB916B7AFD48A1ABA0AB5496E24AB6E1B249EFEE14B7E387C6E0A295503DDDAFD18F775E40135DCB62ED22B49DB7D8B15EEFB7802D4DF4DD0E17D3E6C8C2E51DC96F74B9480B31C7AB34635CB5677125D271F46BAB5307E2D9D77B2A37973DFB425B5BB2993EE5D37C14642A33667B18337746CCAFC7630E5FC4FF632D4886356EEECD0952AEC67C7B3A5FA1AA2D56C0795F8BB1B5934F92AAD4A3B7E47946EEEF63DAFC610FF00E834F92AAB235FB1E25EEEFB18BEDD73FF0054A0ADA35E28F0CCF89DBDCD78A935615B3142DA3642292DFB19F16EECD706ABC845904BF3E68B95255DFB99D3516DF3E0AB53AC58217CCE4EA105CB666D56B79230925CCDF63442DAF77CB3169714A31F9995A7965CBECBD8E86383957642153C70756CB946BDC8A55B2DCB14691A629C156E492DEDAFC8696C875F55AFD0D324A2DF20D2BB2526D7620D3B084DAB6BC7246FEAB4AC1F1B71E412AE5F250DF3624DDEDC8DB4B84092EFC80D3A466D6E4E9C3D37BC9D1A1AA8FF00439BAC9B9E6A5FE125F42892E1F70A5D88A76BA5F2899CDA02636265098800800600020013006C4D858800560201880000002C040020010EC560000D89B01DFEA2B158AC0762B06C1B00136026016160C4D800585801D64C92208926049124413248A2434C8A24031A6240B828982121A0248688A248218C8A181201219031A2230248043000B000189BA0BA04BBB00A6F9FD01A4F95600047A576DBEC24B76BA9D3E0989AB5EE059E9389CBD5609EEA29C8F50DA4AFB1C4F44C49EA32E5F114ACEDBDD6FCF83A67D31AF68F87D88BDAC9B492FE48AE4ECA22DFE645BD893E0ADBADBF402B9F928937BFB974D5B299AADBB91544F8DBF4334D5DF634CD6FEC54E2E985669A5CF822DB4AD164D357FB15BE1F933555396ED79E0AF2B718B927C2253692B336A675864FC2666B71D2D2353C49F67CB34B5462F4A9A9E87164ECE29D9B6EF7BBED4252A13556FB32295C7C3F24E4936F7E56E4629ECB845434AD50556DD875B6DC8D6F156B72C6493DABC125CF3F9104AB7269D3D8A89F11F1E0836AAF864B67F77CBEC4249376FED404534884FCD724BA6B7488CB77B7E816217B702763952EFF00F923BDB7C1149349DFF3F21772AE0125D5BF037E11143E290E9AE7B916EB7269B69571EE5162A4BEE38A6A44624E2FEA02D8255EE49AA42827458A2A9DFE8117E8235394EEE9248E8DBAFB99344AA2DA556CD8D3EC74CFA73D7B5527B95CD6C5B25DFB954FFDA148C5992B7673F32DF6DECE8667BBF261CBBB6CCB4AF1BAA7CF635C3868C90B4D767E0D906924DF6E425717E2B875FA2DBE63922FF99E0E4F7AE28FA17C4C94BD0350FB45C5FEE8F9CCDD4BD8CD75C7A5D092D9F735E26B66FF00539F092EA5BEC8D509BEDB91A75314F8A7B22F8E5A5BBA3990CCB6EDD88EAF5D1C58DB724AB932BC6DD4EBA38ADB9525FC8CFA1CBF3732D5644E5925B61872D47CFE672B4DA1D77AE648B578B4976F2496F25E22BFA9EDBD3BD2B0E963F4C77FF33DDB1C2D912D2E0C92A964E5F6EC8E94313496C598B128AAE117A492548D48E774A141AEC4AACB1A7414B634CABE2B61A6BF41D2DD89BABA081BDDBEC424ED6DF905BE9E08B7D98119497F64252B9576149F65C11BB57CD054937D4DDEC591AEAA654A947DCB634F72A0CB350C729BD94537679E596729BC976A4DBA367AFEB61A4F4FA72A795F4A39DA09C72E9D2BB6B6B4674B1A14D4B2C52D9D6E8B8CFD3595766B865B19BEAA96CD7730A9898D898110060000206026263626026C018800560000020B0188416002B0B0000B10003100008001808005600020B00B00B1580C4C4D89B03B098D114340490D3121A02698D32298D144D02121A025D86450EC06868480A89A6344468063158D00C2C432064888D00EC043007B8B7F23000AF715B5DAC6002B7E05F57B22445BA4076BD120E3A7CB36EFAA5474DF66B9EC63F4A8A8E831BE2EDB36BE5783ACF4E77DA2EF9BDFB107C57724DAE08BB020DEC56D6C8B1D762B7B2F70AAE75C143F3FB174DFEA552D96E154C972CA66DDAAE3B974B745524AAC8AA7226CCEED73D8D13FDFB19A69A6DFEE4AB19F33AFEE60D4CEB0CD794CD795BE96B97C9CAD5E4DEAE97739E9D24763D027D7E87824DFF85ADFF33A1832A9C3235BD3A383E819D47D1630BDE1292FDD9BFD2B2FCDD1CB27F9B2C9A7EC179EDD14DC93763492DFF62305516DED65904F6E3634CD27B31A7C7761B375CB05BADB62B02B6E416DBDEC86B6A409143BD887364B7BF61354AAAA82216F97C106D57B936D557EE57557DC29386CAC837DF826DEDEC41BEE450AD6C46DDFB027CD70453A7FD48A9DAB24ABFD0CFD4D4AC9A9B4EBCF70AD2DD3F62C86F5BEDE0CF16EF7DD97C136A8235469D57626956EB8657863E7F345DD349D151B74AAB12F72F21A7558E3F62C952D8E91CAFB424679F25F2299A4D50A461CD74D18E6AFF2F26FCFC37DD9832D3335B8827F5275C1AA3C7B33124DBD8D58EF6BFD0231FAFC3ABE1FD727DB15FF0023E6139A6D9F54F594E5E87AF4F77F225FC8F904F3AABBEC66BA63D35466916C33D2AB399F3FC324B3BE9E48E8E8E5D5C71C6DCAA8D9E97E912D7648EA75B1FF0097770C4FBAF2FF00B18FD2340F59996A332BC517F445FF00899ECF4D892A6D53096B5E9B0AA492492D924A923A58A0B65E3B19B1256BD8D905B2DCD473B56A4AAFC1248171CDD924D515945AAE17045EFF0072C6935456EA2057FED916F97D872972DEC8ADBFA6D100E5BD3E0AE6DDF3B781C9B5F72B6D57B8526FB2EC4578F227CF20AD495EED816A4B62D4D7056AB6F0473E58E9F4B9336495471C5C9B2A3CBFC499E3A9D4BC4B78618D7E664F87F55D70C989AA941F1EC727D2FD517A86AB54A7B7CD9395F25DA59FF05EAC95D29ECFDCC557AB71EA4A5DD128FD51DF9F211FFA6ABBF0355C1951BAD9EFEE163DD6C2600C430010862602600C4016458D89803158310030B13000B0B06201D8AC2C56001626F7000B0B0B1580360D88401616800018AC04016C5600C01B13626C4D81D94493228698124493208926049124413248092634450D30243424C1144D30424C6A8218D114C91434312001924450D00C624C006862180C00080000002B9BEDEC5841AB947DDD147A9D1C54747893E7A517364312E9C515E2289B7E783A39A2C849126D7088B7651074572575E0B1BE515B5B6CC8AAE4AFEC553AE0B9A545535C8550EDD9535B17B4572E1FB9159655BA6FBF733E455B7269C8D2E6BF332E47B5FE64562D43E9DFB1C5D7BDBA96ED728EC6A64ADA7C9C6D636E2FC7B9CF4EB973F43EA6B4FA3D66372A71937FA9EB7D1A3D1E99A783D9A826FEEF73E55EA7AC783D45E152AF9AE29FD8FA47A57A843269B1D49528A4873875DF9349A49F1E09C6492FDCC71CE9A5BF25909DCBD8D315A5357B924B9FB15AA75E4B5B756566955EE87B3FB8D3B49F61DFD57CD95106956FCB13BADB9F24E4AF8DC8BA4BEE056D2E3820DD4B8D8B25B2F1E0A9BF3C915093B97B116D04DBE5EEBC15B937CF7E0553735C792B93BBDF609BA6576D2E792342F627193B456DAFCC69D01AA3EC6AC4D3AFE664C52BA75B706CC4D74D84AD98A34AFB97C13ADF76CAB13525C6E688A5691586B82A8C5224D2BBEE115B0A55475735527B106DD78B272EC8AE4F97E08D71973EF673F2A77FD0E865BAE6D18323B6FD8CB5152694B8E3B97E36AD78ADBC33327725D997C1571B00BD4575FA5EAE37CE09AFBFD2CF8264D4E484575426B65CA3EFD9D29E973C7CE392AFC99F9FB3396E95BAD812F1086BE3295396FE1EC753D3A0F5FA9861871CC9F8470E7A77913EA5F9F73D87C2BE9CF47A1F9936DE4CCEEDF2976259C8DE6DB78F4FA4C31C708C31AA8C52491DAC116D247374A95C68EC604B632DD6AC505E773663492DCA3123445D236E56AC5EC095FF00612B5F6249B5C150DAA2A925E772EB7D36CAA49320A26B62A6F845D9173FBEC67937D5B7620AE6DD9077D8949BEFB95B6D0527CFB134DED5C904AE5C138A6BBEE0A924ED59E67E3FF52FE0BE1E78212AC9A8928A5DEBB9EA16ED1F24FF00893EABFC47C431D241DC34D049F8B7C967966DE395E8DABF93AA83BADD267A9CFF00F3E6B32E62934D1E171C9C6509AE1B4CF6BE8B9E3962A391DC5AA6353F4CFF001EAFD3B50B51A4C724EF6A35CB6DCE3FA2CD63965C29ECA5691D974D339B43901456C37B052A0600C81322C6D898098818801803100080400C01B1580082C5603100AC0762B10AC06200B000158806210580C561626C07621313600C1B06C56076531A6450D30268688A634C09A634C8264930248688A2498124322340490D322868A243EC446980D1223632A1DEC342040486243004310104AC040048040DA5C803E049A7971456EFA91193757C2F23D3AEAD563A4E9497E651EB93FA6976484DED609EDEC27491D5CC9EFDC8BE36EE3E04DF722AB6AA57E79232E36E4B1D56FC22B682A2D94CCB1DF53ECBB109BEDE00A9F1B954ECB5BD8A66F922B34D5B7BF264C8E93EED1AB24BCED463CADEFEE46A316A1AA77C9C6D6B693DAFDCEB6A1AA77DFB1C7D6B7D0EFB18AE91F37F5583D77C54F1286492824BE8ECCFA77A0FC377A683FE23558DB4B66D348F0FF0B61C7AEF88B53A89CF9CAE973B23ED1A084638A2A30BE2AF647692738E1DBDEB87ACF4EF51F4F8C726194B5B16D2F96A353FCBB6C4F4DEA109C6F229E369D35923D34FF33D428DCF76BF0BA489CB4F8B512C7F36119C629D464AD599B89F8B3E4BFAE362CF19ADA777C345F19AB4910F51F4AC59671CD8724B4CE2EA4B1AB52FC8327A56AB4F073C595664926E2F66FF00A12E6AFDA55C9ADDF81A6AAF9463F999B1C54B262946375D5CA2E8678495DA6C83427B6DDC84AAF9175AE48B9AABBFC8A826D5D705126FF426DAA6D77654DEFECC8B116DEFC155ABE4739277BEFDCA9B49B64684A569B446525D36F72329371FB95B6DBFB20A69F9EFFC86B2272AB29F99DAB71427F536D05743171674706E96DB9CCC0D6CDEE763478E592DA575DD7019B5A71BAA48D58D5CD59428431FD5295BF08BB4F35932D25B25C9B99AC5B1B16C81A1F65B83DF636E6A67B7DD95369FB174DD6E8A5F9FD8CB519F2FE196FC7639D9573B1BF3538BE76306575B19552A2DF0F72D82776F9F7EE57BDAB2EC49DDDEDDCAA9C93F92D76716BF2DCF82E7D6AF9B912D3C52526BF767DF5A755C76A3E05ACC0E1ACD442BF0E59A7FAB2910D2BFE335B8B02C5F8A5BBF08F73A6825D314A92496DE0F33E81A6E8964D4C96EFE98FF0053D56962DD18D3AE278EBB1A48552AB7DCEB60852AADFC9CFD24128A3AB8E3512C4D55D0DF8E0B5277FD0841516A6915CD34D571B924CAF67BF7EC4937C944DFDFF322D3AF2877DB87E41B55CD8144D7E6669AA36349AF0CCF9237B5106593695321BBDE8B7243F52BAFD4CA92B6DB6492B12B6E892454473668E9F4D97513DA38E2E4EFC23F3CFA86B67AFF0053D4EAB23B965C8E5BF83EC7F1FF00A8AF4FF8632E352A9EA24B1AA7BD773E2938F4CB654BB1ACB1BBF8D9826A50E95B56E91EA7D0B27528A4F9E523C76193528FE87A0F46CEF0E549EDF517466BD9E8A72C1EAD1B75192A6BDCF4DCA3CB656BE760CF7BC6AFDCF4F07D50524F669338D74340F705C01146E45D926C83600C4C1B100818306026200001361626C04D8AC18AC07621030060200060162001009B0189B06C5603B1589B1580EC56162B01D89B1585805A1585801D944911434C09224882649301D9244531A60493249914C6981243424C10134084868064AC88CA1A1890C063421950D3248AD3AEC4ADF86048056FC7EA1BF9A02426D2FBF8152EFB92492E100BEA7EC86925BF7F2C05CFD804EE5B708BF49FFDD635D9C95157F8CBB44AF578D7FDC823D32B4BDBC0369AA06FB09EC74611AA5446489B6424151E1106FC1293FCFCA2B61517DDF255277F62C9FE12876BEC15193EC679CB669728BE4D74D23365DAD90669B7CF732E56DF3C1A26D7931657F53DF6A256A31EA64ADEFBA381EB7A95A7F4FCF95BAE98367673BDE8F21F14E74F062D37525F3F2A8BB7D8CF3B5BF51A3E02D3E7CB8632C781A4DDB93547D5B4BA450845E49B93F0B6479AF86A1F27438F1E0C12924953AE947A35A5D56A1565D47CAC7DE18B97F9FF0063B3856D834F2A508DA49A725C22E86CFEC66C5D187A7163AA8D6C9DB4BDCD4D74CBF70CB0EADB8DAECCD8D75635E1C53336AE371B2FC0FAF4D89FB57E606495C74BA8847F145F55792D9E9306A145CB1AB714D35B32728461924DF0E2D0F4CFAB0E37ED40735E96129E7C78F24E393153A7BA71625A1D4A8A69C1A6AF9A65D9613C7EB58722FC3962F1CFC51AD6D8A2BFCADC49C8D76B93934DAA8BAF94DDF1D2ECCD9652C6EB245C5BECF63BCE7B04F0C26EE71524E296EAC972B34F34E69B6EF6F245C96FDECEFE9B0E9A791AF910F998AD37D3CF86551F48D349CA79E73949B6D28BE94913E8BF78E03946DF92A737BEFB51E961E9FA3969658FE56CA4EDB7726FEE519FD1F430C1D6B14FE9DDA53DDA1F4ABF78F372C89274EBEC6CC1E99AECAD3F92E09D3BC8FA551E8B4D3C0B2BC18F0E3847A538A51FD05ACD5CF49286551534DA8FD52A51BFE83E85DDFC53A3F478C2A5A8C9D4D7F852A474DCE308A8C6945765B239F9F5D9945378F153DEFE6559CF9FABE58BAF9189F6DB29AE48C79AECCF2ABD92FB9A3D3EE5D527C5D23CCBF55D4CBF0E920FFF00F21E97D1DCE7E9D8B2648284E76FA53B4874B1D1645F1B0DDD6DB117BFBA2B2AE7FB153E2AF72DC8EF64F6297B6DB57632D33676FA696EBDCE7E554EFF0033A195B68C195D4A895A8A95DF3B793461BE3749F0D7250DBAA4A8BB1369A77B78215A1EC977DECF87FAFE1961F5EF50C6B76B513497DD9F726EE2972FC9F25F89743287C75ACC8E4FE5351CDD3D9B697F52D5CF955A4C4B4F871E25BB8A57F73BDA185D37C9C4C0DCE77C9E87411DA261DFD476F4C952F08DD05B1934F154BC1BA3495F7EC6E38D4952A249DFD84BB0FB7B15134E978269ED656A9D12ADB67F99112BBE0927FEA55BFF00E013695AFB145926BC6E5324DA257BEFC916D704144E0EDEDF915354CBE49DD909257F702A6B75E49A4D3FB02496E579F3C74DA7CB9F23A8638B937F603E59FF00133D45EA3D6B4FA18CFE8D3C7AA4971D4CF0F99374EA91ABD4B5F3F53F56D4EAE57797236ADDD22BC90738B4BB2B66A7873BE6B2C7E9973B1DBD036A319DDDCABEC709EDB27EE777D3A71FE053EEA490BE932F618E5D5A6C4DBBF73D368A6FE446327DB66795C1FF00DAC927BED47A8C1B61C4F86A2ACE55DA36F6136252EA889B32A1B1360D898098862000600C08B10D880426C6C8B600C883626C06206C4D80DB158AC56036C4D83626C06D8AC4D8AC06D8AC0002C5602000602000B000010C56076531A2298D013434550964C98B5197160C99306995E7CB15F4E3DAF77F624B245C6328DCBA9A515156E4DF092EE5E27560D0962D7FFF00D1FD53FF00D164FEC464F363C90C79747ABC5967F83164C128CE7FFC62D5BFC8729D8B531A2BE9D62FFF00847AB7FF00A0CBFF00FC87566874BCDA2D6E9E32974C65A8D34F1A6F9A4E496FB3FD0729D8B5124C8592445491244131A0249922209944C1114C92640C64531A65124C6450FA924DBE115121942CEDCF1E358350E79575638AC32BC8BCC556EBDD1643247247AA375EEA8713A98C40DECC28E5D765C8C4B643401DECBF40BFFAEC7EF228E4D3E9CAF5D8FEE27B47A36C8D6D637540746516424F62CD8AE55BFEC042441BA1B7684D3FCBC85426ED7F433CF7749D517CDED5C99E6D26EF60AA67351EE539649A2593CF933CDEED1154659A4F6E51873B54DF099AB2D56FBB660D44B7A5C78335B8C79E769DF08F26B161F53F8C31C75138AC3A58A7F53D9C99E8B5B9962C3293D924DB39DF01FA62D66BF51EAD9E172C991FCB6D5D22E3DA6EF87D2B4108C70C7E5C1F4A4A9A55B1A32CE6A2D474F9323F1D4A2BF565B8A09455B1BF909FD5537E1EE747164C18734F275EAB369F1C16F0C18A5D514FCBFF00333A8EA518B56D797C99A2DDD61D3D7BD28A34413E9945CADF3B04AA3511EAC6D7B0B44EF4F5C38B65B356999B4AFA33E4C77B495FE6059A94DE39573E48E89DE922FBC5B45B35717DCCFA4FA3264C7D9FD480B73B56A4D5B8BB4CAB4D963967960B9552279ADC5A5B98F438DE2D65BE1DAFC80D72DAFF0099749AF9507E628AF2AA935E0941F5E9D2BDE2E80E6259317AD43345FD138F44E3D8DB965D12925D8A352AA2DA7525BA610CBFC4E9619BBEF197DD0559827D51C90EFB4921CE7F434FC197E6BC39A393B274D7945D9A3D3275BAECC0E4ACF3C5EA71C8DBE94947EC6AF5BACBA49605BF5493FB146A715BB5CA2595BD460C7915BDAA5ECD0555A271CD1A7814F245D4A79256E8DEB069EADE9F15F9E939B8A33C19BE6256D6CD7946C5A89CDC54305F57173422AFF95A68EEB0457B23BBA68A860C692A4A2B6F07022B5129C54B0455B49B792CF470551497012A4DBEC41BDBEFC937F72A937FA0A8AE6EDB2136D226EADBF05527BF3C7832ACF95FD356CC19797FB793A1963F4EFCF930657BF16912B5145B4F7DD16E295B54F7452DDBB278DA524B86656B7C1B71DF9EC786F8EF4CB16BB4BA951AF9907093F2D71FB33DCE14EA976FDCE1FC69A2FE2BE1EC99631B969E6B2F1BD70FF6357D18F6F05A25725E0F51A28A515B1E6B415D499E9F436D2EECC477D3AF8368A5D8D49A5467C4A9517C6AF9E0E8E15626A869B7B76156DE029F7FD08249AFF5256CA9BDAD31A93EEEFDC226DBEC2B5C6C2BB7762EABBF204D6C8524BB72413696FF0090DBB56047757645F724D5916D71E38020ECF1BFF123D5FF00F4FF00877F84C72ACDAB9742AE547B9EC5B6DA4B6B3E2DF1EFAA3F56F8A7263C72BC1A45F2D6FB37DC44B791E6F0A69A5DDF06A4942336FB448E2C6F3648A51AB75468D4C638FAA29DD2AFCCD562472255BF9F276BD3DC7FF4F8FF009BA8E3E4772FB1D4F4C85E9777BB96C2FA4CFB7ADD236F4B89F2E5248F671827831A5CA8ADCF1DE990EA58B1B7DECF678B68453F072AED0A1B49A6CB082AEA7E091950C4C6C8B600200001360D916C01B1360D916C01B13636C8B0130B0626C005602B001360C4D80362B0000B0B000100C4C0043100080002C4C6D91006C4C2C4C0ED207F21E6C71D566D461D34AFAE7A7C7D73E36497BBDB860812C6F5185E6CBA8C58632EA964D324F245A571714F6FC5459ED2FA7A0D265D266C30D5FA46BBD43D33D37D2E31967D0CBD3323F9CE769F5DEF95ECD7D375FA3385ABC9E892F54D2E4F4D9EB741856A239658B51A59AC7F4C938F4249CD753B5C34A9F1B5F5F4BF10E9B4FA4D669E7EB1F12679EA14543364C38BAF0537BC2925BDEF69F0723553D26B35BA5CD93D53D6B3D3ACB9B53831B9C631FAA2A2A292FC4DF37C9DED8E1257B6C98741A8C99F3EA3D3F22CB37D4ABD3653EA7EEDE9EFF99C0F539E29FC55F0E4164F93930658423A67A7C90728B9FE24DE384525554918B59ADF47F515EA1AED47A66972FA866C3D1A6C5ACF4CC59327CC4A9649E551A77B7D3DABEC9473EB74B9FD57D1F5D1FE2F04745931E39E9A7860A18B1477FA1E34B6E12542EA24CD773AB4FABEAD6E4D7FACE28FA86AA7E958F162D566E9C39A3932C5E58D4B64FA57B2AFC8E6FAD658FF00E971D1C72EA737F03EB70D2CB2EA734F24F24A3A4B72FA9BAB6DECB6EFDD866F89FD5966D765D263C50D3CE0F1E9B157FD269CBFE6AB5F89F55B4FD911F54D7E97D434BA7C1A7CF93539D6B63AACF9DE99E152E9C3F2F74DEEDAADFD89752CAB33658C79E538E9F24B1FE3516D1D0D2FA34753EB5A4C31D4EAA3E97A9D043571D4B943AD4E525158EFA6B992EC62E5512CDABD64FE1FC5E8F184238F1668E5867EAFAAA393E646355C2925DFB1CF367EBAEE5FC2C7A48E187A647D4751ABC59B5BEA59B4728E39462A38F1CA58FAF78BFF001A8FB548B27E95AAC5E8FEBFAAC9933C755E9D9332D3614D567C78A9B93556ED49715B8BD67519FD7B54B519B1434CF1E370C51C72EAE96E5D4E574B76EBF435E7F5AD76A3D7349EA92D2604F4D8726178164FA722C95D4DBAFF00B63E7837DCB1CDB3E7F4E8E3F55F53F4DC5A9D5CF5BA3F4E8EAA3173874CF355CA15D3C53856FDD97E2F45CF971FA0359F3FCCF50C8B1EB2171FFE9DBC4F2D2DB67D29ADEF768CF8753A9C1EB4FD614213D4CB2CF24F1B97D328C935D37E12AFD11660F54D7E0CBEAF923831397A94BAEDCFFF00B76B1FCB4E3B6FF4A4BB703B92CDB1433ACC9434937259B50B0E9E591A6E4A53E98B755CDA674B07A7FA5E7F88755E8B1D7FAB2D568F1CB24F2FFCB58B2B493696CDAAEA5DBCEE7323A658F43A7D361D2E2C7A8D3E759E1AD537D7F4EF18F4F84EBBF6E0EE7A3EBE39FE29CFA89FA46974DAAD468E7F3F551CF293C8E3D2925174A37DF96E97819FA9AFB3CECF533C5F0668BD7BE6E579B53972639636D74251EAA6B6BBFA7C9D3F52D22D0FC499BD27143D535B18618E550D3743CB26FB36D28C63EECC3E9EEBE17D37A5EA7D2B4DAEC38E7FC4607972CA1F2A7EE97E256DED693BA674351EA1A8D47A8FA8EB33E83164C5EA1A58E973E996A250FA55EEA695AFC4FB0FF89FF34B51E9DF235FE87894F57870FAA4E509E2CB384B2E09456E94A29C5FEFFDA8C983452D27C40B49ACF509EA7D1DCDCE5A88C163CB14E49C524AF6E96AF6B7BF0E831E6CB08FA2C717A769F4F8BD2272960C50CD26A49AAA6DABFCF7B2BAD57FFB630E0D3E39E5F5BEB8352CBD2B1B9394B675BFE2F61DCA734B74B875197D6FE12C5FFAAEBD4B5DA17954D4A1D5817CA72E987D355B57D4A4FDCCD8969B0FC3DA9F57D76ABD4E51C3EA1934CF169BA1CB2A4F9FA92A7CB6EFB3D8DF91CBD3FD57E1C78658F53A9F45F4F8E0CD18CFE8EB78FA1AEAFDFF00431BC3967E8797D2A58A0B1E4D5CB56F229EEA52BFA6ABDF92DB09357D37CB430FFDD10F47C7ADCCB472D0AF50966924F24715B4D715775DB87DCC98A5E9FAAF41D47AC68351EA7158B538F07F0FABE8DBA9C77D96F6A57C97C351EA397E23D2EBF47A3C393551D17F04B4F2CD51CD8E2DC9AEA6B66EFF0060D5E9568FE0F9FA5CBD334DE93AAD5EB23961A0C5AA79E518A69B94E7EFD35B6C952439387752F28C505AACF9E33D4CB4FA6D2E9E5A9D466824E4A0BB47DF97F915E8E1A7F53F52C5A7D164D7E974CF04F519E5AAE994E308B5BC6AD6FD4B9E0B3165C9A6F53CBAED26834D87165C3F232E89CDCB1E48F7B75B37F6FD4AF4BD5A1D6E0D57A7FA7E2D1AC58E58E5A796A259639632AB4E5256B855E28CCFAB57ED59B3EA74D93E1CD7FACFA564F505FC0B8FCDC1ACE86E7097138B8F1CFECF63B78B41A2C3F1461F48FE3FD516AB3E97E7E39B50E8C6F7D9BADDECF6AEDCEE72351A7866F48D47A5E8FD330FA669351353CEA1A89669646B85724A96CB63ADA49EA753F13E1F575A7C6B361C1F2563F98E9A49ABBAF72F73D679AE27A5D7639E8753ACC3AAD664C9A2D5474D9BF888C631CBD5251EA825BA56F6B77B3B3BE71F07A5E4C1A4D5691283C7AACD0CD39756F171929525DF83AF7FA96F1732FE86CAE555E49B7BAA22E88DABBDC849F6ECC93555441BDC2AA9ADBEC67CBB9A26DEE66C8D55BEE0679B54D19E7691A25B2664CAF9AFD48ACB9787BDA39F99A5176E99BB2BE9E4E7E66ADD99AE91E6BE26D52D3FA6659393A71E9DB9DCF47F0747347D2F0C618A38A14AAF791E4FD7313D7FA96874314DAC9954A497847D3FD2346B069E114AA92491BC4F0E7BBE5D1C38364E6DCE5E1BA45EF16797E1CF0C4BC431DB27083EC5CDC31C6DB4BDD9A726778638E179B5395AFBF4DFE81824D4D2C78162C2DEF29B7D52FF007EE3C8F34D5E18C232ED3CAAD2FC88E2D34E32EACB9F267C8FFC4FE95FA202E9AA6D18B2378B510C8B84F7FB1BF2767E79A326A61D507FA945B354DAE57666793F979B1E4EC9D3278A6E7820DEED6CFEE2CB1EA835DEB6209CD7D4CCF97E87192E5772EC73F9982327CA5D322ACA9C934068C8D4F1C722E1ABFCCAF04929CA0FFC488E91B9619637CC5DC7EC464DC64A4B94C086A22EDA33E81A866CBA77C4975451B754ADDAE1EE71B24E78F5D8B3456D096FEE82CF2D99609DA63D36759632C32773C6B6BEE8BB529276B86AD1CC73783531CD15BA7BAF215A7242D34CCD8B23D3E769A6F14FF1451D09F4CE31C90770924D33167C4DA75CF29908D33C38DA4D3B4D5A6B866753960C894733841ECDF3459A49FCC83C2DD5DB8B7D9F832EA13B69EED6C3AAEBE9B14E7A9C6DCF24A29A76D2499DB5B2479BF429CE5A9F96E5F4E38B697367A54BCF058CD26CAE55DF82C7E7B954E882126AB6D914B696C9EEFF0062E6F6BFD8A5ABFB7922A8CB6CC1992B6DBA7D91D09D55DF3E4C3995FF005256A32369BFEA383A75C6E45A693BE7B8E0DEDBEE8CB55D1C4D56C5D970C3518678B22B8648B8C93F0CCB85F1FD4DB0DE34D6FE4D32F9362D34B43EA19B499154B0E4707EF5C7EC7A5D0BD97F2457F19E85E9BD5B07A842350D42F9791AED35C7EABF911D04FAA31AE7C18FD76EF675DEC7C24B97D8BD5233E0E179345DECBF536E552BB54D71DC1BEC45BA5EFE48B6D34C093976139F65FAB20D917355EC45E2C534B975EC3EADEBB14F55D894A9DF609C5E9FE9E49594A6E9EE4BA925B772A1B7B7B7922DED60DBFBF922DF620E67C41EA71F48F44D56B1F3083504FBC9F07C222E52CB3C9924DCA5272937DDB3DEFF00C51F5673C9A6F49C72DA3FF372A5E7B1E2B41A79655D52FC0BBBEE6A789D675EF8DDA682E9795AA6952F063D6CE30B5CBE6CECEA9421A48C611DD6ECF37ACCAE7B72DEE27935E232B6EDBBE763D1FA3E9DE4C2B6B691E731272C918ADF7AA3E87E91A0583D2E337F8B9B1ABC8CE276AFF4C4F167C6DF0B63D745FD0ABBA3CA69A12C56EADA95D9E9B4993E6638C9ECE96C72AEB173D9D7764C84D7534D761A76BDC8A6C8BDC6C4C056C2C1916036C4D89B684D809B13636C880589B0B06C04C4C1B13600D9D0F4DF4C9FA862D4E45930C562C6E494F3420DBDBB37C6FCF1EE739B37FA5E6C38E5AAC59B2C71473E096359249B51769ABA4DF6F059FA951D068E79BD4E187E562CEE135D589EA2305937AE98CAE9DFB595E9F45A8F50CD963A4C29B827370EB56A3ED6F7A347A62D369FD6B064C9ACC50C3832C66F24A13A9D357D2945BFB5D7E469F48D0BCDAED6E2C393E7C1E9A69E5C38E724AF8D9A4FF6FB5979E3FF00A5BCEFFE28D1FA3659FA969F06A6A3872294DE4C538CD38C5372A945B57B7E43CD8747AAF4F5AFC7A6FE1A18F50B16586294A57169B4D7537BECD735C705FA6F51D37A6BD1628E47A88639E59669E38B4AA7151718F524DD257BA5BFEA559336874BA086821A97A9C79352B2E6C9862E3504A925D497D5BB7E38E4BE13CF4B5B874D2F4D96A23A1FE11BCA969DDCAF3C37B6D4A4F8A5BADB7A238F45823E89AACB920DEAA3F2E5177B42327E3CB5BFDA89E4C9A3D1FA7EB34F8758B52B3CE2F142319563E977D52EA8ADEB6DAF9668C5EA1A3CDE93AE59A1A1C5A8CF4D45FF0010E5269B76DDB57E37AF3B13C27961FF00D1F27FE911D77CDC3BCDAE9F9F8D3E9514F8BBBDF8E7D8BB069B45A6D26825ABD3FCE96B64EDB9CA3F2A09F4DC69FE2BB7BDAD96C538B2E9B37A2AD365D4470E4C79DE5A9464FAD38A551A4D5EDDE96FC9769F53A2D4E93411D56A3E4CB4537717094BE6E372EAA8D27F55DADE96EB72CE77FCF05EF10C98349E9AF53872E3C7AAD5E3D43C3F2B275A8F4AFF0012E96B7BF7FC8966C1A3D37AAEAB4F8749935592D47069DF549296DD49F4B526D6E95780C7A9C1AACDABF509EB3069F599B34A5059A391FCB4F7EA5D317BEF4BC55F34D66FE1FD3653D4627ADE99250F939E5197CB93FF0015A5172FB6DF724FC6AADD463D0E9BD5E707A794D7CB4D69E2DC947334BE86D34DA4ED6CEFB6E1AE869347AAD34F368FE5CDE272CFA3EA95465BF4A76FA95FD2DABB564B559BD3F5BABC78F36A6758B4AB14752D3A9E45C392A72E9ADB8BD97066F52CF81E8B45A5C59BE7CF029756649A8D376A31EA49D2DF94B76C548B33E6D1AC1A4964F4FC38A5927F325F26592DE34EABEA9BE77FD179219B36967E9B2C8BD374F867927D38A58E795B496F27F54DAEE971DDF821EB9A8D367F5394B473EBD3C71E3841D35B2825C3F74C7EA99F4D970FA7E3D34DC962D2C639153553EA93973F717F567E39AC1831195769124C8A2480698D090D0124C69911812B1A6451202498D32289201A2499044900C9222B818122193163CA92C908C92F289A04502492A5B226888D1606853C70C91719C54A2FB31A1811C78B1E28F4E3828C7C245844680865C38B3C1C32C2338BED242C1A4D3E99560C30C6BFED545A80218D086800E87A47FF007527E2273CE87A47FD7C9FFC4B3D97D3B7FD04F7FB31A13E0DB08B696CBC116ED6EF81BE45D985572DBEC56DDA6ECB25FD0A9855527B944D97CCCB93B905137E0CD95AEEB734CB83265E5858C99774EF839BA97CA3A333979FBFE666BA470742A5A8F8DB0E38ABF978DC9FB59F52D365C38A2939F54FFCB056CF977A449FFEE8C91BDA708F52F3C9F55D14230C4BA6297D91BCFA71DFB6884F519768635863E65BCBFB1763C1183B6DCA5FE693B638F02949A8DD9A60F2E5C58629CE495F0BBB29739E5BA84945F65B37F993D2C232C12CD249E46FF13E45293F2544F1A6B0B874A55BA49DBA2334A516598BFE9CA5DEB921DD9063C0FA334F13E1AB4BDCB1946A3E9D6626B6DCBE5F882ABC0FA334F1BE25BAFB9634AF72BCEDC5E3947677C96CFF0013FB81439FC8CF193E1BA7F6279934DF8F267D77FD27F72F5F5693149EEFA56E01097CED3B5CCA0E8CB930C7A5A696E5FA4FFAF97FF890CFCB0AAB4D93E6E9258DBB961953F35D8C9A883E969ADCB345FF00EF29C7B4A0ED7925A8FC4C2968327381F0F78B7D99A3263B8D56E8C38FFEAFE68EA64FC520398D744F6D93769F865BA882CD89665B3E322F0FFD459F97F72DD27D4B3C65BC7A3822B47A0E1E9C99A6FC2477ACE47A2FFD1C9FFC91D662337D93DD1075F664BC90970C083EEBF62B6925E0B1F0CA67C2FB915465749DD25E3B9932EF16DF3E0D79B8463D47F52558C93ABBF2116FA95EC39F24573F9996DA714A9FB1BB14DBEFCEC99CD876FB9B3149DF258CD67F88F40FD47D0F53860AF2457CCC7FFCA3BFEE78CF47CEA78E2D9F4887D528DEFB1F31D2A58FD4B55082A8C734E92EDB92C6F1EAC7A9C53FA5334C5B6B6FD4C583F09AA1F85152AC6F6DF7645B7DB925FE322CA20DF9D84DFF00E093E0877202D77D84DEEB6DC4F961DC09A6DF03B4B6EE47B0BC844EF6A6FEC559F3C34F832E7C92A8638B936F8544BFC48F37F1CE49E3F84F53D126BAA4A2EBBAB5B01F25F55D6E5F57F58D4EAF249B797236BD9765FA1DAD169251C18E33A4B67470BD3E2A5A8FA95FD47A987FD5C7EC5D39E7CF961D7CA30C53BEDC23C9649B94E4FB3748F45EB739471E5E96D1E725C44B94DBA5E85A37ABF52C58FB376D9F50CD8162D2C714170D2478DF8431C3F89EAE957E4F759FFEAC7EC6777CB789E185D422EB7B475F471AC31F2D59C997FD3675F4D27FC3E3DCC36D0DEC17B2682425C10360D821009B1360C4C01916E98D898099124F822C0189809809803E000421800843100086200B0B017601D89B0EE2006C03B0803DC4D831140C04C080B158322CA3FFD9);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `sname` varchar(100) NOT NULL COMMENT '姓名',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('257280', '张三', '0', '26', '2018-01-01 00:00:00');
INSERT INTO `student` VALUES ('393616925', '赵燕', '0', '26', '2018-05-08 00:00:00');
INSERT INTO `student` VALUES ('480872365', '李四', '1', '25', '2018-05-14 00:00:00');
INSERT INTO `student` VALUES ('537057824', '王五', '1', '26', '2018-05-15 00:00:00');
INSERT INTO `student` VALUES ('939664049', '王大锤', '1', '33', '2018-05-22 00:00:00');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '日志标题',
  `type` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '日志类型 1:正常 2：异常',
  `user_id` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '执行操作用户',
  `request_uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求URI',
  `class_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '执行类名',
  `method_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '执行方法名称',
  `function_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '功能模块名称',
  `user_agent` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户代理',
  `remote_ip` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作IP地址',
  `request_method` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '操作方式',
  `request_params` text COLLATE utf8_bin COMMENT '请求参数',
  `request_mac` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '设备MAC',
  `exception` text COLLATE utf8_bin COMMENT '异常信息',
  `action_thread` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '执行线程',
  `action_start_time` datetime DEFAULT NULL COMMENT '开始执行时刻',
  `action_end_time` datetime DEFAULT NULL COMMENT '结束执行时刻',
  `action_time` bigint(20) DEFAULT NULL COMMENT '执行耗时 单位(毫秒)',
  `create_date` datetime DEFAULT NULL COMMENT '创建日志时间',
  `dbName` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '数据库实例',
  PRIMARY KEY (`id`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=447 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('418', '更新', '1', null, '/solr/update', 'com.qdone.module.controller.SolrController', 'update', '更新', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-17', '2018-05-15 15:32:29', '2018-05-15 15:32:40', '11246', '2018-05-15 15:32:29', 'isec');
INSERT INTO `sys_log` VALUES ('419', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-7', '2018-05-15 15:32:50', '2018-05-15 15:32:50', '517', '2018-05-15 15:32:50', 'isec');
INSERT INTO `sys_log` VALUES ('420', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-14', '2018-05-15 15:33:03', '2018-05-15 15:33:03', '488', '2018-05-15 15:33:03', 'isec');
INSERT INTO `sys_log` VALUES ('421', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-5', '2018-05-15 15:33:53', '2018-05-15 15:33:54', '568', '2018-05-15 15:33:53', 'isec');
INSERT INTO `sys_log` VALUES ('422', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-19', '2018-05-15 15:34:45', '2018-05-15 15:34:46', '499', '2018-05-15 15:34:45', 'isec');
INSERT INTO `sys_log` VALUES ('423', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-5', '2018-05-15 15:39:04', '2018-05-15 15:39:05', '719', '2018-05-15 15:39:04', 'isec');
INSERT INTO `sys_log` VALUES ('424', '更新', '1', null, '/solr/update', 'com.qdone.module.controller.SolrController', 'update', '更新', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-4', '2018-05-15 15:39:16', '2018-05-15 15:39:16', '440', '2018-05-15 15:39:16', 'isec');
INSERT INTO `sys_log` VALUES ('425', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-5', '2018-05-15 15:39:18', '2018-05-15 15:39:18', '487', '2018-05-15 15:39:18', 'isec');
INSERT INTO `sys_log` VALUES ('426', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-8', '2018-05-15 15:41:14', '2018-05-15 15:41:15', '620', '2018-05-15 15:41:14', 'isec');
INSERT INTO `sys_log` VALUES ('427', '更新', '1', null, '/solr/update', 'com.qdone.module.controller.SolrController', 'update', '更新', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-1', '2018-05-15 15:42:08', '2018-05-15 15:42:09', '474', '2018-05-15 15:42:08', 'isec');
INSERT INTO `sys_log` VALUES ('428', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-12', '2018-05-15 15:42:10', '2018-05-15 15:42:10', '412', '2018-05-15 15:42:10', 'isec');
INSERT INTO `sys_log` VALUES ('429', '添加', '1', null, '/solr/insert', 'com.qdone.module.controller.SolrController', 'insert', '添加', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'PUT', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-2', '2018-05-15 15:42:50', '2018-05-15 15:42:50', '477', '2018-05-15 15:42:50', 'isec');
INSERT INTO `sys_log` VALUES ('430', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-4', '2018-05-15 15:42:51', '2018-05-15 15:42:52', '468', '2018-05-15 15:42:51', 'isec');
INSERT INTO `sys_log` VALUES ('431', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-4', '2018-05-15 15:43:14', '2018-05-15 15:43:15', '705', '2018-05-15 15:43:14', 'isec');
INSERT INTO `sys_log` VALUES ('432', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-1', '2018-05-15 15:43:16', '2018-05-15 15:43:17', '477', '2018-05-15 15:43:16', 'isec');
INSERT INTO `sys_log` VALUES ('433', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-15', '2018-05-15 15:43:18', '2018-05-15 15:43:19', '442', '2018-05-15 15:43:18', 'isec');
INSERT INTO `sys_log` VALUES ('434', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-9', '2018-05-15 15:43:21', '2018-05-15 15:43:22', '385', '2018-05-15 15:43:21', 'isec');
INSERT INTO `sys_log` VALUES ('435', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-4', '2018-05-15 15:43:22', '2018-05-15 15:43:22', '368', '2018-05-15 15:43:22', 'isec');
INSERT INTO `sys_log` VALUES ('436', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-2', '2018-05-15 15:43:22', '2018-05-15 15:43:23', '499', '2018-05-15 15:43:22', 'isec');
INSERT INTO `sys_log` VALUES ('437', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-5', '2018-05-15 15:43:23', '2018-05-15 15:43:23', '415', '2018-05-15 15:43:23', 'isec');
INSERT INTO `sys_log` VALUES ('438', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-9', '2018-05-15 15:43:32', '2018-05-15 15:43:32', '507', '2018-05-15 15:43:32', 'isec');
INSERT INTO `sys_log` VALUES ('439', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-4', '2018-05-15 15:43:36', '2018-05-15 15:43:37', '444', '2018-05-15 15:43:36', 'isec');
INSERT INTO `sys_log` VALUES ('440', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-12', '2018-05-15 15:43:38', '2018-05-15 15:43:38', '373', '2018-05-15 15:43:38', 'isec');
INSERT INTO `sys_log` VALUES ('441', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-1', '2018-05-15 15:43:40', '2018-05-15 15:43:40', '390', '2018-05-15 15:43:40', 'isec');
INSERT INTO `sys_log` VALUES ('442', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-15', '2018-05-15 15:44:01', '2018-05-15 15:44:01', '556', '2018-05-15 15:44:01', 'isec');
INSERT INTO `sys_log` VALUES ('443', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-14', '2018-05-15 15:44:03', '2018-05-15 15:44:04', '420', '2018-05-15 15:44:03', 'isec');
INSERT INTO `sys_log` VALUES ('444', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-9', '2018-05-15 15:44:05', '2018-05-15 15:44:05', '365', '2018-05-15 15:44:05', 'isec');
INSERT INTO `sys_log` VALUES ('445', '分页', '1', null, '/solr/selectPage', 'com.qdone.module.controller.SolrController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B7D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-2', '2018-05-15 15:44:06', '2018-05-15 15:44:06', '394', '2018-05-15 15:44:06', 'isec');
INSERT INTO `sys_log` VALUES ('446', '分页', '1', null, '/staff/selectPage', 'com.qdone.module.controller.StaffController', 'selectPage', '分页', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '0:0:0:0:0:0:0:1', 'POST', 0x7B226372656174656279223A22222C226C696D6974223A302C226F6666736574223A302C226F706572617465526573756C74223A302C22706167654E756D626572223A312C227061676553697A65223A31302C22736578223A22222C22736E616D65223A22222C22736F72744F72646572223A22617363222C227570646174656279223A22227D, '54-E1-AD-EC-39-8A', null, 'https-jsse-nio-9090-exec-3', '2018-05-15 18:33:18', '2018-05-15 18:33:19', '921', '2018-05-15 18:33:18', 'isec');

-- ----------------------------
-- Table structure for t1
-- ----------------------------
DROP TABLE IF EXISTS `t1`;
CREATE TABLE `t1` (
  `c2` varchar(255) NOT NULL,
  PRIMARY KEY (`c2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t1
-- ----------------------------

-- ----------------------------
-- Table structure for user_loginf
-- ----------------------------
DROP TABLE IF EXISTS `user_loginf`;
CREATE TABLE `user_loginf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登陆用户名',
  `PASSWORD` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登陆操作，输入的密码',
  `SUCCESS` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '本次登陆结果：0登陆失败，1登陆成功',
  `LOGINTIME` datetime DEFAULT NULL COMMENT '登陆操作的时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user_loginf
-- ----------------------------

-- ----------------------------
-- Table structure for user_mail
-- ----------------------------
DROP TABLE IF EXISTS `user_mail`;
CREATE TABLE `user_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `sendto` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '收件人',
  `sendfrom` varchar(100) DEFAULT NULL COMMENT '发件人',
  `subject` varchar(100) DEFAULT NULL COMMENT '邮件主题',
  `content` varchar(2000) NOT NULL COMMENT '邮件内容',
  `sendtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `finishtime` datetime DEFAULT NULL COMMENT '结束时间',
  `status` int(11) DEFAULT '0' COMMENT '发送状态:0 初始化;1:成功;2:失败',
  `times` int(11) DEFAULT '0' COMMENT '发送次数',
  `remark1` varchar(100) DEFAULT NULL,
  `remark2` varchar(100) DEFAULT NULL,
  `remark3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user_mail
-- ----------------------------
INSERT INTO `user_mail` VALUES ('27', 'apple', '1335157415@qq.com', 'm15171479289@163.com', 'register', 'YXBwbGUgxOO6wzogPC9icj67ttOt16Ky4dK2x++5ub2otcTE2rK/udzA7ca9zKgsteO798/Cw+bBtL3TvKS77tXLusUsNDjQocqxxNrT0NCnLLfx1PLW2NDC16Ky4dXLusUswbS909a7xNzKudPD0ru0zizH676hv+y8pLvuo6E8L2JyPjxhIGhyZWY9Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9teWJhdGlzX212Yy8vYWN0aXZldXNlci5kbz9hY3RpdmVjb2RlPVlYQndiR1Y4WmpjeVltVmlPRFEyWXpGaFkyTmlOV0ZqTVRoallqZzNPVGRqTmpGaU16az0iPlpqY3lZbVZpT0RRMll6RmhZMk5pTldGak1UaGpZamczT1Rkak5qRmlNems9PC9hPg==', '2016-04-13 11:46:27', '2016-04-13 11:46:36', null, null, null, null, null);
INSERT INTO `user_mail` VALUES ('28', 'zhangsan', '1335157415@qq.com', 'm15171479289@163.com', 'resetPassword', 'emhhbmdzYW4gxOO6wzogPC9icj67ttOttcfCvdK2x++53MDtxr3MqCzD3MLrzfy8xyy4w8G0vdMzMLfW1tPWrsTa09DQp8fS1rvE3Mq508PSu7TOLDxhIGhyZWY9Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9teWJhdGlzX212Yy8vdG9SZXNldFB3ZC5kbz91dWlkPVpHRXpOMkpsTjJNeFpUZGlORGxpTWpnellUQXhaak5rTmpWbFpEa3pZelU9Ij7H67Xju/e0y7SmITwvYT4=', '2016-05-10 11:42:53', '2016-05-10 11:42:56', null, null, null, null, null);
INSERT INTO `user_mail` VALUES ('29', 'zhangsan', '835897006@qq.com', 'm15171479289@163.com', 'resetPassword', 'emhhbmdzYW4gxOO6wzogPC9icj67ttOttcfCvdK2x++53MDtxr3MqCzD3MLrzfy8xyy4w8G0vdMzMLfW1tPWrsTa09DQp8fS1rvE3Mq508PSu7TOLDxhIGhyZWY9Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9teWJhdGlzX212Yy8vdG9SZXNldFB3ZC5kbz91dWlkPU9HWmtNemMyWWpnelltWTBOREUxWm1Jd01EWTVabUV6WkRoak1qVTNNVEk9Ij7H67Xju/e0y7SmITwvYT4=', '2016-05-10 11:44:47', '2016-05-10 11:44:47', null, null, null, null, null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `pkid` varchar(20) NOT NULL COMMENT '用户_角色关联表主键(多对多)',
  `user_id` varchar(20) NOT NULL COMMENT '用户主键',
  `role_id` varchar(20) NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`pkid`),
  UNIQUE KEY `user_id` (`user_id`,`role_id`),
  UNIQUE KEY `user_id_2` (`user_id`,`role_id`),
  KEY `role_fkid` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('987654321', '123456789', '147258369');
INSERT INTO `user_role` VALUES ('123452122', '251417485', '123456789');
