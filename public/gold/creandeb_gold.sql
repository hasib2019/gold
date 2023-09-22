-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 10, 2023 at 03:07 PM
-- Server version: 10.5.20-MariaDB-cll-lve
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `creandeb_gold`
--

-- --------------------------------------------------------

--
-- Table structure for table `alart_tables`
--

CREATE TABLE `alart_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `gold_weight` varchar(255) NOT NULL,
  `app_price` double(8,2) NOT NULL,
  `offer_price` double(8,2) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Mobile_no` varchar(255) NOT NULL,
  `buy_date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alart_tables`
--

INSERT INTO `alart_tables` (`id`, `gold_weight`, `app_price`, `offer_price`, `Name`, `Mobile_no`, `buy_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'gold', 1200.00, 1100.00, 'Hasibuzzaman', '01618356180', '2023-07-27', 1, '2023-07-29 00:16:48', '2023-07-29 00:16:48'),
(2, 'gold', 1200.00, 1100.00, 'Hasibuzzaman', '01618356180', '2023-07-27', 1, '2023-07-29 02:53:54', '2023-07-29 02:53:54'),
(3, 'gold', 1200.00, 1100.00, 'Hasibuzzaman', '01618356180', '2023-07-27', 1, '2023-08-04 10:58:45', '2023-08-04 10:58:45'),
(4, '0', 1200.00, 1100.00, 'Hasibuzzaman', '01618356180', '2023-07-27', 1, '2023-08-04 19:33:45', '2023-08-04 19:33:45'),
(5, 'gold', 1200.00, 1100.00, 'Hasibuzzaman', '01618356180', '2023-07-27', 1, '2023-08-04 19:34:09', '2023-08-04 19:34:09'),
(6, 'GOLD OZ', 1929.30, 1930.00, 'Sjsk', '019654823', '2023-08-09', 1, '2023-08-08 22:46:33', '2023-08-08 22:46:33');

-- --------------------------------------------------------

--
-- Table structure for table `buys`
--

CREATE TABLE `buys` (
  `id` int(10) UNSIGNED NOT NULL,
  `buy_date` date NOT NULL,
  `gold_karat` varchar(255) NOT NULL,
  `weight` double(8,2) NOT NULL,
  `price` double(8,2) NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `voucher_no` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exc_money_rates`
--

CREATE TABLE `exc_money_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `usd` int(11) NOT NULL,
  `exc_money` varchar(255) NOT NULL,
  `exc_rate` double(8,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exc_money_rates`
--

INSERT INTO `exc_money_rates` (`id`, `usd`, `exc_money`, `exc_rate`, `created_at`, `updated_at`) VALUES
(1, 1, 'AED', 3.674, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gold_rates`
--

CREATE TABLE `gold_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `metal` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `exchange` varchar(255) NOT NULL,
  `prev_close_price` double(8,2) NOT NULL,
  `open_price` double(8,2) NOT NULL,
  `low_price` double(8,2) NOT NULL,
  `high_price` double(8,2) NOT NULL,
  `open_time` date NOT NULL,
  `price` double(8,2) NOT NULL,
  `ch` double(8,2) NOT NULL,
  `chp` double(8,2) NOT NULL,
  `ask` double(8,2) NOT NULL,
  `bid` double(8,2) NOT NULL,
  `price_gram_24k` double(8,2) NOT NULL,
  `price_gram_22k` double(8,2) NOT NULL,
  `price_gram_21k` double(8,2) NOT NULL,
  `price_gram_20k` double(8,2) NOT NULL,
  `price_gram_18k` double(8,2) NOT NULL,
  `price_gram_16k` double(8,2) NOT NULL,
  `price_gram_14k` double(8,2) NOT NULL,
  `price_gram_10k` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gold_weights`
--

CREATE TABLE `gold_weights` (
  `id` int(10) UNSIGNED NOT NULL,
  `weight_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `grams_weight` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karat_gold`
--

CREATE TABLE `karat_gold` (
  `id` int(10) UNSIGNED NOT NULL,
  `karat` varchar(255) NOT NULL,
  `fineness` varchar(255) NOT NULL,
  `percentage` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karat_rates`
--

CREATE TABLE `karat_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `open_time` date NOT NULL,
  `weight` int(11) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `exchange` varchar(255) NOT NULL,
  `prev_close_price` double(8,2) NOT NULL,
  `price` double(8,2) NOT NULL,
  `today_close_price` double(8,2) NOT NULL,
  `price_gram_24k` double(8,2) NOT NULL,
  `price_gram_22k` double(8,2) NOT NULL,
  `price_gram_21k` double(8,2) NOT NULL,
  `price_gram_20k` double(8,2) NOT NULL,
  `price_gram_18k` double(8,2) NOT NULL,
  `price_gram_16k` double(8,2) NOT NULL,
  `price_gram_14k` double(8,2) NOT NULL,
  `price_gram_10k` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_rate_data`
--

CREATE TABLE `live_rate_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `bid_sell` decimal(10,2) DEFAULT NULL,
  `ask_buy` decimal(10,2) DEFAULT NULL,
  `low` decimal(10,2) DEFAULT NULL,
  `high` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `live_rate_data`
--

INSERT INTO `live_rate_data` (`id`, `type`, `bid_sell`, `ask_buy`, `low`, `high`, `created_at`, `updated_at`) VALUES
(1, 'GOLD OZ', 1916.76, 1917.76, 1918.94, 1917.16, '2023-08-23 19:00:31', '2023-08-24 19:00:31'),
(2, 'GOLD', 2267.50, 2267.50, 2268.90, 2266.79, '2023-08-23 19:00:31', '2023-08-24 19:00:31'),
(3, 'GOLD PURE 92', 210.62, 210.62, 210.75, 210.55, '2023-08-23 19:00:31', '2023-08-24 19:00:31'),
(4, 'GOLD 9999', 226.40, 229.35, 229.49, 229.28, '2023-08-23 19:00:31', '2023-08-24 19:00:31'),
(5, 'TEN TOLA BAR', 25898.98, 26587.18, 26603.42, 26578.92, '2023-08-23 19:00:31', '2023-08-24 19:00:31'),
(6, 'KILO BAR 995', 224561.97, 225737.28, 225875.97, 225666.76, '2023-08-23 19:00:31', '2023-08-24 19:00:31'),
(7, 'KILO BAR 9999', 220943.47, 226848.96, 226988.33, 226778.09, '2023-08-23 19:00:31', '2023-08-24 19:00:31'),
(8, 'GOLD OZ', 1916.76, 1917.76, 1918.94, 1917.16, '2023-08-24 19:01:06', '2023-08-24 19:01:06'),
(9, 'GOLD', 2267.50, 2267.50, 2268.90, 2266.79, '2023-08-24 19:01:06', '2023-08-24 19:01:06'),
(10, 'GOLD PURE 92', 210.62, 210.62, 210.75, 210.55, '2023-08-24 19:01:06', '2023-08-24 19:01:06'),
(11, 'GOLD 9999', 226.40, 229.35, 229.49, 229.28, '2023-08-24 19:01:06', '2023-08-24 19:01:06'),
(12, 'TEN TOLA BAR', 25898.98, 26587.18, 26603.42, 26578.92, '2023-08-24 19:01:06', '2023-08-24 19:01:06'),
(13, 'KILO BAR 995', 224561.97, 225737.28, 225875.97, 225666.76, '2023-08-24 19:01:06', '2023-08-24 19:01:06'),
(14, 'KILO BAR 9999', 220943.47, 226848.96, 226988.33, 226778.09, '2023-08-24 19:01:06', '2023-08-24 19:01:06'),
(15, 'GOLD OZ', 1916.76, 1917.76, 1918.94, 1917.16, '2023-08-24 19:01:08', '2023-08-24 19:01:08'),
(16, 'GOLD', 2267.50, 2267.50, 2268.90, 2266.79, '2023-08-24 19:01:08', '2023-08-24 19:01:08'),
(17, 'GOLD PURE 92', 210.62, 210.62, 210.75, 210.55, '2023-08-24 19:01:08', '2023-08-24 19:01:08'),
(18, 'GOLD 9999', 226.40, 229.35, 229.49, 229.28, '2023-08-24 19:01:08', '2023-08-24 19:01:08'),
(19, 'TEN TOLA BAR', 25898.98, 26587.18, 26603.42, 26578.92, '2023-08-24 19:01:08', '2023-08-24 19:01:08'),
(20, 'KILO BAR 995', 224561.97, 225737.28, 225875.97, 225666.76, '2023-08-24 19:01:08', '2023-08-24 19:01:08'),
(21, 'KILO BAR 9999', 220943.47, 226848.96, 226988.33, 226778.09, '2023-08-24 19:01:08', '2023-08-24 19:01:08'),
(22, 'GOLD OZ', 1916.76, 1917.76, 1918.94, 1917.16, '2023-08-24 19:01:10', '2023-08-24 19:01:10'),
(23, 'GOLD', 2267.50, 2267.50, 2268.90, 2266.79, '2023-08-24 19:01:10', '2023-08-24 19:01:10'),
(24, 'GOLD PURE 92', 210.62, 210.62, 210.75, 210.55, '2023-08-24 19:01:10', '2023-08-24 19:01:10'),
(25, 'GOLD 9999', 226.40, 229.35, 229.49, 229.28, '2023-08-24 19:01:10', '2023-08-24 19:01:10'),
(26, 'TEN TOLA BAR', 25898.98, 26587.18, 26603.42, 26578.92, '2023-08-24 19:01:10', '2023-08-24 19:01:10'),
(27, 'KILO BAR 995', 224561.97, 225737.28, 225875.97, 225666.76, '2023-08-24 19:01:10', '2023-08-24 19:01:10'),
(28, 'KILO BAR 9999', 220943.47, 226848.96, 226988.33, 226778.09, '2023-08-24 19:01:10', '2023-08-24 19:01:10'),
(29, 'GOLD OZ', 1916.76, 1917.76, 1918.94, 1917.16, '2023-08-24 19:01:11', '2023-08-24 19:01:11'),
(30, 'GOLD', 2267.50, 2267.50, 2268.90, 2266.79, '2023-08-24 19:01:11', '2023-08-24 19:01:11'),
(31, 'GOLD PURE 92', 210.62, 210.62, 210.75, 210.55, '2023-08-24 19:01:11', '2023-08-24 19:01:11'),
(32, 'GOLD 9999', 226.40, 229.35, 229.49, 229.28, '2023-08-24 19:01:11', '2023-08-24 19:01:11'),
(33, 'TEN TOLA BAR', 25898.98, 26587.18, 26603.42, 26578.92, '2023-08-24 19:01:11', '2023-08-24 19:01:11'),
(34, 'KILO BAR 995', 224561.97, 225737.28, 225875.97, 225666.76, '2023-08-24 19:01:11', '2023-08-24 19:01:11'),
(35, 'KILO BAR 9999', 220943.47, 226848.96, 226988.33, 226778.09, '2023-08-24 19:01:11', '2023-08-24 19:01:11'),
(36, 'GOLD OZ', 1916.76, 1917.76, 1918.94, 1917.16, '2023-08-24 19:01:12', '2023-08-24 19:01:12'),
(37, 'GOLD', 2267.50, 2267.50, 2268.90, 2266.79, '2023-08-24 19:01:12', '2023-08-24 19:01:12'),
(38, 'GOLD PURE 92', 210.62, 210.62, 210.75, 210.55, '2023-08-24 19:01:12', '2023-08-24 19:01:12'),
(39, 'GOLD 9999', 226.40, 229.35, 229.49, 229.28, '2023-08-24 19:01:12', '2023-08-24 19:01:12'),
(40, 'TEN TOLA BAR', 25898.98, 26587.18, 26603.42, 26578.92, '2023-08-24 19:01:12', '2023-08-24 19:01:12'),
(41, 'KILO BAR 995', 224561.97, 225737.28, 225875.97, 225666.76, '2023-08-24 19:01:12', '2023-08-24 19:01:12'),
(42, 'KILO BAR 9999', 220943.47, 226848.96, 226988.33, 226778.09, '2023-08-24 19:01:12', '2023-08-24 19:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `page_link` varchar(255) NOT NULL,
  `is_root` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `icon_id` int(11) NOT NULL,
  `display_srl` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_05_17_181447_create_roles_table', 1),
(6, '2022_05_17_181456_create_user_roles_table', 1),
(7, '2023_07_08_210436_create_exc_money_rates_table', 2),
(8, '2023_07_08_210507_create_gold_rates_table', 2),
(9, '2023_07_08_210526_create_gold_weights_table', 2),
(10, '2023_07_08_210552_create_karat_gold_table', 2),
(11, '2023_07_08_210612_create_karat_rates_table', 2),
(12, '2023_07_08_210628_create_menus_table', 2),
(13, '2023_07_08_210652_create_rate_alerts_table', 2),
(14, '2023_07_08_210710_create_sells_table', 2),
(15, '2023_07_08_210724_create_buys_table', 2),
(17, '2023_07_27_184403_create_alart_tables_table', 3),
(18, '2023_07_28_192403_create_news_alarts_table', 3),
(19, '2023_07_28_213328_create_products_table', 4),
(20, '2023_07_28_220418_create_orders_table', 5),
(21, '2023_07_08_210743_create_settings_table', 6),
(23, '2023_08_24_200258_create_live_rate_data_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `news_alarts`
--

CREATE TABLE `news_alarts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_alarts`
--

INSERT INTO `news_alarts` (`id`, `title`, `description`, `date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Title 1', '(Kitco News) - Binance, the largest cryptocurrency exchange in the world, requested a dismissal of the lawsuit filed by the Commodity Futures Trading Commission (CFTC), saying the regulator lacks jurisdiction.\r\n\r\nAccording to the Thursday court filing, attorneys for Binance and its CEO Changpeng “CZ” Zhao said the CFTC exceeded its regulatory authority and engaged in regulatory overreach when it filed the lawsuit in March alleging the exchange broke U.S. trading and derivatives rules.\r\n\r\nThe lawsuit included allegations that the company offered unregistered derivatives products in the U.S. – including cryptocurrency trading services, futures and options products – lacked a reliable Know Your Customer (KYC) or Anti-Money Laundering (AML) program and failed to register as a futures commissions merchant, designated contract market or swap execution facility.\r\n\r\n“In this case, the CFTC seeks to regulate foreign individuals and corporations that reside and operate outside the United States – outstripping the limits of its statutory authority and treading on deep-rooted principles of comity with foreign sovereigns,” the filing states. “In addition to stretching the territorial reach of its jurisdiction, the CFTC further resorts to a hodge-podge of legal theories that rely on competing and inconsistent registration categories, assert a novel and unsound claim under a regulatory provision that has never been used before, and rely on allegations that are irrelevant under the agency’s own guidance.”\r\n\r\nBased on these statements, Binance said “The Court should reject the CFTC’s attempt at regulation by enforcement and return the agency to shore.”\r\n\r\nThe filing goes on to detail how', '2023-07-29', 1, NULL, NULL),
(2, 'Title 2', 'world, requested a dismissal of the lawsuit filed by the Commodity Futures Trading Commission (CFTC), saying the regulator lacks jurisdiction.\r\n\r\nAccording to the Thursday court filing, attorneys for Binance and its CEO Changpeng “CZ” Zhao said the CFTC exceeded its regulatory authority and engaged in regulatory overreach when it filed the lawsuit in March alleging the exchange broke U.S. trading and derivatives rules.\r\n\r\nThe lawsuit included allegations that the company offered unregistered derivatives products in the U.S. – including cryptocurrency trading services, futures and options products – lacked a reliable Know Your Customer (KYC) or Anti-Money Laundering (AML) program and failed to register as a futures commissions merchant, designated contract market or swap execution facility.\r\n\r\n“In this case, the CFTC seeks to regulate foreign individuals and corporations that reside and operate outside the United States – outstripping the limits of its statutory authority and treading on deep-rooted principles of comity with foreign sovereigns,” the filing states. “In addition to stretching the territorial reach of its jurisdiction, the CFTC further resorts to a hodge-podge of legal theories that rely on competing and inconsistent registration cat', '2023-07-29', 1, NULL, NULL),
(3, 'Title 3', '(Kitco News) - Binance, the largest cryptocurrency exchange in the world, requested a dismissal of the lawsuit filed by the Commodity Futures Trading Commission (CFTC), saying the regulator lacks jurisdiction.\r\n\r\nAccording to the Thursday court filing, attorneys for Binance and its CEO Changpeng “CZ” Zhao said the CFTC exceeded its regulatory authority and engaged in regulatory overreach when it filed the lawsuit in March alleging the exchange broke U.S. trading and derivatives rules.\r\n\r\nThe lawsuit included allegations that the company offered unregistered derivatives products in the U.S. – including cryptocurrency trading services, futures and options products – lacked a reliable Know Your Customer (KYC) or Anti-Money Laundering (AML) program and failed to register as a futures commissions merchant, designated contract market or swap execution facility.\r\n\r\n“In this case, the CFTC seeks to regulate foreign individuals and corporations that reside and operate outside the United States – outstripping the limits of its statutory authority and treading on deep-rooted principles of comity with foreign sovereigns,” the filing states. “In addition to stretching the territorial reach of its jurisdiction, the CFTC further resorts to a hodge-podge of legal theories that rely on competing and inconsistent registration categories, assert a novel and unsound claim under a regulatory provision that has never been used before, and rely on allegations that are irrelevant under the agency’s own guidance.”\r\n\r\nBased on these statements, Binance said “The Court should reject the CFTC’s attempt at regulation by enforcement and return the agency to shore.”\r\n\r\nThe filing goes on to detail how', '2023-07-29', 1, NULL, NULL),
(4, 'Title 4', 'world, requested a dismissal of the lawsuit filed by the Commodity Futures Trading Commission (CFTC), saying the regulator lacks jurisdiction.\r\n\r\nAccording to the Thursday court filing, attorneys for Binance and its CEO Changpeng “CZ” Zhao said the CFTC exceeded its regulatory authority and engaged in regulatory overreach when it filed the lawsuit in March alleging the exchange broke U.S. trading and derivatives rules.\r\n\r\nThe lawsuit included allegations that the company offered unregistered derivatives products in the U.S. – including cryptocurrency trading services, futures and options products – lacked a reliable Know Your Customer (KYC) or Anti-Money Laundering (AML) program and failed to register as a futures commissions merchant, designated contract market or swap execution facility.\r\n\r\n“In this case, the CFTC seeks to regulate foreign individuals and corporations that reside and operate outside the United States – outstripping the limits of its statutory authority and treading on deep-rooted principles of comity with foreign sovereigns,” the filing states. “In addition to stretching the territorial reach of its jurisdiction, the CFTC further resorts to a hodge-podge of legal theories that rely on competing and inconsistent registration cat', '2023-07-29', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'pending',
  `order_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `status`, `order_date`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'pending', '2023-07-27', '2023-07-29 02:52:41', '2023-07-29 02:52:41'),
(2, 2, 2, 'pending', '2023-07-27', '2023-08-02 20:30:37', '2023-08-02 20:30:37'),
(3, 2, 1, 'pending', '2023-07-27', '2023-08-04 18:12:52', '2023-08-04 18:12:52'),
(4, 3, 1, 'pending', '2023-07-27', '2023-08-04 18:13:09', '2023-08-04 18:13:09'),
(7, 8, 1, 'pending', '2023-08-09', '2023-08-08 22:44:49', '2023-08-08 22:44:49'),
(8, 7, 4, 'pending', '2023-07-27', '2023-08-11 09:54:23', '2023-08-11 09:54:23'),
(9, 7, 4, 'pending', '2023-07-27', '2023-08-11 09:54:26', '2023-08-11 09:54:26'),
(10, 7, 4, 'pending', '2023-07-27', '2023-08-11 09:54:28', '2023-08-11 09:54:28'),
(11, 7, 4, 'pending', '2023-07-27', '2023-08-11 09:54:31', '2023-08-11 09:54:31'),
(12, 9, 1, 'pending', '2023-08-12', '2023-08-12 16:55:47', '2023-08-12 16:55:47'),
(13, 9, 1, 'pending', '2023-08-27', '2023-08-27 06:38:02', '2023-08-27 06:38:02'),
(14, 9, 3, 'pending', '2023-08-27', '2023-08-27 06:38:06', '2023-08-27 06:38:06'),
(15, 9, 2, 'pending', '2023-09-04', '2023-09-04 07:16:56', '2023-09-04 07:16:56'),
(16, 9, 5, 'pending', '2023-09-05', '2023-09-05 16:54:34', '2023-09-05 16:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'hydra-api-token', 'e154bae390b32641f5bdef36d9d43880afcf8c9b50c8ac2701624d3332c9b172', '[\"admin\"]', NULL, '2023-07-09 23:09:41', '2023-07-09 23:09:41'),
(2, 'App\\Models\\User', 2, 'hydra-api-token', '37c90749cfef18c8ced94cdb971c4a08f94f6cb5eb5c2349bb0140d99ead9e76', '[\"user\"]', NULL, '2023-07-09 23:12:17', '2023-07-09 23:12:17'),
(3, 'App\\Models\\User', 2, 'hydra-api-token', '6154f97eacfe52ec5f8b6e8a0bac2c4b5e9ac6a9513c10d2cb75a93dfc637df1', '[\"user\"]', NULL, '2023-07-09 23:20:17', '2023-07-09 23:20:17'),
(4, 'App\\Models\\User', 3, 'hydra-api-token', 'a44ff4e442301e6d9020bd015021ced6c9fdab2be4e435b56235720b2e83c9df', '[\"user\"]', '2023-07-10 22:06:35', '2023-07-10 22:04:39', '2023-07-10 22:06:35'),
(5, 'App\\Models\\User', 2, 'hydra-api-token', '9cf655f6e12c483ca8df05c43d899d0155d7bd2adfa0b89a180281088333bb04', '[\"user\"]', '2023-08-02 20:30:37', '2023-07-29 02:52:05', '2023-08-02 20:30:37'),
(6, 'App\\Models\\User', 3, 'hydra-api-token', 'f9970455914c5de283c311fff11c488a311bcb293beeaf761532cdf5619ec32e', '[\"user\"]', NULL, '2023-07-29 17:55:42', '2023-07-29 17:55:42'),
(7, 'App\\Models\\User', 2, 'hydra-api-token', 'd21a62d025d9634d241809f098e345508e4766edfcd475afd0b191eb4589cf4c', '[\"user\"]', NULL, '2023-08-02 19:44:43', '2023-08-02 19:44:43'),
(8, 'App\\Models\\User', 2, 'hydra-api-token', 'e57e260f518b352177f08c5f363ce144daac57705ec2ed7abac60645dbdaf9ca', '[\"user\"]', NULL, '2023-08-02 20:33:30', '2023-08-02 20:33:30'),
(9, 'App\\Models\\User', 2, 'hydra-api-token', '7e6d4af2547b0b17cd82e1c8a120106af594303b50f1f368e7d995e2a5408f87', '[\"user\"]', NULL, '2023-08-02 20:33:37', '2023-08-02 20:33:37'),
(10, 'App\\Models\\User', 2, 'hydra-api-token', 'e0451696a30e89d036fe2486132965443e5b87c89838576d50809b0611519c1f', '[\"user\"]', NULL, '2023-08-02 20:34:59', '2023-08-02 20:34:59'),
(11, 'App\\Models\\User', 2, 'hydra-api-token', '3e58d021f7f77c75c25d3d9c76a6dc8144437ec158c2d8634fbcfc604b2577cb', '[\"user\"]', NULL, '2023-08-02 21:11:07', '2023-08-02 21:11:07'),
(12, 'App\\Models\\User', 2, 'hydra-api-token', '86674acffad06cab9e5cd356b40ae310edd3b65f9044ff7341092f592b47bf97', '[\"user\"]', NULL, '2023-08-02 21:16:40', '2023-08-02 21:16:40'),
(13, 'App\\Models\\User', 2, 'hydra-api-token', '61e9b80d32a4cf9f91448ff5381403910984a331f113a23a93d9570b62ed7627', '[\"user\"]', NULL, '2023-08-02 21:16:54', '2023-08-02 21:16:54'),
(14, 'App\\Models\\User', 2, 'hydra-api-token', '5e5ab03b5499667f06d082cee2a8123102d50df022718ebdec7d44243ad98f61', '[\"user\"]', NULL, '2023-08-04 10:14:30', '2023-08-04 10:14:30'),
(15, 'App\\Models\\User', 2, 'hydra-api-token', 'a701115323bbbc664946403559d08359684eabeb12e7caa64bb7525343288fcc', '[\"user\"]', NULL, '2023-08-04 10:15:08', '2023-08-04 10:15:08'),
(16, 'App\\Models\\User', 2, 'hydra-api-token', 'a4daab681b56fb2bb8150de92bf3348cea40a5cbc9a0ea1f640c7ee8b45831d7', '[\"user\"]', '2023-08-08 22:31:14', '2023-08-04 18:12:38', '2023-08-08 22:31:14'),
(17, 'App\\Models\\User', 8, 'hydra-api-token', '8d56a60998fb117984961feb3ce764b1f350f46cef4f053ab73be454b38043e7', '[\"user\"]', '2023-08-08 22:34:25', '2023-08-08 22:28:05', '2023-08-08 22:34:25'),
(18, 'App\\Models\\User', 8, 'hydra-api-token', '45ca1a623e404c12e9ac1bf72ac166fe8f98744b17ab6d33498f811210e08781', '[\"user\"]', '2023-08-08 22:44:49', '2023-08-08 22:35:31', '2023-08-08 22:44:49'),
(19, 'App\\Models\\User', 7, 'hydra-api-token', 'dab37875dea089e3b773681d52161f31b231d49a5a9c6bc3f5840e504b647778', '[\"user\"]', '2023-08-11 09:54:38', '2023-08-11 09:53:45', '2023-08-11 09:54:38'),
(20, 'App\\Models\\User', 7, 'hydra-api-token', '9c0e5dffac22ffeb29cf5071e1501b6cd82bcb8400822c84594140a9e92ee924', '[\"user\"]', '2023-08-11 10:21:29', '2023-08-11 10:18:10', '2023-08-11 10:21:29'),
(21, 'App\\Models\\User', 9, 'hydra-api-token', '606377db3f581bd366087a5f2add574b4b059f885ecd7cc239c17fc0e1668b23', '[\"user\"]', '2023-08-12 16:55:47', '2023-08-12 16:55:40', '2023-08-12 16:55:47'),
(22, 'App\\Models\\User', 2, 'hydra-api-token', '307ec648d501222f12dfa35ac6e8282aa4e4c077007512184bd7d0f696c7759f', '[\"user\"]', '2023-08-15 20:15:45', '2023-08-15 19:58:17', '2023-08-15 20:15:45'),
(23, 'App\\Models\\User', 2, 'hydra-api-token', '4a7b8b238b25ac8480c961869c570a091730d757b792d62e2430489f6cd0162e', '[\"user\"]', NULL, '2023-08-15 19:59:17', '2023-08-15 19:59:17'),
(24, 'App\\Models\\User', 7, 'hydra-api-token', 'ac16ebc8d143557bb773a888172c8e7103e0363621c94072e3ca77815e3fdfb3', '[\"user\"]', '2023-08-15 22:18:52', '2023-08-15 21:42:56', '2023-08-15 22:18:52'),
(25, 'App\\Models\\User', 7, 'hydra-api-token', '900ec8c7cf876bf16e9d7b91b53a0232fae2e8a27d0197422b9b3e0f06efc46e', '[\"user\"]', '2023-08-15 22:22:14', '2023-08-15 22:22:13', '2023-08-15 22:22:14'),
(26, 'App\\Models\\User', 7, 'hydra-api-token', '3f80d35790ff4b2cdfb95a387b1d007cbc8db9b61ec47a464567cc217d9ea224', '[\"user\"]', '2023-08-15 22:25:27', '2023-08-15 22:25:25', '2023-08-15 22:25:27'),
(27, 'App\\Models\\User', 7, 'hydra-api-token', 'c5119fb3bcff61bba7654eb86565312cee63e9b68d3c7ea137c51d7fafa60f9a', '[\"user\"]', '2023-08-15 22:27:26', '2023-08-15 22:27:24', '2023-08-15 22:27:26'),
(28, 'App\\Models\\User', 7, 'hydra-api-token', 'bb54f2b3716f4feaa9affeb43b529450c15dbb3fe190f1ee2d05a5c60bb1ff1f', '[\"user\"]', '2023-08-15 22:29:04', '2023-08-15 22:29:02', '2023-08-15 22:29:04'),
(29, 'App\\Models\\User', 7, 'hydra-api-token', 'f163f37b9048e7f463c6999a9c645aff9e8b20781607b19e53a58018ee8be5b7', '[\"user\"]', '2023-08-15 22:30:01', '2023-08-15 22:30:00', '2023-08-15 22:30:01'),
(30, 'App\\Models\\User', 7, 'hydra-api-token', '94fad69dc0f3094660214810b1c38fb78f64656fd58ef306471bb0d2e4fdcbe2', '[\"user\"]', '2023-08-15 22:31:59', '2023-08-15 22:30:54', '2023-08-15 22:31:59'),
(31, 'App\\Models\\User', 7, 'hydra-api-token', 'd291bffb53adef6a80a9d1e6fc0169b84bf58820f8f8304c5d12be24a1099ec7', '[\"user\"]', '2023-08-15 22:32:05', '2023-08-15 22:32:04', '2023-08-15 22:32:05'),
(32, 'App\\Models\\User', 7, 'hydra-api-token', 'cb9220c582027fe80833f65be8ba221f3ce6c135f612dbce952cff4815abdba1', '[\"user\"]', '2023-08-15 22:32:36', '2023-08-15 22:32:35', '2023-08-15 22:32:36'),
(33, 'App\\Models\\User', 7, 'hydra-api-token', 'bac95480e8df5a0fbec6c5b3abf01980e803ff5c3288d0abd7f2011c9a9d086d', '[\"user\"]', '2023-08-15 22:33:57', '2023-08-15 22:33:55', '2023-08-15 22:33:57'),
(34, 'App\\Models\\User', 7, 'hydra-api-token', 'b5ad3a3830259f7930a877f4b8ad4bd8273efae78cd731ef7071a7bde35a851f', '[\"user\"]', '2023-08-15 22:41:49', '2023-08-15 22:41:47', '2023-08-15 22:41:49'),
(35, 'App\\Models\\User', 7, 'hydra-api-token', '85cb7e344ba8cb13cf70552c48d965d85f7cd5d8515b9ffeeb1a7db91e0b9883', '[\"user\"]', '2023-08-25 09:57:59', '2023-08-25 09:49:02', '2023-08-25 09:57:59'),
(36, 'App\\Models\\User', 7, 'hydra-api-token', 'bb2e4b2d27a7d6d2cdea11811d3901bf3ea52a29a74614b542ee565f78c9a446', '[\"user\"]', '2023-08-25 17:44:10', '2023-08-25 17:44:08', '2023-08-25 17:44:10'),
(37, 'App\\Models\\User', 7, 'hydra-api-token', '7ceb6c08e7ec503278e45384ea927f395be6553d7babd5766e586db31826b853', '[\"user\"]', '2023-08-25 18:15:56', '2023-08-25 18:15:55', '2023-08-25 18:15:56'),
(38, 'App\\Models\\User', 7, 'hydra-api-token', '956df40530eb5a0f72192878baf3b402d14890a072bfefee35202023822b1994', '[\"user\"]', '2023-08-25 18:17:20', '2023-08-25 18:17:19', '2023-08-25 18:17:20'),
(39, 'App\\Models\\User', 7, 'hydra-api-token', '6141be8d238ff270e9dff8a670fbbef7b288566ed7779441c2269397171a10f0', '[\"user\"]', '2023-08-25 18:17:45', '2023-08-25 18:17:44', '2023-08-25 18:17:45'),
(40, 'App\\Models\\User', 7, 'hydra-api-token', 'e26ad64c425f1215eba5f808495a46c680316750ad7adab895a6368f9ec54050', '[\"user\"]', '2023-08-25 18:19:39', '2023-08-25 18:19:38', '2023-08-25 18:19:39'),
(41, 'App\\Models\\User', 7, 'hydra-api-token', 'f1d8b9c08583dec6739e49efd4abf990f992d8ae16b7afbd3c8de6d7e16f1aa1', '[\"user\"]', '2023-08-25 18:21:05', '2023-08-25 18:20:50', '2023-08-25 18:21:05'),
(42, 'App\\Models\\User', 7, 'hydra-api-token', '682c06c284b2d94e94d5118c626079b2ff79dfdf0d05647308f3b5aefc3fb2bc', '[\"user\"]', '2023-08-25 21:29:53', '2023-08-25 21:27:23', '2023-08-25 21:29:53'),
(43, 'App\\Models\\User', 7, 'hydra-api-token', 'bde37957443b38218b17e743c47111ca8d0cb594ec33e633ea66f16d637ad767', '[\"user\"]', '2023-08-25 21:35:44', '2023-08-25 21:35:43', '2023-08-25 21:35:44'),
(44, 'App\\Models\\User', 7, 'hydra-api-token', 'ef3d6abeb451b10b19c60ed722e7b394836104da39c45f09d219bce0eae1bbd5', '[\"user\"]', '2023-08-25 21:46:03', '2023-08-25 21:37:56', '2023-08-25 21:46:03'),
(45, 'App\\Models\\User', 7, 'hydra-api-token', 'fe75bf544ced621a2e716d7dbf68eac07d29da75f95ed7e633dc15f9a641c709', '[\"user\"]', '2023-08-25 21:50:42', '2023-08-25 21:46:17', '2023-08-25 21:50:42'),
(46, 'App\\Models\\User', 7, 'hydra-api-token', '49d4a66d54ad42ccd46fbe8f2927af631bc1b9b5005c8f25e13e44185550a0d9', '[\"user\"]', '2023-08-25 22:03:48', '2023-08-25 22:03:27', '2023-08-25 22:03:48'),
(47, 'App\\Models\\User', 7, 'hydra-api-token', '491927cbf58f1863f133a02970faaee31330d0c860f3b3c8b3b0ec95c6f7e3ac', '[\"user\"]', '2023-08-25 22:05:00', '2023-08-25 22:04:27', '2023-08-25 22:05:00'),
(48, 'App\\Models\\User', 7, 'hydra-api-token', '9845b45122c1188fad4a3f053bec31986d8c4a1cfc5caf9a0d14544d34764086', '[\"user\"]', '2023-08-26 15:02:31', '2023-08-26 15:02:29', '2023-08-26 15:02:31'),
(49, 'App\\Models\\User', 9, 'hydra-api-token', '0370edbbe92ef423389e437f50dd9b47e2b617035fdba50d72ca491a6599b0e5', '[\"user\"]', '2023-08-26 15:46:08', '2023-08-26 15:44:56', '2023-08-26 15:46:08'),
(50, 'App\\Models\\User', 9, 'hydra-api-token', 'd9458d7039a90433c470d27f47f9926a0c4da1600c47a202196b4cfe586fa963', '[\"user\"]', '2023-08-27 06:38:18', '2023-08-27 06:37:48', '2023-08-27 06:38:18'),
(51, 'App\\Models\\User', 9, 'hydra-api-token', '68d1bf6b6d4cb416ea294376363d8c2c02a5559aeb1acf4ced0d9a6f7a16064d', '[\"user\"]', '2023-09-04 10:24:28', '2023-09-04 07:15:52', '2023-09-04 10:24:28'),
(52, 'App\\Models\\User', 9, 'hydra-api-token', 'bacfd4363fe07588dafd61f5c019d011cbfdf604c77cae626bd79d3fa81d1c79', '[\"user\"]', '2023-09-05 16:54:40', '2023-09-05 16:54:00', '2023-09-05 16:54:40'),
(53, 'App\\Models\\User', 7, 'hydra-api-token', '52fc3e6e06abc1acb7cc20edf2ce34a2a5ff0579185a180387183e0ee117ee17', '[\"user\"]', '2023-09-06 12:34:47', '2023-09-06 12:34:46', '2023-09-06 12:34:47'),
(54, 'App\\Models\\User', 7, 'hydra-api-token', 'ba91072a3ea300056eedcc009139287e327200da18f2c974ee5f1aec5dd14a1c', '[\"user\"]', '2023-09-06 22:29:52', '2023-09-06 22:29:50', '2023-09-06 22:29:52'),
(55, 'App\\Models\\User', 7, 'hydra-api-token', '7477a6b3a57844baf4853879b03dfe2af042d53ff7e32fa5b787b660838d6ea9', '[\"user\"]', '2023-09-06 22:53:37', '2023-09-06 22:53:35', '2023-09-06 22:53:37'),
(56, 'App\\Models\\User', 9, 'hydra-api-token', '9b4b8847972d30dce56f62f1547db712fc49cd8fed499eea5158ce8072fa2496', '[\"user\"]', '2023-09-07 05:32:48', '2023-09-07 05:32:46', '2023-09-07 05:32:48'),
(57, 'App\\Models\\User', 7, 'hydra-api-token', '2da5e672fb73b04b2feb44013e748721c71181a32f0c03515938fad1cf351b7c', '[\"user\"]', '2023-09-07 09:39:46', '2023-09-07 09:39:45', '2023-09-07 09:39:46');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `purity` varchar(255) NOT NULL,
  `shape` varchar(20) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `purity`, `shape`, `product_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kilo Bar', '999', 'Rectangle', 'https://www.gold.creativeitbari.com/gold/1.png', 1, NULL, NULL),
(2, 'TT Bar', '999', 'Rectangle', 'https://www.gold.creativeitbari.com/gold/2.png', 1, NULL, NULL),
(3, 'Investmant Bar', '999.9', 'Rectangle', 'https://www.gold.creativeitbari.com/gold/3.png', 1, NULL, NULL),
(4, 'Coins', '22K, 24K', 'Round', 'https://www.gold.creativeitbari.com/gold/4.png', 1, NULL, NULL),
(5, 'Jewellery', '18K, 21K', 'Neckless', 'https://www.gold.creativeitbari.com/gold/5.png', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rate_alerts`
--

CREATE TABLE `rate_alerts` (
  `id` int(10) UNSIGNED NOT NULL,
  `gold` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `purity` double(8,2) NOT NULL,
  `price` double(8,2) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', '2023-07-09 22:56:23', '2023-07-09 22:56:23'),
(2, 'User', 'user', '2023-07-09 22:56:23', '2023-07-09 22:56:23'),
(3, 'Customer', 'customer', '2023-07-09 22:56:23', '2023-07-09 22:56:23'),
(4, 'Editor', 'editor', '2023-07-09 22:56:23', '2023-07-09 22:56:23'),
(5, 'All', '*', '2023-07-09 22:56:23', '2023-07-09 22:56:23'),
(6, 'Super Admin', 'super-admin', '2023-07-09 22:56:23', '2023-07-09 22:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

CREATE TABLE `sells` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_date` date NOT NULL,
  `gold_karat` varchar(255) NOT NULL,
  `weight` double(8,2) NOT NULL,
  `price` double(8,2) NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `voucher_no` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `about` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `account_no` varchar(255) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `full_name`, `about`, `contact_no`, `address`, `email`, `bank_name`, `account_no`, `branch_name`, `created_at`, `updated_at`) VALUES
(1, 'Cristal Gold', 'Cristal Gold', 'Cristal Gold', '01618356180', 'Cristal Gold', 'gold@gold.com', 'Cristal Gold', '123456789012345', 'Cristal Gold', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@gmail.com', NULL, '$2y$10$fT7kRYricnCs0x0dbOIL9uZ0QgA6CVWT3GWq6GvgtDUpRbCw7i7U.', NULL, '2023-07-09 22:56:23', '2023-07-09 22:56:23'),
(2, 'Hasib', 'hasib.437.hu@gmail.com', NULL, '$2y$10$BEZcHSt/yYwPwQuoxbOZaup9MbW2uwZ5Iol3AGj94rNi/x/8q9tcu', NULL, '2023-07-09 23:10:07', '2023-07-09 23:10:07'),
(3, 'Hasib', 'hasib.437.hu1@gmail.com', NULL, '$2y$10$gzhhOxWGGvfDklQHmUj4hekqJWJyj7amymAT2CZZ3S7HuuwaMkcsi', NULL, '2023-07-10 22:04:13', '2023-07-10 22:04:13'),
(4, 'Hasib', 'hasib.123.hu@gmail.com', NULL, '$2y$10$jfg7WctaDPnHwMmKPEoPueTk1KUxpyrPMQnCwNnguWYgdDFpa2poy', NULL, '2023-08-01 20:50:53', '2023-08-01 20:50:53'),
(5, 'Hasib', 'hasib.1f23.hu@gmail.com', NULL, '$2y$10$m8By5qxS.UyphiTGeixUTOHvXPnL.w2BbpSHG1.LID8bvmyfHQfpO', NULL, '2023-08-02 20:31:58', '2023-08-02 20:31:58'),
(6, 'Hasib', 'hasib.437.hlu@gmail.com', NULL, '$2y$10$JshtrCLyrpmVQyt0vLHyZ.SM2YvPiSU4ZXruCS1GiF1gCONX46CQG', NULL, '2023-08-04 09:44:06', '2023-08-04 09:44:06'),
(7, 'Hasib A', 'hasib.9437.hu@gmail.com', NULL, '$2y$10$7WJSrkgK3TkIh9E8HfZdS.svTZbyB.XGIvtf61a9bvKo73OnZVvMG', NULL, '2023-08-08 08:36:04', '2023-08-25 21:46:39'),
(8, 'xyz', 'xyz@gmail.com', NULL, '$2y$10$Z0SIVctFX5D/ExALz1/HAuv7dXZz9OIoOTZA96l7n6VJvWxp9.iHC', NULL, '2023-08-08 22:25:02', '2023-08-08 22:25:02'),
(9, 'saifur', 'saifur1985bd@gmail.com', NULL, '$2y$10$rajRaDIWt7riPmq8ANqWm.mEMf/uMW1vkxfXsXuwiNrY98/VKXcvC', NULL, '2023-08-12 16:55:09', '2023-08-12 16:55:09'),
(10, 'mazhar122', 'mmazharuddin229@gmail.com', NULL, '$2y$10$sGsgXOeOKMwvXWYKmuARr.qQQqsNPFXZ4QlVmb/sr9nOih9.LesSW', NULL, '2023-08-29 17:25:04', '2023-08-29 17:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 3, 2, NULL, NULL),
(4, 4, 2, NULL, NULL),
(5, 5, 2, NULL, NULL),
(6, 6, 2, NULL, NULL),
(7, 7, 2, NULL, NULL),
(8, 8, 2, NULL, NULL),
(9, 9, 2, NULL, NULL),
(10, 10, 2, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alart_tables`
--
ALTER TABLE `alart_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buys`
--
ALTER TABLE `buys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exc_money_rates`
--
ALTER TABLE `exc_money_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gold_rates`
--
ALTER TABLE `gold_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gold_weights`
--
ALTER TABLE `gold_weights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karat_gold`
--
ALTER TABLE `karat_gold`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karat_rates`
--
ALTER TABLE `karat_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_rate_data`
--
ALTER TABLE `live_rate_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_alarts`
--
ALTER TABLE `news_alarts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate_alerts`
--
ALTER TABLE `rate_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_slug_index` (`slug`);

--
-- Indexes for table `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_roles_user_id_role_id_unique` (`user_id`,`role_id`),
  ADD KEY `user_roles_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alart_tables`
--
ALTER TABLE `alart_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `buys`
--
ALTER TABLE `buys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exc_money_rates`
--
ALTER TABLE `exc_money_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gold_rates`
--
ALTER TABLE `gold_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gold_weights`
--
ALTER TABLE `gold_weights`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karat_gold`
--
ALTER TABLE `karat_gold`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karat_rates`
--
ALTER TABLE `karat_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_rate_data`
--
ALTER TABLE `live_rate_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `news_alarts`
--
ALTER TABLE `news_alarts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rate_alerts`
--
ALTER TABLE `rate_alerts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sells`
--
ALTER TABLE `sells`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
