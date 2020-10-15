/*
Navicat MySQL Data Transfer

Source Server         : Qzp
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : bookshop

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2020-10-15 22:53:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('2', 'admin', 'admin');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bid` int(11) NOT NULL auto_increment,
  `uuid` varchar(60) default NULL,
  `name` varchar(60) default NULL,
  `price` int(11) default NULL,
  `type` int(11) default NULL,
  `introduction` varchar(500) default NULL,
  `status` int(11) default '0',
  PRIMARY KEY  (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'book1', '快乐的光脚丫先生', '39', '0', '光脚丫先生只有一只靴子，但他有一支老旧的喇叭，两个可爱的妹妹，几只绿色的小鹦鹉，以及一些胖嘟嘟的猫头鹰……。\r\n本书犹如一件信手捻来的艺术品，书中音乐性的韵律节奏，洋溢於文字之间，制造了一出诙谐的音乐喜剧。插图的细节更延展了文字的故事性，丰富了视觉的欣赏，使图画本身就为读者叙述出一个故事。\r\n光脚丫先生只有一只靴子，但他有一支老旧的喇叭，两个可爱的妹妹，几只绿色的小鹦鹉，以及一些胖嘟嘟的猫头鹰……本书犹如一件信手捻来的艺术品，书中音乐性的韵律节奏，洋溢於文字之间，制造了一出诙谐的音乐喜剧。插图的细节更延展了文字的故事性，丰富了视觉的欣赏，使图画本身就为读者叙述出一个故事。作家兼插画家昆丁布莱以其独特的风格，创作出如泉源般的轻快、幽默、活泼与生动。不论当读者默读本书，或朗读给他人听，或倾听他人诵读这个故事，都可深深感受到故事悦人的旋律。', '0');
INSERT INTO `book` VALUES ('2', 'book4', '给孩子的造物大书', '99', '0', '当孩子问你每天吃、穿、用的是怎么来的，你知道怎么回答吗？《给孩子的造物大书》是耶鲁学霸给孩子的探索大书，43张拟人化的小动物制作物品的场景图，与孩子的童趣视角相契合，激发孩子对科学的兴趣。', '0');
INSERT INTO `book` VALUES ('3', 'book5', '我的第一本量子物理学', '69', '0', '这本书深入浅出地为孩子们开启着一个神奇的，探索世界真相的阅读旅程。多种形式的知识点剖析和解读，脑洞大开的插画，将物理学的基础知识框架勾勒描绘出来，与文字搭配，引领着孩子们先行一步地接触前沿的科学观念，满足好奇心，开启科学兴趣。', '0');
INSERT INTO `book` VALUES ('4', 'book7', '园丁与木匠', '20', '0', '《园丁与木匠》是2019年7月由湛庐文化和浙江人民出版社出版的儿童教养类书籍，作者是牛津大学心理学博士，加州大学伯克利分校心理学系教授及哲学系客座教授艾莉森·高普尼克（Alison Gopnik），推翻了经典的“白板说”，还是心理理论创始人之一。', '0');
INSERT INTO `book` VALUES ('5', 'book6', '大怪兽', '199', '0', '这是一本漫画书籍，里面讲解了很多很多的历史故事', '0');
INSERT INTO `book` VALUES ('6', '93d84a9c392a45f780e92f4910e77d92', '且听风吟', '20', '1', '我在进行测试，这是一本散文书。', '0');

-- ----------------------------
-- Table structure for `logrecord`
-- ----------------------------
DROP TABLE IF EXISTS `logrecord`;
CREATE TABLE `logrecord` (
  `id` int(11) NOT NULL auto_increment,
  `content` varchar(60) default NULL,
  `createTime` varchar(60) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logrecord
-- ----------------------------
INSERT INTO `logrecord` VALUES ('7', 'test用户创建了新的订单', '2020-09-10 16:18');
INSERT INTO `logrecord` VALUES ('8', 'test用户创建了新的订单', '2020-09-10 16:24');
INSERT INTO `logrecord` VALUES ('9', 'admin管理员登录了', '2020-09-11 16:08');
INSERT INTO `logrecord` VALUES ('10', 'admin管理员登录了', '2020-09-11 16:08');
INSERT INTO `logrecord` VALUES ('11', 'admin管理员登录了', '2020-09-11 16:09');
INSERT INTO `logrecord` VALUES ('12', 'admin管理员登录了', '2020-09-11 16:09');
INSERT INTO `logrecord` VALUES ('13', 'admin管理员登录了', '2020-09-11 16:12');
INSERT INTO `logrecord` VALUES ('14', 'admin管理员登录了', '2020-09-11 16:14');
INSERT INTO `logrecord` VALUES ('15', 'admin管理员登录了', '2020-09-11 16:14');
INSERT INTO `logrecord` VALUES ('16', 'admin管理员登录了', '2020-09-11 16:15');
INSERT INTO `logrecord` VALUES ('17', 'admin管理员登录了', '2020-09-11 16:16');
INSERT INTO `logrecord` VALUES ('18', 'admin管理员登录了', '2020-09-11 16:16');
INSERT INTO `logrecord` VALUES ('19', 'admin管理员登录了', '2020-09-11 16:17');
INSERT INTO `logrecord` VALUES ('20', 'admin管理员登录了', '2020-09-11 16:20');
INSERT INTO `logrecord` VALUES ('21', 'admin管理员登录了', '2020-09-11 16:20');
INSERT INTO `logrecord` VALUES ('22', 'admin管理员登录了', '2020-09-11 16:25');
INSERT INTO `logrecord` VALUES ('23', 'admin管理员登录了', '2020-09-11 16:26');
INSERT INTO `logrecord` VALUES ('24', 'admin管理员登录了', '2020-09-11 16:27');
INSERT INTO `logrecord` VALUES ('25', 'admin管理员登录了', '2020-09-11 16:28');
INSERT INTO `logrecord` VALUES ('26', 'admin管理员登录了', '2020-09-11 16:29');
INSERT INTO `logrecord` VALUES ('27', 'admin管理员登录了', '2020-09-11 16:30');
INSERT INTO `logrecord` VALUES ('28', 'admin管理员登录了', '2020-09-11 16:32');
INSERT INTO `logrecord` VALUES ('29', 'admin管理员登录了', '2020-09-11 16:33');
INSERT INTO `logrecord` VALUES ('30', 'admin管理员登录了', '2020-09-11 16:34');
INSERT INTO `logrecord` VALUES ('31', 'admin管理员登录了', '2020-09-11 16:34');
INSERT INTO `logrecord` VALUES ('32', '订单号为1的订单发货了', '2020-09-11 16:35');
INSERT INTO `logrecord` VALUES ('33', 'admin管理员登录了', '2020-09-11 16:36');
INSERT INTO `logrecord` VALUES ('34', 'admin管理员登录了', '2020-09-11 16:54');
INSERT INTO `logrecord` VALUES ('35', 'admin管理员登录了', '2020-09-11 16:54');
INSERT INTO `logrecord` VALUES ('36', 'admin管理员登录了', '2020-09-11 16:54');
INSERT INTO `logrecord` VALUES ('37', 'admin管理员登录了', '2020-09-11 16:55');
INSERT INTO `logrecord` VALUES ('38', 'admin管理员登录了', '2020-09-11 16:56');
INSERT INTO `logrecord` VALUES ('39', 'admin管理员登录了', '2020-09-11 16:57');
INSERT INTO `logrecord` VALUES ('40', '商品号为2的书籍下架了', '2020-09-11 16:57');
INSERT INTO `logrecord` VALUES ('41', '商品号为2的手机上架了', '2020-09-11 16:57');
INSERT INTO `logrecord` VALUES ('42', 'admin管理员登录了', '2020-09-11 16:58');
INSERT INTO `logrecord` VALUES ('43', 'admin管理员登录了', '2020-09-11 17:05');
INSERT INTO `logrecord` VALUES ('44', 'admin管理员登录了', '2020-09-11 17:08');
INSERT INTO `logrecord` VALUES ('45', 'admin管理员登录了', '2020-09-11 17:22');
INSERT INTO `logrecord` VALUES ('46', 'admin管理员登录了', '2020-09-11 17:23');
INSERT INTO `logrecord` VALUES ('47', 'admin管理员登录了', '2020-09-11 17:24');
INSERT INTO `logrecord` VALUES ('48', '上架新书籍了:名称为且听风吟,售价为20', '2020-09-11 17:28');
INSERT INTO `logrecord` VALUES ('49', 'admin管理员登录了', '2020-09-11 22:49');
INSERT INTO `logrecord` VALUES ('50', '商品号为1的书籍下架了', '2020-09-11 22:49');
INSERT INTO `logrecord` VALUES ('51', '商品号为1的手机上架了', '2020-09-11 22:49');
INSERT INTO `logrecord` VALUES ('52', '测试用户用户创建了新的订单', '2020-09-11 22:51');
INSERT INTO `logrecord` VALUES ('53', '订单号为6的订单发货了', '2020-09-11 22:56');
INSERT INTO `logrecord` VALUES ('54', '订单号为6的订单收货了', '2020-09-11 22:56');
INSERT INTO `logrecord` VALUES ('55', 'test用户创建了新的订单', '2020-10-11 11:43');
INSERT INTO `logrecord` VALUES ('56', 'admin管理员登录了', '2020-10-11 11:43');

-- ----------------------------
-- Table structure for `orderrecord`
-- ----------------------------
DROP TABLE IF EXISTS `orderrecord`;
CREATE TABLE `orderrecord` (
  `oid` int(11) NOT NULL auto_increment,
  `uuid` varchar(60) default NULL,
  `status` int(11) default NULL,
  `bid` int(11) default NULL,
  `number` int(11) default NULL,
  `createTime` varchar(50) default NULL,
  `sendTime` varchar(50) default NULL,
  `doneTime` varchar(50) default NULL,
  `buyId` int(11) default NULL,
  PRIMARY KEY  (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderrecord
-- ----------------------------
INSERT INTO `orderrecord` VALUES ('1', 'd9fa14f14e5043e1b398dda151eacfd8', '1', '2', '2', '2020-09-10 16:18', '2020-09-11 16:35', null, '1');
INSERT INTO `orderrecord` VALUES ('2', 'df499c87028946a085c2cac915f4102a', '0', '3', '2', '2020-09-10 16:18', null, null, '1');
INSERT INTO `orderrecord` VALUES ('3', '4353d57adb244d6d8df15a5c9d5f3ef4', '0', '2', '1', '2020-09-10 16:24', null, null, '1');
INSERT INTO `orderrecord` VALUES ('4', 'd14ff73194884ed9800faab9d7a3b8e6', '0', '3', '1', '2020-09-10 16:24', null, null, '1');
INSERT INTO `orderrecord` VALUES ('5', 'aea788bda6584ed69143aa876a0c8d73', '0', '3', '2', '2020-09-11 22:51', null, null, '2');
INSERT INTO `orderrecord` VALUES ('6', '7af4f37f267c4a49b65065def6fc4461', '2', '6', '1', '2020-09-11 22:51', '2020-09-11 22:56', '2020-09-11 22:56', '2');
INSERT INTO `orderrecord` VALUES ('7', 'b973cc25ca3f47da83a96876c267ea51', '0', '2', '1', '2020-10-11 11:43', null, null, '1');

-- ----------------------------
-- Table structure for `shopcar`
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar` (
  `sid` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `bid` int(11) default NULL,
  `number` int(11) default '1',
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcar
-- ----------------------------

-- ----------------------------
-- Table structure for `talk`
-- ----------------------------
DROP TABLE IF EXISTS `talk`;
CREATE TABLE `talk` (
  `tid` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `bid` int(11) default NULL,
  `content` varchar(255) default NULL,
  `sendTime` varchar(255) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talk
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL auto_increment,
  `tel` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  `name` varchar(20) default NULL,
  `createTime` varchar(50) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123', '123', 'test', '2020-09-10');
INSERT INTO `user` VALUES ('2', '123456', '123456', '测试用户', '2020-09-11 22:44');
