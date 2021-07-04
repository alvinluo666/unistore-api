-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 04, 2021 at 11:39 AM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unistore`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku_index` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `sku_index`, `quantity`, `created_at`, `updated_at`) VALUES
(5, 1, 1, '0_0_0', 12, '2021-06-25 01:03:48', '2021-06-25 21:37:19'),
(7, 1, 1, '0_1_0', 1, '2021-06-26 03:58:08', '2021-06-25 21:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

DROP TABLE IF EXISTS `customer_addresses`;
CREATE TABLE IF NOT EXISTS `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_index` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `user_id`, `customer_name`, `phone`, `city_index`, `city_text`, `detail`, `default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Alvin', '09767429188', '1_3', 'Mandalay Region,Mandalay', 'Lashio', 1, '2021-06-27 02:05:25', '2021-06-27 02:31:23'),
(2, 1, 'Thant', '098234234', '2_5', 'Shan State,Lashio', '123', 0, '2021-06-27 02:05:50', '2021-06-27 02:31:23'),
(3, 1, 'May', '12341', '1_4', 'Mandalay Region,Sagaing', '234', 0, '2021-06-27 02:06:23', '2021-06-27 02:31:23'),
(4, 1, '234', '234', '1_3', 'Mandalay Region,Mandalay', '234', 0, '2021-06-27 02:06:44', '2021-06-27 02:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `express_cities`
--

DROP TABLE IF EXISTS `express_cities`;
CREATE TABLE IF NOT EXISTS `express_cities` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `express_cities`
--

INSERT INTO `express_cities` (`id`, `pid`, `name`, `created_at`, `updated_at`) VALUES
(1, 0, 'Mandalay Region', '2021-06-26 07:47:34', NULL),
(2, 0, 'Shan State', '2021-06-26 07:47:34', NULL),
(3, 1, 'Mandalay', '2021-06-26 07:49:15', NULL),
(4, 1, 'Sagaing', '2021-06-26 07:49:15', NULL),
(5, 2, 'Lashio', '2021-06-26 07:49:44', NULL),
(6, 2, 'Muse', '2021-06-26 07:50:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `express_deliveries`
--

DROP TABLE IF EXISTS `express_deliveries`;
CREATE TABLE IF NOT EXISTS `express_deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_free` int(11) NOT NULL,
  `price_method` int(11) NOT NULL DEFAULT '0',
  `specify_conditions` int(11) NOT NULL DEFAULT '0',
  `default_piece` int(11) NOT NULL,
  `default_price` double(8,2) NOT NULL,
  `add_piece` int(11) NOT NULL,
  `add_price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `express_frees`
--

DROP TABLE IF EXISTS `express_frees`;
CREATE TABLE IF NOT EXISTS `express_frees` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `end_address` int(11) NOT NULL,
  `piece` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `express_shipping_methods`
--

DROP TABLE IF EXISTS `express_shipping_methods`;
CREATE TABLE IF NOT EXISTS `express_shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `end_address` int(11) NOT NULL,
  `default_piece` int(11) NOT NULL,
  `default_price` double(8,2) NOT NULL,
  `add_piece` int(11) NOT NULL,
  `add_price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_categories`
--

DROP TABLE IF EXISTS `leave_categories`;
CREATE TABLE IF NOT EXISTS `leave_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `middle_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_categories`
--

INSERT INTO `leave_categories` (`id`, `middle_id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 8, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(2, 5, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(3, 5, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(4, 10, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(5, 10, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(6, 3, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(7, 5, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(8, 5, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(9, 6, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(10, 9, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(11, 9, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(12, 2, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(13, 10, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(14, 2, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(15, 5, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(16, 7, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(17, 5, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(18, 5, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(19, 6, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(20, 7, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(21, 3, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(22, 8, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(23, 1, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(24, 10, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(25, 8, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(26, 4, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(27, 9, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(28, 8, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(29, 9, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(30, 4, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(31, 5, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(32, 9, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(33, 5, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(34, 9, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(35, 10, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(36, 2, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(37, 7, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(38, 1, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(39, 8, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(40, 9, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(41, 5, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(42, 3, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(43, 7, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(44, 4, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(45, 6, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(46, 4, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(47, 7, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(48, 9, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(49, 5, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38'),
(50, 10, 'အမျိုးအစား', 'test.png', '2021-06-15 08:16:38', '2021-06-15 08:16:38');

-- --------------------------------------------------------

--
-- Table structure for table `middle_categories`
--

DROP TABLE IF EXISTS `middle_categories`;
CREATE TABLE IF NOT EXISTS `middle_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `root_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `middle_categories`
--

INSERT INTO `middle_categories` (`id`, `root_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 2, 'အမျိုးအစား2', '2021-06-15 08:10:49', '2021-06-15 08:10:49'),
(2, 1, 'အမျိုးအစား1', '2021-06-15 08:10:49', '2021-06-15 08:10:49'),
(3, 2, 'အမျိုးအစား2', '2021-06-15 08:10:49', '2021-06-15 08:10:49'),
(4, 2, 'အမျိုးအစား2', '2021-06-15 08:10:49', '2021-06-15 08:10:49'),
(5, 1, 'အမျိုးအစား1', '2021-06-15 08:10:49', '2021-06-15 08:10:49'),
(6, 1, 'အမျိုးအစား1', '2021-06-15 08:10:49', '2021-06-15 08:10:49'),
(7, 2, 'အမျိုးအစား2', '2021-06-15 08:10:49', '2021-06-15 08:10:49'),
(8, 2, 'အမျိုးအစား2', '2021-06-15 08:10:49', '2021-06-15 08:10:49'),
(9, 1, 'အမျိုးအစား1', '2021-06-15 08:10:49', '2021-06-15 08:10:49'),
(10, 2, 'အမျိုးအစား2', '2021-06-15 08:10:49', '2021-06-15 08:10:49');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_06_13_134906_create_products_table', 1),
(5, '2021_06_13_135604_create_product_variants_table', 1),
(6, '2021_06_14_132142_create_root_categories_table', 1),
(7, '2021_06_14_132419_create_middle_categories_table', 1),
(8, '2021_06_14_133404_create_leave_categories_table', 1),
(9, '2021_06_14_134802_create_orders_table', 1),
(10, '2021_06_14_141406_create_order_details_table', 1),
(11, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(12, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(13, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(14, '2016_06_01_000004_create_oauth_clients_table', 2),
(15, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(16, '2021_06_19_121344_add_discount_column_to_products_table', 3),
(20, '2021_06_20_051917_create_products_detail_table', 4),
(21, '2021_06_20_054052_create_products_sku_table', 4),
(22, '2021_06_20_054148_create_products_sku_stock_table', 4),
(23, '2021_06_21_144658_add_phone_column_to_users_table', 5),
(24, '2021_06_25_033617_create_carts_table', 6),
(25, '2021_06_26_074021_create_express_cities_table', 7),
(27, '2021_06_26_104547_create_express_deliveries_table', 8),
(28, '2021_06_26_105109_create_express_shipping_methods_table', 8),
(29, '2021_06_26_113435_create_express_frees_table', 9),
(31, '2021_06_27_035245_create_customer_addresses_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('6435c4ab0852e7a90814ae44b062d80a5c809a424f6b3d3d60febe4f8462af7bfcb039aa516ce563', 1, 1, 'authToken', '[]', 0, '2021-06-21 08:21:36', '2021-06-21 08:21:36', '2022-06-21 14:51:36'),
('d2c592bb3c78da4766b105f74f868b62ccb260af7fdf3066ca3df9d5a05d280c88cbc65a2effdd8a', 1, 1, 'authToken', '[]', 0, '2021-06-21 08:22:15', '2021-06-21 08:22:15', '2022-06-21 14:52:15'),
('92eed6c47e412701e392d1921ec1a94caa9791131d427a22bff5428ac59bff8979a326169d311de3', 1, 1, 'authToken', '[]', 0, '2021-06-23 06:47:28', '2021-06-23 06:47:28', '2022-06-23 13:17:28'),
('fdadf70d29b75b7e032d8715538ca4da5aff3b82a11636c941b86411190ecc68ae0fa75955a2d101', 2, 1, 'authToken', '[]', 0, '2021-06-23 07:24:23', '2021-06-23 07:24:23', '2022-06-23 13:54:23'),
('29c94dabd8fdd108d98c0c74c24347fa2b38257f28a731b1796b81eb43686cab11f445b8ce297569', 1, 1, 'authToken', '[]', 0, '2021-06-23 07:31:30', '2021-06-23 07:31:30', '2022-06-23 14:01:30'),
('66ec01f52369ccb1c2d9527480f6b752605ed501c20795c50df14f2de7364436609d05e5caf71ecd', 1, 1, 'authToken', '[]', 0, '2021-06-23 07:34:15', '2021-06-23 07:34:15', '2022-06-23 14:04:15'),
('1e22d645da09c6194a2163afb3b32db23fae383e55eefffe1f626df8382881caef432061ec066cf1', 1, 1, 'authToken', '[]', 0, '2021-06-23 07:52:38', '2021-06-23 07:52:38', '2022-06-23 14:22:38'),
('859a7986b388ff0cd332c6585af86a157b54aff149e9178089dcaf7db8da147b1cbc7b5c86a87945', 1, 1, 'authToken', '[]', 0, '2021-06-23 07:54:15', '2021-06-23 07:54:15', '2022-06-23 14:24:15'),
('62bd146c636629e3b5cadee179b2abb0ee79d979ad919ac8f8fdc9add2121bb1d5dd8fcf7b6035b0', 1, 1, 'authToken', '[]', 0, '2021-06-23 07:58:48', '2021-06-23 07:58:48', '2022-06-23 14:28:48'),
('91ce33ea931963636cb1a3477219d191df2aeb6c0475092fe1c83ae30f440c89026ebb5ca9f7ff0d', 1, 1, 'authToken', '[]', 0, '2021-06-24 06:28:13', '2021-06-24 06:28:13', '2022-06-24 12:58:13');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'gBCwIuMh9GB549y7U31BkqrLRmEm5y0ko35dF4Hn', NULL, 'http://localhost', 1, 0, 0, '2021-06-15 07:57:41', '2021-06-15 07:57:41'),
(2, NULL, 'Laravel Password Grant Client', 'wz0RVHCanp4DyYzPBCYAU1y8o69piQuHbutb5ecC', 'users', 'http://localhost', 0, 1, 0, '2021-06-15 07:57:41', '2021-06-15 07:57:41');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-06-15 07:57:41', '2021-06-15 07:57:41');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` int(11) NOT NULL,
  `paid` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `variant` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulfilled` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `images` json DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  `service` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sold_count` int(11) NOT NULL DEFAULT '0',
  `view_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `images`, `price`, `category_id`, `service`, `sold_count`, `view_count`, `created_at`, `updated_at`, `discount`) VALUES
(1, 'Abbigail Ebert', NULL, '[\"https://picsum.photos/id/202/300/300\", \"https://picsum.photos/id/235/300/300\"]', 2853.00, 1, NULL, 0, 0, '2021-06-19 23:25:08', '2021-06-19 23:25:08', 100);

-- --------------------------------------------------------

--
-- Table structure for table `products_detail`
--

DROP TABLE IF EXISTS `products_detail`;
CREATE TABLE IF NOT EXISTS `products_detail` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `specifications` json NOT NULL,
  `spec_template` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_detail`
--

INSERT INTO `products_detail` (`id`, `product_id`, `description`, `specifications`, `spec_template`, `created_at`, `updated_at`) VALUES
(1, 1, 'This is my first product!', '[{\"group\": \"主体\", \"params\": [{\"k\": \"品牌\", \"v\": \"小米（MI）\", \"global\": true, \"searchable\": false}, {\"k\": \"型号\", \"v\": \"小米6\", \"global\": true, \"searchable\": false}, {\"k\": \"上市年份\", \"v\": 2017, \"unit\": \"年\", \"global\": true, \"numerical\": true, \"searchable\": false}]}, {\"group\": \"基本信息\", \"params\": [{\"k\": \"机身颜色\", \"global\": false, \"options\": [\"亮蓝色\", \"亮黑色\", \"陶瓷黑\"], \"searchable\": false}, {\"k\": \"机身重量（g）\", \"v\": 168, \"unit\": \"g\", \"global\": true, \"numerical\": true, \"searchable\": false}, {\"k\": \"机身材质工艺\", \"v\": null, \"global\": true, \"searchable\": true}]}, {\"group\": \"存储\", \"params\": [{\"k\": \"内存\", \"unit\": \"GB\", \"global\": false, \"options\": [\"4GB\", \"6GB\"], \"numerical\": false, \"searchable\": true}, {\"k\": \"机身存储\", \"unit\": \"GB\", \"global\": false, \"options\": [\"64GB\", \"128GB\"], \"numerical\": false, \"searchable\": true}]}]', '{\"内存\": [\"4GB\", \"6GB\"], \"机身存储\": [\"64GB\", \"128GB\"], \"机身颜色\": [\"亮蓝色\", \"亮黑色\", \"陶瓷黑\"]}', '2021-06-20 05:57:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_sku`
--

DROP TABLE IF EXISTS `products_sku`;
CREATE TABLE IF NOT EXISTS `products_sku` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '\r\n',
  `spu_id` int(11) NOT NULL COMMENT 'product_detail_id',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` json NOT NULL,
  `price` double(8,2) NOT NULL,
  `indexes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_spec` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_sku`
--

INSERT INTO `products_sku` (`id`, `spu_id`, `title`, `images`, `price`, `indexes`, `own_spec`, `created_at`, `updated_at`) VALUES
(1, 1, 'spec1', '[\"https://picsum.photos/id/237/200/200\"]', 120.00, '0_0_0', '{\"机身颜色\":\"亮蓝色\",\"内存\":\"4GB\",\"机身存储\":\"64GB\"}', '2021-06-20 12:05:38', NULL),
(2, 1, 'spec2', '[\"https://picsum.photos/id/238/200/200\"]', 150.00, '0_0_1', '{\"机身颜色\":\"亮蓝色\",\"内存\":\"4GB\",\"机身存储\":\"128GB\"}', '2021-06-20 12:05:38', NULL),
(3, 1, 'spec3', '[\"https://picsum.photos/id/239/200/200\"]', 180.00, '0_1_0', '{\"机身颜色\":\"亮蓝色\",\"内存\":\"6GB\",\"机身存储\":\"64GB\"}', '2021-06-20 12:10:57', NULL),
(4, 1, 'spec4', '[\"https://picsum.photos/id/240/200/200\"]', 200.00, '0_1_1', '{\"机身颜色\":\"亮蓝色\",\"内存\":\"6GB\",\"机身存储\":\"128GB\"}', '2021-06-20 12:10:57', NULL),
(5, 1, 'spec5', '[\"https://picsum.photos/id/241/200/200\"]', 210.00, '1_0_0', '{\"机身颜色\":\"亮黑色\",\"内存\":\"4GB\",\"机身存储\":\"64GB\"}', '2021-06-20 12:14:18', NULL),
(6, 1, 'spec6', '[\"https://picsum.photos/id/243/200/200\"]', 250.00, '1_0_1', '{\"机身颜色\":\"亮黑色\",\"内存\":\"4GB\",\"机身存储\":\"128GB\"}', '2021-06-20 12:14:18', NULL),
(7, 1, 'spec7', '[\"https://picsum.photos/id/244/200/200\"]', 300.00, '1_1_0', '{\"机身颜色\":\"亮黑色\",\"内存\":\"6GB\",\"机身存储\":\"64GB\"}', '2021-06-20 12:23:05', NULL),
(8, 1, 'spec8', '[\"https://picsum.photos/id/245/200/200\"]', 300.00, '1_1_1', '{\"机身颜色\":\"亮黑色\",\"内存\":\"6GB\",\"机身存储\":\"128GB\"}', '2021-06-20 12:16:34', NULL),
(9, 1, 'spec9', '[\"https://picsum.photos/id/246/200/200\"]', 310.00, '2_0_0', '{\"机身颜色\":\"陶瓷黑\",\"内存\":\"4GB\",\"机身存储\":\"64GB\"}', '2021-06-20 12:19:11', NULL),
(10, 1, 'spec 10', '[\"https://picsum.photos/id/247/200/200\"]', 300.00, '2_0_1', '{\"机身颜色\":\"陶瓷黑\",\"内存\":\"4GB\",\"机身存储\":\"128GB\"}', '2021-06-20 12:19:11', NULL),
(11, 1, 'spec 11', '[\"https://picsum.photos/id/248/200/200\"]', 310.00, '2_1_0', '{\"机身颜色\":\"陶瓷黑\",\"内存\":\"6GB\",\"机身存储\":\"64GB\"}', '2021-06-20 12:21:04', NULL),
(12, 1, 'spec 12', '[\"https://picsum.photos/id/250/200/200\"]', 350.00, '2_1_1', '{\"机身颜色\":\"陶瓷黑\",\"内存\":\"6GB\",\"机身存储\":\"128GB\"}', '2021-06-20 12:21:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_sku_stock`
--

DROP TABLE IF EXISTS `products_sku_stock`;
CREATE TABLE IF NOT EXISTS `products_sku_stock` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_sku_stock`
--

INSERT INTO `products_sku_stock` (`id`, `sku_id`, `stock`, `created_at`, `updated_at`) VALUES
(1, 1, 12, '2021-06-20 12:44:27', NULL),
(2, 2, 13, '2021-06-20 12:44:27', NULL),
(3, 3, 5, '2021-06-20 12:45:06', NULL),
(4, 4, 1, '2021-06-20 12:45:06', NULL),
(5, 5, 12, '2021-06-20 12:45:39', NULL),
(6, 6, 3, '2021-06-20 12:45:39', NULL),
(7, 7, 0, '2021-06-20 12:46:29', NULL),
(8, 8, 0, '2021-06-20 12:46:29', NULL),
(9, 9, 0, '2021-06-20 12:47:01', NULL),
(10, 10, 1, '2021-06-20 12:47:01', NULL),
(11, 11, 12, '2021-06-20 12:47:33', NULL),
(12, 12, 6, '2021-06-20 12:47:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
CREATE TABLE IF NOT EXISTS `product_variants` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `variant` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `root_categories`
--

DROP TABLE IF EXISTS `root_categories`;
CREATE TABLE IF NOT EXISTS `root_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `root_categories`
--

INSERT INTO `root_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'အဝတ်အထည်', '2021-06-15 14:29:52', NULL),
(2, 'အစားအသောက်', '2021-06-15 14:29:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `phone`) VALUES
(1, 'alvin', NULL, '$2y$10$iaYmNqsnWb3rxt6WgSCHLu6zHP7KPwQ/MpzJ3cgVbk7ShjXvy6MHO', NULL, '2021-06-21 08:21:36', '2021-06-21 08:21:36', '959767429188'),
(2, 'Alvin', NULL, '$2y$10$ubZY36a0DhuJwY8WaQ8urOYUVRlRWRt/fV461tOIjxAsGW3PO56vC', NULL, '2021-06-23 07:24:23', '2021-06-23 07:24:23', '959767429187');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
