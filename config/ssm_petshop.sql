/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ssm_petshop

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-05-19 14:23:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `auid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`auid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES ('1', 'admin', 'admin', '0');

-- ----------------------------
-- Table structure for billitem
-- ----------------------------
DROP TABLE IF EXISTS `billitem`;
CREATE TABLE `billitem` (
  `billid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `ptotal` double DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`billid`),
  UNIQUE KEY `pid` (`pid`),
  KEY `FK3510439A73B4E627` (`pid`),
  CONSTRAINT `FK3510439A73B4E627` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of billitem
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '宠物狗');
INSERT INTO `category` VALUES ('2', '宠物猫');
INSERT INTO `category` VALUES ('3', '宠物兔');
INSERT INTO `category` VALUES ('4', '宠物鸟类');
INSERT INTO `category` VALUES ('5', '宠物鱼类');
INSERT INTO `category` VALUES ('6', '其他宠物');
INSERT INTO `category` VALUES ('7', '宠物医疗');
INSERT INTO `category` VALUES ('8', '宠物美容');

-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `FK936FCAF2418BCBAF` (`cid`),
  CONSTRAINT `FK936FCAF2418BCBAF` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES ('1', '金毛犬', '1');
INSERT INTO `categorysecond` VALUES ('2', '牧羊犬', '1');
INSERT INTO `categorysecond` VALUES ('3', '哈士奇犬', '1');
INSERT INTO `categorysecond` VALUES ('4', '阿拉斯加', '1');
INSERT INTO `categorysecond` VALUES ('5', '拉布拉多', '1');
INSERT INTO `categorysecond` VALUES ('6', '其他犬类', '1');
INSERT INTO `categorysecond` VALUES ('7', '加菲猫', '2');
INSERT INTO `categorysecond` VALUES ('8', '波斯猫', '2');
INSERT INTO `categorysecond` VALUES ('9', '巴厘猫', '2');
INSERT INTO `categorysecond` VALUES ('10', '龙猫', '2');
INSERT INTO `categorysecond` VALUES ('11', '布偶猫', '2');
INSERT INTO `categorysecond` VALUES ('13', '猫咪', '2');
INSERT INTO `categorysecond` VALUES ('14', '其他猫', '2');
INSERT INTO `categorysecond` VALUES ('15', '白兔', '3');
INSERT INTO `categorysecond` VALUES ('16', '蝴蝶兔', '3');
INSERT INTO `categorysecond` VALUES ('17', '荷兰兔', '3');
INSERT INTO `categorysecond` VALUES ('18', '猫猫兔', '3');
INSERT INTO `categorysecond` VALUES ('19', '鹦鹉', '4');
INSERT INTO `categorysecond` VALUES ('20', '金丝雀', '4');
INSERT INTO `categorysecond` VALUES ('21', '百灵鸟', '4');
INSERT INTO `categorysecond` VALUES ('22', '喜鹊', '4');
INSERT INTO `categorysecond` VALUES ('23', '金鱼', '5');
INSERT INTO `categorysecond` VALUES ('24', '龙鱼', '5');
INSERT INTO `categorysecond` VALUES ('25', '热带鱼', '5');
INSERT INTO `categorysecond` VALUES ('29', '玻璃鱼', '5');
INSERT INTO `categorysecond` VALUES ('30', '宠物猪', '6');
INSERT INTO `categorysecond` VALUES ('31', '宠物猴', '6');
INSERT INTO `categorysecond` VALUES ('32', '宠物鳄鱼', '6');
INSERT INTO `categorysecond` VALUES ('33', '宠物鼠', '6');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `messagedate` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`messageid`),
  KEY `FK38EB0007FC32F8E` (`uid`),
  CONSTRAINT `FK38EB0007FC32F8E` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '这个宠物商城中的宠物都好可爱', '2019-11-28', '3');
INSERT INTO `message` VALUES ('2', '\r\n哈士奇真是太可爱了，哈哈', '2019-11-28', '3');
INSERT INTO `message` VALUES ('3', '<p>金毛好可爱！！！！！！！！！！！！！！！！</p>\r\n', '2019-07-12 11:34:37', '1');
INSERT INTO `message` VALUES ('5', '<p>很喜欢</p>\r\n', '2020-05-15 20:18:11', '4');
INSERT INTO `message` VALUES ('6', '<p>小猫咪很乖，好喜欢！</p>\r\n', '2020-05-18 12:55:00', '4');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `oiid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oiid`),
  KEY `FKE8B2AB61E818A405` (`oid`),
  KEY `FKE8B2AB6173B4E627` (`pid`),
  CONSTRAINT `FKE8B2AB6173B4E627` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `FKE8B2AB61E818A405` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', '1', '699', '36', '2');
INSERT INTO `orderitem` VALUES ('2', '1', '588', '37', '2');
INSERT INTO `orderitem` VALUES ('3', '1', '699', '42', '2');
INSERT INTO `orderitem` VALUES ('4', '1', '699', '40', '2');
INSERT INTO `orderitem` VALUES ('5', '1', '4899', '54', '3');
INSERT INTO `orderitem` VALUES ('6', '1', '7999', '55', '3');
INSERT INTO `orderitem` VALUES ('7', '1', '45', '45', '3');
INSERT INTO `orderitem` VALUES ('8', '1', '9', '46', '3');
INSERT INTO `orderitem` VALUES ('9', '1', '166', '61', '4');
INSERT INTO `orderitem` VALUES ('10', '1', '120', '45', '5');
INSERT INTO `orderitem` VALUES ('11', '1', '500', '60', '6');
INSERT INTO `orderitem` VALUES ('12', '1', '450', '36', '7');
INSERT INTO `orderitem` VALUES ('13', '1', '245', '40', '7');
INSERT INTO `orderitem` VALUES ('14', '1', '419', '48', '8');
INSERT INTO `orderitem` VALUES ('15', '1', '555', '41', '8');
INSERT INTO `orderitem` VALUES ('16', '1', '245', '40', '9');
INSERT INTO `orderitem` VALUES ('17', '1', '500', '60', '9');
INSERT INTO `orderitem` VALUES ('18', '3', '399', '39', '10');
INSERT INTO `orderitem` VALUES ('19', '1', '99', '35', '11');
INSERT INTO `orderitem` VALUES ('20', '2', '900', '36', '11');
INSERT INTO `orderitem` VALUES ('21', '1', '450', '36', '12');
INSERT INTO `orderitem` VALUES ('22', '1', '500', '60', '12');
INSERT INTO `orderitem` VALUES ('23', '1', '166', '61', '12');
INSERT INTO `orderitem` VALUES ('24', '2', '332', '61', '13');
INSERT INTO `orderitem` VALUES ('25', '1', '399', '34', '14');
INSERT INTO `orderitem` VALUES ('26', '1', '99', '35', '15');
INSERT INTO `orderitem` VALUES ('27', '1', '450', '36', '15');
INSERT INTO `orderitem` VALUES ('28', '1', '100', '38', '15');
INSERT INTO `orderitem` VALUES ('29', '1', '450', '36', '16');
INSERT INTO `orderitem` VALUES ('30', '1', '150', '42', '17');
INSERT INTO `orderitem` VALUES ('31', '1', '166', '61', '17');
INSERT INTO `orderitem` VALUES ('32', '3', '1665', '41', '18');
INSERT INTO `orderitem` VALUES ('33', '2', '1000', '60', '19');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `money` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `receiveInfo` varchar(255) DEFAULT NULL,
  `phoNum` varchar(255) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `accepter` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FKC3DF62E5FC32F8E` (`uid`),
  CONSTRAINT `FKC3DF62E5FC32F8E` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '2685', '0', null, null, '2019-03-18 21:10:00', '3', null);
INSERT INTO `orders` VALUES ('2', '2685', '1', '上海市静安区', '13913812312', '2019-03-18 21:12:16', '3', '嗷大猫');
INSERT INTO `orders` VALUES ('3', '12952', '0', null, null, '2019-03-04 17:37:01', '1', null);
INSERT INTO `orders` VALUES ('4', '166', '1', '1212121', '212121', '2019-07-12 11:33:31', '1', '212121');
INSERT INTO `orders` VALUES ('5', '120', '2', '', '', '2020-04-24 17:13:42', '4', '');
INSERT INTO `orders` VALUES ('6', '500', '0', null, null, '2020-05-13 01:24:13', '4', null);
INSERT INTO `orders` VALUES ('7', '695', '1', '', '', '2020-05-15 20:06:40', '4', '');
INSERT INTO `orders` VALUES ('8', '974', '0', null, null, '2020-05-15 20:15:13', '4', null);
INSERT INTO `orders` VALUES ('9', '745', '1', '大连东软信息学院', '123456789', '2020-05-15 21:24:10', '4', '于');
INSERT INTO `orders` VALUES ('10', '399', '0', null, null, '2020-05-17 22:46:49', '4', null);
INSERT INTO `orders` VALUES ('11', '999', '0', null, null, '2020-05-17 22:50:51', '4', null);
INSERT INTO `orders` VALUES ('12', '1116', '0', null, null, '2020-05-18 15:35:20', '4', null);
INSERT INTO `orders` VALUES ('13', '332', '0', null, null, '2020-05-18 15:36:19', '4', null);
INSERT INTO `orders` VALUES ('14', '399', '0', null, null, '2020-05-18 15:40:29', '4', null);
INSERT INTO `orders` VALUES ('15', '649', '0', null, null, '2020-05-18 15:42:16', '4', null);
INSERT INTO `orders` VALUES ('16', '450', '0', null, null, '2020-05-18 22:01:08', '4', null);
INSERT INTO `orders` VALUES ('17', '316', '0', null, null, '2020-05-18 22:06:32', '4', null);
INSERT INTO `orders` VALUES ('18', '1665', '0', null, null, '2020-05-18 22:10:53', '4', null);
INSERT INTO `orders` VALUES ('19', '1000', '2', '大连', '789456123', '2020-05-18 22:16:02', '4', '张');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `pdesc` varchar(5000) DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdate` timestamp NULL DEFAULT NULL,
  `csid` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FKED8DCCEF5F778050` (`csid`),
  CONSTRAINT `FKED8DCCEF5F778050` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('34', '阿拉斯加', '422', '399', 'products/0ad46e8a-1807-416a-96bb-c6ce04afd5ff0004.jpg', '霸气阿拉斯加', '1', '2019-12-13 17:38:24', '4', null);
INSERT INTO `product` VALUES ('35', '金丝雀', '110', '99', 'products/1dcf0d68-5717-448e-816e-7ebf65e9583a20191122062410.jpg', '金丝雀，唱歌很好听', '1', '2019-12-13 17:37:12', '20', null);
INSERT INTO `product` VALUES ('36', '小白兔', '470', '450', 'products/8b175c8b-4ba0-47da-8881-ccf79cea7aadtimg.jpg', '小白兔，白又白，\r\n两只耳朵竖起来', '0', '2020-05-17 19:59:28', '15', null);
INSERT INTO `product` VALUES ('37', '鹦鹉鸟', '209', '188', 'products/216c0eaf-3f94-4f91-8fe0-484f764622c21000.jpg', '会说话的鹦鹉', '0', '2019-12-13 17:35:46', '19', null);
INSERT INTO `product` VALUES ('38', '可爱小鼠', '199', '100', 'products/ad6a2586-81a0-4d0c-94a3-396fc183a8d5laoshu.jpg', '可爱小老鼠', '0', '2019-12-13 17:35:08', '33', null);
INSERT INTO `product` VALUES ('39', '可爱波斯猫', '169', '133', 'products/63f09645-c7a1-4834-a6ff-e3731a7b51f820191122063109.jpg', '十分好看的波斯猫', '1', '2019-12-13 17:34:11', '8', null);
INSERT INTO `product` VALUES ('40', '金毛犬', '290', '245', 'products/78877fdc-41ae-4646-9bae-c5fe968679ce20191209024808.jpeg', '听话暖男金毛犬', '1', '2019-12-13 17:33:36', '1', null);
INSERT INTO `product` VALUES ('41', '加菲猫', '770', '555', 'products/b27b1e23-494c-4be8-a39f-4913e21300e420191122064535.jpg', '高冷加菲猫', '1', '2019-12-13 17:32:25', '7', null);
INSERT INTO `product` VALUES ('42', '蝴蝶犬', '180', '150', 'products/c004bc49-3fb8-4d29-87d8-0f2693e3ff56timg.jpg', '十分惹人爱的蝴蝶犬', '0', '2020-05-15 21:33:57', '6', null);
INSERT INTO `product` VALUES ('43', '比特犬', '220', '160', 'products/40cc2f0f-d292-4acd-885a-a9a2e8f7a57f20191122064717.jpg', '十分凶悍', '0', '2019-12-13 17:30:40', '6', null);
INSERT INTO `product` VALUES ('44', '可爱小猫咪', '290', '245', 'products/ee9a02c6-c463-4872-9c39-6552abf2a1a020191123092208.jpg', '可爱小猫咪', '1', '2019-12-13 17:29:44', '13', null);
INSERT INTO `product` VALUES ('45', '小金鱼', '190', '120', 'products/aa8949d9-083f-4a48-8772-5fe5524095d720191122064917.jpg', '金色小金鱼', '1', '2019-12-13 17:28:38', '23', null);
INSERT INTO `product` VALUES ('46', '龙猫', '111', '90', 'products/9fb10bd1-9ebc-4068-97a5-ef32fda557290008.jpg', '龙猫', '1', '2019-12-13 17:48:08', '10', null);
INSERT INTO `product` VALUES ('47', '哈士奇犬', '299', '289', 'products/eeaaada5-99a8-4d40-ad0d-076deeba151f0003.jpg', '俗称（二哈）哈士奇犬', '1', '2019-12-13 17:44:29', '3', null);
INSERT INTO `product` VALUES ('48', '蝴蝶兔', '522', '419', 'products/bba102ca-3699-4a6b-8d04-a0879b95aa3fu=3523400314,1092009656&fm=58&bpow=250&bpoh=177.jpg', '蝴蝶兔', '0', '2019-12-13 17:59:45', '16', null);
INSERT INTO `product` VALUES ('49', '牧羊犬', '1299', '1199', 'products/2c339cce-8e9e-462a-ba75-2633be204ea60002.jpg', '牧羊犬幼犬', '0', '2019-12-13 17:43:13', '2', null);
INSERT INTO `product` VALUES ('50', '巴厘猫', '199', '189', 'products/1e4a6123-962d-422a-b3d9-713cf917f24e0007.jpg', '巴厘猫幼猫', '0', '2019-12-13 17:45:54', '9', null);
INSERT INTO `product` VALUES ('51', '热带鱼', '1199', '1099', 'products/d7271709-f0f7-438c-b914-80d226f95687u=585336170,3913415700&fm=58.jpg', '热带鱼，煮着吃十分美味', '1', '2019-12-13 17:58:32', '25', null);
INSERT INTO `product` VALUES ('52', '龙鱼', '1999', '1799', 'products/dd515ca6-7e9e-429a-99c8-ead0d4f41aa8u=946221869,1962949722&fm=58.jpg', '红尾龙鱼', '0', '2019-12-13 17:50:54', '24', null);
INSERT INTO `product` VALUES ('53', '猫猫兔', '159', '109', 'products/75247e27-809f-47b9-82a1-4a8122045d80u=831971558,1559669327&fm=58&bpow=600&bpoh=600.jpg', '猫猫兔', '0', '2019-12-13 18:01:25', '18', null);
INSERT INTO `product` VALUES ('54', '小猫咪', '700', '500', 'products/5fab14f2-2532-4529-90b0-6e65b2bf4feb20191122062127.jpg', '小猫咪', '1', '2019-12-13 17:24:54', '13', null);
INSERT INTO `product` VALUES ('55', '荷兰兔', '800', '600', 'products/e8a206cc-006d-4232-9398-f8f227ae0e7d20191122062010.jpg', '荷兰兔', '0', '2019-12-13 17:22:48', '17', null);
INSERT INTO `product` VALUES ('56', '百灵鸟', '166', '144', 'products/ef7c9826-733d-4eae-aeef-9d7382906ddcu=2032935164,2077203867&fm=58&bpow=700&bpoh=489.jpg', '百灵鸟声音极其好听', '1', '2019-12-13 18:02:50', '21', null);
INSERT INTO `product` VALUES ('57', '宠物猪', '555', '444', 'products/7103de05-ed39-4cb2-842a-660303933c20u=1307429950,572500159&fm=27&gp=0.jpg', '宠物猪，长不大，也就能长到300斤', '1', '2019-12-13 18:04:52', '30', null);
INSERT INTO `product` VALUES ('58', '宠物猴', '644', '500', 'products/a4f0db6a-e18a-4182-9992-c09d77b1cdb1u=3068668599,2651578214&fm=58&bpow=450&bpoh=300.jpg', '宠物猴，长得十分聪明', '1', '2019-12-13 18:07:04', '31', null);
INSERT INTO `product` VALUES ('59', '宠物鳄鱼', '944', '700', 'products/b6b37dba-6ab0-4156-b434-f71ebac649c6c75c10385343fbf2849eb1b1bb7eca8064388ff5.jpg', '宠物鳄鱼', '1', '2019-12-13 18:09:15', '32', null);
INSERT INTO `product` VALUES ('60', '母金毛犬', '599', '500', 'products/60849188-8f40-4d69-ab2f-15102fcaaebe0001.jpg', '母的金毛犬', '1', '2019-12-13 18:36:00', '1', null);
INSERT INTO `product` VALUES ('61', '布偶猫', '199', '166', 'products/df32868a-fd63-44b9-9a71-4df3ef83c3d2u=861903154,2429196093&fm=27&gp=0.jpg', '布偶猫', '1', '2019-12-13 18:37:18', '11', null);

-- ----------------------------
-- Table structure for shopcartitem
-- ----------------------------
DROP TABLE IF EXISTS `shopcartitem`;
CREATE TABLE `shopcartitem` (
  `cartitemid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `pcount` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `ptotal` double DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cartitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcartitem
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `state` varchar(255) NOT NULL DEFAULT '1',
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'user', '123456', '李佳', 'lijia@qq.com', '15137226422', '安阳市', '1', null);
INSERT INTO `user` VALUES ('3', 'hellokitty', '123456', '张三', 'aodamao@qq.com', '13555512345', '上海市', '0', 'ca0f6f5a-36da-402d-8c0f-22587423de20');
INSERT INTO `user` VALUES ('4', '123456', '123456', '123456', '123456@qq.com', '123456', '123456', '0', '11f5f34f-f299-4f30-a113-725c022b7379');
INSERT INTO `user` VALUES ('5', '123456', '123456', '123456', '123456@qq.com', '123456', '123456', '0', 'c99a7bcf-d658-473b-ae82-d0924e342625');
INSERT INTO `user` VALUES ('6', '123456789', '123456789', '', '', '', '', '0', '5b2d11df-f932-4171-9d12-656f9888670f');
INSERT INTO `user` VALUES ('7', 'zhuce', '123', '', '', '', '', '0', '13343b86-37b4-48a1-ac87-51b2ff778c71');
INSERT INTO `user` VALUES ('8', '123456', '123456', '', '', '', '', '0', '7131f7c3-2b57-4346-9cf2-dd76f1c72249');
INSERT INTO `user` VALUES ('9', 'admin111', '111', '1', '111', '1', '1', '0', '667cf322-8c07-4af8-b3b5-ae0d8627fcee');
INSERT INTO `user` VALUES ('10', 'admin111111', '111', '1', '111', '1', '1', '0', '6fa87ad8-c427-4a7a-89fb-0db34f90ad05');
INSERT INTO `user` VALUES ('11', 'admin222', 'admin22', '222', '222', '222', '222', '0', '196f89d1-2582-4c37-9804-4f13425b4b26');
INSERT INTO `user` VALUES ('12', '123456111', '123456000', '000', '000', '000', '000', '0', 'd270322c-85a1-40a6-9cc5-dab760bc9b11');
