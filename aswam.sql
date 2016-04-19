-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2016 at 11:00 AM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aswam`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(15) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'unique acct name',
  `category` varchar(30) NOT NULL COMMENT 'Clients, Suppliers, Cash, Assets, Loan, Share holders, Dept, Petty Cash, Payroll, Other',
  `category_id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL COMMENT 'INTERNAL (e.g payroll, assets, dep''t, etc) / EXTERNAL (e.g clients, suppliers, loan, bank, etc))',
  `contract_id` int(15) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `debit` double(15,2) NOT NULL DEFAULT '0.00' COMMENT 'Total Paid',
  `credit` double(15,2) NOT NULL DEFAULT '0.00' COMMENT 'Total Outstanding',
  `contact_person` varchar(50) NOT NULL COMMENT 'Accounting/Finance Officer',
  `contact_email` varchar(200) NOT NULL,
  `contact_phones` varchar(50) NOT NULL,
  `physical_address` varchar(200) NOT NULL,
  `postal_address` varchar(200) DEFAULT NULL,
  `billing_address` varchar(100) NOT NULL COMMENT 'Where to direct the invoices or payments',
  `billing_contact` varchar(50) NOT NULL COMMENT 'To whom to direct the invoices or payments',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ERP - accounts';

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `category`, `category_id`, `type`, `contract_id`, `description`, `status`, `debit`, `credit`, `contact_person`, `contact_email`, `contact_phones`, `physical_address`, `postal_address`, `billing_address`, `billing_contact`, `created_by`, `created_at`, `updated_at`, `updated_by`, `deleted`) VALUES
(1, 'Moses Wasswa', 'client', 2, '', NULL, '', 1, 0.00, 0.00, '', '', '256773224563', '', NULL, '', '', 0, '2015-12-28 12:37:51', '2015-12-29 17:14:47', 0, 0),
(2, 'RiL Investiments', 'client', 2, '', NULL, '', 1, 0.00, 0.00, '', '', '256773224234', 'Clement hill', NULL, '', '', 0, '2015-12-28 12:44:30', '2015-12-29 17:14:47', 0, 0),
(3, 'Lukwago Wilber', 'client', 2, '', NULL, '', 1, 0.00, 0.00, '', '', '256778909090', 'Bwaise', NULL, '', '', 0, '2015-12-28 12:47:48', '2015-12-29 17:14:47', 0, 0),
(4, 'Stanbic', '', 4, '', NULL, '', 1, 0.00, 0.00, '', '', '256772121731', 'Clement Hill', NULL, '', '', 0, '2015-12-28 13:13:59', '2015-12-28 10:13:59', 0, 0),
(5, 'Hima Cement', 'supplier', 3, '', NULL, '', 1, 0.00, 0.00, '', '', '256773224234', 'Fortportal', NULL, '', '', 0, '2015-12-28 14:03:36', '2015-12-28 11:03:36', 0, 0),
(6, 'Busingye Raymond', 'client', 2, '', NULL, '', 1, 0.00, 0.00, '', '', '2567732456456', 'Kyegegwa', NULL, '', '', 0, '2015-12-29 17:08:51', '2015-12-29 14:08:51', 0, 0),
(7, 'FG', 'client', 2, '', NULL, '', 1, 0.00, 0.00, '', '', '256773224234', 'Lugogo', NULL, '', '', 0, '2016-01-02 10:26:33', '2016-01-02 07:26:33', 0, 0),
(8, 'Jimmy Lutaaya', 'client', 2, '', NULL, '', 1, 0.00, 0.00, '', '', '256774256745', 'Luweero', NULL, '', '', 0, '2016-01-05 15:59:54', '2016-01-05 12:59:54', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `account_categories`
--

CREATE TABLE `account_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_person` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_phones` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account_categories`
--

INSERT INTO `account_categories` (`id`, `name`, `contact_person`, `description`, `contact_email`, `contact_phones`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 'Kisakye Henry', 'This is the cash account', '', '256773224563', 1, '2015-12-28 06:32:01', '2015-12-28 06:32:01'),
(2, 'Client', 'Stephen Mugerwa', 'This is a test description', '', '256773224234', 1, '2015-12-28 08:30:10', '2015-12-28 08:30:10'),
(3, 'Supplier', 'Moses Wasswa', 'This is a test description', '', '256778909090', 1, '2015-12-28 09:54:19', '2015-12-28 09:54:19'),
(4, 'Bank', 'Eva Nakamya', 'This is the bash account', '', '256774343434', 1, '2015-12-28 10:12:11', '2015-12-28 10:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `excerpt` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bio` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `bio`, `created_at`, `updated_at`) VALUES
(1, 'Moses wasswa', 'Laravel is really awesome', '2015-12-14 17:12:37', '2015-12-14 17:12:37'),
(2, 'Author Number 2', 'I agree, Laravel is really awesome', '2015-12-14 17:12:37', '2015-12-14 17:12:37');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `accountid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `contact` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `accountid`, `name`, `category`, `status`, `created_at`, `updated_at`, `contact`, `location`) VALUES
(1, 5, 'Moses Wasswa', 'acc_holder', 1, '2015-12-16 12:38:13', '2015-12-16 12:38:13', '256772121731', 'Kireka'),
(2, 7, 'Esther Ahimbisibwe', 'one_off', 1, '2015-12-16 12:40:23', '2015-12-16 12:40:23', '256772134546', 'Ntungamo');

-- --------------------------------------------------------

--
-- Table structure for table `costgroups`
--

CREATE TABLE `costgroups` (
  `id` int(10) UNSIGNED NOT NULL,
  `cgcode` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `costgroups`
--

INSERT INTO `costgroups` (`id`, `cgcode`, `name`, `created_at`, `updated_at`) VALUES
(1, 0, 'This is the first cost group', '2016-03-14 05:20:22', '2016-03-14 05:20:22'),
(2, 0, 'This is the second group', '2016-03-14 13:01:48', '2016-03-14 13:01:48'),
(3, 0, 'Drugs purchsed on 16 march 2016 by', '2016-03-16 13:00:06', '2016-03-16 13:00:06'),
(4, 0, 'This is anoter', '2016-03-28 04:10:31', '2016-03-28 04:10:31'),
(5, 0, 'This is anoter', '2016-03-28 04:10:31', '2016-03-28 04:10:31'),
(6, 0, 'This is anoter', '2016-03-28 04:10:31', '2016-03-28 04:10:31'),
(7, 0, 'This is another batch', '2016-03-28 04:11:45', '2016-03-28 04:11:45'),
(8, 0, 'This is another test cost group', '2016-04-01 03:05:48', '2016-04-01 03:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `costparameters`
--

CREATE TABLE `costparameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `costparameters`
--

INSERT INTO `costparameters` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'VAT', 'active', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Import Duty', 'active', '2016-03-02 08:52:21', '2016-03-02 08:52:21'),
(3, 'Transport', 'active', '2016-03-02 09:22:45', '2016-03-02 09:22:45'),
(4, 'Communication', 'active', '2016-03-07 18:50:41', '2016-03-07 18:50:41');

-- --------------------------------------------------------

--
-- Table structure for table `costs`
--

CREATE TABLE `costs` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_code` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `batch_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cost` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `margin` bigint(100) NOT NULL,
  `floor` bigint(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `costs`
--

INSERT INTO `costs` (`id`, `item_code`, `batch_no`, `cost`, `margin`, `floor`, `created_at`, `updated_at`, `status`) VALUES
(1, 'PLGP098', 'PLGP098-20160301-08:20:22', '166000', 1200, 167200, '2016-03-14 05:23:16', '2016-03-14 05:23:16', 'active'),
(2, 'PLGP158', 'PLGP158-20160301-08:20:22', '582500', 3000, 585500, '2016-03-14 05:23:16', '2016-03-14 05:23:16', 'active'),
(3, 'PLGP129', 'PLGP129-20160301-08:20:22', '334000', 1500, 335500, '2016-03-14 05:23:16', '2016-03-14 05:23:16', 'active'),
(4, 'PLGP130', 'PLGP130-20160301-08:20:22', '554500', 2000, 556500, '2016-03-14 05:23:16', '2016-03-14 05:23:16', 'active'),
(5, 'PLGP098', 'PLGP098-20160301-04:00:06', '110000', 1000, 111000, '2016-03-16 13:08:58', '2016-03-16 13:08:58', 'active'),
(6, 'PLGP158', 'PLGP158-20160301-04:00:06', '144000', 500, 144500, '2016-03-16 13:08:58', '2016-03-16 13:08:58', 'active'),
(7, 'PLGP129', 'PLGP129-20160301-04:00:06', '49100', 2000, 51100, '2016-03-16 13:08:58', '2016-03-16 13:08:58', 'active'),
(8, 'PLGP130', 'PLGP130-20160301-04:00:06', '290000', 1300, 291300, '2016-03-16 13:08:58', '2016-03-16 13:08:58', 'active'),
(9, 'PLGP027', 'PLGP027-20160401-06:05:48', '154100', 1000, 155100, '2016-04-01 03:17:00', '2016-04-01 03:17:00', 'active'),
(10, 'PLGP004', 'PLGP004-20160401-06:05:49', '155200', 2000, 157200, '2016-04-01 03:17:01', '2016-04-01 03:17:01', 'active'),
(11, 'PLGP022', 'PLGP022-20160401-06:05:49', '156300', 300, 156600, '2016-04-01 03:17:01', '2016-04-01 03:17:01', 'active'),
(12, 'PLGP164', 'PLGP164-20160401-06:05:49', '157400', 400, 157800, '2016-04-01 03:17:01', '2016-04-01 03:17:01', 'active'),
(13, 'PLGP035', 'PLGP035-20160401-06:05:49', '158500', 500, 159000, '2016-04-01 03:17:01', '2016-04-01 03:17:01', 'active'),
(14, 'PLGP165g', 'PLGP165g-20160401-06:05:49', '159600', 5000, 164600, '2016-04-01 03:17:01', '2016-04-01 03:17:01', 'active'),
(15, 'PLGP130', 'PLGP130-20160301-06:06:53', '619700', 50, 619750, '2016-04-01 03:17:01', '2016-04-01 03:17:01', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `inflow_receipts`
--

CREATE TABLE `inflow_receipts` (
  `id` int(15) NOT NULL COMMENT 'Revenue / Cash-Inflow',
  `account_id` int(15) NOT NULL,
  `description` varchar(200) NOT NULL,
  `paymt_mode` varchar(20) NOT NULL COMMENT 'cash, cheque, EFT, RTGS, bank draft',
  `cash` decimal(15,2) NOT NULL COMMENT 'total given by client',
  `amount_paid` decimal(15,2) NOT NULL COMMENT 'payment for pdt or service',
  `change` decimal(15,2) NOT NULL COMMENT 'balance to client',
  `balance_due` decimal(15,2) NOT NULL COMMENT 'amount left for client to pay',
  `currency` varchar(5) NOT NULL,
  `received_by` int(15) NOT NULL,
  `created_by` int(15) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(15) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `batch_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'part_of_PK',
  `cgid` int(11) NOT NULL,
  `item_code` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT 'pdt_code or srv_code',
  `expiry_date` date DEFAULT NULL,
  `purchase_date` datetime NOT NULL COMMENT 'As per purchase receipts',
  `qty_purchased` int(11) NOT NULL,
  `qty_in_store` int(11) NOT NULL,
  `warrantee` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'E.g 1yr or 6months',
  `guarantee` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'E.g 1yr or 6months',
  `purchased_by` int(6) NOT NULL,
  `po_id` int(11) NOT NULL COMMENT 'Purchase Order ID',
  `status` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '"Ready for Sell" or "Under Review/Pricing"',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='items in store';

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `batch_no`, `cgid`, `item_code`, `expiry_date`, `purchase_date`, `qty_purchased`, `qty_in_store`, `warrantee`, `guarantee`, `purchased_by`, `po_id`, `status`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'PLGP098-20160301-08:20:22', 1, 'PLGP098', '2016-03-02', '2016-03-01 00:00:00', 50, 20, NULL, NULL, 0, 0, 'ready_for_sale', '2016-03-14 05:20:22', '2016-04-01 03:33:24', 0),
(2, 'PLGP158-20160301-08:20:22', 1, 'PLGP158', '2016-03-02', '2016-03-01 00:00:00', 100, 80, NULL, NULL, 0, 0, 'ready_for_sale', '2016-03-14 05:20:22', '2016-03-14 05:25:26', 0),
(3, 'PLGP129-20160301-08:20:22', 1, 'PLGP129', '2016-03-02', '2016-03-01 00:00:00', 20, 15, NULL, NULL, 0, 0, 'ready_for_sale', '2016-03-14 05:20:22', '2016-03-14 05:25:27', 0),
(4, 'PLGP130-20160301-08:20:22', 1, 'PLGP130', '2016-03-02', '2016-03-01 00:00:00', 10, 4, NULL, NULL, 0, 0, 'ready_for_sale', '2016-03-14 05:20:22', '2016-03-14 05:25:27', 0),
(5, 'PLGP088-20160301-04:01:48', 2, 'PLGP088', '2016-03-02', '2016-03-01 00:00:00', 30, 30, NULL, NULL, 0, 0, 'under_review', '2016-03-14 13:01:48', '2016-03-14 13:01:48', 0),
(6, 'PLHC001-20160301-04:01:48', 2, 'PLHC001', '2016-03-02', '2016-03-01 00:00:00', 50, 50, NULL, NULL, 0, 0, 'under_review', '2016-03-14 13:01:48', '2016-03-14 13:01:48', 0),
(7, 'PLGP092-20160301-04:01:48', 2, 'PLGP092', '2016-03-02', '2016-03-01 00:00:00', 40, 40, NULL, NULL, 0, 0, 'under_review', '2016-03-14 13:01:48', '2016-03-14 13:01:48', 0),
(8, 'PLGP163-20160301-04:01:48', 2, 'PLGP163', '2016-03-02', '2016-03-01 00:00:00', 100, 100, NULL, NULL, 0, 0, 'under_review', '2016-03-14 13:01:48', '2016-03-14 13:01:48', 0),
(9, 'PLGP114-20160301-04:02:52', 2, 'PLGP114', '2016-03-02', '2016-03-01 00:00:00', 60, 60, NULL, NULL, 0, 0, 'under_review', '2016-03-14 13:02:52', '2016-03-14 13:02:52', 0),
(10, 'PLGP098-20160301-04:00:06', 3, 'PLGP098', '2016-03-02', '2016-03-01 00:00:00', 50, 40, NULL, NULL, 0, 0, 'ready_for_sale', '2016-03-16 13:00:06', '2016-03-16 13:14:32', 0),
(11, 'PLGP158-20160301-04:00:06', 3, 'PLGP158', '2016-03-02', '2016-03-01 00:00:00', 100, 80, NULL, NULL, 0, 0, 'ready_for_sale', '2016-03-16 13:00:06', '2016-03-16 13:14:32', 0),
(12, 'PLGP129-20160301-04:00:06', 3, 'PLGP129', '2016-03-02', '2016-03-01 00:00:00', 20, 10, NULL, NULL, 0, 0, 'ready_for_sale', '2016-03-16 13:00:06', '2016-04-01 03:33:24', 0),
(13, 'PLGP130-20160301-04:00:06', 3, 'PLGP130', '2016-03-02', '2016-03-01 00:00:00', 10, 10, NULL, NULL, 0, 0, 'ready_for_sale', '2016-03-16 13:00:06', '2016-03-16 13:08:58', 0),
(14, 'PLGP129-20160301-04:19:25', 3, 'PLGP129', '2016-03-02', '2016-03-01 00:00:00', 20, 20, NULL, NULL, 0, 0, 'under_review', '2016-03-16 13:19:25', '2016-03-16 13:19:25', 0),
(15, 'PLGP129--07:10:31', 4, 'PLGP129', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:31', '2016-03-28 04:10:31', 0),
(16, 'PLGP129--07:10:31', 5, 'PLGP129', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:31', '2016-03-28 04:10:31', 0),
(17, 'PLGP130--07:10:31', 4, 'PLGP130', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:31', '2016-03-28 04:10:31', 0),
(18, 'PLGP130--07:10:31', 5, 'PLGP130', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:31', '2016-03-28 04:10:31', 0),
(19, 'PLGP131--07:10:31', 4, 'PLGP131', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:31', '2016-03-28 04:10:31', 0),
(20, 'PLGP131--07:10:31', 5, 'PLGP131', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:31', '2016-03-28 04:10:31', 0),
(21, 'PLGP128--07:10:31', 4, 'PLGP128', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:31', '2016-03-28 04:10:31', 0),
(22, 'PLGP128--07:10:32', 5, 'PLGP128', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:32', '2016-03-28 04:10:32', 0),
(23, 'PLGP114--07:10:32', 4, 'PLGP114', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:32', '2016-03-28 04:10:32', 0),
(24, 'PLGP114--07:10:32', 5, 'PLGP114', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:32', '2016-03-28 04:10:32', 0),
(25, 'PLGP129--07:10:31', 6, 'PLGP129', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:31', '2016-03-28 04:10:31', 0),
(26, 'PLGP110--07:10:32', 5, 'PLGP110', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:32', '2016-03-28 04:10:32', 0),
(27, 'PLGP110--07:10:32', 4, 'PLGP110', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:32', '2016-03-28 04:10:32', 0),
(28, 'PLGP130--07:10:32', 6, 'PLGP130', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:32', '2016-03-28 04:10:32', 0),
(29, 'PLGP131--07:10:32', 6, 'PLGP131', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:32', '2016-03-28 04:10:32', 0),
(30, 'PLGP128--07:10:32', 6, 'PLGP128', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:32', '2016-03-28 04:10:32', 0),
(31, 'PLGP114--07:10:32', 6, 'PLGP114', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:32', '2016-03-28 04:10:32', 0),
(32, 'PLGP110--07:10:32', 6, 'PLGP110', '0000-00-00', '0000-00-00 00:00:00', 0, 0, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:10:32', '2016-03-28 04:10:32', 0),
(33, 'PLGP129-20160301-07:11:45', 7, 'PLGP129', '2016-03-02', '2016-03-01 00:00:00', 20, 20, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:11:45', '2016-03-28 04:11:45', 0),
(34, 'PLGP130-20160301-07:11:45', 7, 'PLGP130', '2016-03-02', '2016-03-01 00:00:00', 10, 10, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:11:45', '2016-03-28 04:11:45', 0),
(35, 'PLGP131-20160301-07:11:45', 7, 'PLGP131', '2016-03-01', '2016-03-01 00:00:00', 15, 15, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:11:45', '2016-03-28 04:11:45', 0),
(36, 'PLGP128-20160301-07:11:45', 7, 'PLGP128', '2016-03-01', '2016-03-01 00:00:00', 30, 30, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:11:45', '2016-03-28 04:11:45', 0),
(37, 'PLGP114-20160301-07:11:45', 7, 'PLGP114', '2016-03-02', '2016-03-01 00:00:00', 60, 60, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:11:45', '2016-03-28 04:11:45', 0),
(38, 'PLGP110-20160301-07:11:45', 7, 'PLGP110', '2016-04-01', '2016-03-01 00:00:00', 10, 10, NULL, NULL, 0, 0, 'under_review', '2016-03-28 04:11:45', '2016-03-28 04:11:45', 0),
(39, 'PLGP027-20160401-06:05:48', 8, 'PLGP027', '2016-04-01', '2016-04-01 00:00:00', 20, 20, NULL, NULL, 0, 0, 'ready_for_sale', '2016-04-01 03:05:48', '2016-04-01 03:17:00', 0),
(40, 'PLGP004-20160401-06:05:49', 8, 'PLGP004', '2016-04-01', '2016-04-01 00:00:00', 20, 20, NULL, NULL, 0, 0, 'ready_for_sale', '2016-04-01 03:05:49', '2016-04-01 03:17:01', 0),
(41, 'PLGP022-20160401-06:05:49', 8, 'PLGP022', '2016-04-01', '2016-04-01 00:00:00', 20, 20, NULL, NULL, 0, 0, 'ready_for_sale', '2016-04-01 03:05:49', '2016-04-01 03:17:01', 0),
(42, 'PLGP164-20160401-06:05:49', 8, 'PLGP164', '2016-04-01', '2016-04-01 00:00:00', 20, 20, NULL, NULL, 0, 0, 'ready_for_sale', '2016-04-01 03:05:49', '2016-04-01 03:17:01', 0),
(43, 'PLGP035-20160401-06:05:49', 8, 'PLGP035', '2016-04-01', '2016-04-01 00:00:00', 20, 20, NULL, NULL, 0, 0, 'ready_for_sale', '2016-04-01 03:05:49', '2016-04-01 03:17:01', 0),
(44, 'PLGP165g-20160401-06:05:49', 8, 'PLGP165g', '2016-04-01', '2016-04-01 00:00:00', 20, 20, NULL, NULL, 0, 0, 'ready_for_sale', '2016-04-01 03:05:49', '2016-04-01 03:17:01', 0),
(45, 'PLGP130-20160301-06:06:53', 8, 'PLGP130', '2016-03-02', '2016-03-01 00:00:00', 10, 10, NULL, NULL, 0, 0, 'ready_for_sale', '2016-04-01 03:06:53', '2016-04-01 03:17:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(15) NOT NULL,
  `details_grp_id` varchar(30) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `billing_period` varchar(30) NOT NULL,
  `next_billing_date` datetime NOT NULL,
  `billing_method` varchar(10) NOT NULL COMMENT 'auto, manual',
  `invoice_amount` double(15,2) NOT NULL COMMENT 'incl. Taxes',
  `payment_status` varchar(30) NOT NULL COMMENT 'Full, Partial, None',
  `created_at` datetime NOT NULL,
  `created_by` int(15) NOT NULL,
  `approval_status` varchar(20) NOT NULL COMMENT 'Approved, Pending, Rejected, Cancelled',
  `approved_by` int(15) NOT NULL,
  `last_printed_by` int(15) NOT NULL,
  `last_printed_on` datetime NOT NULL,
  `dispatch_status` varchar(50) NOT NULL,
  `dispatched_on` datetime NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(15) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `clientid` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `details_grp_id`, `currency`, `billing_period`, `next_billing_date`, `billing_method`, `invoice_amount`, `payment_status`, `created_at`, `created_by`, `approval_status`, `approved_by`, `last_printed_by`, `last_printed_on`, `dispatch_status`, `dispatched_on`, `last_updated`, `updated_by`, `deleted`, `updated_at`, `clientid`, `description`) VALUES
(1, '', 'UGX', '', '0000-00-00 00:00:00', 'manual', 2000000.00, 'partial', '2016-01-07 07:42:08', 0, 'approved', 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '2016-01-07 07:42:08', 0, 0, '2016-01-07 07:42:08', 1, 'This is a test description'),
(2, '', 'UGX', '', '0000-00-00 00:00:00', 'manual', 5000000.00, 'full', '2016-01-07 07:46:42', 0, 'approved', 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '2016-01-07 07:46:42', 0, 0, '2016-01-07 07:46:42', 7, 'This is a test description'),
(3, '', 'UGX', '', '0000-00-00 00:00:00', '', 2000000.00, 'full', '2016-01-23 11:53:40', 0, 'approved', 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '2016-01-23 11:53:40', 0, 0, '2016-01-23 11:53:40', 1, 'This is a test invoice'),
(4, '', '', '', '0000-00-00 00:00:00', 'auto', 0.00, 'full', '2016-03-28 08:06:14', 0, 'approved', 0, 0, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '2016-03-28 08:06:14', 0, 0, '2016-03-28 08:06:14', 6, 'This is Busingye');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` int(15) NOT NULL,
  `details_grp_id` varchar(30) NOT NULL,
  `pdt_code` varchar(30) NOT NULL,
  `batch_no` varchar(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  `unit_of_measure` varchar(30) NOT NULL,
  `quantity` int(15) NOT NULL,
  `rate` double(15,2) NOT NULL,
  `discount` bigint(100) NOT NULL,
  `created_by` int(15) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(15) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `invoiceid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `details_grp_id`, `pdt_code`, `batch_no`, `description`, `unit_of_measure`, `quantity`, `rate`, `discount`, `created_by`, `created_at`, `updated_at`, `updated_by`, `deleted`, `invoiceid`) VALUES
(1, '', '2-nails', '', '', 'other', 10, 35000.00, 0, 0, '2016-01-07 07:57:07', '2016-01-07 08:00:54', 0, 0, 2),
(2, '', '1-cement', '', '', 'other', 10, 36000.00, 0, 0, '2016-01-07 08:01:35', '2016-01-07 05:01:35', 0, 0, 2),
(3, '', '1-cement', '', '', 'other', 10, 36000.00, 0, 0, '2016-01-07 08:38:26', '2016-01-07 05:38:26', 0, 0, 1),
(4, '', '2-nails', '', '', 'kg', 10, 1000.00, 0, 0, '2016-01-23 11:58:52', '2016-01-23 08:58:52', 0, 0, 3),
(5, '', '128-eblow g.i 20mm/1/2inch-335', '', '', '', 10, 335500.00, -500, 0, '2016-04-10 13:47:33', '2016-04-10 10:47:33', 0, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` int(15) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date_created',
  `posted_by` int(15) NOT NULL COMMENT 'created_by',
  `due_date` datetime NOT NULL,
  `account_dr` int(15) NOT NULL COMMENT 'account_id',
  `account_cr` int(15) NOT NULL COMMENT 'account_id',
  `journal_type` varchar(30) NOT NULL COMMENT 'Invoice or PO',
  `journal_type_id` int(15) NOT NULL COMMENT 'Invoice or PO table id',
  `description` varchar(100) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(15) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `invoice_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`id`, `created_at`, `posted_by`, `due_date`, `account_dr`, `account_cr`, `journal_type`, `journal_type_id`, `description`, `currency`, `amount`, `updated_at`, `updated_by`, `deleted`, `invoice_id`) VALUES
(1, '2016-01-07 07:57:07', 0, '0000-00-00 00:00:00', 4, 7, '', 0, '', '', 0.00, '2016-01-07 04:57:07', 0, 0, 2),
(2, '2016-01-07 08:01:35', 0, '0000-00-00 00:00:00', 4, 7, '', 0, '', '', 0.00, '2016-01-07 05:01:35', 0, 0, 2),
(3, '2016-01-07 08:38:26', 0, '0000-00-00 00:00:00', 4, 1, '', 0, '', '', 0.00, '2016-01-07 05:38:26', 0, 0, 1),
(4, '2016-01-23 11:58:52', 0, '0000-00-00 00:00:00', 4, 1, '', 0, '', '', 0.00, '2016-01-23 08:58:52', 0, 0, 3),
(5, '2016-04-10 13:47:33', 0, '0000-00-00 00:00:00', 8, 4, '', 0, '', '', 0.00, '2016-04-10 10:47:33', 0, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_100000_create_password_resets_table', 1),
('2015_11_26_093910_create_authors_table', 1),
('2015_11_26_094846_add_authors', 1),
('2015_11_30_080934_create_articles_table', 1),
('2015_11_30_082136_add_excerpt_to_articles_table', 1),
('2015_12_14_200115_create_clients_table', 1),
('2015_12_15_153936_create_products_table', 2),
('2015_12_16_072905_create_suppliers_table', 3),
('2015_12_16_132818_create_supplierproducts_table', 4),
('2015_12_28_091004_create_accountcategories_table', 5),
('2016_01_07_092516_create_table_tests', 6),
('2016_01_11_061801_create_table_profiles', 7),
('2016_01_15_122207_create_privilleges_table', 8),
('2016_02_03_145413_create_table_quotations', 9),
('2016_02_04_095015_create_table_quotationdetails', 10),
('2016_03_02_112933_create_table_costparameters', 11),
('2016_03_02_155121_create_table_costs', 12),
('2016_03_07_120503_create_costing_table', 13),
('2016_03_08_073411_create_table_test', 13),
('2016_03_12_075503_create_table_costgroup', 13),
('2016_03_14_063600_create_table_shelves', 14);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pdts_services`
--

CREATE TABLE `pdts_services` (
  `id` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `privilleges`
--

CREATE TABLE `privilleges` (
  `id` int(10) UNSIGNED NOT NULL,
  `profile_id` int(11) NOT NULL,
  `all_routes` int(11) NOT NULL DEFAULT '0',
  `acc_categories` int(11) NOT NULL DEFAULT '0',
  `hello` int(11) NOT NULL DEFAULT '0',
  `accounts` int(11) NOT NULL DEFAULT '0',
  `author` int(11) NOT NULL DEFAULT '0',
  `contact` int(11) NOT NULL DEFAULT '0',
  `products` int(11) NOT NULL DEFAULT '0',
  `register_product` int(11) NOT NULL DEFAULT '0',
  `suppliers` int(11) NOT NULL DEFAULT '0',
  `clients` int(11) NOT NULL DEFAULT '0',
  `invoices` int(11) NOT NULL DEFAULT '0',
  `save_invoice` int(11) NOT NULL DEFAULT '0',
  `supplier_products` int(11) NOT NULL DEFAULT '0',
  `register_supplier` int(11) NOT NULL DEFAULT '0',
  `register_client` int(11) NOT NULL DEFAULT '0',
  `assign_supplier_products` int(11) NOT NULL DEFAULT '0',
  `add_invoice_item` int(11) NOT NULL DEFAULT '0',
  `account_category_enteries` int(11) NOT NULL DEFAULT '0',
  `inv_details` int(11) NOT NULL DEFAULT '0',
  `proceed_account_entries` int(11) NOT NULL DEFAULT '0',
  `record_income` int(11) NOT NULL DEFAULT '0',
  `record_income_save` int(11) NOT NULL DEFAULT '0',
  `record_invoice_payment` int(11) NOT NULL DEFAULT '0',
  `print_receipt` int(11) NOT NULL DEFAULT '0',
  `login_form` int(11) NOT NULL DEFAULT '0',
  `logout` int(11) NOT NULL DEFAULT '0',
  `users` int(11) NOT NULL DEFAULT '0',
  `register_users` int(11) NOT NULL DEFAULT '0',
  `create_user_profile` int(11) NOT NULL DEFAULT '0',
  `user_profiles` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `quotation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `privilleges`
--

INSERT INTO `privilleges` (`id`, `profile_id`, `all_routes`, `acc_categories`, `hello`, `accounts`, `author`, `contact`, `products`, `register_product`, `suppliers`, `clients`, `invoices`, `save_invoice`, `supplier_products`, `register_supplier`, `register_client`, `assign_supplier_products`, `add_invoice_item`, `account_category_enteries`, `inv_details`, `proceed_account_entries`, `record_income`, `record_income_save`, `record_invoice_payment`, `print_receipt`, `login_form`, `logout`, `users`, `register_users`, `create_user_profile`, `user_profiles`, `created_at`, `updated_at`, `quotation`) VALUES
(1, 4, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '2016-01-19 08:37:18', '2016-01-19 08:37:18', 1),
(2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, '2016-01-20 01:49:11', '2016-01-20 01:49:11', 1),
(3, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2016-01-20 01:54:55', '2016-01-20 01:54:55', 1),
(4, 7, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, '2016-02-11 08:10:33', '2016-02-11 08:10:33', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_code` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Product/Service Code',
  `barcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `size` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_of_measure` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Piece',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Product or Service',
  `category` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UNDEFINED' COMMENT 'Hardware, Plumbing, Cosmetics, Electronics, etc',
  `dept` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'GENERAL' COMMENT 'Department',
  `min_threshold` int(6) NOT NULL COMMENT 'X unit_of_measure',
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Inactive' COMMENT 'Active, Inactive, Suspended, etc',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 or 1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL COMMENT 'Staff_ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='items'' list';

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `item_code`, `barcode`, `name`, `description`, `supplier_id`, `size`, `unit_of_measure`, `type`, `category`, `dept`, `min_threshold`, `status`, `deleted`, `created_at`, `updated_at`, `updated_by`) VALUES
(1, 'PLHC001', '', 'HIMA CEMENT PPC', 'HIMA CEMENT PPC', 0, '50KGS', 'Bags', 'Product', 'Cement', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(2, 'PLTCOO1', '', 'TORORO CEMENT PPC', 'TORORO CEMENT PPC', 0, '50KG', 'Bags', 'Product', 'Cement', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(3, 'PLS001', '', 'SUPASET CEMENT PPC', 'SUPASET CEMENT PPC', 0, '50KG', 'Bags', 'Product', 'Cement', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(4, 'PLN001', '', 'NYATI/KAMPALA CEMENT', 'NYATI/KAMPALA CEMENT', 0, '50kg', 'Bags', 'Product', 'Cement', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(5, 'PLLMOO1', '', 'LIME COAST', 'LIME COAST', 0, '25KG', 'Bags', 'Product', 'Cement', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(6, 'PLTO001', '', 'TORORO CEMENT OPC', 'TORORO CEMENT OPC', 0, '50KG', 'Bags', 'Product', 'Cement', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(7, 'PLPM001', '', 'POWERMAX', 'POWERMAX', 0, '50KG', 'Bags', 'Product', 'Cement', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(8, 'PLRL001', '', 'ROAD LIME', 'ROAD LIME', 0, '20KG', 'Bags', 'Product', 'Cement', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(9, 'PLGP001', '', 'pvc down pipe-grey', 'pvc down pipe-grey', 0, '82mm/ 3inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(10, 'PLGP002', '', 'pvc down pipe-white', 'pvc down pipe-white', 0, '82mm/3inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(11, 'PLGP003', '', 'pvc light gauge', 'pvc light gauge', 0, '4INCH', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(12, 'PLGP004', '', 'pvc light guage new', 'pvc light guage new', 0, '4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(13, 'PLGP005', '', 'pvc prussure pipe', 'pvc prussure pipe', 0, '20mm/1.5inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(14, 'PLGP006', '', 'pvc pressure pipe', 'pvc pressure pipe', 0, '25mm/3/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(15, 'PLGP007', '', 'pvc pressure pipe 32mm/1inch', 'pvc pressure pipe 32mm/1inch', 0, '32mm/1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(16, 'PLGP008', '', 'pvc swept tee 1-1/2inch', 'pvc swept tee 1-1/2inch', 0, '1-1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(17, 'PLGP009', '', 'pvc swept tee 75mm/2inch', 'pvc swept tee 75mm/2inch', 0, '75mm/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(18, 'PLGP010', '', 'pvc drainage pipe 1-1/4inch', 'pvc drainage pipe 1-1/4inch', 0, '1-1/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(19, 'PLGP011', '', 'pvc access plug 1-1/4inch', 'pvc access plug 1-1/4inch', 0, '1-1/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(20, 'PLGP012', '', 'pvc access plug 1-/1/2inch', 'pvc access plug 1-/1/2inch', 0, '1-/1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(21, 'PLGP013', '', 'pv c access plug 2inch', 'pv c access plug 2inch', 0, '2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(22, 'PLGP014', '', 'pvc swept door tee 110mm/4inch', 'pvc swept door tee 110mm/4inch', 0, '110mm/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(23, 'PLGP015', '', 'pvc door bend 110mm/4inch', 'pvc door bend 110mm/4inch', 0, '110mm/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(24, 'PLGP016', '', 'pvc drainage pipe 1-1/2inch', 'pvc drainage pipe 1-1/2inch', 0, '1-1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(25, 'PLGP017', '', 'pvc floor trap coninx75mm/2inch', 'pvc floor trap coninx75mm/2inch', 0, '75mm/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(26, 'PLGP018', '', 'pvc s/bend 87.5 ,1-1/2inch', 'pvc s/bend 87.5 ,1-1/2inch', 0, '1-1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(27, 'PLGP019', '', 'pvc s/bend 87.5 75mm/2inch', 'pvc s/bend 87.5 75mm/2inch', 0, '75mm/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(28, 'PLGP020', '', 'pvc s/bend 110mm/4inch', 'pvc s/bend 110mm/4inch', 0, '110mm/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(29, 'PLGP021', '', 'pvc swept tee 1-1/4inch', 'pvc swept tee 1-1/4inch', 0, '1-1/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(30, 'PLGP022', '', 'pvc m gauge 1.8mm', 'pvc m gauge 1.8mm', 0, '4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(31, 'PLGP023', '', 'pvc H duty ISO PN.6', 'pvc H duty ISO PN.6', 0, '4INCH', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(32, 'PLGP025', '', 'Reducing bush 2'' x 1-1/2inch', 'Reducing bush 2'' x 1-1/2inch', 0, '2INCH', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(33, 'PLGP026', '', 'PVC S/bend 87.5 1-1/4 inch', 'PVC S/bend 87.5 1-1/4 inch', 0, '1-1/4 inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(34, 'PLGP027', '', 'PVC light gauge 160mm/6  inch', 'PVC light gauge 160mm/6  inch', 0, '6INCH', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(35, 'PLGP028', '', 'pvc drainage pipe 2inch', 'pvc drainage pipe 2inch', 0, '2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(36, 'PLGP029', '', 'pvc pipe light gauge 82mm/3inch', 'pvc pipe light gauge 82mm/3inch', 0, '3inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(37, 'PLGP030', '', 'pvc 90deg elbow white 82mm/3inc', 'pvc 90deg elbow white 82mm/3inc', 0, '82mm/3inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(38, 'PLGP031', '', 'pvc 45deg elbow white 82mm/3inc', 'pvc 45deg elbow white 82mm/3inc', 0, '82mm/3inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(39, 'PLGP032', '', 'pvc pipe PN.4 160mm/6inch', 'pvc pipe PN.4 160mm/6inch', 0, '82mm/6inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(40, 'PLGP033', '', 'pvc 90D.elbow grey 82mm/3inch', 'pvc 90D.elbow grey 82mm/3inch', 0, '82mm/3inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(41, 'PLGP034', '', 'pvc 45D.elbow grey 82mm/3inch', 'pvc 45D.elbow grey 82mm/3inch', 0, '82mm/3inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(42, 'PLGP035', '', 'pvc pipe clip 75mm/2inch', 'pvc pipe clip 75mm/2inch', 0, '2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(43, 'PLGP036', '', 'ppr compact valva 20mm/1.5inch', 'ppr compact valva 20mm/1.5inch', 0, '20mm/1.5inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(44, 'PLGP037', '', 'ppr female adaptor 20x1/2', 'ppr female adaptor 20x1/2', 0, '20x1/2', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(45, 'PLGP038', '', 'ppr female adaptor 25x1/2', 'ppr female adaptor 25x1/2', 0, '25x1/2', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(46, 'PLGP039', '', 'ppr male adaptor 25x3/4', 'ppr male adaptor 25x3/4', 0, '25x3/4', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(47, 'PLGP040', '', 'Ppr male adaptor 25x1/2', 'Ppr male adaptor 25x1/2', 0, '25x1/2', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(48, 'PLGP041', '', 'ppr male adaptor 20x1/2', 'ppr male adaptor 20x1/2', 0, '20x1/2', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(49, 'PLGP042', '', 'ppr female elbow 20x1/2', 'ppr female elbow 20x1/2', 0, '20x1/2', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(50, 'PLGP045', '', 'ppr pipe clip 20mmx1/2inch', 'ppr pipe clip 20mmx1/2inch', 0, '20mmx1/2inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(51, 'PLGP046', '', 'ppr pipe clip 25mmx3/4inch', 'ppr pipe clip 25mmx3/4inch', 0, '25mmx3/4inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(52, 'PLGP047', '', 'ppr female adaptor 25x3/4', 'ppr female adaptor 25x3/4', 0, '25x3/4', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(53, 'PLGP048', '', 'ppr pipe PN .16 4mtr,20mm/1/2', 'ppr pipe PN .16 4mtr,20mm/1/2', 0, '20mm/1/2', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(54, 'PLGP049', '', 'ppr D/F-elbow 25x1/2inch', 'ppr D/F-elbow 25x1/2inch', 0, '25x1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(55, 'PLGP050', '', 'ppr pipe PN .16 4mts 25mmx3/4', 'ppr pipe PN .16 4mts 25mmx3/4', 0, '25mmx3/4', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(56, 'PLGP051', '', 'ppr compact valva 25mmx3/4inch', 'ppr compact valva 25mmx3/4inch', 0, '25mmx3/4inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(57, 'PLGP052', '', 'ppr compact valva 32mm/1inch', 'ppr compact valva 32mm/1inch', 0, '32mm/1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(58, 'PLGP053', '', 'ppr short cross over 32mm/1inch', 'ppr short cross over 32mm/1inch', 0, '32mm/1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(59, 'PLGP054', '', 'ppr short cross over 25mm/3/4', 'ppr short cross over 25mm/3/4', 0, '25mm/3/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(60, 'PLGP055', '', 'ppr short cross over 20mmx1/2', 'ppr short cross over 20mmx1/2', 0, '20mmx1/2', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(61, 'PLGP056', '', 'ppr union 20mm/1/2inch', 'ppr union 20mm/1/2inch', 0, '20mm/1/2inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(62, 'PLGP057', '', 'ppr pipe PN .16 4mts 32mm/1inch', 'ppr pipe PN .16 4mts 32mm/1inch', 0, '32mm/1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(63, 'PLGP058', '', 'pp-r straight tee 20mm/1/2inch', 'pp-r straight tee 20mm/1/2inch', 0, '20mm/1/2inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(64, 'PLGP059', '', 'pp-r straight tee 25mm/3/4inch', 'pp-r straight tee 25mm/3/4inch', 0, '25mm/3/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(65, 'PLGP060', '', 'ppr straight tee 32mm/1inch', 'ppr straight tee 32mm/1inch', 0, '32mm/1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(66, 'PLGP061', '', 'pp-r elbow 90Deg 25mm/3/4inch', 'pp-r elbow 90Deg 25mm/3/4inch', 0, '25mm/3/4inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(67, 'PLGP062', '', 'pp-r 90deg 32mm/1inch', 'pp-r 90deg 32mm/1inch', 0, '32mm/1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(68, 'PLGP063', '', 'pp-r red socket 25x20mm', 'pp-r red socket 25x20mm', 0, '25x20mm', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(69, 'PLGP064', '', 'pp-r red tee 32x25mm', 'pp-r red tee 32x25mm', 0, '32x25mm', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(70, 'PLGP065', '', 'pp-r red tee 32x20mm', 'pp-r red tee 32x20mm', 0, 'pp-r red tee', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(71, 'PLGP066', '', 'pp-r red tee 25x20mm', 'pp-r red tee 25x20mm', 0, '25x20mm', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(72, 'PLGP067', '', 'ppr union 25mm/3/4', 'ppr union 25mm/3/4', 0, '25mm/3/4', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(73, 'PLGP068', '', 'pp-r socket 20mm/1/2inch', 'pp-r socket 20mm/1/2inch', 0, '20mm/1/2inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(74, 'PLGP069', '', 'pp-r socket 25mmx3/4', 'pp-r socket 25mmx3/4', 0, '25mmx3/4', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(75, 'PLGP070', '', 'pp-r socket32mm/1inch', 'pp-r socket32mm/1inch', 0, '32mm/1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(76, 'PLGP071', '', 'PP-r red socket 32x20mm', 'PP-r red socket 32x20mm', 0, '32x20mm', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(77, 'PLGP073', '', 'pp-r elbow 90Deg 20mm/1/2inch', 'pp-r elbow 90Deg 20mm/1/2inch', 0, '20mm/1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(78, 'PLGP074', '', 'gentex  gate valve 1/2inch', 'gentex  gate valve 1/2inch', 0, '1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(79, 'PLGP075', '', 'gentex globe valve 1inch', 'gentex globe valve 1inch', 0, '1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(80, 'PLGP076', '', 'Gentex gate valve 25mm/3/4inch', 'Gentex gate valve 25mm/3/4inch', 0, '25mm/3/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(81, 'PLGP077', '', 'Gentex gate valve 32mm/1 inch', 'Gentex gate valve 32mm/1 inch', 0, '32mm/1 inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(82, 'PLGP078', '', 'Gentex stop cock 20mm/1/2 inch', 'Gentex stop cock 20mm/1/2 inch', 0, '20mm/1/2 inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(83, 'PLGP079', '', 'Gentex Stop cock 25mm/3/4 inch', 'Gentex Stop cock 25mm/3/4 inch', 0, '25mm/3/4 inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(84, 'PLGP080', '', 'Gentex globe valve F 20mm/1.5in', 'Gentex globe valve F 20mm/1.5in', 0, '20mm/1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(85, 'PLGP081', '', 'Gentex globe valveF 25mm/3/4inc', 'Gentex globe valveF 25mm/3/4inc', 0, '25mm/3/4inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(86, 'PLGP082', '', 'Gentex gutter grey 140mm/5inch', 'Gentex gutter grey 140mm/5inch', 0, '140mm/5inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(87, 'PLGP083', '', 'Gentex gutter white 140mm/5 inc', 'Gentex gutter white 140mm/5 inc', 0, '140mm/5 inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(88, 'PLGP084', '', 'HDPE pipe PN.10 20mm/1/2inch', 'HDPE pipe PN.10 20mm/1/2inch', 0, '20mm/1/2inch', 'roll', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(89, 'PLGP085', '', 'HDPE pipe PN.6 20mm/1/2inch', 'HDPE pipe PN.6 20mm/1/2inch', 0, '20mm/1/2inc', 'roll', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(90, 'PLGP086', '', 'HDPE elbow PN-16 20MM/1/2INCH', 'HDPE elbow PN-16 20MM/1/2INCH', 0, '20MM/1/2INC', 'roll', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(91, 'PLGP087', '', 'HDPE pipe PN.6 25mm/3/4inch', 'HDPE pipe PN.6 25mm/3/4inch', 0, '5mm/3/4inch', 'roll', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(92, 'PLGP088', '', 'HDPE pipe PN.10 25mm/3/4 inch', 'HDPE pipe PN.10 25mm/3/4 inch', 0, '25mm/3/4 inc', 'roll', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(93, 'PLGP089', '', 'HDPE pipe PN.6 32mm/1inch', 'HDPE pipe PN.6 32mm/1inch', 0, '32mm/1inch', 'roll', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(94, 'PLGP090', '', 'HDPE pipe PN.10 32mm/1inch', 'HDPE pipe PN.10 32mm/1inch', 0, '32mm/1inch', 'roll', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(95, 'PLGP091', '', 'VENT cowl 110mm/4 inch', 'VENT cowl 110mm/4 inch', 0, '110mm/4 inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(96, 'PLGP092', '', 'JOINT bracket white 140mm/5inch', 'JOINT bracket white 140mm/5inch', 0, '140mm/5inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(97, 'PLGP093', '', 'JOINT bracket grey 140mm/5inch', 'JOINT bracket grey 140mm/5inch', 0, '140mm/5inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(98, 'PLGP094', '', 'running outlet white 140mm/5inc', 'running outlet white 140mm/5inc', 0, '140mm/5inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(99, 'PLGPO95', '', 'running outlet grey 140mm/5inch', 'running outlet grey 140mm/5inch', 0, '140mm/5inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(100, 'PLGP096', '', 'Univer elbow white 140mm/5', 'Univer elbow white 140mm/5', 0, '140mm/5inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(101, 'PLGP097', '', 'Univer elbow grey 140mm/5 inch', 'Univer elbow grey 140mm/5 inch', 0, '140mm/5 inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(102, 'PLGP098', '', 'Coninx 4way trap 4inch x2inch', 'Coninx 4way trap 4inch x2inch', 0, '4inch x2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(103, 'PLGP099', '', 'Gi- plug 20mm/1/2inch', 'Gi- plug 20mm/1/2inch', 0, '20mm/1/2inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(104, 'PLGP100', '', 'Gi- plug 25mm/3/4inch', 'Gi- plug 25mm/3/4inch', 0, '25mm/3/4inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(105, 'PLGP101', '', 'G.I plug 32mm/1 inch', 'G.I plug 32mm/1 inch', 0, '32mm/1 inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(106, 'PLGP102', '', 'G.I M&F socket 25mm/3/4inch', 'G.I M&F socket 25mm/3/4inch', 0, '25mm/3/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(107, 'PLGP103', '', 'G.Ired bush 3/4inch/x1/2inch', 'G.Ired bush 3/4inch/x1/2inch', 0, '3/4inch/x1/', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(108, 'PLGP104', '', 'Gi red bush 1inch x3/4', 'Gi red bush 1inch x3/4', 0, '1inch x3/4', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(109, 'PLGP108', '', 'G.I over jumper 20mmx1/2inch', 'G.I over jumper 20mmx1/2inch', 0, '20mmx1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(110, 'PLGP109', '', 'G.Ired socket 1inchx3/4inch', 'G.Ired socket 1inchx3/4inch', 0, '1inchx3/4inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(111, 'PLGP110', '', 'G.I black nut 20mm/1inch', 'G.I black nut 20mm/1inch', 0, '20mm/1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(112, 'PLGP111', '', 'G.i black nut 25mm/3/4inch', 'G.i black nut 25mm/3/4inch', 0, '25mm/3/4inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(113, 'PLGP112', '', 'G.i black nut 32mm/1inch', 'G.i black nut 32mm/1inch', 0, '32mm/1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(114, 'PLGP113', '', 'Gi HEX nipple 25mm/3/4inch', 'Gi HEX nipple 25mm/3/4inch', 0, '25mm/3/4inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(115, 'PLGP114', '', 'G .I HEX nipple 32mm/1inch', 'G .I HEX nipple 32mm/1inch', 0, '32mm/1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(116, 'PLGP115', '', 'G.I pipe clip 25mm/3/4inch', 'G.I pipe clip 25mm/3/4inch', 0, '25mm/3/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(117, 'PLGP116', '', 'G.I HEX nipple 20mm/1/2inch', 'G.I HEX nipple 20mm/1/2inch', 0, '20mm/1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(118, 'PLGP117', '', 'G.I socket 20mm/1/2inch', 'G.I socket 20mm/1/2inch', 0, '20mm/1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(119, 'PLGP120', '', 'G.I M&F bends 20mm/1/2inch', 'G.I M&F bends 20mm/1/2inch', 0, '20mm/1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(120, 'PLGP121', '', 'G.I M&F bends 25mm/3/4inch', 'G.I M&F bends 25mm/3/4inch', 0, '25mm/3/4inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(121, 'PLGP122', '', 'G.I M&F bends 32mm/1inch', 'G.I M&F bends 32mm/1inch', 0, '32mm/1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(122, 'PLGP123', '', 'G.I pipe clip 20mm/1/2inch', 'G.I pipe clip 20mm/1/2inch', 0, '20mm/1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(123, 'PLGP124', '', 'TEE G.I 25mm/3/4inch', 'TEE G.I 25mm/3/4inch', 0, '25mm/3/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(124, 'PLGP125', '', 'TEE G.I 32mm/1inch', 'TEE G.I 32mm/1inch', 0, '32mm/1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(125, 'PLGP126', '', 'TEE G.I 20mm/1/2Inch', 'TEE G.I 20mm/1/2Inch', 0, '20mm/1/2Inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(126, 'PLGP127', '', 'Union G.I 25mm/3/4 Inch', 'Union G.I 25mm/3/4 Inch', 0, '', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(127, 'PLGP128', '', 'Elbow outlet white 140mm/5inch', 'Elbow outlet white 140mm/5inch', 0, '140mm/5inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(128, 'PLGP129', '', 'Eblow G.I 20mm/1/2inch', 'Eblow G.I 20mm/1/2inch', 0, '20mm/1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(129, 'PLGP130', '', 'Elbow GI 32mm/1 inch', 'Elbow GI 32mm/1 inch', 0, '32mm/1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(130, 'PLGP131', '', 'Elbow outlet grey 140mm/5inch', 'Elbow outlet grey 140mm/5inch', 0, '140mm/5inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(131, 'PLGP132', '', 'Stop end white 140mm/5inch', 'Stop end white 140mm/5inch', 0, '140mm/5inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(132, 'PLGP133', '', 'Stop end grey 140mm/5inch', 'Stop end grey 140mm/5inch', 0, '140mm/5inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(133, 'PLGP134', '', 'Support bracket white 140mm/5in', 'Support bracket white 140mm/5in', 0, '140mm/5inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(134, 'PLGP135', '', 'Support bracket grey 140mm/5inc', 'Support bracket grey 140mm/5inc', 0, '140mm/5inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(135, 'PLGP136', '', 'PEF TEE PN.16 25x3/4', 'PEF TEE PN.16 25x3/4', 0, '25x3/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(136, 'PLGP137', '', 'PEF.Elbow PN .16 32x1', 'PEF.Elbow PN .16 32x1', 0, '16 32x1', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(137, 'PLGP138', '', 'PEF.TEE PN.16 20x1/2inch', 'PEF.TEE PN.16 20x1/2inch', 0, '20x1/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(138, 'PLGP139', '', 'PEF,TEE PN.16 32x1', 'PEF,TEE PN.16 32x1', 0, '16 32x1', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(139, 'PLGP140', '', 'PEF/Elbow PN.16 20*1/2', 'PEF/Elbow PN.16 20*1/2', 0, '20*1/2', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(140, 'PLGP141', '', 'PEM.Adaptor PN.16 20*1/2', 'PEM.Adaptor PN.16 20*1/2', 0, '20*1/2', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(141, 'PLGP142', '', 'PEM.Elbow PN.16 20x1/2', 'PEM.Elbow PN.16 20x1/2', 0, '20x1/2', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(142, 'PLGP143', '', 'PEM. Elbow PN.16 32x1', 'PEM. Elbow PN.16 32x1', 0, '32x1', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(143, 'PLGP144', '', 'PEM. Adaptor PN.16 25x3/4', 'PEM. Adaptor PN.16 25x3/4', 0, '25x3/4', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(144, 'PLGP146', '', 'PEM.Adaptor PN.16 40x11/4', 'PEM.Adaptor PN.16 40x11/4', 0, '40x11/4', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(145, 'PLGP147', '', 'PE Elbow PN.16 25mm/3/4 inch', 'PE Elbow PN.16 25mm/3/4 inch', 0, '25mm/3/4 inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(146, 'PLGP148', '', 'PE Coupler PN.16 20mm/1/2 inch', 'PE Coupler PN.16 20mm/1/2 inch', 0, '1/2 in', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(147, 'PLGP149', '', 'PE Coupler PN.16 25mm/3/4 inch', 'PE Coupler PN.16 25mm/3/4 inch', 0, '25mm/3/4 inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(148, 'PLGP150', '', 'PE Coupler PN.16 32mm/1 inch', 'PE Coupler PN.16 32mm/1 inch', 0, '32mm/1 inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(149, 'PLGP151', '', 'PE Coupler PN.16 40mm/2 inch', 'PE Coupler PN.16 40mm/2 inch', 0, '40mm/2 inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(150, 'PLGP152', '', 'PE TEE PN.16 20mm/1/2 inch', 'PE TEE PN.16 20mm/1/2 inch', 0, '20mm/1/2 inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(151, 'PLGP153', '', 'PE TEE PN.16 25mm/3/4 inch', 'PE TEE PN.16 25mm/3/4 inch', 0, '25mm/3/4 inc', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(152, 'PLGP154', '', 'PE TEE PN.16 32mm/1 inch', 'PE TEE PN.16 32mm/1 inch', 0, '32mm/1 inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(153, 'PLGP155', '', 'PE TEE PN.16 40mm/2 inch', 'PE TEE PN.16 40mm/2 inch', 0, '40mm/2 inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(154, 'PLGP156', '', 'PE R.TEE PN.16 25x20', 'PE R.TEE PN.16 25x20', 0, '25x20', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(155, 'PLGP157', '', 'PE R.TEE PN.16 32x25', 'PE R.TEE PN.16 32x25', 0, '32x25', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(156, 'PLGP158', '', 'Down Pipe Clip White 75mm/2 inc', 'Down Pipe Clip White 75mm/2 inc', 0, '75mm/2 inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(157, 'PLGP159', '', 'L/ Screw (copmlete) 20mm/1/2 In', 'L/ Screw (copmlete) 20mm/1/2 In', 0, '20mm/1/2 In', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(158, 'PLGP160', '', 'L Screw 25mm/3/4 inch (complete', 'L Screw 25mm/3/4 inch (complete', 0, '25mm/3/4', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(159, 'PLGP161', '', 'L Screw (complete) 32mm/1inch', 'L Screw (complete) 32mm/1inch', 0, '32mm/1inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(160, 'PLGP162', '', 'L Screw (complete) 1 /1/4inch', 'L Screw (complete) 1 /1/4inch', 0, '1 /1/4inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(161, 'PLGP163', '', 'L Screw (complete) 11/2inch', 'L Screw (complete) 11/2inch', 0, '11/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(162, 'PLGP164', '', 'PVC pipe clip ', 'PVC pipe clip ', 0, '110mm', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(163, 'PLGP165w', '', 'PVC pipe clip WHTITE', 'PVC pipe clip WHTITE', 0, '75mm/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1),
(164, 'PLGP165g', '', 'PVC pipe clip grey', 'PVC pipe clip grey', 0, '75mm/2inch', 'Pcs', 'Product', 'Plumbing', '', 0, 'Active', 0, '2016-03-01 04:00:00', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allowed_paths` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `name`, `allowed_paths`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'all', '2016-01-11 04:38:07', '2016-01-11 04:38:07'),
(2, 'basic', 'invoices,record_income,users,user_profiles,create_user_profile', '2016-01-11 05:54:14', '2016-01-11 05:54:14'),
(3, 'Test', 'accounts,invoices', '2016-01-19 08:22:34', '2016-01-19 08:22:34'),
(4, 'test', 'accounts,invoices', '2016-01-19 08:37:18', '2016-01-19 08:37:18'),
(5, 'test2', '', '2016-01-20 01:49:11', '2016-01-20 01:49:11'),
(6, 'test3', '', '2016-01-20 01:54:55', '2016-01-20 01:54:55'),
(7, 'test_role', '', '2016-02-11 08:10:32', '2016-02-11 08:10:32');

-- --------------------------------------------------------

--
-- Table structure for table `quotationdetails`
--

CREATE TABLE `quotationdetails` (
  `id` int(10) UNSIGNED NOT NULL,
  `quotationid` int(11) NOT NULL,
  `unit_of_measure` text COLLATE utf8_unicode_ci NOT NULL,
  `quantity` text COLLATE utf8_unicode_ci NOT NULL,
  `rate` text COLLATE utf8_unicode_ci NOT NULL,
  `pdt_code` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quotationdetails`
--

INSERT INTO `quotationdetails` (`id`, `quotationid`, `unit_of_measure`, `quantity`, `rate`, `pdt_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'kg', '10', '35000', '2-nails', '2016-02-04 07:07:05', '2016-02-04 07:07:05'),
(2, 1, 'kg', '10', '35000', '1-cement', '2016-02-04 07:11:38', '2016-02-04 07:11:38'),
(3, 1, 'kg', '', '', '9-pvc down pipe-grey', '2016-03-13 17:57:29', '2016-03-13 17:57:29');

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(10) UNSIGNED NOT NULL,
  `clientid` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `approval_status` text COLLATE utf8_unicode_ci NOT NULL,
  `currency` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `clientid`, `description`, `approval_status`, `currency`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sample quotation for Moses Wasswa', 'approved', 'UGX', '2016-02-04 06:44:59', '2016-02-04 06:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `shelves`
--

CREATE TABLE `shelves` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shelves`
--

INSERT INTO `shelves` (`id`, `name`, `section`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PLMB-001', 'Plumbing', 'First Floor Near the Door To your right', 'active', '2016-03-14 04:04:20', '2016-03-14 04:04:20'),
(2, 'CMT-001', 'Cement', 'First Floor Near the Door To your left', 'active', '2016-03-14 04:06:00', '2016-03-14 04:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_code` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT 'can repeat',
  `batch_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'unique',
  `qty_in_stock` int(11) NOT NULL,
  `qty_sold` int(11) NOT NULL,
  `shelf_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Category/Dept plus number',
  `supplier` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `item_code`, `batch_no`, `qty_in_stock`, `qty_sold`, `shelf_no`, `supplier`, `created_at`, `updated_at`, `status`) VALUES
(1, 'PLGP098', 'PLGP098-20160301-08:20:22', 30, 0, '1', NULL, '2016-03-14 05:25:26', '2016-04-01 03:33:23', 0),
(2, 'PLGP158', 'PLGP158-20160301-08:20:22', 20, 0, '2', NULL, '2016-03-14 05:25:26', '2016-03-14 05:25:26', 0),
(3, 'PLGP129', 'PLGP129-20160301-08:20:22', 5, 0, '2', NULL, '2016-03-14 05:25:26', '2016-03-14 05:25:26', 0),
(4, 'PLGP130', 'PLGP130-20160301-08:20:22', 6, 0, '1', NULL, '2016-03-14 05:25:27', '2016-03-14 05:25:27', 0),
(5, 'PLGP098', 'PLGP098-20160301-04:00:06', 10, 0, '2', NULL, '2016-03-16 13:14:32', '2016-03-16 13:14:32', 0),
(6, 'PLGP158', 'PLGP158-20160301-04:00:06', 20, 0, '1', NULL, '2016-03-16 13:14:32', '2016-03-16 13:14:32', 0),
(7, 'PLGP129', 'PLGP129-20160301-04:00:06', 10, 0, '2', NULL, '2016-04-01 03:33:24', '2016-04-01 03:33:24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accountid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `location`, `contact`, `accountid`, `created_at`, `updated_at`, `status`) VALUES
(1, 'RiL Investiments', 'Clement Hill', '256772178789', 0, '2015-12-16 06:39:31', '2015-12-16 06:39:31', 1),
(2, 'Roofings Limited', 'Namanve', '256772134546', 0, '2015-12-16 06:47:41', '2015-12-16 06:47:41', 1),
(3, 'Hima Cement', 'Fortpotal', '256774565234', 3, '2015-12-16 11:33:28', '2015-12-16 11:33:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_products`
--

CREATE TABLE `supplier_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplierid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supplier_products`
--

INSERT INTO `supplier_products` (`id`, `supplierid`, `productid`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2015-12-16 10:57:20', '2015-12-16 10:57:20'),
(2, 2, 1, '2015-12-16 10:58:25', '2015-12-16 10:58:25'),
(3, 5, 1, '2016-03-11 10:17:07', '2016-03-11 10:17:07');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bio` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(15) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(15) NOT NULL,
  `trans_type` varchar(30) NOT NULL COMMENT 'Inflow or Outflow',
  `trans_type_id` int(15) NOT NULL COMMENT 'Inflow or Outflow table id',
  `description` varchar(100) NOT NULL,
  `amount_paid` double(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Pending or Complete',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(15) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `journal_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `created_at`, `created_by`, `trans_type`, `trans_type_id`, `description`, `amount_paid`, `status`, `updated_at`, `updated_by`, `deleted`, `journal_id`) VALUES
(1, '2016-01-07 08:02:06', 0, '', 0, '', 600000.00, 0, '2016-01-07 05:02:06', 0, 0, 2),
(2, '2016-01-07 08:07:10', 0, '', 0, '', 110000.00, 0, '2016-01-07 05:07:10', 0, 0, 2),
(3, '2016-01-07 08:39:20', 0, '', 0, '', 200000.00, 0, '2016-01-07 05:39:20', 0, 0, 3),
(4, '2016-01-23 12:02:28', 0, '', 0, '', 5000.00, 0, '2016-01-23 09:02:28', 0, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `staff_id` varchar(15) DEFAULT NULL COMMENT 'FK from Employee tbl',
  `fname` varchar(60) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `other_name` varchar(30) DEFAULT NULL,
  `phone_no` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `user_level` int(11) NOT NULL,
  `profile` int(11) NOT NULL,
  `lastlogin_date` datetime DEFAULT NULL,
  `avater_path` varchar(20) DEFAULT NULL,
  `allowed_ips` varchar(30) DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `profile_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `staff_id`, `fname`, `lname`, `other_name`, `phone_no`, `status`, `user_level`, `profile`, `lastlogin_date`, `avater_path`, `allowed_ips`, `creator_id`, `created_at`, `updated_at`, `deleted`, `profile_id`) VALUES
(1, 'wasswam', 'wasswam@test.com', 'password', '2', 'Wasswa', 'Moses', NULL, '', 1, 0, 6, NULL, NULL, NULL, 0, '0000-00-00 00:00:00', '2016-01-20 08:53:39', '0', 0),
(2, 'glubega', NULL, 'password', NULL, 'Grace', 'Lubega', NULL, '', 0, 0, 7, NULL, NULL, NULL, 0, '2016-01-11 08:50:11', '2016-02-11 11:13:41', '0', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `account_categories`
--
ALTER TABLE `account_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `costgroups`
--
ALTER TABLE `costgroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `costparameters`
--
ALTER TABLE `costparameters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `costs`
--
ALTER TABLE `costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inflow_receipts`
--
ALTER TABLE `inflow_receipts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `pdts_services`
--
ALTER TABLE `pdts_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privilleges`
--
ALTER TABLE `privilleges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `code` (`item_code`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotationdetails`
--
ALTER TABLE `quotationdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shelves`
--
ALTER TABLE `shelves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_products`
--
ALTER TABLE `supplier_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`),
  ADD KEY `creator_id` (`creator_id`);
ALTER TABLE `users` ADD FULLTEXT KEY `email` (`email`);
ALTER TABLE `users` ADD FULLTEXT KEY `password` (`password`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `account_categories`
--
ALTER TABLE `account_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `costgroups`
--
ALTER TABLE `costgroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `costparameters`
--
ALTER TABLE `costparameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `costs`
--
ALTER TABLE `costs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `inflow_receipts`
--
ALTER TABLE `inflow_receipts`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Revenue / Cash-Inflow';
--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pdts_services`
--
ALTER TABLE `pdts_services`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `privilleges`
--
ALTER TABLE `privilleges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;
--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `quotationdetails`
--
ALTER TABLE `quotationdetails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `shelves`
--
ALTER TABLE `shelves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `supplier_products`
--
ALTER TABLE `supplier_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
