-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2023 at 02:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendence`
--

CREATE TABLE `attendence` (
  `aid` int(11) NOT NULL,
  `rollno` varchar(20) NOT NULL,
  `attendance` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendence`
--

INSERT INTO `attendence` (`aid`, `rollno`, `attendance`) VALUES
(6, '1ve17cs012', 98),
(7, '420213', 80),
(8, '557', 90),
(9, '552', 99);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `cid` int(11) NOT NULL,
  `branch` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`cid`, `branch`) VALUES
(2, 'Information Science'),
(3, 'Electronic and Communication'),
(4, 'Electrical & Electronic'),
(5, 'Civil '),
(7, 'computer science'),
(8, 'IOT'),
(9, 'Chemical'),
(10, 'CSE');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `rollno` varchar(20) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `sem` int(20) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `rollno`, `sname`, `sem`, `gender`, `branch`, `email`, `number`, `address`) VALUES
(7, '557', 'Vishnu', 6, 'male', 'computer science', 'vishnu@gmail.com', '9110567656', 'pettu'),
(8, '420213', 'Praveen', 6, 'male', 'computer science', '420213@student.nitandhra.ac.in', '09392801318', 'no'),
(10, '420203', 'student-3', 6, 'male', 'computer science', 'student.3@example.com', '08247280208', 'no need'),
(11, '552', 'prem', 6, 'male', 'computer science', 'prem@gmail.com', '7898854652', 'cheppanu');

--
-- Triggers `student`
--
DELIMITER $$
CREATE TRIGGER `DELETE` BEFORE DELETE ON `student` FOR EACH ROW INSERT INTO trig VALUES(null,OLD.rollno,'STUDENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Insert` AFTER INSERT ON `student` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rollno,'STUDENT INSERTED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UPDATE` AFTER UPDATE ON `student` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rollno,'STUDENT UPDATED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `taskname` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `assignee` varchar(255) NOT NULL,
  `duedate` date NOT NULL,
  `priority` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `rollno` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `taskname`, `description`, `assignee`, `duedate`, `priority`, `status`, `rollno`) VALUES
(4, 'Running', 'monday', 'vishnu', '2023-06-27', 'high', 'inprogress', '557'),
(8, 'jumping', 'tuesday', 'vishnu', '2023-06-27', 'medium', 'inprogress', '557'),
(9, 'swimming', 'without taking breath', 'student-1', '2023-06-24', 'high', 'completed', '557'),
(10, 'telugu', 'complete', 'bannu', '2023-06-28', 'high', 'todo', '557'),
(11, 'playing', 'games', 'prem', '2023-06-26', 'high', 'inprogress', '552');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(52) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `email`) VALUES
(1, 'aaa', 'aaa@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `trig`
--

CREATE TABLE `trig` (
  `tid` int(11) NOT NULL,
  `rollno` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trig`
--

INSERT INTO `trig` (`tid`, `rollno`, `action`, `timestamp`) VALUES
(7, '1ve17cs012', 'STUDENT INSERTED', '2021-01-10 19:19:56'),
(8, '1ve17cs012', 'STUDENT UPDATED', '2021-01-10 19:20:31'),
(9, '1ve17cs012', 'STUDENT DELETED', '2021-01-10 19:21:23'),
(10, '420213', 'STUDENT INSERTED', '2023-06-25 10:42:29'),
(11, '420213', 'STUDENT INSERTED', '2023-06-25 11:13:23'),
(12, '420201', 'STUDENT INSERTED', '2023-06-25 13:09:08'),
(13, '420201', 'STUDENT DELETED', '2023-06-25 13:09:14'),
(14, '420203', 'STUDENT INSERTED', '2023-06-25 15:38:54'),
(15, '420213', 'STUDENT UPDATED', '2023-06-25 19:16:00'),
(16, '557', 'STUDENT UPDATED', '2023-06-25 19:42:49'),
(17, '557', 'STUDENT UPDATED', '2023-06-25 19:44:36'),
(18, '552', 'STUDENT INSERTED', '2023-06-25 19:50:46');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(4, 'anees', 'anees@gmail.com', 'pbkdf2:sha256:150000$1CSLss89$ef995dfc48121768b2070bfbe7a568871cd56fac85ac7c95a1e645c8806146e9'),
(5, 'vishnu', 'sudent.1@example.com', 'pbkdf2:sha256:600000$XEJUR9ilgghdUpeW$ee7c551c3739ae4deef0728f0e102af134858e7aad0bccaf7b7e508ac1d013ab'),
(6, 'bannu', 'student1@gmail.com', 'pbkdf2:sha256:600000$iTz3xlJMrzsE0XJU$9889f320d309f51881a1f3ddfec05607583db8b5ca92375f3216b10163bb3539');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendence`
--
ALTER TABLE `attendence`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trig`
--
ALTER TABLE `trig`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendence`
--
ALTER TABLE `attendence`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trig`
--
ALTER TABLE `trig`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
