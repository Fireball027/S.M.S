-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `Students`
-- Table Structure For Table `Attendence`
CREATE TABLE `Attendence` (
  `aid` int(11) NOT NULL,
  `rollno` varchar(20) NOT NULL,
  `attendance` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping Data For Table `Attendence`
INSERT INTO `Attendence` (`aid`, `rollno`, `attendance`) VALUES
(6, '1ve17cs012', 98);

-- Table Structure For Table `Department`
CREATE TABLE `Department` (
  `cid` int(11) NOT NULL,
  `branch` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping Data For Table `Department`
INSERT INTO `Department` (`cid`, `branch`) VALUES
(2, 'Information Science Engineering'),
(3, 'Electronic and Communication Engineering'),
(4, 'Electrical & Electronic Engineering'),
(5, 'Civil Engineering'),
(7, 'Computer Science Engineering');

-- Table Structure For Table `Student`
CREATE TABLE `Student` (
  `id` int(11) NOT NULL,
  `rollno` varchar(20) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `sem` int(20) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Triggers `Student`
DELIMITER $$
CREATE TRIGGER `DELETE` BEFORE DELETE ON `Student` FOR EACH ROW INSERT INTO trig VALUES(null,OLD.rollno,'STUDENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Insert` AFTER INSERT ON `Student` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rollno,'STUDENT INSERTED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UPDATE` AFTER UPDATE ON `Student` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rollno,'STUDENT UPDATED',NOW())
$$
DELIMITER ;

-- Table Structure For Table `Test`
CREATE TABLE `Test` (
  `id` int(11) NOT NULL,
  `name` varchar(52) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping Data For Table `Test`
INSERT INTO `Test` (`id`, `name`, `email`) VALUES
(1, 'aa', 'aa@gmail.com');

-- Table Structure For Table `Time`
CREATE TABLE `Time` (
  `tid` int(11) NOT NULL,
  `rollno` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping Data For Table `Time`
INSERT INTO `Time` (`tid`, `rollno`, `action`, `timestamp`) VALUES
(7, '1ve17cs012', 'STUDENT INSERTED', '2021-01-10 19:19:56'),
(8, '1ve17cs012', 'STUDENT UPDATED', '2021-01-10 19:20:31'),
(9, '1ve17cs012', 'STUDENT DELETED', '2021-01-10 19:21:23');

-- Table Structure For Table `User`
CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping Data For Table `User`
INSERT INTO `User` (`id`, `username`, `email`, `password`) VALUES
(4, 'bb', 'bb@gmail.com', 'pbkdf2:sha256:150000$1CSLss89$ef995dfc48121768b2070bfbe7a568871cd56fac85ac7c95a1e645c8806146e9');

-- Indexes For Dumped Tables
-- Indexes For Table `Attendence`
ALTER TABLE `Attendence`
  ADD PRIMARY KEY (`aid`);

-- Indexes For Table `Department`
ALTER TABLE `Department`
  ADD PRIMARY KEY (`cid`);

-- Indexes For table `Student`
ALTER TABLE `Student`
  ADD PRIMARY KEY (`id`);

-- Indexes For Table `Test`
ALTER TABLE `Test`
  ADD PRIMARY KEY (`id`);

-- Indexes For Table `Time`
ALTER TABLE `Time`
  ADD PRIMARY KEY (`tid`);

-- Indexes For Table `User`
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`);

-- AUTO_INCREMENT For Dumped Tables
-- AUTO_INCREMENT For Table `Attendence`
ALTER TABLE `Attendence`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

-- AUTO_INCREMENT For Table `Department`
ALTER TABLE `Department`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

-- AUTO_INCREMENT For Table `Student`
ALTER TABLE `Student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

-- AUTO_INCREMENT For Table `Test`
ALTER TABLE `Test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- AUTO_INCREMENT For Table `Time`
ALTER TABLE `Time`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

-- AUTO_INCREMENT For Table `User`
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
