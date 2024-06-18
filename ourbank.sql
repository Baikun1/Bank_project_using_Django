-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.37 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ourbank
CREATE DATABASE IF NOT EXISTS `ourbank` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ourbank`;

-- Dumping structure for table ourbank.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ourbank.auth_group: ~0 rows (approximately)
DELETE FROM `auth_group`;

-- Dumping structure for table ourbank.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ourbank.auth_group_permissions: ~0 rows (approximately)
DELETE FROM `auth_group_permissions`;

-- Dumping structure for table ourbank.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ourbank.auth_permission: ~32 rows (approximately)
DELETE FROM `auth_permission`;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add client', 7, 'add_client'),
	(26, 'Can change client', 7, 'change_client'),
	(27, 'Can delete client', 7, 'delete_client'),
	(28, 'Can view client', 7, 'view_client'),
	(29, 'Can add transaction', 8, 'add_transaction'),
	(30, 'Can change transaction', 8, 'change_transaction'),
	(31, 'Can delete transaction', 8, 'delete_transaction'),
	(32, 'Can view transaction', 8, 'view_transaction');

-- Dumping structure for table ourbank.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ourbank.auth_user: ~0 rows (approximately)
DELETE FROM `auth_user`;

-- Dumping structure for table ourbank.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ourbank.auth_user_groups: ~0 rows (approximately)
DELETE FROM `auth_user_groups`;

-- Dumping structure for table ourbank.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ourbank.auth_user_user_permissions: ~0 rows (approximately)
DELETE FROM `auth_user_user_permissions`;

-- Dumping structure for table ourbank.banking_client
CREATE TABLE IF NOT EXISTS `banking_client` (
  `account_no` bigint NOT NULL,
  `phno` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `bal` decimal(10,2) NOT NULL,
  `pin` int NOT NULL,
  PRIMARY KEY (`account_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ourbank.banking_client: ~48 rows (approximately)
DELETE FROM `banking_client`;
INSERT INTO `banking_client` (`account_no`, `phno`, `name`, `bal`, `pin`) VALUES
	(1234567890, '9348674913', 'Baikuntha Behera', 10999993.00, 1234),
	(1234567891, '9348674914', 'John Doe', 5000.00, 2345),
	(1234567892, '9348674915', 'Jane Smith', 4766.00, 3456),
	(1234567893, '9348674916', 'Alice Brown', 7000.00, 4567),
	(1234567894, '9348674917', 'Bob Johnson', 8000.00, 5678),
	(1234567895, '9348674918', 'Carol White', 9000.00, 6789),
	(1234567896, '9348674919', 'Dave Black', 10000.00, 7890),
	(1234567897, '9348674920', 'Emma Lee', 11000.00, 8901),
	(1234567898, '9348674921', 'Frank Green', 12000.00, 9012),
	(1234567899, '9348674922', 'Grace Taylor', 13000.00, 123),
	(1234567900, '9348674923', 'Henry Davis', 14000.00, 1234),
	(1234567901, '9348674924', 'Ivy Wilson', 15000.00, 2345),
	(1234567902, '9348674925', 'Jack Anderson', 16000.00, 3456),
	(1234567903, '9348674926', 'Kate Brown', 17000.00, 4567),
	(1234567904, '9348674927', 'Liam Martinez', 18000.00, 5678),
	(1234567905, '9348674928', 'Mia Thompson', 19000.00, 6789),
	(1234567906, '9348674929', 'Noah Garcia', 20000.00, 7890),
	(1234567907, '9348674930', 'Olivia Robinson', 21000.00, 8901),
	(1234567908, '9348674931', 'Patrick Wright', 22000.00, 9012),
	(1234567909, '9348674932', 'Quinn Hall', 23000.00, 123),
	(1234567910, '9348674933', 'Rachel Young', 24000.00, 1234),
	(1234567911, '9348674934', 'Samuel Taylor', 25000.00, 2345),
	(1234567912, '9348674935', 'Tina Johnson', 26000.00, 3456),
	(1234567913, '9348674936', 'Uma Smith', 27000.00, 4567),
	(1234567914, '9348674937', 'Victor Brown', 28000.00, 5678),
	(1234567915, '9348674938', 'Wendy Davis', 29000.00, 6789),
	(1234567916, '9348674939', 'Xavier White', 30000.00, 7890),
	(1234567917, '9348674940', 'Yolanda Garcia', 31000.00, 8901),
	(1234567918, '9348674941', 'Zack Robinson', 32000.00, 9012),
	(1234567919, '9348674942', 'Abigail Wright', 33000.00, 123),
	(1234567920, '9348674943', 'Benjamin Hall', 34000.00, 1234),
	(1234567921, '9348674944', 'Chloe Young', 35000.00, 2345),
	(1234567922, '9348674945', 'Daniel Taylor', 36000.00, 3456),
	(1234567923, '9348674946', 'Emily Johnson', 37000.00, 4567),
	(1234567924, '9348674947', 'Fiona Brown', 38000.00, 5678),
	(1234567925, '9348674948', 'George Davis', 39000.00, 6789),
	(1234567926, '9348674949', 'Hannah White', 40000.00, 7890),
	(1234567927, '9348674950', 'Ian Garcia', 41000.00, 8901),
	(1234567928, '9348674951', 'Julia Robinson', 42000.00, 9012),
	(1234567929, '9348674952', 'Kevin Wright', 43000.00, 123),
	(1234567930, '9348674953', 'Lily Hall', 44000.00, 1234),
	(1234567931, '9348674954', 'Michael Young', 45000.00, 2345),
	(1234567932, '9348674955', 'Natalie Taylor', 46000.00, 3456),
	(1234567933, '9348674956', 'Oliver Johnson', 47000.00, 4567),
	(1234567934, '9348674957', 'Penelope Brown', 48000.00, 5678),
	(1234567935, '9348674958', 'Quentin Davis', 49000.00, 6789),
	(1234567936, '9348674959', 'Rachel White', 50000.00, 7890),
	(8602408113, '7735099528', 'Nirmala Kumari Behera', 12760.00, 1234);

-- Dumping structure for table ourbank.banking_transaction
CREATE TABLE IF NOT EXISTS `banking_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `account_no_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `banking_transaction_account_no_id_ded6d539_fk_banking_c` (`account_no_id`),
  CONSTRAINT `banking_transaction_account_no_id_ded6d539_fk_banking_c` FOREIGN KEY (`account_no_id`) REFERENCES `banking_client` (`account_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ourbank.banking_transaction: ~36 rows (approximately)
DELETE FROM `banking_transaction`;
INSERT INTO `banking_transaction` (`id`, `transaction_type`, `amount`, `timestamp`, `account_no_id`) VALUES
	(1, 'Credit', 500.00, '2023-06-01 10:00:00.000000', 1234567890),
	(2, 'Debit', 250.00, '2023-06-02 11:00:00.000000', 1234567890),
	(3, 'Credit', 700.00, '2023-06-03 12:00:00.000000', 1234567890),
	(4, 'Debit', 150.00, '2023-06-04 13:00:00.000000', 1234567890),
	(5, 'Credit', 300.00, '2023-06-05 14:00:00.000000', 1234567890),
	(6, 'Debit', 400.00, '2023-06-06 15:00:00.000000', 1234567890),
	(7, 'Credit', 800.00, '2023-06-07 16:00:00.000000', 1234567890),
	(8, 'Debit', 50.00, '2023-06-08 17:00:00.000000', 1234567890),
	(9, 'Credit', 600.00, '2023-06-09 18:00:00.000000', 1234567890),
	(10, 'Debit', 350.00, '2023-06-10 19:00:00.000000', 1234567890),
	(11, 'Credit', 200.00, '2023-06-11 20:00:00.000000', 1234567890),
	(12, 'Debit', 450.00, '2023-06-12 21:00:00.000000', 1234567890),
	(13, 'Credit', 900.00, '2023-06-13 22:00:00.000000', 1234567890),
	(14, 'Debit', 100.00, '2023-06-14 23:00:00.000000', 1234567890),
	(15, 'Credit', 750.00, '2023-06-15 10:00:00.000000', 1234567890),
	(16, 'Debit', 50.00, '2023-06-16 11:00:00.000000', 1234567890),
	(17, 'Credit', 400.00, '2023-06-17 12:00:00.000000', 1234567890),
	(18, 'Debit', 150.00, '2023-06-18 13:00:00.000000', 1234567890),
	(19, 'Credit', 600.00, '2023-06-19 14:00:00.000000', 1234567890),
	(20, 'Debit', 250.00, '2023-06-20 15:00:00.000000', 1234567890),
	(21, 'debit', 234.00, '2024-06-15 17:32:20.492207', 1234567892),
	(22, 'debit', 999.00, '2024-06-15 17:33:58.376258', 1234567892),
	(23, 'debit', 1.00, '2024-06-15 18:36:47.647880', 1234567890),
	(24, 'credit', 1.00, '2024-06-15 18:37:03.953509', 1234567890),
	(25, 'debit', 1.00, '2024-06-15 18:40:39.028756', 1234567890),
	(26, 'debit', 1.00, '2024-06-16 05:23:06.736080', 1234567892),
	(27, 'debit', 1.00, '2024-06-16 08:44:57.364631', 1234567890),
	(28, 'debit', 1.00, '2024-06-16 08:50:47.148566', 1234567890),
	(29, 'debit', 1.00, '2024-06-16 08:51:48.893571', 1234567890),
	(30, 'credit', 1.00, '2024-06-16 08:56:23.875964', 1234567890),
	(31, 'debit', 1.00, '2024-06-16 08:57:55.742459', 1234567890),
	(32, 'debit', 1.00, '2024-06-16 09:01:57.407338', 1234567890),
	(33, 'debit', 1.00, '2024-06-16 09:02:59.588524', 1234567890),
	(34, 'debit', 1.00, '2024-06-16 09:04:10.513129', 1234567890),
	(35, 'debit', 585.00, '2024-06-16 12:37:20.222174', 8602408113),
	(36, 'credit', 12345.00, '2024-06-16 12:38:00.710167', 8602408113);

-- Dumping structure for table ourbank.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ourbank.django_admin_log: ~0 rows (approximately)
DELETE FROM `django_admin_log`;

-- Dumping structure for table ourbank.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ourbank.django_content_type: ~8 rows (approximately)
DELETE FROM `django_content_type`;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(7, 'banking', 'client'),
	(8, 'banking', 'transaction'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session');

-- Dumping structure for table ourbank.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ourbank.django_migrations: ~19 rows (approximately)
DELETE FROM `django_migrations`;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2024-06-15 17:16:25.474971'),
	(2, 'auth', '0001_initial', '2024-06-15 17:16:26.539813'),
	(3, 'admin', '0001_initial', '2024-06-15 17:16:26.768608'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2024-06-15 17:16:26.779683'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-15 17:16:26.794056'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2024-06-15 17:16:26.922789'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2024-06-15 17:16:27.054175'),
	(8, 'auth', '0003_alter_user_email_max_length', '2024-06-15 17:16:27.093291'),
	(9, 'auth', '0004_alter_user_username_opts', '2024-06-15 17:16:27.102253'),
	(10, 'auth', '0005_alter_user_last_login_null', '2024-06-15 17:16:27.201079'),
	(11, 'auth', '0006_require_contenttypes_0002', '2024-06-15 17:16:27.205727'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2024-06-15 17:16:27.216222'),
	(13, 'auth', '0008_alter_user_username_max_length', '2024-06-15 17:16:27.372840'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2024-06-15 17:16:27.485749'),
	(15, 'auth', '0010_alter_group_name_max_length', '2024-06-15 17:16:27.519134'),
	(16, 'auth', '0011_update_proxy_permissions', '2024-06-15 17:16:27.532395'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2024-06-15 17:16:27.653260'),
	(18, 'banking', '0001_initial', '2024-06-15 17:16:27.800731'),
	(19, 'sessions', '0001_initial', '2024-06-15 17:16:27.869417');

-- Dumping structure for table ourbank.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ourbank.django_session: ~0 rows (approximately)
DELETE FROM `django_session`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
