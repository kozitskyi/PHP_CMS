-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 05, 2018 at 06:35 PM
-- Server version: 5.7.22-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `School`
--

-- --------------------------------------------------------

--
-- Table structure for table `Classes`
--

CREATE TABLE `Classes` (
  `ClassID` int(5) NOT NULL,
  `ClassName` varchar(4) CHARACTER SET utf8 NOT NULL,
  `TeacherID` int(5) NOT NULL,
  `ClassRoomID` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Classes`
--

INSERT INTO `Classes` (`ClassID`, `ClassName`, `TeacherID`, `ClassRoomID`) VALUES
(1, '8-А', 2, 3),
(2, '9-Б', 1, 4),
(3, '2-Б', 4, 4),
(4, '11-Б', 2, 5),
(5, '11-А', 2, NULL),
(6, '7-А', 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `ClassRooms`
--

CREATE TABLE `ClassRooms` (
  `ClassRoomID` int(5) NOT NULL,
  `ClassNumber` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ClassRooms`
--

INSERT INTO `ClassRooms` (`ClassRoomID`, `ClassNumber`) VALUES
(1, 15),
(2, 43),
(3, 74),
(4, 98),
(5, 123),
(6, 156),
(7, 321),
(8, 602),
(9, 603),
(10, 611);

-- --------------------------------------------------------

--
-- Table structure for table `ClassRooms_Subjects`
--

CREATE TABLE `ClassRooms_Subjects` (
  `ID` int(5) NOT NULL,
  `ClassRoomID` int(5) NOT NULL,
  `SubjectID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ClassRooms_Subjects`
--

INSERT INTO `ClassRooms_Subjects` (`ID`, `ClassRoomID`, `SubjectID`) VALUES
(2, 2, 3),
(5, 2, 4),
(1, 1, 5),
(3, 4, 5),
(6, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `Marks`
--

CREATE TABLE `Marks` (
  `MarkID` int(5) NOT NULL,
  `PupilID` int(5) NOT NULL,
  `SubjectID` int(10) NOT NULL,
  `Mark` enum('1','2','3','4','5','6','7','8','9','10','11','12') CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Marks`
--

INSERT INTO `Marks` (`MarkID`, `PupilID`, `SubjectID`, `Mark`) VALUES
(13, 3, 4, '11'),
(14, 3, 4, '8'),
(15, 3, 1, '8'),
(16, 2, 1, '8'),
(17, 2, 1, '10'),
(18, 2, 1, '8'),
(19, 2, 3, '8'),
(20, 2, 5, '8'),
(21, 2, 3, '8'),
(22, 2, 2, '8'),
(23, 1, 2, '8'),
(26, 4, 2, '8'),
(27, 4, 6, '8'),
(28, 4, 7, '8'),
(29, 4, 7, '5'),
(30, 4, 7, '3'),
(31, 4, 9, '6'),
(32, 4, 3, '9'),
(33, 3, 3, '9'),
(34, 3, 5, '9'),
(35, 4, 4, '12'),
(36, 1, 4, '12');

-- --------------------------------------------------------

--
-- Table structure for table `Pupils`
--

CREATE TABLE `Pupils` (
  `PupilID` int(5) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `DayBirth` date NOT NULL,
  `Telephone` varchar(13) CHARACTER SET utf8 DEFAULT NULL,
  `Adress` varchar(70) CHARACTER SET utf8 NOT NULL,
  `ClassID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Pupils`
--

INSERT INTO `Pupils` (`PupilID`, `Name`, `DayBirth`, `Telephone`, `Adress`, `ClassID`) VALUES
(1, 'Гринишина Ольга', '2008-04-01', '0936543323', 'г.Харьков, ул. Плеханова, 21', 5),
(2, 'Петров Александр', '2012-05-03', '0938877654', 'г.Харьков, ул. Плеханова, 21', 6),
(3, 'Локтев Игорь', '2001-11-07', '0937766448', 'г.Харьков, ул. Урицкого, 13', 1),
(4, 'Леонова Марина', '1998-11-12', '0988888888', 'г.Харьков, ул. Иванова, 13', 5),
(13, 'Удовенко', '2010-03-03', '09388774443', 'г.Харьков, ул. Иванова, 21', 2),
(14, 'Петроенко', '2009-06-04', '09388744433', 'г.Харьков, ул. Семенова, 21', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Subjects`
--

CREATE TABLE `Subjects` (
  `SubjectID` int(5) NOT NULL,
  `SubjectName` varchar(20) CHARACTER SET utf8 NOT NULL,
  `TeacherID` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Subjects`
--

INSERT INTO `Subjects` (`SubjectID`, `SubjectName`, `TeacherID`) VALUES
(1, 'Астрономия', 2),
(2, 'Биология', 1),
(3, 'География', 3),
(4, 'Математика', 5),
(5, 'Немецкий', 4),
(6, 'Русский', 6),
(7, 'Украинский', 8),
(8, 'Физика', 7),
(9, 'Физкультура', 9);

-- --------------------------------------------------------

--
-- Table structure for table `Teachers`
--

CREATE TABLE `Teachers` (
  `TeacherID` int(5) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `DayBirth` date NOT NULL,
  `Telephone` varchar(13) CHARACTER SET utf8 NOT NULL,
  `Adress` varchar(70) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Teachers`
--

INSERT INTO `Teachers` (`TeacherID`, `Name`, `DayBirth`, `Telephone`, `Adress`) VALUES
(1, 'Юлия Николаевна', '1994-08-02', '0983547193', 'г. Харьков, ул. Власенко, 12'),
(2, 'Владимир Александрович', '1954-07-04', '0973421773', 'г. Харьков, ул. Бажанова, 5'),
(3, 'Петр Петрович', '1989-11-03', '0953232322', 'г. Харьков, ул. Руднева, 88'),
(4, 'Антон Анатольевич', '1897-02-01', '0999354777', 'г. Харьков, ул. Петровского, 2'),
(5, 'Юлия Владимировна', '1988-11-11', '0986343411', 'г. Харьков, ул. Каразина, 9'),
(6, 'Валентина Ивановна', '1967-03-12', '0986345117', 'г. Харьков, ул. Асхарова, 13'),
(7, 'Мария Ивановна', '1978-03-03', '09338774443', 'г.Харьков, ул. Фролова, 23'),
(8, 'Семен Семенович', '1988-01-23', '09338443555', 'г.Харьков, ул. Набережная, 9'),
(9, 'Олег Викторович', '1987-11-19', '09338354343', 'г.Харьков, ул. Зеленая, 2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Classes`
--
ALTER TABLE `Classes`
  ADD PRIMARY KEY (`ClassID`),
  ADD UNIQUE KEY `ClassName` (`ClassName`),
  ADD KEY `TeacherID` (`TeacherID`),
  ADD KEY `ClassRoomID` (`ClassRoomID`),
  ADD KEY `ClassRoomID_2` (`ClassRoomID`),
  ADD KEY `ClassRoomID_3` (`ClassRoomID`);

--
-- Indexes for table `ClassRooms`
--
ALTER TABLE `ClassRooms`
  ADD PRIMARY KEY (`ClassRoomID`),
  ADD UNIQUE KEY `ClassName` (`ClassNumber`),
  ADD UNIQUE KEY `ClassNumber` (`ClassNumber`);

--
-- Indexes for table `ClassRooms_Subjects`
--
ALTER TABLE `ClassRooms_Subjects`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `SubjectID` (`SubjectID`,`ClassRoomID`),
  ADD KEY `ClassRoomID` (`ClassRoomID`);

--
-- Indexes for table `Marks`
--
ALTER TABLE `Marks`
  ADD PRIMARY KEY (`MarkID`),
  ADD KEY `PupilID` (`PupilID`),
  ADD KEY `SubjectID` (`SubjectID`);

--
-- Indexes for table `Pupils`
--
ALTER TABLE `Pupils`
  ADD PRIMARY KEY (`PupilID`),
  ADD KEY `PupilName` (`Name`),
  ADD KEY `ClassID` (`ClassID`);

--
-- Indexes for table `Subjects`
--
ALTER TABLE `Subjects`
  ADD PRIMARY KEY (`SubjectID`),
  ADD UNIQUE KEY `SubjectName` (`SubjectName`),
  ADD KEY `TeacherID` (`TeacherID`);

--
-- Indexes for table `Teachers`
--
ALTER TABLE `Teachers`
  ADD PRIMARY KEY (`TeacherID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Classes`
--
ALTER TABLE `Classes`
  MODIFY `ClassID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `ClassRooms`
--
ALTER TABLE `ClassRooms`
  MODIFY `ClassRoomID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `ClassRooms_Subjects`
--
ALTER TABLE `ClassRooms_Subjects`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `Marks`
--
ALTER TABLE `Marks`
  MODIFY `MarkID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `Pupils`
--
ALTER TABLE `Pupils`
  MODIFY `PupilID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `Subjects`
--
ALTER TABLE `Subjects`
  MODIFY `SubjectID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `Teachers`
--
ALTER TABLE `Teachers`
  MODIFY `TeacherID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Classes`
--
ALTER TABLE `Classes`
  ADD CONSTRAINT `Classes_ibfk_1` FOREIGN KEY (`ClassRoomID`) REFERENCES `ClassRooms` (`ClassRoomID`),
  ADD CONSTRAINT `Classes_ibfk_2` FOREIGN KEY (`TeacherID`) REFERENCES `Teachers` (`TeacherID`);

--
-- Constraints for table `ClassRooms_Subjects`
--
ALTER TABLE `ClassRooms_Subjects`
  ADD CONSTRAINT `ClassRooms_Subjects_ibfk_1` FOREIGN KEY (`ClassRoomID`) REFERENCES `ClassRooms` (`ClassRoomID`),
  ADD CONSTRAINT `ClassRooms_Subjects_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `Subjects` (`SubjectID`);

--
-- Constraints for table `Marks`
--
ALTER TABLE `Marks`
  ADD CONSTRAINT `Marks_ibfk_1` FOREIGN KEY (`PupilID`) REFERENCES `Pupils` (`PupilID`),
  ADD CONSTRAINT `Marks_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `Subjects` (`SubjectID`),
  ADD CONSTRAINT `Marks_ibfk_3` FOREIGN KEY (`SubjectID`) REFERENCES `Subjects` (`SubjectID`);

--
-- Constraints for table `Pupils`
--
ALTER TABLE `Pupils`
  ADD CONSTRAINT `Pupils_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `Classes` (`ClassID`);

--
-- Constraints for table `Subjects`
--
ALTER TABLE `Subjects`
  ADD CONSTRAINT `Subjects_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `Teachers` (`TeacherID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
