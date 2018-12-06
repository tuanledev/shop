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
  `meta_keyword_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.mn_category: ~2 rows (approximately)
DELETE FROM `mn_category`;
/*!40000 ALTER TABLE `mn_category` DISABLE KEYS */;
INSERT INTO `mn_category` (`id`, `title_vn`, `title_en`, `description_vn`, `description_en`, `images`, `parent_id`, `sort`, `alias_vn`, `alias_en`, `meta_keyword_vn`, `meta_keyword_en`, `meta_description_vn`, `meta_description_en`) VALUES
	(120, 'Sacha inchi', 'Sacha inchi', '', '', 'sacha-inchi-1544063741.jpeg', 0, 0, 'sacha-inchi', 'sacha-inchi', '', '', '', ''),
	(124, 'Sacha inchi 3', 'Sacha inchi 3', '', '', 'sacha-inchi-3-1544063754.png', 0, 0, 'sacha-inchi-3', 'sacha-inchi-3', '', '', '', '');
/*!40000 ALTER TABLE `mn_category` ENABLE KEYS */;

-- Dumping structure for table shop.mn_catenews
CREATE TABLE IF NOT EXISTS `mn_catenews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer` int(11) NOT NULL,
  `description_vn` longtext COLLATE utf8_unicode_ci,
  `description_en` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shop.mn_catenews: 2 rows
DELETE FROM `mn_catenews`;
/*!40000 ALTER TABLE `mn_catenews` DISABLE KEYS */;
INSERT INTO `mn_catenews` (`id`, `title_vn`, `title_en`, `parent_id`, `sort`, `tag`, `images`, `meta_keyword_vn`, `meta_keyword_en`, `meta_description_vn`, `meta_description_en`, `alias_vn`, `alias_en`, `footer`, `description_vn`, `description_en`) VALUES
	(34, 'tin tuc 1', 'news 1', 0, 2, '', 'tin-tuc-1-1544063784.png', '', '', '', '', 'tin-tuc-1', 'news-1', 0, '', ''),
	(37, 'tin tuc 2', 'new2', 0, 0, '', 'tin-tuc-2-1544063804.jpeg', 'tin tuc 2', 'new2 ', 'tin tuc 2', 'new2 ', 'tin-tuc-2', 'new2', 0, '', '');
/*!40000 ALTER TABLE `mn_catenews` ENABLE KEYS */;

-- Dumping structure for table shop.mn_cate_image
CREATE TABLE IF NOT EXISTS `mn_cate_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_vn` text COLLATE utf8_unicode_ci NOT NULL,
  `description_en` text COLLATE utf8_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `alias_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `style` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shop.mn_cate_image: 1 rows
DELETE FROM `mn_cate_image`;
/*!40000 ALTER TABLE `mn_cate_image` DISABLE KEYS */;
INSERT INTO `mn_cate_image` (`id`, `title_vn`, `title_en`, `description_vn`, `description_en`, `images`, `parent_id`, `sort`, `alias_vn`, `alias_en`, `meta_keyword`, `meta_description`, `link`, `style`, `icon`) VALUES
	(34, 'Logo', 'Logo', '', '', 'logo-1543293853.png', 0, 0, 'logo', 'logo', '', '', '', '', NULL);
/*!40000 ALTER TABLE `mn_cate_image` ENABLE KEYS */;

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

-- Dumping structure for table shop.mn_contact
CREATE TABLE IF NOT EXISTS `mn_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table shop.mn_contact: 1 rows
DELETE FROM `mn_contact`;
/*!40000 ALTER TABLE `mn_contact` DISABLE KEYS */;
INSERT INTO `mn_contact` (`id`, `name`, `address`, `email`, `phone`, `message`) VALUES
	(126, 'sadsa', '12321321', 'tuanle@gmail.com', '123213', '2132132132132');
/*!40000 ALTER TABLE `mn_contact` ENABLE KEYS */;

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

-- Dumping structure for table shop.mn_image
CREATE TABLE IF NOT EXISTS `mn_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `images` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- Dumping data for table shop.mn_image: ~0 rows (approximately)
DELETE FROM `mn_image`;
/*!40000 ALTER TABLE `mn_image` DISABLE KEYS */;
INSERT INTO `mn_image` (`id`, `images`, `cate_id`, `sort`, `date`) VALUES
	(85, 'logo-1543293870.png', 34, 0, '2018-11-27 11:44:30');
/*!40000 ALTER TABLE `mn_image` ENABLE KEYS */;

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
  `url_vn` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_en` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `cate_product_id` int(11) NOT NULL DEFAULT '0',
  `cate_news_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table shop.mn_menu: ~7 rows (approximately)
DELETE FROM `mn_menu`;
/*!40000 ALTER TABLE `mn_menu` DISABLE KEYS */;
INSERT INTO `mn_menu` (`id`, `title_vn`, `title_en`, `alias_vn`, `alias_en`, `url_vn`, `url_en`, `sort`, `active`, `parent_id`, `cate_product_id`, `cate_news_id`, `post_id`) VALUES
	(58, 'Trang chủ', 'Home', 'trang-chu', 'home', NULL, NULL, 1, 1, 0, 0, 0, 0),
	(59, 'Sản phẩm', 'Product', 'san-pham', 'product', NULL, NULL, 2, 1, 0, 0, 0, 0),
	(60, 'Liên Hệ', 'Contact', 'lien-he', 'contact', NULL, NULL, 3, 1, 0, 0, 0, 0),
	(61, 'Tin tức', 'News', 'tin-tuc', 'news', NULL, NULL, 4, 1, 0, 0, 0, 0),
	(63, 'sanpham 1', 'sanpham 1', 'sanpham-1', 'sanpham-1', NULL, NULL, 1, 1, 59, 120, 0, 0),
	(64, 'sanpham 1-1', 'sanpham 1-1', 'sanpham-1-1', 'sanpham-1-1', NULL, NULL, 1, 1, 63, 122, 0, 0),
	(65, 'tuan le', 'tuan le', 'tuan-le', 'tuan-le', NULL, NULL, 0, 1, 0, 0, 0, 181);
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
  `meta_keyword_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.mn_post: ~13 rows (approximately)
DELETE FROM `mn_post`;
/*!40000 ALTER TABLE `mn_post` DISABLE KEYS */;
INSERT INTO `mn_post` (`id`, `title_vn`, `title_en`, `description_vn`, `description_en`, `content_vn`, `content_en`, `images`, `id_category`, `sort`, `hot`, `new`, `create`, `tag`, `meta_keyword_vn`, `meta_keyword_en`, `meta_description_vn`, `meta_description_en`, `alias_vn`, `alias_en`) VALUES
	(183, 'Sacha inchi vn', 'Sacha inchi en', '<p>CERES ORGANICS vn</p>', '<p>CERES ORGANICS</p>', '<header class="entry-header"><img src="static/filemanager/developer-1543893504.png" alt="" width="200" height="200" /><img src="../../static/filemanager/developer-1543894426.png" alt="" width="200" height="200" /></header>\r\n<div class="entry-content">\r\n<p>Living waste free may sound like a huge challenge, but it&rsquo;s actually a lot easier than you think! With some small changes to your lifestyle, you can significantly reduce waste. It won&rsquo;t happen overnight, but small changes do make a big difference.</p>\r\n<p><br />Here&rsquo;s some tips for going waste free that you can start implementing today.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<ol>\r\n<li><strong>Plan your meals</strong></li>\r\n</ol>\r\n<p><img class="alignnone size-large wp-image-8500" src="https://www.ceres.co.nz/wp-content/uploads/2018/11/meal_planner-1024x768.jpg" sizes="(max-width: 640px) 100vw, 640px" srcset="https://www.ceres.co.nz/wp-content/uploads/2018/11/meal_planner-1024x768.jpg 1024w, https://www.ceres.co.nz/wp-content/uploads/2018/11/meal_planner-300x225.jpg 300w, https://www.ceres.co.nz/wp-content/uploads/2018/11/meal_planner-768x576.jpg 768w" alt="Planning Meals" width="640" height="480" /></p>\r\n<p>The no.1 common complaint we hear about food waste are not being able to have time to cook every night, or forgetting about ingredients in the fridge. Set aside time for meal planning so you only buy the food that you genuinely need. This will help to reduce food waste and has the added bonus of saving you money. Plus, you&rsquo;ll probably make much healthier choices. You can download a meal planner on your phone or simply set up a spreadsheet and plan your meals on the weekend. If you need some ideas, we&rsquo;ve got some great&nbsp;<a href="https://www.ceres.co.nz/recipes/">recipes</a>&nbsp;for you to try out!</p>\r\n<p>&nbsp;</p>\r\n<ol start="2">\r\n<li><strong>Make the most of your food</strong></li>\r\n</ol>\r\n<p><img class="alignnone size-large wp-image-8501" src="https://www.ceres.co.nz/wp-content/uploads/2018/11/Blog_Foodwaste-1-1024x768.jpg" sizes="(max-width: 640px) 100vw, 640px" srcset="https://www.ceres.co.nz/wp-content/uploads/2018/11/Blog_Foodwaste-1-1024x768.jpg 1024w, https://www.ceres.co.nz/wp-content/uploads/2018/11/Blog_Foodwaste-1-300x225.jpg 300w, https://www.ceres.co.nz/wp-content/uploads/2018/11/Blog_Foodwaste-1-768x576.jpg 768w" alt="Reducing food waste" width="640" height="480" /></p>\r\n<p>Don&rsquo;t throw away the your broccoli stalks, potato peelings and carrot tops! Every year Kiwis send a whopping 122,547 tonnes of food waste to landfill*. Some products such as canned foods don&rsquo;t require best before dates, do last a long time if stored and sealed appropriately*. Before you throw away off cuts of your food, think &ndash; is this edible?</p>\r\n<p>&nbsp;</p>\r\n</div>', '<header class="entry-header"><img class="alignnone wp-image-8499 size-large" src="https://www.ceres.co.nz/wp-content/uploads/2018/11/Blog_CO-sustainability-report-bag-1024x768.jpg" sizes="(max-width: 640px) 100vw, 640px" srcset="https://www.ceres.co.nz/wp-content/uploads/2018/11/Blog_CO-sustainability-report-bag-1024x768.jpg 1024w, https://www.ceres.co.nz/wp-content/uploads/2018/11/Blog_CO-sustainability-report-bag-300x225.jpg 300w, https://www.ceres.co.nz/wp-content/uploads/2018/11/Blog_CO-sustainability-report-bag-768x576.jpg 768w" alt="Reusable Bag Reduce Your Waste" width="640" height="480" /></header>\r\n<div class="entry-content">\r\n<p>Living waste free may sound like a huge challenge, but it&rsquo;s actually a lot easier than you think! With some small changes to your lifestyle, you can significantly reduce waste. It won&rsquo;t happen overnight, but small changes do make a big difference.</p>\r\n<p><br />Here&rsquo;s some tips for going waste free that you can start implementing today.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<ol>\r\n<li><strong>Plan your meals</strong></li>\r\n</ol>\r\n<p><img class="alignnone size-large wp-image-8500" src="https://www.ceres.co.nz/wp-content/uploads/2018/11/meal_planner-1024x768.jpg" sizes="(max-width: 640px) 100vw, 640px" srcset="https://www.ceres.co.nz/wp-content/uploads/2018/11/meal_planner-1024x768.jpg 1024w, https://www.ceres.co.nz/wp-content/uploads/2018/11/meal_planner-300x225.jpg 300w, https://www.ceres.co.nz/wp-content/uploads/2018/11/meal_planner-768x576.jpg 768w" alt="Planning Meals" width="640" height="480" /></p>\r\n<p>The no.1 common complaint we hear about food waste are not being able to have time to cook every night, or forgetting about ingredients in the fridge. Set aside time for meal planning so you only buy the food that you genuinely need. This will help to reduce food waste and has the added bonus of saving you money. Plus, you&rsquo;ll probably make much healthier choices. You can download a meal planner on your phone or simply set up a spreadsheet and plan your meals on the weekend. If you need some ideas, we&rsquo;ve got some great&nbsp;<a href="https://www.ceres.co.nz/recipes/">recipes</a>&nbsp;for you to try out!</p>\r\n<p>&nbsp;</p>\r\n<ol start="2">\r\n<li><strong>Make the most of your food</strong></li>\r\n</ol>\r\n<p><img class="alignnone size-large wp-image-8501" src="https://www.ceres.co.nz/wp-content/uploads/2018/11/Blog_Foodwaste-1-1024x768.jpg" sizes="(max-width: 640px) 100vw, 640px" srcset="https://www.ceres.co.nz/wp-content/uploads/2018/11/Blog_Foodwaste-1-1024x768.jpg 1024w, https://www.ceres.co.nz/wp-content/uploads/2018/11/Blog_Foodwaste-1-300x225.jpg 300w, https://www.ceres.co.nz/wp-content/uploads/2018/11/Blog_Foodwaste-1-768x576.jpg 768w" alt="Reducing food waste" width="640" height="480" /></p>\r\n<p>Don&rsquo;t throw away the your broccoli stalks, potato peelings and carrot tops! Every year Kiwis send a whopping 122,547 tonnes of food waste to landfill*. Some products such as canned foods don&rsquo;t require best before dates, do last a long time if stored and sealed appropriately*. Before you throw away off cuts of your food, think &ndash; is this edible?</p>\r\n<p>&nbsp;</p>\r\n</div>', 'sacha-inchi-1543822435.jpeg', 37, 1, 1, 0, '2018-12-03 14:33:55', '', '', '', '', '', 'sacha-inchi-vn', 'sacha-inchi-en'),
	(184, 'trái cây việt', 'ORGANIC INGREDIENTS', '<p>Living waste free may sound like a huge challenge, but it&rsquo;s actually a lot easier than you think! With some small changes to your lifestyle, you can significantly reduce waste. It won&rsquo;t happen overnight, but small changes do make a big difference.</p>', '<h2>MADE EASY</h2>', '<p><img src="../../static/filemanager/screenshot-from-2018-11-01-13-46-46-1543894204.png" alt="" width="200" height="200" /><img src="static/filemanager/back-end-web-developer-job-description-irna4b-1543893643.jpeg" alt="" width="200" height="200" /></p>', '', 'trai-cay-viet-1543825544.jpeg', 34, 1, 1, 0, '2018-12-03 15:25:44', '', '', '', '', '', 'trai-cay-viet', 'organic-ingredients'),
	(186, 'trái cây việt', 'ORGANIC INGREDIENTS', '<h2>si&ecirc;u dễ</h2>', '<h2>MADE EASY</h2>', '<p><img src="../../static/filemanager/screenshot-from-2018-11-01-13-46-46-1543894204.png" alt="" width="200" height="200" /><img src="static/filemanager/back-end-web-developer-job-description-irna4b-1543893643.jpeg" alt="" width="200" height="200" /></p>', NULL, 'trai-cay-viet-1543825544.jpeg', 34, 1, 1, 0, '2018-12-03 15:25:44', '', '', '', '', '', 'trai-cay-viet', 'organic-ingredients'),
	(187, 'trái cây việt', 'ORGANIC INGREDIENTS', '<h2>si&ecirc;u dễ</h2>', '<h2>MADE EASY</h2>', '<p><img src="../../static/filemanager/screenshot-from-2018-11-01-13-46-46-1543894204.png" alt="" width="200" height="200" /><img src="static/filemanager/back-end-web-developer-job-description-irna4b-1543893643.jpeg" alt="" width="200" height="200" /></p>', NULL, 'trai-cay-viet-1543825544.jpeg', 34, 1, 1, 0, '2018-12-03 15:25:44', '', '', '', '', '', 'trai-cay-viet', 'organic-ingredients'),
	(188, 'trái cây việt', 'ORGANIC INGREDIENTS', '<h2>si&ecirc;u dễ</h2>', '<h2>MADE EASY</h2>', '<p><img src="../../static/filemanager/screenshot-from-2018-11-01-13-46-46-1543894204.png" alt="" width="200" height="200" /><img src="static/filemanager/back-end-web-developer-job-description-irna4b-1543893643.jpeg" alt="" width="200" height="200" /></p>', NULL, 'trai-cay-viet-1543825544.jpeg', 34, 1, 1, 0, '2018-12-03 15:25:44', '', '', '', '', '', 'trai-cay-viet', 'organic-ingredients'),
	(189, 'trái cây việt', 'ORGANIC INGREDIENTS', '<h2>si&ecirc;u dễ</h2>', '<h2>MADE EASY</h2>', '<p><img src="../../static/filemanager/screenshot-from-2018-11-01-13-46-46-1543894204.png" alt="" width="200" height="200" /><img src="static/filemanager/back-end-web-developer-job-description-irna4b-1543893643.jpeg" alt="" width="200" height="200" /></p>', NULL, 'trai-cay-viet-1543825544.jpeg', 34, 1, 1, 0, '2018-12-03 15:25:44', '', '', '', '', '', 'trai-cay-viet', 'organic-ingredients'),
	(190, 'trái cây việt', 'ORGANIC INGREDIENTS', '<h2>si&ecirc;u dễ</h2>', '<h2>MADE EASY</h2>', '<p><img src="../../static/filemanager/screenshot-from-2018-11-01-13-46-46-1543894204.png" alt="" width="200" height="200" /><img src="static/filemanager/back-end-web-developer-job-description-irna4b-1543893643.jpeg" alt="" width="200" height="200" /></p>', NULL, 'trai-cay-viet-1543825544.jpeg', 34, 1, 1, 0, '2018-12-03 15:25:44', '', '', '', '', '', 'trai-cay-viet', 'organic-ingredients'),
	(191, 'trái cây việt', 'ORGANIC INGREDIENTS', '<h2>si&ecirc;u dễ</h2>', '<h2>MADE EASY</h2>', '<p><img src="../../static/filemanager/screenshot-from-2018-11-01-13-46-46-1543894204.png" alt="" width="200" height="200" /><img src="static/filemanager/back-end-web-developer-job-description-irna4b-1543893643.jpeg" alt="" width="200" height="200" /></p>', NULL, 'trai-cay-viet-1543825544.jpeg', 34, 1, 1, 0, '2018-12-03 15:25:44', '', '', '', '', '', 'trai-cay-viet', 'organic-ingredients'),
	(192, 'trái cây việt', 'ORGANIC INGREDIENTS', '<h2>si&ecirc;u dễ</h2>', '<h2>MADE EASY</h2>', '<p><img src="../../static/filemanager/screenshot-from-2018-11-01-13-46-46-1543894204.png" alt="" width="200" height="200" /><img src="static/filemanager/back-end-web-developer-job-description-irna4b-1543893643.jpeg" alt="" width="200" height="200" /></p>', NULL, 'trai-cay-viet-1543825544.jpeg', 34, 1, 1, 0, '2018-12-03 15:25:44', '', '', '', '', '', 'trai-cay-viet', 'organic-ingredients'),
	(193, 'trái cây việt', 'ORGANIC INGREDIENTS', '<h2>si&ecirc;u dễ</h2>', '<h2>MADE EASY</h2>', '<p><img src="../../static/filemanager/screenshot-from-2018-11-01-13-46-46-1543894204.png" alt="" width="200" height="200" /><img src="static/filemanager/back-end-web-developer-job-description-irna4b-1543893643.jpeg" alt="" width="200" height="200" /></p>', NULL, 'trai-cay-viet-1543825544.jpeg', 34, 1, 1, 0, '2018-12-03 15:25:44', '', '', '', '', '', 'trai-cay-viet', 'organic-ingredients'),
	(194, 'trái cây việt', 'ORGANIC INGREDIENTS', '<h2>si&ecirc;u dễ</h2>', '<h2>MADE EASY</h2>', '<p><img src="../../static/filemanager/screenshot-from-2018-11-01-13-46-46-1543894204.png" alt="" width="200" height="200" /><img src="static/filemanager/back-end-web-developer-job-description-irna4b-1543893643.jpeg" alt="" width="200" height="200" /></p>', NULL, 'trai-cay-viet-1543825544.jpeg', 34, 1, 1, 0, '2018-12-03 15:25:44', '', '', '', '', '', 'trai-cay-viet', 'organic-ingredients'),
	(195, 'trái cây việt', 'ORGANIC INGREDIENTS', '<h2>si&ecirc;u dễ</h2>', '<h2>MADE EASY</h2>', '<p><img src="../../static/filemanager/screenshot-from-2018-11-01-13-46-46-1543894204.png" alt="" width="200" height="200" /><img src="static/filemanager/back-end-web-developer-job-description-irna4b-1543893643.jpeg" alt="" width="200" height="200" /></p>', NULL, 'trai-cay-viet-1543825544.jpeg', 34, 1, 1, 0, '2018-12-03 15:25:44', '', '', '', '', '', 'trai-cay-viet', 'organic-ingredients'),
	(196, 'Giới thiệu', 'Abous', '', '', '<div class="entry-content">\r\n<p>TỔ CHỨC L&Agrave; G&Igrave;?<br />N&oacute;i một c&aacute;ch đơn giản, \'hữu cơ\' l&agrave;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;việc trồng v&agrave; thu hoạch thực phẩm kh&ocirc;ng c&oacute; thuốc trừ s&acirc;u h&oacute;a học, thuốc trừ cỏ hoặc ph&acirc;n b&oacute;n<br />&nbsp;&nbsp;&nbsp;&nbsp;trồng hạt giống khỏe mạnh miễn ph&iacute; từ kỹ thuật biến đổi di truyền v&agrave; kỹ thuật di truyền<br />&nbsp;&nbsp;&nbsp;&nbsp;chế biến thực phẩm kh&ocirc;ng c&oacute; chất bảo quản nh&acirc;n tạo hoặc phụ gia<br />&nbsp;&nbsp;&nbsp;&nbsp;c&aacute;c thực h&agrave;nh bền vững về đạo đức v&agrave; m&ocirc;i trường trong quản l&yacute; n&ocirc;ng nghiệp v&agrave; sản xuất lương thực<br />HỢP T&Aacute;C N&Ocirc;NG NGHIỆP L&Agrave; ​​G&Igrave;?<br />C&aacute;c hệ thống n&ocirc;ng nghiệp hữu cơ được dựa tr&ecirc;n sự t&ocirc;n trọng c&aacute;c hệ sinh th&aacute;i v&agrave; chu kỳ tự nhi&ecirc;n. C&aacute;c trang trại được quản l&yacute; để tối đa h&oacute;a độ ph&igrave; của đất v&agrave; giảm thiểu t&aacute;c động bất lợi đến c&aacute;c hệ thống tự nhi&ecirc;n của địa phương. Kỹ năng trong c&aacute;c phương ph&aacute;p canh t&aacute;c hữu cơ l&agrave; l&agrave;m cho đất sản xuất một c&aacute;ch bền vững v&agrave; kh&ocirc;ng g&acirc;y &ocirc; nhiễm. Trong &yacute; nghĩa rộng hơn, n&ocirc;ng nghiệp hữu cơ nhằm mục đ&iacute;ch tạo ra một chuỗi sản xuất, chế biến v&agrave; ph&acirc;n phối to&agrave;n bộ, cả về mặt sinh th&aacute;i lẫn tr&aacute;ch nhiệm x&atilde; hội. N&ocirc;ng d&acirc;n hữu cơ thường được m&ocirc; tả sai v&agrave; kh&ocirc;ng được c&ocirc;ng nhận đầy đủ về c&ocirc;ng việc họ l&agrave;m. Họ l&agrave; những nh&agrave; s&aacute;ng tạo v&agrave; doanh nh&acirc;n đi đầu trong sự thay đổi. Nhiều người l&agrave; những c&aacute; nh&acirc;n c&oacute; kỹ năng cao, mang đến một phương ph&aacute;p khoa học để l&agrave;m việc với thế giới tự nhi&ecirc;n. Ch&uacute;ng l&agrave; những động lực đầu ti&ecirc;n về một số vấn đề lớn nhất ảnh hưởng đến thế giới, chẳng hạn như biến đổi kh&iacute; hậu.</p>\r\n<p>N&Ocirc;NG NGHIỆP BIODYNAMIC L&Agrave; G&Igrave;?<br />Động lực học l&agrave; lần đầu ti&ecirc;n trong c&aacute;c phong tr&agrave;o n&ocirc;ng nghiệp hữu cơ hiện đại bảo tồn c&aacute;c phương ph&aacute;p khoa học trong việc sử dụng lu&acirc;n canh, ủ ph&acirc;n, t&iacute;ch hợp đất, c&acirc;y trồng v&agrave; quản l&yacute; dịch hại v&agrave; chăn nu&ocirc;i trong đầu thế kỷ 20. N&ocirc;ng nghiệp động lực học l&agrave; một phương ph&aacute;p hữu cơ v&agrave; bền vững kh&ocirc;ng chỉ xem x&eacute;t sức khỏe của hệ sinh th&aacute;i m&agrave; c&ograve;n t&iacute;nh đến nhịp điệu của vũ trụ - mặt trời, mặt trăng, h&agrave;nh tinh v&agrave; c&aacute;c ng&ocirc;i sao - ảnh hưởng đến c&aacute;ch c&acirc;y trồng ph&aacute;t triển. chu kỳ. N&oacute; sử dụng một bộ duy nhất của c&aacute;c chế phẩm thảo dược để l&agrave;m sinh s&ocirc;i v&agrave; h&agrave;i ho&agrave; thực vật, ph&acirc;n hữu cơ v&agrave; đất. Biodynamics địa chỉ nguồn gốc của c&aacute;c vấn đề chứ kh&ocirc;ng phải l&agrave; c&aacute;c triệu chứng. V&iacute; dụ, n&ocirc;ng d&acirc;n hữu cơ c&oacute; thể &aacute;p dụng một loại thuốc trừ s&acirc;u tự nhi&ecirc;n để ngăn chặn hoặc ti&ecirc;u diệt c&ocirc;n tr&ugrave;ng. Một n&ocirc;ng d&acirc;n biodynamic nh&igrave;n v&agrave;o hệ sinh th&aacute;i để t&igrave;m v&agrave; sửa chữa sự mất c&acirc;n bằng g&acirc;y ra sự ph&aacute; hoại c&ocirc;n tr&ugrave;ng. Cả hai h&igrave;nh thức n&ocirc;ng nghiệp l&agrave; &acirc;m thanh sinh th&aacute;i v&agrave; cơ bản đối với sức khỏe của tr&aacute;i đất, h&agrave;nh tinh v&agrave; con người.</p>\r\n<p>TẠI SAO MUA HỮU CƠ?<br />C&oacute; rất &iacute;t thắc mắc tại sao nhiều đầu bếp h&agrave;ng đầu tr&ecirc;n thế giới lại th&iacute;ch c&aacute;c th&agrave;nh phần hữu cơ hơn: &lsquo;họ chỉ c&oacute; vị ngon hơn&rdquo;. Tr&aacute;i c&acirc;y v&agrave; rau hữu cơ ph&aacute;t triển mạnh trong đất đai m&agrave;u mỡ, sạch sẽ. Được trồng theo chu kỳ của Thi&ecirc;n nhi&ecirc;n v&agrave; tự nhi&ecirc;n ch&iacute;n, hương vị tự nhi&ecirc;n thực sự của ch&uacute;ng kh&ocirc;ng bị ẩn bởi c&aacute;c h&oacute;a chất v&agrave; c&ocirc;ng nghệ được thiết kế để duy tr&igrave; vẻ đẹp của ch&uacute;ng hoặc để tăng tốc độ trưởng th&agrave;nh của ch&uacute;ng. Với c&aacute;c chất hữu cơ kh&ocirc;ng c&oacute; thủ thuật: "những g&igrave; bạn nhận được l&agrave; đ&uacute;ng kiểu cũ v&agrave; hương vị". Nếu kh&ocirc;ng sử dụng h&oacute;a chất nh&acirc;n tạo hoặc giả mạo di truyền trong bất kỳ phần n&agrave;o của chuỗi hữu cơ, từ việc ph&aacute;t triển đến chế biến, bạn c&oacute; thể chắc chắn rằng thực phẩm của bạn tiếp cận với bạn theo c&aacute;ch m&agrave; Thi&ecirc;n nhi&ecirc;n dự định. Ngo&agrave;i hương vị tự nhi&ecirc;n, tươi mới l&agrave; những vấn đề m&ocirc;i trường. Lựa chọn thực phẩm của bạn trực tiếp ảnh hưởng đến c&aacute;ch xử l&yacute; m&ocirc;i trường của ch&uacute;ng t&ocirc;i v&agrave; c&aacute;c quyết định m&agrave; bạn đưa ra hiện nay được truyền cho c&aacute;c thế hệ tương lai của ch&uacute;ng t&ocirc;i.</p>\r\n</div>', '<div class="entry-content">\r\n<h3><img src="../../static/filemanager/1-1543916358.png" alt="" width="200" height="200" /></h3>\r\n<h3>&nbsp;</h3>\r\n<h3>WHAT IS ORGANICS?</h3>\r\n<p>Put simply, &lsquo;organics&rsquo; is</p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; the growing and harvesting of food without chemical pesticides, herbicides or fertilizers</li>\r\n<li>&nbsp;&nbsp;&nbsp; the planting of healthy seeds free from techniques of Genetic Modification and Genetic Engineering</li>\r\n<li>&nbsp;&nbsp;&nbsp; the processing of foods without artificial preservatives or additives</li>\r\n<li>&nbsp;&nbsp;&nbsp; the ethical and environmentally sustainable practices of farm management and food production</li>\r\n</ul>\r\n<h3>WHAT IS ORGANIC AGRICULTURE?</h3>\r\n<p>Organic agricultural systems are based on respect for natural ecosystems and cycles. Farms are managed to maximise soil fertility and minimise adverse impact on the local natural systems. The skill in organic farming methods is to make the land productive in a sustainable and non-polluting way. In the wider sense, organic agriculture aims to create an entire production, processing and distribution chain which is both ecologically and socially responsible. Organic farmers are often wrongly characterised and not fully recognised for the work they do. They are innovators and entrepreneurs at the forefront of change. Many are highly skilled individuals who bring a scientific approach to working with the natural world. They are first movers on some of the greatest problems that affect the world, such as climate change.</p>\r\n<h3>WHAT IS BIODYNAMIC AGRICULTURE?</h3>\r\n<p>Biodynamics was the first of the modern organic agricultural movements that preserved scientific methods in the use of crop rotation, composting, integrated soil, crop and pest management and animal husbandry during the early part of the 20th century. Biodynamic agriculture is an organic and sustainable approach that not only considers the health of the ecosystem but also takes into account how the rhythms of the universe &ndash; the sun, moon, planets and stars &ndash; influence how plants grow, to place the farmer totally within natural cycles. It employs a unique set of herbal preparations to enliven and harmonize plants, compost and soil. Biodynamics addresses the source of problems rather than the symptoms. For example, the organic farmer might apply a natural pesticide to discourage or kill insects. A biodynamic farmer looks to the ecosystem to find and correct the imbalance that caused the insect infestation. Both forms of agriculture are ecologically sound and fundamental to the health of the earth, planet and human beings.</p>\r\n</div>\r\n<h3>WHY BUY ORGANIC?</h3>\r\n<p>There is little wonder why many top chefs around the world prefer organic ingredients: &lsquo;they just taste better&rsquo;. Organically grown fruit and vegetables thrive in clean, fertile soils. Grown in accordance with Nature&rsquo;s cycles and ripened naturally, their true natural flavour is not hidden by chemicals and technologies designed to maintain their cosmetic appearance or to speed their maturation. With organics there are no tricks: &lsquo;what you get is true old-fashioned flavour and goodness&rsquo;. Without artificial chemical use or genetic tampering in any part of the organic chain, from the growing to processing, you can be sure your food reaches you the way Nature intended. Beyond the fresh, natural taste are the environmental issues. Your food choice directly affects how our environment is treated and the decisions you make now are passed on to our future generations.</p>', 'gioi-thieu-1543919248.jpeg', 0, 0, 0, 0, '2018-12-04 16:39:38', '', 'Giới thiệu', 'Abous', 'Giới thiệu', 'Abous', 'gioi-thieu', 'abous'),
	(197, 'Liên hệ', 'Contact', '<p><iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3699.5776299310364!2d106.69965173900673!3d10.767893562587636!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f4046354f33%3A0x383448b5a3811a37!2zQsOhbyBDw7RuZyBUaMawxqFuZyBU4bqhaSBUcC5IY20gLSBDbg!5e0!3m2!1svi!2s!4v1543977950133" width="600" height="450" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>', '<p><iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3699.5776299310364!2d106.69965173900673!3d10.767893562587636!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f4046354f33%3A0x383448b5a3811a37!2zQsOhbyBDw7RuZyBUaMawxqFuZyBU4bqhaSBUcC5IY20gLSBDbg!5e0!3m2!1svi!2s!4v1543977950133" width="600" height="450" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>', '<p>Bạn c&oacute; thể t&igrave;m c&acirc;u trả lời hoặc nhận x&eacute;t cho ch&uacute;ng t&ocirc;i bằng c&aacute;ch sử dụng mẫu dưới đ&acirc;y để gửi tin nhắn cho ch&uacute;ng t&ocirc;i v&agrave; ch&uacute;ng t&ocirc;i sẽ cố gắng li&ecirc;n hệ lại với bạn trong v&ograve;ng 5 ng&agrave;y l&agrave;m việc.</p>', '<p>Got a question or comments for us? Use the form below to send us a message and we\'ll endeavour to get back to you within 5 working days.&nbsp;</p>', 'lien-he-1543974574.jpeg', 0, 0, 0, 0, '2018-12-05 08:49:34', '', 'Liên hệ', 'Contact', 'Liên hệ', 'Contact', 'lien-he', 'contact');
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
  `id_category` int(11) DEFAULT NULL,
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
  `meta_keyword_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_vn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `new` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shop.mn_product: 58 rows
DELETE FROM `mn_product`;
/*!40000 ALTER TABLE `mn_product` DISABLE KEYS */;
INSERT INTO `mn_product` (`id`, `title_vn`, `title_en`, `description_vn`, `content_vn`, `description_en`, `content_en`, `id_category`, `images`, `images1`, `images2`, `images3`, `images4`, `images5`, `price`, `sale_price`, `sort`, `hot`, `alias_vn`, `alias_en`, `create`, `meta_keyword_vn`, `meta_keyword_en`, `meta_description_vn`, `meta_description_en`, `order`, `new`) VALUES
	(53, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', '', '<p>Tại Ceres Organics, ch&uacute;ng t&ocirc;i muốn giữ những thứ tinh khiết v&agrave; l&agrave;nh mạnh. Đ&oacute; l&agrave; l&yacute; do tại sao Amaranth Puffs của ch&uacute;ng t&ocirc;i l&agrave; như vậy. Thẳng l&ecirc;n sự tốt l&agrave;nh! Từ một từ tiếng Hy Lạp c&oacute; nghĩa l&agrave; "hoa kh&ocirc;ng bao giờ phai mờ", Amaranth l&agrave; một yếu trong chế độ ăn uống của người Aztec cổ đại, tin rằng n&oacute; c&oacute; sức mạnh si&ecirc;u nhi&ecirc;n. Ng&agrave;y nay, n&oacute; được t&ocirc;n k&iacute;nh v&igrave; hồ sơ dinh dưỡng tuyệt vời của n&oacute;, bao gồm protein v&agrave; chất xơ. Một sự lựa chọn tuyệt vời cho những người tr&aacute;nh l&uacute;a m&igrave;, Puffs Amaranth của ch&uacute;ng t&ocirc;i c&oacute; một hương vị độc đ&aacute;o, nhẹ rang v&agrave; kết cấu \'mềm crunch\' th&ecirc;m nh&acirc;n vật cho h&agrave;ng h&oacute;a nướng. N&oacute; cũng l&agrave;m cho một bữa ăn s&aacute;ng ngon ngũ cốc - chỉ cần th&ecirc;m sữa y&ecirc;u th&iacute;ch của bạn v&agrave; quăng trong một số tr&aacute;i c&acirc;y tươi v&agrave; c&aacute;c loại hạt.</p>', '', '<p>At Ceres Organics we like to keep things pure and wholesome. That&rsquo;s why our Amaranth Puffs are just that. Straight up goodness! From a Greek word meaning &lsquo;never-fading flower&rsquo;, Amaranth was a staple in the diet of the ancient Aztecs, believing it to have supernatural powers. Today, it&rsquo;s revered for its amazing nutrition profile, including protein and dietary fibre. A great choice for those avoiding wheat, our Amaranth Puffs have a unique, mild-toasted flavour and &lsquo;soft crunch&rsquo; texture that adds character to baked goods. It also makes a delicious breakfast cereal &ndash; simply add your favourite milk and toss in some fresh fruit and nuts.</p>', 124, 'huu-co---150g-1544008309.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(54, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', '', '', '', '', 124, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(55, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(56, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(57, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(58, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(59, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(60, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(61, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(62, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(63, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(64, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(65, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(66, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(67, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(68, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(69, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(70, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(71, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(72, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(73, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(74, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(75, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(76, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(77, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(78, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(79, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(80, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(81, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(82, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(83, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(84, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(85, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(86, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(87, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(88, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(89, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(90, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(91, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(92, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(93, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(94, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(95, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(96, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(97, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(98, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(99, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(100, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(101, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(102, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(103, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(104, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(105, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(106, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(107, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(108, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(109, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544005426.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0),
	(110, 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', NULL, NULL, NULL, NULL, 120, 'huu-co---150g-1544061926.jpeg', '', '', '', '', '', 300000, 0, 0, 0, 'huu-co---150g', 'organic-amaranth-puffs---150g', '2018-11-28 09:10:55', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 'HỮU CƠ - 150G', 'ORGANIC AMARANTH PUFFS - 150G', 0, 0);
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

-- Dumping structure for table shop.mn_setting
CREATE TABLE IF NOT EXISTS `mn_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `googleanalytics` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `enable` tinyint(4) DEFAULT NULL,
  `hotline` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotline2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fanpage` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `zalo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `slogan` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `meta_fb` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.mn_setting: 1 rows
DELETE FROM `mn_setting`;
/*!40000 ALTER TABLE `mn_setting` DISABLE KEYS */;
INSERT INTO `mn_setting` (`id`, `description_vn`, `description_en`, `keyword_vn`, `keyword_en`, `title_vn`, `title_en`, `email`, `googleanalytics`, `enable`, `hotline`, `hotline2`, `fanpage`, `zalo`, `youtube`, `twitter`, `google`, `instagram`, `address`, `company`, `slogan`, `logo`, `icon`, `footer`, `meta_fb`) VALUES
	(1, '12321', '12321', 'asdasd', 'wasdasd', 'PhanRangDesign 123', '1232131', 'tuanle@gmail.com', '123213', 0, '090 88 11 928 434', '090 69 03 669324324', 'https://www.facebook.com/thanhtuan.le.3781', 'asdsadsa', '123213', '123213', '213213', '123213', '12321321', '123213', '123213', 'logo-1543461109.png', '', '<p>&copy; CERES ORGANICS 2018 <span class="sep">|&nbsp;</span><a href="https://www.ceres.co.nz/privacy-policy/">PRIVACY</a>&nbsp;<span class="sep">|&nbsp;</span><a href="https://www.ceres.co.nz/legal-notice/">LEGAL</a>&nbsp;<span class="sep">|&nbsp;</span><a href="https://www.ceres.co.nz/terms-and-conditions/">TERMS&nbsp;&amp;&nbsp;CONDITIONS</a></p>', '');
/*!40000 ALTER TABLE `mn_setting` ENABLE KEYS */;

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
	(1, 'admin', '$2a$14$mRrVoKj6whjBbE5zbZ9KxOoYIgwwKkh7Ly66IwMo.J4EdEmMkOhWm', 'tuanl123e@gmail.com.vn', 1, '$2a$14$4wCSh7OKPUjcMe4VEVH4VOaiy3pJE0FpIypIkP4NZKKiyLuR9NDYe', '2018-11-12 15:09:37', '2018-12-03 14:26:13', '123', '', 1);
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
