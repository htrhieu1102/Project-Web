/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : shopkey

 Target Server Type    : MariaDB
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 11/01/2023 00:10:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Windows');
INSERT INTO `category` VALUES (2, 'Office');
INSERT INTO `category` VALUES (3, 'Anti Virus');
INSERT INTO `category` VALUES (4, 'Design');
INSERT INTO `category` VALUES (5, 'Server');
INSERT INTO `category` VALUES (6, 'Other');

-- ----------------------------
-- Table structure for discount
-- ----------------------------
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount`  (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `d_startdate` date NULL DEFAULT NULL,
  `d_enddate` date NULL DEFAULT NULL,
  `d_rate` float NOT NULL,
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discount
-- ----------------------------
INSERT INTO `discount` VALUES (1, 'VOUCHER5', '2022-12-03', '2023-12-03', 0.05);
INSERT INTO `discount` VALUES (2, 'VOUCHER10', '2022-12-03', '2023-02-03', 0.1);
INSERT INTO `discount` VALUES (3, 'VOUCHER15', '2022-12-03', '2023-10-03', 0.15);
INSERT INTO `discount` VALUES (4, 'VOUCHER20', '2022-12-03', '2023-11-03', 0.2);
INSERT INTO `discount` VALUES (5, 'VOUCHER25', '2022-12-03', '2022-12-06', 0.25);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `o_date` date NULL DEFAULT NULL,
  `o_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `o_cardnumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `o_bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`o_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (4, 7, '2023-01-11', '-1', '123456789', 'BIDV');
INSERT INTO `order` VALUES (5, 7, '2023-01-11', '0', '123456789', 'TCBank');

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `o_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `pprice` int(11) NOT NULL,
  `od_quantity` int(11) NOT NULL,
  `od_total` int(11) NOT NULL,
  PRIMARY KEY (`o_id`, `p_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (4, 4, 1000000, 1, 1000000);
INSERT INTO `order_details` VALUES (5, 4, 1000000, 1, 1000000);
INSERT INTO `order_details` VALUES (5, 5, 1200000, 1, 1200000);
INSERT INTO `order_details` VALUES (5, 6, 500000, 1, 500000);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `pimage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pprice_old` int(11) NOT NULL,
  `pprice` int(11) NOT NULL,
  `pamount` int(11) NOT NULL,
  `pbranch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pnumber_device` int(11) NOT NULL,
  `pdesciption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (4, 1, 'http://localhost:8080/Project_Web_war/image/product-image/windows/windows-10-home.png', 'Windows 10 Home', 2000000, 1000000, 20, 'Windows', 1, ' ');
INSERT INTO `product` VALUES (5, 1, 'http://localhost:8080/Project_Web_war/image/product-image/windows/win-11-pro-for-workstations-510x510.png', 'Windows 11 Pro', 2500000, 1200000, 30, 'Windows', 5, ' Windows 10 Pro là phiên bản cao cấp được bổ sung thêm các tính năng cần thiết dành cho người dùng cá nhân, hỗ trợ các công cụ giúp người dùng IT quản lý và hỗ trợ các công ty doanh nghiệp nhỏ, bảo vệ tốt hơn các thông tin và dữ liệu người dùng.');
INSERT INTO `product` VALUES (6, 1, 'http://localhost:8080/Project_Web_war/image/product-image/windows/windows-7-ultimate-510x510.png', 'Windows 7 Ultimate', 1000000, 500000, 20, 'Windows', 1, ' ');
INSERT INTO `product` VALUES (7, 1, 'http://localhost:8080/Project_Web_war/image/product-image/windows/windows-10-enterprise-gia-re-min-510x510.png', 'Windows 10 Enterprise', 2000000, 1000000, 20, 'Windows', 1, ' ');
INSERT INTO `product` VALUES (11, 6, 'http://localhost:8080/Project_Web_war/image/product-image/other(entertainment)/plex-pass-lifetime-logo-min-510x510.png', 'Flex Movie & TV', 800000, 500000, 10, 'Plex', 1, ' ');
INSERT INTO `product` VALUES (12, 6, 'http://localhost:8080/Project_Web_war/image/product-image/other(entertainment)/youtube-premium-gia-re-510x510.png', 'Youtube Premium', 1000000, 200000, 20, 'Google', 1, ' ');
INSERT INTO `product` VALUES (13, 1, 'http://localhost:8080/Project_Web_war/image/product-image/windows/windows-11-pro-mak-510x510.png', 'Windows 11 Pro MAK', 3500000, 2000000, 15, 'Windows', 1, ' ');
INSERT INTO `product` VALUES (14, 1, 'http://localhost:8080/Project_Web_war/image/product-image/windows/Windows-11-Home-510x510.png', 'Windows 11 Home', 2000000, 900000, 50, 'Windows', 1, ' ');
INSERT INTO `product` VALUES (15, 1, 'http://localhost:8080/Project_Web_war/image/product-image/windows/windows-10-eduction-510x510.png', 'Windows 10 Education', 1800000, 1000000, 20, 'Windows', 5, ' ');
INSERT INTO `product` VALUES (16, 1, 'http://localhost:8080/Project_Web_war/image/product-image/windows/key-windows-8.1-pro-gia-re-510x510.png', 'Windows 8.1 Pro', 1500000, 600000, 10, 'Windows', 1, ' ');
INSERT INTO `product` VALUES (26, 2, 'http://localhost:8080/Project_Web_war/image/product-image/office/office-2013-pro-plus-ban-quyen-min-510x510.png', 'Office 2013 Pro', 1500000, 800000, 10, 'Microsoft', 5, ' ');
INSERT INTO `product` VALUES (27, 2, 'http://localhost:8080/Project_Web_war/image/product-image/office/office-2016-pro-plus-1-510x510.png', 'Office 2016 Pro', 1800000, 900000, 20, 'Microsoft', 1, ' ');
INSERT INTO `product` VALUES (28, 2, 'http://localhost:8080/Project_Web_war/image/product-image/office/outlook-2021-ban-quyen-min-510x510.png', 'Office Outlook 2021', 1200000, 700000, 15, 'Microsoft', 1, ' ');
INSERT INTO `product` VALUES (29, 2, 'http://localhost:8080/Project_Web_war/image/product-image/office/office-2019-hb-ban-quyen-min-510x510.png', 'Office 2019', 2000000, 900000, 12, 'Microsoft', 1, ' ');
INSERT INTO `product` VALUES (30, 2, 'http://localhost:8080/Project_Web_war/image/product-image/office/mua-access-2021-2-1-min-510x510.png', 'Office Access 2021', 1500000, 800000, 5, 'Microsoft', 5, ' ');
INSERT INTO `product` VALUES (35, 3, 'http://localhost:8080/Project_Web_war/image/product-image/antivirus/AVG Internet Security 2018 Windows 1 Year.png', 'AVG Antivirus', 1900000, 900000, 25, 'Antivirus', 1, ' ');
INSERT INTO `product` VALUES (36, 3, 'http://localhost:8080/Project_Web_war/image/product-image/antivirus/AVAST Premier Antivirus 2018.png', 'AVAST Antivirus', 900000, 400000, 50, 'Antivirus', 1, ' ');
INSERT INTO `product` VALUES (37, 3, 'http://localhost:8080/Project_Web_war/image/product-image/antivirus/McAFEE-ANTIVIRUS-PLUS-2017.png', 'McAFEE Antivirus', 1200000, 800000, 20, 'Antivirus', 1, ' ');
INSERT INTO `product` VALUES (38, 3, 'http://localhost:8080/Project_Web_war/image/product-image/antivirus/key-Symantec-Norton-Internet-Security-ban-quyen.png', 'Norton Antivirus', 3000000, 1800000, 10, 'Antivirus', 5, ' ');
INSERT INTO `product` VALUES (39, 3, 'http://localhost:8080/Project_Web_war/image/product-image/antivirus/kaspersky-anti-virus-ban-quyen.png', 'Kaspersky Antivirus', 1700000, 1100000, 40, 'Antivirus', 3, ' ');
INSERT INTO `product` VALUES (40, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe-Animate-2021.png', 'Adobe Animate', 1800000, 1200000, 20, 'Adobe', 3, ' ');
INSERT INTO `product` VALUES (41, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe-Rush.png', 'Adobe ', 1200000, 1000000, 20, 'Adobe Rush', 1, ' ');
INSERT INTO `product` VALUES (42, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe-Spark.png', 'Adobe Spark', 1400000, 1100000, 25, 'Adobe', 1, ' ');
INSERT INTO `product` VALUES (43, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe-Audition-2020.png', 'Adobe Audition', 2000000, 1300000, 5, 'Adobe', 3, ' ');
INSERT INTO `product` VALUES (44, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe-Premiere-Pro-2020.png', 'Adobe Premiere', 2400000, 1600000, 10, 'Adobe', 5, ' ');
INSERT INTO `product` VALUES (45, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe-Acrobat-Pro-DC-2.png', 'Adobe Acrobat', 1200000, 700000, 10, 'Adobe', 1, ' ');
INSERT INTO `product` VALUES (46, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe-Photoshop-2021.png', 'Adobe Photoshop 2021', 1800000, 1200000, 30, 'Adobe', 1, ' ');
INSERT INTO `product` VALUES (47, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe-Lightroom.png', 'Adobe Lightroom', 2500000, 1600000, 10, 'Adobe', 3, ' ');
INSERT INTO `product` VALUES (48, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe-InDesign-2021.png', 'Adobe Indesign', 1400000, 800000, 20, 'Adobe', 1, ' ');
INSERT INTO `product` VALUES (49, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe-After-Effects-2020.png', 'Adobe AfterEffect', 1900000, 1300000, 15, 'Adobe', 1, ' ');
INSERT INTO `product` VALUES (51, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/autodesk-Arnold-1-510x510.png', 'Autodesk Arnold', 1200000, 700000, 25, 'Autodesk', 1, ' ');
INSERT INTO `product` VALUES (52, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/Autodesk-InfraWorks-min-1-510x510.png', 'Autodesk InfraWorks', 1500000, 1100000, 15, 'Autodesk', 1, ' ');
INSERT INTO `product` VALUES (53, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/autodesk-3ds-max-ban-quyen.png', 'Autodesk 3DS', 2000000, 1400000, 15, 'Autodesk', 5, ' ');
INSERT INTO `product` VALUES (54, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/autodesk-civil-3d-ban-quyen.png', 'Autodesk Civil 3D', 1800000, 1000000, 35, 'Autodesk', 3, ' ');
INSERT INTO `product` VALUES (55, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/autodesk-flame-510x510.png', 'Autodesk Flame', 1400000, 900000, 50, 'Autodesk', 1, ' ');
INSERT INTO `product` VALUES (56, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/autodesk-ban-quyen-min-510x510.png', 'Bộ 6 phần mềm Autodesk ', 3000000, 2200000, 10, 'Autodesk', 3, ' ');
INSERT INTO `product` VALUES (57, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/autocad-1-510x510.png', 'Autodesk Autocad ', 2000000, 1300000, 25, 'Autodesk', 5, ' ');
INSERT INTO `product` VALUES (58, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/autodesk-revit-ban-quyen.png', 'Autodesk Revit', 1200000, 900000, 15, 'Autodesk', 1, ' ');
INSERT INTO `product` VALUES (59, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/autodesk-recap-pro-gia-re-510x510.png', 'Autodesk Recap', 1500000, 800000, 30, 'Autodesk', 1, ' ');
INSERT INTO `product` VALUES (60, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/autodesk-maya-ban-quyen.png', 'Autodesk Maya', 900000, 600000, 20, 'Autodesk', 1, ' ');
INSERT INTO `product` VALUES (61, 5, 'http://localhost:8080/Project_Web_war/image/product-image/windows server/windows-server-2012-510x510.png', 'Windows Server 2012', 2000000, 1200000, 10, 'Windows', 1, ' ');
INSERT INTO `product` VALUES (62, 5, 'http://localhost:8080/Project_Web_war/image/product-image/windows server/windows-server-2019-standard-mak-510x510.png', 'Windows Server 2019', 1600000, 1300000, 25, 'Windows', 3, ' ');
INSERT INTO `product` VALUES (63, 5, 'http://localhost:8080/Project_Web_war/image/product-image/windows server/windows-server-2016-datacenter-min-510x510.png', 'Server Datacenter 2016', 2000000, 1500000, 5, 'Windows', 3, ' ');
INSERT INTO `product` VALUES (64, 5, 'http://localhost:8080/Project_Web_war/image/product-image/windows server/windows-server-2016-Essentials-510x510.png', 'Server Essentials 2016', 1200000, 800000, 20, 'Windows', 1, ' ');
INSERT INTO `product` VALUES (65, 5, 'http://localhost:8080/Project_Web_war/image/product-image/windows server/windows-server-2019-datacenter-min-510x510.png', 'Server Datacenter 2019', 1300000, 1000000, 25, 'Windows', 1, ' ');
INSERT INTO `product` VALUES (66, 5, 'http://localhost:8080/Project_Web_war/image/product-image/windows server/windows-server-2019-Essentials-min-510x510.png', 'Server Essentials 2019', 2900000, 2300000, 15, 'Windows', 5, ' ');
INSERT INTO `product` VALUES (67, 5, 'http://localhost:8080/Project_Web_war/image/product-image/windows server/window-server-2012-rds-50-device-connections-510x510.png', 'Server Remote 2012', 2500000, 1900000, 10, 'Windows', 5, ' ');
INSERT INTO `product` VALUES (68, 5, 'http://localhost:8080/Project_Web_war/image/product-image/windows server/windows-server-2019-rds-50-user-connections-2-510x510.png', 'Server Remote 2019', 1700000, 1500000, 30, 'Windows', 1, ' ');
INSERT INTO `product` VALUES (69, 5, 'http://localhost:8080/Project_Web_war/image/product-image/windows server/windows-servewr-2022-rds-user-connections-510x510.png', 'Server Remote 2022', 2000000, 1400000, 15, 'Windows', 1, ' ');
INSERT INTO `product` VALUES (70, 5, 'http://localhost:8080/Project_Web_war/image/product-image/windows server/windows-server-2022-datacenter-510x510.png', 'Server Datacenter 2022', 1600000, 1100000, 40, 'Windows', 1, ' ');
INSERT INTO `product` VALUES (81, 3, 'http://localhost:8080/Project_Web_war/image/product-image/antivirus/5819_bkav_pro_internet_security_1.png', 'BKAV PRO Antivirus', 1500000, 1200000, 20, 'Antivirus', 1, ' ');
INSERT INTO `product` VALUES (82, 3, 'http://localhost:8080/Project_Web_war/image/product-image/antivirus/PandaDome.png', 'PandaDome Antivirus', 2000000, 1600000, 10, 'Antivirus', 3, ' ');
INSERT INTO `product` VALUES (83, 3, 'http://localhost:8080/Project_Web_war/image/product-image/antivirus/Norton360forGamers.png', 'Norton 360 Antivirus', 1900000, 900000, 25, 'Antivirus', 5, ' ');
INSERT INTO `product` VALUES (84, 3, 'http://localhost:8080/Project_Web_war/image/product-image/antivirus/EsetInternetSecurityGlobalLicense.png', 'ESET Antivirus', 800000, 600000, 30, 'Antivirus', 1, ' ');
INSERT INTO `product` VALUES (90, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe-Illustrator-2021.png', 'Adobe Illustrator', 1800000, 1000000, 50, 'Adobe', 1, ' ');
INSERT INTO `product` VALUES (91, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe_Fuse.png', 'Adobe Fuse', 2000000, 1200000, 20, 'Adobe', 3, ' ');
INSERT INTO `product` VALUES (92, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe_Fresco_CC_icon.png', 'Adobe Fresco', 1000000, 700000, 10, 'Adobe', 1, ' ');
INSERT INTO `product` VALUES (93, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe-XD.png', 'Adobe XD', 1600000, 1100000, 70, 'Adobe', 1, ' ');
INSERT INTO `product` VALUES (94, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe-Dreamweaver-2021.png', 'Adobe Dreamweaver', 2200000, 1700000, 30, 'Adobe', 5, ' ');
INSERT INTO `product` VALUES (95, 4, 'http://localhost:8080/Project_Web_war/image/product-image/design/adobe/Adobe-Bridge-2021.png', 'Adobe Bridge', 800000, 600000, 80, 'Adobe', 1, ' ');

-- ----------------------------
-- Table structure for productcomment
-- ----------------------------
DROP TABLE IF EXISTS `productcomment`;
CREATE TABLE `productcomment`  (
  `cmid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `cmdate` date NULL DEFAULT NULL,
  `cmdescription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`cmid`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `productcomment_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productcomment_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productcomment
-- ----------------------------
INSERT INTO `productcomment` VALUES (1, 4, 7, '2023-01-08', 'Sản phẩm này quá tuyệt vời');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_phone` int(11) NOT NULL,
  `user_createdAt` date NULL DEFAULT NULL,
  `isAdmin` int(11) NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '20130260@st.hcmuaf.edu.vn', '123456', ' Hiếu', 852995378, '2022-12-03', 1);
INSERT INTO `user` VALUES (7, 'hoanghieu0098@gmail.com', '123456', 'Trung Hiếu', 852995378, '2023-01-08', 1);
INSERT INTO `user` VALUES (12, 'hthclone01@gmail.com', '123456', ' Hoàng Trung Hiếu', 852995378, '2023-01-10', 0);

SET FOREIGN_KEY_CHECKS = 1;
