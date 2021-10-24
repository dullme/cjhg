# ************************************************************
# Sequel Pro SQL dump
# Version (null)
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.34-log)
# Database: cjhg
# Generation Time: 2021-10-24 14:58:19 +0000
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
	(830,1,'admin/purchase-orders','GET','112.14.53.205','[]','2021-10-24 22:43:58','2021-10-24 22:43:58');

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
	(8,'SO100008',2,100008,0,0.00,0.00,0.00,0.00,'黄金物流',0.13,12928.00,12928.00,0.00,'2016-09-13 00:00:00',NULL,NULL,NULL,NULL,'2021-10-24 22:40:27','2021-10-24 22:40:27');

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
	(4,'玉环银丰金属助剂厂','913310217331902512',NULL,NULL,NULL,'浙江省玉环市玉城街道城北创融产业城16幢101、201室','2021-10-22 22:10:30','2021-10-22 22:10:30'),
	(5,'常山县今尔金属加工润滑剂厂','91330822771923292L',NULL,NULL,NULL,'浙江省常山县新都工业园区','2021-10-22 22:11:58','2021-10-22 22:11:58'),
	(6,'宁波市海曙浩洋水性涂料厂','913302037723207682',NULL,NULL,NULL,'宁波市海曙区市场监督管理局','2021-10-22 22:16:26','2021-10-22 22:16:26'),
	(7,'杭州绿普化工科技有限公司','91330100773590305W',NULL,NULL,NULL,'91330100773590305W','2021-10-24 20:08:50','2021-10-24 20:08:50'),
	(8,'昆山华林印染助剂有限公司','9132058376240591XM',NULL,NULL,NULL,'昆山市淀山湖镇永勤村','2021-10-24 20:11:09','2021-10-24 20:11:09'),
	(9,'上海建飞环保科技有限公司','9131011656957181XN',NULL,NULL,NULL,'上海市金山区漕泾镇沪杭公路4619号3幢164室','2021-10-24 20:12:09','2021-10-24 20:12:09'),
	(10,'宁波市鄞州恒贝金属表面处理剂厂','913302126620898090',NULL,NULL,NULL,'宁波市鄞州区五乡镇石山弄村冯家','2021-10-24 20:13:12','2021-10-24 20:13:12'),
	(11,'英山县昌泰化工有限公司','91421124728329837L',NULL,NULL,NULL,'英山县温泉镇温泉路113号','2021-10-24 20:14:11','2021-10-24 20:14:11'),
	(12,'浙江金方孚环保科技有限公司','913302110538088987',NULL,NULL,NULL,'913302110538088987','2021-10-24 20:16:25','2021-10-24 20:16:25'),
	(13,'宁波海曙美洁防腐材料有限公司','91330203681058522R',NULL,NULL,NULL,'浙江省宁波市海曙区新典路7号-3','2021-10-24 20:17:34','2021-10-24 20:17:34'),
	(14,'绍兴汇丽环保有限公司','91330604609674830U',NULL,NULL,NULL,'浙江省绍兴市上虞区梁湖工业园区','2021-10-24 20:18:40','2021-10-24 20:18:40');

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
	(12,8,11,5,2585.60,12928.00,'99','2021-10-24 22:40:27','2021-10-24 22:40:27');

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
	(42,'PO100042',100042,16,'2021-11-07 00:00:00','2021-10-24 21:33:13','2021-10-24 21:33:13'),
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
	(12,11,12,8,2585.60,2560.00,5,12928.00,12800.00,'2021-10-24 22:40:27','2021-10-24 22:40:27');

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
  PRIMARY KEY (`id`)
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
	(13,7,12,3600.00,1,0,1,3600.00,NULL,'2021-10-24 20:42:16','2021-10-24 20:42:16'),
	(14,6,13,2420.00,1,0,1,2420.00,NULL,'2021-10-24 20:42:57','2021-10-24 20:42:57'),
	(15,4,14,2859.50,1,0,1,2859.50,NULL,'2021-10-24 20:43:43','2021-10-24 20:43:43'),
	(16,2,15,135.00,40,0,40,5400.00,NULL,'2021-10-24 20:45:53','2021-10-24 20:45:53'),
	(17,12,16,2142.50,1,0,1,2142.50,NULL,'2021-10-24 20:46:35','2021-10-24 20:46:35'),
	(18,13,17,2074.75,15,0,15,31121.25,NULL,'2021-10-24 20:49:03','2021-10-24 20:49:03'),
	(19,14,18,2520.00,6,0,6,15120.00,NULL,'2021-10-24 20:52:22','2021-10-24 20:52:22'),
	(20,17,19,2773.50,5,0,5,13867.50,NULL,'2021-10-24 21:04:56','2021-10-24 21:04:56'),
	(21,18,19,2600.00,5,0,5,13000.00,NULL,'2021-10-24 21:04:56','2021-10-24 21:04:56'),
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
