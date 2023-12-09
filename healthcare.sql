-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 25, 2023 at 10:27 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `healthcare_data`
--

DROP TABLE IF EXISTS `healthcare_data`;
CREATE TABLE IF NOT EXISTS `healthcare_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `health_history` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `healthcare_data`
--

INSERT INTO `healthcare_data` (`id`, `first_name`, `last_name`, `gender`, `age`, `weight`, `height`, `health_history`) VALUES
(1, 'John', 'Doe', 1, 30, 70.5, 175.2, 'No significant health issues'),
(2, 'Jane', 'Smith', 0, 25, 62, 162.5, 'Allergic to peanuts'),
(3, 'Bob', 'Johnson', 1, 45, 80.3, 180, 'High blood pressure'),
(4, 'Alice', 'Williams', 0, 28, 55.8, 160, 'Regular exercise'),
(5, 'Michael', 'Davis', 1, 35, 68.2, 178.5, 'Vegan diet'),
(6, 'Sara', 'Brown', 0, 32, 65.5, 168, 'Asthma'),
(7, 'David', 'Jones', 1, 50, 90, 185, 'Diabetes'),
(8, 'Emily', 'Miller', 0, 22, 50, 155, 'None'),
(9, 'Daniel', 'White', 1, 40, 75.5, 170, 'No health issues'),
(10, 'Emma', 'Anderson', 0, 29, 58.7, 163.5, 'Migraines'),
(11, 'Andrew', 'Harris', 1, 38, 78.1, 177.8, 'Seasonal allergies'),
(12, 'Olivia', 'Wilson', 0, 27, 54.3, 159, 'Vegetarian diet'),
(13, 'Matthew', 'Moore', 1, 42, 82.4, 182.3, 'Back pain'),
(14, 'Grace', 'Taylor', 0, 31, 60, 165, 'Gluten intolerance'),
(15, 'Ethan', 'Martin', 1, 33, 73.8, 176.5, 'No health issues'),
(16, 'Chloe', 'Thomas', 0, 26, 57.2, 158, 'Insomnia'),
(17, 'Aiden', 'Hall', 1, 48, 88.7, 188, 'Hypertension'),
(18, 'Sophia', 'Young', 0, 30, 59.5, 161, 'Allergic to cats'),
(19, 'Jackson', 'Evans', 1, 36, 72, 174.5, 'No health issues'),
(20, 'Abigail', 'Brown', 0, 24, 53, 157, 'Asthma'),
(21, 'Logan', 'Baker', 1, 39, 76.6, 179, 'No health issues'),
(22, 'Mia', 'Collins', 0, 23, 51.5, 154, 'Vegan diet'),
(23, 'Lucas', 'Barnes', 1, 44, 84.2, 183, 'No health issues'),
(24, 'Lily', 'Ward', 0, 34, 67.7, 172, 'Anxiety'),
(25, 'Caleb', 'Fisher', 1, 37, 74.5, 175.5, 'No health issues'),
(26, 'Isabella', 'Carter', 0, 21, 48.5, 152, 'No health issues'),
(27, 'Wyatt', 'Perry', 1, 41, 79.3, 181, 'No health issues'),
(28, 'Ella', 'Mitchell', 0, 28, 56.8, 160.5, 'Lactose intolerant'),
(29, 'Henry', 'Wright', 1, 43, 83, 184, 'No health issues'),
(30, 'Avery', 'Sanders', 0, 22, 49.2, 155.5, 'No health issues'),
(31, 'Gabriel', 'Brooks', 1, 45, 81, 179.5, 'No health issues'),
(32, 'Scarlett', 'Long', 0, 29, 58, 164, 'No health issues'),
(33, 'Owen', 'Reed', 1, 46, 85.5, 185.5, 'No health issues'),
(34, 'Hannah', 'Foster', 0, 30, 60.3, 166, 'No health issues'),
(35, 'Liam', 'Watson', 1, 47, 87.2, 187, 'No health issues'),
(36, 'Aria', 'Bailey', 0, 25, 61, 161.5, 'No health issues'),
(37, 'Jackson', 'Bryant', 1, 38, 77.2, 176.8, 'No health issues'),
(38, 'Mila', 'Fisher', 0, 27, 55.5, 159.5, 'No health issues'),
(39, 'Lucas', 'Jordan', 1, 48, 88, 188.5, 'No health issues'),
(40, 'Grace', 'Russell', 0, 31, 59.8, 162, 'No health issues'),
(41, 'Landon', 'Ferguson', 1, 39, 76, 177.3, 'No health issues'),
(42, 'Zoe', 'Ray', 0, 26, 57.8, 160.8, 'No health issues'),
(43, 'Carter', 'Patterson', 1, 49, 89.5, 189, 'No health issues'),
(44, 'Penelope', 'Hill', 0, 32, 64, 167.5, 'No health issues'),
(45, 'Aiden', 'Murray', 1, 40, 77.5, 178, 'No health issues'),
(46, 'Luna', 'Wells', 0, 28, 56.5, 161, 'No health issues'),
(47, 'Grayson', 'Richardson', 1, 50, 90.5, 190, 'No health issues'),
(48, 'Brooklyn', 'Ford', 0, 33, 66.2, 169, 'No health issues'),
(49, 'Leo', 'Harrison', 1, 41, 78, 179.8, 'No health issues'),
(50, 'Stella', 'Fletcher', 0, 29, 58.5, 165.5, 'No health issues'),
(51, 'Jack', 'Coleman', 1, 42, 79.8, 181.5, 'No health issues'),
(52, 'Layla', 'Perkins', 0, 30, 60.8, 166.5, 'No health issues'),
(53, 'Daniel', 'Fleming', 1, 43, 80.5, 182, 'No health issues'),
(54, 'Nora', 'Stewart', 0, 31, 61.5, 163, 'No health issues'),
(55, 'Matthew', 'Walters', 1, 44, 82, 183.5, 'No health issues'),
(56, 'Emma', 'Harper', 0, 32, 63, 168.5, 'No health issues'),
(57, 'Owen', 'Mason', 1, 45, 83.5, 184, 'No health issues'),
(58, 'Ava', 'Cunningham', 0, 33, 64.5, 169.5, 'No health issues'),
(59, 'Oliver', 'Webb', 1, 46, 84.8, 185.5, 'No health issues'),
(60, 'Sophie', 'Bishop', 0, 34, 66, 170, 'No health issues'),
(61, 'Lucas', 'Barnes', 1, 47, 86.2, 186, 'No health issues'),
(62, 'Aria', 'Morrison', 0, 35, 67.5, 171, 'No health issues'),
(63, 'Ethan', 'Richards', 1, 48, 87.5, 187.5, 'No health issues'),
(64, 'Chloe', 'Turner', 0, 36, 68, 172.5, 'No health issues'),
(65, 'Logan', 'Cole', 1, 49, 88.8, 188.5, 'No health issues'),
(66, 'Avery', 'Perry', 0, 37, 69.2, 173, 'No health issues'),
(67, 'Jackson', 'Floyd', 1, 50, 89, 189.5, 'No health issues');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_group` enum('H','R') NOT NULL DEFAULT 'R',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `user_group`) VALUES
(3, 'don', '6836be60387dc8b9a0f1a3607bdbfa6d581caa8489f947867e5e43166a2e60b2', 'R'),
(4, 'admin', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'H');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
