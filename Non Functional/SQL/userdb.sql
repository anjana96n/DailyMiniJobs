-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2022 at 10:27 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `userdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(20) NOT NULL,
  `posted_by` int(50) NOT NULL,
  `posted_date` date NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `posted_by`, `posted_date`, `price`) VALUES
(1, 1, '2022-01-09', 1000),
(2, 3, '2022-01-09', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `j_category`
--

CREATE TABLE `j_category` (
  `job_id` int(50) NOT NULL,
  `job_category` int(50) NOT NULL,
  `job_description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `j_category`
--

INSERT INTO `j_category` (`job_id`, `job_category`, `job_description`) VALUES
(1, 0, 'paint a wall'),
(2, 0, 'rapair');

-- --------------------------------------------------------

--
-- Table structure for table `j_complete`
--

CREATE TABLE `j_complete` (
  `job_id` int(50) NOT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `completed_by` int(20) NOT NULL,
  `is_processing` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `j_complete`
--

INSERT INTO `j_complete` (`job_id`, `is_completed`, `completed_by`, `is_processing`) VALUES
(1, 0, 0, 0),
(2, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `j_location`
--

CREATE TABLE `j_location` (
  `job_id` int(50) NOT NULL,
  `job_location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `j_location`
--

INSERT INTO `j_location` (`job_id`, `job_location`) VALUES
(1, 'Badulla'),
(2, 'Galle');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `user_id` int(50) NOT NULL,
  `skill1` varchar(50) NOT NULL,
  `experience_level1` tinyint(5) NOT NULL,
  `skill2` varchar(50) NOT NULL,
  `experience_level2` tinyint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(50) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `mobile_number` int(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `location` varchar(20) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `birthday` date NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `mobile_number`, `password`, `location`, `last_login`, `birthday`, `is_deleted`) VALUES
(1, 'Anjana', 'Nuwansiri ', 775570701, '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Bandarawela', '2022-01-26 23:10:44.000000', '2022-01-08', 0),
(2, 'Asanka', 'pradeep', 771234567, '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Rathnapura', '2022-01-08 21:26:04.000000', '2022-01-08', 0),
(3, 'Asanka ', 'pradeep', 771111111, '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Rathnapura', '2022-01-09 12:20:35.000000', '2022-01-09', 0),
(4, 'Sumesh', 'Akalanka', 772222222, '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Nuwaraeliya', '2022-01-09 13:35:28.000000', '2022-01-09', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `posted_by` (`posted_by`);

--
-- Indexes for table `j_category`
--
ALTER TABLE `j_category`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `j_complete`
--
ALTER TABLE `j_complete`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `j_location`
--
ALTER TABLE `j_location`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `j_category`
--
ALTER TABLE `j_category`
  MODIFY `job_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `j_complete`
--
ALTER TABLE `j_complete`
  MODIFY `job_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `j_location`
--
ALTER TABLE `j_location`
  MODIFY `job_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `j_category` (`job_id`),
  ADD CONSTRAINT `jobs_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `j_complete` (`job_id`),
  ADD CONSTRAINT `jobs_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `j_location` (`job_id`),
  ADD CONSTRAINT `jobs_ibfk_4` FOREIGN KEY (`posted_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
