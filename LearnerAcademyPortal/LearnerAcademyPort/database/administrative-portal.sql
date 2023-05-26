-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 04, 2021 at 09:32 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `administrative-portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
create database SchoolDatabase;
use LearnerAcademy;
CREATE TABLE Classes  (
  id int NOT NULL,
  section int NOT NULL,
  teacher int NOT NULL,
  subject int NOT NULL,
  time varchar(44) NOT NULL
) ;
INSERT INTO Classes Values (1, 1, 1, 1, '9:00');
INSERT INTO Classes Values(2, 3, 2, 2, '11:30');

use LearnerAcademy;

CREATE TABLE  Students (
  id int NOT NULL,
  fname varchar(55) NOT NULL,
  lname varchar(55) NOT NULL,
  age int DEFAULT NULL,
  class int NOT NULL);
 
  INSERT INTO `students` (`id`, `fname`, `lname`, `age`, `class`) VALUES
(1, 'Lehakoe', 'Semonyo', 21, 1),
(2, 'Relebohile', 'Moloi', 23, 2),
(4, 'Jarred', 'Rider', 21, 1),
(5, 'Thabang', 'Makgu', 18, 2),
(6, 'Mpho', 'Pilisone', 24, 1),
(7, 'Karley', 'Jansen', 24, 2);
 
use LearnerAcademy;

CREATE TABLE `subjects` (
  `id` int NOT NULL,
  `name` varchar(55) NOT NULL,
  `shortcut` varchar(50) NOT NULL
);

INSERT INTO `subjects` (`id`, `name`, `shortcut`) VALUES
(1, 'Mathematical Modelling', 'WTW145'),
(2, 'Machine Learning', 'MAL'),
(3, 'Mathematical Statistics', 'WTS154'),
(4, 'Economic', 'EKS121'),
(5, 'JAVA', 'JAVA'),
(6, 'Physics', 'PHY155'),
(7, 'Drone Piloting', 'DP1101'),
(8, 'Interview Preparation', 'IP');

use LearnerAcademy;
CREATE TABLE `teachers` (
  `id` int NOT NULL,
  `fname` varchar(55) NOT NULL,
  `lname` varchar(55) NOT NULL,
  `age` varchar(11) DEFAULT NULL
);

INSERT INTO `teachers` (`id`, `fname`, `lname`, `age`) VALUES
(1, 'Mamo', 'Leeuw', '28'),
(2, 'Annelise', 'Locke', '35'),
(1, 'Arumuru', 'Vennugopal', '36'),
(2, 'Tsebiso', 'Mofokeng', '40');

ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject`),
  ADD KEY `teacher_id` (`teacher`);

ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class`);

ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `classes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `students`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `subjects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `teachers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `classes`
  ADD CONSTRAINT `subject_id` FOREIGN KEY (`subject`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `teacher_id` FOREIGN KEY (`teacher`) REFERENCES `teachers` (`id`);

ALTER TABLE `students`
  ADD CONSTRAINT `class_id` FOREIGN KEY (`class`) REFERENCES `classes` (`id`);
COMMIT;

select * from students;
select * from teachers;