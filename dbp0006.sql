-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2020 at 11:51 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbp0006`
--

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleID` int(11) NOT NULL,
  `roleName` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleID`, `roleName`) VALUES
(1, 'Administrator'),
(2, 'Subscriber');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `isSendNotification` int(11) DEFAULT NULL,
  `website` varchar(250) DEFAULT NULL,
  `rodeID` int(11) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `password`, `firstname`, `lastname`, `isSendNotification`, `website`, `rodeID`, `email`) VALUES
('admin', '3cc849279ba298b587a34cabaeffc5ecb3a044bbf97c516fab7ede9d1af77cfa', 'dinh', 'ginh', 1, 'dinh.html', 1, 'sangplce140331@fpt.edu.vn'),
('admin11', '3465880121e8ad0615c3ec63f5af778f8a663da9b5803b04324450af8590635d', 'dinh', 'ginh', 1, 'dinh.html', 1, 'locntce140150@fpt.edu.vn'),
('dang', 'e39bbde0b2ad4e0f9c42f1edec4164812a5866b428ce7e604b149e4a9c523bc9', 'dang', 'dang', 1, 'dang.html', 2, 'dangnvce14098@fpt.edu.vn'),
('dinh', '3465880121e8ad0615c3ec63f5af778f8a663da9b5803b04324450af8590635d', 'dinh', 'ginh', 1, 'dinh.html', 2, 'dinhttce140331@fpt.edu.vn'),
('DINHHHH', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'dinh', 'ginh', 1, 'dinh.html', 2, 'dinhttce@gmail');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`) USING BTREE,
  ADD KEY `rodeID` (`rodeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`rodeID`) REFERENCES `role` (`roleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
