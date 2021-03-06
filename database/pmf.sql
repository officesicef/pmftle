-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2018 at 10:38 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

drop database if exists pmf;
create database pmf;
use pmf;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pmf`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`user_id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `user_id` int(11) NOT NULL,
  `phone` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`user_id`, `phone`) VALUES
(1, '064 8573941'),
(2, '+381 66 7584851');

-- --------------------------------------------------------

--
-- Table structure for table `reminder`
--

CREATE TABLE `reminder` (
  `id` int(11) NOT NULL,
  `therapy_id` int(11) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `visited` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reminder`
--

INSERT INTO `reminder` (`id`, `therapy_id`, `time`, `visited`) VALUES
(2, 5, '2018-11-14 09:15:44', NULL),
(3, 6, '2018-11-18 09:19:09', NULL),
(4, 19, '2018-11-14 09:21:55', NULL),
(6, 20, '2018-11-14 09:24:17', NULL),
(7, 1, '2018-11-15 23:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `therapy_id` int(11) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `therapy_id`, `time`, `description`) VALUES
(1, 1, '2018-10-07 09:30:05', 'Sve ok, mazem atlex.'),
(13, 2, '2009-11-08 07:22:54', 'Izgleda isto kao pre. Danka'),
(14, 2, '2010-11-08 07:22:54', 'Izgleda isto kao pre. Danka'),
(15, 2, '2011-11-08 07:22:54', 'Izgleda isto kao pre. Danka'),
(16, 2, '2012-11-08 07:22:54', 'Izgleda isto kao pre. Danka'),
(17, 2, '2013-11-08 07:22:54', 'Izgleda drugacije, saljem sliku. Danka'),
(18, 3, '2013-12-26 08:22:54', 'Dobro sam, malo me svrbe konci. Danka'),
(19, 4, '2018-11-11 09:21:55', 'Novo stanje'),
(20, 4, '2018-11-11 09:24:16', 'Novo stanje');

-- --------------------------------------------------------

--
-- Table structure for table `therapy`
--

CREATE TABLE `therapy` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `open_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `close_time` timestamp NULL DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` text,
  `period` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `therapy`
--

INSERT INTO `therapy` (`id`, `patient_id`, `doctor_id`, `open_time`, `close_time`, `name`, `description`, `period`) VALUES
(1, 1, 3, '2018-10-04 09:30:05', NULL, 'Atletsko stopalo', 'Pacijent ima atletsko stopalo. Prepisana je terapija preparatom atlex na svaka 3 dana.', 3),
(2, 2, 3, '2009-11-05 07:22:54', '2013-11-23 14:05:13', 'Promena na melanomu', 'Pacijentu je preporuceno da prati promene na melanomu na levoj podlaktici jednom godisnje.', 365),
(3, 2, 3, '2013-12-24 08:45:00', '2014-03-24 08:45:00', 'Operacija', 'Pracenje stanja posle operacije uklanjanja melanoma', 14),
(4, 1, 3, '2018-11-11 05:27:14', NULL, 'Akne na licu', 'xvxcvxcvxcv', 3),
(5, 1, 3, '2018-11-11 09:15:44', '2018-11-11 09:15:44', 'Alergija', 'Blaga alergija na podlaktici', 3),
(6, 2, 3, '2018-11-11 09:19:08', NULL, 'Akne na licu', 'Akne na licu, blago izražene', 7);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `citizen_id` varchar(16) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `password`, `citizen_id`, `type`) VALUES
(1, 'dragisa4@eps.rs', 'Dragisa Stankovic', 'gaga1', '1104955730055', 0),
(2, 'dankajov@ptt.rs', 'Danka Jovanovic', 'zucapariz', '0607956735044', 0),
(3, 'zoran.kostic113@gmail.com', 'Zoran Kostic', '12345', '0511968730033', 1),
(4, 'lazar.stamenkovic@pmf.edu.rs', 'Lazar Stamenkovic', '12345', '3007996730048', 0),
(5, 'mare@gmail.com', 'Marko Ranković', 'mare', '0404998760035', 0),
(6, 'nikola@gmail.com', 'Nikola Mirković', 'nikola', '0404999730033', 0),
(7, 'zare@gmail.com', 'Žarko Milošević', 'zare', '1206995730038', 0),
(8, 'mile@gmail.com', 'Mile Milenković', 'mile', '1407991730033', 0),
(9, 'igor@gmail.com', 'Igor Ignjatović', 'igor', '010199970077', 0),
(10, 'stefan@gmail.com', 'Stefan Marković', 'stefan', '0101999730021', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reminder`
--
ALTER TABLE `reminder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `therapy`
--
ALTER TABLE `therapy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reminder`
--
ALTER TABLE `reminder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `therapy`
--
ALTER TABLE `therapy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
