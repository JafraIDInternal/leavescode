-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2021 at 07:13 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jorani`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL COMMENT 'Unique identifier of the user',
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'First name',
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Last name',
  `login` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Identfier used to login (can be an email address)',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email address',
  `password` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Password encrypted with BCRYPT or a similar method',
  `role` int(11) DEFAULT NULL COMMENT 'Role of the employee (binary mask). See table roles.',
  `manager` int(11) DEFAULT NULL COMMENT 'Employee validating the requests of the employee',
  `country` int(11) DEFAULT NULL COMMENT 'Country code (for later use)',
  `organization` int(11) DEFAULT 0 COMMENT 'Entity where the employee has a position',
  `contract` int(11) DEFAULT NULL COMMENT 'Contract of the employee',
  `position` int(11) DEFAULT NULL COMMENT 'Position of the employee',
  `datehired` date DEFAULT NULL COMMENT 'Date hired / Started',
  `identifier` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Internal/company identifier',
  `language` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en' COMMENT 'Language ISO code',
  `ldap_path` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'LDAP Path for complex authentication schemes',
  `active` tinyint(1) DEFAULT 1 COMMENT 'Is user active',
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Timezone of user',
  `calendar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'External Calendar address',
  `random_hash` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Obfuscate public URLs',
  `user_properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Entity ID (eg. user id) to which the parameter is applied',
  `picture` blob DEFAULT NULL COMMENT 'Profile picture of user for tabular calendar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of employees / users having access to Jorani';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `login`, `email`, `password`, `role`, `manager`, `country`, `organization`, `contract`, `position`, `datehired`, `identifier`, `language`, `ldap_path`, `active`, `timezone`, `calendar`, `random_hash`, `user_properties`, `picture`) VALUES
(1, 'admin', 'admin', 'admin', 'wintoro_santoso@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 8, 0, 0, 2, 1, 1, '2010-01-01', '', 'en', '', 1, '', '', '', '', ''),
(2, 'Endang', '', 'Endang', '', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 6, 0, 4, 9, 1, '2012-07-03', 'JCI-0010', 'en', '', 1, '', '', '', '', ''),
(3, 'Heri Sunarya', '', 'Heri', 'Heri_Sunarya@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 7, 6, 1, '2012-10-01', 'JCI-0013', 'en', '', 0, '', '', '', '', ''),
(4, 'Ryan Maharyadi', '', 'Ryan', 'Ryan_Maharyadi@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 2, 6, 1, '2013-03-04', 'JCI-0028', 'en', '', 1, '', '', '', '', ''),
(5, 'Ira Setyowati ', 'setyowati', 'Ira', 'ira_setyowati@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 14, 0, 7, 18, 1, '2013-04-14', 'JCI-0030', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(6, 'Wintoro Santoso', '', 'Win', 'Wintoro_Santoso@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 4, 6, 1, '2013-04-15', 'JCI-0031', 'en', '', 1, '', '', '', '', ''),
(7, 'Candra ', 'Irawan Wijaya ', 'Candra', 'C_Irawan_Wijaya@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 43, 0, 7, 9, 1, '2013-05-01', 'JCI-0032', 'en', '', 1, 'Africa/Abidjan', '', '', '', ''),
(8, 'Raka Purbakesuma Wendy', 'wendy', 'Raka', 'R_Purbakesuma_Wendy@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 2, 9, 1, '2013-05-01', 'JCI-0034', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(9, 'Chai Keng Fui', '', 'KengFui', 'Kengfui_Chai@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 2, 1, 1, '2018-07-09', 'JCI-0125', 'en', '', 1, '', '', '', '', ''),
(10, 'Natalia Dwi Septirani', 'Rani', 'Rani', 'a@b', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 10, 0, 3, 15, 1, '2014-03-01', 'JCI-0039', 'en', '', 0, 'Africa/Abidjan', '', '', '', ''),
(11, 'Febty ', 'Anggraini', 'Febty', 'Febty_Anggraini@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 43, 0, 7, 18, 1, '2014-03-20', 'JCI-0040', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(12, 'Dinda Triastuti Rakhmadhani', '', 'Dinda', 'Dinda_Rakhmadani@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 14, 0, 2, 18, 1, '2014-03-24', 'JCI-0041', 'en', '', 1, '', '', '', '', ''),
(13, 'Fitria', 'Fitria', 'Fitria', 'Fitria@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 46, 0, 3, 18, 1, '2014-04-01', 'JCI-0042', 'en', '', 1, 'Africa/Abidjan', '', '', '', ''),
(14, 'Estheria Cellyna', 'cellyna', 'Celly', 'Estheria_Cellyna@Jafra.co.id', '$2b$10$rHwMAJnWC9arPIwk6esdfuih8U8EcZe940foIPJKmK3cgwX994wji', 2, 9, 0, 2, 18, 1, '2014-04-14', 'JCI-0043', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(15, 'Soe Natalia', 'natalia', 'Soe', 'Soe_Natalia@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 2, 18, 1, '2014-08-18', 'JCI-0048', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(16, 'Devian Jefriko Riand Ratuwalangon', 'ratuwalangon', 'Devian', 'Devian_Ratuwalangon@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 68, 0, 2, 9, 1, '2014-10-13', 'JCI-0050', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(17, 'Winda Starlet Fiona', 'fiona', 'Fiona', 'fiona@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 14, 0, 7, 18, 1, '2014-10-17', 'JCI-0051', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(18, 'Belinda', '', 'Belinda', 'Belinda_Koh@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 39, 0, 0, 11, 1, '2015-03-01', 'JCI-0056', 'en', '', 1, '', '', '', '', ''),
(19, 'Putri Septiani', '', 'Putri', 'Putri_Septiani@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 4, 0, 2, 17, 1, '2015-09-03', 'JCI-0067', 'en', '', 1, '', '', '', '', ''),
(20, 'RR Dina Aryanti Maulida', '', 'Dina', 'Dina_Maulida@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 14, 0, 2, 17, 1, '2015-11-23', 'JCI-0076', 'en', '', 1, '', '', '', '', ''),
(22, 'Fransisca Carindri Sandag', 'Sisca', 'Sisca', 'Fransisca_Carindri@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 13, 0, 3, 17, 1, '2016-02-19', 'JCI-0081', 'en', '', 1, 'Africa/Abidjan', '', '', '', ''),
(23, 'Nining ', 'Afsari', 'Nining', 'Nining_Afsari@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 46, 0, 3, 17, 1, '2016-04-01', 'JCI-0082', 'en', '', 1, 'Africa/Abidjan', '', '', '', ''),
(24, 'Rizki Kusumawardani', '', 'Rizki', 'Rizki_Kusumawardhani-temp@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 5, 0, 7, 17, 1, '2016-10-01', 'JCI-0087', 'en', '', 1, '', '', '', '', ''),
(25, 'Ayu Dina Milah', '', 'Ayu', 'Ayu_Dina-temp@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 5, 0, 7, 17, 1, '2016-10-22', 'JCI-0088', 'en', '', 1, '', '', '', '', ''),
(26, 'Kaniyaska Tamara Batubara', 'Batubara', 'Taya', 'Kaniyaska_Batubara@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 2, 17, 1, '2016-11-07', 'JCI-0086', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(27, 'Veronica Kristiani', '', 'Veronica', 'Veronica_Kristiani@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 38, 0, 2, 16, 1, '2016-12-13', 'JCI-0089', 'en', '', 1, '', '', '', '', ''),
(28, 'Fredy Laxmono', '', 'Fredy', 'fredy_laxmono@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 6, 4, 1, '2017-03-27', 'JCI-0093', 'en', '', 1, '', '', '', '', ''),
(29, 'Febiolla Arlita', 'Young', 'Olla', 'F_Arlita_Young@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 2, 16, 1, '2017-04-26', 'JCI-0094', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(30, 'Adeline Agoes', 'Adel', 'Adel', 'Adeline_Agoes@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 4, 0, 2, 16, 1, '2017-06-01', 'JCI-0096', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(31, 'Herlin Maya Sari Lombantoruan', '', 'Maya', 'H_Mayasari_Sihombing@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 15, 0, 2, 16, 1, '2017-10-14', 'JCI-0099', 'en', '', 1, '', '', '', '', ''),
(32, 'Regina Sri Rejeki', '', 'Regina', 'Regina_SRejeki@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 26, 0, 2, 16, 1, '2017-11-01', 'JCI-0101', 'en', '', 1, '', '', '', '', ''),
(33, 'Mega Rudangta Ginting', '', 'Mega', 'Mega_Ginting@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 2, 16, 1, '2018-01-09', 'JCI-0104', 'en', '', 1, '', '', '', '', ''),
(34, 'Christina ', 'Tang', 'Christina', 'tang_Christina@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 2, 10, 1, '2018-01-10', 'JCI-0122', 'en', '', 0, '', '', '', '', ''),
(35, 'Fajar Tri Wahyudi', '', 'Fajar', 'Fajar_T_Wahyudi@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 33, 0, 2, 7, 1, '2018-01-22', 'JCI-0105', 'en', '', 1, '', '', '', '', ''),
(36, 'Ida ', 'Nurul Huda', 'Ida', 'Ida_Nurulhuda@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 7, 0, 7, 16, 1, '2018-02-01', 'JCI-0106', 'en', '', 1, 'Africa/Abidjan', '', '', '', ''),
(37, 'Wulan Anggiet Purnamasari', '', 'WulanP', 'Wulan_Purnamasari@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 5, 13, 1, '2018-07-02', 'JCI-0113', 'en', '', 1, '', '', '', '', ''),
(38, 'Artya Krishnawuri D', 'krishnawuri', 'Tya', 'Artya_Krishnawuri@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 2, 18, 1, '2013-11-29', 'JCI-0036', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(39, 'Diah Sangataningtias', '', 'Diah', 'diah_sangataningtias@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 8, 6, 0, 4, 16, 1, '2018-08-01', 'JCI-0115', 'en', '', 1, '', '', '', '', ''),
(40, 'Lia Rahmawati', 'rahmawati', 'Lia', 'Lia_Rahmawati@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 2, 13, 1, '2018-09-20', 'JCI-0116', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(41, 'Fransisca Asti Hapsari', 'hapsari', 'Asti', 'Fransisca_Asti@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 2, 16, 1, '2018-09-26', 'JCI-0117', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(42, 'Cahyani Prajaningrum', '', 'Caca', 'Cahyani_Prajaningrum@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 2, 13, 1, '2018-10-15', 'JCI-0119', 'en', '', 0, '', '', '', '', ''),
(43, 'Kristanto Sutadi', '', 'Kristanto', 'Kristanto_Sutadi@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 3, 1, 1, '2018-10-15', 'JCI-0120', 'en', '', 1, '', '', '', '', ''),
(45, 'Pradita windy Hatafi', '', 'Dita', 'Pradita_windy@jafra.co.id', '$2a$08$i28l3jIbzzFBo5beKUZmxulKZCVkpV/D9Vov22Qlw/rantiRLfjA.', 2, 37, 0, 5, 16, 1, '2018-10-29', 'JCI-0124', 'en', '', 1, '', '', '', '', ''),
(46, 'Winanda putra', '', 'Nanda', 'Winanda_putra@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 43, 0, 3, 7, 1, '2019-01-28', 'JCI-0127', 'en', '', 1, '', '', '', '', ''),
(47, 'Nopia ', 'Pangestika', 'Nopia', 'Nopia_Pangestika-temp@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 13, 0, 3, 16, 1, '2019-04-04', 'JCI-0128', 'en', '', 1, 'Africa/Abidjan', '', '', '', ''),
(48, 'Imelda Yunitami', '', 'Imelda', 'Imelda_Yunitami@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 9, 0, 2, 16, 1, '2019-05-13', 'JCI-0129', 'en', '', 1, '', '', '', '', ''),
(49, 'L Chometa Halley E', 'halley', 'Meta', 'ChometaHalley_Eprilianty@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, 0, 2, 16, 1, '2019-05-20', 'JCI-0130', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(50, 'Teguh Prasetyo', 'Teguh', 'Teguh', 'Teguh_Prasetyo@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 50, 0, 3, 7, 1, '2019-07-30', 'JCI-0133', 'en', '', 0, 'Africa/Abidjan', '', '', '', ''),
(51, 'Septi Wulandari', '', 'WulanW', 'septi_wulandari@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 26, 0, 2, 16, 1, '2019-08-27', 'JCI-0134', 'en', '', 1, '', '', '', '', ''),
(52, 'Ardiansyah Mahmud Pratama', '', 'Ardi', 'ardiansyahmahmud_pratama@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 8, 0, 2, 7, 1, '2019-08-27', 'JCI-0135', 'en', '', 1, '', '', '', '', ''),
(53, 'Ade Herawan', 'herawan', 'Ade ', 'ade_herawan@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 68, 0, 2, 7, 1, '2019-09-24', 'JCI-0136', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(54, 'Denny', 'Darmawan', 'Denny', 'denny_darmawan@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 28, 0, 6, 7, 1, '2019-10-01', 'JCI-0137', 'en', '', 1, 'Asia/Jakarta', '', '', '', ''),
(55, 'Sarah Rizqi Amaliah', '', 'Sarah', 'Sarah_Risqi-temp@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 37, 0, 5, 16, 1, '2019-10-21', 'JCI-0138', 'en', '', 1, '', '', '', '', ''),
(56, 'Zony', 'LUMANTO', 'Zony', 'Zony_Lumanto@jafra.co.id', '$2a$08$rjNg9znhZT6Z.aSqdoyEsOmvNucY8WLUnoInhiLMJMM8a.AF6iYuW', 2, 8, 0, 2, 7, 1, '2019-11-25', '', 'en', NULL, 1, 'Asia/Jakarta', NULL, 'OFk3tTdyN65VKBTP8r_lIfSM', NULL, NULL),
(57, 'muklis', 'MUKLIS', 'muklis', 'muklis@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 7, 0, 7, 7, 1, '2019-12-01', '', 'en', NULL, 1, 'Asia/Jakarta', NULL, 'DCQgQHc3BMq6dEBMri6MNMwD', NULL, NULL),
(58, 'noverica', 'WIRASMANTI', 'veri', 'noverica_wirasmanti@jafra.co.id', '$2a$08$ARRQK3rFQIDc3YjlicB7D.Ai7u.vXiaysCoblDEa/Ji5.mNMcyDb6', 2, 18, NULL, 2, 16, NULL, '2020-02-03', 'JCI', 'en', NULL, 1, 'Asia/Jakarta', NULL, '3S9DshqBJ_If5yDgQ0i6384W', NULL, NULL),
(59, 'Yudistira Aditya ', 'PRADANA', 'yudis', 'yudistira_pradana@jafra.co.id', '$2a$08$.cJX.zkkKIrQVAKWXcsbKeMiJcsnv66OPVp2v/9QlC9zqTjQu8CTy', 2, 28, NULL, 6, 7, 1, '2020-06-02', 'JCI-0144', 'en', NULL, 1, 'Asia/Jakarta', NULL, 'tTv4jV7fGtJkGhZ7AE7y3eyI', NULL, NULL),
(60, 'Anton', 'KURNIAWAN', 'anton', 'anton_kurniawan@jafra.co.id', '$2a$08$o7VdgTfAx5ZXYjhgDVarCO/J8fU7O8p7xZs.SOA.GBxp.vKcSw6e.', 2, 28, NULL, 6, 7, 1, '2020-07-27', 'JCI-0146', 'en', NULL, 1, 'Asia/Jakarta', NULL, 'MciqT8Qr9oQN03CYfBHl5IEZ', NULL, NULL),
(61, 'Bayu Ruditya', 'RUDITYA', 'bruditya', 'Bayu_Ruditya@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 46, NULL, 3, 7, 1, '2020-10-05', 'JCI-0147', 'en', NULL, 1, 'Asia/Jakarta', NULL, 'BZhnmxbfHFSVNJSoO0CuNlRA', NULL, NULL),
(63, 'Jati ', 'PRASETYO', 'jprasetyo', 'Jatiprasetyoari_wibowo@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 38, NULL, 2, 16, 1, '2021-01-01', 'JCI-0149', 'en', NULL, 1, 'Asia/Jakarta', NULL, 'YTuhtvmDVcy4KG1r4NAHkRgY', NULL, NULL),
(64, 'Wahyu', 'DJATMIKO', 'wdjatmiko', 'Wahyu_Djatmiko@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 33, NULL, 2, 7, 1, '2021-01-01', 'JCI-0150', 'en', NULL, 1, 'Asia/Jakarta', NULL, 'YaNnebzhNFgJSCWBV-qbbbO-', NULL, NULL),
(65, 'Basudewa', 'PRAMUDIA', 'bpramudia', 'Basudewa_Pramudia@Jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 68, NULL, 2, 7, 1, '2020-02-24', 'JCI-0143', 'en', NULL, 1, 'Asia/Jakarta', NULL, 'b4bwVA9AKRPraHeb09j0AGlX', NULL, NULL),
(66, 'meliantha', 'OLIVIA', 'molivia', 'meliatha_olivia@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, NULL, 2, 16, 1, '2021-04-19', 'JCI-0151', 'en', NULL, 1, 'Asia/Jakarta', NULL, 'jij0yz2m2MbgvBbNSIuHnsj0', NULL, NULL),
(67, 'Dedy', 'PRIYATNA', 'dpriyatna', 'dedy_priyatna@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 28, NULL, 6, 7, 1, '2021-08-12', 'JCI-0152', 'en', NULL, 1, 'Asia/Jakarta', NULL, 'htjjGtlccFUFhUogGmdoFx6V', NULL, NULL),
(68, 'Agung', 'WIBOWO', 'awibowo', 'agung_wibowo@jafra.co.id', '$2a$08$nrTGKO3tCscW/Tfmsmno..Kz2SxOuU7x7MPEw4jr1YcK0P1ytzUSi', 2, 18, NULL, 2, 7, 1, '2021-09-20', 'JCI-0153', 'en', NULL, 1, 'Asia/Jakarta', NULL, 'UpKkthpbfEYvPhdv6EQDg1ck', NULL, NULL),
(69, 'retno', 'MAYASARI', 'rmayasari', 'retno_mayasari@jafra.co.id', '$2a$08$ufyiT8niGS2Oh.vpxaavXOUfuPDv9NPPm3rRJik9Dxb.eocN9eeFi', 2, 18, NULL, 2, 13, 1, '2021-10-04', 'JCI-0154', 'en', NULL, 1, 'Asia/Jakarta', NULL, 'QYwtw-KktiD-qnI-Vf4emyNx', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manager` (`manager`),
  ADD KEY `organization` (`organization`),
  ADD KEY `contract` (`contract`),
  ADD KEY `position` (`position`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the user', AUTO_INCREMENT=70;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
