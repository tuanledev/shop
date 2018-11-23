-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.34-MariaDB-0ubuntu0.18.04.1 - Ubuntu 18.04
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table shop.mn_action
CREATE TABLE IF NOT EXISTS `mn_action` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table shop.mn_action: ~0 rows (approximately)
DELETE FROM `mn_action`;
/*!40000 ALTER TABLE `mn_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `mn_action` ENABLE KEYS */;

-- Dumping structure for table shop.mn_category
CREATE TABLE IF NOT EXISTS `mn_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_vn` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description_en` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `alias_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.mn_category: ~2 rows (approximately)
DELETE FROM `mn_category`;
/*!40000 ALTER TABLE `mn_category` DISABLE KEYS */;
INSERT INTO `mn_category` (`id`, `title_vn`, `title_en`, `description_vn`, `description_en`, `images`, `parent_id`, `sort`, `alias_vn`, `alias_en`, `meta_keyword`, `meta_description`) VALUES
	(120, 'Sacha inchi', 'Sacha inchi', '', '', 'sacha-inchi-1542958420.png', 0, 0, 'sacha-inchi', 'sacha-inchi', '', ''),
	(121, 'trang chủ as ú ú à à', 'homea dasd á ', '', '', 'trang-chu-as-u-u-a-a-1542959418.png', 0, 1, 'trang-chu-as-u-u-a-a', 'homea-dasd-a', '', '');
/*!40000 ALTER TABLE `mn_category` ENABLE KEYS */;

-- Dumping structure for table shop.mn_catenews
CREATE TABLE IF NOT EXISTS `mn_catenews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer` int(11) NOT NULL,
  `description_vn` longtext COLLATE utf8_unicode_ci,
  `description_en` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shop.mn_catenews: 1 rows
DELETE FROM `mn_catenews`;
/*!40000 ALTER TABLE `mn_catenews` DISABLE KEYS */;
INSERT INTO `mn_catenews` (`id`, `title_vn`, `title_en`, `parent_id`, `sort`, `tag`, `images`, `meta_keyword`, `meta_description`, `alias_vn`, `alias_en`, `footer`, `description_vn`, `description_en`) VALUES
	(34, '123', '456', 0, 2, '', '123-1542967019.png', '', '', '123', '456', 0, '', '');
/*!40000 ALTER TABLE `mn_catenews` ENABLE KEYS */;

-- Dumping structure for table shop.mn_cate_images
CREATE TABLE IF NOT EXISTS `mn_cate_images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_vn` text COLLATE utf8_unicode_ci NOT NULL,
  `description_en` text COLLATE utf8_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `ticlock` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home` tinyint(1) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `style` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adv` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shop.mn_cate_images: 10 rows
DELETE FROM `mn_cate_images`;
/*!40000 ALTER TABLE `mn_cate_images` DISABLE KEYS */;
INSERT INTO `mn_cate_images` (`Id`, `title_vn`, `title_en`, `description_vn`, `description_en`, `images`, `parentid`, `sort`, `ticlock`, `alias`, `meta_keyword`, `meta_description`, `home`, `link`, `style`, `title`, `icon`, `link1`, `adv`) VALUES
	(7, 'Living Pool', 'Living Pool', '', '', 'living-pool-jrn.jpg', 0, 2, '0', 'living-pool', '', '', NULL, '', NULL, '', '', NULL, NULL),
	(6, 'Natural Pool', 'Natural Pool', '', '', 'natural-pool-5c4.jpg', 0, 1, '0', 'natural-pool', 'ho boi, be boi, xay dung ho boi', 'ho boi, be boi, xay dung ho boi', NULL, '', NULL, 'naturalpool', '', NULL, NULL),
	(8, 'album 1', 'album 1', '', '', 'album-1-hfk.jpg', 6, 1, '0', 'album-1', 'ho boi, be boi', 'ho boi, be boi', NULL, '', NULL, 'Bio-NaturalPools', '', NULL, NULL),
	(9, 'album 2', 'album 2', '', '', 'album-2-r1w.jpg', 6, 2, '0', 'album-2', 'ho boi, be boi', 'ho boi, be boi', NULL, '', NULL, 'Bio-NaturalPools', '', NULL, NULL),
	(10, 'album 3', 'album 3', '', '', 'album-3-esk.jpg', 6, 3, '0', 'album-3', 'HO BOI, BE BOI', 'ho boi, be boi', NULL, '', NULL, 'Bio-NaturalPools', '', NULL, NULL),
	(11, 'album 4', 'album 4', '', '', 'album-4-q78.jpg', 6, 4, '0', 'album-4', 'ho boi, xay dug ho boi, thiet bi ho boi', 'ho boi, xay dug ho boi, thiet bi ho boi', NULL, '', NULL, 'Bio-NaturalPools', '', NULL, NULL),
	(13, 'Living Pool', 'living pool', '', '', 'living-pool-l6q.jpg', 7, 0, '0', 'living-pool', '', '', NULL, '', NULL, '', '', NULL, NULL),
	(14, 'Mẩu vật liệu hoàn thiện hồ bơi', 'finishing material', '', '', 'mau-vat-lieu-hoan-thien-ho-boi-enc.jpg', 13, 0, '0', 'vat-lieu-hoan-thien-ho-boi', 'ho boi, xay dung ho boi, xay dung ho boi, thiet bi ho boi', 'Vật liệu hoàn thiện hồ bơi', NULL, '', NULL, 'vat lieu hoan thien ho boi', '', NULL, NULL),
	(15, 'Landscape', 'Landscape', '', '', 'landscape-tls.jpg', 7, 0, '0', 'canh-quan', '', '', NULL, '', NULL, '', '', NULL, NULL),
	(18, 'Tiểu Cảnh Sân Vườn', 'Landscape', '', '', 'tieu-canh-san-vuon-cjc.jpg', 7, 1, '0', 'tieu-canh-san-vuon', '', '', NULL, '', NULL, '', '', NULL, NULL);
/*!40000 ALTER TABLE `mn_cate_images` ENABLE KEYS */;

-- Dumping structure for table shop.mn_catvideos
CREATE TABLE IF NOT EXISTS `mn_catvideos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_vn` text COLLATE utf8_unicode_ci NOT NULL,
  `description_en` text COLLATE utf8_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `ticlock` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home` tinyint(1) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `style` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adv` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shop.mn_catvideos: 1 rows
DELETE FROM `mn_catvideos`;
/*!40000 ALTER TABLE `mn_catvideos` DISABLE KEYS */;
INSERT INTO `mn_catvideos` (`Id`, `title_vn`, `title_en`, `description_vn`, `description_en`, `images`, `parentid`, `sort`, `ticlock`, `alias`, `meta_keyword`, `meta_description`, `home`, `link`, `style`, `title`, `icon`, `link1`, `adv`) VALUES
	(1, 'Hồ bơi', '', '', '', '', 0, 0, '0', 'ho-boi', '', '', NULL, '', NULL, '', '', NULL, NULL);
/*!40000 ALTER TABLE `mn_catvideos` ENABLE KEYS */;

-- Dumping structure for table shop.mn_catworks
CREATE TABLE IF NOT EXISTS `mn_catworks` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_vn` text COLLATE utf8_unicode_ci NOT NULL,
  `description_en` text COLLATE utf8_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `ticlock` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home` tinyint(1) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `style` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adv` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shop.mn_catworks: 0 rows
DELETE FROM `mn_catworks`;
/*!40000 ALTER TABLE `mn_catworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mn_catworks` ENABLE KEYS */;

-- Dumping structure for table shop.mn_comment
CREATE TABLE IF NOT EXISTS `mn_comment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) DEFAULT NULL,
  `content_vn` text,
  `date` int(11) DEFAULT NULL,
  `hoten` varchar(255) DEFAULT NULL,
  `congviec` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ticlock` tinyint(4) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.mn_comment: 5 rows
DELETE FROM `mn_comment`;
/*!40000 ALTER TABLE `mn_comment` DISABLE KEYS */;
INSERT INTO `mn_comment` (`Id`, `iduser`, `content_vn`, `date`, `hoten`, `congviec`, `images`, `email`, `ticlock`, `rating`) VALUES
	(49, NULL, '<p>Việc bố tr&iacute; từ tầng 1 l&ecirc;n tầng 5 nh&agrave; t&ocirc;i mới mua như thế n&agrave;o cho hợp l&yacute; khiến t&ocirc;i thật sự lung t&uacute;ng. PhanrangDesign&nbsp; qu&aacute; chuy&ecirc;n nghiệp từ khi t&ocirc;i gặp gỡ v&agrave; triển khai ho&agrave;n thiện họ đ&atilde; cho t&ocirc;i th&acirc;y một g&oacute;c nh&igrave;n đẹp v&agrave; độc, cảm ơn !</p>\r\n', 1451705384, 'Vũ Thu Huyền', 'Ngân Hàng', '1509958763.jpg', 'thuhuyen92@gmail.com', 0, NULL),
	(50, NULL, '<p>Việc bố tr&iacute; từ tầng 1 l&ecirc;n tầng 5 nh&agrave; t&ocirc;i mới mua như thế n&agrave;o cho hợp l&yacute; khiến t&ocirc;i thật sự lung t&uacute;ng. PhanrangDesign&nbsp; qu&aacute; chuy&ecirc;n nghiệp từ khi t&ocirc;i gặp gỡ v&agrave; triển khai ho&agrave;n thiện họ đ&atilde; cho t&ocirc;i th&acirc;y một g&oacute;c nh&igrave;n đẹp v&agrave; độc, cảm ơn !</p>\r\n', 1451874371, 'nguyễn Bình An', 'Kỹ Sư', '1509958755.jpg', 'binhan@yahoo.com', 0, NULL),
	(51, NULL, '<p>Việc bố tr&iacute; từ tầng 1 l&ecirc;n tầng 5 nh&agrave; t&ocirc;i mới mua như thế n&agrave;o cho hợp l&yacute; khiến t&ocirc;i thật sự lung t&uacute;ng. PhanrangDesign&nbsp; qu&aacute; chuy&ecirc;n nghiệp từ khi t&ocirc;i gặp gỡ v&agrave; triển khai ho&agrave;n thiện họ đ&atilde; cho t&ocirc;i th&acirc;y một g&oacute;c nh&igrave;n đẹp v&agrave; độc, cảm ơn !</p>\r\n', 1451874371, 'Nguyễn Thái Hà', 'Giáo Viên', '1509958746.jpg', 'thaiha@gmail.com', 0, NULL),
	(55, NULL, '<p>Việc bố tr&iacute; từ tầng 1 l&ecirc;n tầng 5 nh&agrave; t&ocirc;i mới mua như thế n&agrave;o cho hợp l&yacute; khiến t&ocirc;i thật sự lung t&uacute;ng. PhanrangDesign&nbsp; qu&aacute; chuy&ecirc;n nghiệp từ khi t&ocirc;i gặp gỡ v&agrave; triển khai ho&agrave;n thiện họ đ&atilde; cho t&ocirc;i th&acirc;y một g&oacute;c nh&igrave;n đẹp v&agrave; độc, cảm ơn !</p>\r\n', NULL, 'Trần Công Danh', 'Kinh Doanh', '1509958454.jpg', 'trancongdanh.1889@gmail.com', 0, NULL),
	(56, NULL, '<p>Việc bố tr&iacute; từ tầng 1 l&ecirc;n tầng 5 nh&agrave; t&ocirc;i mới mua như thế n&agrave;o cho hợp l&yacute; khiến t&ocirc;i thật sự lung t&uacute;ng. PhanrangDesign&nbsp; qu&aacute; chuy&ecirc;n nghiệp từ khi t&ocirc;i gặp gỡ v&agrave; triển khai ho&agrave;n thiện họ đ&atilde; cho t&ocirc;i th&acirc;y một g&oacute;c nh&igrave;n đẹp v&agrave; độc, cảm ơn !</p>\r\n', NULL, 'Nguyễn Minh Hoàng', 'Văn phòng', '1509958639.jpg', 'hoangminh.87@gmail.com', 0, NULL);
/*!40000 ALTER TABLE `mn_comment` ENABLE KEYS */;

-- Dumping structure for table shop.mn_contacts
CREATE TABLE IF NOT EXISTS `mn_contacts` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `deliveryaddress` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `methodpay` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `view` tinyint(1) NOT NULL DEFAULT '0',
  `idUser` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `tongdonhang` int(11) DEFAULT NULL,
  `tongthanhtoan` int(11) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `idgroup` int(11) NOT NULL DEFAULT '0',
  `district` int(11) DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `thunhap` int(11) DEFAULT NULL,
  `ship` int(11) DEFAULT NULL,
  `idprovinces` int(11) DEFAULT NULL,
  `iddistrict` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `numberbank` int(11) DEFAULT NULL,
  `goilai` varchar(155) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

-- Dumping data for table shop.mn_contacts: 0 rows
DELETE FROM `mn_contacts`;
/*!40000 ALTER TABLE `mn_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mn_contacts` ENABLE KEYS */;

-- Dumping structure for table shop.mn_customer
CREATE TABLE IF NOT EXISTS `mn_customer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `deliveryaddress` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `methodpay` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `date` date DEFAULT NULL,
  `view` tinyint(1) NOT NULL DEFAULT '0',
  `idUser` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `tongdonhang` int(11) DEFAULT NULL,
  `tongthanhtoan` int(11) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `idgroup` int(11) NOT NULL DEFAULT '0',
  `district` int(11) DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `thunhap` int(11) DEFAULT NULL,
  `ship` int(11) DEFAULT NULL,
  `idprovinces` int(11) DEFAULT NULL,
  `iddistrict` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `numberbank` int(11) DEFAULT NULL,
  `goilai` varchar(155) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

-- Dumping data for table shop.mn_customer: 1 rows
DELETE FROM `mn_customer`;
/*!40000 ALTER TABLE `mn_customer` DISABLE KEYS */;
INSERT INTO `mn_customer` (`Id`, `fullname`, `address`, `deliveryaddress`, `email`, `tel`, `fax`, `methodpay`, `note`, `date`, `view`, `idUser`, `status`, `tongdonhang`, `tongthanhtoan`, `soluong`, `idgroup`, `district`, `code`, `create_time`, `IP`, `zipcode`, `thunhap`, `ship`, `idprovinces`, `iddistrict`, `bank`, `numberbank`, `goilai`) VALUES
	(1, 'thanh', 'phan van hon', 'phan van hon', 'codeweb247@gmail.com', '0123456789', NULL, 'Giao hàng thu tiền tận nơi', 'test', '2017-11-21', 1, NULL, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `mn_customer` ENABLE KEYS */;

-- Dumping structure for table shop.mn_customer_cart
CREATE TABLE IF NOT EXISTS `mn_customer_cart` (
  `idcustomer` int(11) NOT NULL,
  `idpro` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcustomer`,`idpro`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table shop.mn_customer_cart: 1 rows
DELETE FROM `mn_customer_cart`;
/*!40000 ALTER TABLE `mn_customer_cart` DISABLE KEYS */;
INSERT INTO `mn_customer_cart` (`idcustomer`, `idpro`, `amount`, `price`) VALUES
	(1, 116, 8, NULL);
/*!40000 ALTER TABLE `mn_customer_cart` ENABLE KEYS */;

-- Dumping structure for table shop.mn_email
CREATE TABLE IF NOT EXISTS `mn_email` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shop.mn_email: 1 rows
DELETE FROM `mn_email`;
/*!40000 ALTER TABLE `mn_email` DISABLE KEYS */;
INSERT INTO `mn_email` (`Id`, `email`, `date`) VALUES
	(14, 'beolyby@gmail.com', '30-10-2017');
/*!40000 ALTER TABLE `mn_email` ENABLE KEYS */;

-- Dumping structure for table shop.mn_flash
CREATE TABLE IF NOT EXISTS `mn_flash` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `file_vn` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `file_en` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `title_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `width` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `height` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `style` tinyint(1) NOT NULL,
  `ticlock` tinyint(4) DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shop.mn_flash: 20 rows
DELETE FROM `mn_flash`;
/*!40000 ALTER TABLE `mn_flash` DISABLE KEYS */;
INSERT INTO `mn_flash` (`Id`, `location`, `file_vn`, `file_en`, `title_vn`, `title_en`, `link`, `width`, `height`, `sort`, `style`, `ticlock`, `color`, `video`) VALUES
	(1, '2', 'AFnLD1528708954.jpg', '', '', '', '', '', '', 0, 0, 0, '', ''),
	(41, '3', 'MRHgv1530699340.jpg', '', 'VĂN PHÒNG CTY BP SOLAR - SỐ 05 NGÔ GIA TỰ, PHAN RANG', '', 'http://phanrangdesign.com/bai-viet/van-phong-cty-bp-solar-so-05-ngo-gia-tu-phan-rang.html', '', '', 0, 0, 0, '', ''),
	(3, '9', 'vkUVa1528507270.jpg', '', '', '', '', '', '', 0, 0, 0, '', ''),
	(23, '5', 'I0TXQ1529467463.png', '', '', '', '', '', '', 0, 0, 0, '', ''),
	(24, '5', 'VqY781529467504.png', '', '', '', '', '', '', 0, 0, 0, '', ''),
	(38, '3', 'xJQUi1530672211.jpg', '', 'COZY HOUSE MILKTEA & COFFEE SHOP - KHU K1 - PHAN RANG', '', 'http://phanrangdesign.com/bai-viet/cozy-house-milktea-coffee-shop-khu-k1-phan-rang.html', '', '', 0, 0, 0, '', ''),
	(47, '3', 'fe7tT1533568364.jpg', '', 'TRÀ SỮA SANTORINI - 250 NGÔ GIA TỰ, PHAN RANG', '', 'http://phanrangdesign.com/bai-viet/tra-sua-santorini-250-ngo-gia-tu-phan-rang.html', '', '', 1, 0, 0, '', ''),
	(22, '8', '6CZXU1529572531.jpg', '', '', '', '', '', '', 0, 0, 0, '', ''),
	(42, '3', 'R20CH1534167296.jpg', '', 'VP CTY MINATO STEEL VN - TẦNG 4 - TÒA NHÀ VIETTEL 21.08, PHAN RANG', '', 'http://phanrangdesign.com/bai-viet/vp-cty-minato-steel-vn-tang-4-toa-nha-viettel-2108-phan-rang.html', '', '', 0, 0, 0, '', ''),
	(43, '3', 'Z82Sa1530699356.jpg', '', 'VĂN PHÒNG CTY BP SOLAR - SỐ 05 NGÔ GIA TỰ, PHAN RANG', '', 'VĂN PHÒNG CTY BP SOLAR - SỐ 05 NGÔ GIA TỰ, PHAN RANG', '', '', 0, 0, 0, '', ''),
	(44, '3', 'Q2L3x1534167365.jpg', '', 'VP CTY MINATO STEEL VN - TẦNG 4 - TÒA NHÀ VIETTEL 21.08, PHAN RANG', '', 'http://phanrangdesign.com/bai-viet/vp-cty-minato-steel-vn-tang-4-toa-nha-viettel-2108-phan-rang.html', '', '', 0, 0, 0, '', ''),
	(45, '3', 'fvBfG1530699382.jpg', '', 'VĂN PHÒNG CTY BP SOLAR - SỐ 05 NGÔ GIA TỰ, PHAN RANG', '', 'http://phanrangdesign.com/bai-viet/van-phong-cty-bp-solar-so-05-ngo-gia-tu-phan-rang.html', '', '', 0, 0, 0, '', ''),
	(46, '3', 'kSO5d1533566502.jpg', '', 'CN VĂN PHÒNG PHAN RANG DESIGN - 82 QUANG TRUNG', '', 'http://phanrangdesign.com/bai-viet/cn-van-phong-phan-rang-design-82-quang-trung.html', '', '', 0, 0, 0, '', ''),
	(48, '3', 'LhDCm1534167437.jpg', '', 'A HẢI - NỘI THẤT NHÀ PHỐ HIỆN ĐẠI - PHONG CHÂU - PHƯỚC HẢI', '', 'http://phanrangdesign.com/bai-viet/a-hai-noi-that-nha-pho-hien-dai-phong-chau-phuoc-hai.html', '', '', 0, 0, 0, '', ''),
	(50, '3', 'Gz9fx1536163431.jpg', '', 'TRÀ SỮA DOREAMON - 250 NGÔ GIA TỰ, PHAN RANG', '', 'http://phanrangdesign.com/bai-viet/tra-sua-doreamon-250-ngo-gia-tu-phan-rang.html', '', '', 0, 0, 0, '', ''),
	(51, '3', 'Wl9Ic1536163425.jpg', '', 'Sàn gỗ ATWood', '', 'http://phanrangdesign.com/bai-viet/san-go-atwood.html', '', '', 0, 0, 0, '', ''),
	(52, '3', 'pPkMM1536851702.jpg', '', 'Tranh sơn dầu đẹp.', '', 'http://phanrangdesign.com/tranh-son-dau.html', '', '', 0, 0, 0, '', ''),
	(53, '3', 'E6Piu1537458810.jpg', '', 'QUÁN ĂN GIA ĐÌNH - GRANNY VÕ, địa chỉ: số 60/10 Tô Hiệu, Phan Rang', '', 'http://phanrangdesign.com/bai-viet/quan-an-gia-dinh-granny-vo.html', '', '', 0, 0, 0, '', ''),
	(54, '3', 'f0ElW1537458963.jpg', '', 'Hoàn Mỹ Spa, đường Hoàng Diệu, Khu K1, Phan Rang', '', 'http://phanrangdesign.com/bai-viet/hoan-my-spa-duong-hoang-dieu-khu-k1-phan-rang.html', '', '', 0, 0, 0, '', ''),
	(55, '3', '70Cdi1537458938.jpg', '', 'Tuyết Nhung Shop  - số 02 Hoàng Diệu - khu K1, Phan Rang', '', 'http://phanrangdesign.com/bai-viet/tuyet-nhung-shop.html', '', '', 0, 0, 0, '', '');
/*!40000 ALTER TABLE `mn_flash` ENABLE KEYS */;

-- Dumping structure for table shop.mn_images
CREATE TABLE IF NOT EXISTS `mn_images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `images` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `ticlock` tinyint(4) NOT NULL DEFAULT '0',
  `idcat` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- Dumping data for table shop.mn_images: ~90 rows (approximately)
DELETE FROM `mn_images`;
/*!40000 ALTER TABLE `mn_images` DISABLE KEYS */;
INSERT INTO `mn_images` (`Id`, `images`, `ticlock`, `idcat`, `type`, `sort`) VALUES
	(28, 'fg17mnfcvjoih0tj19vw.jpg', 0, 8, NULL, 2),
	(29, 'qxy3avwtareoxbbsbvqg.jpg', 0, 8, NULL, 3),
	(30, 'iggcqzz1nzdg2bfrctp8.jpg', 0, 8, NULL, 4),
	(31, 'nq9snpnp6rj6r8f7qzbm.jpg', 0, 8, NULL, 1),
	(32, 'qbr7kwdadtpgafoafgki.jpg', 0, 9, NULL, 1),
	(33, 'qnun6htldjlca0q1lqid.jpg', 0, 9, NULL, 2),
	(34, 'zpkluxawwf7snys6jthe.jpg', 0, 9, NULL, 3),
	(36, 'oewadqzwyatp4n9jsxcd.jpg', 0, 9, NULL, 4),
	(37, 'eiiukjjcti6tmd8iy0bi.jpg', 0, 9, NULL, 0),
	(38, '7eie1z6d4wspm5z2hskx.jpg', 0, 9, NULL, 0),
	(39, 'j5vbmikixpxfjaowmkty.jpg', 0, 8, NULL, 0),
	(40, 'xnvsb1guxzaphmlhjxg1.jpg', 0, 10, NULL, 0),
	(41, 'ldunmlpzbxmezpvfjw36.jpeg', 0, 10, NULL, 0),
	(42, 'slxezsmsenhhevjdjovh.jpg', 0, 10, NULL, 0),
	(43, 'jvlmfoy4lmxbv3fm0nmr.jpg', 0, 10, NULL, 0),
	(44, 'qjzn5psnix6ocnmxrjyi.jpg', 0, 10, NULL, 0),
	(45, 'h1rqztvuv00b3jihpfqa.jpg', 0, 10, NULL, 0),
	(46, 'xcrtejjw8jvodufui3jz.jpg', 0, 10, NULL, 0),
	(47, 'yac7jxx8zd1tyvsqyqcw.jpg', 0, 10, NULL, 0),
	(48, 'rctmlwolape8lxmh6l5o.jpg', 0, 10, NULL, 0),
	(49, 'paowplihhdthj6bovm8h.jpg', 0, 10, NULL, 0),
	(50, '6utx5ypvtrzohrgkifzz.jpg', 0, 10, NULL, 0),
	(51, 'bibpegff5iskz1gradhg.jpg', 0, 10, NULL, 0),
	(53, '1exjequh97hnmexa73c2.jpg', 0, 10, NULL, 0),
	(54, '5rfuvr8bewu6fccanhl2.jpg', 0, 11, NULL, 0),
	(55, '8e8264irwkqt9hnjczva.jpg', 0, 11, NULL, 0),
	(56, '49jx28dc0kgatlmq27l4.jpg', 0, 11, NULL, 0),
	(57, 'bmibglxbos7j8cuhmp44.jpg', 0, 11, NULL, 0),
	(58, '6jnaxjco1lx4k3xcca2t.jpg', 0, 11, NULL, 0),
	(59, 'yfwntwiczo56yivm8ly8.jpg', 0, 12, NULL, 0),
	(60, 'e93bxrpyvlqbyt0peibd.jpg', 0, 12, NULL, 0),
	(61, '2kavysy26tfe5iwffdod.jpg', 0, 12, NULL, 0),
	(62, 'kdx30iazzkphbblbdt5q.jpg', 0, 12, NULL, 0),
	(63, 'x40zg2zktzc62zissbr2.jpg', 0, 12, NULL, 0),
	(64, 'cnnjxrzzoassb1oe23b8.jpg', 0, 12, NULL, 0),
	(65, 'tqoqzcvvhclisdnvncjd.jpg', 0, 12, NULL, 0),
	(66, 'acq5dlrn2yq0hliwut5k.jpg', 0, 12, NULL, 0),
	(67, 'yi9odnoy8kicihqyluon.jpg', 0, 12, NULL, 0),
	(68, 'h7v2dvrbqwl7eykb11hp.jpg', 0, 12, NULL, 0),
	(69, 'dxntwjoxrgwupjfik9p1.jpg', 0, 12, NULL, 0),
	(70, '6fyhtefz0qwcpgpmbbeh.jpg', 0, 12, NULL, 0),
	(71, 'qdsdlw219hs2hyqtseqd.jpg', 0, 12, NULL, 0),
	(72, 'pik8wcputf0s8mt7gh9l.jpg', 0, 12, NULL, 0),
	(73, '5gzvjxbvwaqbqwqfyogy.jpg', 0, 13, NULL, 0),
	(74, 'pzw9mpeenc0uxzxvdwrq.jpg', 0, 13, NULL, 0),
	(75, 'fqh8fs3gmq71xfssuvfr.jpg', 0, 14, NULL, 0),
	(76, '9ji58wzbqw8pqqumxwzv.jpg', 0, 14, NULL, 0),
	(77, '0fafcvrxvdhj3rnzfttw.jpg', 0, 14, NULL, 0),
	(78, 'xfqfbvsltxfdh6lxrrky.jpg', 0, 14, NULL, 0),
	(79, 'qwdg5vgzefbillu1jksu.jpg', 0, 14, NULL, 0),
	(80, '5elm3kxdyb74ouxn0bcg.jpg', 0, 14, NULL, 0),
	(81, '2ahk3rgau7jq7ihvpoed.jpg', 0, 14, NULL, 0),
	(82, 's7dimykwjzh8zvqnyzzi.jpg', 0, 14, NULL, 0),
	(83, 'tbpknim9qkpvekgo2jxl.jpg', 0, 14, NULL, 0),
	(84, '6a0idnhlccn22we49ide.jpg', 0, 14, NULL, 0),
	(85, 'e7skm3pjlks31iq6zrn7.jpg', 0, 14, NULL, 0),
	(86, 'p2k6gp2aqxavml3qmbbg.jpg', 0, 14, NULL, 0),
	(87, 'hq7jusra7bmazossawtp.jpg', 0, 14, NULL, 0),
	(88, 'fbh5wuxf8eiufkozloxv.jpg', 0, 14, NULL, 0),
	(89, 'bokmweplwgf9uosmfcvx.jpg', 0, 14, NULL, 0),
	(90, 'vd9jmzg3ktp7wtrub3h9.jpg', 0, 14, NULL, 0),
	(91, 'l2mfgjtcvycuoh9hooqx.jpg', 0, 14, NULL, 0),
	(92, 'w0cbf1lookzdhrhue8mz.jpg', 0, 14, NULL, 0),
	(93, 'yborzkfizmejsl9owghj.jpg', 0, 14, NULL, 0),
	(94, 'py0digolfs83ifuna1n8.jpg', 0, 14, NULL, 0),
	(95, '8pjeif7wuauh9t87l0vu.jpg', 0, 14, NULL, 0),
	(96, 'p6zvdzcitwng5kcccx8f.jpg', 0, 14, NULL, 0),
	(97, 'tx92seizi4wtqrz02wxi.jpg', 0, 14, NULL, 0),
	(98, '3quqa5tngfqpe2s0rupx.jpg', 0, 14, NULL, 0),
	(99, 'ukkmo6roa7csags3yw5c.jpg', 0, 14, NULL, 0),
	(100, 'na9tv8wyaj5nk9lslkaw.jpg', 0, 14, NULL, 0),
	(101, 'vbqaox9m6jopvl0tp52p.jpg', 0, 14, NULL, 0),
	(102, 'ftw8058ofdf0leo1qmwu.jpg', 0, 14, NULL, 0),
	(103, 'utfmpx3vthdgrq5mafpu.jpg', 0, 14, NULL, 0),
	(104, 'whvhl56c1bctqmw1hopy.jpg', 0, 14, NULL, 0),
	(105, 'kxecznxwm8tkffyvzojc.jpg', 0, 14, NULL, 0),
	(106, 'pipfl22gp8zdfqgwbzra.jpg', 0, 14, NULL, 0),
	(107, 'gvnryo6s3utn7rwxw5jy.jpg', 0, 14, NULL, 0),
	(108, 'usnbpk6ukngrlvp32ylw.jpg', 0, 14, NULL, 0),
	(109, 'nw9gptffkgtyjrbvnixa.jpg', 0, 14, NULL, 0),
	(110, '7ofwbjmci7hlaftvqpn0.jpg', 0, 14, NULL, 0),
	(111, 'fdeusdcbtnvsfavx7en4.jpg', 0, 14, NULL, 0),
	(112, 'qfiuqkjdr0ypnfbhqdzp.jpg', 0, 14, NULL, 0),
	(113, 'tmmrelbdi4drwgncnzko.jpg', 0, 14, NULL, 0),
	(114, 'ndlou9jlmvhhuul6jjy5.jpg', 0, 14, NULL, 0),
	(115, 'kvogm6wzjvn2askye9pn.jpg', 0, 14, NULL, 0),
	(116, 'pqggvpxpl9nfern9da7w.jpg', 0, 14, NULL, 0),
	(117, 'neqkcktli516l2cmmpwo.jpg', 0, 14, NULL, 0),
	(118, 'v3zlj8s8nji3kmstinal.jpg', 0, 14, NULL, 0),
	(119, 'rf03ktb8lycncdfntcgz.jpg', 0, 14, NULL, 0);
/*!40000 ALTER TABLE `mn_images` ENABLE KEYS */;

-- Dumping structure for table shop.mn_manufacturer
CREATE TABLE IF NOT EXISTS `mn_manufacturer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ticlock` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `parentid` int(11) NOT NULL,
  `description_vn` text CHARACTER SET utf8,
  `titlepage` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8,
  `meta_keyword` text CHARACTER SET utf8,
  `images` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shop.mn_manufacturer: 5 rows
DELETE FROM `mn_manufacturer`;
/*!40000 ALTER TABLE `mn_manufacturer` DISABLE KEYS */;
INSERT INTO `mn_manufacturer` (`Id`, `title_vn`, `title_en`, `ticlock`, `parentid`, `description_vn`, `titlepage`, `meta_description`, `meta_keyword`, `images`, `sort`, `alias`) VALUES
	(1, 'Nội thất Hòa Phát', NULL, '0', 0, '', '', '', '', 'noi-that-hoa-phat.jpg', 10, 'noi-that-hoa-phat'),
	(3, 'Nội Thất 256', NULL, '0', 0, '', '', '', '', 'noi-that-256.png', 10, 'noi-that-256'),
	(4, 'Fami', NULL, '0', 0, '', '', '', '', 'fami.jpg', 10, 'fami'),
	(5, 'The City', NULL, '0', 0, '', '', '', '', 'the-city.jpg', 10, 'the-city'),
	(6, 'D\'Furni', NULL, '0', 0, 'DFURNI&nbsp;l&agrave; nh&atilde;n h&agrave;ng nội thất mang phong c&aacute;ch giải tr&iacute;, với c&aacute;c d&ograve;ng nội thất ph&ograve;ng kh&aacute;ch, ph&ograve;ng ăn, nội thất bar, nội thất cafe sang trọng. V&agrave; Si&ecirc;u Thị Nội Thất 256 l&agrave; đại l&yacute; ph&acirc;n phối Cấp 1 tại Tp.Hồ Ch&iacute; Minh.', '', '', '', 'dfurni.png', 10, 'dfurni');
/*!40000 ALTER TABLE `mn_manufacturer` ENABLE KEYS */;

-- Dumping structure for table shop.mn_menu
CREATE TABLE IF NOT EXISTS `mn_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_vn` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_en` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `cate_product_id` int(11) NOT NULL DEFAULT '0',
  `cate_news_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_vn` (`title_vn`),
  UNIQUE KEY `title_en` (`title_en`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table shop.mn_menu: ~4 rows (approximately)
DELETE FROM `mn_menu`;
/*!40000 ALTER TABLE `mn_menu` DISABLE KEYS */;
INSERT INTO `mn_menu` (`id`, `title_vn`, `title_en`, `alias_vn`, `alias_en`, `sort`, `active`, `parent_id`, `cate_product_id`, `cate_news_id`) VALUES
	(58, 'Trang chủ', 'Home', 'trang-chu', 'home', 1, 1, 0, 0, 0),
	(59, 'Sản phẩm', 'Product', 'san-pham', 'product', 2, 1, 0, 0, 0),
	(60, 'Liên Hệ', 'Contact', 'lien-he', 'contact', 3, 1, 0, 0, 0),
	(61, 'Tin tức', 'news', 'tin-tuc', 'news', 4, 1, 0, 0, 0);
/*!40000 ALTER TABLE `mn_menu` ENABLE KEYS */;

-- Dumping structure for table shop.mn_module
CREATE TABLE IF NOT EXISTS `mn_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(100) DEFAULT NULL,
  `action_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `alias` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `action_id` (`action_id`),
  CONSTRAINT `FK_mn_module_mn_action` FOREIGN KEY (`action_id`) REFERENCES `mn_action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table shop.mn_module: ~0 rows (approximately)
DELETE FROM `mn_module`;
/*!40000 ALTER TABLE `mn_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `mn_module` ENABLE KEYS */;

-- Dumping structure for table shop.mn_pagehtml
CREATE TABLE IF NOT EXISTS `mn_pagehtml` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_vn` text COLLATE utf8_unicode_ci,
  `description_en` text COLLATE utf8_unicode_ci,
  `content_vn` longtext COLLATE utf8_unicode_ci,
  `content_en` longtext COLLATE utf8_unicode_ci,
  `sort` int(11) DEFAULT NULL,
  `ticlock` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shop.mn_pagehtml: 4 rows
DELETE FROM `mn_pagehtml`;
/*!40000 ALTER TABLE `mn_pagehtml` DISABLE KEYS */;
INSERT INTO `mn_pagehtml` (`Id`, `title_vn`, `title_en`, `description_vn`, `description_en`, `content_vn`, `content_en`, `sort`, `ticlock`, `meta_keyword`, `meta_description`) VALUES
	(7, 'Thông tin footer', '', NULL, NULL, '<ul class="list-menu">\r\n	<li>\r\n	<p><strong>C&Ocirc;NG TY TNHH THIẾT KẾ NỘI THẤT PHAN RANG </strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong style="font-size: 13px;">Website:</strong><span style="font-size: 13px;">www.phanrangdesign.com</span></p>\r\n	</li>\r\n	<li><strong style="font-size: 13px;">Trụ Sở Ch&iacute;nh:</strong><span style="font-size: 13px;">&nbsp;76 Nguyễn Văn Cừ, P.Thanh Sơn, Tp.Phan Rang-Th&aacute;p Ch&agrave;m, Ninh Thuận.</span></li>\r\n	<li><strong style="font-size: 13px;">Showroom:</strong><span style="font-size: 13px;">&nbsp;82 Quang Trung, P.Thanh Sơn, Tp.Phan Rang-Th&aacute;p Ch&agrave;m, Ninh Thuận.</span></li>\r\n	<li><strong style="font-size: 13px;">Chi Nh&aacute;nh Nha Trang:</strong><span style="font-size: 13px;">&nbsp;số 2i, đường B4, CT5, KDC Vĩnh Điền Trung, Nha Trang, Kh&aacute;nh H&ograve;a.</span></li>\r\n	<li><strong style="font-size: 13px;">Kho Xưởng Sản Xuất:</strong><span style="font-size: 13px;">&nbsp;số 81 đường 16/4, Tp.Phan Rang-Th&aacute;p Ch&agrave;m, Ninh Thuận.</span></li>\r\n	<li><strong style="font-size: 13px;">Facebook:</strong><span style="font-size: 13px;">&nbsp;http://www.facebook.com/phanrangdesign.vn (Fanpage:Phan Rang Design).</span></li>\r\n	<li><strong>Email:</strong> phanrangdesign<a href="mailto:halymedia@gmail.com" target="_top">@gmail.com</a></li>\r\n	<li><strong style="font-size: 13px;">Tel:</strong><span style="font-size: 13px;">&nbsp;02593 52 52 32 - 090 88 11 928.</span></li>\r\n	<li>\r\n	<p style="font-size: 13px;">&nbsp;</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', '', NULL, '0', '', ''),
	(21, 'Giới thiệu', '', NULL, NULL, '<ul class="list-menu">\r\n	<li>\r\n	<p><strong>C&Ocirc;NG TY TNHH THIẾT KẾ NỘI THẤT PHAN RANG </strong></p>\r\n	</li>\r\n	<li>Website:www.phanrangdesign.com<br />\r\n	Trụ Sở Ch&iacute;nh: 76 Nguyễn Văn Cừ, P.Thanh Sơn, Tp.Phan Rang-Th&aacute;p Ch&agrave;m, Ninh Thuận.<br />\r\n	Showroom: 82 Quang Trung, P.Thanh Sơn, Tp.Phan Rang-Th&aacute;p Ch&agrave;m, Ninh Thuận.<br />\r\n	Chi Nh&aacute;nh Nha Trang: số 2i, đường B4, CT5, KDC Vĩnh Điền Trung, Nha Trang, Kh&aacute;nh H&ograve;a.<br />\r\n	Kho Xưởng Sản Xuất: số 81 đường 16/4, Tp.Phan Rang-Th&aacute;p Ch&agrave;m, Ninh Thuận.<br />\r\n	Facebook: http://www.facebook.com/phanrangdesign.vn (Fanpage:Phan Rang Design).<br />\r\n	Tel: 02593 52 52 32 - 090 88 11 928.</li>\r\n</ul>\r\n', '', NULL, '0', '', ''),
	(22, 'thông tin liên hệ', '', NULL, NULL, '<p><strong>C&Ocirc;NG TY TNHH THIẾT KẾ V&Agrave; THI C&Ocirc;NG NỘI THẤT PHANRANG </strong></p>\r\n\r\n<p><strong>Website:</strong>www.phanrangdesign.com<br />\r\n<strong>Trụ Sở Ch&iacute;nh:</strong> 76 Nguyễn Văn Cừ, P.Thanh Sơn, Tp.Phan Rang-Th&aacute;p Ch&agrave;m, Ninh Thuận.<br />\r\n<strong>Showroom:</strong> 82 Quang Trung, P.Thanh Sơn, Tp.Phan Rang-Th&aacute;p Ch&agrave;m, Ninh Thuận.<br />\r\n<strong>Chi Nh&aacute;nh Nha Trang:</strong> số 2i, đường B4, CT5, KDC Vĩnh Điền Trung, Nha Trang, Kh&aacute;nh H&ograve;a.<br />\r\n<strong>Kho Xưởng Sản Xuất:</strong> số 81 đường 16/4, Tp.Phan Rang-Th&aacute;p Ch&agrave;m, Ninh Thuận.<br />\r\n<strong>Facebook:</strong> http://www.facebook.com/phanrangdesign.vn (Fanpage:Phan Rang Design).<br />\r\n<strong style="font-size: 13px;">Email:</strong><span style="font-size: 13px;">&nbsp;phanrangdesign</span><a href="mailto:halymedia@gmail.com" style="font-size: 13px;" target="_top">@gmail.com</a></p>\r\n\r\n<p><strong>Tel:</strong> 02593 52 52 32 - 090 88 11 928.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '', NULL, '0', '', ''),
	(23, 'google map', '', NULL, NULL, '<p><iframe allowfullscreen="" frameborder="0" height="450" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1162.0855970703597!2d108.99317930058129!3d11.568020423822398!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3170d0295fba45ab%3A0xe884ed60bb7888f4!2zODIgUXVhbmcgVHJ1bmcsIFRoYW5oIFNvbiwgUGhhbiBSYW5nLVRow6FwIENow6BtLCBOaW5oIFRodeG6rW4sIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1529543983463" style="border:0" width="600"></iframe></p>\r\n', '', NULL, '0', '', '');
/*!40000 ALTER TABLE `mn_pagehtml` ENABLE KEYS */;

-- Dumping structure for table shop.mn_picture
CREATE TABLE IF NOT EXISTS `mn_picture` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `images` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `ticlock` tinyint(4) NOT NULL DEFAULT '0',
  `idpro` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- Dumping data for table shop.mn_picture: ~44 rows (approximately)
DELETE FROM `mn_picture`;
/*!40000 ALTER TABLE `mn_picture` DISABLE KEYS */;
INSERT INTO `mn_picture` (`Id`, `images`, `ticlock`, `idpro`, `type`, `sort`) VALUES
	(1, 'bt03-mau-thiet-ke-kien-truc-biet-thu-co-dien-01.jpg', 0, 2, NULL, 0),
	(2, 'bt03-mau-thiet-ke-kien-truc-biet-thu-co-dienq8g65.jpg', 0, 0, NULL, 0),
	(3, 'bt03-mau-thiet-ke-kien-truc-biet-thu-co-dien-03.jpg', 0, 2, NULL, 0),
	(4, 'bt03-mau-thiet-ke-kien-truc-biet-thu-co-dienoi3gb.jpg', 0, 2, NULL, 2131),
	(5, 'bt03-mau-thiet-ke-kien-truc-biet-thu-co-dienoiqqs.jpg', 0, 2, NULL, 0),
	(6, 'bt03-mau-thiet-ke-kien-truc-biet-thu-co-dien0cb29.jpg', 0, 2, NULL, 123),
	(7, 'xd-cau-cang-trung-chuyen-container-va-hang-hoa-bai-de-xe-oto0kgq3.jpg', 0, 9, NULL, 0),
	(8, 'xd-cau-cang-trung-chuyen-container-va-hang-hoa-bai-de-xe-oto094f7.jpg', 0, 9, NULL, 0),
	(9, 'nha-ma-y-thu-c-pha-m-cp-cu-chiovtkp.jpg', 0, 10, NULL, 0),
	(10, 'khu-dich-vu-hau-can-nghe-ca4jpss.jpg', 0, 12, NULL, 0),
	(11, 'nha-ma-y-co-khi-ho-a-hie-pl6k74.jpg', 0, 11, NULL, 0),
	(12, 'villa-con-khuong-tp-can-thoadl3r.jpg', 0, 13, NULL, 0),
	(13, 'nha-anh-ty-can-tho8marl.jpg', 0, 14, NULL, 0),
	(14, 'villa-phan-xuan-bi-nh-01.jpg', 0, 15, NULL, 5),
	(15, 'villa-phan-xuan-bi-nhjv9ny.jpg', 0, 15, NULL, 1),
	(16, 'villa-phan-xuan-bi-nhbqrhu.jpg', 0, 15, NULL, 2),
	(17, 'villa-phan-xuan-bi-nhltctj.jpg', 0, 15, NULL, 3),
	(18, 'villa-phan-xuan-bi-nhzrsgw.jpg', 0, 15, NULL, 4),
	(19, 'villa-anh-ha-nvi9cs.jpg', 0, 16, NULL, 0),
	(20, 'bie-t-thu-que0tmh3.jpg', 0, 17, NULL, 0),
	(21, 'truong-mam-non-hoa-sen1yjcf.jpg', 0, 18, NULL, 0),
	(22, 'truong-tieu-hoc-lai-hieuju0u0.jpg', 0, 19, NULL, 2),
	(23, 'truong-tieu-hoc-lai-hieuhqncf.jpg', 0, 19, NULL, 1),
	(24, 'trang-tri-noi-that-hoi-truong-tinh-uy-hau-giangf1ruy.jpg', 0, 20, NULL, 1),
	(25, 'trang-tri-noi-that-hoi-truong-tinh-uy-hau-giangyxjda.jpg', 0, 20, NULL, 2),
	(26, 'trang-tri-noi-that-hoi-truong-tinh-uy-hau-giangnpxx8.jpg', 0, 20, NULL, 3),
	(27, 'trang-tri-noi-that-hoi-truong-tinh-uy-hau-giangxizij.jpg', 0, 20, NULL, 4),
	(28, 'trang-tri-noi-that-hoi-truong-tinh-uy-hau-giangungnh.jpg', 0, 20, NULL, 5),
	(29, 'nha-cau-hienqedxl.jpg', 0, 21, NULL, 0),
	(30, 'nha-cau-hiencnijm.jpg', 0, 21, NULL, 0),
	(31, 'nha-ong-nguyen-manh-hungtqk5k.jpg', 0, 22, NULL, 0),
	(32, 'bie-t-thu-quene13d.jpg', 0, 17, NULL, 0),
	(33, 'bie-t-thu-quekzkeh.jpg', 0, 17, NULL, 0),
	(34, 'bie-t-thu-queuqh07.jpg', 0, 17, NULL, 0),
	(35, 'du-an-1-01.jpg', 0, 23, NULL, 0),
	(36, 'du-an-1-02.jpg', 0, 23, NULL, 0),
	(37, 'du-an-1-03.jpg', 0, 23, NULL, 0),
	(38, 'du-an-1-04.jpg', 0, 23, NULL, 0),
	(39, 'du-an-1-05.jpg', 0, 23, NULL, 0),
	(40, 'du-an-2-01.jpg', 0, 24, NULL, 0),
	(41, 'du-an-2-02.jpg', 0, 24, NULL, 0),
	(42, 'du-an-2-03.png', 0, 24, NULL, 0),
	(43, 'du-an-2-04.jpg', 0, 24, NULL, 0),
	(44, 'du-an-2-05.jpg', 0, 24, NULL, 0);
/*!40000 ALTER TABLE `mn_picture` ENABLE KEYS */;

-- Dumping structure for table shop.mn_post
CREATE TABLE IF NOT EXISTS `mn_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_vn` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `description_en` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `content_vn` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `content_en` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `hot` tinyint(1) DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `create` timestamp NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.mn_post: ~1 rows (approximately)
DELETE FROM `mn_post`;
/*!40000 ALTER TABLE `mn_post` DISABLE KEYS */;
INSERT INTO `mn_post` (`id`, `title_vn`, `title_en`, `description_vn`, `description_en`, `content_vn`, `content_en`, `images`, `id_category`, `sort`, `hot`, `new`, `create`, `tag`, `meta_keyword`, `meta_description`, `alias_vn`, `alias_en`) VALUES
	(176, '123', '454', '<p><img src="static/filemanager/14-1542970988.jpeg" alt="" width="200" height="200" />dsadsad</p>', '<p>123213</p>', '<p>354435</p>', '<p>657657</p>', '123-1542972344.jpeg', 34, 1, 1, 1, '2018-11-23 18:03:34', '', '', '', '123', '454');
/*!40000 ALTER TABLE `mn_post` ENABLE KEYS */;

-- Dumping structure for table shop.mn_product
CREATE TABLE IF NOT EXISTS `mn_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_vn` text COLLATE utf8_unicode_ci,
  `content_vn` longtext COLLATE utf8_unicode_ci,
  `description_en` text COLLATE utf8_unicode_ci,
  `content_en` longtext COLLATE utf8_unicode_ci,
  `id_category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images1` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `images2` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `images3` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `images4` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `images5` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `sale_price` int(11) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `hot` tinyint(4) NOT NULL DEFAULT '0',
  `alias_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create` timestamp NULL DEFAULT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `new` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shop.mn_product: 2 rows
DELETE FROM `mn_product`;
/*!40000 ALTER TABLE `mn_product` DISABLE KEYS */;
INSERT INTO `mn_product` (`id`, `title_vn`, `title_en`, `description_vn`, `content_vn`, `description_en`, `content_en`, `id_category`, `images`, `images1`, `images2`, `images3`, `images4`, `images5`, `price`, `sale_price`, `sort`, `hot`, `alias_vn`, `alias_en`, `create`, `meta_keyword`, `meta_description`, `order`, `new`) VALUES
	(49, '123', '456', '<p>123<img src="static/filemanager/2.png-1542956239.png" alt="" width="200" height="200" /></p>', '<p><img src="static/filemanager/1.png-1542956268.png" alt="" width="200" height="200" />789</p>', '<p><img src="static/filemanager/3.gif-1542956256.gif" alt="" width="200" height="200" />456</p>', '<p><img src="static/filemanager/screenshot-from-2018-11-16-08-40-54.png-1542956281.png" alt="" width="200" height="200" />abc123</p>', '119', 'trang-chu-as-u-u-a-a-1542956298.png', '0-trang-chu-as-u-u-a-a-1542956298.gif', '1-trang-chu-as-u-u-a-a-1542956298.png', '', '', '', 4000000, 3000000, 1, 1, '123', '456', '2018-11-23 13:58:18', '', '', 0, 1),
	(50, 'a sadsa a s asdas das sa s sa', 'tuan ác', '', '', '', '', '119', 'a-sadsa-a-s-asdas-das-sa-s-sa-1542957420.gif', '0-a-sadsa-a-s-asdas-das-sa-s-sa-1542957386.png', '1-a-sadsa-a-s-asdas-das-sa-s-sa-1542957386.png', '2-a-sadsa-a-s-asdas-das-sa-s-sa-1542957386.png', '3-a-sadsa-a-s-asdas-das-sa-s-sa-1542957386.png', '', 12321312, 3000000, 1, 0, 'a-sadsa-a-s-asdas-das-sa-s-sa', 'tuan-ac', '2018-11-23 14:16:26', '', '', 0, 1);
/*!40000 ALTER TABLE `mn_product` ENABLE KEYS */;

-- Dumping structure for table shop.mn_role
CREATE TABLE IF NOT EXISTS `mn_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.mn_role: ~2 rows (approximately)
DELETE FROM `mn_role`;
/*!40000 ALTER TABLE `mn_role` DISABLE KEYS */;
INSERT INTO `mn_role` (`id`, `name`, `module_id`, `detail`) VALUES
	(1, 'admin', '', ''),
	(4, 'editor', '', '');
/*!40000 ALTER TABLE `mn_role` ENABLE KEYS */;

-- Dumping structure for table shop.mn_user
CREATE TABLE IF NOT EXISTS `mn_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shop.mn_user: ~1 rows (approximately)
DELETE FROM `mn_user`;
/*!40000 ALTER TABLE `mn_user` DISABLE KEYS */;
INSERT INTO `mn_user` (`id`, `username`, `hash`, `email`, `role_id`, `salt`, `create`, `last_login`, `fullname`, `address`, `active`) VALUES
	(1, 'admin', '$2a$14$mRrVoKj6whjBbE5zbZ9KxOoYIgwwKkh7Ly66IwMo.J4EdEmMkOhWm', 'tuanl123e@gmail.com.vn', 1, '$2a$14$4wCSh7OKPUjcMe4VEVH4VOaiy3pJE0FpIypIkP4NZKKiyLuR9NDYe', '2018-11-12 15:09:37', '2018-11-21 08:24:05', '123', '', 1);
/*!40000 ALTER TABLE `mn_user` ENABLE KEYS */;

-- Dumping structure for table shop.mn_weblink
CREATE TABLE IF NOT EXISTS `mn_weblink` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) NOT NULL,
  `images` varchar(200) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `ticlock` enum('0','1') NOT NULL,
  `parentid` int(11) DEFAULT NULL,
  `style` int(11) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `home` tinyint(4) DEFAULT NULL,
  `idcat` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

-- Dumping data for table shop.mn_weblink: 16 rows
DELETE FROM `mn_weblink`;
/*!40000 ALTER TABLE `mn_weblink` DISABLE KEYS */;
INSERT INTO `mn_weblink` (`Id`, `title_vn`, `title_en`, `images`, `link`, `sort`, `ticlock`, `parentid`, `style`, `color`, `home`, `idcat`) VALUES
	(50, 'logo2', '', 'logo21514190807.png', '', 2, '0', 0, 0, '', 0, 0),
	(51, 'logo3', '', 'logo31514190813.png', '', 3, '0', 0, 0, '', 0, 0),
	(52, 'logo4', '', 'logo41514190820.png', '', 4, '0', 0, 0, '', 0, 0),
	(53, 'logo5', '', 'logo51514190826.png', '', 5, '0', 0, 0, '', 0, 0),
	(54, 'logo6', '', 'logo61514190833.png', '', 6, '0', 0, 0, '', 0, 0),
	(49, 'logo 1', '', 'logo 11530764620.png', '', 1, '0', 0, 0, '', 0, 0),
	(55, 'logo 7', '', 'logo 71514190840.png', '', 7, '0', 0, 0, '', 0, 0),
	(56, 'logo 8', '', 'logo 81514190847.png', '', 8, '0', 0, 0, '', 0, 0),
	(57, 'logo9', '', 'logo91514190855.png', '', 9, '0', 0, 0, '', 0, 0),
	(58, 'logo10', '', 'logo101514190862.png', '', 10, '0', 0, 0, '', 0, 0),
	(59, 'logo11', '', 'logo111514190870.png', '', 11, '0', 0, 0, '', 0, 0),
	(69, 'dt5', '', 'dt51514436551.png', '', 0, '0', 0, NULL, NULL, 0, 0),
	(68, 'dt4', '', 'dt41514436541.png', '', 0, '0', 0, NULL, NULL, 0, 0),
	(67, 'dt3', '', 'dt31514436529.png', '', 0, '0', 0, NULL, NULL, 0, 0),
	(66, 'dt2', '', 'dt21514436521.png', '', 0, '0', 0, NULL, NULL, 0, 0),
	(65, 'dt1', '', 'dt11514436510.png', '', 0, '0', 0, NULL, NULL, 0, 0);
/*!40000 ALTER TABLE `mn_weblink` ENABLE KEYS */;

-- Dumping structure for table shop.mn_website
CREATE TABLE IF NOT EXISTS `mn_website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description_vn` varchar(255) DEFAULT NULL,
  `keyword_vn` varchar(255) DEFAULT NULL,
  `title_vn` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `googleanalytics` text,
  `enable` tinyint(4) DEFAULT NULL,
  `stamp` varchar(255) DEFAULT NULL,
  `hotline` varchar(255) DEFAULT NULL,
  `hotline2` varchar(50) DEFAULT NULL,
  `fanpage` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `google` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `tencty` varchar(255) DEFAULT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.mn_website: 1 rows
DELETE FROM `mn_website`;
/*!40000 ALTER TABLE `mn_website` DISABLE KEYS */;
INSERT INTO `mn_website` (`id`, `description_vn`, `keyword_vn`, `title_vn`, `message`, `email`, `googleanalytics`, `enable`, `stamp`, `hotline`, `hotline2`, `fanpage`, `youtube`, `twitter`, `google`, `instagram`, `diachi`, `tencty`, `slogan`) VALUES
	(1, 'PHAN RANG DESIGN chuyên thiết kế thi công các công trình nội thất gia đình, quán coffe, bar, karaoke.v.v.. HOTLINE: 0909 88 11 928 - 0911 411 025 HÂN HẠNH ĐƯỢC PHỤC VỤ QUÝ KHÁCh', '', 'PhanRangDesign', '', 'phanrangdesign@gmail.com', '<!-- Global site tag (gtag.js) - Google Analytics -->\r\n<script async src="https://www.googletagmanager.com/gtag/js?id=UA-121812317-1"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'UA-121812317-1\');\r\n</script>\r\n', 0, '', '090 88 11 928', '090 69 03 669', 'https://www.facebook.com/phanrangdesign/', '', '', '', '', '76 Nguyễn Văn Cừ, P.Thanh Sơn, Tp.Phan Rang-Tháp Chàm, Ninh Thuận.', 'CÔNG TY TNHH THIẾT KẾ NỘI THẤT PHAN RANG', '');
/*!40000 ALTER TABLE `mn_website` ENABLE KEYS */;

-- Dumping structure for table shop.mn_works
CREATE TABLE IF NOT EXISTS `mn_works` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_vn` text COLLATE utf8_unicode_ci NOT NULL,
  `content_vn` longtext COLLATE utf8_unicode_ci,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_en` text COLLATE utf8_unicode_ci,
  `content_en` text COLLATE utf8_unicode_ci,
  `idcat` int(11) DEFAULT NULL,
  `home` int(11) NOT NULL DEFAULT '0',
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `ticlock` tinyint(4) DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `tag` text COLLATE utf8_unicode_ci,
  `hot` tinyint(4) NOT NULL DEFAULT '0',
  `titlepage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shop.mn_works: 0 rows
DELETE FROM `mn_works`;
/*!40000 ALTER TABLE `mn_works` DISABLE KEYS */;
/*!40000 ALTER TABLE `mn_works` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
