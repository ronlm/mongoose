/*
Navicat MySQL Data Transfer

Source Server         : Mysql5.0
Source Server Version : 50142
Source Host           : localhost:3306
Source Database       : goose

Target Server Type    : MYSQL
Target Server Version : 50142
File Encoding         : 65001

Date: 2012-11-04 20:53:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `buy_good`
-- ----------------------------
DROP TABLE IF EXISTS `buy_good`;
CREATE TABLE `buy_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存',
  `goodSupplierId` int(11) NOT NULL,
  `goodId` varchar(255) NOT NULL,
  `batchNum` varchar(11) DEFAULT NULL COMMENT '批号，可选填',
  `unitPrice` double(255,0) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `origin` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goodSupplierId` (`goodSupplierId`),
  KEY `goodId` (`goodId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of buy_good
-- ----------------------------
INSERT INTO `buy_good` VALUES ('4', '4', '1', '3423fdf', '23', '500', 'TZ', '2012-09-05', 'SDFGSDGSDFG');
INSERT INTO `buy_good` VALUES ('5', '4', '3', '13434', '15', '100', 'TW', '2012-09-12', 'FASFSADF');
INSERT INTO `buy_good` VALUES ('6', '1', '5', '322134fsadf', '50', '100', '广州', '2012-08-30', 'adfasfasdf');
INSERT INTO `buy_good` VALUES ('7', '1', '5', '454', '50', '100', '广州', '2012-09-05', 'adfasfasdf');
INSERT INTO `buy_good` VALUES ('8', '4', '5', '3143', '100', '100', '珠海', '2012-09-04', '霏霏ffdfdfd');
INSERT INTO `buy_good` VALUES ('9', '1', '1', '431232', '34', '434', 'fsadf', '2012-09-25', '34343');
INSERT INTO `buy_good` VALUES ('10', '1', '1', '12312', '322', '123', '23', '2012-10-11', 'dfasd');
INSERT INTO `buy_good` VALUES ('11', '5', '1', '34', '234', '234', 're', '2012-10-21', 'fasfsfsdgsdfg');
INSERT INTO `buy_good` VALUES ('12', '4', '1', '234', '234', '234', 'dfdfd', '2012-10-10', '');

-- ----------------------------
-- Table structure for `comm_menu`
-- ----------------------------
DROP TABLE IF EXISTS `comm_menu`;
CREATE TABLE `comm_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `resourceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_menu
-- ----------------------------
INSERT INTO `comm_menu` VALUES ('1', '系统菜单', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '2');
INSERT INTO `comm_menu` VALUES ('2', '系统用户管理', '/pages/Comm/userAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('3', '系统资源管理', '/pages/Comm/resourceAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('4', '系统菜单管理', '/pages/Comm/menuAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('5', '系统角色管理', '/pages/Comm/roleAction!list', '1', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('6', '农户农场管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '5');
INSERT INTO `comm_menu` VALUES ('8', '农户信息管理', '/pages/farmerFarm/farmerAction!list', '6', '/images/main/null.png', '5');
INSERT INTO `comm_menu` VALUES ('9', '物资信息管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '3');
INSERT INTO `comm_menu` VALUES ('10', '农场信息管理', '/pages/farmerFarm/farmAction!listAll', '6', '/images/main/null.png', '5');
INSERT INTO `comm_menu` VALUES ('11', '物资基本信息', '/pages/good/goodAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('13', '供应商信息', '/pages/good/goodSupplierAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('14', '物资销售信息', '/pages/good/tradeGoodAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('15', '鹅只信息管理', 'javascript:void(0)', '0', '/images/main/MenuIcon.png', '3');
INSERT INTO `comm_menu` VALUES ('17', '物资采购信息', '/pages/good/buyGoodAction!list', '9', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('18', '销售商信息', '/pages/saleGoose/retailerAction!list', '28', '/images/main/null.png', '6');
INSERT INTO `comm_menu` VALUES ('19', '鹅苗进场管理', '/pages/goose/receiveGooseAction!list', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('20', '成品鹅回购管理', '/pages/goose/tradeGooseAction!list', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('21', '成品鹅出售管理', '/pages/saleGoose/saleGooseAction!list', '28', '/images/main/null.png', '6');
INSERT INTO `comm_menu` VALUES ('22', '鹅只上市统计', '/pages/goose/gooseStatisticAction!market', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('23', '存栏鹅只统计', '/pages/goose/gooseStatisticAction!stock', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('24', '鹅只死亡统计', '/pages/goose/deadGooseStatisticAction!dead', '15', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('26', '信息检索', '/pages/goose/search.jsp', '30', '/images/main/null.png', '3');
INSERT INTO `comm_menu` VALUES ('27', '删除脚环信息', '/pages/goose/deleteAction!list', '30', '/images/main/null.png', '2');
INSERT INTO `comm_menu` VALUES ('28', '销售信息管理', 'javascript:void(0);', '0', '/images/main/MenuIcon.png', '6');
INSERT INTO `comm_menu` VALUES ('29', '销售信息统计', '/pages/saleGoose/gooseStatisticAction!sale', '28', '/images/main/null.png', '6');
INSERT INTO `comm_menu` VALUES ('30', '附加功能', 'javascript:void(0);', '0', '/images/main/MenuIcon.png', '3');
INSERT INTO `comm_menu` VALUES ('31', '物资与存栏对比', '/pages/goose/gooseStatisticAction!stockAndGood', '30', '/images/main/null.png', '4');
INSERT INTO `comm_menu` VALUES ('32', '鹅只存仓统计', '/pages/goose/gooseStatisticAction!wareStock', '15', '/images/main/null.png', '3');

-- ----------------------------
-- Table structure for `comm_resource`
-- ----------------------------
DROP TABLE IF EXISTS `comm_resource`;
CREATE TABLE `comm_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_resource
-- ----------------------------
INSERT INTO `comm_resource` VALUES ('1', '系统后台首页', '/pages/main/*', null);
INSERT INTO `comm_resource` VALUES ('2', '系统管理', '/pages/Comm/*', null);
INSERT INTO `comm_resource` VALUES ('3', '鹅只管理', '/pages/goose/*', '鹅只管理,供超级管理员，管理系统员和普通用户开放				');
INSERT INTO `comm_resource` VALUES ('4', '物资基本信息管理', '/pages/good/good*', '用于管理公司的农用物资种类，品名和供应商的基本信息		');
INSERT INTO `comm_resource` VALUES ('5', '农户农场管理', '/pages/farmerFarm/*', '用于管理农户农场	');
INSERT INTO `comm_resource` VALUES ('6', '鹅只出售管理', '/pages/saleGoose/*', '鹅只出售管理				');
INSERT INTO `comm_resource` VALUES ('7', '导出数据报表	', '/data/exportData/*', '导出数据报表		');
INSERT INTO `comm_resource` VALUES ('8', '物资销售管理', '/pages/good/tradeGood*', '物资销售管理');
INSERT INTO `comm_resource` VALUES ('9', '物资采购管理', '/pages/good/buyGood*', '物资采购管理	');

-- ----------------------------
-- Table structure for `comm_role`
-- ----------------------------
DROP TABLE IF EXISTS `comm_role`;
CREATE TABLE `comm_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_role
-- ----------------------------
INSERT INTO `comm_role` VALUES ('1', '超超级管理员', '														');
INSERT INTO `comm_role` VALUES ('2', '超级管理员', '超级管理员																																						');
INSERT INTO `comm_role` VALUES ('3', '普通用户', '普通用户												');

-- ----------------------------
-- Table structure for `comm_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `comm_role_resource`;
CREATE TABLE `comm_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `resourceId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `resourceId` (`resourceId`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_role_resource
-- ----------------------------
INSERT INTO `comm_role_resource` VALUES ('82', '2', '1');
INSERT INTO `comm_role_resource` VALUES ('83', '2', '2');
INSERT INTO `comm_role_resource` VALUES ('84', '2', '3');
INSERT INTO `comm_role_resource` VALUES ('85', '2', '4');
INSERT INTO `comm_role_resource` VALUES ('86', '2', '5');
INSERT INTO `comm_role_resource` VALUES ('87', '2', '6');
INSERT INTO `comm_role_resource` VALUES ('88', '2', '7');
INSERT INTO `comm_role_resource` VALUES ('94', '3', '1');
INSERT INTO `comm_role_resource` VALUES ('95', '3', '3');
INSERT INTO `comm_role_resource` VALUES ('96', '3', '4');
INSERT INTO `comm_role_resource` VALUES ('97', '3', '5');
INSERT INTO `comm_role_resource` VALUES ('98', '3', '8');
INSERT INTO `comm_role_resource` VALUES ('99', '1', '1');
INSERT INTO `comm_role_resource` VALUES ('100', '1', '2');
INSERT INTO `comm_role_resource` VALUES ('101', '1', '3');
INSERT INTO `comm_role_resource` VALUES ('102', '1', '4');
INSERT INTO `comm_role_resource` VALUES ('103', '1', '5');
INSERT INTO `comm_role_resource` VALUES ('104', '1', '6');
INSERT INTO `comm_role_resource` VALUES ('105', '1', '7');
INSERT INTO `comm_role_resource` VALUES ('106', '1', '8');
INSERT INTO `comm_role_resource` VALUES ('107', '1', '9');

-- ----------------------------
-- Table structure for `comm_user`
-- ----------------------------
DROP TABLE IF EXISTS `comm_user`;
CREATE TABLE `comm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '户用名',
  `userName` varchar(20) DEFAULT NULL COMMENT '用户名即账号，用于登录',
  `realName` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(50) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL COMMENT '话电号码',
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_user
-- ----------------------------
INSERT INTO `comm_user` VALUES ('1', 'admin', '引擎小组', 'admin', '123', '123@d.com', '123', '1');
INSERT INTO `comm_user` VALUES ('2', 'engine', '', '123456', '', '', '', '2');
INSERT INTO `comm_user` VALUES ('4', 'user', '', '123456', '', '', '', '3');

-- ----------------------------
-- Table structure for `dead_goose`
-- ----------------------------
DROP TABLE IF EXISTS `dead_goose`;
CREATE TABLE `dead_goose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gooseId` int(11) NOT NULL,
  `deadReasonId` int(11) NOT NULL,
  `deadDate` date NOT NULL,
  PRIMARY KEY (`id`,`gooseId`,`deadReasonId`),
  KEY `deadReasonId` (`deadReasonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dead_goose
-- ----------------------------

-- ----------------------------
-- Table structure for `dead_reason`
-- ----------------------------
DROP TABLE IF EXISTS `dead_reason`;
CREATE TABLE `dead_reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dead_reason
-- ----------------------------
INSERT INTO `dead_reason` VALUES ('1', '鹅瘟');
INSERT INTO `dead_reason` VALUES ('2', '其他');

-- ----------------------------
-- Table structure for `farm`
-- ----------------------------
DROP TABLE IF EXISTS `farm`;
CREATE TABLE `farm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `farmerId` varchar(30) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `signDate` date DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of farm
-- ----------------------------
INSERT INTO `farm` VALUES ('1', '1号农场', '1', '广州', '2012-07-04', '3000', 'sgsdffgdsfg	');
INSERT INTO `farm` VALUES ('2', '牛牛', '2', '南海', '2012-07-01', '2000', 'dfyfyh');
INSERT INTO `farm` VALUES ('3', '明德', '3', '南海', '2012-01-02', '1000', 'trdstrt');
INSERT INTO `farm` VALUES ('4', '天天农场', '4', '清远', '2012-01-08', '234234', 'gfhdrr');
INSERT INTO `farm` VALUES ('5', '城在农场', '5', '阳山', '2012-01-26', '3432', 'sdgsdf');
INSERT INTO `farm` VALUES ('6', '为之农场', '6', '韶关', '2012-02-01', '2000', 'fgsdfg');
INSERT INTO `farm` VALUES ('7', '阳光农场', '1', '肇庆', '2012-03-01', '1000', 'hfghfdh');
INSERT INTO `farm` VALUES ('8', '东宝农场', '2', '肇庆', '2012-01-30', '1005', 'fasdfasd');
INSERT INTO `farm` VALUES ('9', '功夫农场', '3', '阳山', '2011-11-30', '200', 'fgdsfg');
INSERT INTO `farm` VALUES ('10', '非 飞农场', '4', '东华', '2011-12-29', '540', 'adsfasd');
INSERT INTO `farm` VALUES ('11', 'gogas', '2', '水边', '2011-05-30', '234', '	');
INSERT INTO `farm` VALUES ('12', '爱热农场', '7', '英德', null, '234', '	莾地');

-- ----------------------------
-- Table structure for `farmer`
-- ----------------------------
DROP TABLE IF EXISTS `farmer`;
CREATE TABLE `farmer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of farmer
-- ----------------------------
INSERT INTO `farmer` VALUES ('1', '张三', '123456', '广州', '无');
INSERT INTO `farmer` VALUES ('2', '李四', '123456', '南海', '未签约');
INSERT INTO `farmer` VALUES ('3', '朱八', '3345879', '台山', '	');
INSERT INTO `farmer` VALUES ('4', '赵一', '1345545', '英德', '革要');
INSERT INTO `farmer` VALUES ('5', '钱二', '214324134', '清远', '奔城');
INSERT INTO `farmer` VALUES ('6', '吴六', '23423433', '阳山', '厅地');
INSERT INTO `farmer` VALUES ('7', '周七1', '234324456667', '阳山', '夺震城');

-- ----------------------------
-- Table structure for `good`
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodTypeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('1', '5', '油麦菜种', 'bao', null);
INSERT INTO `good` VALUES ('2', '4', '大叶槐苗', '棵', '0');
INSERT INTO `good` VALUES ('3', '3', '无敌消毒水', '瓶', null);
INSERT INTO `good` VALUES ('4', '3', '百毒杀', '瓶', '0');
INSERT INTO `good` VALUES ('5', '1', '正大饲料', '包', null);
INSERT INTO `good` VALUES ('6', '1', '幸福饲料', '包', null);

-- ----------------------------
-- Table structure for `goodsupplier`
-- ----------------------------
DROP TABLE IF EXISTS `goodsupplier`;
CREATE TABLE `goodsupplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of goodsupplier
-- ----------------------------
INSERT INTO `goodsupplier` VALUES ('1', '张三农药店', '111111', '广州', '	dfsadfsdafasf	');
INSERT INTO `goodsupplier` VALUES ('3', '李四', '222222', '广州', 'fadsfadsfdas		');
INSERT INTO `goodsupplier` VALUES ('4', '鑫鑫农资店', '432423', '在砝码城', '	');
INSERT INTO `goodsupplier` VALUES ('5', '嘻嘻化肥店', '343434', '大规模', '塔顶	');

-- ----------------------------
-- Table structure for `good_type`
-- ----------------------------
DROP TABLE IF EXISTS `good_type`;
CREATE TABLE `good_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '农用物资的所属种类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of good_type
-- ----------------------------
INSERT INTO `good_type` VALUES ('1', '饲料');
INSERT INTO `good_type` VALUES ('2', '化肥');
INSERT INTO `good_type` VALUES ('3', '农药');
INSERT INTO `good_type` VALUES ('4', '树苗');
INSERT INTO `good_type` VALUES ('5', '种子');
INSERT INTO `good_type` VALUES ('6', '其他');

-- ----------------------------
-- Table structure for `goose`
-- ----------------------------
DROP TABLE IF EXISTS `goose`;
CREATE TABLE `goose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ringId` varchar(30) NOT NULL,
  `receiveId` int(11) NOT NULL,
  `tradeId` int(11) DEFAULT NULL,
  `saleId` int(11) DEFAULT NULL,
  `isValid` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receiveId` (`receiveId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goose
-- ----------------------------

-- ----------------------------
-- Table structure for `receive_goose`
-- ----------------------------
DROP TABLE IF EXISTS `receive_goose`;
CREATE TABLE `receive_goose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farmId` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `receiveDate` date DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `farmId` (`farmId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receive_goose
-- ----------------------------

-- ----------------------------
-- Table structure for `retailer`
-- ----------------------------
DROP TABLE IF EXISTS `retailer`;
CREATE TABLE `retailer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `regionId` int(11) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regionId` (`regionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of retailer
-- ----------------------------
INSERT INTO `retailer` VALUES ('1', 'XX烧鹅店', '1', '123465', '茜需要', 'afasdfasdfadsfd								');
INSERT INTO `retailer` VALUES ('2', '张三鹅肉加工厂', '1', '9527', '珠海', '鞢夺	桔柑			');
INSERT INTO `retailer` VALUES ('3', '白水酒店', '1', '13431243', '左膨胀', '			');
INSERT INTO `retailer` VALUES ('4', 'qqShop', '4', '123', '广州', '地 模压 			');
INSERT INTO `retailer` VALUES ('5', '天鹅门店', '5', '2344', '广州', '无可奈何花落去			');
INSERT INTO `retailer` VALUES ('6', '鹅专门店', '1', '2343', '地城', '	塔顶栽植');

-- ----------------------------
-- Table structure for `sale_goose`
-- ----------------------------
DROP TABLE IF EXISTS `sale_goose`;
CREATE TABLE `sale_goose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `retailerId` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `unitPrice` double DEFAULT NULL,
  `totalWeight` double DEFAULT NULL,
  `totalValue` double DEFAULT NULL,
  `saleDate` date DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `retailerId` (`retailerId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sale_goose
-- ----------------------------
INSERT INTO `sale_goose` VALUES ('1', '1', '100', '22.2', '650', '14430', '2012-10-07', 'fdfdf		');

-- ----------------------------
-- Table structure for `sale_region`
-- ----------------------------
DROP TABLE IF EXISTS `sale_region`;
CREATE TABLE `sale_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(30) NOT NULL COMMENT '销售商所属的地区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_region
-- ----------------------------
INSERT INTO `sale_region` VALUES ('1', '华南地区');
INSERT INTO `sale_region` VALUES ('2', '华北区');
INSERT INTO `sale_region` VALUES ('3', '东北区');
INSERT INTO `sale_region` VALUES ('4', '华中区');
INSERT INTO `sale_region` VALUES ('5', '西南区');

-- ----------------------------
-- Table structure for `trade_good`
-- ----------------------------
DROP TABLE IF EXISTS `trade_good`;
CREATE TABLE `trade_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farmerId` int(11) NOT NULL,
  `goodId` int(11) NOT NULL,
  `tradeDate` date DEFAULT NULL,
  `unitPrice` double DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `farmerId` (`farmerId`),
  KEY `goodId` (`goodId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of trade_good
-- ----------------------------
INSERT INTO `trade_good` VALUES ('7', '5', '1', '2012-09-06', '44', '100', 'TFHFGHXF	');
INSERT INTO `trade_good` VALUES ('8', '1', '3', '2012-09-17', '30', '10', 'cash	');
INSERT INTO `trade_good` VALUES ('9', '1', '1', '2012-09-16', '123', '3', '	');
INSERT INTO `trade_good` VALUES ('10', '7', '5', '2012-09-08', '100', '10', '	');
INSERT INTO `trade_good` VALUES ('11', '2', '5', '2012-09-17', '100', '15', 'fdfdfdf	');
INSERT INTO `trade_good` VALUES ('12', '1', '1', '2012-10-21', '123', '123', '	13123		');
INSERT INTO `trade_good` VALUES ('13', '5', '1', '2012-10-09', '12', '123', '	');
INSERT INTO `trade_good` VALUES ('14', '1', '3', '2012-10-21', '12', '122', '			');
INSERT INTO `trade_good` VALUES ('15', '7', '1', '2012-10-09', '121', '12', '	');
INSERT INTO `trade_good` VALUES ('16', '1', '5', '2012-10-17', '11', '11', '	');
INSERT INTO `trade_good` VALUES ('17', '7', '1', '2012-11-03', '12', '123', 'asdfdsf	');

-- ----------------------------
-- Table structure for `trade_goose`
-- ----------------------------
DROP TABLE IF EXISTS `trade_goose`;
CREATE TABLE `trade_goose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farmId` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `unitPrice` double DEFAULT NULL,
  `totalWeight` double DEFAULT NULL,
  `tradeDate` date DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `farmId` (`farmId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of trade_goose
-- ----------------------------
INSERT INTO `trade_goose` VALUES ('1', '1', '2', '2.03', '2', '2012-10-08', '	');
INSERT INTO `trade_goose` VALUES ('2', '10', '2', '5', '1', '2012-11-04', '');

-- ----------------------------
-- View structure for `buygoodview`
-- ----------------------------
DROP VIEW IF EXISTS `buygoodview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `buygoodview` AS select `buy_good`.`id` AS `id`,`buy_good`.`goodSupplierId` AS `supplierId`,`buy_good`.`goodId` AS `goodId`,`buy_good`.`batchNum` AS `batchNum`,`buy_good`.`unitPrice` AS `unitPrice`,`buy_good`.`amount` AS `amount`,`buy_good`.`origin` AS `origin`,`buy_good`.`date` AS `date`,`buy_good`.`comments` AS `comments`,`good`.`name` AS `goodName`,`good`.`unit` AS `unit`,`goodsupplier`.`name` AS `supplierName`,`goodsupplier`.`phone` AS `supplierPhone`,`good`.`goodTypeId` AS `goodTypeId` from ((`buy_good` join `good`) join `goodsupplier`) where ((`buy_good`.`goodId` = `good`.`id`) and (`buy_good`.`goodSupplierId` = `goodsupplier`.`id`)) ;

-- ----------------------------
-- View structure for `dead_goose_view`
-- ----------------------------
DROP VIEW IF EXISTS `dead_goose_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dead_goose_view` AS select `dead_goose`.`id` AS `id`,`dead_goose`.`gooseId` AS `gooseId`,`goose`.`ringId` AS `ringId`,`goose`.`receiveId` AS `receiveId`,`dead_reason`.`reason` AS `reason`,`dead_goose`.`deadDate` AS `deadDate`,`dead_reason`.`id` AS `reasonId` from ((`goose` join `dead_reason`) join `dead_goose`) where ((`goose`.`id` = `dead_goose`.`gooseId`) and (`dead_goose`.`deadReasonId` = `dead_reason`.`id`)) ;

-- ----------------------------
-- View structure for `goodview`
-- ----------------------------
DROP VIEW IF EXISTS `goodview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `goodview` AS select `good`.`id` AS `id`,`good`.`goodTypeId` AS `goodTypeId`,`good`.`name` AS `name`,`good`.`unit` AS `unit`,`good`.`stock` AS `stock`,`good_type`.`name` AS `goodTypeName` from (`good` join `good_type`) where (`good`.`goodTypeId` = `good_type`.`id`) ;

-- ----------------------------
-- View structure for `market`
-- ----------------------------
DROP VIEW IF EXISTS `market`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `market` AS select `farm`.`id` AS `farmId`,`receive_goose`.`id` AS `receiveId`,`farm`.`name` AS `farmName`,`farm`.`farmerId` AS `farmerId`,`farm`.`address` AS `address`,`receive_goose`.`amount` AS `amount`,`receive_goose`.`receiveDate` AS `receiveDate`,`receive_goose`.`comments` AS `comments` from (`farm` join `receive_goose`) where (`farm`.`id` = `receive_goose`.`farmId`) ;

-- ----------------------------
-- View structure for `retailerview`
-- ----------------------------
DROP VIEW IF EXISTS `retailerview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `retailerview` AS select `retailer`.`id` AS `id`,`retailer`.`name` AS `name`,`retailer`.`regionId` AS `regionId`,`retailer`.`phone` AS `phone`,`retailer`.`address` AS `address`,`retailer`.`comments` AS `comments`,`sale_region`.`region` AS `region` from (`retailer` join `sale_region`) where (`retailer`.`regionId` = `sale_region`.`id`) ;

-- ----------------------------
-- View structure for `tradegoodview`
-- ----------------------------
DROP VIEW IF EXISTS `tradegoodview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tradegoodview` AS select `farmer`.`id` AS `farmerId`,`farmer`.`name` AS `farmerName`,`farmer`.`phone` AS `phone`,`trade_good`.`id` AS `id`,`trade_good`.`goodId` AS `goodId`,`trade_good`.`tradeDate` AS `tradeDate`,`trade_good`.`unitPrice` AS `unitPrice`,`trade_good`.`amount` AS `amount`,`trade_good`.`comments` AS `comments`,`good`.`name` AS `goodName`,`good`.`unit` AS `goodUnit`,`good`.`goodTypeId` AS `goodTypeId` from ((`farmer` join `trade_good` on(('' = ''))) join `good`) where ((`farmer`.`id` = `trade_good`.`farmerId`) and (`trade_good`.`goodId` = `good`.`id`)) ;
