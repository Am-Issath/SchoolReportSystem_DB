-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2022 at 09:27 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schoolreportsystem`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_result` (IN `no` INT(11), IN `sid` INT(11), IN `suid` INT(11), IN `ma` INT(11))   BEGIN
insert into result (serialNo , studentID , subjectID ,mark)
values (no,sid, suid,ma ) ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Login` (IN `id` VARCHAR(30), IN `p` VARCHAR(30))   BEGIN
SELECT * FROM user
WHERE id = userName  AND p =password;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_result` ()   BEGIN
SELECT *FROM result;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_student` ()   BEGIN
SELECT *FROM student;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_studyon` ()   BEGIN
SELECT *FROM studyon;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_subject` ()   BEGIN
SELECT *FROM subject;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_teacher` ()   BEGIN
SELECT *FROM teacher;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `serialNo` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `subjectID` int(11) NOT NULL,
  `mark` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`serialNo`, `studentID`, `subjectID`, `mark`) VALUES
(300, 1000, 5000, 75),
(301, 1000, 5100, 65),
(302, 1000, 5200, 84),
(303, 1001, 5200, 83),
(304, 1002, 5100, 54),
(305, 1002, 5000, 69),
(306, 1004, 5000, 94),
(307, 1001, 5000, 77),
(308, 1001, 5000, 89);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` int(11) NOT NULL,
  `sName` varchar(30) NOT NULL,
  `sAddress` varchar(50) NOT NULL,
  `sGender` char(1) NOT NULL,
  `sAdmissionDate` date NOT NULL,
  `sDateOfBirth` date DEFAULT NULL,
  `parentNIC` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentID`, `sName`, `sAddress`, `sGender`, `sAdmissionDate`, `sDateOfBirth`, `parentNIC`) VALUES
(1000, 'Issath', 'Trincomalee', 'M', '2004-12-31', '1998-05-30', '645647839V'),
(1001, 'Fasrath', 'Vavuniya', 'M', '2004-12-31', '1999-03-17', '645647345V'),
(1002, 'Laveen', 'Colombo', 'M', '2004-12-31', '1998-06-23', '695634564V'),
(1003, 'Harrish', 'Kandy', 'M', '2004-12-31', '1998-10-05', '794478397V'),
(1004, 'Shabith', 'Jaffna', 'M', '2004-12-31', '1998-12-10', '555647876V');

-- --------------------------------------------------------

--
-- Table structure for table `studyon`
--

CREATE TABLE `studyon` (
  `studentID` int(11) NOT NULL,
  `sCurrentYear` int(11) DEFAULT NULL,
  `sGrade` varchar(5) DEFAULT NULL,
  `term` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studyon`
--

INSERT INTO `studyon` (`studentID`, `sCurrentYear`, `sGrade`, `term`) VALUES
(1000, 2017, '13', '1st'),
(1001, 2018, '12', '2nd'),
(1002, 2017, '12', '1st');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subjectID` int(11) NOT NULL,
  `teacherID` int(11) NOT NULL,
  `subjectName` varchar(20) NOT NULL,
  `sGrade` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subjectID`, `teacherID`, `subjectName`, `sGrade`) VALUES
(5000, 100, 'Combined Maths', '12'),
(5100, 101, 'Chemistry', '12'),
(5200, 102, 'Physics', '13');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacherID` int(11) NOT NULL,
  `tName` varchar(15) NOT NULL,
  `tEmail` varchar(30) NOT NULL,
  `tAddress` varchar(30) NOT NULL,
  `tGender` char(5) DEFAULT NULL,
  `tPhone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacherID`, `tName`, `tEmail`, `tAddress`, `tGender`, `tPhone`) VALUES
(100, 'Sivakanthan', 'siva98@gmail.com', 'Trincomalee', 'M', 713456466),
(101, 'Vasuthavan', 'vasu45@gmail.com', 'Jaffna', 'F', 713234446),
(102, 'Ramani', 'ramani23@gmail.com', 'Kinniya', 'F', 773444449);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userName` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `teacherID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userName`, `password`, `teacherID`) VALUES
('issath', '1234', 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`serialNo`),
  ADD KEY `studentID` (`studentID`),
  ADD KEY `subjectID` (`subjectID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`);

--
-- Indexes for table `studyon`
--
ALTER TABLE `studyon`
  ADD KEY `studentID` (`studentID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subjectID`),
  ADD KEY `teacherID` (`teacherID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacherID`),
  ADD UNIQUE KEY `tEmail` (`tEmail`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userName`),
  ADD KEY `teacherID` (`teacherID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`),
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`);

--
-- Constraints for table `studyon`
--
ALTER TABLE `studyon`
  ADD CONSTRAINT `studyon_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`);

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
