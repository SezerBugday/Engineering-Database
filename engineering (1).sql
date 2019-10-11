-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 11, 2019 at 06:00 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `engineering`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
CREATE TABLE IF NOT EXISTS `announcements` (
  `Departman_Id` int(10) NOT NULL,
  `Lesson_Name` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `Explanation` varchar(50) NOT NULL,
  KEY `Departman_Id` (`Departman_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`Departman_Id`, `Lesson_Name`, `Date`, `Explanation`) VALUES
(1, 'Computer Science', '2019-10-11', 'Students must come to lesson'),
(1, 'Computer Science', '2019-10-15', 'There isn\'t lesson on tomorrow'),
(2, 'Civil Science', '2019-10-14', 'Students must come lesson with their Pc'),
(3, 'Electric Science', '2019-10-24', 'There is a quiz on tomorrow'),
(4, 'Machine Science', '2019-10-16', 'The machines are broken');

-- --------------------------------------------------------

--
-- Table structure for table `departmans`
--

DROP TABLE IF EXISTS `departmans`;
CREATE TABLE IF NOT EXISTS `departmans` (
  `Departman_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Departman_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Departman_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departmans`
--

INSERT INTO `departmans` (`Departman_Id`, `Departman_Name`) VALUES
(1, 'Computer Engineering'),
(2, 'Civil Engineering'),
(3, 'Electric Engineering'),
(4, 'Machine Engineering'),
(5, 'Mechatronics Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE IF NOT EXISTS `exams` (
  `Exam_Name` varchar(50) NOT NULL,
  `Exam_Date` date NOT NULL,
  `Exam_Lesson` int(11) NOT NULL,
  KEY `Exam_Lesson` (`Exam_Lesson`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`Exam_Name`, `Exam_Date`, `Exam_Lesson`) VALUES
('Midterm-1', '2019-11-12', 11),
('Final-1', '2020-01-06', 11),
('Midterm-1', '2019-10-16', 12),
('Final-1', '2019-10-14', 12),
('Midterm-1', '2019-10-16', 13),
('Final-1', '2019-12-24', 13);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
CREATE TABLE IF NOT EXISTS `lessons` (
  `Lesson_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Lesson_Name` varchar(50) NOT NULL,
  `Lesson_Teacher` varchar(50) NOT NULL,
  `Departman_Id` int(10) NOT NULL,
  PRIMARY KEY (`Lesson_Id`),
  KEY `Departman_Id` (`Departman_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`Lesson_Id`, `Lesson_Name`, `Lesson_Teacher`, `Departman_Id`) VALUES
(11, 'Computer Science', 'Nihat Simsek', 1),
(12, 'Electric Science', 'Ahmet Hüzmeli', 3),
(13, 'Civil Science', 'Melisa Can', 2),
(14, 'Machine Science', 'Ilknur Bugday', 4),
(15, 'Mechatronics Science', 'Aldul Hafez', 5);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `Std_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Std_Name` varchar(50) NOT NULL,
  `Std_Surname` varchar(50) NOT NULL,
  `Departman_Id` int(10) NOT NULL,
  PRIMARY KEY (`Std_Id`),
  KEY `Departman_Id` (`Departman_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1815010007 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Std_Id`, `Std_Name`, `Std_Surname`, `Departman_Id`) VALUES
(181254141, 'Yasin', 'Yildirim', 1),
(181482842, 'Enes', 'Kaya', 3),
(181501007, 'Sezer', 'Bugday', 1),
(181501452, 'Leman', 'Sagaltici', 5),
(181524815, 'Salih ', 'Balina', 3),
(181524915, 'Muhammet', 'Berdici', 4),
(181584528, 'Ayfer', 'Sahin', 1),
(181585225, 'Onur', 'Sagaltici', 2),
(1815010006, 'Agâh', 'Kanat', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `Teacher_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Teacher_Name` varchar(50) NOT NULL,
  `Teacher_Surname` varchar(50) NOT NULL,
  `Departman_Id` int(11) NOT NULL,
  PRIMARY KEY (`Teacher_Id`),
  KEY `Departman_Id` (`Departman_Id`),
  KEY `Teacher_Id` (`Teacher_Id`),
  KEY `Teacher_Id_2` (`Teacher_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`Teacher_Id`, `Teacher_Name`, `Teacher_Surname`, `Departman_Id`) VALUES
(1, 'Nihat', 'Simsek', 1),
(2, 'Ahmet', 'Hüzmeli', 3),
(3, 'Melisa', 'Can', 2),
(4, 'Ilknur', 'Bugday', 4),
(5, 'Aldul', 'Hafez', 5);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_lesson`
--

DROP TABLE IF EXISTS `teacher_lesson`;
CREATE TABLE IF NOT EXISTS `teacher_lesson` (
  `Teacher_Id` int(10) NOT NULL,
  `Lesson_Id` int(10) NOT NULL,
  KEY `Teacher_Id` (`Teacher_Id`),
  KEY `Lesson_Id` (`Lesson_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_std`
--

DROP TABLE IF EXISTS `teacher_std`;
CREATE TABLE IF NOT EXISTS `teacher_std` (
  `Std_Id` int(10) NOT NULL,
  `Teacher_Id` int(10) NOT NULL,
  KEY `Std_Id` (`Std_Id`),
  KEY `Teacher_Id` (`Teacher_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_std`
--

INSERT INTO `teacher_std` (`Std_Id`, `Teacher_Id`) VALUES
(1815010006, 1),
(181584528, 2),
(181482842, 3),
(181501452, 4),
(181524815, 5),
(181524915, 5),
(181501007, 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`Departman_Id`) REFERENCES `departmans` (`Departman_Id`);

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`Exam_Lesson`) REFERENCES `lessons` (`Lesson_Id`);

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`Departman_Id`) REFERENCES `departmans` (`Departman_Id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`Departman_Id`) REFERENCES `departmans` (`Departman_Id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`Departman_Id`) REFERENCES `departmans` (`Departman_Id`);

--
-- Constraints for table `teacher_lesson`
--
ALTER TABLE `teacher_lesson`
  ADD CONSTRAINT `teacher_lesson_ibfk_1` FOREIGN KEY (`Teacher_Id`) REFERENCES `teachers` (`Teacher_Id`),
  ADD CONSTRAINT `teacher_lesson_ibfk_2` FOREIGN KEY (`Lesson_Id`) REFERENCES `lessons` (`Lesson_Id`);

--
-- Constraints for table `teacher_std`
--
ALTER TABLE `teacher_std`
  ADD CONSTRAINT `teacher_std_ibfk_1` FOREIGN KEY (`Std_Id`) REFERENCES `students` (`Std_Id`),
  ADD CONSTRAINT `teacher_std_ibfk_2` FOREIGN KEY (`Teacher_Id`) REFERENCES `teachers` (`Teacher_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
