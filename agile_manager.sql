-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2018 at 10:44 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agile_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `backlogs`
--

CREATE TABLE `backlogs` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `log` varchar(10000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `backlogs`
--

INSERT INTO `backlogs` (`id`, `project_id`, `log`, `created_at`, `updated_at`) VALUES
(1, 6, 'Task 3 (Task) status changed to Doing', '2018-12-13 16:16:14', '2018-12-13 16:16:14'),
(2, 6, 'Task 2 (Task) status changed to Done', '2018-12-13 16:16:25', '2018-12-13 16:16:25'),
(3, 6, 'Task 2 (Task) status changed to Doing', '2018-12-13 16:16:34', '2018-12-13 16:16:34'),
(4, 6, 'Task 2 (Task) status changed to Pending', '2018-12-13 16:16:37', '2018-12-13 16:16:37'),
(5, 6, 'Team Member added', '2018-12-13 16:33:50', '2018-12-13 16:33:50'),
(6, 6, 'Project updated', '2018-12-13 16:34:40', '2018-12-13 16:34:40'),
(7, 6, 'Nash Brewer (Task) created', '2018-12-13 16:35:58', '2018-12-13 16:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `checkins`
--

CREATE TABLE `checkins` (
  `id` int(11) NOT NULL,
  `sprint_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checkins`
--

INSERT INTO `checkins` (`id`, `sprint_id`, `name`, `created_at`, `updated_at`) VALUES
(2, 2, 'First Meeting', '2018-12-13 18:28:27', '2018-12-13 18:28:27'),
(3, 2, 'Second Meeting', '2018-12-13 18:28:51', '2018-12-13 18:28:51'),
(4, 2, 'Steel Mccarty', '2018-12-14 01:36:32', '2018-12-14 01:36:32');

-- --------------------------------------------------------

--
-- Table structure for table `contributors`
--

CREATE TABLE `contributors` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contributors`
--

INSERT INTO `contributors` (`id`, `project_id`, `user_id`, `role`, `created_at`, `updated_at`) VALUES
(3, 6, 23, 'Team Member', '2018-11-24 16:36:47', '2018-11-24 16:36:47'),
(4, 6, 24, 'Product Manager', '2018-11-24 16:38:05', '2018-11-24 16:38:05'),
(5, 6, 25, 'Scrum Master', '2018-11-24 16:38:52', '2018-11-24 16:38:52'),
(7, 6, 21, 'Project Manager', '2018-12-13 20:55:30', '2018-12-13 20:55:30'),
(8, 6, 26, 'Team Member', '2018-12-13 16:33:50', '2018-12-13 16:33:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('mehedi.iitdu@gmail.com', '$2y$10$WM.7GeUsSAAvOpYNJspaquJCjKbwwiGNNycYmtCmK6ECDbVCPrNga', '2018-09-27 02:49:55');

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` int(11) NOT NULL,
  `checkin_id` int(11) NOT NULL,
  `contributor_id` int(11) NOT NULL,
  `a` int(11) NOT NULL,
  `b` int(11) NOT NULL,
  `c` int(11) NOT NULL,
  `d` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `checkin_id`, `contributor_id`, `a`, `b`, `c`, `d`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 2, 0, 3, 1, '2018-12-13 18:28:28', '2018-12-13 18:28:28'),
(2, 2, 4, 0, 2, 0, 0, '2018-12-13 18:28:28', '2018-12-13 18:28:28'),
(3, 2, 5, 0, 2, 0, 0, '2018-12-13 18:28:28', '2018-12-13 18:28:28'),
(4, 2, 7, 2, 1, 2, 1, '2018-12-13 18:28:28', '2018-12-13 18:28:28'),
(5, 2, 8, 3, 3, 0, 0, '2018-12-13 18:28:28', '2018-12-13 18:28:28'),
(6, 3, 3, 2, 0, 3, 1, '2018-12-13 18:28:51', '2018-12-13 18:28:51'),
(7, 3, 4, 0, 2, 0, 0, '2018-12-13 18:28:51', '2018-12-13 18:28:51'),
(8, 3, 5, 0, 2, 0, 0, '2018-12-13 18:28:51', '2018-12-13 18:28:51'),
(9, 3, 7, 2, 1, 2, 1, '2018-12-13 18:28:51', '2018-12-13 18:28:51'),
(10, 3, 8, 3, 3, 0, 0, '2018-12-13 18:28:51', '2018-12-13 18:28:51'),
(11, 4, 3, 1, 0, 0, 0, '2018-12-14 01:36:32', '2018-12-14 01:36:32'),
(12, 4, 4, 2, 1, 2, 1, '2018-12-14 01:36:32', '2018-12-14 01:36:32'),
(13, 4, 5, 1, 1, 0, 3, '2018-12-14 01:36:32', '2018-12-14 01:36:32'),
(14, 4, 7, 3, 2, 3, 1, '2018-12-14 01:36:32', '2018-12-14 01:36:32'),
(15, 4, 8, 2, 2, 1, 1, '2018-12-14 01:36:33', '2018-12-14 01:36:33');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_manager_id` int(11) DEFAULT NULL,
  `scrum_master_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `start_date` int(20) NOT NULL,
  `end_date` int(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `user_id`, `product_manager_id`, `scrum_master_id`, `name`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(6, 21, NULL, NULL, 'Agile manager', '<p>A web-based project management tool based on agile methodology.</p>', 1543104000, 1543104000, '2018-11-24 16:30:55', '2018-12-13 16:34:40');

-- --------------------------------------------------------

--
-- Table structure for table `sprints`
--

CREATE TABLE `sprints` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `story_ids` varchar(1000) NOT NULL,
  `start_date` int(20) NOT NULL,
  `end_date` int(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sprints`
--

INSERT INTO `sprints` (`id`, `project_id`, `story_ids`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(2, 6, '[\"1\",\"2\"]', 1544745600, 1546945600, 'Pending', '2018-12-13 13:21:04', '2018-12-13 13:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `start_date` int(20) DEFAULT NULL,
  `end_date` int(20) NOT NULL,
  `priority` int(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`id`, `project_id`, `start_date`, `end_date`, `priority`, `name`, `created_at`, `updated_at`) VALUES
(1, 6, 1543017600, 1543449600, 3, 'Story 1', '2018-11-23 13:38:35', '2018-11-23 13:38:35'),
(2, 6, 1543017600, 1543363200, 3, 'Story 2', '2018-11-23 13:57:15', '2018-11-23 13:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `story_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `weight` int(2) NOT NULL,
  `start_date` int(20) NOT NULL,
  `end_date` int(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  `time` int(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `story_id`, `user_id`, `name`, `description`, `weight`, `start_date`, `end_date`, `status`, `time`, `created_at`, `updated_at`) VALUES
(1, 1, 20, 'Task 1', '<div class=\"PNlCoe XpoqFe\" style=\"font-size: small; color: rgb(34, 34, 34); font-family: arial, sans-serif; margin-left: -20px;\"><div data-dobid=\"dfn\" style=\"display: inline;\">a person or thing that contributes something, in particular.</div></div><div style=\"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; margin-left: -32px;\"><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px;\"><li class=\"vmod\" style=\"margin: 0px; padding: 0px; border: 0px; list-style: none;\"><div class=\"lr_dct_sf_subsen\" style=\"display: list-item; list-style-type: disc; font-size: xx-small; margin-left: 25px; padding-top: 5px;\"><div class=\"PNlCoe XpoqFe\" style=\"font-size: small;\"><div data-dobid=\"dfn\" style=\"display: inline;\">a person who writes articles for a magazine or newspaper.</div><div class=\"vk_gy\" style=\"color: rgb(135, 135, 135) !important;\">noun:&nbsp;<b>contributor</b>; plural noun:&nbsp;<b>contributors</b></div><span class=\"vmod\"><div class=\"vk_gy\" style=\"color: rgb(135, 135, 135) !important;\">\"he became a regular&nbsp;<b>contributor to</b>&nbsp;the magazine\"</div></span><div class=\"vmod\"><table class=\"vk_tbl vk_gy\" style=\"color: rgb(135, 135, 135) !important;\"><tbody><tr><td class=\"lr_dct_nyms_ttl\" style=\"font-style: italic; vertical-align: top; white-space: nowrap; padding-right: 3px;\">synonyms:</td><td><span class=\"SDZsVb\" data-term-for-update=\"writer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQCw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">writer</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"feature writer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQDA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">feature writer</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"columnist\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQDQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">columnist</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"correspondent\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQDg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">correspondent</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"reporter\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQDw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">reporter</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"journalist\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQEA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">journalist</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"penman\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQEQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">penman</span>;&nbsp;<span data-log-string=\"synonyms-more-click\" jsaction=\"dob.m\"><span class=\"lr_dct_more_btn\" style=\"cursor: pointer; color: rgb(26, 13, 171); margin-left: 4px;\">More</span><div style=\"display: inline;\"><div style=\"display: inline;\"><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><span class=\"SDZsVb\" data-term-for-update=\"critic\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQEw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"reviewer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQFA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><span class=\"SDZsVb\" data-term-for-update=\"freelancer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQFQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"freelance\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQFg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><i style=\"padding-right: 4px;\"></i><span class=\"SDZsVb\" data-term-for-update=\"journo\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQFw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"pen-pusher\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQGA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"hack\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQGQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"hackette\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQGg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"scribbler\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQGw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><div class=\"vk_gy\"></div></div></div></div></span></td></tr></tbody></table></div></div></div></li><li class=\"vmod\" style=\"margin: 0px; padding: 0px; border: 0px; list-style: none;\"><div class=\"lr_dct_sf_subsen\" style=\"display: list-item; list-style-type: disc; font-size: xx-small; margin-left: 25px; padding-top: 5px;\"><div class=\"PNlCoe XpoqFe\" style=\"font-size: small;\"><div data-dobid=\"dfn\" style=\"display: inline;\">a person who donates to a cause.</div><span class=\"vmod\"><div class=\"vk_gy\" style=\"color: rgb(135, 135, 135) !important;\">\"Saudi Arabia was the biggest contributor of war costs\"</div></span><div class=\"vmod\"><table class=\"vk_tbl vk_gy\" style=\"color: rgb(135, 135, 135) !important;\"><tbody><tr><td class=\"lr_dct_nyms_ttl\" style=\"font-style: italic; vertical-align: top; white-space: nowrap; padding-right: 3px;\">synonyms:</td><td><span class=\"SDZsVb\" data-term-for-update=\"donor\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQHQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">donor</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"benefactor\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQHg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">benefactor</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"benefactress\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQHw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">benefactress</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"giver\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQIA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">giver</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"subscriber\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQIQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">subscriber</span>;&nbsp;<span data-log-string=\"synonyms-more-click\" jsaction=\"dob.m\"><span class=\"lr_dct_more_btn\" style=\"cursor: pointer; color: rgb(26, 13, 171); margin-left: 4px;\">More</span><div style=\"display: inline;\"><div style=\"display: inline;\"><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><span class=\"SDZsVb\" data-term-for-update=\"supporter\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQIw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"backer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQJA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"patron\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQJQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"sponsor\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQJg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><span class=\"SDZsVb\" data-term-for-update=\"philanthropist\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQJw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><i style=\"padding-right: 4px;\"></i><span class=\"SDZsVb\" data-term-for-update=\"angel\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQKA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><i style=\"padding-right: 4px;\"></i><span class=\"SDZsVb\" data-term-for-update=\"philanthrope\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQKQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><div class=\"vk_gy\"></div></div></div></div></span></td></tr></tbody></table></div></div></div></li></ul></div>', 3, 1543017600, 1543104000, 'Done', 1543097600, '2018-11-23 16:52:34', '2018-12-13 15:48:09'),
(2, 1, 20, 'Task 2', '<div class=\"PNlCoe XpoqFe\" style=\"font-size: small; color: rgb(34, 34, 34); font-family: arial, sans-serif; margin-left: -20px;\"><div data-dobid=\"dfn\" style=\"display: inline;\">a person or thing that contributes something, in particular.</div></div><div style=\"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; margin-left: -32px;\"><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px;\"><li class=\"vmod\" style=\"margin: 0px; padding: 0px; border: 0px; list-style: none;\"><div class=\"lr_dct_sf_subsen\" style=\"display: list-item; list-style-type: disc; font-size: xx-small; margin-left: 25px; padding-top: 5px;\"><div class=\"PNlCoe XpoqFe\" style=\"font-size: small;\"><div data-dobid=\"dfn\" style=\"display: inline;\">a person who writes articles for a magazine or newspaper.</div><div class=\"vk_gy\" style=\"color: rgb(135, 135, 135) !important;\">noun:&nbsp;<b>contributor</b>; plural noun:&nbsp;<b>contributors</b></div><span class=\"vmod\"><div class=\"vk_gy\" style=\"color: rgb(135, 135, 135) !important;\">\"he became a regular&nbsp;<b>contributor to</b>&nbsp;the magazine\"</div></span><div class=\"vmod\"><table class=\"vk_tbl vk_gy\" style=\"color: rgb(135, 135, 135) !important;\"><tbody><tr><td class=\"lr_dct_nyms_ttl\" style=\"font-style: italic; vertical-align: top; white-space: nowrap; padding-right: 3px;\">synonyms:</td><td><span class=\"SDZsVb\" data-term-for-update=\"writer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQCw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">writer</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"feature writer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQDA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">feature writer</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"columnist\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQDQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">columnist</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"correspondent\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQDg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">correspondent</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"reporter\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQDw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">reporter</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"journalist\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQEA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">journalist</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"penman\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQEQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">penman</span>;&nbsp;<span data-log-string=\"synonyms-more-click\" jsaction=\"dob.m\"><span class=\"lr_dct_more_btn\" style=\"cursor: pointer; color: rgb(26, 13, 171); margin-left: 4px;\">More</span><div style=\"display: inline;\"><div style=\"display: inline;\"><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><span class=\"SDZsVb\" data-term-for-update=\"critic\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQEw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"reviewer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQFA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><span class=\"SDZsVb\" data-term-for-update=\"freelancer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQFQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"freelance\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQFg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><i style=\"padding-right: 4px;\"></i><span class=\"SDZsVb\" data-term-for-update=\"journo\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQFw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"pen-pusher\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQGA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"hack\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQGQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"hackette\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQGg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"scribbler\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQGw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><div class=\"vk_gy\"></div></div></div></div></span></td></tr></tbody></table></div></div></div></li><li class=\"vmod\" style=\"margin: 0px; padding: 0px; border: 0px; list-style: none;\"><div class=\"lr_dct_sf_subsen\" style=\"display: list-item; list-style-type: disc; font-size: xx-small; margin-left: 25px; padding-top: 5px;\"><div class=\"PNlCoe XpoqFe\" style=\"font-size: small;\"><div data-dobid=\"dfn\" style=\"display: inline;\">a person who donates to a cause.</div><span class=\"vmod\"><div class=\"vk_gy\" style=\"color: rgb(135, 135, 135) !important;\">\"Saudi Arabia was the biggest contributor of war costs\"</div></span><div class=\"vmod\"><table class=\"vk_tbl vk_gy\" style=\"color: rgb(135, 135, 135) !important;\"><tbody><tr><td class=\"lr_dct_nyms_ttl\" style=\"font-style: italic; vertical-align: top; white-space: nowrap; padding-right: 3px;\">synonyms:</td><td><span class=\"SDZsVb\" data-term-for-update=\"donor\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQHQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">donor</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"benefactor\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQHg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">benefactor</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"benefactress\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQHw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">benefactress</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"giver\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQIA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">giver</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"subscriber\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQIQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">subscriber</span>;&nbsp;<span data-log-string=\"synonyms-more-click\" jsaction=\"dob.m\"><span class=\"lr_dct_more_btn\" style=\"cursor: pointer; color: rgb(26, 13, 171); margin-left: 4px;\">More</span><div style=\"display: inline;\"><div style=\"display: inline;\"><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><span class=\"SDZsVb\" data-term-for-update=\"supporter\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQIw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"backer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQJA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"patron\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQJQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"sponsor\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQJg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><span class=\"SDZsVb\" data-term-for-update=\"philanthropist\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQJw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><i style=\"padding-right: 4px;\"></i><span class=\"SDZsVb\" data-term-for-update=\"angel\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQKA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><i style=\"padding-right: 4px;\"></i><span class=\"SDZsVb\" data-term-for-update=\"philanthrope\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQKQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><div class=\"vk_gy\"></div></div></div></div></span></td></tr></tbody></table></div></div></div></li></ul></div>', 3, 1543017600, 1543104000, 'Pending', 1543017600, '2018-11-22 16:53:15', '2018-12-13 16:16:37'),
(3, 2, 20, 'Task 3', '<div class=\"PNlCoe XpoqFe\" style=\"font-size: small; color: rgb(34, 34, 34); font-family: arial, sans-serif; margin-left: -20px;\"><div data-dobid=\"dfn\" style=\"display: inline;\">a person or thing that contributes something, in particular.</div></div><div style=\"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; margin-left: -32px;\"><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px;\"><li class=\"vmod\" style=\"margin: 0px; padding: 0px; border: 0px; list-style: none;\"><div class=\"lr_dct_sf_subsen\" style=\"display: list-item; list-style-type: disc; font-size: xx-small; margin-left: 25px; padding-top: 5px;\"><div class=\"PNlCoe XpoqFe\" style=\"font-size: small;\"><div data-dobid=\"dfn\" style=\"display: inline;\">a person who writes articles for a magazine or newspaper.</div><div class=\"vk_gy\" style=\"color: rgb(135, 135, 135) !important;\">noun:&nbsp;<b>contributor</b>; plural noun:&nbsp;<b>contributors</b></div><span class=\"vmod\"><div class=\"vk_gy\" style=\"color: rgb(135, 135, 135) !important;\">\"he became a regular&nbsp;<b>contributor to</b>&nbsp;the magazine\"</div></span><div class=\"vmod\"><table class=\"vk_tbl vk_gy\" style=\"color: rgb(135, 135, 135) !important;\"><tbody><tr><td class=\"lr_dct_nyms_ttl\" style=\"font-style: italic; vertical-align: top; white-space: nowrap; padding-right: 3px;\">synonyms:</td><td><span class=\"SDZsVb\" data-term-for-update=\"writer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQCw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">writer</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"feature writer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQDA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">feature writer</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"columnist\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQDQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">columnist</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"correspondent\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQDg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">correspondent</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"reporter\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQDw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">reporter</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"journalist\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQEA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">journalist</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"penman\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQEQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">penman</span>;&nbsp;<span data-log-string=\"synonyms-more-click\" jsaction=\"dob.m\"><span class=\"lr_dct_more_btn\" style=\"cursor: pointer; color: rgb(26, 13, 171); margin-left: 4px;\">More</span><div style=\"display: inline;\"><div style=\"display: inline;\"><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><span class=\"SDZsVb\" data-term-for-update=\"critic\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQEw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"reviewer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQFA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><span class=\"SDZsVb\" data-term-for-update=\"freelancer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQFQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"freelance\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQFg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><i style=\"padding-right: 4px;\"></i><span class=\"SDZsVb\" data-term-for-update=\"journo\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQFw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"pen-pusher\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQGA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"hack\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQGQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"hackette\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQGg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"scribbler\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQGw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><div class=\"vk_gy\"></div></div></div></div></span></td></tr></tbody></table></div></div></div></li><li class=\"vmod\" style=\"margin: 0px; padding: 0px; border: 0px; list-style: none;\"><div class=\"lr_dct_sf_subsen\" style=\"display: list-item; list-style-type: disc; font-size: xx-small; margin-left: 25px; padding-top: 5px;\"><div class=\"PNlCoe XpoqFe\" style=\"font-size: small;\"><div data-dobid=\"dfn\" style=\"display: inline;\">a person who donates to a cause.</div><span class=\"vmod\"><div class=\"vk_gy\" style=\"color: rgb(135, 135, 135) !important;\">\"Saudi Arabia was the biggest contributor of war costs\"</div></span><div class=\"vmod\"><table class=\"vk_tbl vk_gy\" style=\"color: rgb(135, 135, 135) !important;\"><tbody><tr><td class=\"lr_dct_nyms_ttl\" style=\"font-style: italic; vertical-align: top; white-space: nowrap; padding-right: 3px;\">synonyms:</td><td><span class=\"SDZsVb\" data-term-for-update=\"donor\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQHQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">donor</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"benefactor\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQHg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">benefactor</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"benefactress\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQHw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">benefactress</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"giver\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQIA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">giver</span>,&nbsp;<span class=\"SDZsVb\" data-term-for-update=\"subscriber\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQIQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\">subscriber</span>;&nbsp;<span data-log-string=\"synonyms-more-click\" jsaction=\"dob.m\"><span class=\"lr_dct_more_btn\" style=\"cursor: pointer; color: rgb(26, 13, 171); margin-left: 4px;\">More</span><div style=\"display: inline;\"><div style=\"display: inline;\"><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><span class=\"SDZsVb\" data-term-for-update=\"supporter\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQIw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"backer\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQJA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"patron\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQJQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span><span class=\"SDZsVb\" data-term-for-update=\"sponsor\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQJg\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><span class=\"SDZsVb\" data-term-for-update=\"philanthropist\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQJw\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><i style=\"padding-right: 4px;\"></i><span class=\"SDZsVb\" data-term-for-update=\"angel\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQKA\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><i style=\"padding-right: 4px;\"></i><span class=\"SDZsVb\" data-term-for-update=\"philanthrope\" role=\"link\" tabindex=\"0\" jsaction=\"dob.uwt\" data-ved=\"2ahUKEwi15-zJxuveAhXMOo8KHXj-DSsQ_SowAHoECAQQKQ\" style=\"cursor: pointer; color: rgb(26, 13, 171);\"></span></div><div class=\"lr_dct_more_txt xpdxpnd xpdnoxpnd\" data-mh=\"-1\" aria-hidden=\"true\" style=\"overflow: hidden; transition: max-height 0.3s ease 0s; max-height: 0px;\"><div class=\"vk_gy\"></div></div></div></div></span></td></tr></tbody></table></div></div></div></li></ul></div>', 3, 1543017600, 1543104000, 'Doing', 1549017600, '2018-11-23 16:53:46', '2018-12-13 16:16:12'),
(4, 1, 26, 'Nash Brewer', '<p>hfowhff</p>', 2, 1519948800, 1525996800, 'Pending', 1543017600, '2018-12-13 16:35:58', '2018-12-13 16:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_original` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `provider_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `avatar`, `avatar_original`, `address`, `country`, `city`, `postal_code`, `phone`, `created_at`, `updated_at`) VALUES
(17, '113510401900359638362', '0736', '0736.iitdu@gmail.com', NULL, '$2y$10$gvCDdhUvi/0N0cKo3pWrdOyx46qzfOLCJ/6D8TkADgChDEDlI7RHm', '7n4RLvRhkW4S08Jg1UcW6gKkEFjMS7Uws9OJpiT2l3AUYcJr8q2Bt0AgAUd2', '', '', NULL, NULL, NULL, NULL, NULL, '2018-11-01 04:52:33', '2018-11-01 04:52:33'),
(18, '103887660140114486052', 'Md. Rajiur Rahman', 'bsse0626@iit.du.ac.bd', NULL, '$2y$10$gvCDdhUvi/0N0cKo3pWrdOyx46qzfOLCJ/6D8TkADgChDEDlI7RHm', 'SdmLvlvNFVgfxJdzHOLOEdHsZURVNrN3ljnfXNLDj62qbePFe62gyfbBVY68', '', '', NULL, NULL, NULL, NULL, NULL, '2018-11-07 05:20:57', '2018-11-07 05:20:57'),
(20, NULL, 'rajiur', 'rajiur@gmail.com', NULL, '$2y$10$gfOPXCzCf14CKHetB4q0yOKdpy/oBaawS8Jed7kvPqu0SSt0JgfcS', 'vuvUzwYSRpBlqNaPccste8hX64zLAFyXzA3T3LNzyGuaFyqfJ3Q5TZxyBmEu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-23 16:40:01', '2018-11-23 16:40:01'),
(21, NULL, 'Ayon', 'ayon@gmail.com', NULL, '$2y$10$aiY97ITlz04FWkWCPf3Dk.lko8QVbYXkS4xAF8Md0JF4VKEaYEppy', 'dqjbBbn0FdSUz78MyffkROqIFQBNsTdKlZI3QhnMV1V8JPWtUbSldAImnljz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-23 16:41:55', '2018-11-23 16:41:55'),
(23, NULL, '0702', '0702iitdu@gmail.com', NULL, '$2y$10$PzGEa9owRW/c0HlfslLUjO6HN/1WxcEGtIWIzZ4DtwoVIdO1IpkoO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-24 16:36:46', '2018-11-24 16:36:46'),
(24, NULL, '736', '736.iitdu@gmail.com', NULL, '$2y$10$.Ui12bSFRf257I6JC/gHK.WQl7uz1U00HncMgnVDo39OqJ1wuA.iC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-24 16:38:05', '2018-11-24 16:38:05'),
(25, NULL, '735', '735@gmail.com', NULL, '$2y$10$3xP.aLpO3Kuy2TccFrXM7OWnoY05T2QmNheqShs0pWW1jLFwDMzc.', 'IrDopfGwQGbcSMJVYbG5zYjOpT52GW5DjcAoric6xBs890SAT6Vso59U0khs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-24 16:38:52', '2018-11-24 16:38:52'),
(26, NULL, 'new1', 'new1@gmail.com', NULL, '$2y$10$bWwMIcJ1lWEWvd4tQUkytuvW0D9XLrNy/S1XQS6gn/Q4qpluAGw4e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-13 16:33:50', '2018-12-13 16:33:50'),
(27, NULL, 'Project Manager', 'pm@gmail.com', NULL, '$2y$10$K0g87azpSLgXypdhHJDvNOuqMonUiOUPd1W5bBYzSTC6la0YJ0wpy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-14 03:41:50', '2018-12-14 03:41:50'),
(28, NULL, 'Project Manager', 'pm2@gmail.com', NULL, '$2y$10$G.pfyuDi3YUoQ6RGo3cd3et0jFnBaTv08f4j1yu2.1NB8IETaayC.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-14 03:42:46', '2018-12-14 03:42:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backlogs`
--
ALTER TABLE `backlogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkins`
--
ALTER TABLE `checkins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contributors`
--
ALTER TABLE `contributors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sprints`
--
ALTER TABLE `sprints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backlogs`
--
ALTER TABLE `backlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `checkins`
--
ALTER TABLE `checkins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contributors`
--
ALTER TABLE `contributors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sprints`
--
ALTER TABLE `sprints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
