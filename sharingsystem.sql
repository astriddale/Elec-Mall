/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : sharingsystem

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2021-04-24 11:07:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL COMMENT '账号',
  `phone` bigint(25) NOT NULL,
  `password` varchar(25) NOT NULL COMMENT '密码',
  `userRole` varchar(25) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '183', '123456', '超级管理员');
INSERT INTO `admin` VALUES ('2', '管理员', '1', '123456', '超级管理员');

-- ----------------------------
-- Table structure for catelog
-- ----------------------------
DROP TABLE IF EXISTS `catelog`;
CREATE TABLE `catelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '分类名',
  `number` int(11) DEFAULT '0' COMMENT '该分类下的商品数量',
  `status` tinyint(10) DEFAULT '0' COMMENT '分类状态，0正常，1暂用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catelog
-- ----------------------------
INSERT INTO `catelog` VALUES ('1', 'A区宿舍', '14', '1');
INSERT INTO `catelog` VALUES ('2', 'B区宿舍', '10', '1');
INSERT INTO `catelog` VALUES ('3', 'C区宿舍', '10', '1');
INSERT INTO `catelog` VALUES ('4', '青年公寓', '11', '1');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品，外键',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `create_at` varchar(250) DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('130', '30', '115', '好看，价格可以低点吗，我租长期，感谢❥(^_-)', '2021-02-23 10:11:33');
INSERT INTO `comments` VALUES ('131', '27', '114', '好看，价格可以低点吗，我租长期，感谢❥(^_-)', '2021-02-24 10:56:33');
INSERT INTO `comments` VALUES ('132', '27', '114', '宿舍', '2021-02-26 03:19:04');
INSERT INTO `comments` VALUES ('135', '36', '117', '没设置自己不能评论自己呢', '2021-02-26 03:33:48');
INSERT INTO `comments` VALUES ('137', '27', '117', '不输入文字也可评论', '2021-02-26 03:37:54');
INSERT INTO `comments` VALUES ('138', '27', '117', '测试成功，修改CSS布局成功', '2021-02-26 03:56:45');
INSERT INTO `comments` VALUES ('139', '27', '117', '好看，价格可以低点吗，我租长期，感谢❥(^_-)', '2021-03-07 12:41:09');
INSERT INTO `comments` VALUES ('144', '27', '117', '好看，价格可以低点吗，我租长期，感谢❥(^_-)', '2021-03-09 03:51:38');
INSERT INTO `comments` VALUES ('148', '27', '117', '好看，价格可以低点吗，我租长期，感谢❥(^_-)', '2021-03-09 04:13:37');
INSERT INTO `comments` VALUES ('159', '27', '117', '不输入文字也可评论', '2021-03-09 05:18:12');
INSERT INTO `comments` VALUES ('162', '27', '117', '4554', '2021-03-09 05:28:09');
INSERT INTO `comments` VALUES ('165', '27', '119', '好看，价格可以低点吗，我租长期，感谢❥(^_-)', '2021-03-10 01:36:04');
INSERT INTO `comments` VALUES ('167', '40', '121', '好看，价格可以低点吗', '2021-03-11 07:44:30');
INSERT INTO `comments` VALUES ('168', '27', '121', '不输入文字也可评论', '2021-03-15 01:47:39');
INSERT INTO `comments` VALUES ('169', '27', '115', '好看，价格可以低点吗，我租长期，感谢❥(^_-)', '2021-03-27 07:02:33');

-- ----------------------------
-- Table structure for focus
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '外键 商品id',
  `user_id` int(11) DEFAULT NULL COMMENT '外键 用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of focus
-- ----------------------------
INSERT INTO `focus` VALUES ('22', '114', '30');
INSERT INTO `focus` VALUES ('26', '117', '33');
INSERT INTO `focus` VALUES ('36', '117', '41');
INSERT INTO `focus` VALUES ('37', '115', '41');
INSERT INTO `focus` VALUES ('38', '120', '41');
INSERT INTO `focus` VALUES ('39', '120', '41');
INSERT INTO `focus` VALUES ('41', '120', '27');
INSERT INTO `focus` VALUES ('44', '117', '27');
INSERT INTO `focus` VALUES ('45', '117', '27');
INSERT INTO `focus` VALUES ('46', '122', '27');
INSERT INTO `focus` VALUES ('47', '122', '27');
INSERT INTO `focus` VALUES ('48', '122', '27');
INSERT INTO `focus` VALUES ('49', '122', '27');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品主键',
  `catelog_id` int(11) DEFAULT NULL COMMENT '商品分类，外键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户外键',
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `price` float(11,2) DEFAULT NULL COMMENT '出售价格',
  `real_price` float(11,2) DEFAULT NULL COMMENT '真实价格',
  `start_time` varchar(25) DEFAULT NULL COMMENT '发布时间',
  `polish_time` varchar(30) DEFAULT NULL COMMENT '擦亮时间，按该时间进行查询，精确到时分秒',
  `end_time` varchar(25) DEFAULT NULL COMMENT '下架时间',
  `describle` text COMMENT '详细信息',
  `status` int(11) DEFAULT '1' COMMENT '状态 上架1 下架0',
  PRIMARY KEY (`id`),
  KEY `catelog_id` (`catelog_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('114', '1', '27', '女生专用电动车', '15.00', '600.00', '2021-02-23', '2021-03-15', '2021-03-05', '大一刚进来买的电动车，现在快毕业闲置了，低价共享', '1');
INSERT INTO `goods` VALUES ('115', '4', '27', '九成新电动车', '10.00', '3600.00', '2021-02-23', '2021-02-23', '2021-03-05', '大一刚进来买的电动车，现在快毕业闲置了，低价共享', '1');
INSERT INTO `goods` VALUES ('117', '2', '36', '自用8新电动车低价出租---B区宿舍', '20.00', '2600.00', '2021-02-26', '2021-02-26', '2021-03-08', '这是一段测试单，用来测试当商品描述过长时，会不会把下面的评论样式给挤下去---------------------------------------------------------------', '1');
INSERT INTO `goods` VALUES ('118', '4', '36', '测试金额-青年公寓', '500.00', '6000.00', '2021-02-26', '2021-02-26', '2021-03-08', '---------------------TEST--------------', '1');
INSERT INTO `goods` VALUES ('119', '1', '27', '1', '1100.00', '10000.00', '2021-02-26', '2021-02-26', '2021-03-08', '11111', '0');
INSERT INTO `goods` VALUES ('120', '2', '27', '特大消息特大消息九折出租', '25.00', '500.00', '2021-03-09', '2021-03-09', '2021-03-19', '大大大 爱是打我的武器打我的高发而为gear噶尔图嘎无人个人', '1');
INSERT INTO `goods` VALUES ('121', '2', '27', '最新发布的测试', '20.00', '360.00', '2021-03-11', '2021-03-11', '2021-03-21', '超好看哦超好用哦', '1');
INSERT INTO `goods` VALUES ('122', '1', '40', '去年刚买的', '10.00', '600.00', '2021-03-11', '2021-03-11', '2021-03-21', '去年刚买来的，没用多久闲置了，现在低价出租哦', '0');
INSERT INTO `goods` VALUES ('123', '3', '40', '好消息好消息', '10.00', '600.00', '2021-03-11', '2021-03-11', '2021-03-21', '简单便捷实惠哦', '1');
INSERT INTO `goods` VALUES ('124', '4', '40', '好用的', '30.00', '750.00', '2021-03-11', '2021-03-11', '2021-03-21', '很好看很好用有保障', '1');
INSERT INTO `goods` VALUES ('125', '1', '40', '便宜好用', '15.00', '350.00', '2021-03-11', '2021-03-11', '2021-03-21', '速度快电量足', '1');
INSERT INTO `goods` VALUES ('126', '2', '40', '这是第六辆了', '30.00', '750.00', '2021-03-11', '2021-03-11', '2021-03-21', 'B区宿舍区有闲置，欢迎使用', '1');
INSERT INTO `goods` VALUES ('127', '3', '40', '艾玛电动车', '10.00', '360.00', '2021-03-11', '2021-03-11', '2021-03-21', '艾玛电动车，助力你我同行', '1');
INSERT INTO `goods` VALUES ('128', '4', '40', '塔司顶专用', '5.00', '360.00', '2021-03-11', '2021-03-11', '2021-03-21', '好看又好用，快选我选我选我', '0');
INSERT INTO `goods` VALUES ('129', '3', '40', '可爱', '15.00', '600.00', '2021-03-11', '2021-03-11', '2021-03-21', '超级可爱超级好看的电动车', '1');
INSERT INTO `goods` VALUES ('130', '3', '40', '唉呀妈呀', '30.00', '600.00', '2021-03-11', '2021-03-11', '2021-03-21', '你猜我买不买', '1');
INSERT INTO `goods` VALUES ('131', '1', '30', '特大消息特大消息九折出租', '15.00', '600.00', '2021-04-20', '2021-04-20', '2021-04-30', '', '1');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片主键',
  `goods_id` int(11) NOT NULL COMMENT '商品外键',
  `img_url` text NOT NULL COMMENT '图片链接',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('114', '114', '14d2bf36-e327-4e25-89ab-66069d1531af.png');
INSERT INTO `image` VALUES ('115', '115', '0fa5ea0f-efa5-4e50-a4d3-1905684b3503.png');
INSERT INTO `image` VALUES ('116', '116', '');
INSERT INTO `image` VALUES ('117', '117', 'da9695c7-b9a0-4b2e-a262-31109b35b727.png');
INSERT INTO `image` VALUES ('118', '118', 'c3e514c1-67dc-435f-a024-1c06c6f76b24.png');
INSERT INTO `image` VALUES ('119', '119', 'a98da6bd-bbb4-4f51-8e8e-bd68b886959c.png');
INSERT INTO `image` VALUES ('120', '120', '570c510f-ec50-4f3a-a1ba-3c27e7b58081.png');
INSERT INTO `image` VALUES ('121', '121', '90c1d8b7-5a34-4d11-b9f2-b91307d2e145.png');
INSERT INTO `image` VALUES ('122', '122', '2723eae4-2344-4677-a2d5-bb239838ab23.png');
INSERT INTO `image` VALUES ('123', '123', '717fcb82-6cb9-4fdc-9bcd-245cdb1c9e20.png');
INSERT INTO `image` VALUES ('124', '124', 'b608ccfe-4716-43e2-b9f5-34a3af8423fe.png');
INSERT INTO `image` VALUES ('125', '125', '5609f1a6-0df6-454e-abd5-00893af14bfb.png');
INSERT INTO `image` VALUES ('126', '126', '6615f77f-6947-4ec8-9a37-4ec26c7d3b0e.png');
INSERT INTO `image` VALUES ('127', '127', '5a6e1243-9546-458b-a186-4a9c67b0cb7c.png');
INSERT INTO `image` VALUES ('128', '128', '5488d403-eaa1-478b-9748-2837cd68bb41.png');
INSERT INTO `image` VALUES ('129', '129', '681d0ff3-69be-46cf-a5f5-892ea554053c.png');
INSERT INTO `image` VALUES ('130', '130', '9cf2cea3-be78-40c7-a6b1-9bd162dbfd88.png');
INSERT INTO `image` VALUES ('131', '131', 'c33909a9-31b5-458a-b3e2-a9cc875039be.png');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统信息主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `context` text COMMENT '信息内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '推送信息时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，0未读，1已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('20', '27', '本人现在俊秀图书馆，半小时后急用一部电动车，有好心人送过来吗，押金可商量', '2021-02-23 21:29:08', '0');
INSERT INTO `notice` VALUES ('21', '27', '..........................求购第二次测试...........................', '2021-02-23 21:29:33', '0');
INSERT INTO `notice` VALUES ('22', '36', 'testtest', '2021-02-26 15:27:34', '0');
INSERT INTO `notice` VALUES ('23', '33', '第四个账号测试求购的信息', '2021-02-26 16:07:45', '0');
INSERT INTO `notice` VALUES ('24', '27', '测试信息5', '2021-03-09 19:14:40', '0');
INSERT INTO `notice` VALUES ('25', '27', '6', '2021-03-09 19:14:45', '0');
INSERT INTO `notice` VALUES ('26', '27', '7', '2021-03-09 19:14:48', '0');
INSERT INTO `notice` VALUES ('27', '27', '8', '2021-03-09 19:14:50', '0');
INSERT INTO `notice` VALUES ('28', '27', '9', '2021-03-09 19:14:53', '0');
INSERT INTO `notice` VALUES ('29', '27', '10', '2021-03-09 19:14:56', '0');
INSERT INTO `notice` VALUES ('30', '27', '11', '2021-03-09 19:14:58', '0');
INSERT INTO `notice` VALUES ('31', '27', '12', '2021-03-09 19:15:00', '0');
INSERT INTO `notice` VALUES ('32', '27', '13', '2021-03-09 19:15:02', '0');
INSERT INTO `notice` VALUES ('33', '27', '撒大声地', '2021-03-10 14:15:50', '0');
INSERT INTO `notice` VALUES ('34', '27', '时', '2021-03-10 14:21:50', '0');
INSERT INTO `notice` VALUES ('35', '27', '三大', '2021-03-10 14:43:58', '0');
INSERT INTO `notice` VALUES ('36', '27', '宿舍', '2021-03-10 14:53:28', '0');
INSERT INTO `notice` VALUES ('37', '40', '谁说的', '2021-03-11 19:27:50', '0');
INSERT INTO `notice` VALUES ('38', '40', '我在C区三餐门口这，有闲置车辆给我用用吗，急急急', '2021-03-11 19:28:57', '0');
INSERT INTO `notice` VALUES ('39', '27', '546546', '2021-03-15 13:48:07', '0');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单表id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `order_num` bigint(25) DEFAULT NULL COMMENT '订单编号',
  `order_price` float(11,0) DEFAULT NULL COMMENT '订单价格',
  `order_state` int(11) DEFAULT '1' COMMENT '订单状态 1待发货 2待收货 3已完成',
  `order_information` varchar(50) DEFAULT NULL,
  `order_date` varchar(50) DEFAULT NULL COMMENT '下单时间',
  `score` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('6', '30', '114', '76800573', '950', '3', '周五下午C区宿舍门口我去拿钥匙', '2021-02-23 10:18:09', '4');
INSERT INTO `orders` VALUES ('7', '33', '115', '69545805', '10', '3', '明天我会去宿舍区门口拿钥匙', '2021-02-26 04:09:19', '4');
INSERT INTO `orders` VALUES ('8', '27', '117', '62398568', '20', '3', '测试购买后金额是否是立即到账的', '2021-02-26 04:15:20', '4');
INSERT INTO `orders` VALUES ('9', '36', '114', '61861616', '15', '3', '', '2021-02-26 04:16:21', '4');
INSERT INTO `orders` VALUES ('10', '27', '118', '71421729', '500', '3', '测试购买后金额是否是立即到账的', '2021-02-26 04:21:30', '4');
INSERT INTO `orders` VALUES ('11', '36', '119', '93535795', '1100', '2', '买了', '2021-02-26 04:25:44', null);
INSERT INTO `orders` VALUES ('12', '27', '122', '70588334', '10', '3', '', '2021-04-16 07:06:49', '5');
INSERT INTO `orders` VALUES ('13', '27', '128', '81156180', '5', '3', '', '2021-04-20 07:17:57', '4');

-- ----------------------------
-- Table structure for purse
-- ----------------------------
DROP TABLE IF EXISTS `purse`;
CREATE TABLE `purse` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '钱包id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `balance` float(11,0) unsigned zerofill DEFAULT '00000000000' COMMENT '总钱数',
  `recharge` float(11,0) DEFAULT NULL COMMENT '充值钱数',
  `withdrawals` float(11,0) DEFAULT NULL COMMENT '提现钱数',
  `state` int(11) DEFAULT NULL COMMENT '状态 0未审核   已审核（1不通过 2通过）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purse
-- ----------------------------
INSERT INTO `purse` VALUES ('24', '27', '00000001490', null, null, null);
INSERT INTO `purse` VALUES ('25', '30', '00000000950', null, null, '2');
INSERT INTO `purse` VALUES ('26', '31', '00000001111', null, null, null);
INSERT INTO `purse` VALUES ('27', '32', '00000002222', null, null, '2');
INSERT INTO `purse` VALUES ('28', '33', '00000002190', null, null, '2');
INSERT INTO `purse` VALUES ('29', '34', '00000002000', null, null, '2');
INSERT INTO `purse` VALUES ('30', '35', '00000002000', null, null, null);
INSERT INTO `purse` VALUES ('31', '36', '00000001405', null, null, null);
INSERT INTO `purse` VALUES ('32', '37', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('33', '38', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('34', '39', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('35', '40', '00000000015', null, null, null);
INSERT INTO `purse` VALUES ('36', '41', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('37', '42', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('38', '43', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('39', '44', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('40', '45', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('41', '46', '00000000000', null, null, null);

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论回复主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `atuser_id` int(11) DEFAULT NULL,
  `commet_id` int(11) DEFAULT NULL COMMENT '评论，外键',
  `content` text COMMENT '回复内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` char(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录使用的手机号',
  `username` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `QQ` varchar(12) CHARACTER SET utf8 DEFAULT NULL COMMENT '即时通讯',
  `create_at` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建时间',
  `goods_num` int(11) DEFAULT '0' COMMENT '发布过的物品数量',
  `power` int(10) unsigned zerofill DEFAULT '0000000100' COMMENT '信用分，普通用户默认为100',
  `last_login` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近一次登陆时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '账号是否冻结，默认0未冻结',
  `sh` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('27', '17859766845', 'SWX', 'E10ADC3949BA59ABBE56E057F20F883E', '997941600', '2021-02-22 15:03', '5', '0000000100', null, '1', '1');
INSERT INTO `user` VALUES ('30', '12345678901', 'Test1111', 'E10ADC3949BA59ABBE56E057F20F883E', '997941600', '2021-02-23 22:04', '1', '0000000100', null, '1', '1');
INSERT INTO `user` VALUES ('31', '11111111111', 'Test2', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-02-23 22:24', '0', '0000000100', null, '1', '1');
INSERT INTO `user` VALUES ('32', '11111111112', 'Test3', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-02-23 22:25', '0', '0000000100', null, '1', '1');
INSERT INTO `user` VALUES ('33', '11111111113', 'Test4', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-02-23 22:25', '0', '0000000100', null, '1', '1');
INSERT INTO `user` VALUES ('34', '11111111114', '张强', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-02-23 22:26', '0', '0000000100', null, '1', '1');
INSERT INTO `user` VALUES ('35', '11111111115', '李鑫龙', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-02-23 22:26', '0', '0000000100', null, '1', '1');
INSERT INTO `user` VALUES ('36', '11111111116', '泉州师范', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-02-23 22:26', '2', '0000000100', null, '1', '1');
INSERT INTO `user` VALUES ('40', '12111111111', '三生三世', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-03-09 17:51', '9', '0000000100', null, '1', '1');
INSERT INTO `user` VALUES ('41', '13555555555', '啛啛喳喳', 'E10ADC3949BA59ABBE56E057F20F883E', '949441111', '2021-03-09 17:52', '0', '0000000100', null, '1', '1');
INSERT INTO `user` VALUES ('42', '15968632156', 'user', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-04-20 12:42', '0', '0000000100', null, '1', '1');
INSERT INTO `user` VALUES ('43', '15968632157', 'user', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-04-20 12:43', '0', '0000000100', null, '1', '1');
INSERT INTO `user` VALUES ('44', '15968632160', '17859766845', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-04-20 12:45', '0', '0000000100', null, '1', '1');
INSERT INTO `user` VALUES ('45', '15968632145', 'user', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-04-20 18:58', '0', '0000000100', null, '1', '1');
INSERT INTO `user` VALUES ('46', '17859766846', '测试', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2021-04-20 20:02', '0', '0000000100', null, '1', '0');
