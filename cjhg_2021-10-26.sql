# ************************************************************
# Sequel Pro SQL dump
# Version (null)
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.34-log)
# Database: cjhg
# Generation Time: 2021-10-26 02:55:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_config`;

CREATE TABLE `admin_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_config_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_config` WRITE;
/*!40000 ALTER TABLE `admin_config` DISABLE KEYS */;

INSERT INTO `admin_config` (`id`, `name`, `value`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'VAT','0.13','增值税 例：13% 应填写 0.13','2021-01-20 19:16:53','2021-01-20 20:11:56');

/*!40000 ALTER TABLE `admin_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`)
VALUES
	(1,0,1,'Dashboard','fa-bar-chart','/',NULL,NULL,'2021-01-17 14:24:15'),
	(2,0,15,'Admin','fa-tasks','',NULL,NULL,'2021-02-01 22:24:55'),
	(3,2,17,'Users','fa-users','auth/users',NULL,NULL,'2021-02-01 22:24:55'),
	(4,2,18,'Roles','fa-user','auth/roles',NULL,NULL,'2021-02-01 22:24:55'),
	(5,2,19,'Permission','fa-ban','auth/permissions',NULL,NULL,'2021-02-01 22:24:55'),
	(6,2,20,'Menu','fa-bars','auth/menu',NULL,NULL,'2021-02-01 22:24:55'),
	(7,2,21,'Operation log','fa-history','auth/logs',NULL,NULL,'2021-02-01 22:24:55'),
	(8,16,9,'供应商管理','fa-bars','suppliers',NULL,'2021-01-16 17:33:14','2021-02-01 22:24:55'),
	(9,15,4,'客户管理','fa-bars','customers',NULL,'2021-01-16 17:48:00','2021-01-18 20:12:05'),
	(10,17,12,'产品管理','fa-bars','items',NULL,'2021-01-16 18:50:44','2021-02-01 22:24:55'),
	(11,16,8,'采购订单管理','fa-bars','purchase-orders',NULL,'2021-01-16 18:50:55','2021-02-01 22:24:55'),
	(12,17,13,'产地管理','fa-bars','origins',NULL,'2021-01-17 01:09:15','2021-02-01 22:24:55'),
	(13,15,5,'客户发票','fa-bars','customer-invoices',NULL,'2021-01-17 13:18:43','2021-01-18 20:12:05'),
	(14,16,10,'供应商发票','fa-bars','supplier-invoices',NULL,'2021-01-17 13:19:18','2021-02-01 22:24:55'),
	(15,0,2,'客户','fa-users',NULL,NULL,'2021-01-17 14:21:56','2021-01-17 14:24:15'),
	(16,0,7,'供应商','fa-user',NULL,NULL,'2021-01-17 14:22:17','2021-02-01 22:24:55'),
	(17,0,11,'产品','fa-cubes',NULL,NULL,'2021-01-17 14:24:02','2021-02-01 22:24:55'),
	(18,15,3,'客户订单管理','fa-file-text','customer-orders',NULL,'2021-01-18 20:11:53','2021-01-18 20:12:05'),
	(19,0,14,'物流公司','fa-bars','logistics',NULL,'2021-01-18 21:39:03','2021-02-01 22:24:55'),
	(20,2,16,'配置管理','fa-toggle-on','config',NULL,'2021-01-20 19:13:48','2021-02-01 22:24:55'),
	(21,15,6,'客户付款记录','fa-cny','customer-payments',NULL,'2021-02-01 22:24:49','2021-02-01 22:24:55');

/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_operation_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_operation_log`;

CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`)
VALUES
	(1,1,'admin','GET','112.14.53.205','[]','2021-10-24 19:45:45','2021-10-24 19:45:45'),
	(2,1,'admin/customer-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:45:51','2021-10-24 19:45:51'),
	(3,1,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:45:52','2021-10-24 19:45:52'),
	(4,1,'admin/customer-invoices','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:45:57','2021-10-24 19:45:57'),
	(5,1,'admin/customer-payments','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:45:58','2021-10-24 19:45:58'),
	(6,1,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:45:59','2021-10-24 19:45:59'),
	(7,1,'admin/suppliers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:46:01','2021-10-24 19:46:01'),
	(8,1,'admin/supplier-invoices','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:46:05','2021-10-24 19:46:05'),
	(9,1,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:46:07','2021-10-24 19:46:07'),
	(10,1,'admin/origins','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:46:11','2021-10-24 19:46:11'),
	(11,1,'admin/logistics','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:46:14','2021-10-24 19:46:14'),
	(12,1,'admin/auth/users','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:46:19','2021-10-24 19:46:19'),
	(13,1,'admin/auth/users/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:46:22','2021-10-24 19:46:22'),
	(14,1,'admin/auth/users','POST','112.14.53.205','{\"username\":\"lixiaobo\",\"name\":\"\\u674e\\u603b\",\"password\":\"19891105\",\"password_confirmation\":\"19891105\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"9d6E6hRHYJBPJd4lP9zMI2ozT1NwMAQB2Yd3wsIV\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/auth\\/users\"}','2021-10-24 19:46:53','2021-10-24 19:46:53'),
	(15,1,'admin/auth/users','GET','112.14.53.205','[]','2021-10-24 19:46:54','2021-10-24 19:46:54'),
	(16,1,'admin/auth/users/1/edit','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:46:57','2021-10-24 19:46:57'),
	(17,1,'admin/auth/users/1','PUT','112.14.53.205','{\"username\":\"jinjialei\",\"name\":\"Administrator\",\"password\":\"Jjl18606520987\",\"password_confirmation\":\"Jjl18606520987\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"9d6E6hRHYJBPJd4lP9zMI2ozT1NwMAQB2Yd3wsIV\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/auth\\/users\"}','2021-10-24 19:47:16','2021-10-24 19:47:16'),
	(18,1,'admin/auth/users','GET','112.14.53.205','[]','2021-10-24 19:47:17','2021-10-24 19:47:17'),
	(19,1,'admin','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:47:21','2021-10-24 19:47:21'),
	(20,1,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:47:25','2021-10-24 19:47:25'),
	(21,1,'admin/customers/1/edit','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:47:28','2021-10-24 19:47:28'),
	(22,1,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:47:31','2021-10-24 19:47:31'),
	(23,1,'admin/customer-invoices','GET','112.14.53.205','{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}','2021-10-24 19:47:33','2021-10-24 19:47:33'),
	(24,1,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:47:35','2021-10-24 19:47:35'),
	(25,1,'admin/customers/1/edit','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:47:38','2021-10-24 19:47:38'),
	(26,1,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:47:46','2021-10-24 19:47:46'),
	(27,1,'admin/customer-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:49:00','2021-10-24 19:49:00'),
	(28,1,'admin/customer-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:49:04','2021-10-24 19:49:04'),
	(29,1,'admin/suppliers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:49:12','2021-10-24 19:49:12'),
	(30,1,'admin/suppliers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:50:02','2021-10-24 19:50:02'),
	(31,1,'admin/suppliers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:50:06','2021-10-24 19:50:06'),
	(32,1,'admin/suppliers/1/edit','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:50:12','2021-10-24 19:50:12'),
	(33,1,'admin/suppliers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:50:20','2021-10-24 19:50:20'),
	(34,1,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:50:44','2021-10-24 19:50:44'),
	(35,1,'admin/customers/1/edit','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:50:53','2021-10-24 19:50:53'),
	(36,1,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:50:55','2021-10-24 19:50:55'),
	(37,1,'admin','GET','112.14.53.205','[]','2021-10-24 19:51:08','2021-10-24 19:51:08'),
	(38,1,'admin/auth/logout','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:51:22','2021-10-24 19:51:22'),
	(39,2,'admin','GET','112.14.53.205','[]','2021-10-24 19:51:33','2021-10-24 19:51:33'),
	(40,2,'admin/customer-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:51:48','2021-10-24 19:51:48'),
	(41,2,'admin/customer-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:51:51','2021-10-24 19:51:51'),
	(42,2,'admin/api/payment-method','GET','112.14.53.205','[]','2021-10-24 19:51:52','2021-10-24 19:51:52'),
	(43,2,'admin/configs','GET','112.14.53.205','[]','2021-10-24 19:51:52','2021-10-24 19:51:52'),
	(44,2,'admin/api/customers','GET','112.14.53.205','[]','2021-10-24 19:51:52','2021-10-24 19:51:52'),
	(45,2,'admin/api/logistics','GET','112.14.53.205','[]','2021-10-24 19:51:52','2021-10-24 19:51:52'),
	(46,2,'admin/api/can-sales-items','GET','112.14.53.205','[]','2021-10-24 19:51:52','2021-10-24 19:51:52'),
	(47,2,'admin/suppliers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:52:14','2021-10-24 19:52:14'),
	(48,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 19:59:11','2021-10-24 19:59:11'),
	(49,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:00:41','2021-10-24 20:00:41'),
	(50,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:04:14','2021-10-24 20:04:14'),
	(51,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:05:02','2021-10-24 20:05:02'),
	(52,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:07:58','2021-10-24 20:07:58'),
	(53,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u676d\\u5dde\\u7eff\\u666e\\u5316\\u5de5\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330100773590305W\",\"address\":\"91330100773590305W\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-24 20:08:50','2021-10-24 20:08:50'),
	(54,2,'admin/customers','GET','112.14.53.205','[]','2021-10-24 20:08:50','2021-10-24 20:08:50'),
	(55,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:10:44','2021-10-24 20:10:44'),
	(56,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6606\\u5c71\\u534e\\u6797\\u5370\\u67d3\\u52a9\\u5242\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"9132058376240591XM\",\"address\":\"\\u6606\\u5c71\\u5e02\\u6dc0\\u5c71\\u6e56\\u9547\\u6c38\\u52e4\\u6751\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-24 20:11:09','2021-10-24 20:11:09'),
	(57,2,'admin/customers','GET','112.14.53.205','[]','2021-10-24 20:11:10','2021-10-24 20:11:10'),
	(58,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:11:40','2021-10-24 20:11:40'),
	(59,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e0a\\u6d77\\u5efa\\u98de\\u73af\\u4fdd\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"9131011656957181XN\",\"address\":\"\\u4e0a\\u6d77\\u5e02\\u91d1\\u5c71\\u533a\\u6f15\\u6cfe\\u9547\\u6caa\\u676d\\u516c\\u8def4619\\u53f73\\u5e62164\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-24 20:12:09','2021-10-24 20:12:09'),
	(60,2,'admin/customers','GET','112.14.53.205','[]','2021-10-24 20:12:09','2021-10-24 20:12:09'),
	(61,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:12:42','2021-10-24 20:12:42'),
	(62,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u911e\\u5dde\\u6052\\u8d1d\\u91d1\\u5c5e\\u8868\\u9762\\u5904\\u7406\\u5242\\u5382\",\"tax_number\":\"913302126620898090\",\"address\":\"\\u5b81\\u6ce2\\u5e02\\u911e\\u5dde\\u533a\\u4e94\\u4e61\\u9547\\u77f3\\u5c71\\u5f04\\u6751\\u51af\\u5bb6\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-24 20:13:12','2021-10-24 20:13:12'),
	(63,2,'admin/customers','GET','112.14.53.205','[]','2021-10-24 20:13:13','2021-10-24 20:13:13'),
	(64,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:13:49','2021-10-24 20:13:49'),
	(65,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u82f1\\u5c71\\u53bf\\u660c\\u6cf0\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91421124728329837L\",\"address\":\"\\u82f1\\u5c71\\u53bf\\u6e29\\u6cc9\\u9547\\u6e29\\u6cc9\\u8def113\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-24 20:14:11','2021-10-24 20:14:11'),
	(66,2,'admin/customers','GET','112.14.53.205','[]','2021-10-24 20:14:12','2021-10-24 20:14:12'),
	(67,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:16:04','2021-10-24 20:16:04'),
	(68,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6d59\\u6c5f\\u91d1\\u65b9\\u5b5a\\u73af\\u4fdd\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913302110538088987\",\"address\":\"913302110538088987\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-24 20:16:25','2021-10-24 20:16:25'),
	(69,2,'admin/customers','GET','112.14.53.205','[]','2021-10-24 20:16:26','2021-10-24 20:16:26'),
	(70,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:17:08','2021-10-24 20:17:08'),
	(71,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u6d77\\u66d9\\u7f8e\\u6d01\\u9632\\u8150\\u6750\\u6599\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330203681058522R\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u6d77\\u66d9\\u533a\\u65b0\\u5178\\u8def7\\u53f7-3\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-24 20:17:34','2021-10-24 20:17:34'),
	(72,2,'admin/customers','GET','112.14.53.205','[]','2021-10-24 20:17:34','2021-10-24 20:17:34'),
	(73,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:18:06','2021-10-24 20:18:06'),
	(74,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u7ecd\\u5174\\u6c47\\u4e3d\\u73af\\u4fdd\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330604609674830U\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u7ecd\\u5174\\u5e02\\u4e0a\\u865e\\u533a\\u6881\\u6e56\\u5de5\\u4e1a\\u56ed\\u533a\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-24 20:18:40','2021-10-24 20:18:40'),
	(75,2,'admin/customers','GET','112.14.53.205','[]','2021-10-24 20:18:40','2021-10-24 20:18:40'),
	(76,2,'admin/customer-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:18:54','2021-10-24 20:18:54'),
	(77,2,'admin/customer-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:19:38','2021-10-24 20:19:38'),
	(78,2,'admin/configs','GET','112.14.53.205','[]','2021-10-24 20:19:39','2021-10-24 20:19:39'),
	(79,2,'admin/api/customers','GET','112.14.53.205','[]','2021-10-24 20:19:39','2021-10-24 20:19:39'),
	(80,2,'admin/api/payment-method','GET','112.14.53.205','[]','2021-10-24 20:19:39','2021-10-24 20:19:39'),
	(81,2,'admin/api/can-sales-items','GET','112.14.53.205','[]','2021-10-24 20:19:39','2021-10-24 20:19:39'),
	(82,2,'admin/api/logistics','GET','112.14.53.205','[]','2021-10-24 20:19:39','2021-10-24 20:19:39'),
	(83,2,'admin/logistics','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:19:48','2021-10-24 20:19:48'),
	(84,2,'admin/logistics/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:19:51','2021-10-24 20:19:51'),
	(85,2,'admin/logistics','POST','112.14.53.205','{\"name\":\"\\u9ec4\\u91d1\\u7269\\u6d41\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/logistics\"}','2021-10-24 20:20:30','2021-10-24 20:20:30'),
	(86,2,'admin/logistics','GET','112.14.53.205','[]','2021-10-24 20:20:31','2021-10-24 20:20:31'),
	(87,2,'admin/customer-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:20:39','2021-10-24 20:20:39'),
	(88,2,'admin/customer-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:20:41','2021-10-24 20:20:41'),
	(89,2,'admin/configs','GET','112.14.53.205','[]','2021-10-24 20:20:42','2021-10-24 20:20:42'),
	(90,2,'admin/api/payment-method','GET','112.14.53.205','[]','2021-10-24 20:20:42','2021-10-24 20:20:42'),
	(91,2,'admin/api/logistics','GET','112.14.53.205','[]','2021-10-24 20:20:42','2021-10-24 20:20:42'),
	(92,2,'admin/api/customers','GET','112.14.53.205','[]','2021-10-24 20:20:42','2021-10-24 20:20:42'),
	(93,2,'admin/api/can-sales-items','GET','112.14.53.205','[]','2021-10-24 20:20:42','2021-10-24 20:20:42'),
	(94,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:22:18','2021-10-24 20:22:18'),
	(95,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:22:29','2021-10-24 20:22:29'),
	(96,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:22:29','2021-10-24 20:22:29'),
	(97,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:22:29','2021-10-24 20:22:29'),
	(98,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"1\",\"order_time\":\"2016-08-08\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"1\",\"quantity\":\"15\",\"unit_price\":\"2220\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:23:05','2021-10-24 20:23:05'),
	(99,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:23:06','2021-10-24 20:23:06'),
	(100,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:23:13','2021-10-24 20:23:13'),
	(101,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:23:14','2021-10-24 20:23:14'),
	(102,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:23:14','2021-10-24 20:23:14'),
	(103,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"2\",\"order_time\":\"2016-08-04\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"2\",\"quantity\":\"2\",\"unit_price\":\"135\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:24:19','2021-10-24 20:24:19'),
	(104,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:24:21','2021-10-24 20:24:21'),
	(105,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:24:24','2021-10-24 20:24:24'),
	(106,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:24:25','2021-10-24 20:24:25'),
	(107,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:24:25','2021-10-24 20:24:25'),
	(108,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"3\",\"order_time\":\"2016-08-04\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"3\",\"quantity\":\"1\",\"unit_price\":\"2088\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:25:04','2021-10-24 20:25:04'),
	(109,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:25:05','2021-10-24 20:25:05'),
	(110,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:25:08','2021-10-24 20:25:08'),
	(111,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:25:09','2021-10-24 20:25:09'),
	(112,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:25:09','2021-10-24 20:25:09'),
	(113,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"4\",\"order_time\":\"2016-08-12\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"4\",\"quantity\":\"1\",\"unit_price\":\"2902.5\",\"remark\":null,\"deleted\":false},{\"id\":\"l-2\",\"item_id\":\"5\",\"quantity\":\"1\",\"unit_price\":\"1800\",\"remark\":null,\"deleted\":false},{\"id\":\"l-3\",\"item_id\":null,\"quantity\":1,\"unit_price\":0,\"remark\":null,\"deleted\":true}]}','2021-10-24 20:26:22','2021-10-24 20:26:22'),
	(114,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:26:29','2021-10-24 20:26:29'),
	(115,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:26:32','2021-10-24 20:26:32'),
	(116,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:26:32','2021-10-24 20:26:32'),
	(117,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:26:32','2021-10-24 20:26:32'),
	(118,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"5\",\"order_time\":\"2016-08-12\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"6\",\"quantity\":\"1\",\"unit_price\":\"2420\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:27:00','2021-10-24 20:27:00'),
	(119,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:27:04','2021-10-24 20:27:04'),
	(120,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:27:06','2021-10-24 20:27:06'),
	(121,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:27:07','2021-10-24 20:27:07'),
	(122,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:27:07','2021-10-24 20:27:07'),
	(123,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"6\",\"order_time\":null,\"items\":[{\"id\":\"l-1\",\"item_id\":\"7\",\"quantity\":\"1\",\"unit_price\":\"3600\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:27:32','2021-10-24 20:27:32'),
	(124,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"6\",\"order_time\":\"2016-08-12\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"7\",\"quantity\":\"1\",\"unit_price\":\"3600\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:27:41','2021-10-24 20:27:41'),
	(125,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:27:43','2021-10-24 20:27:43'),
	(126,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:27:45','2021-10-24 20:27:45'),
	(127,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:27:46','2021-10-24 20:27:46'),
	(128,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:27:46','2021-10-24 20:27:46'),
	(129,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"7\",\"order_time\":\"2016-09-05\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"8\",\"quantity\":\"2\",\"unit_price\":\"2250\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:28:36','2021-10-24 20:28:36'),
	(130,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:28:37','2021-10-24 20:28:37'),
	(131,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:28:40','2021-10-24 20:28:40'),
	(132,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:28:40','2021-10-24 20:28:40'),
	(133,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:28:40','2021-10-24 20:28:40'),
	(134,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"8\",\"order_time\":\"2016-09-07\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"9\",\"quantity\":\"2\",\"unit_price\":\"2300\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:29:14','2021-10-24 20:29:14'),
	(135,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:29:15','2021-10-24 20:29:15'),
	(136,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:29:21','2021-10-24 20:29:21'),
	(137,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:29:22','2021-10-24 20:29:22'),
	(138,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:29:22','2021-10-24 20:29:22'),
	(139,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"3\",\"order_time\":\"2016-09-12\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"3\",\"quantity\":\"1\",\"unit_price\":\"2304\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:29:44','2021-10-24 20:29:44'),
	(140,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:29:45','2021-10-24 20:29:45'),
	(141,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:29:47','2021-10-24 20:29:47'),
	(142,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:29:48','2021-10-24 20:29:48'),
	(143,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:29:48','2021-10-24 20:29:48'),
	(144,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"9\",\"order_time\":\"2016-09-13\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"10\",\"quantity\":\"1\",\"unit_price\":\"2614.03\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:30:49','2021-10-24 20:30:49'),
	(145,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:30:50','2021-10-24 20:30:50'),
	(146,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:30:56','2021-10-24 20:30:56'),
	(147,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:30:56','2021-10-24 20:30:56'),
	(148,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:30:56','2021-10-24 20:30:56'),
	(149,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 20:31:53','2021-10-24 20:31:53'),
	(150,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:31:58','2021-10-24 20:31:58'),
	(151,2,'admin/origins','GET','112.14.53.205','[]','2021-10-24 20:32:25','2021-10-24 20:32:25'),
	(152,2,'admin/origins/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:32:28','2021-10-24 20:32:28'),
	(153,2,'admin/origins','POST','112.14.53.205','{\"name\":\"\\u5409\\u6797\\u77f3\\u5316\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/origins\"}','2021-10-24 20:32:40','2021-10-24 20:32:40'),
	(154,2,'admin/origins','GET','112.14.53.205','[]','2021-10-24 20:32:40','2021-10-24 20:32:40'),
	(155,2,'admin/origins/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:32:42','2021-10-24 20:32:42'),
	(156,2,'admin/origins','POST','112.14.53.205','{\"name\":\"\\u5fb7\\u56fd\\u5df4\\u65af\\u592b\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/origins\"}','2021-10-24 20:32:47','2021-10-24 20:32:47'),
	(157,2,'admin/origins','GET','112.14.53.205','[]','2021-10-24 20:32:47','2021-10-24 20:32:47'),
	(158,2,'admin/origins/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:32:58','2021-10-24 20:32:58'),
	(159,2,'admin/origins','POST','112.14.53.205','{\"name\":\"\\u58a8\\u897f\\u54e5\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/origins\"}','2021-10-24 20:33:03','2021-10-24 20:33:03'),
	(160,2,'admin/origins','GET','112.14.53.205','[]','2021-10-24 20:33:03','2021-10-24 20:33:03'),
	(161,2,'admin/origins/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:33:09','2021-10-24 20:33:09'),
	(162,2,'admin/origins','POST','112.14.53.205','{\"name\":\"\\u58f3\\u724c\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/origins\"}','2021-10-24 20:33:14','2021-10-24 20:33:14'),
	(163,2,'admin/origins','GET','112.14.53.205','[]','2021-10-24 20:33:14','2021-10-24 20:33:14'),
	(164,2,'admin/origins/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:33:31','2021-10-24 20:33:31'),
	(165,2,'admin/origins','POST','112.14.53.205','{\"name\":\"\\u6cf0\\u56fd\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/origins\"}','2021-10-24 20:33:35','2021-10-24 20:33:35'),
	(166,2,'admin/origins','GET','112.14.53.205','[]','2021-10-24 20:33:35','2021-10-24 20:33:35'),
	(167,2,'admin/origins/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:33:44','2021-10-24 20:33:44'),
	(168,2,'admin/origins','POST','112.14.53.205','{\"name\":\"\\u5c71\\u4e1c\\u897f\\u738b\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/origins\"}','2021-10-24 20:33:50','2021-10-24 20:33:50'),
	(169,2,'admin/origins','GET','112.14.53.205','[]','2021-10-24 20:33:50','2021-10-24 20:33:50'),
	(170,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 20:34:21','2021-10-24 20:34:21'),
	(171,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:34:23','2021-10-24 20:34:23'),
	(172,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"15\",\"name\":\"NP10\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 20:34:37','2021-10-24 20:34:37'),
	(173,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 20:34:37','2021-10-24 20:34:37'),
	(174,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:34:45','2021-10-24 20:34:45'),
	(175,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"16\",\"name\":\"\\u4e8c\\u4e59\\u9187\\u80fa\",\"search_name\":null,\"weight\":\"215\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 20:35:38','2021-10-24 20:35:38'),
	(176,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 20:35:39','2021-10-24 20:35:39'),
	(177,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 20:36:12','2021-10-24 20:36:12'),
	(178,2,'admin/purchase-orders/create','GET','112.14.53.205','[]','2021-10-24 20:37:20','2021-10-24 20:37:20'),
	(179,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:37:21','2021-10-24 20:37:21'),
	(180,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:37:21','2021-10-24 20:37:21'),
	(181,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"10\",\"order_time\":\"2016-09-13\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"11\",\"quantity\":\"5\",\"unit_price\":\"2560\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:40:55','2021-10-24 20:40:55'),
	(182,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:41:01','2021-10-24 20:41:01'),
	(183,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:41:04','2021-10-24 20:41:04'),
	(184,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:41:05','2021-10-24 20:41:05'),
	(185,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:41:05','2021-10-24 20:41:05'),
	(186,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"6\",\"order_time\":\"2016-09-19\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"7\",\"quantity\":\"1\",\"unit_price\":\"3600\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:42:16','2021-10-24 20:42:16'),
	(187,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:42:18','2021-10-24 20:42:18'),
	(188,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:42:20','2021-10-24 20:42:20'),
	(189,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:42:21','2021-10-24 20:42:21'),
	(190,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:42:21','2021-10-24 20:42:21'),
	(191,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"5\",\"order_time\":\"2016-09-09\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"6\",\"quantity\":\"1\",\"unit_price\":\"2420\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:42:57','2021-10-24 20:42:57'),
	(192,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:42:59','2021-10-24 20:42:59'),
	(193,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:43:01','2021-10-24 20:43:01'),
	(194,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:43:02','2021-10-24 20:43:02'),
	(195,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:43:02','2021-10-24 20:43:02'),
	(196,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"4\",\"order_time\":\"2016-09-19\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"4\",\"quantity\":\"1\",\"unit_price\":\"2859.5\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:43:43','2021-10-24 20:43:43'),
	(197,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:43:44','2021-10-24 20:43:44'),
	(198,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:44:25','2021-10-24 20:44:25'),
	(199,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:44:26','2021-10-24 20:44:26'),
	(200,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:44:26','2021-10-24 20:44:26'),
	(201,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:44:55','2021-10-24 20:44:55'),
	(202,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:44:59','2021-10-24 20:44:59'),
	(203,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:44:59','2021-10-24 20:44:59'),
	(204,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:44:59','2021-10-24 20:44:59'),
	(205,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"11\",\"order_time\":\"2016-09-20\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"2\",\"quantity\":\"40\",\"unit_price\":\"135\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:45:53','2021-10-24 20:45:53'),
	(206,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:45:54','2021-10-24 20:45:54'),
	(207,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:45:56','2021-10-24 20:45:56'),
	(208,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:45:57','2021-10-24 20:45:57'),
	(209,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:45:57','2021-10-24 20:45:57'),
	(210,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"12\",\"order_time\":\"2016-09-22\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"12\",\"quantity\":\"1\",\"unit_price\":\"2142.5\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:46:35','2021-10-24 20:46:35'),
	(211,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:46:36','2021-10-24 20:46:36'),
	(212,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:46:42','2021-10-24 20:46:42'),
	(213,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:46:43','2021-10-24 20:46:43'),
	(214,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:46:43','2021-10-24 20:46:43'),
	(215,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:47:19','2021-10-24 20:47:19'),
	(216,2,'admin/origins','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:47:27','2021-10-24 20:47:27'),
	(217,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:47:29','2021-10-24 20:47:29'),
	(218,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:47:31','2021-10-24 20:47:31'),
	(219,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"1\",\"name\":\"\\u4e09\\u4e59\\u9187\\u80fa\",\"search_name\":null,\"weight\":\"215\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 20:47:59','2021-10-24 20:47:59'),
	(220,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 20:47:59','2021-10-24 20:47:59'),
	(221,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:48:11','2021-10-24 20:48:11'),
	(222,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:48:13','2021-10-24 20:48:13'),
	(223,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:48:14','2021-10-24 20:48:14'),
	(224,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:48:14','2021-10-24 20:48:14'),
	(225,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"9\",\"order_time\":\"2016-09-27\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"13\",\"quantity\":\"15\",\"unit_price\":\"2074.75\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:49:03','2021-10-24 20:49:03'),
	(226,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:49:04','2021-10-24 20:49:04'),
	(227,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:49:07','2021-10-24 20:49:07'),
	(228,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:49:07','2021-10-24 20:49:07'),
	(229,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:49:07','2021-10-24 20:49:07'),
	(230,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:49:32','2021-10-24 20:49:32'),
	(231,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:49:34','2021-10-24 20:49:34'),
	(232,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"8\",\"name\":\"AEO9\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 20:49:52','2021-10-24 20:49:52'),
	(233,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 20:49:52','2021-10-24 20:49:52'),
	(234,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:49:56','2021-10-24 20:49:56'),
	(235,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"8\",\"name\":\"PEG600\",\"search_name\":null,\"weight\":\"220\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 20:50:20','2021-10-24 20:50:20'),
	(236,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 20:50:20','2021-10-24 20:50:20'),
	(237,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:50:27','2021-10-24 20:50:27'),
	(238,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"17\",\"name\":\"\\u4e8c\\u4e59\\u9187\\u80fa\",\"search_name\":null,\"weight\":\"230\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 20:51:25','2021-10-24 20:51:25'),
	(239,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 20:51:25','2021-10-24 20:51:25'),
	(240,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:51:30','2021-10-24 20:51:30'),
	(241,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:51:39','2021-10-24 20:51:39'),
	(242,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:51:39','2021-10-24 20:51:39'),
	(243,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:51:39','2021-10-24 20:51:39'),
	(244,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"3\",\"order_time\":\"2016-09-28\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"14\",\"quantity\":\"6\",\"unit_price\":\"2520\",\"remark\":null,\"deleted\":false}]}','2021-10-24 20:52:22','2021-10-24 20:52:22'),
	(245,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 20:52:23','2021-10-24 20:52:23'),
	(246,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:52:27','2021-10-24 20:52:27'),
	(247,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:52:27','2021-10-24 20:52:27'),
	(248,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:52:27','2021-10-24 20:52:27'),
	(249,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 20:52:50','2021-10-24 20:52:50'),
	(250,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:52:53','2021-10-24 20:52:53'),
	(251,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"10\",\"name\":\"NP10\",\"search_name\":null,\"weight\":\"215\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 20:53:32','2021-10-24 20:53:32'),
	(252,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 20:53:33','2021-10-24 20:53:33'),
	(253,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:53:52','2021-10-24 20:53:52'),
	(254,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"18\",\"name\":\"AEO9\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 20:54:24','2021-10-24 20:54:24'),
	(255,2,'admin/items/create','GET','112.14.53.205','[]','2021-10-24 20:54:24','2021-10-24 20:54:24'),
	(256,2,'admin/purchase-orders/create','GET','112.14.53.205','[]','2021-10-24 20:54:52','2021-10-24 20:54:52'),
	(257,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 20:54:54','2021-10-24 20:54:54'),
	(258,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 20:54:54','2021-10-24 20:54:54'),
	(259,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:56:05','2021-10-24 20:56:05'),
	(260,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:56:07','2021-10-24 20:56:07'),
	(261,2,'admin/items/create','GET','112.14.53.205','[]','2021-10-24 20:58:46','2021-10-24 20:58:46'),
	(262,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"18\",\"name\":\"AEO9\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\"}','2021-10-24 20:59:12','2021-10-24 20:59:12'),
	(263,2,'admin/items/create','GET','112.14.53.205','[]','2021-10-24 20:59:12','2021-10-24 20:59:12'),
	(264,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"18\",\"name\":\"AEO9\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\"}','2021-10-24 20:59:17','2021-10-24 20:59:17'),
	(265,2,'admin/items/create','GET','112.14.53.205','[]','2021-10-24 20:59:17','2021-10-24 20:59:17'),
	(266,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"18\",\"name\":\"AEO9\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\"}','2021-10-24 20:59:25','2021-10-24 20:59:25'),
	(267,2,'admin/items/create','GET','112.14.53.205','[]','2021-10-24 20:59:26','2021-10-24 20:59:26'),
	(268,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:59:34','2021-10-24 20:59:34'),
	(269,2,'admin/origins','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:59:51','2021-10-24 20:59:51'),
	(270,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:59:54','2021-10-24 20:59:54'),
	(271,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 20:59:56','2021-10-24 20:59:56'),
	(272,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"18\",\"name\":\"AEO9\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:00:21','2021-10-24 21:00:21'),
	(273,2,'admin/items/create','GET','112.14.53.205','[]','2021-10-24 21:00:22','2021-10-24 21:00:22'),
	(274,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"18\",\"name\":\"AEO9\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\"}','2021-10-24 21:00:35','2021-10-24 21:00:35'),
	(275,2,'admin/items/create','GET','112.14.53.205','[]','2021-10-24 21:00:36','2021-10-24 21:00:36'),
	(276,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"18\",\"name\":\"AEO9\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\"}','2021-10-24 21:00:42','2021-10-24 21:00:42'),
	(277,2,'admin/items/create','GET','112.14.53.205','[]','2021-10-24 21:00:42','2021-10-24 21:00:42'),
	(278,2,'admin/items/create','GET','112.14.53.205','[]','2021-10-24 21:02:57','2021-10-24 21:02:57'),
	(279,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"18\",\"name\":\"AEO9\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\"}','2021-10-24 21:03:06','2021-10-24 21:03:06'),
	(280,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:03:06','2021-10-24 21:03:06'),
	(281,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:03:26','2021-10-24 21:03:26'),
	(282,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:03:30','2021-10-24 21:03:30'),
	(283,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:03:31','2021-10-24 21:03:31'),
	(284,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:03:31','2021-10-24 21:03:31'),
	(285,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"4\",\"order_time\":\"2016-09-30\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"17\",\"quantity\":\"5\",\"unit_price\":\"2773.5\",\"remark\":null,\"deleted\":false},{\"id\":\"l-2\",\"item_id\":\"18\",\"quantity\":\"5\",\"unit_price\":\"2600\",\"remark\":null,\"deleted\":false},{\"id\":\"l-3\",\"item_id\":\"15\",\"quantity\":\"3\",\"unit_price\":\"2046\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:04:56','2021-10-24 21:04:56'),
	(286,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:04:57','2021-10-24 21:04:57'),
	(287,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:05:01','2021-10-24 21:05:01'),
	(288,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:05:02','2021-10-24 21:05:02'),
	(289,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:05:02','2021-10-24 21:05:02'),
	(290,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"13\",\"order_time\":\"2016-09-30\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"16\",\"quantity\":\"5\",\"unit_price\":\"2185\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:05:43','2021-10-24 21:05:43'),
	(291,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:05:44','2021-10-24 21:05:44'),
	(292,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:05:47','2021-10-24 21:05:47'),
	(293,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:05:47','2021-10-24 21:05:47'),
	(294,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:05:47','2021-10-24 21:05:47'),
	(295,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"3\",\"order_time\":\"2016-10-08\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"3\",\"quantity\":\"1\",\"unit_price\":\"2394\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:06:13','2021-10-24 21:06:13'),
	(296,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:06:15','2021-10-24 21:06:15'),
	(297,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:06:19','2021-10-24 21:06:19'),
	(298,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:06:20','2021-10-24 21:06:20'),
	(299,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:06:20','2021-10-24 21:06:20'),
	(300,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:08:24','2021-10-24 21:08:24'),
	(301,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:08:26','2021-10-24 21:08:26'),
	(302,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"11\",\"name\":\"\\u4e8c\\u4e59\\u4e8c\\u9187\\u4e01\\u919a\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:08:48','2021-10-24 21:08:48'),
	(303,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:08:48','2021-10-24 21:08:48'),
	(304,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:08:52','2021-10-24 21:08:52'),
	(305,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:08:53','2021-10-24 21:08:53'),
	(306,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:08:54','2021-10-24 21:08:54'),
	(307,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:08:54','2021-10-24 21:08:54'),
	(308,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"14\",\"order_time\":\"2016-10-10\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"19\",\"quantity\":\"10\",\"unit_price\":\"2700\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:09:24','2021-10-24 21:09:24'),
	(309,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:09:26','2021-10-24 21:09:26'),
	(310,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:09:28','2021-10-24 21:09:28'),
	(311,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:09:29','2021-10-24 21:09:29'),
	(312,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:09:29','2021-10-24 21:09:29'),
	(313,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"1\",\"order_time\":\"2016-10-10\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"1\",\"quantity\":\"15\",\"unit_price\":\"2180\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:09:58','2021-10-24 21:09:58'),
	(314,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:10:00','2021-10-24 21:10:00'),
	(315,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:10:02','2021-10-24 21:10:02'),
	(316,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:10:03','2021-10-24 21:10:03'),
	(317,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:10:03','2021-10-24 21:10:03'),
	(318,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:10:38','2021-10-24 21:10:38'),
	(319,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:10:40','2021-10-24 21:10:40'),
	(320,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"11\",\"name\":\"EDTA\\u4e8c\\u94a0\",\"search_name\":null,\"weight\":\"25\",\"unit\":\"\\u5305\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:10:57','2021-10-24 21:10:57'),
	(321,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:10:58','2021-10-24 21:10:58'),
	(322,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:11:09','2021-10-24 21:11:09'),
	(323,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:11:10','2021-10-24 21:11:10'),
	(324,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:11:11','2021-10-24 21:11:11'),
	(325,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:11:11','2021-10-24 21:11:11'),
	(326,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"15\",\"order_time\":\"2016-10-08\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"20\",\"quantity\":\"10\",\"unit_price\":\"425\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:11:42','2021-10-24 21:11:42'),
	(327,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:11:43','2021-10-24 21:11:43'),
	(328,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:11:45','2021-10-24 21:11:45'),
	(329,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:11:46','2021-10-24 21:11:46'),
	(330,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:11:46','2021-10-24 21:11:46'),
	(331,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"4\",\"order_time\":\"2016-10-17\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"17\",\"quantity\":\"1\",\"unit_price\":\"2773.5\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:12:27','2021-10-24 21:12:27'),
	(332,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:12:29','2021-10-24 21:12:29'),
	(333,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:12:31','2021-10-24 21:12:31'),
	(334,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:12:32','2021-10-24 21:12:32'),
	(335,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:12:32','2021-10-24 21:12:32'),
	(336,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:13:02','2021-10-24 21:13:02'),
	(337,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:13:03','2021-10-24 21:13:03'),
	(338,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"19\",\"name\":\"\\u4e09\\u4e59\\u9187\\u80fa\",\"search_name\":null,\"weight\":\"220\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:13:21','2021-10-24 21:13:21'),
	(339,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:13:21','2021-10-24 21:13:21'),
	(340,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:13:26','2021-10-24 21:13:26'),
	(341,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:13:37','2021-10-24 21:13:37'),
	(342,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:13:38','2021-10-24 21:13:38'),
	(343,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:13:38','2021-10-24 21:13:38'),
	(344,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"9\",\"order_time\":\"2016-10-18\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"21\",\"quantity\":\"15\",\"unit_price\":\"2068\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:14:16','2021-10-24 21:14:16'),
	(345,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:14:17','2021-10-24 21:14:17'),
	(346,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:14:34','2021-10-24 21:14:34'),
	(347,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:14:36','2021-10-24 21:14:36'),
	(348,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"20\",\"name\":\"\\u8461\\u8404\\u7cd6\\u9178\\u94a0\",\"search_name\":null,\"weight\":\"25\",\"unit\":\"\\u5305\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:14:53','2021-10-24 21:14:53'),
	(349,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:14:54','2021-10-24 21:14:54'),
	(350,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:14:56','2021-10-24 21:14:56'),
	(351,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:14:58','2021-10-24 21:14:58'),
	(352,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"6\",\"name\":\"\\u5f02\\u6784\\u9187\\u919a1309\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:15:37','2021-10-24 21:15:37'),
	(353,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:15:37','2021-10-24 21:15:37'),
	(354,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:15:39','2021-10-24 21:15:39'),
	(355,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"6\",\"name\":\"\\u5f02\\u6784\\u9187\\u919a1308\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:15:59','2021-10-24 21:15:59'),
	(356,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:15:59','2021-10-24 21:15:59'),
	(357,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:16:01','2021-10-24 21:16:01'),
	(358,2,'admin/origins','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:16:09','2021-10-24 21:16:09'),
	(359,2,'admin/origins/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:16:11','2021-10-24 21:16:11'),
	(360,2,'admin/origins','POST','112.14.53.205','{\"name\":\"\\u4e2d\\u8f7b\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/origins\"}','2021-10-24 21:16:19','2021-10-24 21:16:19'),
	(361,2,'admin/origins','GET','112.14.53.205','[]','2021-10-24 21:16:19','2021-10-24 21:16:19'),
	(362,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:16:22','2021-10-24 21:16:22'),
	(363,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:16:23','2021-10-24 21:16:23'),
	(364,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"21\",\"name\":\"AES\",\"search_name\":null,\"weight\":\"170\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:16:36','2021-10-24 21:16:36'),
	(365,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:16:37','2021-10-24 21:16:37'),
	(366,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:16:43','2021-10-24 21:16:43'),
	(367,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"14\",\"name\":\"\\u4e8c\\u4e59\\u9187\\u80fa\",\"search_name\":null,\"weight\":\"228.61\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:17:03','2021-10-24 21:17:03'),
	(368,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:17:03','2021-10-24 21:17:03'),
	(369,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:17:07','2021-10-24 21:17:07'),
	(370,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:17:14','2021-10-24 21:17:14'),
	(371,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:17:15','2021-10-24 21:17:15'),
	(372,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:17:15','2021-10-24 21:17:15'),
	(373,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"11\",\"order_time\":\"2016-10-19\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"22\",\"quantity\":\"40\",\"unit_price\":\"92.5\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:17:42','2021-10-24 21:17:42'),
	(374,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:17:43','2021-10-24 21:17:43'),
	(375,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:17:45','2021-10-24 21:17:45'),
	(376,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:17:46','2021-10-24 21:17:46'),
	(377,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:17:46','2021-10-24 21:17:46'),
	(378,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"1\",\"order_time\":\"2016-10-19\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"23\",\"quantity\":\"1\",\"unit_price\":\"3100\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:18:15','2021-10-24 21:18:15'),
	(379,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:18:17','2021-10-24 21:18:17'),
	(380,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:18:19','2021-10-24 21:18:19'),
	(381,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:18:20','2021-10-24 21:18:20'),
	(382,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:18:20','2021-10-24 21:18:20'),
	(383,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"3\",\"order_time\":\"2016-10-21\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"17\",\"quantity\":\"1\",\"unit_price\":\"2752\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:18:49','2021-10-24 21:18:49'),
	(384,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:18:51','2021-10-24 21:18:51'),
	(385,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:18:52','2021-10-24 21:18:52'),
	(386,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:18:53','2021-10-24 21:18:53'),
	(387,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:18:53','2021-10-24 21:18:53'),
	(388,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"1\",\"order_time\":\"2016-10-21\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"24\",\"quantity\":\"1\",\"unit_price\":\"3200\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:19:19','2021-10-24 21:19:19'),
	(389,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:19:21','2021-10-24 21:19:21'),
	(390,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:19:25','2021-10-24 21:19:25'),
	(391,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:19:25','2021-10-24 21:19:25'),
	(392,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:19:25','2021-10-24 21:19:25'),
	(393,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:19:45','2021-10-24 21:19:45'),
	(394,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:19:47','2021-10-24 21:19:47'),
	(395,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"7\",\"name\":\"\\u67e0\\u6aac\\u9178\",\"search_name\":null,\"weight\":\"25\",\"unit\":\"\\u5305\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:20:04','2021-10-24 21:20:04'),
	(396,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:20:05','2021-10-24 21:20:05'),
	(397,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:20:09','2021-10-24 21:20:09'),
	(398,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:20:11','2021-10-24 21:20:11'),
	(399,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:20:12','2021-10-24 21:20:12'),
	(400,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:20:12','2021-10-24 21:20:12'),
	(401,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"2\",\"order_time\":\"2016-10-21\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"27\",\"quantity\":\"40\",\"unit_price\":\"138.75\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:20:42','2021-10-24 21:20:42'),
	(402,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:20:43','2021-10-24 21:20:43'),
	(403,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:20:45','2021-10-24 21:20:45'),
	(404,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:20:46','2021-10-24 21:20:46'),
	(405,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:20:46','2021-10-24 21:20:46'),
	(406,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"11\",\"order_time\":null,\"items\":[{\"id\":\"l-1\",\"item_id\":\"22\",\"quantity\":\"120\",\"unit_price\":\"90\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:21:14','2021-10-24 21:21:14'),
	(407,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"11\",\"order_time\":\"2016-10-21\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"22\",\"quantity\":\"120\",\"unit_price\":\"90\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:21:26','2021-10-24 21:21:26'),
	(408,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:21:28','2021-10-24 21:21:28'),
	(409,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:21:31','2021-10-24 21:21:31'),
	(410,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:21:32','2021-10-24 21:21:32'),
	(411,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:21:32','2021-10-24 21:21:32'),
	(412,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"16\",\"order_time\":\"2016-10-21\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"25\",\"quantity\":\"1\",\"unit_price\":\"1870\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:21:57','2021-10-24 21:21:57'),
	(413,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:21:59','2021-10-24 21:21:59'),
	(414,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:22:01','2021-10-24 21:22:01'),
	(415,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:22:01','2021-10-24 21:22:01'),
	(416,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:22:01','2021-10-24 21:22:01'),
	(417,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"10\",\"order_time\":\"2016-10-25\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"17\",\"quantity\":\"2\",\"unit_price\":\"2687.5\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:22:37','2021-10-24 21:22:37'),
	(418,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:22:39','2021-10-24 21:22:39'),
	(419,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:22:41','2021-10-24 21:22:41'),
	(420,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:22:41','2021-10-24 21:22:41'),
	(421,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:22:41','2021-10-24 21:22:41'),
	(422,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"6\",\"order_time\":\"2016-10-25\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"7\",\"quantity\":\"1\",\"unit_price\":\"3600\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:23:10','2021-10-24 21:23:10'),
	(423,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:23:12','2021-10-24 21:23:12'),
	(424,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:23:13','2021-10-24 21:23:13'),
	(425,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:23:14','2021-10-24 21:23:14'),
	(426,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:23:14','2021-10-24 21:23:14'),
	(427,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"13\",\"order_time\":\"2021-10-28\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"26\",\"quantity\":1,\"unit_price\":\"2286.1\",\"remark\":null,\"deleted\":false},{\"id\":\"l-2\",\"item_id\":\"8\",\"quantity\":\"2\",\"unit_price\":\"2565\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:24:38','2021-10-24 21:24:38'),
	(428,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:24:44','2021-10-24 21:24:44'),
	(429,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:24:46','2021-10-24 21:24:46'),
	(430,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:24:47','2021-10-24 21:24:47'),
	(431,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:24:47','2021-10-24 21:24:47'),
	(432,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"1\",\"order_time\":\"2016-10-28\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"23\",\"quantity\":\"1\",\"unit_price\":\"3300\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:25:09','2021-10-24 21:25:09'),
	(433,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:25:10','2021-10-24 21:25:10'),
	(434,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:26:46','2021-10-24 21:26:46'),
	(435,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:26:46','2021-10-24 21:26:46'),
	(436,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:26:46','2021-10-24 21:26:46'),
	(437,2,'admin/purchase-orders/create','GET','112.14.53.205','[]','2021-10-24 21:26:56','2021-10-24 21:26:56'),
	(438,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:26:59','2021-10-24 21:26:59'),
	(439,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:26:59','2021-10-24 21:26:59'),
	(440,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"3\",\"order_time\":\"2016-10-28\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"3\",\"quantity\":\"1\",\"unit_price\":\"2394\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:27:26','2021-10-24 21:27:26'),
	(441,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:27:28','2021-10-24 21:27:28'),
	(442,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:27:30','2021-10-24 21:27:30'),
	(443,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:27:31','2021-10-24 21:27:31'),
	(444,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:27:31','2021-10-24 21:27:31'),
	(445,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"10\",\"order_time\":\"2016-11-02\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"17\",\"quantity\":\"5\",\"unit_price\":\"2666\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:28:31','2021-10-24 21:28:31'),
	(446,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:28:32','2021-10-24 21:28:32'),
	(447,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:28:36','2021-10-24 21:28:36'),
	(448,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:28:36','2021-10-24 21:28:36'),
	(449,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:28:36','2021-10-24 21:28:36'),
	(450,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:29:05','2021-10-24 21:29:05'),
	(451,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:29:07','2021-10-24 21:29:07'),
	(452,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"17\",\"name\":\"\\u4e09\\u4e59\\u9187\\u80fa\",\"search_name\":null,\"weight\":\"230\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:29:25','2021-10-24 21:29:25'),
	(453,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:29:25','2021-10-24 21:29:25'),
	(454,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:29:29','2021-10-24 21:29:29'),
	(455,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:29:32','2021-10-24 21:29:32'),
	(456,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:29:32','2021-10-24 21:29:32'),
	(457,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:29:32','2021-10-24 21:29:32'),
	(458,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"9\",\"order_time\":\"2016-11-02\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"28\",\"quantity\":\"5\",\"unit_price\":\"2438\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:30:01','2021-10-24 21:30:01'),
	(459,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:30:02','2021-10-24 21:30:02'),
	(460,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:30:05','2021-10-24 21:30:05'),
	(461,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:30:06','2021-10-24 21:30:06'),
	(462,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:30:06','2021-10-24 21:30:06'),
	(463,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:30:31','2021-10-24 21:30:31'),
	(464,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:30:33','2021-10-24 21:30:33'),
	(465,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"11\",\"name\":\"\\u4e59\\u4e8c\\u9187\\u4e01\\u919a\",\"search_name\":null,\"weight\":\"186\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:30:50','2021-10-24 21:30:50'),
	(466,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:30:50','2021-10-24 21:30:50'),
	(467,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:30:54','2021-10-24 21:30:54'),
	(468,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:30:55','2021-10-24 21:30:55'),
	(469,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:30:56','2021-10-24 21:30:56'),
	(470,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:30:56','2021-10-24 21:30:56'),
	(471,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"17\",\"order_time\":\"2016-11-07\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"29\",\"quantity\":1,\"unit_price\":\"2146\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:31:16','2021-10-24 21:31:16'),
	(472,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:31:18','2021-10-24 21:31:18'),
	(473,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:31:24','2021-10-24 21:31:24'),
	(474,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:31:25','2021-10-24 21:31:25'),
	(475,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:31:25','2021-10-24 21:31:25'),
	(476,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:31:40','2021-10-24 21:31:40'),
	(477,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:31:42','2021-10-24 21:31:42'),
	(478,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"21\",\"name\":\"AOS\",\"search_name\":null,\"weight\":\"25\",\"unit\":\"\\u5305\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:32:11','2021-10-24 21:32:11'),
	(479,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:32:12','2021-10-24 21:32:12'),
	(480,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:32:25','2021-10-24 21:32:25'),
	(481,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:32:26','2021-10-24 21:32:26'),
	(482,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:32:27','2021-10-24 21:32:27'),
	(483,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:32:27','2021-10-24 21:32:27'),
	(484,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"16\",\"order_time\":\"2021-11-07\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"30\",\"quantity\":\"20\",\"unit_price\":\"327.5\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:33:13','2021-10-24 21:33:13'),
	(485,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:33:14','2021-10-24 21:33:14'),
	(486,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:33:19','2021-10-24 21:33:19'),
	(487,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:33:19','2021-10-24 21:33:19'),
	(488,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:33:19','2021-10-24 21:33:19'),
	(489,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"4\",\"order_time\":\"2016-11-08\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"4\",\"quantity\":\"1\",\"unit_price\":\"2795\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:33:57','2021-10-24 21:33:57'),
	(490,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:34:00','2021-10-24 21:34:00'),
	(491,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:34:18','2021-10-24 21:34:18'),
	(492,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:34:18','2021-10-24 21:34:18'),
	(493,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:34:18','2021-10-24 21:34:18'),
	(494,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"5\",\"order_time\":\"2016-11-08\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"6\",\"quantity\":\"1\",\"unit_price\":\"2596\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:34:52','2021-10-24 21:34:52'),
	(495,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:34:53','2021-10-24 21:34:53'),
	(496,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:34:55','2021-10-24 21:34:55'),
	(497,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:34:56','2021-10-24 21:34:56'),
	(498,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:34:56','2021-10-24 21:34:56'),
	(499,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"11\",\"order_time\":\"2016-11-14\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"22\",\"quantity\":\"80\",\"unit_price\":\"92.5\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:35:27','2021-10-24 21:35:27'),
	(500,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:35:28','2021-10-24 21:35:28'),
	(501,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:35:31','2021-10-24 21:35:31'),
	(502,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:35:32','2021-10-24 21:35:32'),
	(503,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:35:32','2021-10-24 21:35:32'),
	(504,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"2\",\"order_time\":\"2016-11-14\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"2\",\"quantity\":\"40\",\"unit_price\":\"170\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:36:07','2021-10-24 21:36:07'),
	(505,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:36:09','2021-10-24 21:36:09'),
	(506,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:36:11','2021-10-24 21:36:11'),
	(507,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:36:12','2021-10-24 21:36:12'),
	(508,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:36:12','2021-10-24 21:36:12'),
	(509,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"15\",\"order_time\":\"2016-11-14\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"20\",\"quantity\":\"10\",\"unit_price\":\"425\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:37:09','2021-10-24 21:37:09'),
	(510,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:37:10','2021-10-24 21:37:10'),
	(511,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:37:12','2021-10-24 21:37:12'),
	(512,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:37:13','2021-10-24 21:37:13'),
	(513,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:37:13','2021-10-24 21:37:13'),
	(514,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"3\",\"order_time\":\"2016-11-16\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"17\",\"quantity\":\"10\",\"unit_price\":\"2730.5\",\"remark\":null,\"deleted\":false},{\"id\":\"l-2\",\"item_id\":\"14\",\"quantity\":\"1\",\"unit_price\":\"2620\",\"remark\":null,\"deleted\":false},{\"id\":\"l-3\",\"item_id\":null,\"quantity\":1,\"unit_price\":0,\"remark\":null,\"deleted\":true}]}','2021-10-24 21:38:28','2021-10-24 21:38:28'),
	(515,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:38:29','2021-10-24 21:38:29'),
	(516,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:38:34','2021-10-24 21:38:34'),
	(517,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:38:35','2021-10-24 21:38:35'),
	(518,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:38:35','2021-10-24 21:38:35'),
	(519,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"3\",\"order_time\":\"2016-11-16\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"3\",\"quantity\":\"1\",\"unit_price\":\"2430\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:38:57','2021-10-24 21:38:57'),
	(520,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:38:58','2021-10-24 21:38:58'),
	(521,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:39:00','2021-10-24 21:39:00'),
	(522,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:39:01','2021-10-24 21:39:01'),
	(523,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:39:01','2021-10-24 21:39:01'),
	(524,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"4\",\"order_time\":\"2016-12-08\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"4\",\"quantity\":\"1\",\"unit_price\":\"2795\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:39:24','2021-10-24 21:39:24'),
	(525,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:39:25','2021-10-24 21:39:25'),
	(526,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:39:28','2021-10-24 21:39:28'),
	(527,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:39:29','2021-10-24 21:39:29'),
	(528,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:39:29','2021-10-24 21:39:29'),
	(529,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"3\",\"order_time\":\"2016-11-16\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"23\",\"quantity\":\"5\",\"unit_price\":\"2860\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:40:00','2021-10-24 21:40:00'),
	(530,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:40:02','2021-10-24 21:40:02'),
	(531,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:40:03','2021-10-24 21:40:03'),
	(532,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:40:04','2021-10-24 21:40:04'),
	(533,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:40:04','2021-10-24 21:40:04'),
	(534,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:40:23','2021-10-24 21:40:23'),
	(535,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:40:25','2021-10-24 21:40:25'),
	(536,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"6\",\"name\":\"\\u5f02\\u6784\\u9187\\u919a1009\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:40:40','2021-10-24 21:40:40'),
	(537,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:40:40','2021-10-24 21:40:40'),
	(538,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:40:43','2021-10-24 21:40:43'),
	(539,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:40:45','2021-10-24 21:40:45'),
	(540,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:40:46','2021-10-24 21:40:46'),
	(541,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:40:46','2021-10-24 21:40:46'),
	(542,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"1\",\"order_time\":\"2016-11-16\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"31\",\"quantity\":\"1\",\"unit_price\":\"2240\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:41:03','2021-10-24 21:41:03'),
	(543,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:41:05','2021-10-24 21:41:05'),
	(544,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:41:07','2021-10-24 21:41:07'),
	(545,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:41:08','2021-10-24 21:41:08'),
	(546,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:41:08','2021-10-24 21:41:08'),
	(547,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"3\",\"order_time\":\"2016-11-18\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"17\",\"quantity\":\"3\",\"unit_price\":\"2709\",\"remark\":null,\"deleted\":false},{\"id\":\"l-2\",\"item_id\":\"24\",\"quantity\":\"4\",\"unit_price\":\"2920\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:41:57','2021-10-24 21:41:57'),
	(548,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:41:59','2021-10-24 21:41:59'),
	(549,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:42:03','2021-10-24 21:42:03'),
	(550,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:42:03','2021-10-24 21:42:03'),
	(551,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:42:03','2021-10-24 21:42:03'),
	(552,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"16\",\"order_time\":\"2016-11-18\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"25\",\"quantity\":\"6\",\"unit_price\":\"1785\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:42:41','2021-10-24 21:42:41'),
	(553,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:42:42','2021-10-24 21:42:42'),
	(554,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:42:44','2021-10-24 21:42:44'),
	(555,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:42:45','2021-10-24 21:42:45'),
	(556,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:42:45','2021-10-24 21:42:45'),
	(557,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:43:03','2021-10-24 21:43:03'),
	(558,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:43:06','2021-10-24 21:43:06'),
	(559,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"11\",\"name\":\"LAS\",\"search_name\":null,\"weight\":\"25\",\"unit\":\"\\u5305\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:43:18','2021-10-24 21:43:18'),
	(560,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:43:18','2021-10-24 21:43:18'),
	(561,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:43:20','2021-10-24 21:43:20'),
	(562,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"16\",\"name\":\"\\u4e00\\u4e59\\u9187\\u80fa\",\"search_name\":null,\"weight\":\"210\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:43:33','2021-10-24 21:43:33'),
	(563,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:43:33','2021-10-24 21:43:33'),
	(564,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:43:39','2021-10-24 21:43:39'),
	(565,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:43:42','2021-10-24 21:43:42'),
	(566,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:43:43','2021-10-24 21:43:43'),
	(567,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:43:43','2021-10-24 21:43:43'),
	(568,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"18\",\"order_time\":\"2016-11-18\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"32\",\"quantity\":\"10\",\"unit_price\":\"175\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:44:16','2021-10-24 21:44:16'),
	(569,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:44:18','2021-10-24 21:44:18'),
	(570,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:44:20','2021-10-24 21:44:20'),
	(571,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:44:21','2021-10-24 21:44:21'),
	(572,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:44:21','2021-10-24 21:44:21'),
	(573,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"11\",\"order_time\":\"2016-11-21\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"22\",\"quantity\":\"160\",\"unit_price\":\"92.5\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:44:58','2021-10-24 21:44:58'),
	(574,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:44:59','2021-10-24 21:44:59'),
	(575,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:45:00','2021-10-24 21:45:00'),
	(576,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:45:01','2021-10-24 21:45:01'),
	(577,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:45:01','2021-10-24 21:45:01'),
	(578,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"12\",\"order_time\":\"2016-11-21\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"33\",\"quantity\":\"1\",\"unit_price\":\"1995\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:45:26','2021-10-24 21:45:26'),
	(579,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:45:28','2021-10-24 21:45:28'),
	(580,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:45:30','2021-10-24 21:45:30'),
	(581,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:45:31','2021-10-24 21:45:31'),
	(582,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:45:31','2021-10-24 21:45:31'),
	(583,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"11\",\"order_time\":\"2016-11-18\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"22\",\"quantity\":\"40\",\"unit_price\":\"95\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:45:57','2021-10-24 21:45:57'),
	(584,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:45:59','2021-10-24 21:45:59'),
	(585,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:46:01','2021-10-24 21:46:01'),
	(586,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:46:01','2021-10-24 21:46:01'),
	(587,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:46:01','2021-10-24 21:46:01'),
	(588,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"10\",\"order_time\":\"2016-11-29\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"11\",\"quantity\":\"5\",\"unit_price\":\"2480\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:46:37','2021-10-24 21:46:37'),
	(589,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:46:38','2021-10-24 21:46:38'),
	(590,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:46:45','2021-10-24 21:46:45'),
	(591,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:46:45','2021-10-24 21:46:45'),
	(592,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:46:45','2021-10-24 21:46:45'),
	(593,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"17\",\"order_time\":\"2016-11-29\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"29\",\"quantity\":\"1\",\"unit_price\":\"2233.2\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:47:12','2021-10-24 21:47:12'),
	(594,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:47:15','2021-10-24 21:47:15'),
	(595,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:47:17','2021-10-24 21:47:17'),
	(596,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:47:17','2021-10-24 21:47:17'),
	(597,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:47:17','2021-10-24 21:47:17'),
	(598,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:47:27','2021-10-24 21:47:27'),
	(599,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:47:29','2021-10-24 21:47:29'),
	(600,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"11\",\"name\":\"HEDP\\u56db\\u94a0\",\"search_name\":null,\"weight\":\"25\",\"unit\":\"\\u5305\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:47:46','2021-10-24 21:47:46'),
	(601,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:47:47','2021-10-24 21:47:47'),
	(602,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:47:51','2021-10-24 21:47:51'),
	(603,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"11\",\"name\":\"\\u6c22\\u6c27\\u5316\\u94a0\",\"search_name\":null,\"weight\":\"25\",\"unit\":\"\\u5305\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:48:09','2021-10-24 21:48:09'),
	(604,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:48:09','2021-10-24 21:48:09'),
	(605,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:48:15','2021-10-24 21:48:15'),
	(606,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"11\",\"name\":\"NTA\\u4e09\\u94a0\",\"search_name\":null,\"weight\":\"25\",\"unit\":\"\\u5305\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:48:31','2021-10-24 21:48:31'),
	(607,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:48:32','2021-10-24 21:48:32'),
	(608,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:48:35','2021-10-24 21:48:35'),
	(609,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:48:38','2021-10-24 21:48:38'),
	(610,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:48:38','2021-10-24 21:48:38'),
	(611,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:48:38','2021-10-24 21:48:38'),
	(612,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"19\",\"order_time\":\"2016-11-30\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"34\",\"quantity\":\"200\",\"unit_price\":\"287.5\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:49:07','2021-10-24 21:49:07'),
	(613,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:49:08','2021-10-24 21:49:08'),
	(614,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:49:10','2021-10-24 21:49:10'),
	(615,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:49:11','2021-10-24 21:49:11'),
	(616,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:49:11','2021-10-24 21:49:11'),
	(617,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"20\",\"order_time\":\"2016-12-06\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"19\",\"quantity\":\"10\",\"unit_price\":\"2730\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:49:50','2021-10-24 21:49:50'),
	(618,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:49:52','2021-10-24 21:49:52'),
	(619,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:49:53','2021-10-24 21:49:53'),
	(620,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:49:54','2021-10-24 21:49:54'),
	(621,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:49:54','2021-10-24 21:49:54'),
	(622,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"21\",\"order_time\":\"2016-12-06\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"35\",\"quantity\":\"40\",\"unit_price\":\"107.5\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:50:21','2021-10-24 21:50:21'),
	(623,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:50:24','2021-10-24 21:50:24'),
	(624,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:50:25','2021-10-24 21:50:25'),
	(625,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:50:26','2021-10-24 21:50:26'),
	(626,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:50:26','2021-10-24 21:50:26'),
	(627,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"9\",\"order_time\":\"2016-12-05\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"28\",\"quantity\":\"12\",\"unit_price\":\"2461\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:51:29','2021-10-24 21:51:29'),
	(628,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:51:30','2021-10-24 21:51:30'),
	(629,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:51:33','2021-10-24 21:51:33'),
	(630,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:51:34','2021-10-24 21:51:34'),
	(631,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:51:34','2021-10-24 21:51:34'),
	(632,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"10\",\"order_time\":\"2016-12-06\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"11\",\"quantity\":\"1\",\"unit_price\":\"2480\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:52:10','2021-10-24 21:52:10'),
	(633,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:52:11','2021-10-24 21:52:11'),
	(634,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:52:13','2021-10-24 21:52:13'),
	(635,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:52:14','2021-10-24 21:52:14'),
	(636,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:52:14','2021-10-24 21:52:14'),
	(637,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"6\",\"order_time\":\"2016-12-08\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"7\",\"quantity\":\"1\",\"unit_price\":\"3600\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:52:43','2021-10-24 21:52:43'),
	(638,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:52:45','2021-10-24 21:52:45'),
	(639,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:52:47','2021-10-24 21:52:47'),
	(640,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:52:48','2021-10-24 21:52:48'),
	(641,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:52:48','2021-10-24 21:52:48'),
	(642,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"3\",\"order_time\":\"2016-12-07\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"3\",\"quantity\":\"2\",\"unit_price\":\"2520\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:53:21','2021-10-24 21:53:21'),
	(643,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:53:23','2021-10-24 21:53:23'),
	(644,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:53:54','2021-10-24 21:53:54'),
	(645,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:53:55','2021-10-24 21:53:55'),
	(646,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:53:55','2021-10-24 21:53:55'),
	(647,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"11\",\"order_time\":\"2016-12-13\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"22\",\"quantity\":\"40\",\"unit_price\":\"97.5\",\"remark\":null,\"deleted\":false},{\"id\":\"l-2\",\"item_id\":\"2\",\"quantity\":\"40\",\"unit_price\":\"175\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:54:38','2021-10-24 21:54:38'),
	(648,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:54:40','2021-10-24 21:54:40'),
	(649,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:54:41','2021-10-24 21:54:41'),
	(650,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:54:42','2021-10-24 21:54:42'),
	(651,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:54:42','2021-10-24 21:54:42'),
	(652,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"15\",\"order_time\":\"2016-12-13\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"36\",\"quantity\":\"20\",\"unit_price\":\"425\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:55:12','2021-10-24 21:55:12'),
	(653,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:55:21','2021-10-24 21:55:21'),
	(654,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:55:24','2021-10-24 21:55:24'),
	(655,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:55:24','2021-10-24 21:55:24'),
	(656,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:55:24','2021-10-24 21:55:24'),
	(657,2,'admin/items','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:56:23','2021-10-24 21:56:23'),
	(658,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:56:25','2021-10-24 21:56:25'),
	(659,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"11\",\"name\":\"OP10\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:56:46','2021-10-24 21:56:46'),
	(660,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:56:46','2021-10-24 21:56:46'),
	(661,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:56:49','2021-10-24 21:56:49'),
	(662,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"11\",\"name\":\"JFC-1\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:57:18','2021-10-24 21:57:18'),
	(663,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:57:19','2021-10-24 21:57:19'),
	(664,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:57:22','2021-10-24 21:57:22'),
	(665,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"11\",\"name\":\"NP6\",\"search_name\":null,\"weight\":\"215\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:57:36','2021-10-24 21:57:36'),
	(666,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:57:36','2021-10-24 21:57:36'),
	(667,2,'admin/items/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:57:51','2021-10-24 21:57:51'),
	(668,2,'admin/items','POST','112.14.53.205','{\"origin_id\":\"11\",\"name\":\"\\u5f02\\u6784\\u9187\\u919a1309\",\"search_name\":null,\"weight\":\"200\",\"unit\":\"\\u6876\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/items\"}','2021-10-24 21:58:07','2021-10-24 21:58:07'),
	(669,2,'admin/items','GET','112.14.53.205','[]','2021-10-24 21:58:07','2021-10-24 21:58:07'),
	(670,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:58:10','2021-10-24 21:58:10'),
	(671,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:58:15','2021-10-24 21:58:15'),
	(672,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:58:16','2021-10-24 21:58:16'),
	(673,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:58:16','2021-10-24 21:58:16'),
	(674,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"22\",\"order_time\":null,\"items\":[{\"id\":\"l-1\",\"item_id\":\"37\",\"quantity\":\"1\",\"unit_price\":\"2840\",\"remark\":null,\"deleted\":false},{\"id\":\"l-2\",\"item_id\":\"38\",\"quantity\":\"1\",\"unit_price\":\"3000\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:58:51','2021-10-24 21:58:51'),
	(675,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"22\",\"order_time\":\"2016-12-14\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"37\",\"quantity\":\"1\",\"unit_price\":\"2840\",\"remark\":null,\"deleted\":false},{\"id\":\"l-2\",\"item_id\":\"38\",\"quantity\":\"1\",\"unit_price\":\"3000\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:58:59','2021-10-24 21:58:59'),
	(676,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:59:01','2021-10-24 21:59:01'),
	(677,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:59:03','2021-10-24 21:59:03'),
	(678,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:59:03','2021-10-24 21:59:03'),
	(679,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:59:03','2021-10-24 21:59:03'),
	(680,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"3\",\"order_time\":\"2016-12-14\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"17\",\"quantity\":\"1\",\"unit_price\":\"2666\",\"remark\":null,\"deleted\":false}]}','2021-10-24 21:59:42','2021-10-24 21:59:42'),
	(681,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 21:59:44','2021-10-24 21:59:44'),
	(682,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 21:59:46','2021-10-24 21:59:46'),
	(683,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 21:59:47','2021-10-24 21:59:47'),
	(684,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 21:59:47','2021-10-24 21:59:47'),
	(685,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"4\",\"order_time\":\"2016-12-16\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"39\",\"quantity\":1,\"unit_price\":\"3053\",\"remark\":null,\"deleted\":false},{\"id\":\"l-2\",\"item_id\":\"4\",\"quantity\":\"1\",\"unit_price\":\"2838\",\"remark\":null,\"deleted\":false}]}','2021-10-24 22:00:31','2021-10-24 22:00:31'),
	(686,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 22:00:33','2021-10-24 22:00:33'),
	(687,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:00:35','2021-10-24 22:00:35'),
	(688,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 22:00:36','2021-10-24 22:00:36'),
	(689,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 22:00:36','2021-10-24 22:00:36'),
	(690,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"3\",\"order_time\":\"2016-12-22\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"3\",\"quantity\":\"2\",\"unit_price\":\"2574\",\"remark\":null,\"deleted\":false}]}','2021-10-24 22:01:00','2021-10-24 22:01:00'),
	(691,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 22:01:02','2021-10-24 22:01:02'),
	(692,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:01:03','2021-10-24 22:01:03'),
	(693,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 22:01:04','2021-10-24 22:01:04'),
	(694,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 22:01:04','2021-10-24 22:01:04'),
	(695,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"1\",\"order_time\":\"2016-12-22\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"31\",\"quantity\":\"2\",\"unit_price\":\"2460\",\"remark\":null,\"deleted\":false}]}','2021-10-24 22:01:30','2021-10-24 22:01:30'),
	(696,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 22:01:32','2021-10-24 22:01:32'),
	(697,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:01:35','2021-10-24 22:01:35'),
	(698,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 22:01:36','2021-10-24 22:01:36'),
	(699,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 22:01:36','2021-10-24 22:01:36'),
	(700,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"12\",\"order_time\":\"2016-12-29\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"16\",\"quantity\":\"1\",\"unit_price\":\"2300\",\"remark\":null,\"deleted\":false}]}','2021-10-24 22:02:05','2021-10-24 22:02:05'),
	(701,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 22:02:06','2021-10-24 22:02:06'),
	(702,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:02:08','2021-10-24 22:02:08'),
	(703,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 22:02:08','2021-10-24 22:02:08'),
	(704,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 22:02:08','2021-10-24 22:02:08'),
	(705,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"3\",\"order_time\":\"2016-12-29\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"40\",\"quantity\":1,\"unit_price\":\"2860\",\"remark\":null,\"deleted\":false}]}','2021-10-24 22:02:38','2021-10-24 22:02:38'),
	(706,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 22:02:39','2021-10-24 22:02:39'),
	(707,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:02:41','2021-10-24 22:02:41'),
	(708,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 22:02:42','2021-10-24 22:02:42'),
	(709,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 22:02:42','2021-10-24 22:02:42'),
	(710,2,'admin/purchase-orders/save','POST','112.14.53.205','{\"supplier_id\":\"19\",\"order_time\":\"2016-12-24\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"34\",\"quantity\":\"200\",\"unit_price\":\"262.5\",\"remark\":null,\"deleted\":false}]}','2021-10-24 22:03:17','2021-10-24 22:03:17'),
	(711,2,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 22:03:18','2021-10-24 22:03:18'),
	(712,2,'admin/purchase-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:03:20','2021-10-24 22:03:20'),
	(713,2,'admin/api/supplier','GET','112.14.53.205','[]','2021-10-24 22:03:20','2021-10-24 22:03:20'),
	(714,2,'admin/api/items','GET','112.14.53.205','[]','2021-10-24 22:03:20','2021-10-24 22:03:20'),
	(715,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:03:36','2021-10-24 22:03:36'),
	(716,2,'admin/supplier-invoices','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:08:19','2021-10-24 22:08:19'),
	(717,2,'admin/suppliers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:08:24','2021-10-24 22:08:24'),
	(718,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:08:40','2021-10-24 22:08:40'),
	(719,2,'admin/customer-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:09:31','2021-10-24 22:09:31'),
	(720,2,'admin/customer-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:09:33','2021-10-24 22:09:33'),
	(721,2,'admin/configs','GET','112.14.53.205','[]','2021-10-24 22:09:34','2021-10-24 22:09:34'),
	(722,2,'admin/api/customers','GET','112.14.53.205','[]','2021-10-24 22:09:34','2021-10-24 22:09:34'),
	(723,2,'admin/api/logistics','GET','112.14.53.205','[]','2021-10-24 22:09:34','2021-10-24 22:09:34'),
	(724,2,'admin/api/can-sales-items','GET','112.14.53.205','[]','2021-10-24 22:09:34','2021-10-24 22:09:34'),
	(725,2,'admin/api/payment-method','GET','112.14.53.205','[]','2021-10-24 22:09:34','2021-10-24 22:09:34'),
	(726,2,'admin/customer-orders/save','POST','112.14.53.205','{\"customer_id\":\"1\",\"order_time\":\"2016-08-08\",\"pick_up_object\":null,\"pick_up_date\":\"2016-08-08\",\"commission\":0,\"pick_up\":0,\"transportation\":0,\"deliver_goods\":0,\"logistics\":\"\\u9ec4\\u91d1\\u7269\\u6d41\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"1\",\"quantity\":\"15\",\"unit_price\":\"2400\",\"content\":\"99\",\"deleted\":false}],\"remarks\":\"\\u5ba2\\u6237\\u4ed8\\u6b3e\\u81f3\\u674e\\u5c0f\\u6ce2\\u519c\\u884c\\u536136000\\u5143\\uff0c\\u4ed8\\u6b3e\\u65e5\\u671f\\uff1a2016\\u5e7408\\u670822\\u65e5\",\"payment_method\":\"PRIVATE_TRANSFER\"}','2021-10-24 22:11:44','2021-10-24 22:11:44'),
	(727,2,'admin/customer-orders','GET','112.14.53.205','[]','2021-10-24 22:11:46','2021-10-24 22:11:46'),
	(728,2,'admin/customer-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:12:04','2021-10-24 22:12:04'),
	(729,2,'admin/api/customers','GET','112.14.53.205','[]','2021-10-24 22:12:05','2021-10-24 22:12:05'),
	(730,2,'admin/configs','GET','112.14.53.205','[]','2021-10-24 22:12:05','2021-10-24 22:12:05'),
	(731,2,'admin/api/logistics','GET','112.14.53.205','[]','2021-10-24 22:12:05','2021-10-24 22:12:05'),
	(732,2,'admin/api/can-sales-items','GET','112.14.53.205','[]','2021-10-24 22:12:05','2021-10-24 22:12:05'),
	(733,2,'admin/api/payment-method','GET','112.14.53.205','[]','2021-10-24 22:12:05','2021-10-24 22:12:05'),
	(734,2,'admin/customer-orders/save','POST','112.14.53.205','{\"customer_id\":\"2\",\"order_time\":\"2016-08-04\",\"pick_up_object\":null,\"pick_up_date\":null,\"commission\":0,\"pick_up\":0,\"transportation\":0,\"deliver_goods\":0,\"logistics\":\"\\u9ec4\\u91d1\\u7269\\u6d41\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"2\",\"quantity\":\"2\",\"unit_price\":\"137.5\",\"content\":\"99\",\"deleted\":false},{\"id\":\"l-2\",\"item_id\":\"3\",\"quantity\":\"1\",\"unit_price\":\"2106\",\"content\":\"99\",\"deleted\":false}],\"remarks\":null,\"payment_method\":\"TRANSFER\"}','2021-10-24 22:13:39','2021-10-24 22:13:39'),
	(735,2,'admin/customer-orders','GET','112.14.53.205','[]','2021-10-24 22:13:41','2021-10-24 22:13:41'),
	(736,2,'admin/customer-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:13:46','2021-10-24 22:13:46'),
	(737,2,'admin/api/customers','GET','112.14.53.205','[]','2021-10-24 22:13:47','2021-10-24 22:13:47'),
	(738,2,'admin/configs','GET','112.14.53.205','[]','2021-10-24 22:13:47','2021-10-24 22:13:47'),
	(739,2,'admin/api/can-sales-items','GET','112.14.53.205','[]','2021-10-24 22:13:47','2021-10-24 22:13:47'),
	(740,2,'admin/api/payment-method','GET','112.14.53.205','[]','2021-10-24 22:13:47','2021-10-24 22:13:47'),
	(741,2,'admin/api/logistics','GET','112.14.53.205','[]','2021-10-24 22:13:47','2021-10-24 22:13:47'),
	(742,2,'admin/customer-orders/save','POST','112.14.53.205','{\"customer_id\":\"3\",\"order_time\":\"2016-08-12\",\"pick_up_object\":null,\"pick_up_date\":null,\"commission\":0,\"pick_up\":0,\"transportation\":0,\"deliver_goods\":0,\"logistics\":\"\\u9ec4\\u91d1\\u7269\\u6d41\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"4\",\"quantity\":1,\"unit_price\":\"2902.5\",\"content\":\"99\",\"deleted\":false},{\"id\":\"l-2\",\"item_id\":\"5\",\"quantity\":1,\"unit_price\":\"2800\",\"content\":\"99\",\"deleted\":false},{\"id\":\"l-3\",\"item_id\":\"6\",\"quantity\":1,\"unit_price\":\"2750\",\"content\":\"85\",\"deleted\":false},{\"id\":\"l-4\",\"item_id\":\"7\",\"quantity\":\"1\",\"unit_price\":\"4300\",\"content\":\"99\",\"deleted\":false}],\"remarks\":\"\\u5ba2\\u6237\\u4ed8\\u6b3e\\u81f3\\u674e\\u5c0f\\u6ce2\\u519c\\u884c\\u536112752\\u5143\\uff0c\\u4ed8\\u6b3e\\u65f6\\u95f42016\\u5e7409\\u670829\\u65e5\",\"payment_method\":\"PRIVATE_TRANSFER\"}','2021-10-24 22:16:25','2021-10-24 22:16:25'),
	(743,2,'admin/customer-orders','GET','112.14.53.205','[]','2021-10-24 22:16:27','2021-10-24 22:16:27'),
	(744,2,'admin/customer-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:16:42','2021-10-24 22:16:42'),
	(745,2,'admin/configs','GET','112.14.53.205','[]','2021-10-24 22:16:43','2021-10-24 22:16:43'),
	(746,2,'admin/api/customers','GET','112.14.53.205','[]','2021-10-24 22:16:43','2021-10-24 22:16:43'),
	(747,2,'admin/api/payment-method','GET','112.14.53.205','[]','2021-10-24 22:16:43','2021-10-24 22:16:43'),
	(748,2,'admin/api/logistics','GET','112.14.53.205','[]','2021-10-24 22:16:43','2021-10-24 22:16:43'),
	(749,2,'admin/api/can-sales-items','GET','112.14.53.205','[]','2021-10-24 22:16:43','2021-10-24 22:16:43'),
	(750,2,'admin/customer-orders/save','POST','112.14.53.205','{\"customer_id\":\"4\",\"order_time\":\"2016-09-05\",\"pick_up_object\":null,\"pick_up_date\":\"2016-09-05\",\"commission\":0,\"pick_up\":0,\"transportation\":0,\"deliver_goods\":0,\"logistics\":\"\\u9ec4\\u91d1\\u7269\\u6d41\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"8\",\"quantity\":\"2\",\"unit_price\":\"2452.5\",\"content\":\"99\",\"deleted\":false}],\"remarks\":null,\"payment_method\":\"TRANSFER\"}','2021-10-24 22:17:53','2021-10-24 22:17:53'),
	(751,2,'admin/customer-orders','GET','112.14.53.205','[]','2021-10-24 22:17:55','2021-10-24 22:17:55'),
	(752,2,'admin/customer-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:17:57','2021-10-24 22:17:57'),
	(753,2,'admin/configs','GET','112.14.53.205','[]','2021-10-24 22:17:58','2021-10-24 22:17:58'),
	(754,2,'admin/api/customers','GET','112.14.53.205','[]','2021-10-24 22:17:58','2021-10-24 22:17:58'),
	(755,2,'admin/api/payment-method','GET','112.14.53.205','[]','2021-10-24 22:17:58','2021-10-24 22:17:58'),
	(756,2,'admin/api/can-sales-items','GET','112.14.53.205','[]','2021-10-24 22:17:58','2021-10-24 22:17:58'),
	(757,2,'admin/api/logistics','GET','112.14.53.205','[]','2021-10-24 22:17:58','2021-10-24 22:17:58'),
	(758,2,'admin/customer-orders/save','POST','112.14.53.205','{\"customer_id\":\"5\",\"order_time\":\"2016-09-07\",\"pick_up_object\":null,\"pick_up_date\":null,\"commission\":0,\"pick_up\":0,\"transportation\":0,\"deliver_goods\":0,\"logistics\":\"\\u9ec4\\u91d1\\u7269\\u6d41\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"9\",\"quantity\":\"2\",\"unit_price\":\"2540\",\"content\":\"99\",\"deleted\":false}],\"remarks\":\"\\u5ba2\\u6237\\u738b\\u5b89\\u5e73\\u4e2a\\u4eba\\u8f6c\\u521b\\u9645\\u516c\\u53f8\\u8d26\\u62375080\\u5143\",\"payment_method\":\"PRIVATE_TRANSFER\"}','2021-10-24 22:19:45','2021-10-24 22:19:45'),
	(759,2,'admin/customer-orders','GET','112.14.53.205','[]','2021-10-24 22:19:46','2021-10-24 22:19:46'),
	(760,2,'admin/customer-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:20:00','2021-10-24 22:20:00'),
	(761,2,'admin/api/customers','GET','112.14.53.205','[]','2021-10-24 22:20:01','2021-10-24 22:20:01'),
	(762,2,'admin/configs','GET','112.14.53.205','[]','2021-10-24 22:20:01','2021-10-24 22:20:01'),
	(763,2,'admin/api/logistics','GET','112.14.53.205','[]','2021-10-24 22:20:01','2021-10-24 22:20:01'),
	(764,2,'admin/api/payment-method','GET','112.14.53.205','[]','2021-10-24 22:20:01','2021-10-24 22:20:01'),
	(765,2,'admin/api/can-sales-items','GET','112.14.53.205','[]','2021-10-24 22:20:01','2021-10-24 22:20:01'),
	(766,2,'admin/customer-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:20:25','2021-10-24 22:20:25'),
	(767,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:20:28','2021-10-24 22:20:28'),
	(768,2,'admin/suppliers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:20:29','2021-10-24 22:20:29'),
	(769,2,'admin/suppliers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2021-10-24 22:20:39','2021-10-24 22:20:39'),
	(770,2,'admin/suppliers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}','2021-10-24 22:20:51','2021-10-24 22:20:51'),
	(771,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:21:08','2021-10-24 22:21:08'),
	(772,2,'admin/customer-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:21:17','2021-10-24 22:21:17'),
	(773,2,'admin/customer-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:21:18','2021-10-24 22:21:18'),
	(774,2,'admin/configs','GET','112.14.53.205','[]','2021-10-24 22:21:19','2021-10-24 22:21:19'),
	(775,2,'admin/api/customers','GET','112.14.53.205','[]','2021-10-24 22:21:19','2021-10-24 22:21:19'),
	(776,2,'admin/api/payment-method','GET','112.14.53.205','[]','2021-10-24 22:21:19','2021-10-24 22:21:19'),
	(777,2,'admin/api/can-sales-items','GET','112.14.53.205','[]','2021-10-24 22:21:19','2021-10-24 22:21:19'),
	(778,2,'admin/api/logistics','GET','112.14.53.205','[]','2021-10-24 22:21:19','2021-10-24 22:21:19'),
	(779,2,'admin/customer-orders/save','POST','112.14.53.205','{\"customer_id\":\"12\",\"order_time\":\"2016-09-12\",\"pick_up_object\":null,\"pick_up_date\":null,\"commission\":0,\"pick_up\":0,\"transportation\":0,\"deliver_goods\":0,\"logistics\":\"\\u9ec4\\u91d1\\u7269\\u6d41\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"3\",\"quantity\":1,\"unit_price\":\"2417.94\",\"content\":\"99\",\"deleted\":false}],\"remarks\":null,\"payment_method\":\"TRANSFER\"}','2021-10-24 22:23:48','2021-10-24 22:23:48'),
	(780,2,'admin/customer-orders','GET','112.14.53.205','[]','2021-10-24 22:23:50','2021-10-24 22:23:50'),
	(781,2,'admin/customer-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:23:53','2021-10-24 22:23:53'),
	(782,2,'admin/api/customers','GET','112.14.53.205','[]','2021-10-24 22:23:55','2021-10-24 22:23:55'),
	(783,2,'admin/configs','GET','112.14.53.205','[]','2021-10-24 22:23:55','2021-10-24 22:23:55'),
	(784,2,'admin/api/logistics','GET','112.14.53.205','[]','2021-10-24 22:23:55','2021-10-24 22:23:55'),
	(785,2,'admin/api/payment-method','GET','112.14.53.205','[]','2021-10-24 22:23:55','2021-10-24 22:23:55'),
	(786,2,'admin/api/can-sales-items','GET','112.14.53.205','[]','2021-10-24 22:23:55','2021-10-24 22:23:55'),
	(787,2,'admin/customer-orders/save','POST','112.14.53.205','{\"customer_id\":\"6\",\"order_time\":\"2016-09-13\",\"pick_up_object\":null,\"pick_up_date\":null,\"commission\":0,\"pick_up\":0,\"transportation\":0,\"deliver_goods\":0,\"logistics\":\"\\u9ec4\\u91d1\\u7269\\u6d41\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"10\",\"quantity\":\"1\",\"unit_price\":\"2880\",\"content\":\"99\",\"deleted\":false}],\"remarks\":null,\"payment_method\":\"PRIVATE_TRANSFER\"}','2021-10-24 22:24:39','2021-10-24 22:24:39'),
	(788,2,'admin/customer-orders','GET','112.14.53.205','[]','2021-10-24 22:24:41','2021-10-24 22:24:41'),
	(789,2,'admin/customer-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:24:44','2021-10-24 22:24:44'),
	(790,2,'admin/api/logistics','GET','112.14.53.205','[]','2021-10-24 22:24:45','2021-10-24 22:24:45'),
	(791,2,'admin/api/customers','GET','112.14.53.205','[]','2021-10-24 22:24:45','2021-10-24 22:24:45'),
	(792,2,'admin/api/payment-method','GET','112.14.53.205','[]','2021-10-24 22:24:45','2021-10-24 22:24:45'),
	(793,2,'admin/configs','GET','112.14.53.205','[]','2021-10-24 22:24:45','2021-10-24 22:24:45'),
	(794,2,'admin/api/can-sales-items','GET','112.14.53.205','[]','2021-10-24 22:24:45','2021-10-24 22:24:45'),
	(795,1,'admin','GET','112.14.53.205','[]','2021-10-24 22:37:18','2021-10-24 22:37:18'),
	(796,1,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:37:21','2021-10-24 22:37:21'),
	(797,2,'admin/customer-orders/save','POST','112.14.53.205','{\"customer_id\":\"2\",\"order_time\":\"2016-09-13\",\"pick_up_object\":null,\"pick_up_date\":null,\"commission\":0,\"pick_up\":0,\"transportation\":0,\"deliver_goods\":0,\"logistics\":\"\\u9ec4\\u91d1\\u7269\\u6d41\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"11\",\"quantity\":\"5\",\"unit_price\":\"2585.6\",\"content\":\"99\",\"deleted\":false}],\"remarks\":null,\"payment_method\":\"TRANSFER\"}','2021-10-24 22:40:26','2021-10-24 22:40:26'),
	(798,2,'admin/customer-orders','GET','112.14.53.205','[]','2021-10-24 22:40:28','2021-10-24 22:40:28'),
	(799,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:40:33','2021-10-24 22:40:33'),
	(800,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2021-10-24 22:40:46','2021-10-24 22:40:46'),
	(801,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}','2021-10-24 22:40:51','2021-10-24 22:40:51'),
	(802,2,'admin/purchase-orders/36/edit','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:41:02','2021-10-24 22:41:02'),
	(803,2,'admin/purchase-orders/36','PUT','112.14.53.205','{\"no\":\"PO100036\",\"last_number\":\"100036\",\"supplier_id\":\"13\",\"order_time\":\"2016-12-28\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/purchase-orders?&page=3\"}','2021-10-24 22:41:14','2021-10-24 22:41:14'),
	(804,2,'admin/purchase-orders','GET','112.14.53.205','{\"page\":\"3\"}','2021-10-24 22:41:15','2021-10-24 22:41:15'),
	(805,2,'admin/purchase-orders','GET','112.14.53.205','{\"page\":\"4\",\"_pjax\":\"#pjax-container\"}','2021-10-24 22:41:21','2021-10-24 22:41:21'),
	(806,2,'admin/purchase-orders','GET','112.14.53.205','{\"page\":\"4\",\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}','2021-10-24 22:41:40','2021-10-24 22:41:40'),
	(807,2,'admin/purchase-orders','GET','112.14.53.205','{\"page\":\"1\",\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}','2021-10-24 22:41:40','2021-10-24 22:41:40'),
	(808,2,'admin/purchase-orders/42/edit','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:42:07','2021-10-24 22:42:07'),
	(809,2,'admin/purchase-orders/42','PUT','112.14.53.205','{\"no\":\"PO100042\",\"last_number\":\"100042\",\"supplier_id\":\"16\",\"order_time\":\"2016-11-21\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/purchase-orders?page=1&per_page=100\"}','2021-10-24 22:42:18','2021-10-24 22:42:18'),
	(810,2,'admin/purchase-orders/42/edit','GET','112.14.53.205','[]','2021-10-24 22:42:18','2021-10-24 22:42:18'),
	(811,2,'admin/purchase-orders/42','PUT','112.14.53.205','{\"no\":\"PO100042\",\"last_number\":\"100042\",\"supplier_id\":\"16\",\"order_time\":\"2016-11-21\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_method\":\"PUT\"}','2021-10-24 22:42:22','2021-10-24 22:42:22'),
	(812,2,'admin/purchase-orders/42/edit','GET','112.14.53.205','[]','2021-10-24 22:42:22','2021-10-24 22:42:22'),
	(813,2,'admin/purchase-orders/42','PUT','112.14.53.205','{\"no\":\"PO100042\",\"last_number\":\"100042\",\"supplier_id\":\"16\",\"order_time\":\"2016-11-21\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_method\":\"PUT\"}','2021-10-24 22:42:28','2021-10-24 22:42:28'),
	(814,2,'admin/purchase-orders/42/edit','GET','112.14.53.205','[]','2021-10-24 22:42:28','2021-10-24 22:42:28'),
	(815,2,'admin/purchase-orders/42','PUT','112.14.53.205','{\"no\":\"PO100042\",\"last_number\":\"100042\",\"supplier_id\":\"16\",\"order_time\":\"2016-11-21\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_method\":\"PUT\"}','2021-10-24 22:42:33','2021-10-24 22:42:33'),
	(816,2,'admin/purchase-orders/42/edit','GET','112.14.53.205','[]','2021-10-24 22:42:34','2021-10-24 22:42:34'),
	(817,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:42:36','2021-10-24 22:42:36'),
	(818,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}','2021-10-24 22:42:44','2021-10-24 22:42:44'),
	(819,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"4\"}','2021-10-24 22:42:47','2021-10-24 22:42:47'),
	(820,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}','2021-10-24 22:42:51','2021-10-24 22:42:51'),
	(821,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2021-10-24 22:42:58','2021-10-24 22:42:58'),
	(822,2,'admin/purchase-orders/42/edit','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:43:04','2021-10-24 22:43:04'),
	(823,2,'admin/purchase-orders/42','PUT','112.14.53.205','{\"no\":\"PO100042\",\"last_number\":\"100042\",\"supplier_id\":\"16\",\"order_time\":\"2016-11-21\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/purchase-orders?&page=2\"}','2021-10-24 22:43:16','2021-10-24 22:43:16'),
	(824,2,'admin/purchase-orders/42/edit','GET','112.14.53.205','[]','2021-10-24 22:43:16','2021-10-24 22:43:16'),
	(825,2,'admin/purchase-orders/42','PUT','112.14.53.205','{\"no\":\"PO100042\",\"last_number\":\"100042\",\"supplier_id\":\"16\",\"order_time\":\"2016-11-21\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_method\":\"PUT\"}','2021-10-24 22:43:20','2021-10-24 22:43:20'),
	(826,2,'admin/purchase-orders/42/edit','GET','112.14.53.205','[]','2021-10-24 22:43:20','2021-10-24 22:43:20'),
	(827,2,'admin/purchase-orders/42','PUT','112.14.53.205','{\"no\":\"PO100042\",\"last_number\":\"100042\",\"supplier_id\":\"16\",\"order_time\":\"2016-11-21\",\"_token\":\"6CpXYNj8b6JyAG6aV1nfWfupxP7uar16FjNp3Wri\",\"_method\":\"PUT\"}','2021-10-24 22:43:30','2021-10-24 22:43:30'),
	(828,2,'admin/purchase-orders/42/edit','GET','112.14.53.205','[]','2021-10-24 22:43:30','2021-10-24 22:43:30'),
	(829,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 22:43:37','2021-10-24 22:43:37'),
	(830,1,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 22:43:58','2021-10-24 22:43:58'),
	(831,2,'admin','GET','112.14.53.205','[]','2021-10-24 23:00:02','2021-10-24 23:00:02'),
	(832,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 23:00:10','2021-10-24 23:00:10'),
	(833,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2021-10-24 23:00:19','2021-10-24 23:00:19'),
	(834,2,'admin/purchase-orders/42/edit','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 23:00:24','2021-10-24 23:00:24'),
	(835,2,'admin/purchase-orders/42','PUT','112.14.53.205','{\"no\":\"PO100042\",\"last_number\":\"100042\",\"supplier_id\":\"16\",\"order_time\":\"2016-11-21\",\"_token\":\"A3TgsmisFCiXeRp0FWS2KxVjeKejRNEiun0FbWp9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/purchase-orders?&page=2\"}','2021-10-24 23:00:35','2021-10-24 23:00:35'),
	(836,2,'admin/purchase-orders','GET','112.14.53.205','{\"page\":\"2\"}','2021-10-24 23:00:35','2021-10-24 23:00:35'),
	(837,2,'admin/purchase-orders','GET','112.14.53.205','{\"page\":\"2\",\"per_page\":\"100\",\"_pjax\":\"#pjax-container\"}','2021-10-24 23:00:47','2021-10-24 23:00:47'),
	(838,2,'admin/purchase-orders','GET','112.14.53.205','{\"page\":\"1\",\"per_page\":\"100\",\"_pjax\":\"#pjax-container\"}','2021-10-24 23:00:47','2021-10-24 23:00:47'),
	(839,2,'admin/purchase-orders','GET','112.14.53.205','{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}','2021-10-24 23:01:06','2021-10-24 23:01:06'),
	(840,2,'admin/purchase-orders','GET','112.14.53.205','{\"page\":\"2\",\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}','2021-10-24 23:01:15','2021-10-24 23:01:15'),
	(841,2,'admin/purchase-orders','GET','112.14.53.205','{\"page\":\"2\",\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}','2021-10-24 23:01:15','2021-10-24 23:01:15'),
	(842,2,'admin/purchase-orders','GET','112.14.53.205','{\"page\":\"1\",\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}','2021-10-24 23:01:15','2021-10-24 23:01:15'),
	(843,2,'admin/purchase-orders/19','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-24 23:02:22','2021-10-24 23:02:22'),
	(844,2,'admin/purchase-orders/19','GET','112.14.53.205','[]','2021-10-24 23:05:13','2021-10-24 23:05:13'),
	(845,2,'admin/purchase-orders','GET','112.14.53.205','{\"page\":\"1\",\"per_page\":\"100\",\"_pjax\":\"#pjax-container\"}','2021-10-24 23:05:17','2021-10-24 23:05:17'),
	(846,2,'admin/purchase-orders','GET','112.14.53.205','{\"page\":\"1\",\"per_page\":\"100\"}','2021-10-24 23:21:31','2021-10-24 23:21:31'),
	(847,2,'admin/purchase-orders','GET','112.14.53.205','{\"per_page\":\"100\",\"supplier_id\":\"1\",\"order_time\":{\"start\":null,\"end\":null},\"_pjax\":\"#pjax-container\"}','2021-10-24 23:21:51','2021-10-24 23:21:51'),
	(848,2,'admin/purchase-orders','GET','112.14.53.205','{\"per_page\":\"100\",\"_pjax\":\"#pjax-container\",\"supplier_id\":\"1\",\"order_time\":{\"start\":\"2016-09-01\",\"end\":\"2016-10-30\"}}','2021-10-24 23:22:36','2021-10-24 23:22:36'),
	(849,2,'admin','GET','112.14.53.205','[]','2021-10-25 09:22:13','2021-10-25 09:22:13'),
	(850,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:22:33','2021-10-25 09:22:33'),
	(851,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:26:28','2021-10-25 09:26:28'),
	(852,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:26:37','2021-10-25 09:26:37'),
	(853,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6d59\\u6c5f\\u54c1\\u51a0\\u65b0\\u6750\\u6599\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330881MA28F16864\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u8862\\u5dde\\u5e02\\u6c5f\\u5c71\\u7ecf\\u6d4e\\u5f00\\u53d1\\u533a\\u6c5f\\u4e1c\\u533a\\u5174\\u5de5\\u4e8c\\u8def14-1\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 09:28:03','2021-10-25 09:28:03'),
	(854,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 09:28:03','2021-10-25 09:28:03'),
	(855,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:33:05','2021-10-25 09:33:05'),
	(856,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u5949\\u5316\\u533a\\u65e5\\u5347\\u78f7\\u5316\\u5242\\u5382\",\"tax_number\":\"92330283MA292WJ83T\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u5949\\u5316\\u533a\\u897f\\u575e\\u8857\\u9053\\u897f\\u4ef2\\u6751\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 09:34:47','2021-10-25 09:34:47'),
	(857,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 09:34:47','2021-10-25 09:34:47'),
	(858,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:34:53','2021-10-25 09:34:53'),
	(859,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5609\\u5174\\u516b\\u5339\\u9a6c\\u5316\\u5de5\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330402350161162C\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5609\\u5174\\u5e02\\u5357\\u6e56\\u533a\\u51e4\\u6865\\u9547\\u7ecf\\u56db\\u8def\\u897f\\u4fa7\\uff08\\u5609\\u5174\\u5e02\\u51e4\\u6865\\u7eb8\\u54c1\\u5382\\uff09\\u5185\\u5927\\u697c\\u4e09\\u697c\\u897f\\u4fa7\\u4e00\\u5e62162C\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 09:37:30','2021-10-25 09:37:30'),
	(860,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 09:37:30','2021-10-25 09:37:30'),
	(861,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:37:36','2021-10-25 09:37:36'),
	(862,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e34\\u5b89\\u79d1\\u661f\\u4e34\\u5b89\\u79d1\\u661f\\u91d1\\u5c5e\\u8868\\u9762\\u5904\\u7406\\u5242\\u5382\",\"tax_number\":\"913301857319909763\",\"address\":\"\\u4e34\\u5b89\\u5e02\\u9526\\u5357\\u8857\\u9053\\u67ef\\u5bb6\\u6751\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 09:40:31','2021-10-25 09:40:31'),
	(863,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 09:40:31','2021-10-25 09:40:31'),
	(864,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:40:40','2021-10-25 09:40:40'),
	(865,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u76d0\\u57ce\\u5e02\\u9f0e\\u6717\\u5546\\u8d38\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913209233310999491\",\"address\":\"\\u961c\\u5b81\\u53bf\\u961c\\u57ce\\u8857\\u9053\\u529e\\u7f2a\\u9ec4\\u6751\\u4e00\\u3001\\u4e5d\\u7ec4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 09:43:12','2021-10-25 09:43:12'),
	(866,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 09:43:12','2021-10-25 09:43:12'),
	(867,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:43:17','2021-10-25 09:43:17'),
	(868,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e2d\\u661f \\u5b81\\u6ce2\\u5e02\\u9547\\u6d77\\u4e2d\\u661f\\u91d1\\u5c5e\\u8868\\u9762\\u5904\\u7406\\u5242\\u5382\",\"tax_number\":\"91330211563856232F\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u9547\\u6d77\\u533a\\u87f9\\u6d66\\u9547\\u6e7e\\u5858\\u6751\\uff08\\u4fe1\\u7528\\u793e\\u8fb9\\uff09\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 09:48:40','2021-10-25 09:48:40'),
	(869,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 09:48:41','2021-10-25 09:48:41'),
	(870,2,'admin/customers/20/edit','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:48:58','2021-10-25 09:48:58'),
	(871,2,'admin/customers/20','PUT','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u9547\\u6d77\\u4e2d\\u661f\\u91d1\\u5c5e\\u8868\\u9762\\u5904\\u7406\\u5242\\u5382\",\"tax_number\":\"91330211563856232F\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u9547\\u6d77\\u533a\\u87f9\\u6d66\\u9547\\u6e7e\\u5858\\u6751\\uff08\\u4fe1\\u7528\\u793e\\u8fb9\\uff09\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 09:49:06','2021-10-25 09:49:06'),
	(872,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 09:49:06','2021-10-25 09:49:06'),
	(873,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:49:11','2021-10-25 09:49:11'),
	(874,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u7389\\u73af\\u94f6\\u4e30\\u91d1\\u5c5e\\u52a9\\u5242\\u5382\\uff08\\u666e\\u901a\\u5408\\u4f19\\uff09\",\"tax_number\":\"913310217331902512\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u7389\\u73af\\u5e02\\u7389\\u57ce\\u8857\\u9053\\u57ce\\u5317\\u521b\\u878d\\u4ea7\\u4e1a\\u57ce16\\u5e62101\\u3001201\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 09:52:47','2021-10-25 09:52:47'),
	(875,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 09:52:47','2021-10-25 09:52:47'),
	(876,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:52:50','2021-10-25 09:52:50'),
	(877,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u7ecd\\u5174\\u6c47\\u4e3d\\u73af\\u4fdd\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330604609674830U\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u7ecd\\u5174\\u5e02\\u4e0a\\u865e\\u533a\\u6881\\u6e56\\u5de5\\u4e1a\\u56ed\\u533a\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 09:54:49','2021-10-25 09:54:49'),
	(878,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 09:54:49','2021-10-25 09:54:49'),
	(879,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:55:52','2021-10-25 09:55:52'),
	(880,1,'admin/purchase-orders','GET','122.246.49.38','[]','2021-10-25 09:58:53','2021-10-25 09:58:53'),
	(881,1,'admin/customer-orders','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:58:59','2021-10-25 09:58:59'),
	(882,1,'admin/purchase-orders','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:59:07','2021-10-25 09:59:07'),
	(883,1,'admin/customer-orders','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:59:18','2021-10-25 09:59:18'),
	(884,1,'admin/customers','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:59:26','2021-10-25 09:59:26'),
	(885,1,'admin/purchase-orders','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:59:31','2021-10-25 09:59:31'),
	(886,1,'admin/suppliers','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:59:33','2021-10-25 09:59:33'),
	(887,1,'admin/supplier-invoices','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:59:34','2021-10-25 09:59:34'),
	(888,1,'admin/suppliers','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:59:34','2021-10-25 09:59:34'),
	(889,1,'admin/suppliers','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2021-10-25 09:59:43','2021-10-25 09:59:43'),
	(890,1,'admin/suppliers','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}','2021-10-25 09:59:46','2021-10-25 09:59:46'),
	(891,1,'admin/purchase-orders','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:59:55','2021-10-25 09:59:55'),
	(892,1,'admin/customer-orders','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:59:57','2021-10-25 09:59:57'),
	(893,1,'admin/customers','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 09:59:58','2021-10-25 09:59:58'),
	(894,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u911e\\u5dde\\u6052\\u8d1d\\u91d1\\u5c5e\\u8868\\u9762\\u5904\\u7406\\u5242\\u5382\",\"tax_number\":\"913302126620898090\",\"address\":\"\\u5b81\\u6ce2\\u5e02\\u911e\\u5dde\\u533a\\u4e94\\u4e61\\u9547\\u77f3\\u5c71\\u5f04\\u6751\\u51af\\u5bb6\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 10:00:43','2021-10-25 10:00:43'),
	(895,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 10:00:43','2021-10-25 10:00:43'),
	(896,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:00:46','2021-10-25 10:00:46'),
	(897,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5d4a\\u5dde\\u5e02\\u6625\\u51ef\\u65b0\\u6750\\u6599\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330683726620719N\",\"address\":\"\\u5d4a\\u5dde\\u5e02\\u7ecf\\u6d4e\\u5f00\\u53d1\\u533a\\uff08\\u4e09\\u754c\\uff09\\u4e0b\\u5e02\\u5934\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 10:03:34','2021-10-25 10:03:34'),
	(898,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 10:03:34','2021-10-25 10:03:34'),
	(899,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:03:37','2021-10-25 10:03:37'),
	(900,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u4f1f\\u76ca\\u91d1\\u5c5e\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913302110792167355\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u9547\\u6d77\\u533a\\u86df\\u5ddd\\u8857\\u9053\\u4fde\\u8303\\u4e1c\\u8def770\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 10:07:54','2021-10-25 10:07:54'),
	(901,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 10:07:54','2021-10-25 10:07:54'),
	(902,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:07:57','2021-10-25 10:07:57'),
	(903,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u829c\\u6e56\\u767e\\u5ddd\\u73af\\u4fdd\\u8bbe\\u5907\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91340221MA2MTYGF6L\",\"address\":\"\\u829c\\u6e56\\u53bf\\u516d\\u90ce\\u9547\\u6bb7\\u6e2f\\u5de5\\u4e1a\\u56ed\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 10:10:56','2021-10-25 10:10:56'),
	(904,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 10:10:56','2021-10-25 10:10:56'),
	(905,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:11:49','2021-10-25 10:11:49'),
	(906,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u676d\\u5dde\\u7eff\\u666e\\u5316\\u5de5\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330100773590305W\",\"address\":\"\\u676d\\u5dde\\u4e34\\u6c5f\\u5de5\\u4e1a\\u56ed\\u533a\\u7ecf\\u516b\\u8def1188\\u53f7\\u4e09\\u697c306\\u5ba4\\u3001\\u4e00\\u697c101\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 10:12:39','2021-10-25 10:12:39'),
	(907,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 10:12:39','2021-10-25 10:12:39'),
	(908,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:14:31','2021-10-25 10:14:31'),
	(909,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6e56\\u5dde\\u4e45\\u6b23\\u7814\\u78e8\\u6750\\u6599\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330503MA29KKME7P\",\"address\":\"\\u6e56\\u5dde\\u5e02\\u5357\\u6d54\\u533a\\u53cc\\u6797\\u9547\\u96c9\\u5934\\u6751\\u7ef4\\u591a\\u5229\\u5927\\u905353\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 10:15:50','2021-10-25 10:15:50'),
	(910,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 10:15:50','2021-10-25 10:15:50'),
	(911,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:15:52','2021-10-25 10:15:52'),
	(912,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5d4a\\u5dde\\u5e02\\u96c5\\u65af\\u5fb7\\u7eba\\u7ec7\\u52a9\\u5242\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330683697004465M\",\"address\":\"\\u5d4a\\u5dde\\u5e02\\u957f\\u4e50\\u9547\\u73af\\u9547\\u4e2d\\u8def1\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 10:18:39','2021-10-25 10:18:39'),
	(913,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 10:18:39','2021-10-25 10:18:39'),
	(914,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:18:54','2021-10-25 10:18:54'),
	(915,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u8bf8\\u66a8\\u5fb7\\u6da6\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913306815943507448\",\"address\":\"\\u8bf8\\u66a8\\u5e02\\u5927\\u5510\\u9547\\u534e\\u6d77\\u8def98-16\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 10:23:32','2021-10-25 10:23:32'),
	(916,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 10:23:32','2021-10-25 10:23:32'),
	(917,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:23:35','2021-10-25 10:23:35'),
	(918,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u9752\\u7530\\u4e07\\u6d01\\u65e5\\u5316\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913311213136321647\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u4e3d\\u6c34\\u5e02\\u9752\\u7530\\u53bf\\u6e29\\u6eaa\\u9547\\u57ce\\u4e2d\\u5c0f\\u533a54\\u5e629\\u53f7\\u524d\\u95f4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 10:25:02','2021-10-25 10:25:02'),
	(919,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 10:25:03','2021-10-25 10:25:03'),
	(920,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:25:09','2021-10-25 10:25:09'),
	(921,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:25:27','2021-10-25 10:25:27'),
	(922,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:25:28','2021-10-25 10:25:28'),
	(923,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2021-10-25 10:25:43','2021-10-25 10:25:43'),
	(924,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:25:52','2021-10-25 10:25:52'),
	(925,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5949\\u5316\\u9686\\u946b\\u5207\\u524a\\u6db2\\u5382\",\"tax_number\":\"913302837867943669\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u5949\\u5316\\u533a\\u83bc\\u6e56\\u9547\\u5c99\\u53e3\\u6751\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&page=2\"}','2021-10-25 10:28:26','2021-10-25 10:28:26'),
	(926,2,'admin/customers','GET','112.14.53.205','{\"page\":\"2\"}','2021-10-25 10:28:26','2021-10-25 10:28:26'),
	(927,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:30:12','2021-10-25 10:30:12'),
	(928,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u676d\\u5dde\\u83c1\\u6d01\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330105MA28U3TT1X\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u676d\\u5dde\\u5e02\\u62f1\\u5885\\u533a\\u5eb7\\u60e0\\u8def1\\u53f75\\u5e62\\u4e00\\u697c103\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&page=2\"}','2021-10-25 10:31:01','2021-10-25 10:31:01'),
	(929,2,'admin/customers','GET','112.14.53.205','{\"page\":\"2\"}','2021-10-25 10:31:01','2021-10-25 10:31:01'),
	(930,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:31:11','2021-10-25 10:31:11'),
	(931,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6e56\\u5dde\\u81f4\\u529b\\u91d1\\u5c5e\\u5904\\u7406\\u5242\\u5382\",\"tax_number\":\"913305037530384174\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u6e56\\u5dde\\u5e02\\u5357\\u6d54\\u533a\\u548c\\u5b5a\\u9547\\u957f\\u8d85\\u5de5\\u4e1a\\u56ed\\u5185\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&page=2\"}','2021-10-25 10:32:58','2021-10-25 10:32:58'),
	(932,2,'admin/customers','GET','112.14.53.205','{\"page\":\"2\"}','2021-10-25 10:32:58','2021-10-25 10:32:58'),
	(933,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:33:59','2021-10-25 10:33:59'),
	(934,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u552f\\u541b\\u8d38\\u6613\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913302010538368641\",\"address\":\"\\u5b81\\u6ce2\\u4fdd\\u7a0e\\u533a\\u5174\\u4e1a\\u5927\\u90538\\u53f71\\u53f7\\u697c417\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&page=2\"}','2021-10-25 10:35:20','2021-10-25 10:35:20'),
	(935,2,'admin/customers','GET','112.14.53.205','{\"page\":\"2\"}','2021-10-25 10:35:21','2021-10-25 10:35:21'),
	(936,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:35:23','2021-10-25 10:35:23'),
	(937,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6c5f\\u5c71\\u8a89\\u51a0\\u6e05\\u6d17\\u5242\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330881568157596J\",\"address\":\"\\u6c5f\\u5c71\\u5e02\\u575b\\u77f3\\u9547\\u5360\\u5858\\u6751\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&page=2\"}','2021-10-25 10:37:45','2021-10-25 10:37:45'),
	(938,2,'admin/customers','GET','112.14.53.205','{\"page\":\"2\"}','2021-10-25 10:37:46','2021-10-25 10:37:46'),
	(939,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:37:48','2021-10-25 10:37:48'),
	(940,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u6d77\\u66d9\\u7545\\u6770\\u8d38\\u6613\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"9133020359948336XU\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u6d77\\u66d9\\u533a\\u987a\\u5fb7\\u8def350\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&page=2\"}','2021-10-25 10:43:18','2021-10-25 10:43:18'),
	(941,2,'admin/customers','GET','112.14.53.205','{\"page\":\"2\"}','2021-10-25 10:43:18','2021-10-25 10:43:18'),
	(942,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:43:21','2021-10-25 10:43:21'),
	(943,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e1c\\u9633\\u5e02\\u5609\\u6da6\\u7eba\\u7ec7\\u52a9\\u5242\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330783667127077W\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u4e1c\\u9633\\u5e02\\u6a2a\\u5e97\\u9547\\u5de5\\u4e1a\\u533a\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&page=2\"}','2021-10-25 10:45:37','2021-10-25 10:45:37'),
	(944,2,'admin/customers','GET','112.14.53.205','{\"page\":\"2\"}','2021-10-25 10:45:38','2021-10-25 10:45:38'),
	(945,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:45:40','2021-10-25 10:45:40'),
	(946,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5fb7\\u6615\\u77f3\\u5316\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330206573653711N\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u5317\\u4ed1\\u533a\\u6885\\u5c71\\u6885\\u5c71\\u5927\\u9053288\\u53f72\\u5e621106-5\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&page=2\"}','2021-10-25 10:47:11','2021-10-25 10:47:11'),
	(947,2,'admin/customers','GET','112.14.53.205','{\"page\":\"2\"}','2021-10-25 10:47:11','2021-10-25 10:47:11'),
	(948,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:47:14','2021-10-25 10:47:14'),
	(949,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:49:50','2021-10-25 10:49:50'),
	(950,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2021-10-25 10:50:00','2021-10-25 10:50:00'),
	(951,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:51:13','2021-10-25 10:51:13'),
	(952,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5949\\u5316\\u5949\\u6e2f\\u65e5\\u7528\\u5316\\u5de5\\u5382\",\"tax_number\":\"913302836102164311\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u5949\\u5316\\u533a\\u4e1c\\u90ca\\u5f00\\u53d1\\u533a\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&page=2\"}','2021-10-25 10:55:23','2021-10-25 10:55:23'),
	(953,2,'admin/customers','GET','112.14.53.205','{\"page\":\"2\"}','2021-10-25 10:55:23','2021-10-25 10:55:23'),
	(954,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:55:47','2021-10-25 10:55:47'),
	(955,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 10:59:38','2021-10-25 10:59:38'),
	(956,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2021-10-25 10:59:58','2021-10-25 10:59:58'),
	(957,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 11:00:17','2021-10-25 11:00:17'),
	(958,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5fb7\\u6e05\\u79d1\\u7acb\\u6d01\\u6d17\\u6da4\\u670d\\u52a1\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330521MA2B4MY33L\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u6e56\\u5dde\\u5e02\\u5fb7\\u6e05\\u53bf\\u949f\\u7ba1\\u9547\\u5357\\u6e56\\u8def7\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&page=2\"}','2021-10-25 11:00:57','2021-10-25 11:00:57'),
	(959,2,'admin/customers','GET','112.14.53.205','{\"page\":\"2\"}','2021-10-25 11:00:58','2021-10-25 11:00:58'),
	(960,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 11:04:13','2021-10-25 11:04:13'),
	(961,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5fb7\\u6e05\\u53bf\\u79d1\\u660e\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330521147113456Q\",\"address\":\"\\u5fb7\\u6e05\\u53bf\\u4e7e\\u5143\\u9547\\u9f50\\u661f\\u6751\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&page=2\"}','2021-10-25 11:05:10','2021-10-25 11:05:10'),
	(962,2,'admin/customers','GET','112.14.53.205','{\"page\":\"2\"}','2021-10-25 11:05:11','2021-10-25 11:05:11'),
	(963,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 11:05:13','2021-10-25 11:05:13'),
	(964,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 11:05:50','2021-10-25 11:05:50'),
	(965,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"id\":\"\\u4e34\\u5b89\\u79d1\\u661f\"}','2021-10-25 11:06:20','2021-10-25 11:06:20'),
	(966,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 11:06:26','2021-10-25 11:06:26'),
	(967,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 11:06:28','2021-10-25 11:06:28'),
	(968,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e34\\u5b89\\u79d1\\u661f\\u91d1\\u5c5e\\u8868\\u9762\\u5904\\u7406\\u5242\\u5382\",\"tax_number\":\"913301857319909763\",\"address\":\"\\u4e34\\u5b89\\u5e02\\u9526\\u5357\\u8857\\u9053\\u67ef\\u5bb6\\u6751\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 11:07:40','2021-10-25 11:07:40'),
	(969,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 11:07:40','2021-10-25 11:07:40'),
	(970,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 11:07:42','2021-10-25 11:07:42'),
	(971,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6606\\u5c71\\u534e\\u6797\\u5370\\u67d3\\u52a9\\u5242\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"9132058376240591XM\",\"address\":\"\\u6606\\u5c71\\u5e02\\u6dc0\\u5c71\\u6e56\\u9547\\u6c38\\u52e4\\u6751\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-25 11:09:27','2021-10-25 11:09:27'),
	(972,2,'admin/customers','GET','112.14.53.205','[]','2021-10-25 11:09:27','2021-10-25 11:09:27'),
	(973,2,'admin/customers','GET','112.14.53.205','{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}','2021-10-25 11:10:33','2021-10-25 11:10:33'),
	(974,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}','2021-10-25 11:11:00','2021-10-25 11:11:00'),
	(975,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 11:11:10','2021-10-25 11:11:10'),
	(976,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5efa\\u5fb7\\u5e02\\u987a\\u53d1\\u5316\\u5de5\\u52a9\\u5242\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"9133018277662171XX\",\"address\":\"\\u5efa\\u5fb7\\u5e02\\u65b0\\u5b89\\u6c5f\\u8857\\u9053\\u56ed\\u533a\\u8def88\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&page=3\"}','2021-10-25 12:51:24','2021-10-25 12:51:24'),
	(977,2,'admin/customers','GET','112.14.53.205','{\"page\":\"3\"}','2021-10-25 12:51:24','2021-10-25 12:51:24'),
	(978,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 12:51:30','2021-10-25 12:51:30'),
	(979,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5d4a\\u5dde\\u5e02\\u6da6\\u8fbe\\u52a9\\u5242\\u5382\",\"tax_number\":\"913306837498478288\",\"address\":\"\\u5d4a\\u5dde\\u5e02\\u5261\\u6e56\\u8857\\u9053\\u7f57\\u67f1\\u5c99\\u5de5\\u4e1a\\u56ed\\u533a\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&page=3\"}','2021-10-25 12:54:42','2021-10-25 12:54:42'),
	(980,2,'admin/customers','GET','112.14.53.205','{\"page\":\"3\"}','2021-10-25 12:54:42','2021-10-25 12:54:42'),
	(981,2,'admin/customers','GET','112.14.53.205','{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}','2021-10-25 12:55:01','2021-10-25 12:55:01'),
	(982,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}','2021-10-25 12:55:14','2021-10-25 12:55:14'),
	(983,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}','2021-10-25 12:55:23','2021-10-25 12:55:23'),
	(984,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 12:55:26','2021-10-25 12:55:26'),
	(985,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 12:55:47','2021-10-25 12:55:47'),
	(986,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"id\":\"\\u5d4a\\u5dde\"}','2021-10-25 12:56:10','2021-10-25 12:56:10'),
	(987,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 12:56:32','2021-10-25 12:56:32'),
	(988,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"id\":\"\\u5d4a\\u5dde\"}','2021-10-25 12:56:47','2021-10-25 12:56:47'),
	(989,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"id\":\"\\u5d4a\\u5dde\"}','2021-10-25 12:56:55','2021-10-25 12:56:55'),
	(990,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 12:56:57','2021-10-25 12:56:57'),
	(991,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}','2021-10-25 12:57:05','2021-10-25 12:57:05'),
	(992,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 12:57:43','2021-10-25 12:57:43'),
	(993,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u676d\\u5dde\\u827a\\u6d0b\\u6d82\\u88c5\\u6750\\u6599\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330109MA27XE6N1E\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u676d\\u5dde\\u5e02\\u94b1\\u5858\\u65b0\\u533a\\u524d\\u8fdb\\u8857\\u9053\\u8bda\\u667a\\u5546\\u52a1\\u4e2d\\u5fc35\\u53f7\\u697c\\u524d\\u8fdb\\u4f17\\u667a\\u521b\\u4e1a\\u56ed6102\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 12:59:26','2021-10-25 12:59:26'),
	(994,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 12:59:26','2021-10-25 12:59:26'),
	(995,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 12:59:31','2021-10-25 12:59:31'),
	(996,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5609\\u5174\\u5e02\\u6c38\\u6e90\\u6625\\u7eba\\u7ec7\\u52a9\\u5242\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913304116795567334\",\"address\":\"\\u5609\\u5174\\u5e02\\u79c0\\u6d32\\u533a\\u6d2a\\u5408\\u9547\\u6cfe\\u6865\\u6751\\u5de5\\u5177\\u4e09\\u5206\\u5382\\u5185\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:01:41','2021-10-25 13:01:41'),
	(997,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:01:41','2021-10-25 13:01:41'),
	(998,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:01:44','2021-10-25 13:01:44'),
	(999,2,'admin/customer-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:02:05','2021-10-25 13:02:05'),
	(1000,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:02:08','2021-10-25 13:02:08'),
	(1001,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}','2021-10-25 13:02:17','2021-10-25 13:02:17'),
	(1002,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:02:36','2021-10-25 13:02:36'),
	(1003,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u676d\\u5dde\\u6cb9\\u8102\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330100253921094G\",\"address\":\"\\u676d\\u5dde\\u5e02\\u8427\\u5c71\\u533a\\u4e34\\u6c5f\\u5de5\\u4e1a\\u56ed\\u533a\\u7ecf\\u516b\\u8def1188\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:03:55','2021-10-25 13:03:55'),
	(1004,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:03:55','2021-10-25 13:03:55'),
	(1005,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:03:58','2021-10-25 13:03:58'),
	(1006,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u6d77\\u66d9\\u660e\\u6770\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913302035670310436\",\"address\":\"\\u5b81\\u6ce2\\u5e02\\u6d77\\u66d9\\u533a\\u96c6\\u58eb\\u6e2f\\u9547\\u5de5\\u4e1a\\u56ed\\u533a\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:10:06','2021-10-25 13:10:06'),
	(1007,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:10:07','2021-10-25 13:10:07'),
	(1008,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:10:10','2021-10-25 13:10:10'),
	(1009,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u6c5f\\u5317\\u6770\\u7545\\u7eba\\u7ec7\\u54c1\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330205595383847K\",\"address\":\"\\u6c5f\\u5317\\u533a\\u6587\\u6559\\u8def85\\u53f7146\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:11:56','2021-10-25 13:11:56'),
	(1010,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:11:56','2021-10-25 13:11:56'),
	(1011,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:11:59','2021-10-25 13:11:59'),
	(1012,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e0a\\u6d77\\u597d\\u798f\\u4f73\\u6d17\\u6da4\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91310117060912597T\",\"address\":\"\\u4e0a\\u6d77\\u5e02\\u677e\\u6c5f\\u533a\\u77f3\\u6e56\\u8361\\u9547\\u95f5\\u5854\\u8def1500\\u5f0422\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:15:19','2021-10-25 13:15:19'),
	(1013,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:15:19','2021-10-25 13:15:19'),
	(1014,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:15:22','2021-10-25 13:15:22'),
	(1015,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u798f\\u4ed5\\u8fbe\\u91d1\\u5c5e\\u52a0\\u5de5\\u6db2\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330206058260155Y\",\"address\":\"\\u5317\\u4ed1\\u533a\\u5c0f\\u6e2f\\u8857\\u9053\\u4e94\\u76df\\u6751\\u5de5\\u4e1a\\u533a\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:16:37','2021-10-25 13:16:37'),
	(1016,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:16:37','2021-10-25 13:16:37'),
	(1017,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:17:02','2021-10-25 13:17:02'),
	(1018,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u6cf0\\u535a\\u6da6\\u7279\\u6da6\\u6ed1\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913302013169196977\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u9ad8\\u65b0\\u533a\\u9662\\u58eb\\u8def66\\u53f7\\u521b\\u4e1a\\u5927\\u53a6439\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:19:00','2021-10-25 13:19:00'),
	(1019,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:19:00','2021-10-25 13:19:00'),
	(1020,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:19:04','2021-10-25 13:19:04'),
	(1021,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e09\\u95e8\\u53bf\\u5353\\u5c1a\\u65e5\\u5316\\u5382\",\"tax_number\":\"91331022693853208T\",\"address\":\"\\u4e09\\u95e8\\u53bf\\u6d77\\u6da6\\u8857\\u9053\\u5934\\u5c99\\u6751\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:20:36','2021-10-25 13:20:36'),
	(1022,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:20:37','2021-10-25 13:20:37'),
	(1023,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:20:39','2021-10-25 13:20:39'),
	(1024,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:21:08','2021-10-25 13:21:08'),
	(1025,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}','2021-10-25 13:21:12','2021-10-25 13:21:12'),
	(1026,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:22:15','2021-10-25 13:22:15'),
	(1027,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:24:29','2021-10-25 13:24:29'),
	(1028,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:24:29','2021-10-25 13:24:29'),
	(1029,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}','2021-10-25 13:24:35','2021-10-25 13:24:35'),
	(1030,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:24:42','2021-10-25 13:24:42'),
	(1031,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5357\\u4eac\\u7fa4\\u7b56\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913201023026386594\",\"address\":\"\\u5357\\u4eac\\u5e02\\u7384\\u6b66\\u533a\\u82b1\\u56ed\\u8def8\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:26:39','2021-10-25 13:26:39'),
	(1032,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:26:40','2021-10-25 13:26:40'),
	(1033,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:26:41','2021-10-25 13:26:41'),
	(1034,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5e38\\u5c71\\u53bf\\u4eca\\u5c14\\u91d1\\u5c5e\\u52a0\\u5de5\\u6da6\\u6ed1\\u5242\\u5382\",\"tax_number\":\"91330822771923292L\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5e38\\u5c71\\u53bf\\u65b0\\u90fd\\u5de5\\u4e1a\\u56ed\\u533a\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:28:11','2021-10-25 13:28:11'),
	(1035,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:28:11','2021-10-25 13:28:11'),
	(1036,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:28:15','2021-10-25 13:28:15'),
	(1037,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5174\\u4e09\\u548c\\u6cf0\\u6d82\\u88c5\\u6750\\u6599\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"9133020669138142XH\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u5317\\u4ed1\\u533a\\u971e\\u6d66\\u8857\\u9053\\u5c71\\u524d\\u5de5\\u4e1a\\u5c0f\\u533a\\u6d66\\u6cc9\\u8def27\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:29:36','2021-10-25 13:29:36'),
	(1038,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:29:36','2021-10-25 13:29:36'),
	(1039,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:29:39','2021-10-25 13:29:39'),
	(1040,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6d59\\u6c5f\\u5170\\u6b4c\\u5316\\u5b66\\u5de5\\u4e1a\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330784147478885C\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u6c38\\u5eb7\\u5e02\\u57ce\\u897f\\u65b0\\u533a\\u82b1\\u90fd\\u8def138\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:31:30','2021-10-25 13:31:30'),
	(1041,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:31:31','2021-10-25 13:31:31'),
	(1042,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:31:33','2021-10-25 13:31:33'),
	(1043,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:32:24','2021-10-25 13:32:24'),
	(1044,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}','2021-10-25 13:32:32','2021-10-25 13:32:32'),
	(1045,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:33:05','2021-10-25 13:33:05'),
	(1046,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6148\\u6eaa\\u9f0e\\u5b89\\u65b9\\u821f\\u73af\\u4fdd\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330282MA2CKKWJ40\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u6148\\u6eaa\\u5e02\\u5b97\\u6c49\\u8857\\u9053\\u6f6e\\u5858\\u6751\\u6cb9\\u8f66\\u6c5f\\u5f0432\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:35:03','2021-10-25 13:35:03'),
	(1047,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:35:03','2021-10-25 13:35:03'),
	(1048,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:36:05','2021-10-25 13:36:05'),
	(1049,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u6c5f\\u5317\\u946b\\u5149\\u52a9\\u5242\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330205756264356Y\",\"address\":\"\\u6c5f\\u5317\\u533a\\u79c1\\u8425\\u5de5\\u4e1a\\u57ce\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:36:41','2021-10-25 13:36:41'),
	(1050,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:36:41','2021-10-25 13:36:41'),
	(1051,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:36:46','2021-10-25 13:36:46'),
	(1052,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4f59\\u59da\\u5e02\\u9886\\u822a\\u5851\\u5316\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330281074916724G\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u4f59\\u59da\\u5e02\\u51e4\\u5c71\\u8857\\u9053\\u6c38\\u4e30\\u6751\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:38:49','2021-10-25 13:38:49'),
	(1053,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:38:50','2021-10-25 13:38:50'),
	(1054,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:38:52','2021-10-25 13:38:52'),
	(1055,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e0a\\u6d77\\u82f1\\u6da6\\u514b\\u5b9e\\u4e1a\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91310117060936038P\",\"address\":\"\\u4e0a\\u6d77\\u5e02\\u677e\\u6c5f\\u533a\\u77f3\\u6e56\\u8361\\u9547\\u677e\\u84b8\\u516c\\u8def\\u5317\\u4fa7\\u6807\\u51c6\\u5382\\u623f12\\u5e62-52\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:41:06','2021-10-25 13:41:06'),
	(1056,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:41:06','2021-10-25 13:41:06'),
	(1057,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:41:08','2021-10-25 13:41:08'),
	(1058,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5357\\u4eac\\u6cf0\\u529b\\u601d\\u73af\\u4fdd\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320115MA1TA61U8C\",\"address\":\"\\u5357\\u4eac\\u5e02\\u6c5f\\u5b81\\u533a\\u7984\\u53e3\\u8857\\u9053\\u949f\\u6751\\u793e\\u533a\\uff08\\u6c5f\\u5b81\\u5f00\\u53d1\\u533a\\uff09\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:42:41','2021-10-25 13:42:41'),
	(1059,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:42:41','2021-10-25 13:42:41'),
	(1060,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:42:44','2021-10-25 13:42:44'),
	(1061,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6d59\\u6c5f\\u6c38\\u5728\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913307261477056974\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u6d66\\u6c5f\\u53bf\\u6c38\\u5728\\u5927\\u9053999\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:43:53','2021-10-25 13:43:53'),
	(1062,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:43:53','2021-10-25 13:43:53'),
	(1063,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:43:57','2021-10-25 13:43:57'),
	(1064,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5c71\\u897f\\u6d25\\u6d25\\u623f\\u5730\\u4ea7\\u5f00\\u53d1\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91140800776739806H\",\"address\":\"\\u5c71\\u897f\\u7701\\u8fd0\\u57ce\\u5e02\\u6cb3\\u6d25\\u5e02\\u5b66\\u5e9c\\u8def\\u5317\\u3001209\\u56fd\\u9053\\u897f\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:48:04','2021-10-25 13:48:04'),
	(1065,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:48:05','2021-10-25 13:48:05'),
	(1066,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:48:07','2021-10-25 13:48:07'),
	(1067,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u65e0\\u9521\\u5e02\\u535a\\u6c5f\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320214775407260Y\",\"address\":\"\\u5b9c\\u5174\\u5e02\\u65b0\\u8857\\u8857\\u9053\\u9646\\u5e73\\u6751\\u5858\\u5357\\u7ec4\\u5341\\u4ea9\\u8361\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:49:30','2021-10-25 13:49:30'),
	(1068,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:49:30','2021-10-25 13:49:30'),
	(1069,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:49:32','2021-10-25 13:49:32'),
	(1070,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:50:09','2021-10-25 13:50:09'),
	(1071,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}','2021-10-25 13:50:15','2021-10-25 13:50:15'),
	(1072,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:50:24','2021-10-25 13:50:24'),
	(1073,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u91d1\\u4f83\\u65b0\\u6750\\u6599\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330201MA2AJXPJ81\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u9ad8\\u65b0\\u533a\\u8d35\\u9a77\\u6c11\\u8054\\u6751\\u5f20\\u5bb6\\u755457\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:54:10','2021-10-25 13:54:10'),
	(1074,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:54:10','2021-10-25 13:54:10'),
	(1075,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:54:13','2021-10-25 13:54:13'),
	(1076,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5408\\u80a5\\u4e09\\u8861\\u73af\\u4fdd\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91340100575728422X\",\"address\":\"\\u5b89\\u5fbd\\u7701\\u5408\\u80a5\\u5e02\\u7ecf\\u6d4e\\u6280\\u672f\\u5f00\\u53d1\\u533a\\u84ec\\u83b1\\u8def\\u4ee5\\u897f\\u3001\\u7d2b\\u4e91\\u8def\\u4ee5\\u5317\\u5382\\u623f\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:56:43','2021-10-25 13:56:43'),
	(1077,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:56:43','2021-10-25 13:56:43'),
	(1078,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:56:45','2021-10-25 13:56:45'),
	(1079,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:57:19','2021-10-25 13:57:19'),
	(1080,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}','2021-10-25 13:57:30','2021-10-25 13:57:30'),
	(1081,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:57:56','2021-10-25 13:57:56'),
	(1082,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u65e0\\u9521\\u5e02\\u535a\\u6c5f\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320214775407260Y\",\"address\":\"\\u5b9c\\u5174\\u5e02\\u65b0\\u8857\\u8857\\u9053\\u9646\\u5e73\\u6751\\u5858\\u5357\\u7ec4\\u5341\\u4ea9\\u8361\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 13:58:49','2021-10-25 13:58:49'),
	(1083,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 13:58:50','2021-10-25 13:58:50'),
	(1084,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 13:58:52','2021-10-25 13:58:52'),
	(1085,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u676d\\u5dde\\u5b89\\u76df\\u8d38\\u6613\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330104662347791D\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u676d\\u5dde\\u5e02\\u6c5f\\u5e72\\u533a\\u51e4\\u8d77\\u5e7f\\u573aB\\u5ea7502\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:00:27','2021-10-25 14:00:27'),
	(1086,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:00:27','2021-10-25 14:00:27'),
	(1087,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:00:29','2021-10-25 14:00:29'),
	(1088,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6c5f\\u82cf\\u674e\\u6587\\u7532\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913212007724934666\",\"address\":\"\\u59dc\\u5830\\u7ecf\\u6d4e\\u5f00\\u53d1\\u533a\\u6cf0\\u5dde\\u8def568\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:01:54','2021-10-25 14:01:54'),
	(1089,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:01:55','2021-10-25 14:01:55'),
	(1090,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:05:04','2021-10-25 14:05:04'),
	(1091,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6e56\\u5dde\\u9526\\u7ee3\\u7814\\u78e8\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330501MA28CB7R9A\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u6e56\\u5dde\\u5e02\\u68a6\\u6eaa\\u8def228\\u53f73\\u5e62\\u5e95\\u5c42\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:05:40','2021-10-25 14:05:40'),
	(1092,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:05:41','2021-10-25 14:05:41'),
	(1093,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:05:50','2021-10-25 14:05:50'),
	(1094,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u90b5\\u4e1c\\u53bf\\u5929\\u9f99\\u6d0b\\u7535\\u5de5\\u6750\\u6599\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"914305216685711292\",\"address\":\"\\u6e56\\u5357\\u7701\\u90b5\\u9633\\u5e02\\u90b5\\u4e1c\\u53bf\\u5927\\u79be\\u5858\\u8857\\u9053\\u529e\\u4e8b\\u5904\\u9f99\\u77f3\\u6751\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:07:25','2021-10-25 14:07:25'),
	(1095,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:07:26','2021-10-25 14:07:26'),
	(1096,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:07:29','2021-10-25 14:07:29'),
	(1097,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4f59\\u59da\\u5e02\\u535a\\u6e90\\u8d38\\u6613\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"9133028157751855X5\",\"address\":\"\\u4f59\\u59da\\u5e02\\u4e2d\\u56fd\\u5851\\u6599\\u57ce\\u4e1c\\u533a3-26\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:09:22','2021-10-25 14:09:22'),
	(1098,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:09:22','2021-10-25 14:09:22'),
	(1099,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:09:25','2021-10-25 14:09:25'),
	(1100,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u957f\\u5174\\u4e09\\u4f1f\\u70ed\\u7194\\u80f6\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330522739933896L\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u6e56\\u5dde\\u5e02\\u957f\\u5174\\u53bf\\u548c\\u5e73\\u9547\\u5de5\\u4e1a\\u96c6\\u4e2d\\u533a\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:11:47','2021-10-25 14:11:47'),
	(1101,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:11:47','2021-10-25 14:11:47'),
	(1102,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:11:49','2021-10-25 14:11:49'),
	(1103,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5e38\\u5dde\\u9f99\\u90a6\\u6da6\\u6ed1\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320405675490060L\",\"address\":\"\\u5e38\\u5dde\\u7ecf\\u6d4e\\u5f00\\u53d1\\u533a\\u5ef6\\u9675\\u4e1c\\u8def2\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:15:12','2021-10-25 14:15:12'),
	(1104,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:15:12','2021-10-25 14:15:12'),
	(1105,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:15:14','2021-10-25 14:15:14'),
	(1106,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5d4a\\u5dde\\u5e02\\u8fdc\\u76db\\u7eba\\u7ec7\\u54c1\\u52a9\\u5242\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330683745055604A\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5d4a\\u5dde\\u5e02\\u5d07\\u4ec1\\u9547\\u5bcc\\u56db\\u4e2a\\u79c1\\u96c6\\u805a\\u5c0f\\u533a\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:17:08','2021-10-25 14:17:08'),
	(1107,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:17:09','2021-10-25 14:17:09'),
	(1108,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:17:11','2021-10-25 14:17:11'),
	(1109,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u911e\\u5dde\\u9686\\u6cf0\\u5316\\u5de5\\u5382\",\"tax_number\":\"91330212793012641Y\",\"address\":\"\\u5b81\\u6ce2\\u5e02\\u911e\\u5dde\\u533a\\u54b8\\u7965\\u9547\\u82a6\\u84b2\\u6751\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:19:10','2021-10-25 14:19:10'),
	(1110,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:19:10','2021-10-25 14:19:10'),
	(1111,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:19:12','2021-10-25 14:19:12'),
	(1112,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u8a89\\u5fb7\\u6da6\\u6ed1\\u6cb9\\uff08\\u6606\\u5c71\\uff09\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320583MA1NR60L54\",\"address\":\"\\u6606\\u5c71\\u5e02\\u5343\\u706f\\u9547\\u4e2d\\u8282\\u8def25\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:21:59','2021-10-25 14:21:59'),
	(1113,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:21:59','2021-10-25 14:21:59'),
	(1114,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:22:03','2021-10-25 14:22:03'),
	(1115,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6d59\\u6c5f\\u6cfd\\u5929\\u7cbe\\u7ec6\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330109MA28WHAL4W\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u676d\\u5dde\\u5e02\\u8427\\u5c71\\u533a\\u57ce\\u53a2\\u8857\\u9053\\u6e58\\u6e56\\u8def42\\u53f7e8\\u4fe1\\u606f\\u6587\\u521b\\u56edA\\u533aA380\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:23:45','2021-10-25 14:23:45'),
	(1116,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:23:45','2021-10-25 14:23:45'),
	(1117,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:23:49','2021-10-25 14:23:49'),
	(1118,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u82cf\\u5dde\\u535a\\u6da6\\u6cb9\\u8102\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320506569171576K\",\"address\":\"\\u82cf\\u5dde\\u5e02\\u5434\\u4e2d\\u533a\\u752a\\u76f4\\u9547\\u5434\\u6dde\\u8def68\\u53f715\\u5e62104\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:26:43','2021-10-25 14:26:43'),
	(1119,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:26:43','2021-10-25 14:26:43'),
	(1120,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:26:47','2021-10-25 14:26:47'),
	(1121,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6069\\u7279\\u8def\\u65b0\\u6750\\u6599\\u79d1\\u6280\\uff08\\u6b66\\u6c49\\uff09\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91429004MA4920LD3T\",\"address\":\"\\u4ed9\\u6843\\u5e02\\u897f\\u6d41\\u6cb3\\u9547\\u9ad8\\u65b0\\u533a\\u65b0\\u6750\\u6599\\u4ea7\\u4e1a\\u56ed\\u53d1\\u5c55\\u5927\\u9053\\u4e1c\\u7aef\\uff08\\u5468\\u6ee9\\u6751\\u4e00\\u4e8c\\u7ec4\\uff09\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:27:59','2021-10-25 14:27:59'),
	(1122,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:27:59','2021-10-25 14:27:59'),
	(1123,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:28:02','2021-10-25 14:28:02'),
	(1124,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5170\\u6eaa\\u5e02\\u9ad8\\u79d1\\u9632\\u6c34\\u6750\\u6599\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"9133078168913741XW\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5170\\u6eaa\\u5e02\\u6885\\u6c5f\\u9547\\u5de5\\u4e1a\\u529f\\u80fd\\u533a\\u901a\\u6d32\\u8def192\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:30:19','2021-10-25 14:30:19'),
	(1125,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:30:19','2021-10-25 14:30:19'),
	(1126,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:30:21','2021-10-25 14:30:21'),
	(1127,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5e38\\u719f\\u5e02\\u4e09\\u65fa\\u5316\\u5de5\\u8d38\\u6613\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320581078204847D\",\"address\":\"\\u5e38\\u719f\\u5e02\\u6885\\u674e\\u9547\\u53e4\\u836b\\u8def23\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:32:16','2021-10-25 14:32:16'),
	(1128,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:32:16','2021-10-25 14:32:16'),
	(1129,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:32:19','2021-10-25 14:32:19'),
	(1130,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u65e0\\u9521\\u6069\\u7279\\u8def\\u6da6\\u6ed1\\u6cb9\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320206565319545M\",\"address\":\"\\u65e0\\u9521\\u60e0\\u5c71\\u7ecf\\u6d4e\\u5f00\\u53d1\\u533a\\u60e0\\u5c71\\u5927\\u90531619\\u53f71146\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:33:56','2021-10-25 14:33:56'),
	(1131,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:33:56','2021-10-25 14:33:56'),
	(1132,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:33:58','2021-10-25 14:33:58'),
	(1133,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e34\\u6c82\\u82f1\\u90a6\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91371300MA3CGF1U38\",\"address\":\"\\u5c71\\u4e1c\\u7701\\u4e34\\u6c82\\u5e02\\u7ecf\\u6d4e\\u5f00\\u53d1\\u533a\\u91d1\\u79d1\\u8d22\\u7a0e\\u5927\\u53a66\\u697cA607-1\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:35:25','2021-10-25 14:35:25'),
	(1134,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:35:25','2021-10-25 14:35:25'),
	(1135,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:35:27','2021-10-25 14:35:27'),
	(1136,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e0a\\u6d77\\u6d25\\u6d9e\\u7cbe\\u7ec6\\u5316\\u5b66\\u54c1\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913101180678377103\",\"address\":\"\\u4e0a\\u6d77\\u5e02\\u9752\\u6d66\\u533a\\u91cd\\u56fa\\u9547\\u8d75\\u91cd\\u516c\\u8def2278\\u53f75\\u53f7\\u697c3\\u5c4217\\u5ea7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:38:16','2021-10-25 14:38:16'),
	(1137,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:38:16','2021-10-25 14:38:16'),
	(1138,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:38:19','2021-10-25 14:38:19'),
	(1139,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6e56\\u5dde\\u5357\\u6d54\\u542f\\u946b\\u7814\\u78e8\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330503MA28C6LT02\",\"address\":\"\\u6e56\\u5dde\\u5e02\\u5357\\u6d54\\u533a\\u53cc\\u6797\\u9547\\u9ec4\\u9f99\\u515c\\u6751\\u5434\\u5bb6\\u57ed\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:40:32','2021-10-25 14:40:32'),
	(1140,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:40:32','2021-10-25 14:40:32'),
	(1141,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:40:34','2021-10-25 14:40:34'),
	(1142,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u957f\\u6625\\u6d77\\u8c31\\u6da6\\u65af\\u79d1\\u6280\\u80a1\\u4efd\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91220101333825801G\",\"address\":\"\\u5409\\u6797\\u7701\\u957f\\u6625\\u5e02\\u5317\\u6e56\\u79d1\\u6280\\u5f00\\u53d1\\u533a\\u76db\\u5317\\u5927\\u88573333\\u53f7\\u5317\\u6e56\\u79d1\\u6280\\u56ed\\u4ea7\\u4e1a\\u4e00\\u671fA5\\u680b\\u88573333\\u53f7\\u5317\\u6e56\\u79d1\\u6280\\u56ed\\u4ea7\\u4e1a\\u4e00\\u671fA5\\u680b\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:42:37','2021-10-25 14:42:37'),
	(1143,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:42:37','2021-10-25 14:42:37'),
	(1144,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:42:39','2021-10-25 14:42:39'),
	(1145,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:52:31','2021-10-25 14:52:31'),
	(1146,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}','2021-10-25 14:52:39','2021-10-25 14:52:39'),
	(1147,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:53:16','2021-10-25 14:53:16'),
	(1148,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6148\\u6eaa\\u9e3f\\u666f\\u6e05\\u6d17\\u5242\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330282MA2AH6B09R\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u6148\\u6eaa\\u5e02\\u9f99\\u5c71\\u9547\\u90b1\\u738b\\u6751\\u6148\\u9f99\\u4e1c\\u8def738\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:54:24','2021-10-25 14:54:24'),
	(1149,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:54:24','2021-10-25 14:54:24'),
	(1150,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:54:26','2021-10-25 14:54:26'),
	(1151,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e0a\\u6d77\\u9ea6\\u8c6a\\u65b0\\u6750\\u6599\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91310116312303289L\",\"address\":\"\\u4e0a\\u6d77\\u5e02\\u91d1\\u5c71\\u533a\\u6f15\\u6cfe\\u9547\\u5e73\\u4e1a\\u8def88\\u53f73\\u5e62\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:58:12','2021-10-25 14:58:12'),
	(1152,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:58:12','2021-10-25 14:58:12'),
	(1153,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 14:58:14','2021-10-25 14:58:14'),
	(1154,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u82cf\\u5dde\\u8d1d\\u601d\\u7279\\u5c14\\u6da6\\u6ed1\\u6cb9\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320506313812085R\",\"address\":\"\\u82cf\\u5dde\\u5e02\\u5434\\u4e2d\\u533a\\u752a\\u76f4\\u9547\\u5434\\u6dde\\u8def68\\u53f711\\u5e62103\\u697c\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 14:59:54','2021-10-25 14:59:54'),
	(1155,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 14:59:54','2021-10-25 14:59:54'),
	(1156,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:00:01','2021-10-25 15:00:01'),
	(1157,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5357\\u4eac\\u946b\\u65ed\\u5de5\\u8d38\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320113738870686Y\",\"address\":\"\\u5357\\u4eac\\u5e02\\u6816\\u971e\\u533a\\u8fc8\\u768b\\u6865\\u8857\\u9053\\u548c\\u71d5\\u8def396\\u53f77\\u5e62502\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:01:55','2021-10-25 15:01:55'),
	(1158,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:01:55','2021-10-25 15:01:55'),
	(1159,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:01:59','2021-10-25 15:01:59'),
	(1160,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6d59\\u6c5f\\u6b27\\u7eff\\u4fdd\\u65b0\\u6750\\u6599\\u6280\\u672f\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91331100MA2E092M0B\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u4e3d\\u6c34\\u5e02\\u83b2\\u90fd\\u533a\\u4e2d\\u5c71\\u8857\\u5317399\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:03:27','2021-10-25 15:03:27'),
	(1161,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:03:27','2021-10-25 15:03:27'),
	(1162,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:03:29','2021-10-25 15:03:29'),
	(1163,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u9547\\u6d77\\u4f73\\u601d\\u5b9d\\u6da6\\u6ed1\\u6cb9\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330211084779727E\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u9547\\u6d77\\u533a\\u62db\\u5b9d\\u5c71\\u8857\\u9053\\u5e73\\u6d77\\u8def1188\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:09:46','2021-10-25 15:09:46'),
	(1164,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:09:46','2021-10-25 15:09:46'),
	(1165,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:09:48','2021-10-25 15:09:48'),
	(1166,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u535a\\u76ca\\u6da6\\u6ed1\\u6cb9\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330201MA2GRB1F1Y\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u9ad8\\u65b0\\u533a\\u6c5f\\u5357\\u8def1558\\u53f77\\u697c7088-363\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:11:28','2021-10-25 15:11:28'),
	(1167,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:11:28','2021-10-25 15:11:28'),
	(1168,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:11:30','2021-10-25 15:11:30'),
	(1169,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6c5f\\u897f\\u9ea6\\u8c6a\\u5316\\u5de5\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91360425MA35GA5H27\",\"address\":\"\\u6c5f\\u897f\\u7701\\u4e5d\\u6c5f\\u5e02\\u6c38\\u4fee\\u53bf\\u6c38\\u4fee\\u4e91\\u5c71\\u7ecf\\u6d4e\\u5f00\\u53d1\\u533a\\u661f\\u706b\\u5de5\\u4e1a\\u56ed\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:13:12','2021-10-25 15:13:12'),
	(1170,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:13:12','2021-10-25 15:13:12'),
	(1171,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:13:14','2021-10-25 15:13:14'),
	(1172,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u957f\\u6c99\\u5e02\\u6da6\\u724c\\u6da6\\u6ed1\\u8102\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91430103MA4L2UB149\",\"address\":\"\\u6e56\\u5357\\u7701\\u957f\\u6c99\\u5e02\\u5929\\u5fc3\\u533a\\u5148\\u950b\\u8857\\u9053\\u65b0\\u8def\\u6751\\u5927\\u5858\\u89d2\\u7ec410\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:15:14','2021-10-25 15:15:14'),
	(1173,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:15:15','2021-10-25 15:15:15'),
	(1174,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:15:17','2021-10-25 15:15:17'),
	(1175,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5c71\\u897f\\u94f6\\u83b9\\u5316\\u5de5\\u80a1\\u4efd\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91140800080956554U\",\"address\":\"\\u8fd0\\u57ce\\u5e02\\u98ce\\u9675\\u6e21\\u7ecf\\u6d4e\\u5f00\\u53d1\\u533a\\u5916\\u73af\\u8def\\u534e\\u671b\\u6751\\u897f\\u53e3\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:16:47','2021-10-25 15:16:47'),
	(1176,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:16:47','2021-10-25 15:16:47'),
	(1177,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:16:50','2021-10-25 15:16:50'),
	(1178,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5609\\u6590\\u79d1\\u6280\\uff08\\u6b66\\u6c49\\uff09\\u80a1\\u4efd\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"914201127646321712\",\"address\":\"\\u6b66\\u6c49\\u5e02\\u4e1c\\u897f\\u6e56\\u533a\\u9ad8\\u6865\\u4e8c\\u8def188\\u53f7\\uff083\\uff09\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:22:09','2021-10-25 15:22:09'),
	(1179,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:22:09','2021-10-25 15:22:09'),
	(1180,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:23:15','2021-10-25 15:23:15'),
	(1181,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6606\\u5c71\\u5e02\\u4ecb\\u666e\\u6da6\\u6ed1\\u6cb9\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913205836709668406\",\"address\":\"\\u5468\\u5e02\\u9547\\u9ec4\\u6d66\\u6c5f\\u5317\\u8def218\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:23:47','2021-10-25 15:23:47'),
	(1182,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:23:48','2021-10-25 15:23:48'),
	(1183,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:23:58','2021-10-25 15:23:58'),
	(1184,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5357\\u4eac\\u79d1\\u5f00\\u65b0\\u6750\\u6599\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320191MA1X53R30G\",\"address\":\"\\u5357\\u4eac\\u5e02\\u6c5f\\u5317\\u65b0\\u533a\\u957f\\u82a6\\u8857\\u9053\\u5229\\u6c11\\u8def11\\u53f7B\\u5e62177\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:25:20','2021-10-25 15:25:20'),
	(1185,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:25:21','2021-10-25 15:25:21'),
	(1186,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:25:24','2021-10-25 15:25:24'),
	(1187,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5357\\u901a\\u6da6\\u6cfd\\u5de5\\u4e1a\\u6cb9\\u6599\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320621583726056W\",\"address\":\"\\u6d77\\u5b89\\u53bf\\u767d\\u7538\\u9547\\u601d\\u8fdb\\u5de5\\u4e1a\\u96c6\\u4e2d\\u533a\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:26:59','2021-10-25 15:26:59'),
	(1188,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:26:59','2021-10-25 15:26:59'),
	(1189,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:27:02','2021-10-25 15:27:02'),
	(1190,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6606\\u5c71\\u5e02\\u4ecb\\u666e\\u6da6\\u6ed1\\u6cb9\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913205836709668406\",\"address\":\"\\u5468\\u5e02\\u9547\\u9ec4\\u6d66\\u6c5f\\u5317\\u8def218\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:30:21','2021-10-25 15:30:21'),
	(1191,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:30:21','2021-10-25 15:30:21'),
	(1192,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:30:24','2021-10-25 15:30:24'),
	(1193,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u53f0\\u5dde\\u9f50\\u9e3f\\u6da6\\u6ed1\\u6cb9\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91331021MA2DU4971A\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u7389\\u73af\\u5e02\\u5927\\u9ea6\\u5c7f\\u8857\\u9053\\u5c97\\u4ed4\\u5934\\u6751\\u9f99\\u5cf0\\u8def82\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:31:42','2021-10-25 15:31:42'),
	(1194,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:31:42','2021-10-25 15:31:42'),
	(1195,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:31:44','2021-10-25 15:31:44'),
	(1196,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u9547\\u6d77\\u533a\\u5e84\\u5e02\\u4e94\\u661f\\u7535\\u9540\\u5382\",\"tax_number\":\"913302111443413813\",\"address\":\"\\u5b81\\u6ce2\\u5316\\u5de5\\u533a\\u86df\\u5ddd\\u56ed\\u533a\\u5ddd\\u6d66\\u8def318\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:35:15','2021-10-25 15:35:15'),
	(1197,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:35:15','2021-10-25 15:35:15'),
	(1198,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:36:19','2021-10-25 15:36:19'),
	(1199,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u7ef4\\u6e05\\u6da6\\u6ed1\\u6cb9\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330205MA2829L906\",\"address\":\"\\u5b81\\u6ce2\\u5e02\\u6c5f\\u5317\\u533a\\u957f\\u5174\\u8def677\\u53f7\\u3001685\\u53f7\\u3001687\\u53f73\\u5e6211-7-20\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:36:53','2021-10-25 15:36:53'),
	(1200,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:36:53','2021-10-25 15:36:53'),
	(1201,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:36:56','2021-10-25 15:36:56'),
	(1202,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5929\\u6d25\\u5e02\\u9a70\\u76db\\u5546\\u8d38\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91120113786382898B\",\"address\":\"\\u5929\\u6d25\\u5e02\\u5317\\u8fb0\\u533a\\u53cc\\u8857\\u9547\\u4eac\\u6d25\\u516c\\u8def\\u4ee5\\u4e1c\\u667a\\u8c37\\u56ed21-3-701\\u5ba4-18\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:38:40','2021-10-25 15:38:40'),
	(1203,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:38:40','2021-10-25 15:38:40'),
	(1204,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:38:42','2021-10-25 15:38:42'),
	(1205,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u9547\\u6d77\\u96f7\\u795e\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330211674711984G\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u9547\\u6d77\\u5927\\u8fd0\\u8def1\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:40:52','2021-10-25 15:40:52'),
	(1206,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:40:53','2021-10-25 15:40:53'),
	(1207,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:40:56','2021-10-25 15:40:56'),
	(1208,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5357\\u4eac\\u4e09\\u4f17\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320113690425945B\",\"address\":\"\\u5357\\u4eac\\u5e02\\u6816\\u971e\\u533a\\u71d5\\u5b50\\u77f6\\u8857\\u9053\\u548c\\u71d5\\u8def408\\u53f71\\u5e621101\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:43:05','2021-10-25 15:43:05'),
	(1209,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:43:05','2021-10-25 15:43:05'),
	(1210,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:43:07','2021-10-25 15:43:07'),
	(1211,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e0a\\u6d77\\u4e89\\u98de\\u79d1\\u6280\\u53d1\\u5c55\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913101145947072566\",\"address\":\"\\u5609\\u5b9a\\u533a\\u5b89\\u4ead\\u9547\\u66f9\\u5b89\\u516c\\u8def5588\\u53f7705\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:46:29','2021-10-25 15:46:29'),
	(1212,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:46:30','2021-10-25 15:46:30'),
	(1213,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:46:32','2021-10-25 15:46:32'),
	(1214,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6cc9\\u5dde\\u5e02\\u60e0\\u5174\\u5efa\\u6750\\u53d1\\u5c55\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913505217917518978\",\"address\":\"\\u60e0\\u5b89\\u53bf\\u60e0\\u5b89\\u53bf\\u5f20\\u5742\\u9547\\u60e0\\u5357\\u5de5\\u4e1a\\u56ed\\u533a\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:48:56','2021-10-25 15:48:56'),
	(1215,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:48:56','2021-10-25 15:48:56'),
	(1216,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:49:07','2021-10-25 15:49:07'),
	(1217,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u9526\\u6e56\\u6da6\\u6ed1\\u6cb9\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"9133020534060728XG\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u6d77\\u66d9\\u533a\\u6a2a\\u8857\\u9547\\u8f66\\u7ad9\\u5357\\u8def\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:51:36','2021-10-25 15:51:36'),
	(1218,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:51:36','2021-10-25 15:51:36'),
	(1219,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:51:38','2021-10-25 15:51:38'),
	(1220,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u65e0\\u9521\\u5e02\\u535a\\u6c5f\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320214775407260Y\",\"address\":\"\\u5b9c\\u5174\\u5e02\\u65b0\\u8857\\u8857\\u9053\\u9646\\u5e73\\u6751\\u5858\\u5357\\u7ec4\\u5341\\u4ea9\\u8361\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:52:49','2021-10-25 15:52:49'),
	(1221,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:52:49','2021-10-25 15:52:49'),
	(1222,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:53:00','2021-10-25 15:53:00'),
	(1223,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u51ef\\u83b1\\u5316\\u5de5\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330201074907510B\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u4fdd\\u7a0e\\u533a\\u9ad8\\u65b0\\u5546\\u7528\\u623fA1-202-1\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:55:01','2021-10-25 15:55:01'),
	(1224,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:55:02','2021-10-25 15:55:02'),
	(1225,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:55:04','2021-10-25 15:55:04'),
	(1226,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5b5a\\u6da6\\u77f3\\u5316\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330203691350498X\",\"address\":\"\\u5b81\\u6ce2\\u5e02\\u6d77\\u66d9\\u533a\\u53e4\\u6797\\u9547\\u5b8b\\u4e25\\u738b\\u6751\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:57:39','2021-10-25 15:57:39'),
	(1227,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:57:40','2021-10-25 15:57:40'),
	(1228,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:57:42','2021-10-25 15:57:42'),
	(1229,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e0a\\u6d77\\u51a0\\u94a7\\u6052\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91310114055057290H\",\"address\":\"\\u5609\\u5b9a\\u533a\\u80dc\\u8f9b\\u5357\\u8def500\\u53f710\\u5e621246\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 15:59:50','2021-10-25 15:59:50'),
	(1230,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 15:59:50','2021-10-25 15:59:50'),
	(1231,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 15:59:52','2021-10-25 15:59:52'),
	(1232,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u911e\\u5dde\\u4e94\\u4e61\\u5b8f\\u56fd\\u91d1\\u5c5e\\u8868\\u9762\\u5904\\u7406\\u5242\\u5382\",\"tax_number\":\"91330212L31301247E\",\"address\":\"\\u5b81\\u6ce2\\u5e02\\u911e\\u5dde\\u533a\\u4e94\\u4e61\\u9547\\u949f\\u5bb6\\u6c99\\u6751\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 16:01:49','2021-10-25 16:01:49'),
	(1233,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 16:01:50','2021-10-25 16:01:50'),
	(1234,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:01:52','2021-10-25 16:01:52'),
	(1235,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u65e0\\u9521\\u5317\\u65b9\\u5316\\u5b66\\u5de5\\u4e1a\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91320205250115273X\",\"address\":\"\\u65e0\\u9521\\u5e02\\u9521\\u5c71\\u533a\\u4e1c\\u4ead\\u6625\\u6f6e\\u4e2d\\u8def41\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 16:03:30','2021-10-25 16:03:30'),
	(1236,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 16:03:30','2021-10-25 16:03:30'),
	(1237,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:05:27','2021-10-25 16:05:27'),
	(1238,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e0a\\u6d77\\u94a7\\u7f8e\\u751f\\u7269\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91310114MA1GUP3P9Q\",\"address\":\"\\u4e0a\\u6d77\\u5e02\\u5609\\u5b9a\\u533a\\u5357\\u7fd4\\u9547\\u9759\\u5858\\u8def988\\u53f72\\u5e62J168\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 16:06:00','2021-10-25 16:06:00'),
	(1239,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 16:06:00','2021-10-25 16:06:00'),
	(1240,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:06:04','2021-10-25 16:06:04'),
	(1241,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5e38\\u5fb7\\u5e02\\u9f0e\\u57ce\\u4fe1\\u8fbe\\u6cb9\\u54c1\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91430703792382691B\",\"address\":\"\\u5e38\\u5fb7\\u5e02\\u9f0e\\u57ce\\u533a\\u90ed\\u5bb6\\u94fa\\u8857\\u9053\\u5b54\\u5bb6\\u6eb6\\u793e\\u533a(\\u6865\\u5357\\u5de5\\u4e1a\\u56ed\\u9633\\u56ed\\u8def\\u4ee5\\u5317\\u6c38\\u5174\\u8def\\u4ee5\\u897f)\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 16:08:44','2021-10-25 16:08:44'),
	(1242,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 16:08:44','2021-10-25 16:08:44'),
	(1243,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:08:47','2021-10-25 16:08:47'),
	(1244,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6d59\\u6c5f\\u5fb7\\u8def\\u5b9d\\u65b0\\u6750\\u6599\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330282MA2CLDWG6G\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u6148\\u6eaa\\u5e02\\u6a2a\\u6cb3\\u9547\\u5de5\\u4e1a\\u5c0f\\u533a\\u7fd4\\u9f99\\u8def1\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 16:11:39','2021-10-25 16:11:39'),
	(1245,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 16:11:39','2021-10-25 16:11:39'),
	(1246,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:11:42','2021-10-25 16:11:42'),
	(1247,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u5e02\\u911e\\u5dde\\u8fea\\u7fd4\\u6da6\\u6ed1\\u6cb9\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330212577514890M\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u911e\\u5dde\\u533a\\u59dc\\u5c71\\u9547\\u987a\\u660e\\u8def1583\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 16:13:57','2021-10-25 16:13:57'),
	(1248,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 16:13:57','2021-10-25 16:13:57'),
	(1249,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:14:01','2021-10-25 16:14:01'),
	(1250,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6210\\u90fd\\u5e02\\u91d1\\u5802\\u53bf\\u798f\\u5f3a\\u6c34\\u6ce5\\u52a9\\u78e8\\u5242\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91510121669678489E\",\"address\":\"\\u6210\\u90fd\\u5e02\\u91d1\\u5802\\u53bf\\u4e09\\u4e2d\\u56ed\\u533a\\u4e8c\\u6a2a\\u9053\\u5317\\u6bb5\\u770b\\u5b88\\u6240\\u5bbf\\u820d\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 16:16:14','2021-10-25 16:16:14'),
	(1251,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 16:16:15','2021-10-25 16:16:15'),
	(1252,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:19:21','2021-10-25 16:19:21'),
	(1253,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u6d59\\u6c5f\\u6b65\\u8def\\u6cfd\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330211MA2912D61C\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u9547\\u6d77\\u533a\\u9a86\\u9a7c\\u8857\\u9053\\u6c11\\u548c\\u8def399\\u53f7902\\u5ba4\\uff08\\u65b0\\u57ce\\u6838\\u5fc3\\u533a\\uff09\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 16:19:55','2021-10-25 16:19:55'),
	(1254,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 16:19:55','2021-10-25 16:19:55'),
	(1255,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:19:57','2021-10-25 16:19:57'),
	(1256,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u749f\\u7199\\u8d38\\u6613\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91330212MA2GRED03D\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u5b81\\u6ce2\\u5e02\\u911e\\u5dde\\u533a\\u4f1a\\u5c55\\u8def222\\u53f7079\\u5e629\\u53f7\\u99861016\\u5c55\\u4f4d\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 16:21:18','2021-10-25 16:21:18'),
	(1257,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 16:21:18','2021-10-25 16:21:18'),
	(1258,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:21:21','2021-10-25 16:21:21'),
	(1259,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5317\\u4eac\\u8d5b\\u8bfa\\u65af\\u8482\\u5316\\u5de5\\u6280\\u672f\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"9111010576938455XD\",\"address\":\"\\u5317\\u4eac\\u5e02\\u671d\\u9633\\u533a\\u5efa\\u56fd\\u8def93\\u53f7\\u96625\\u53f7\\u697c16\\u5c421905\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 16:26:28','2021-10-25 16:26:28'),
	(1260,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 16:26:29','2021-10-25 16:26:29'),
	(1261,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:26:31','2021-10-25 16:26:31'),
	(1262,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u5b81\\u6ce2\\u6052\\u7a0b\\u6e90\\u5316\\u5de5\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"913302113405547719\",\"address\":\"\\u5b81\\u6ce2\\u5e02\\u9547\\u6d77\\u533a\\u62db\\u5b9d\\u5c71\\u8857\\u9053\\u5e73\\u6d77\\u8def1188\\u53f7\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 16:34:30','2021-10-25 16:34:30'),
	(1263,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 16:34:30','2021-10-25 16:34:30'),
	(1264,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:34:32','2021-10-25 16:34:32'),
	(1265,2,'admin/customers','POST','112.14.53.205','{\"name\":\"\\u4e0a\\u6d77\\u65e5\\u4e7e\\u5316\\u5de5\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"tax_number\":\"91310120067792639Y\",\"address\":\"\\u4e0a\\u6d77\\u5e02\\u5609\\u5b9a\\u533a\\u4f17\\u4ec1\\u8def399\\u53f71\\u5e62B\\u533a15\\u5c421511\\u30011512\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"P6fvXfgRYEYHmeKpsDRhvAll2CfRdq4G9DNCK1Jm\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers?&per_page=100\"}','2021-10-25 16:36:07','2021-10-25 16:36:07'),
	(1266,2,'admin/customers','GET','112.14.53.205','{\"per_page\":\"100\"}','2021-10-25 16:36:07','2021-10-25 16:36:07'),
	(1267,2,'admin/customers/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:36:09','2021-10-25 16:36:09'),
	(1268,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:39:01','2021-10-25 16:39:01'),
	(1269,1,'admin','GET','122.246.49.38','[]','2021-10-25 16:43:04','2021-10-25 16:43:04'),
	(1270,1,'admin/customer-orders','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:43:08','2021-10-25 16:43:08'),
	(1271,1,'admin/customers','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:43:15','2021-10-25 16:43:15'),
	(1272,1,'admin/purchase-orders','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:43:20','2021-10-25 16:43:20'),
	(1273,1,'admin/suppliers','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:43:22','2021-10-25 16:43:22'),
	(1274,1,'admin/supplier-invoices','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:43:23','2021-10-25 16:43:23'),
	(1275,1,'admin','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:43:24','2021-10-25 16:43:24'),
	(1276,1,'admin','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:43:25','2021-10-25 16:43:25'),
	(1277,1,'admin','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-25 16:43:26','2021-10-25 16:43:26'),
	(1278,1,'admin','GET','122.246.49.38','[]','2021-10-25 17:00:52','2021-10-25 17:00:52'),
	(1279,2,'admin','GET','112.14.53.205','[]','2021-10-26 09:22:16','2021-10-26 09:22:16'),
	(1280,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-26 09:22:25','2021-10-26 09:22:25'),
	(1281,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}','2021-10-26 09:22:42','2021-10-26 09:22:42'),
	(1282,2,'admin/purchase-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-26 09:30:02','2021-10-26 09:30:02'),
	(1283,2,'admin/customer-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-26 09:30:13','2021-10-26 09:30:13'),
	(1284,2,'admin/customer-orders/2','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-26 09:33:46','2021-10-26 09:33:46'),
	(1285,2,'admin/customer-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-26 09:33:48','2021-10-26 09:33:48'),
	(1286,2,'admin/customer-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-26 09:34:36','2021-10-26 09:34:36'),
	(1287,2,'admin/configs','GET','112.14.53.205','[]','2021-10-26 09:34:36','2021-10-26 09:34:36'),
	(1288,2,'admin/api/customers','GET','112.14.53.205','[]','2021-10-26 09:34:36','2021-10-26 09:34:36'),
	(1289,2,'admin/api/can-sales-items','GET','112.14.53.205','[]','2021-10-26 09:34:36','2021-10-26 09:34:36'),
	(1290,2,'admin/api/payment-method','GET','112.14.53.205','[]','2021-10-26 09:34:36','2021-10-26 09:34:36'),
	(1291,2,'admin/api/logistics','GET','112.14.53.205','[]','2021-10-26 09:34:36','2021-10-26 09:34:36'),
	(1292,2,'admin/customer-orders/save','POST','112.14.53.205','{\"customer_id\":\"3\",\"order_time\":\"2016-09-19\",\"pick_up_object\":null,\"pick_up_date\":null,\"commission\":0,\"pick_up\":0,\"transportation\":0,\"deliver_goods\":0,\"logistics\":\"\\u9ec4\\u91d1\\u7269\\u6d41\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"7\",\"quantity\":1,\"unit_price\":\"3900\",\"content\":\"99\",\"deleted\":false}],\"remarks\":null,\"payment_method\":\"TRANSFER\"}','2021-10-26 09:35:28','2021-10-26 09:35:28'),
	(1293,2,'admin/customer-orders','GET','112.14.53.205','[]','2021-10-26 09:35:33','2021-10-26 09:35:33'),
	(1294,2,'admin/customer-orders/9/edit','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-26 09:35:48','2021-10-26 09:35:48'),
	(1295,2,'admin/customer-orders','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-26 09:35:58','2021-10-26 09:35:58'),
	(1296,2,'admin/customer-orders/create','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-26 09:36:02','2021-10-26 09:36:02'),
	(1297,2,'admin/configs','GET','112.14.53.205','[]','2021-10-26 09:36:03','2021-10-26 09:36:03'),
	(1298,2,'admin/api/customers','GET','112.14.53.205','[]','2021-10-26 09:36:03','2021-10-26 09:36:03'),
	(1299,2,'admin/api/logistics','GET','112.14.53.205','[]','2021-10-26 09:36:03','2021-10-26 09:36:03'),
	(1300,2,'admin/api/can-sales-items','GET','112.14.53.205','[]','2021-10-26 09:36:03','2021-10-26 09:36:03'),
	(1301,2,'admin/api/payment-method','GET','112.14.53.205','[]','2021-10-26 09:36:03','2021-10-26 09:36:03'),
	(1302,2,'admin/customer-orders/save','POST','112.14.53.205','{\"customer_id\":\"3\",\"order_time\":\"2016-09-19\",\"pick_up_object\":null,\"pick_up_date\":null,\"commission\":0,\"pick_up\":0,\"transportation\":0,\"deliver_goods\":0,\"logistics\":\"\\u9ec4\\u91d1\\u7269\\u6d41\",\"items\":[{\"id\":\"l-1\",\"item_id\":\"6\",\"quantity\":1,\"unit_price\":\"2750\",\"content\":\"85\",\"deleted\":false},{\"id\":\"l-2\",\"item_id\":\"4\",\"quantity\":\"1\",\"unit_price\":\"3302.4\",\"content\":\"99\",\"deleted\":false}],\"remarks\":null,\"payment_method\":\"TRANSFER\"}','2021-10-26 09:37:14','2021-10-26 09:37:14'),
	(1303,2,'admin/customer-orders','GET','112.14.53.205','[]','2021-10-26 09:37:17','2021-10-26 09:37:17'),
	(1304,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-26 09:39:21','2021-10-26 09:39:21'),
	(1305,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\",\"id\":\"\\u7389\\u73af\"}','2021-10-26 09:39:29','2021-10-26 09:39:29'),
	(1306,2,'admin/customers','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-26 09:39:32','2021-10-26 09:39:32'),
	(1307,2,'admin/customers/4/edit','GET','112.14.53.205','{\"_pjax\":\"#pjax-container\"}','2021-10-26 09:39:43','2021-10-26 09:39:43'),
	(1308,2,'admin/customers/4','PUT','112.14.53.205','{\"name\":\"\\u7389\\u73af\\u53bf\\u94f6\\u4e30\\u91d1\\u5c5e\\u52a9\\u5242\\u5382\\uff08\\u666e\\u901a\\u5408\\u4f19\\uff09\",\"tax_number\":\"913310217331902512\",\"address\":\"\\u6d59\\u6c5f\\u7701\\u7389\\u73af\\u5e02\\u7389\\u57ce\\u8857\\u9053\\u57ce\\u5317\\u521b\\u878d\\u4ea7\\u4e1a\\u57ce16\\u5e62101\\u3001201\\u5ba4\",\"tel\":null,\"bank\":null,\"account\":null,\"_token\":\"lHJVJ1DqYBUswFrmhLeOo92SVR9JG66wSHOpXQYG\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/1.13.3.74\\/admin\\/customers\"}','2021-10-26 09:40:59','2021-10-26 09:40:59'),
	(1309,2,'admin/customers','GET','112.14.53.205','[]','2021-10-26 09:40:59','2021-10-26 09:40:59'),
	(1310,1,'admin','GET','122.246.49.38','[]','2021-10-26 10:29:45','2021-10-26 10:29:45'),
	(1311,1,'admin/customer-orders','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-26 10:29:53','2021-10-26 10:29:53'),
	(1312,1,'admin/customers','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-26 10:29:55','2021-10-26 10:29:55'),
	(1313,1,'admin/suppliers','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-26 10:30:01','2021-10-26 10:30:01'),
	(1314,1,'admin','GET','122.246.49.38','[]','2021-10-26 10:47:35','2021-10-26 10:47:35'),
	(1315,1,'admin/customer-orders','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-26 10:47:38','2021-10-26 10:47:38'),
	(1316,1,'admin/customers','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-26 10:47:39','2021-10-26 10:47:39'),
	(1317,1,'admin/customers','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2021-10-26 10:47:43','2021-10-26 10:47:43'),
	(1318,1,'admin/customer-invoices','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-26 10:53:03','2021-10-26 10:53:03'),
	(1319,1,'admin/customer-invoices/create','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-26 10:53:05','2021-10-26 10:53:05'),
	(1320,1,'admin/api/customers','GET','122.246.49.38','[]','2021-10-26 10:53:05','2021-10-26 10:53:05'),
	(1321,1,'admin/customer-payments','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-26 10:53:09','2021-10-26 10:53:09'),
	(1322,1,'admin/customer-payments/create','GET','122.246.49.38','{\"_pjax\":\"#pjax-container\"}','2021-10-26 10:53:10','2021-10-26 10:53:10');

/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_permissions`;

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`)
VALUES
	(1,'All permission','*','','*',NULL,NULL),
	(2,'Dashboard','dashboard','GET','/',NULL,NULL),
	(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),
	(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),
	(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL),
	(6,'Admin Config','ext.config','','/config*','2021-01-20 19:13:48','2021-01-20 19:13:48');

/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_menu`;

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`)
VALUES
	(1,2,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_permissions`;

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_users`;

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL),
	(1,2,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Administrator','administrator','2021-01-16 09:15:33','2021-01-16 09:15:33');

/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user_permissions`;

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;

INSERT INTO `admin_user_permissions` (`user_id`, `permission_id`, `created_at`, `updated_at`)
VALUES
	(2,1,NULL,NULL);

/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'jinjialei','$2y$10$HAqbBfRSkgMihoxwrTDigOrSY8VdmEmuTA2lRMhuQLJZzkQr4FyVW','Administrator',NULL,'dSTfbCymXFKwjqfLngSZ1wIZPEXcJGU7w02YeJoGSOxTynxYk2hUFk2HUyWe','2021-01-16 09:15:33','2021-10-24 19:47:17'),
	(2,'lixiaobo','$2y$10$J8RPi4cyHzNG4K4rkPHBVuzkVoEoH7wR4pIP0BSQIQtpt755BCiO2','李总',NULL,'CDiUvh8AlUzqFn4DfiVytbOaNaCzBzoY4cl0bhHrB2sQNRQnBupLCLCzY896','2021-10-24 19:46:53','2021-10-24 19:46:53');

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_invoice_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_invoice_details`;

CREATE TABLE `customer_invoice_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_invoice_id` bigint(20) unsigned NOT NULL COMMENT '客户发票ID',
  `customer_order_id` bigint(20) unsigned NOT NULL COMMENT '客户订单ID',
  `invoice` decimal(10,2) NOT NULL COMMENT '开票金额',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table customer_invoices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_invoices`;

CREATE TABLE `customer_invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发票号',
  `date` date NOT NULL COMMENT '开票日期',
  `amount` decimal(10,3) NOT NULL COMMENT '金额',
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_invoices_no_unique` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table customer_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_orders`;

CREATE TABLE `customer_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '客户',
  `last_number` int(11) NOT NULL,
  `commission` int(11) NOT NULL DEFAULT '0' COMMENT '佣金',
  `pick_up` decimal(10,2) NOT NULL COMMENT '提货运费',
  `transportation` decimal(10,2) NOT NULL COMMENT '运输运费',
  `deliver_goods` decimal(10,2) NOT NULL COMMENT '送货运费',
  `freight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总运费',
  `logistics` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '物流公司',
  `vat` decimal(10,2) NOT NULL COMMENT '增值税',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
  `invoice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '待开票金额',
  `invoiced` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已开票金额',
  `order_time` timestamp NOT NULL COMMENT '下单时间',
  `pick_up_date` timestamp NULL DEFAULT NULL COMMENT '提货日期',
  `pick_up_object` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提货对象',
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `files` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_orders_no_unique` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `customer_orders` WRITE;
/*!40000 ALTER TABLE `customer_orders` DISABLE KEYS */;

INSERT INTO `customer_orders` (`id`, `no`, `customer_id`, `last_number`, `commission`, `pick_up`, `transportation`, `deliver_goods`, `freight`, `logistics`, `vat`, `amount`, `invoice`, `invoiced`, `order_time`, `pick_up_date`, `pick_up_object`, `remarks`, `files`, `created_at`, `updated_at`)
VALUES
	(1,'SO100001',1,100001,0,0.00,0.00,0.00,0.00,'黄金物流',0.13,36000.00,36000.00,0.00,'2016-08-08 00:00:00','2016-08-08 00:00:00',NULL,'客户付款至李小波农行卡36000元，付款日期：2016年08月22日',NULL,'2021-10-24 22:11:44','2021-10-24 22:11:44'),
	(2,'SO100002',2,100002,0,0.00,0.00,0.00,0.00,'黄金物流',0.13,2381.00,2381.00,0.00,'2016-08-04 00:00:00',NULL,NULL,NULL,NULL,'2021-10-24 22:13:39','2021-10-24 22:13:39'),
	(3,'SO100003',3,100003,0,0.00,0.00,0.00,0.00,'黄金物流',0.13,12752.50,12752.50,0.00,'2016-08-12 00:00:00',NULL,NULL,'客户付款至李小波农行卡12752元，付款时间2016年09月29日',NULL,'2021-10-24 22:16:25','2021-10-24 22:16:25'),
	(4,'SO100004',4,100004,0,0.00,0.00,0.00,0.00,'黄金物流',0.13,4905.00,4905.00,0.00,'2016-09-05 00:00:00','2016-09-05 00:00:00',NULL,NULL,NULL,'2021-10-24 22:17:53','2021-10-24 22:17:53'),
	(5,'SO100005',5,100005,0,0.00,0.00,0.00,0.00,'黄金物流',0.13,5080.00,5080.00,0.00,'2016-09-07 00:00:00',NULL,NULL,'客户王安平个人转创际公司账户5080元',NULL,'2021-10-24 22:19:45','2021-10-24 22:19:45'),
	(6,'SO100006',12,100006,0,0.00,0.00,0.00,0.00,'黄金物流',0.13,2417.94,2417.94,0.00,'2016-09-12 00:00:00',NULL,NULL,NULL,NULL,'2021-10-24 22:23:48','2021-10-24 22:23:48'),
	(7,'SO100007',6,100007,0,0.00,0.00,0.00,0.00,'黄金物流',0.13,2880.00,2880.00,0.00,'2016-09-13 00:00:00',NULL,NULL,NULL,NULL,'2021-10-24 22:24:39','2021-10-24 22:24:39'),
	(8,'SO100008',2,100008,0,0.00,0.00,0.00,0.00,'黄金物流',0.13,12928.00,12928.00,0.00,'2016-09-13 00:00:00',NULL,NULL,NULL,NULL,'2021-10-24 22:40:27','2021-10-24 22:40:27'),
	(9,'SO100009',3,100009,0,0.00,0.00,0.00,0.00,'黄金物流',0.13,3900.00,3900.00,0.00,'2016-09-19 00:00:00',NULL,NULL,NULL,NULL,'2021-10-26 09:35:28','2021-10-26 09:35:28'),
	(10,'SO100010',3,100010,0,0.00,0.00,0.00,0.00,'黄金物流',0.13,6052.40,6052.40,0.00,'2016-09-19 00:00:00',NULL,NULL,NULL,NULL,'2021-10-26 09:37:14','2021-10-26 09:37:14');

/*!40000 ALTER TABLE `customer_orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_payments`;

CREATE TABLE `customer_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '客户',
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '付款方式',
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '付款编号',
  `amount` decimal(10,2) NOT NULL COMMENT '付款金额',
  `to_be_written_off` decimal(10,2) NOT NULL COMMENT '待核销',
  `written_off` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已核销',
  `payment_at` timestamp NOT NULL COMMENT '付款时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `files` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_payments_no_unique` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户名称',
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '税号',
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开户行',
  `account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行账号',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;

INSERT INTO `customers` (`id`, `name`, `tax_number`, `tel`, `bank`, `account`, `address`, `created_at`, `updated_at`)
VALUES
	(1,'南京凯萍洗涤剂厂','91320115738884930R',NULL,NULL,NULL,'南京市江宁区横溪街道陶吴集镇狮子山路88号','2021-10-22 22:02:09','2021-10-22 22:02:09'),
	(2,'宁波奉化隆鑫切削液厂','913302837867943669',NULL,NULL,NULL,'浙江省宁波市奉化区莼湖镇岙口村','2021-10-22 22:05:04','2021-10-22 22:05:04'),
	(3,'南京宁烁表面处理技术有限公司','91320115MA1MT1Q05',NULL,NULL,NULL,'南京市江宁区高新园竹山路金钥匙大厦504室','2021-10-22 22:07:18','2021-10-22 22:07:18'),
	(4,'玉环县银丰金属助剂厂（普通合伙）','913310217331902512',NULL,NULL,NULL,'浙江省玉环市玉城街道城北创融产业城16幢101、201室','2021-10-22 22:10:30','2021-10-26 09:40:59'),
	(5,'常山县今尔金属加工润滑剂厂','91330822771923292L',NULL,NULL,NULL,'浙江省常山县新都工业园区','2021-10-22 22:11:58','2021-10-22 22:11:58'),
	(6,'宁波市海曙浩洋水性涂料厂','913302037723207682',NULL,NULL,NULL,'宁波市海曙区市场监督管理局','2021-10-22 22:16:26','2021-10-22 22:16:26'),
	(7,'杭州绿普化工科技有限公司','91330100773590305W',NULL,NULL,NULL,'91330100773590305W','2021-10-24 20:08:50','2021-10-24 20:08:50'),
	(8,'昆山华林印染助剂有限公司','9132058376240591XM',NULL,NULL,NULL,'昆山市淀山湖镇永勤村','2021-10-24 20:11:09','2021-10-24 20:11:09'),
	(9,'上海建飞环保科技有限公司','9131011656957181XN',NULL,NULL,NULL,'上海市金山区漕泾镇沪杭公路4619号3幢164室','2021-10-24 20:12:09','2021-10-24 20:12:09'),
	(10,'宁波市鄞州恒贝金属表面处理剂厂','913302126620898090',NULL,NULL,NULL,'宁波市鄞州区五乡镇石山弄村冯家','2021-10-24 20:13:12','2021-10-24 20:13:12'),
	(11,'英山县昌泰化工有限公司','91421124728329837L',NULL,NULL,NULL,'英山县温泉镇温泉路113号','2021-10-24 20:14:11','2021-10-24 20:14:11'),
	(12,'浙江金方孚环保科技有限公司','913302110538088987',NULL,NULL,NULL,'913302110538088987','2021-10-24 20:16:25','2021-10-24 20:16:25'),
	(13,'宁波海曙美洁防腐材料有限公司','91330203681058522R',NULL,NULL,NULL,'浙江省宁波市海曙区新典路7号-3','2021-10-24 20:17:34','2021-10-24 20:17:34'),
	(14,'绍兴汇丽环保有限公司','91330604609674830U',NULL,NULL,NULL,'浙江省绍兴市上虞区梁湖工业园区','2021-10-24 20:18:40','2021-10-24 20:18:40'),
	(15,'浙江品冠新材料科技有限公司','91330881MA28F16864',NULL,NULL,NULL,'浙江省衢州市江山经济开发区江东区兴工二路14-1号','2021-10-25 09:28:03','2021-10-25 09:28:03'),
	(16,'宁波市奉化区日升磷化剂厂','92330283MA292WJ83T',NULL,NULL,NULL,'浙江省宁波市奉化区西坞街道西仲村','2021-10-25 09:34:47','2021-10-25 09:34:47'),
	(17,'嘉兴八匹马化工科技有限公司','91330402350161162C',NULL,NULL,NULL,'浙江省嘉兴市南湖区凤桥镇经四路西侧（嘉兴市凤桥纸品厂）内大楼三楼西侧一幢162C','2021-10-25 09:37:30','2021-10-25 09:37:30'),
	(18,'临安科星临安科星金属表面处理剂厂','913301857319909763',NULL,NULL,NULL,'临安市锦南街道柯家村','2021-10-25 09:40:31','2021-10-25 09:40:31'),
	(19,'盐城市鼎朗商贸有限公司','913209233310999491',NULL,NULL,NULL,'阜宁县阜城街道办缪黄村一、九组','2021-10-25 09:43:12','2021-10-25 09:43:12'),
	(20,'宁波市镇海中星金属表面处理剂厂','91330211563856232F',NULL,NULL,NULL,'浙江省宁波市镇海区蟹浦镇湾塘村（信用社边）','2021-10-25 09:48:40','2021-10-25 09:49:06'),
	(21,'玉环银丰金属助剂厂（普通合伙）','913310217331902512',NULL,NULL,NULL,'浙江省玉环市玉城街道城北创融产业城16幢101、201室','2021-10-25 09:52:47','2021-10-25 09:52:47'),
	(22,'绍兴汇丽环保有限公司','91330604609674830U',NULL,NULL,NULL,'浙江省绍兴市上虞区梁湖工业园区','2021-10-25 09:54:49','2021-10-25 09:54:49'),
	(23,'宁波市鄞州恒贝金属表面处理剂厂','913302126620898090',NULL,NULL,NULL,'宁波市鄞州区五乡镇石山弄村冯家','2021-10-25 10:00:43','2021-10-25 10:00:43'),
	(24,'嵊州市春凯新材料有限公司','91330683726620719N',NULL,NULL,NULL,'嵊州市经济开发区（三界）下市头','2021-10-25 10:03:34','2021-10-25 10:03:34'),
	(25,'宁波伟益金属科技有限公司','913302110792167355',NULL,NULL,NULL,'浙江省宁波市镇海区蛟川街道俞范东路770号','2021-10-25 10:07:54','2021-10-25 10:07:54'),
	(26,'芜湖百川环保设备有限公司','91340221MA2MTYGF6L',NULL,NULL,NULL,'芜湖县六郎镇殷港工业园','2021-10-25 10:10:56','2021-10-25 10:10:56'),
	(27,'杭州绿普化工科技有限公司','91330100773590305W',NULL,NULL,NULL,'杭州临江工业园区经八路1188号三楼306室、一楼101室','2021-10-25 10:12:39','2021-10-25 10:12:39'),
	(28,'湖州久欣研磨材料有限公司','91330503MA29KKME7P',NULL,NULL,NULL,'湖州市南浔区双林镇雉头村维多利大道53号','2021-10-25 10:15:50','2021-10-25 10:15:50'),
	(29,'嵊州市雅斯德纺织助剂有限公司','91330683697004465M',NULL,NULL,NULL,'嵊州市长乐镇环镇中路1号','2021-10-25 10:18:39','2021-10-25 10:18:39'),
	(30,'诸暨德润化工有限公司','913306815943507448',NULL,NULL,NULL,'诸暨市大唐镇华海路98-16号','2021-10-25 10:23:32','2021-10-25 10:23:32'),
	(31,'青田万洁日化科技有限公司','913311213136321647',NULL,NULL,NULL,'浙江省丽水市青田县温溪镇城中小区54幢9号前间','2021-10-25 10:25:02','2021-10-25 10:25:02'),
	(32,'宁波奉化隆鑫切削液厂','913302837867943669',NULL,NULL,NULL,'浙江省宁波市奉化区莼湖镇岙口村','2021-10-25 10:28:26','2021-10-25 10:28:26'),
	(33,'杭州菁洁科技有限公司','91330105MA28U3TT1X',NULL,NULL,NULL,'浙江省杭州市拱墅区康惠路1号5幢一楼103室','2021-10-25 10:31:01','2021-10-25 10:31:01'),
	(34,'湖州致力金属处理剂厂','913305037530384174',NULL,NULL,NULL,'浙江省湖州市南浔区和孚镇长超工业园内','2021-10-25 10:32:58','2021-10-25 10:32:58'),
	(35,'宁波市唯君贸易有限公司','913302010538368641',NULL,NULL,NULL,'宁波保税区兴业大道8号1号楼417室','2021-10-25 10:35:20','2021-10-25 10:35:20'),
	(36,'江山誉冠清洗剂有限公司','91330881568157596J',NULL,NULL,NULL,'江山市坛石镇占塘村','2021-10-25 10:37:45','2021-10-25 10:37:45'),
	(37,'宁波海曙畅杰贸易有限公司','9133020359948336XU',NULL,NULL,NULL,'浙江省宁波市海曙区顺德路350号','2021-10-25 10:43:18','2021-10-25 10:43:18'),
	(38,'东阳市嘉润纺织助剂有限公司','91330783667127077W',NULL,NULL,NULL,'浙江省东阳市横店镇工业区','2021-10-25 10:45:37','2021-10-25 10:45:37'),
	(39,'宁波德昕石化有限公司','91330206573653711N',NULL,NULL,NULL,'浙江省宁波市北仑区梅山梅山大道288号2幢1106-5室','2021-10-25 10:47:11','2021-10-25 10:47:11'),
	(40,'宁波奉化奉港日用化工厂','913302836102164311',NULL,NULL,NULL,'浙江省宁波市奉化区东郊开发区','2021-10-25 10:55:23','2021-10-25 10:55:23'),
	(41,'德清科立洁洗涤服务有限公司','91330521MA2B4MY33L',NULL,NULL,NULL,'浙江省湖州市德清县钟管镇南湖路7号','2021-10-25 11:00:57','2021-10-25 11:00:57'),
	(42,'德清县科明化工有限公司','91330521147113456Q',NULL,NULL,NULL,'德清县乾元镇齐星村','2021-10-25 11:05:10','2021-10-25 11:05:10'),
	(43,'临安科星金属表面处理剂厂','913301857319909763',NULL,NULL,NULL,'临安市锦南街道柯家村','2021-10-25 11:07:40','2021-10-25 11:07:40'),
	(44,'昆山华林印染助剂有限公司','9132058376240591XM',NULL,NULL,NULL,'昆山市淀山湖镇永勤村','2021-10-25 11:09:27','2021-10-25 11:09:27'),
	(45,'建德市顺发化工助剂有限公司','9133018277662171XX',NULL,NULL,NULL,'建德市新安江街道园区路88号','2021-10-25 12:51:24','2021-10-25 12:51:24'),
	(46,'嵊州市润达助剂厂','913306837498478288',NULL,NULL,NULL,'嵊州市剡湖街道罗柱岙工业园区','2021-10-25 12:54:42','2021-10-25 12:54:42'),
	(47,'杭州艺洋涂装材料有限公司','91330109MA27XE6N1E',NULL,NULL,NULL,'浙江省杭州市钱塘新区前进街道诚智商务中心5号楼前进众智创业园6102室','2021-10-25 12:59:26','2021-10-25 12:59:26'),
	(48,'嘉兴市永源春纺织助剂有限公司','913304116795567334',NULL,NULL,NULL,'嘉兴市秀洲区洪合镇泾桥村工具三分厂内','2021-10-25 13:01:41','2021-10-25 13:01:41'),
	(49,'杭州油脂化工有限公司','91330100253921094G',NULL,NULL,NULL,'杭州市萧山区临江工业园区经八路1188号','2021-10-25 13:03:55','2021-10-25 13:03:55'),
	(50,'宁波市海曙明杰化工有限公司','913302035670310436',NULL,NULL,NULL,'宁波市海曙区集士港镇工业园区','2021-10-25 13:10:06','2021-10-25 13:10:06'),
	(51,'宁波江北杰畅纺织品有限公司','91330205595383847K',NULL,NULL,NULL,'江北区文教路85号146室','2021-10-25 13:11:56','2021-10-25 13:11:56'),
	(52,'上海好福佳洗涤科技有限公司','91310117060912597T',NULL,NULL,NULL,'上海市松江区石湖荡镇闵塔路1500弄22号','2021-10-25 13:15:19','2021-10-25 13:15:19'),
	(53,'宁波市福仕达金属加工液科技有限公司','91330206058260155Y',NULL,NULL,NULL,'北仑区小港街道五盟村工业区','2021-10-25 13:16:37','2021-10-25 13:16:37'),
	(54,'宁波泰博润特润滑科技有限公司','913302013169196977',NULL,NULL,NULL,'浙江省宁波高新区院士路66号创业大厦439室','2021-10-25 13:19:00','2021-10-25 13:19:00'),
	(55,'三门县卓尚日化厂','91331022693853208T',NULL,NULL,NULL,'三门县海润街道头岙村','2021-10-25 13:20:36','2021-10-25 13:20:36'),
	(56,'南京群策化工有限公司','913201023026386594',NULL,NULL,NULL,'南京市玄武区花园路8号','2021-10-25 13:26:39','2021-10-25 13:26:39'),
	(57,'常山县今尔金属加工润滑剂厂','91330822771923292L',NULL,NULL,NULL,'浙江省常山县新都工业园区','2021-10-25 13:28:11','2021-10-25 13:28:11'),
	(58,'宁波兴三和泰涂装材料有限公司','9133020669138142XH',NULL,NULL,NULL,'浙江省宁波市北仑区霞浦街道山前工业小区浦泉路27号','2021-10-25 13:29:36','2021-10-25 13:29:36'),
	(59,'浙江兰歌化学工业有限公司','91330784147478885C',NULL,NULL,NULL,'浙江省永康市城西新区花都路138号','2021-10-25 13:31:30','2021-10-25 13:31:30'),
	(60,'慈溪鼎安方舟环保科技有限公司','91330282MA2CKKWJ40',NULL,NULL,NULL,'浙江省慈溪市宗汉街道潮塘村油车江弄32号','2021-10-25 13:35:03','2021-10-25 13:35:03'),
	(61,'宁波市江北鑫光助剂有限公司','91330205756264356Y',NULL,NULL,NULL,'江北区私营工业城','2021-10-25 13:36:41','2021-10-25 13:36:41'),
	(62,'余姚市领航塑化有限公司','91330281074916724G',NULL,NULL,NULL,'浙江省余姚市凤山街道永丰村','2021-10-25 13:38:49','2021-10-25 13:38:49'),
	(63,'上海英润克实业有限公司','91310117060936038P',NULL,NULL,NULL,'上海市松江区石湖荡镇松蒸公路北侧标准厂房12幢-52','2021-10-25 13:41:06','2021-10-25 13:41:06'),
	(64,'南京泰力思环保科技有限公司','91320115MA1TA61U8C',NULL,NULL,NULL,'南京市江宁区禄口街道钟村社区（江宁开发区）','2021-10-25 13:42:41','2021-10-25 13:42:41'),
	(65,'浙江永在化工有限公司','913307261477056974',NULL,NULL,NULL,'浙江省浦江县永在大道999号','2021-10-25 13:43:53','2021-10-25 13:43:53'),
	(66,'山西津津房地产开发有限公司','91140800776739806H',NULL,NULL,NULL,'山西省运城市河津市学府路北、209国道西','2021-10-25 13:48:04','2021-10-25 13:48:04'),
	(67,'无锡市博江科技有限公司','91320214775407260Y',NULL,NULL,NULL,'宜兴市新街街道陆平村塘南组十亩荡','2021-10-25 13:49:30','2021-10-25 13:49:30'),
	(68,'宁波市金侃新材料有限公司','91330201MA2AJXPJ81',NULL,NULL,NULL,'浙江省宁波高新区贵驷民联村张家畔57号','2021-10-25 13:54:10','2021-10-25 13:54:10'),
	(69,'合肥三衡环保科技有限公司','91340100575728422X',NULL,NULL,NULL,'安徽省合肥市经济技术开发区蓬莱路以西、紫云路以北厂房','2021-10-25 13:56:43','2021-10-25 13:56:43'),
	(70,'无锡市博江科技有限公司','91320214775407260Y',NULL,NULL,NULL,'宜兴市新街街道陆平村塘南组十亩荡','2021-10-25 13:58:49','2021-10-25 13:58:49'),
	(71,'杭州安盟贸易有限公司','91330104662347791D',NULL,NULL,NULL,'浙江省杭州市江干区凤起广场B座502室','2021-10-25 14:00:27','2021-10-25 14:00:27'),
	(72,'江苏李文甲化工有限公司','913212007724934666',NULL,NULL,NULL,'姜堰经济开发区泰州路568号','2021-10-25 14:01:54','2021-10-25 14:01:54'),
	(73,'湖州锦绣研磨有限公司','91330501MA28CB7R9A',NULL,NULL,NULL,'浙江省湖州市梦溪路228号3幢底层','2021-10-25 14:05:40','2021-10-25 14:05:40'),
	(74,'邵东县天龙洋电工材料有限公司','914305216685711292',NULL,NULL,NULL,'湖南省邵阳市邵东县大禾塘街道办事处龙石村','2021-10-25 14:07:25','2021-10-25 14:07:25'),
	(75,'余姚市博源贸易有限公司','9133028157751855X5',NULL,NULL,NULL,'余姚市中国塑料城东区3-26号','2021-10-25 14:09:22','2021-10-25 14:09:22'),
	(76,'长兴三伟热熔胶有限公司','91330522739933896L',NULL,NULL,NULL,'浙江省湖州市长兴县和平镇工业集中区','2021-10-25 14:11:47','2021-10-25 14:11:47'),
	(77,'常州龙邦润滑科技有限公司','91320405675490060L',NULL,NULL,NULL,'常州经济开发区延陵东路2号','2021-10-25 14:15:12','2021-10-25 14:15:12'),
	(78,'嵊州市远盛纺织品助剂有限公司','91330683745055604A',NULL,NULL,NULL,'浙江省嵊州市崇仁镇富四个私集聚小区','2021-10-25 14:17:09','2021-10-25 14:17:09'),
	(79,'宁波市鄞州隆泰化工厂','91330212793012641Y',NULL,NULL,NULL,'宁波市鄞州区咸祥镇芦蒲村','2021-10-25 14:19:10','2021-10-25 14:19:10'),
	(80,'誉德润滑油（昆山）有限公司','91320583MA1NR60L54',NULL,NULL,NULL,'昆山市千灯镇中节路25号','2021-10-25 14:21:59','2021-10-25 14:21:59'),
	(81,'浙江泽天精细化工有限公司','91330109MA28WHAL4W',NULL,NULL,NULL,'浙江省杭州市萧山区城厢街道湘湖路42号e8信息文创园A区A380室','2021-10-25 14:23:45','2021-10-25 14:23:45'),
	(82,'苏州博润油脂有限公司','91320506569171576K',NULL,NULL,NULL,'苏州市吴中区甪直镇吴淞路68号15幢104室','2021-10-25 14:26:43','2021-10-25 14:26:43'),
	(83,'恩特路新材料科技（武汉）有限公司','91429004MA4920LD3T',NULL,NULL,NULL,'仙桃市西流河镇高新区新材料产业园发展大道东端（周滩村一二组）','2021-10-25 14:27:59','2021-10-25 14:27:59'),
	(84,'兰溪市高科防水材料有限公司','9133078168913741XW',NULL,NULL,NULL,'浙江省兰溪市梅江镇工业功能区通洲路192号','2021-10-25 14:30:19','2021-10-25 14:30:19'),
	(85,'常熟市三旺化工贸易有限公司','91320581078204847D',NULL,NULL,NULL,'常熟市梅李镇古荫路23号','2021-10-25 14:32:16','2021-10-25 14:32:16'),
	(86,'无锡恩特路润滑油科技有限公司','91320206565319545M',NULL,NULL,NULL,'无锡惠山经济开发区惠山大道1619号1146室','2021-10-25 14:33:56','2021-10-25 14:33:56'),
	(87,'临沂英邦化工有限公司','91371300MA3CGF1U38',NULL,NULL,NULL,'山东省临沂市经济开发区金科财税大厦6楼A607-1室','2021-10-25 14:35:25','2021-10-25 14:35:25'),
	(88,'上海津涞精细化学品有限公司','913101180678377103',NULL,NULL,NULL,'上海市青浦区重固镇赵重公路2278号5号楼3层17座','2021-10-25 14:38:16','2021-10-25 14:38:16'),
	(89,'湖州南浔启鑫研磨有限公司','91330503MA28C6LT02',NULL,NULL,NULL,'湖州市南浔区双林镇黄龙兜村吴家埭','2021-10-25 14:40:32','2021-10-25 14:40:32'),
	(90,'长春海谱润斯科技股份有限公司','91220101333825801G',NULL,NULL,NULL,'吉林省长春市北湖科技开发区盛北大街3333号北湖科技园产业一期A5栋街3333号北湖科技园产业一期A5栋','2021-10-25 14:42:37','2021-10-25 14:42:37'),
	(91,'慈溪鸿景清洗剂有限公司','91330282MA2AH6B09R',NULL,NULL,NULL,'浙江省慈溪市龙山镇邱王村慈龙东路738号','2021-10-25 14:54:24','2021-10-25 14:54:24'),
	(92,'上海麦豪新材料科技有限公司','91310116312303289L',NULL,NULL,NULL,'上海市金山区漕泾镇平业路88号3幢','2021-10-25 14:58:12','2021-10-25 14:58:12'),
	(93,'苏州贝思特尔润滑油有限公司','91320506313812085R',NULL,NULL,NULL,'苏州市吴中区甪直镇吴淞路68号11幢103楼室','2021-10-25 14:59:54','2021-10-25 14:59:54'),
	(94,'南京鑫旭工贸有限公司','91320113738870686Y',NULL,NULL,NULL,'南京市栖霞区迈皋桥街道和燕路396号7幢502室','2021-10-25 15:01:55','2021-10-25 15:01:55'),
	(95,'浙江欧绿保新材料技术有限公司','91331100MA2E092M0B',NULL,NULL,NULL,'浙江省丽水市莲都区中山街北399号','2021-10-25 15:03:27','2021-10-25 15:03:27'),
	(96,'宁波市镇海佳思宝润滑油有限公司','91330211084779727E',NULL,NULL,NULL,'浙江省宁波市镇海区招宝山街道平海路1188号','2021-10-25 15:09:46','2021-10-25 15:09:46'),
	(97,'宁波博益润滑油科技有限公司','91330201MA2GRB1F1Y',NULL,NULL,NULL,'浙江省宁波高新区江南路1558号7楼7088-363室','2021-10-25 15:11:28','2021-10-25 15:11:28'),
	(98,'江西麦豪化工科技有限公司','91360425MA35GA5H27',NULL,NULL,NULL,'江西省九江市永修县永修云山经济开发区星火工业园','2021-10-25 15:13:12','2021-10-25 15:13:12'),
	(99,'长沙市润牌润滑脂有限公司','91430103MA4L2UB149',NULL,NULL,NULL,'湖南省长沙市天心区先锋街道新路村大塘角组10号','2021-10-25 15:15:14','2021-10-25 15:15:14'),
	(100,'山西银莹化工股份有限公司','91140800080956554U',NULL,NULL,NULL,'运城市风陵渡经济开发区外环路华望村西口','2021-10-25 15:16:47','2021-10-25 15:16:47'),
	(101,'嘉斐科技（武汉）股份有限公司','914201127646321712',NULL,NULL,NULL,'武汉市东西湖区高桥二路188号（3）','2021-10-25 15:22:09','2021-10-25 15:22:09'),
	(102,'昆山市介普润滑油有限公司','913205836709668406',NULL,NULL,NULL,'周市镇黄浦江北路218号','2021-10-25 15:23:47','2021-10-25 15:23:47'),
	(103,'南京科开新材料有限公司','91320191MA1X53R30G',NULL,NULL,NULL,'南京市江北新区长芦街道利民路11号B幢177室','2021-10-25 15:25:20','2021-10-25 15:25:20'),
	(104,'南通润泽工业油料有限公司','91320621583726056W',NULL,NULL,NULL,'海安县白甸镇思进工业集中区','2021-10-25 15:26:59','2021-10-25 15:26:59'),
	(105,'昆山市介普润滑油有限公司','913205836709668406',NULL,NULL,NULL,'周市镇黄浦江北路218号','2021-10-25 15:30:21','2021-10-25 15:30:21'),
	(106,'台州齐鸿润滑油有限公司','91331021MA2DU4971A',NULL,NULL,NULL,'浙江省玉环市大麦屿街道岗仔头村龙峰路82号','2021-10-25 15:31:42','2021-10-25 15:31:42'),
	(107,'宁波市镇海区庄市五星电镀厂','913302111443413813',NULL,NULL,NULL,'宁波化工区蛟川园区川浦路318','2021-10-25 15:35:15','2021-10-25 15:35:15'),
	(108,'宁波维清润滑油科技有限公司','91330205MA2829L906',NULL,NULL,NULL,'宁波市江北区长兴路677号、685号、687号3幢11-7-20室','2021-10-25 15:36:53','2021-10-25 15:36:53'),
	(109,'天津市驰盛商贸有限公司','91120113786382898B',NULL,NULL,NULL,'天津市北辰区双街镇京津公路以东智谷园21-3-701室-18','2021-10-25 15:38:40','2021-10-25 15:38:40'),
	(110,'宁波市镇海雷神化工有限公司','91330211674711984G',NULL,NULL,NULL,'浙江省镇海大运路1号','2021-10-25 15:40:52','2021-10-25 15:40:52'),
	(111,'南京三众化工有限公司','91320113690425945B',NULL,NULL,NULL,'南京市栖霞区燕子矶街道和燕路408号1幢1101室','2021-10-25 15:43:05','2021-10-25 15:43:05'),
	(112,'上海争飞科技发展有限公司','913101145947072566',NULL,NULL,NULL,'嘉定区安亭镇曹安公路5588号705室','2021-10-25 15:46:30','2021-10-25 15:46:30'),
	(113,'泉州市惠兴建材发展有限公司','913505217917518978',NULL,NULL,NULL,'惠安县惠安县张坂镇惠南工业园区','2021-10-25 15:48:56','2021-10-25 15:48:56'),
	(114,'宁波锦湖润滑油科技有限公司','9133020534060728XG',NULL,NULL,NULL,'浙江省宁波市海曙区横街镇车站南路','2021-10-25 15:51:36','2021-10-25 15:51:36'),
	(115,'无锡市博江科技有限公司','91320214775407260Y',NULL,NULL,NULL,'宜兴市新街街道陆平村塘南组十亩荡','2021-10-25 15:52:49','2021-10-25 15:52:49'),
	(116,'宁波凯莱化工科技有限公司','91330201074907510B',NULL,NULL,NULL,'浙江省宁波保税区高新商用房A1-202-1室','2021-10-25 15:55:01','2021-10-25 15:55:01'),
	(117,'宁波孚润石化有限公司','91330203691350498X',NULL,NULL,NULL,'宁波市海曙区古林镇宋严王村','2021-10-25 15:57:40','2021-10-25 15:57:40'),
	(118,'上海冠钧恒化工有限公司','91310114055057290H',NULL,NULL,NULL,'嘉定区胜辛南路500号10幢1246室','2021-10-25 15:59:50','2021-10-25 15:59:50'),
	(119,'宁波市鄞州五乡宏国金属表面处理剂厂','91330212L31301247E',NULL,NULL,NULL,'宁波市鄞州区五乡镇钟家沙村','2021-10-25 16:01:49','2021-10-25 16:01:49'),
	(120,'无锡北方化学工业有限公司','91320205250115273X',NULL,NULL,NULL,'无锡市锡山区东亭春潮中路41号','2021-10-25 16:03:30','2021-10-25 16:03:30'),
	(121,'上海钧美生物科技有限公司','91310114MA1GUP3P9Q',NULL,NULL,NULL,'上海市嘉定区南翔镇静塘路988号2幢J168室','2021-10-25 16:06:00','2021-10-25 16:06:00'),
	(122,'常德市鼎城信达油品有限公司','91430703792382691B',NULL,NULL,NULL,'常德市鼎城区郭家铺街道孔家溶社区(桥南工业园阳园路以北永兴路以西)','2021-10-25 16:08:44','2021-10-25 16:08:44'),
	(123,'浙江德路宝新材料有限公司','91330282MA2CLDWG6G',NULL,NULL,NULL,'浙江省慈溪市横河镇工业小区翔龙路1号','2021-10-25 16:11:39','2021-10-25 16:11:39'),
	(124,'宁波市鄞州迪翔润滑油有限公司','91330212577514890M',NULL,NULL,NULL,'浙江省宁波市鄞州区姜山镇顺明路1583号','2021-10-25 16:13:57','2021-10-25 16:13:57'),
	(125,'成都市金堂县福强水泥助磨剂有限公司','91510121669678489E',NULL,NULL,NULL,'成都市金堂县三中园区二横道北段看守所宿舍','2021-10-25 16:16:15','2021-10-25 16:16:15'),
	(126,'浙江步路泽化工有限公司','91330211MA2912D61C',NULL,NULL,NULL,'浙江省宁波市镇海区骆驼街道民和路399号902室（新城核心区）','2021-10-25 16:19:55','2021-10-25 16:19:55'),
	(127,'宁波璟熙贸易有限公司','91330212MA2GRED03D',NULL,NULL,NULL,'浙江省宁波市鄞州区会展路222号079幢9号馆1016展位','2021-10-25 16:21:18','2021-10-25 16:21:18'),
	(128,'北京赛诺斯蒂化工技术有限公司','9111010576938455XD',NULL,NULL,NULL,'北京市朝阳区建国路93号院5号楼16层1905','2021-10-25 16:26:28','2021-10-25 16:26:28'),
	(129,'宁波恒程源化工有限公司','913302113405547719',NULL,NULL,NULL,'宁波市镇海区招宝山街道平海路1188号','2021-10-25 16:34:30','2021-10-25 16:34:30'),
	(130,'上海日乾化工科技有限公司','91310120067792639Y',NULL,NULL,NULL,'上海市嘉定区众仁路399号1幢B区15层1511、1512室','2021-10-25 16:36:07','2021-10-25 16:36:07');

/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `origin_id` int(10) unsigned NOT NULL COMMENT '产地',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品名称',
  `search_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` decimal(10,3) NOT NULL COMMENT '重量KG',
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;

INSERT INTO `items` (`id`, `origin_id`, `name`, `search_name`, `weight`, `unit`, `created_at`, `updated_at`)
VALUES
	(1,6,'异构醇醚1007','ygcm1007',200.000,'桶','2021-10-22 21:18:34','2021-10-22 21:18:34'),
	(2,7,'柠檬酸钠','nmsn',25.000,'包','2021-10-22 21:19:25','2021-10-22 21:19:25'),
	(3,8,'AEO7','7',180.000,'桶','2021-10-22 21:20:00','2021-10-22 21:20:00'),
	(4,10,'NP9','9',215.000,'桶','2021-10-22 21:20:22','2021-10-22 21:20:22'),
	(5,11,'6501','6501',200.000,'桶','2021-10-22 21:21:19','2021-10-22 21:21:19'),
	(6,12,'三乙醇胺','syca',220.000,'桶','2021-10-22 21:22:48','2021-10-22 21:22:48'),
	(7,11,'BK','',200.000,'桶','2021-10-22 21:23:11','2021-10-22 21:23:11'),
	(8,2,'三乙醇胺','syca',225.000,'桶','2021-10-22 21:23:50','2021-10-22 21:23:50'),
	(9,13,'三乙醇胺','syca',230.000,'桶','2021-10-22 21:24:34','2021-10-22 21:24:34'),
	(10,14,'三乙醇胺','syca',231.330,'桶','2021-10-22 21:25:29','2021-10-22 21:25:29'),
	(11,15,'NP10','10',200.000,'桶','2021-10-24 20:34:37','2021-10-24 20:34:37'),
	(12,16,'二乙醇胺','eyca',215.000,'桶','2021-10-24 20:35:38','2021-10-24 20:35:38'),
	(13,1,'三乙醇胺','syca',215.000,'桶','2021-10-24 20:47:59','2021-10-24 20:47:59'),
	(14,8,'AEO9','9',200.000,'桶','2021-10-24 20:49:52','2021-10-24 20:49:52'),
	(15,8,'PEG600','600',220.000,'桶','2021-10-24 20:50:20','2021-10-24 20:50:20'),
	(16,17,'二乙醇胺','eyca',230.000,'桶','2021-10-24 20:51:25','2021-10-24 20:51:25'),
	(17,10,'NP10','10',215.000,'桶','2021-10-24 20:53:33','2021-10-24 20:53:33'),
	(18,18,'AEO9','9',200.000,'桶','2021-10-24 21:03:06','2021-10-24 21:03:06'),
	(19,11,'二乙二醇丁醚','eyecdm',200.000,'桶','2021-10-24 21:08:48','2021-10-24 21:08:48'),
	(20,11,'EDTA二钠','en',25.000,'包','2021-10-24 21:10:57','2021-10-24 21:10:57'),
	(21,19,'三乙醇胺','syca',220.000,'桶','2021-10-24 21:13:21','2021-10-24 21:13:21'),
	(22,20,'葡萄糖酸钠','pttsn',25.000,'包','2021-10-24 21:14:53','2021-10-24 21:14:53'),
	(23,6,'异构醇醚1309','ygcm1309',200.000,'桶','2021-10-24 21:15:37','2021-10-24 21:15:37'),
	(24,6,'异构醇醚1308','ygcm1308',200.000,'桶','2021-10-24 21:15:59','2021-10-24 21:15:59'),
	(25,21,'AES','',170.000,'桶','2021-10-24 21:16:36','2021-10-24 21:16:36'),
	(26,14,'二乙醇胺','eyca',228.610,'桶','2021-10-24 21:17:03','2021-10-24 21:17:03'),
	(27,7,'柠檬酸','nms',25.000,'包','2021-10-24 21:20:04','2021-10-24 21:20:04'),
	(28,17,'三乙醇胺','syca',230.000,'桶','2021-10-24 21:29:25','2021-10-24 21:29:25'),
	(29,11,'乙二醇丁醚','yecdm',186.000,'桶','2021-10-24 21:30:50','2021-10-24 21:30:50'),
	(30,21,'AOS','',25.000,'包','2021-10-24 21:32:12','2021-10-24 21:32:12'),
	(31,6,'异构醇醚1009','ygcm1009',200.000,'桶','2021-10-24 21:40:40','2021-10-24 21:40:40'),
	(32,11,'LAS','',25.000,'包','2021-10-24 21:43:18','2021-10-24 21:43:18'),
	(33,16,'一乙醇胺','yyca',210.000,'桶','2021-10-24 21:43:33','2021-10-24 21:43:33'),
	(34,11,'HEDP四钠','sn',25.000,'包','2021-10-24 21:47:47','2021-10-24 21:47:47'),
	(35,11,'氢氧化钠','qyhn',25.000,'包','2021-10-24 21:48:09','2021-10-24 21:48:09'),
	(36,11,'NTA三钠','sn',25.000,'包','2021-10-24 21:48:31','2021-10-24 21:48:31'),
	(37,11,'OP10','10',200.000,'桶','2021-10-24 21:56:46','2021-10-24 21:56:46'),
	(38,11,'JFC-1','1',200.000,'桶','2021-10-24 21:57:18','2021-10-24 21:57:18'),
	(39,11,'NP6','6',215.000,'桶','2021-10-24 21:57:36','2021-10-24 21:57:36'),
	(40,11,'异构醇醚1309','ygcm1309',200.000,'桶','2021-10-24 21:58:07','2021-10-24 21:58:07');

/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table logistics
# ------------------------------------------------------------

DROP TABLE IF EXISTS `logistics`;

CREATE TABLE `logistics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `logistics_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `logistics` WRITE;
/*!40000 ALTER TABLE `logistics` DISABLE KEYS */;

INSERT INTO `logistics` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'黄金物流','2021-10-24 20:20:30','2021-10-24 20:20:30');

/*!40000 ALTER TABLE `logistics` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_01_04_173148_create_admin_tables',1),
	(4,'2017_07_17_040159_create_config_table',1),
	(5,'2019_08_19_000000_create_failed_jobs_table',1),
	(6,'2021_01_16_172644_create_suppliers_table',1),
	(7,'2021_01_16_174510_create_customers_table',1),
	(8,'2021_01_16_175735_create_purchase_orders_table',1),
	(9,'2021_01_16_180636_create_items_table',1),
	(10,'2021_01_16_230722_create_warehouses_table',1),
	(11,'2021_01_17_010638_create_origins_table',1),
	(12,'2021_01_17_131447_create_customer_invoices_table',1),
	(13,'2021_01_17_131506_create_supplier_invoices_table',1),
	(14,'2021_01_18_200709_create_customer_orders_table',1),
	(15,'2021_01_18_204520_create_solds_table',1),
	(16,'2021_01_18_213655_create_logistics_table',1),
	(17,'2021_01_24_222000_create_customer_invoice_details_table',1),
	(18,'2021_02_01_221221_create_customer_payments_table',1),
	(19,'2021_10_17_212348_create_order_infos_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_infos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_infos`;

CREATE TABLE `order_infos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_order_id` bigint(20) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '含量',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `order_infos` WRITE;
/*!40000 ALTER TABLE `order_infos` DISABLE KEYS */;

INSERT INTO `order_infos` (`id`, `customer_order_id`, `item_id`, `quantity`, `unit_price`, `total`, `content`, `created_at`, `updated_at`)
VALUES
	(1,1,1,15,2400.00,36000.00,'99','2021-10-24 22:11:44','2021-10-24 22:11:44'),
	(2,2,2,2,137.50,275.00,'99','2021-10-24 22:13:39','2021-10-24 22:13:39'),
	(3,2,3,1,2106.00,2106.00,'99','2021-10-24 22:13:39','2021-10-24 22:13:39'),
	(4,3,4,1,2902.50,2902.50,'99','2021-10-24 22:16:25','2021-10-24 22:16:25'),
	(5,3,5,1,2800.00,2800.00,'99','2021-10-24 22:16:25','2021-10-24 22:16:25'),
	(6,3,6,1,2750.00,2750.00,'85','2021-10-24 22:16:25','2021-10-24 22:16:25'),
	(7,3,7,1,4300.00,4300.00,'99','2021-10-24 22:16:25','2021-10-24 22:16:25'),
	(8,4,8,2,2452.50,4905.00,'99','2021-10-24 22:17:53','2021-10-24 22:17:53'),
	(9,5,9,2,2540.00,5080.00,'99','2021-10-24 22:19:45','2021-10-24 22:19:45'),
	(10,6,3,1,2417.94,2417.94,'99','2021-10-24 22:23:48','2021-10-24 22:23:48'),
	(11,7,10,1,2880.00,2880.00,'99','2021-10-24 22:24:39','2021-10-24 22:24:39'),
	(12,8,11,5,2585.60,12928.00,'99','2021-10-24 22:40:27','2021-10-24 22:40:27'),
	(13,9,7,1,3900.00,3900.00,'99','2021-10-26 09:35:28','2021-10-26 09:35:28'),
	(14,10,6,1,2750.00,2750.00,'85','2021-10-26 09:37:14','2021-10-26 09:37:14'),
	(15,10,4,1,3302.40,3302.40,'99','2021-10-26 09:37:14','2021-10-26 09:37:14');

/*!40000 ALTER TABLE `order_infos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table origins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `origins`;

CREATE TABLE `origins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `origins_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `origins` WRITE;
/*!40000 ALTER TABLE `origins` DISABLE KEYS */;

INSERT INTO `origins` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'沙比克','2021-10-17 15:53:07','2021-10-17 15:53:07'),
	(2,'东联','2021-10-17 15:53:15','2021-10-17 15:53:15'),
	(3,'沙特陶氏','2021-10-17 15:53:29','2021-10-17 15:53:29'),
	(4,'金燕','2021-10-17 15:53:41','2021-10-17 15:53:41'),
	(5,'茂名','2021-10-17 15:53:47','2021-10-17 15:53:47'),
	(6,'东大','2021-10-22 21:15:14','2021-10-22 21:15:14'),
	(7,'山东英轩','2021-10-22 21:15:46','2021-10-22 21:15:46'),
	(8,'扬子巴斯夫','2021-10-22 21:16:06','2021-10-22 21:16:06'),
	(9,'马石油','2021-10-22 21:16:14','2021-10-22 21:16:14'),
	(10,'嘉兴三江','2021-10-22 21:16:26','2021-10-22 21:16:26'),
	(11,'国产','2021-10-22 21:20:54','2021-10-22 21:20:54'),
	(12,'上海抚佳','2021-10-22 21:22:21','2021-10-22 21:22:21'),
	(13,'嘉兴乐天','2021-10-22 21:24:08','2021-10-22 21:24:08'),
	(14,'美国陶氏','2021-10-22 21:24:57','2021-10-22 21:24:57'),
	(15,'吉林石化','2021-10-24 20:32:40','2021-10-24 20:32:40'),
	(16,'德国巴斯夫','2021-10-24 20:32:47','2021-10-24 20:32:47'),
	(17,'墨西哥','2021-10-24 20:33:03','2021-10-24 20:33:03'),
	(18,'壳牌','2021-10-24 20:33:14','2021-10-24 20:33:14'),
	(19,'泰国','2021-10-24 20:33:35','2021-10-24 20:33:35'),
	(20,'山东西王','2021-10-24 20:33:50','2021-10-24 20:33:50'),
	(21,'中轻','2021-10-24 21:16:19','2021-10-24 21:16:19');

/*!40000 ALTER TABLE `origins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table purchase_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_orders`;

CREATE TABLE `purchase_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `last_number` int(11) NOT NULL,
  `supplier_id` bigint(20) unsigned NOT NULL COMMENT '供应商',
  `order_time` timestamp NOT NULL COMMENT '下单时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_orders_no_unique` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `purchase_orders` WRITE;
/*!40000 ALTER TABLE `purchase_orders` DISABLE KEYS */;

INSERT INTO `purchase_orders` (`id`, `no`, `last_number`, `supplier_id`, `order_time`, `created_at`, `updated_at`)
VALUES
	(1,'PO100001',100001,1,'2016-08-08 00:00:00','2021-10-24 20:23:05','2021-10-24 20:23:05'),
	(2,'PO100002',100002,2,'2016-08-04 00:00:00','2021-10-24 20:24:19','2021-10-24 20:24:19'),
	(3,'PO100003',100003,3,'2016-08-04 00:00:00','2021-10-24 20:25:04','2021-10-24 20:25:04'),
	(4,'PO100004',100004,4,'2016-08-12 00:00:00','2021-10-24 20:26:22','2021-10-24 20:26:22'),
	(5,'PO100005',100005,5,'2016-08-12 00:00:00','2021-10-24 20:27:00','2021-10-24 20:27:00'),
	(6,'PO100006',100006,6,'2016-08-12 00:00:00','2021-10-24 20:27:41','2021-10-24 20:27:41'),
	(7,'PO100007',100007,7,'2016-09-05 00:00:00','2021-10-24 20:28:36','2021-10-24 20:28:36'),
	(8,'PO100008',100008,8,'2016-09-07 00:00:00','2021-10-24 20:29:14','2021-10-24 20:29:14'),
	(9,'PO100009',100009,3,'2016-09-12 00:00:00','2021-10-24 20:29:44','2021-10-24 20:29:44'),
	(10,'PO100010',100010,9,'2016-09-13 00:00:00','2021-10-24 20:30:49','2021-10-24 20:30:49'),
	(11,'PO100011',100011,10,'2016-09-13 00:00:00','2021-10-24 20:40:55','2021-10-24 20:40:55'),
	(12,'PO100012',100012,6,'2016-09-19 00:00:00','2021-10-24 20:42:16','2021-10-24 20:42:16'),
	(13,'PO100013',100013,5,'2016-09-09 00:00:00','2021-10-24 20:42:57','2021-10-24 20:42:57'),
	(14,'PO100014',100014,4,'2016-09-19 00:00:00','2021-10-24 20:43:43','2021-10-24 20:43:43'),
	(15,'PO100015',100015,11,'2016-09-20 00:00:00','2021-10-24 20:45:53','2021-10-24 20:45:53'),
	(16,'PO100016',100016,12,'2016-09-22 00:00:00','2021-10-24 20:46:35','2021-10-24 20:46:35'),
	(17,'PO100017',100017,9,'2016-09-27 00:00:00','2021-10-24 20:49:03','2021-10-24 20:49:03'),
	(18,'PO100018',100018,3,'2016-09-28 00:00:00','2021-10-24 20:52:22','2021-10-24 20:52:22'),
	(19,'PO100019',100019,4,'2016-09-30 00:00:00','2021-10-24 21:04:56','2021-10-24 21:04:56'),
	(20,'PO100020',100020,13,'2016-09-30 00:00:00','2021-10-24 21:05:43','2021-10-24 21:05:43'),
	(21,'PO100021',100021,3,'2016-10-08 00:00:00','2021-10-24 21:06:13','2021-10-24 21:06:13'),
	(22,'PO100022',100022,14,'2016-10-10 00:00:00','2021-10-24 21:09:25','2021-10-24 21:09:25'),
	(23,'PO100023',100023,1,'2016-10-10 00:00:00','2021-10-24 21:09:58','2021-10-24 21:09:58'),
	(24,'PO100024',100024,15,'2016-10-08 00:00:00','2021-10-24 21:11:42','2021-10-24 21:11:42'),
	(25,'PO100025',100025,4,'2016-10-17 00:00:00','2021-10-24 21:12:27','2021-10-24 21:12:27'),
	(26,'PO100026',100026,9,'2016-10-18 00:00:00','2021-10-24 21:14:16','2021-10-24 21:14:16'),
	(27,'PO100027',100027,11,'2016-10-19 00:00:00','2021-10-24 21:17:42','2021-10-24 21:17:42'),
	(28,'PO100028',100028,1,'2016-10-19 00:00:00','2021-10-24 21:18:15','2021-10-24 21:18:15'),
	(29,'PO100029',100029,3,'2016-10-21 00:00:00','2021-10-24 21:18:49','2021-10-24 21:18:49'),
	(30,'PO100030',100030,1,'2016-10-21 00:00:00','2021-10-24 21:19:19','2021-10-24 21:19:19'),
	(31,'PO100031',100031,2,'2016-10-21 00:00:00','2021-10-24 21:20:42','2021-10-24 21:20:42'),
	(32,'PO100032',100032,11,'2016-10-21 00:00:00','2021-10-24 21:21:26','2021-10-24 21:21:26'),
	(33,'PO100033',100033,16,'2016-10-21 00:00:00','2021-10-24 21:21:57','2021-10-24 21:21:57'),
	(34,'PO100034',100034,10,'2016-10-25 00:00:00','2021-10-24 21:22:37','2021-10-24 21:22:37'),
	(35,'PO100035',100035,6,'2016-10-25 00:00:00','2021-10-24 21:23:10','2021-10-24 21:23:10'),
	(36,'PO100036',100078,13,'2016-12-28 00:00:00','2021-10-24 21:24:38','2021-10-24 22:41:14'),
	(37,'PO100037',100037,1,'2016-10-28 00:00:00','2021-10-24 21:25:09','2021-10-24 21:25:09'),
	(38,'PO100038',100038,3,'2016-10-28 00:00:00','2021-10-24 21:27:26','2021-10-24 21:27:26'),
	(39,'PO100039',100039,10,'2016-11-02 00:00:00','2021-10-24 21:28:31','2021-10-24 21:28:31'),
	(40,'PO100040',100040,9,'2016-11-02 00:00:00','2021-10-24 21:30:01','2021-10-24 21:30:01'),
	(41,'PO100041',100041,17,'2016-11-07 00:00:00','2021-10-24 21:31:16','2021-10-24 21:31:16'),
	(42,'PO100042',100042,16,'2016-11-21 00:00:00','2021-10-24 21:33:13','2021-10-24 23:00:35'),
	(43,'PO100043',100043,4,'2016-11-08 00:00:00','2021-10-24 21:33:57','2021-10-24 21:33:57'),
	(44,'PO100044',100044,5,'2016-11-08 00:00:00','2021-10-24 21:34:52','2021-10-24 21:34:52'),
	(45,'PO100045',100045,11,'2016-11-14 00:00:00','2021-10-24 21:35:27','2021-10-24 21:35:27'),
	(46,'PO100046',100046,2,'2016-11-14 00:00:00','2021-10-24 21:36:07','2021-10-24 21:36:07'),
	(47,'PO100047',100047,15,'2016-11-14 00:00:00','2021-10-24 21:37:09','2021-10-24 21:37:09'),
	(48,'PO100048',100048,3,'2016-11-16 00:00:00','2021-10-24 21:38:28','2021-10-24 21:38:28'),
	(49,'PO100049',100049,3,'2016-11-16 00:00:00','2021-10-24 21:38:57','2021-10-24 21:38:57'),
	(50,'PO100050',100050,4,'2016-12-08 00:00:00','2021-10-24 21:39:24','2021-10-24 21:39:24'),
	(51,'PO100051',100051,3,'2016-11-16 00:00:00','2021-10-24 21:40:00','2021-10-24 21:40:00'),
	(52,'PO100052',100052,1,'2016-11-16 00:00:00','2021-10-24 21:41:03','2021-10-24 21:41:03'),
	(53,'PO100053',100053,3,'2016-11-18 00:00:00','2021-10-24 21:41:57','2021-10-24 21:41:57'),
	(54,'PO100054',100054,16,'2016-11-18 00:00:00','2021-10-24 21:42:41','2021-10-24 21:42:41'),
	(55,'PO100055',100055,18,'2016-11-18 00:00:00','2021-10-24 21:44:16','2021-10-24 21:44:16'),
	(56,'PO100056',100056,11,'2016-11-21 00:00:00','2021-10-24 21:44:58','2021-10-24 21:44:58'),
	(57,'PO100057',100057,12,'2016-11-21 00:00:00','2021-10-24 21:45:26','2021-10-24 21:45:26'),
	(58,'PO100058',100058,11,'2016-11-18 00:00:00','2021-10-24 21:45:57','2021-10-24 21:45:57'),
	(59,'PO100059',100059,10,'2016-11-29 00:00:00','2021-10-24 21:46:37','2021-10-24 21:46:37'),
	(60,'PO100060',100060,17,'2016-11-29 00:00:00','2021-10-24 21:47:12','2021-10-24 21:47:12'),
	(61,'PO100061',100061,19,'2016-11-30 00:00:00','2021-10-24 21:49:07','2021-10-24 21:49:07'),
	(62,'PO100062',100062,20,'2016-12-06 00:00:00','2021-10-24 21:49:50','2021-10-24 21:49:50'),
	(63,'PO100063',100063,21,'2016-12-06 00:00:00','2021-10-24 21:50:21','2021-10-24 21:50:21'),
	(64,'PO100064',100064,9,'2016-12-05 00:00:00','2021-10-24 21:51:29','2021-10-24 21:51:29'),
	(65,'PO100065',100065,10,'2016-12-06 00:00:00','2021-10-24 21:52:10','2021-10-24 21:52:10'),
	(66,'PO100066',100066,6,'2016-12-08 00:00:00','2021-10-24 21:52:43','2021-10-24 21:52:43'),
	(67,'PO100067',100067,3,'2016-12-07 00:00:00','2021-10-24 21:53:21','2021-10-24 21:53:21'),
	(68,'PO100068',100068,11,'2016-12-13 00:00:00','2021-10-24 21:54:38','2021-10-24 21:54:38'),
	(69,'PO100069',100069,15,'2016-12-13 00:00:00','2021-10-24 21:55:12','2021-10-24 21:55:12'),
	(70,'PO100070',100070,22,'2016-12-14 00:00:00','2021-10-24 21:58:59','2021-10-24 21:58:59'),
	(71,'PO100071',100071,3,'2016-12-14 00:00:00','2021-10-24 21:59:42','2021-10-24 21:59:42'),
	(72,'PO100072',100072,4,'2016-12-16 00:00:00','2021-10-24 22:00:31','2021-10-24 22:00:31'),
	(73,'PO100073',100073,3,'2016-12-22 00:00:00','2021-10-24 22:01:00','2021-10-24 22:01:00'),
	(74,'PO100074',100074,1,'2016-12-22 00:00:00','2021-10-24 22:01:30','2021-10-24 22:01:30'),
	(75,'PO100075',100075,12,'2016-12-29 00:00:00','2021-10-24 22:02:05','2021-10-24 22:02:05'),
	(76,'PO100076',100076,3,'2016-12-29 00:00:00','2021-10-24 22:02:38','2021-10-24 22:02:38'),
	(77,'PO100077',100077,19,'2016-12-24 00:00:00','2021-10-24 22:03:17','2021-10-24 22:03:17');

/*!40000 ALTER TABLE `purchase_orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table solds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `solds`;

CREATE TABLE `solds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned NOT NULL COMMENT '产品',
  `warehouse_id` bigint(20) unsigned NOT NULL COMMENT '产品库存ID',
  `customer_order_id` bigint(20) unsigned NOT NULL COMMENT '客户订单ID',
  `sales_price` decimal(10,2) NOT NULL COMMENT '销售单价',
  `purchase_price` decimal(10,2) NOT NULL COMMENT '进货单价',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `sales_total` decimal(8,2) NOT NULL COMMENT '销售总金额',
  `purchase_total` decimal(8,2) NOT NULL COMMENT '采购总金额',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `solds` WRITE;
/*!40000 ALTER TABLE `solds` DISABLE KEYS */;

INSERT INTO `solds` (`id`, `item_id`, `warehouse_id`, `customer_order_id`, `sales_price`, `purchase_price`, `quantity`, `sales_total`, `purchase_total`, `created_at`, `updated_at`)
VALUES
	(1,1,1,1,2400.00,2220.00,15,36000.00,33300.00,'2021-10-24 22:11:44','2021-10-24 22:11:44'),
	(2,2,2,2,137.50,135.00,2,275.00,270.00,'2021-10-24 22:13:39','2021-10-24 22:13:39'),
	(3,3,3,2,2106.00,2088.00,1,2106.00,2088.00,'2021-10-24 22:13:39','2021-10-24 22:13:39'),
	(4,4,4,3,2902.50,2902.50,1,2902.50,2902.50,'2021-10-24 22:16:25','2021-10-24 22:16:25'),
	(5,5,5,3,2800.00,1800.00,1,2800.00,1800.00,'2021-10-24 22:16:25','2021-10-24 22:16:25'),
	(6,6,6,3,2750.00,2420.00,1,2750.00,2420.00,'2021-10-24 22:16:25','2021-10-24 22:16:25'),
	(7,7,7,3,4300.00,3600.00,1,4300.00,3600.00,'2021-10-24 22:16:25','2021-10-24 22:16:25'),
	(8,8,8,4,2452.50,2250.00,2,4905.00,4500.00,'2021-10-24 22:17:53','2021-10-24 22:17:53'),
	(9,9,9,5,2540.00,2300.00,2,5080.00,4600.00,'2021-10-24 22:19:45','2021-10-24 22:19:45'),
	(10,3,10,6,2417.94,2304.00,1,2417.94,2304.00,'2021-10-24 22:23:48','2021-10-24 22:23:48'),
	(11,10,11,7,2880.00,2614.03,1,2880.00,2614.03,'2021-10-24 22:24:39','2021-10-24 22:24:39'),
	(12,11,12,8,2585.60,2560.00,5,12928.00,12800.00,'2021-10-24 22:40:27','2021-10-24 22:40:27'),
	(13,7,13,9,3900.00,3600.00,1,3900.00,3600.00,'2021-10-26 09:35:28','2021-10-26 09:35:28'),
	(14,6,14,10,2750.00,2420.00,1,2750.00,2420.00,'2021-10-26 09:37:14','2021-10-26 09:37:14'),
	(15,4,15,10,3302.40,2859.50,1,3302.40,2859.50,'2021-10-26 09:37:14','2021-10-26 09:37:14');

/*!40000 ALTER TABLE `solds` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table supplier_invoices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier_invoices`;

CREATE TABLE `supplier_invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发票号',
  `date` date NOT NULL COMMENT '开票日期',
  `amount` decimal(10,3) NOT NULL COMMENT '金额',
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `supplier_invoices_no_unique` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table suppliers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '供应商名称',
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '税号',
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开户行',
  `account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行账号',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `suppliers_name_unique` (`name`),
  UNIQUE KEY `suppliers_tax_number_unique` (`tax_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;

INSERT INTO `suppliers` (`id`, `name`, `tax_number`, `tel`, `bank`, `account`, `address`, `created_at`, `updated_at`)
VALUES
	(1,'上海东大化学有限公司','913101165559686210','021-60570688',NULL,'03770000040072352','上海市金山区金山卫镇海金路598号','2021-10-22 20:57:24','2021-10-22 20:57:24'),
	(2,'宁波市唯君贸易有限公司','913302010538368641',NULL,NULL,NULL,'宁波市保税区兴业大道8号1号楼417室','2021-10-22 20:59:52','2021-10-22 20:59:52'),
	(3,'宁波凯莱化工科技有限公司','91330201074907510B',NULL,NULL,NULL,'浙江省宁波市保税区高新商业房A1-202-1室','2021-10-22 21:01:52','2021-10-22 21:01:52'),
	(4,'上海岩旺实业有限公司','9131011655290733XE',NULL,NULL,NULL,'上海市金山区朱泾镇中旺路801弄39号','2021-10-22 21:03:20','2021-10-22 21:03:20'),
	(5,'上海抚佳精细化工有限公司','91310116662495241T',NULL,NULL,NULL,'上海市金山区金山卫镇海金路258号','2021-10-22 21:04:51','2021-10-22 21:04:51'),
	(6,'上海振威化工有限公司','913101157847594870',NULL,NULL,NULL,'浦东东方路3698号324室','2021-10-22 21:06:20','2021-10-22 21:06:20'),
	(7,'布拉博化学南京有限公司','91320106053298795X',NULL,NULL,NULL,'南京市鼓楼区市场监督管理局','2021-10-22 21:07:44','2021-10-22 21:07:44'),
	(8,'厦门弗朗特工贸有限公司','9135020669992824XM',NULL,NULL,NULL,'厦门市湖里区安岭路990-992号森宝财富中心5层505单元','2021-10-22 21:09:52','2021-10-22 21:09:52'),
	(9,'中昊国际贸易有限公司','91110105710929439T',NULL,NULL,NULL,'北京市朝阳区小营路19号1号楼A901号、A902号','2021-10-22 21:12:26','2021-10-22 21:12:26'),
	(10,'嘉兴市中惠化工有限公司','91330401785654724F',NULL,NULL,NULL,'嘉兴市中山西路财富广场D1108室','2021-10-23 13:19:26','2021-10-23 13:19:26'),
	(11,'杭州天虹化工有限公司','913301857620326666',NULL,NULL,NULL,'浙江省杭州市临安区锦南街道福兴街846-862（第三层）','2021-10-23 13:21:11','2021-10-23 13:21:11'),
	(12,'宁波蓝景化工有限公司','913032010982431656',NULL,NULL,NULL,'浙江省宁波高新区菁华路188号B座4A05','2021-10-23 13:26:54','2021-10-23 13:26:54'),
	(13,'南京鑫旭工贸有限公司','91320113738870686Y',NULL,NULL,NULL,'南京市栖霞区迈皋桥街道和燕路396号7幢502室','2021-10-23 13:28:31','2021-10-23 13:28:31'),
	(14,'江苏德纳化学股份有限公司','913201007681922810',NULL,NULL,NULL,'南京化学工业园区白龙路2号','2021-10-23 13:31:33','2021-10-23 13:31:33'),
	(15,'常州德烨化工有限公司','9132041179195175XN',NULL,NULL,NULL,'常州市新北区通江中路600号江苏长江塑化市场16幢117室','2021-10-23 13:33:06','2021-10-23 13:33:06'),
	(16,'中轻化工绍兴有限公司','91330604755935162A',NULL,NULL,NULL,'杭州湾上虞经济技术开发区','2021-10-23 13:35:20','2021-10-23 13:35:20'),
	(17,'宁波大榭开发区甬大化工原料有限公司','91330201254112002M',NULL,NULL,NULL,'浙江省宁波市大榭开发区海洲北楼107室','2021-10-23 13:41:56','2021-10-23 13:41:56'),
	(18,'上海金锦乐实业有限公司','9131011463218950XQ',NULL,NULL,NULL,'上海市嘉定区嘉罗公路1661弄24号912室','2021-10-23 13:43:48','2021-10-23 13:43:48'),
	(19,'山东泰和水处理科技股份有限公司','91370400786125648K',NULL,NULL,NULL,'山东省枣庄市市中区十里泉东路1号','2021-10-23 13:45:30','2021-10-23 13:45:30'),
	(20,'南京群策化工有限公司','913201023026386594',NULL,NULL,NULL,'南京市玄武区花园路8号','2021-10-23 13:50:59','2021-10-23 13:50:59'),
	(21,'上海融会化工有限公司','91310116688722334X',NULL,NULL,NULL,'上海市金山区卫清西路423号五楼96室','2021-10-23 13:56:10','2021-10-23 13:56:10'),
	(22,'江苏省海安石油化工厂','91320621138576563R',NULL,NULL,NULL,'海安县海安镇长江西路99号（海安工业园区内）','2021-10-23 14:00:17','2021-10-23 14:00:17'),
	(23,'丽水博瑞特化工有限公司','9133112230740849XW',NULL,NULL,NULL,'缙云县七里乡黄塘头村朱村自然村2-1号','2021-10-23 14:02:38','2021-10-23 14:02:38'),
	(24,'杭州斯奇则化工有限公司','913301096829100866',NULL,NULL,NULL,'萧山区宁围街道市心北路563号B1302室','2021-10-23 14:05:45','2021-10-23 14:05:45'),
	(25,'杭州银发物资工贸有限公司','9130310971951874Y',NULL,NULL,NULL,'萧山区萧绍东路101-1号','2021-10-23 14:12:45','2021-10-23 14:12:45'),
	(26,'宁波德昕石化有限公司','91330206573653711N',NULL,NULL,NULL,'浙江省宁波市北仑区梅山梅山大道288号2幢1106-5室','2021-10-23 14:14:49','2021-10-23 14:14:49'),
	(27,'常州常塑盛电子商务有限公司','9132041134616407X1',NULL,NULL,NULL,'常州市新北区太湖东路9号4幢307-1室','2021-10-23 14:17:32','2021-10-23 14:17:32'),
	(28,'浙江赞宇新材有限公司','91330726MA28PF46X7',NULL,NULL,NULL,'浙江省浦江县凤荷路589号月泉智能装备产业园1号楼二楼（自主申报）','2021-10-23 14:21:27','2021-10-23 14:21:27'),
	(29,'赞宇科技集团股份有限公司','91330000723629902K',NULL,NULL,NULL,'浙江省杭州市城头巷128号','2021-10-23 14:22:54','2021-10-23 14:22:54'),
	(30,'宁波市联凯化学有限公司','91330206695082793H',NULL,NULL,NULL,'浙江省宁波市北仑区梅山梅山大道288号2幢1106-3室','2021-10-23 14:25:17','2021-10-23 14:25:17'),
	(31,'南京三众化工有限公司','91320113690425945B',NULL,NULL,NULL,'南京市栖霞区燕子矶街道和燕路408号1幢1101室','2021-10-24 14:10:24','2021-10-24 14:10:24'),
	(32,'南京程飞工贸有限公司','913201187971451506',NULL,NULL,NULL,'南京市高淳经济开发区松园南路8号3幢','2021-10-24 14:11:48','2021-10-24 14:11:48'),
	(33,'浙江步路泽化工有限公司','91330211MA2912D61C',NULL,NULL,NULL,'浙江省宁波市镇海区骆驼街道民和路339号902室（新城核心区）','2021-10-24 14:13:17','2021-10-24 14:13:17'),
	(34,'福建龙岩帝鑫化工有限公司','91350800MA32U4BRXG',NULL,NULL,NULL,'福建省龙岩市新罗区紫金山华莲西路88号梧桐郡13幢1梯401室','2021-10-24 14:15:18','2021-10-24 14:15:18'),
	(35,'宁波恒程源化工有限公司','913302113405547719',NULL,NULL,NULL,'宁波市镇海区招宝山街道平海路1188号','2021-10-24 14:17:07','2021-10-24 14:17:07'),
	(36,'无锡隆则行国际贸易有限公司','91320281MA1TBC147C',NULL,NULL,NULL,'江阴市滨江西路2号7幢305室','2021-10-24 14:18:36','2021-10-24 14:18:36'),
	(37,'杭州瑞星化工有限公司','91330102715482568Q',NULL,NULL,NULL,'上城区之江路958号景江城市花园1幢5单元1507室','2021-10-24 14:20:57','2021-10-24 14:20:57'),
	(38,'福州特威化工有限公司','91350100761751394A',NULL,NULL,NULL,'福州市鼓楼区东街14号福建闽辉大厦2号楼三层301-304室','2021-10-24 14:22:50','2021-10-24 14:22:50');

/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table warehouses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `warehouses`;

CREATE TABLE `warehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned NOT NULL COMMENT '产品',
  `purchase_order_id` bigint(20) unsigned NOT NULL COMMENT 'PO单号',
  `unit_price` decimal(10,2) NOT NULL COMMENT '单价',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `sold` int(11) NOT NULL COMMENT '已售',
  `for_sale` int(11) NOT NULL COMMENT '待售',
  `total` decimal(8,2) NOT NULL COMMENT '总金额',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产地',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `warehouses` WRITE;
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;

INSERT INTO `warehouses` (`id`, `item_id`, `purchase_order_id`, `unit_price`, `quantity`, `sold`, `for_sale`, `total`, `remark`, `created_at`, `updated_at`)
VALUES
	(1,1,1,2220.00,15,15,0,33300.00,NULL,'2021-10-24 20:23:05','2021-10-24 22:11:44'),
	(2,2,2,135.00,2,2,0,270.00,NULL,'2021-10-24 20:24:19','2021-10-24 22:13:39'),
	(3,3,3,2088.00,1,1,0,2088.00,NULL,'2021-10-24 20:25:04','2021-10-24 22:13:39'),
	(4,4,4,2902.50,1,1,0,2902.50,NULL,'2021-10-24 20:26:22','2021-10-24 22:16:25'),
	(5,5,4,1800.00,1,1,0,1800.00,NULL,'2021-10-24 20:26:22','2021-10-24 22:16:25'),
	(6,6,5,2420.00,1,1,0,2420.00,NULL,'2021-10-24 20:27:00','2021-10-24 22:16:25'),
	(7,7,6,3600.00,1,1,0,3600.00,NULL,'2021-10-24 20:27:41','2021-10-24 22:16:25'),
	(8,8,7,2250.00,2,2,0,4500.00,NULL,'2021-10-24 20:28:36','2021-10-24 22:17:53'),
	(9,9,8,2300.00,2,2,0,4600.00,NULL,'2021-10-24 20:29:14','2021-10-24 22:19:45'),
	(10,3,9,2304.00,1,1,0,2304.00,NULL,'2021-10-24 20:29:44','2021-10-24 22:23:48'),
	(11,10,10,2614.03,1,1,0,2614.03,NULL,'2021-10-24 20:30:49','2021-10-24 22:24:39'),
	(12,11,11,2560.00,5,5,0,12800.00,NULL,'2021-10-24 20:40:55','2021-10-24 22:40:27'),
	(13,7,12,3600.00,1,1,0,3600.00,NULL,'2021-10-24 20:42:16','2021-10-26 09:35:28'),
	(14,6,13,2420.00,1,1,0,2420.00,NULL,'2021-10-24 20:42:57','2021-10-26 09:37:14'),
	(15,4,14,2859.50,1,1,0,2859.50,NULL,'2021-10-24 20:43:43','2021-10-26 09:37:14'),
	(16,2,15,135.00,40,0,40,5400.00,NULL,'2021-10-24 20:45:53','2021-10-24 20:45:53'),
	(17,12,16,2142.50,1,0,1,2142.50,NULL,'2021-10-24 20:46:35','2021-10-24 20:46:35'),
	(18,13,17,2074.75,15,0,15,31121.25,NULL,'2021-10-24 20:49:03','2021-10-24 20:49:03'),
	(19,14,18,2520.00,6,0,6,15120.00,NULL,'2021-10-24 20:52:22','2021-10-24 20:52:22'),
	(20,17,19,2773.50,5,0,5,13867.50,NULL,'2021-10-24 21:04:56','2021-10-24 21:04:56'),
	(21,18,19,2600.00,1,0,1,2600.00,NULL,'2021-10-24 21:04:56','2021-10-24 21:04:56'),
	(22,15,19,2046.00,3,0,3,6138.00,NULL,'2021-10-24 21:04:56','2021-10-24 21:04:56'),
	(23,16,20,2185.00,5,0,5,10925.00,NULL,'2021-10-24 21:05:43','2021-10-24 21:05:43'),
	(24,3,21,2394.00,1,0,1,2394.00,NULL,'2021-10-24 21:06:13','2021-10-24 21:06:13'),
	(25,19,22,2700.00,10,0,10,27000.00,NULL,'2021-10-24 21:09:25','2021-10-24 21:09:25'),
	(26,1,23,2180.00,15,0,15,32700.00,NULL,'2021-10-24 21:09:58','2021-10-24 21:09:58'),
	(27,20,24,425.00,10,0,10,4250.00,NULL,'2021-10-24 21:11:42','2021-10-24 21:11:42'),
	(28,17,25,2773.50,1,0,1,2773.50,NULL,'2021-10-24 21:12:27','2021-10-24 21:12:27'),
	(29,21,26,2068.00,15,0,15,31020.00,NULL,'2021-10-24 21:14:16','2021-10-24 21:14:16'),
	(30,22,27,92.50,40,0,40,3700.00,NULL,'2021-10-24 21:17:42','2021-10-24 21:17:42'),
	(31,23,28,3100.00,1,0,1,3100.00,NULL,'2021-10-24 21:18:15','2021-10-24 21:18:15'),
	(32,17,29,2752.00,1,0,1,2752.00,NULL,'2021-10-24 21:18:49','2021-10-24 21:18:49'),
	(33,24,30,3200.00,1,0,1,3200.00,NULL,'2021-10-24 21:19:19','2021-10-24 21:19:19'),
	(34,27,31,138.75,40,0,40,5550.00,NULL,'2021-10-24 21:20:42','2021-10-24 21:20:42'),
	(35,22,32,90.00,120,0,120,10800.00,NULL,'2021-10-24 21:21:26','2021-10-24 21:21:26'),
	(36,25,33,1870.00,1,0,1,1870.00,NULL,'2021-10-24 21:21:57','2021-10-24 21:21:57'),
	(37,17,34,2687.50,2,0,2,5375.00,NULL,'2021-10-24 21:22:37','2021-10-24 21:22:37'),
	(38,7,35,3600.00,1,0,1,3600.00,NULL,'2021-10-24 21:23:10','2021-10-24 21:23:10'),
	(39,26,36,2286.10,1,0,1,2286.10,NULL,'2021-10-24 21:24:38','2021-10-24 21:24:38'),
	(40,8,36,2565.00,2,0,2,5130.00,NULL,'2021-10-24 21:24:38','2021-10-24 21:24:38'),
	(41,23,37,3300.00,1,0,1,3300.00,NULL,'2021-10-24 21:25:09','2021-10-24 21:25:09'),
	(42,3,38,2394.00,1,0,1,2394.00,NULL,'2021-10-24 21:27:26','2021-10-24 21:27:26'),
	(43,17,39,2666.00,5,0,5,13330.00,NULL,'2021-10-24 21:28:31','2021-10-24 21:28:31'),
	(44,28,40,2438.00,5,0,5,12190.00,NULL,'2021-10-24 21:30:01','2021-10-24 21:30:01'),
	(45,29,41,2146.00,1,0,1,2146.00,NULL,'2021-10-24 21:31:16','2021-10-24 21:31:16'),
	(46,30,42,327.50,20,0,20,6550.00,NULL,'2021-10-24 21:33:13','2021-10-24 21:33:13'),
	(47,4,43,2795.00,1,0,1,2795.00,NULL,'2021-10-24 21:33:57','2021-10-24 21:33:57'),
	(48,6,44,2596.00,1,0,1,2596.00,NULL,'2021-10-24 21:34:52','2021-10-24 21:34:52'),
	(49,22,45,92.50,80,0,80,7400.00,NULL,'2021-10-24 21:35:27','2021-10-24 21:35:27'),
	(50,2,46,170.00,40,0,40,6800.00,NULL,'2021-10-24 21:36:07','2021-10-24 21:36:07'),
	(51,20,47,425.00,10,0,10,4250.00,NULL,'2021-10-24 21:37:09','2021-10-24 21:37:09'),
	(52,17,48,2730.50,10,0,10,27305.00,NULL,'2021-10-24 21:38:28','2021-10-24 21:38:28'),
	(53,14,48,2620.00,1,0,1,2620.00,NULL,'2021-10-24 21:38:28','2021-10-24 21:38:28'),
	(54,3,49,2430.00,1,0,1,2430.00,NULL,'2021-10-24 21:38:57','2021-10-24 21:38:57'),
	(55,4,50,2795.00,1,0,1,2795.00,NULL,'2021-10-24 21:39:24','2021-10-24 21:39:24'),
	(56,23,51,2860.00,5,0,5,14300.00,NULL,'2021-10-24 21:40:00','2021-10-24 21:40:00'),
	(57,31,52,2240.00,1,0,1,2240.00,NULL,'2021-10-24 21:41:03','2021-10-24 21:41:03'),
	(58,17,53,2709.00,3,0,3,8127.00,NULL,'2021-10-24 21:41:57','2021-10-24 21:41:57'),
	(59,24,53,2920.00,4,0,4,11680.00,NULL,'2021-10-24 21:41:57','2021-10-24 21:41:57'),
	(60,25,54,1785.00,6,0,6,10710.00,NULL,'2021-10-24 21:42:41','2021-10-24 21:42:41'),
	(61,32,55,175.00,10,0,10,1750.00,NULL,'2021-10-24 21:44:16','2021-10-24 21:44:16'),
	(62,22,56,92.50,160,0,160,14800.00,NULL,'2021-10-24 21:44:58','2021-10-24 21:44:58'),
	(63,33,57,1995.00,1,0,1,1995.00,NULL,'2021-10-24 21:45:26','2021-10-24 21:45:26'),
	(64,22,58,95.00,40,0,40,3800.00,NULL,'2021-10-24 21:45:57','2021-10-24 21:45:57'),
	(65,11,59,2480.00,5,0,5,12400.00,NULL,'2021-10-24 21:46:37','2021-10-24 21:46:37'),
	(66,29,60,2233.20,1,0,1,2233.20,NULL,'2021-10-24 21:47:12','2021-10-24 21:47:12'),
	(67,34,61,287.50,200,0,200,57500.00,NULL,'2021-10-24 21:49:07','2021-10-24 21:49:07'),
	(68,19,62,2730.00,10,0,10,27300.00,NULL,'2021-10-24 21:49:50','2021-10-24 21:49:50'),
	(69,35,63,107.50,40,0,40,4300.00,NULL,'2021-10-24 21:50:21','2021-10-24 21:50:21'),
	(70,28,64,2461.00,12,0,12,29532.00,NULL,'2021-10-24 21:51:29','2021-10-24 21:51:29'),
	(71,11,65,2480.00,1,0,1,2480.00,NULL,'2021-10-24 21:52:10','2021-10-24 21:52:10'),
	(72,7,66,3600.00,1,0,1,3600.00,NULL,'2021-10-24 21:52:43','2021-10-24 21:52:43'),
	(73,3,67,2520.00,2,0,2,5040.00,NULL,'2021-10-24 21:53:21','2021-10-24 21:53:21'),
	(74,22,68,97.50,40,0,40,3900.00,NULL,'2021-10-24 21:54:38','2021-10-24 21:54:38'),
	(75,2,68,175.00,40,0,40,7000.00,NULL,'2021-10-24 21:54:38','2021-10-24 21:54:38'),
	(76,36,69,425.00,20,0,20,8500.00,NULL,'2021-10-24 21:55:12','2021-10-24 21:55:12'),
	(77,37,70,2840.00,1,0,1,2840.00,NULL,'2021-10-24 21:58:59','2021-10-24 21:58:59'),
	(78,38,70,3000.00,1,0,1,3000.00,NULL,'2021-10-24 21:58:59','2021-10-24 21:58:59'),
	(79,17,71,2666.00,1,0,1,2666.00,NULL,'2021-10-24 21:59:42','2021-10-24 21:59:42'),
	(80,39,72,3053.00,1,0,1,3053.00,NULL,'2021-10-24 22:00:31','2021-10-24 22:00:31'),
	(81,4,72,2838.00,1,0,1,2838.00,NULL,'2021-10-24 22:00:31','2021-10-24 22:00:31'),
	(82,3,73,2574.00,2,0,2,5148.00,NULL,'2021-10-24 22:01:00','2021-10-24 22:01:00'),
	(83,31,74,2460.00,2,0,2,4920.00,NULL,'2021-10-24 22:01:30','2021-10-24 22:01:30'),
	(84,16,75,2300.00,1,0,1,2300.00,NULL,'2021-10-24 22:02:05','2021-10-24 22:02:05'),
	(85,40,76,2860.00,1,0,1,2860.00,NULL,'2021-10-24 22:02:38','2021-10-24 22:02:38'),
	(86,34,77,262.50,200,0,200,52500.00,NULL,'2021-10-24 22:03:17','2021-10-24 22:03:17');

/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
