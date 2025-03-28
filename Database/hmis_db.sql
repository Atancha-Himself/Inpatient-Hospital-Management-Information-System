-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2025 at 08:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hmis_db`
--

-- --------------------------------------------------------

--

-- --------------------------------------------------------

--
-- Table structure for table `his_admin`
--

CREATE TABLE `his_admin` (
  `ad_id` int(20) NOT NULL,
  `ad_fname` varchar(200) DEFAULT NULL,
  `ad_lname` varchar(200) DEFAULT NULL,
  `ad_email` varchar(200) DEFAULT NULL,
  `ad_pwd` varchar(200) DEFAULT NULL,
  `ad_dpic` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_admin`
--

INSERT INTO `his_admin` (`ad_id`, `ad_fname`, `ad_lname`, `ad_email`, `ad_pwd`, `ad_dpic`) VALUES
(1, 'System', 'Administrator', 'admin@mail.com', '4c7f5919e957f354d57243d37f223cf31e9e7181', 'doc-icon.png');

-- --------------------------------------------------------

--


--
-- Table structure for table `his_beds`
--

CREATE TABLE `his_beds` (
  `bed_id` int(11) NOT NULL,
  `ward_id` int(11) DEFAULT NULL,
  `pat_id` int(11) DEFAULT NULL,
  `status` enum('occupied','unoccupied') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `his_beds`
--

INSERT INTO `his_beds` (`bed_id`, `ward_id`, `pat_id`, `status`) VALUES
(1, 1, NULL, 'unoccupied'),
(2, 1, NULL, 'unoccupied'),
(3, 1, NULL, 'unoccupied'),
(4, 1, NULL, 'unoccupied'),
(5, 1, NULL, 'unoccupied'),
(6, 1, NULL, 'unoccupied'),
(7, 1, NULL, 'unoccupied'),
(8, 1, NULL, 'unoccupied'),
(9, 1, NULL, 'unoccupied'),
(10, 1, NULL, 'unoccupied'),
(11, 1, NULL, 'unoccupied'),
(12, 1, NULL, 'unoccupied'),
(13, 1, NULL, 'unoccupied'),
(14, 1, NULL, 'unoccupied'),
(15, 1, NULL, 'unoccupied'),
(16, 1, NULL, 'unoccupied'),
(17, 1, NULL, 'unoccupied'),
(18, 1, NULL, 'unoccupied'),
(19, 1, NULL, 'unoccupied'),
(20, 1, NULL, 'unoccupied'),
(21, 1, NULL, 'unoccupied'),
(22, 1, NULL, 'unoccupied'),
(23, 1, NULL, 'unoccupied'),
(24, 1, NULL, 'unoccupied'),
(25, 1, NULL, 'unoccupied'),
(26, 1, NULL, 'unoccupied'),
(27, 1, NULL, 'unoccupied'),
(28, 1, NULL, 'unoccupied'),
(29, 1, NULL, 'unoccupied'),
(30, 1, NULL, 'unoccupied'),
(31, 2, NULL, 'unoccupied'),
(32, 2, NULL, 'unoccupied'),
(33, 2, NULL, 'unoccupied'),
(34, 2, NULL, 'unoccupied'),
(35, 2, NULL, 'unoccupied'),
(36, 2, NULL, 'unoccupied'),
(37, 2, NULL, 'unoccupied'),
(38, 2, NULL, 'unoccupied'),
(39, 2, NULL, 'unoccupied'),
(40, 2, NULL, 'unoccupied'),
(41, 2, NULL, 'unoccupied'),
(42, 2, NULL, 'unoccupied'),
(43, 2, NULL, 'unoccupied'),
(44, 2, NULL, 'unoccupied'),
(45, 2, NULL, 'unoccupied'),
(46, 2, NULL, 'unoccupied'),
(47, 2, NULL, 'unoccupied'),
(48, 2, NULL, 'unoccupied'),
(49, 2, NULL, 'unoccupied'),
(50, 2, NULL, 'unoccupied'),
(51, 2, NULL, 'unoccupied'),
(52, 2, NULL, 'unoccupied'),
(53, 2, NULL, 'unoccupied'),
(54, 2, NULL, 'unoccupied'),
(55, 2, NULL, 'unoccupied'),
(56, 2, NULL, 'unoccupied'),
(57, 2, NULL, 'unoccupied'),
(58, 2, NULL, 'unoccupied'),
(59, 2, NULL, 'unoccupied'),
(60, 2, NULL, 'unoccupied'),
(61, 3, NULL, 'unoccupied'),
(62, 3, NULL, 'unoccupied'),
(63, 3, NULL, 'unoccupied'),
(64, 3, NULL, 'unoccupied'),
(65, 3, NULL, 'unoccupied'),
(66, 3, NULL, 'unoccupied'),
(67, 3, NULL, 'unoccupied'),
(68, 3, NULL, 'unoccupied'),
(69, 3, NULL, 'unoccupied'),
(70, 3, NULL, 'unoccupied'),
(71, 3, NULL, 'unoccupied'),
(72, 3, NULL, 'unoccupied'),
(73, 3, NULL, 'unoccupied'),
(74, 3, NULL, 'unoccupied'),
(75, 3, NULL, 'unoccupied'),
(76, 3, NULL, 'unoccupied'),
(77, 3, NULL, 'unoccupied'),
(78, 3, NULL, 'unoccupied'),
(79, 3, NULL, 'unoccupied'),
(80, 3, NULL, 'unoccupied'),
(81, 3, NULL, 'unoccupied'),
(82, 3, NULL, 'unoccupied'),
(83, 3, NULL, 'unoccupied'),
(84, 3, NULL, 'unoccupied'),
(85, 3, NULL, 'unoccupied'),
(86, 3, NULL, 'unoccupied'),
(87, 3, NULL, 'unoccupied'),
(88, 3, NULL, 'unoccupied'),
(89, 3, NULL, 'unoccupied'),
(90, 3, NULL, 'unoccupied'),
(91, 4, NULL, 'unoccupied'),
(92, 4, NULL, 'unoccupied'),
(93, 4, NULL, 'unoccupied'),
(94, 4, NULL, 'unoccupied'),
(95, 4, NULL, 'unoccupied'),
(96, 4, NULL, 'unoccupied'),
(97, 4, NULL, 'unoccupied'),
(98, 4, NULL, 'unoccupied'),
(99, 4, NULL, 'unoccupied'),
(100, 4, NULL, 'unoccupied'),
(101, 4, NULL, 'unoccupied'),
(102, 4, NULL, 'unoccupied'),
(103, 4, NULL, 'unoccupied'),
(104, 4, NULL, 'unoccupied'),
(105, 4, NULL, 'unoccupied'),
(106, 4, NULL, 'unoccupied'),
(107, 4, NULL, 'unoccupied'),
(108, 4, NULL, 'unoccupied'),
(109, 4, NULL, 'unoccupied'),
(110, 4, NULL, 'unoccupied'),
(111, 4, NULL, 'unoccupied'),
(112, 4, NULL, 'unoccupied'),
(113, 4, NULL, 'unoccupied'),
(114, 4, NULL, 'unoccupied'),
(115, 4, NULL, 'unoccupied'),
(116, 4, NULL, 'unoccupied'),
(117, 4, NULL, 'unoccupied'),
(118, 4, NULL, 'unoccupied'),
(119, 4, NULL, 'unoccupied'),
(120, 4, NULL, 'unoccupied');

-- --------------------------------------------------------

--
-- Table structure for table `his_docs`
--

CREATE TABLE `his_docs` (
  `doc_id` int(20) NOT NULL,
  `doc_fname` varchar(200) DEFAULT NULL,
  `doc_lname` varchar(200) DEFAULT NULL,
  `doc_email` varchar(200) DEFAULT NULL,
  `doc_pwd` varchar(200) DEFAULT NULL,
  `doc_dept` varchar(200) DEFAULT NULL,
  `doc_number` varchar(200) DEFAULT NULL,
  `doc_dpic` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_docs`
--

INSERT INTO `his_docs` (`doc_id`, `doc_fname`, `doc_lname`, `doc_email`, `doc_pwd`, `doc_dept`, `doc_number`, `doc_dpic`) VALUES
(5, 'Aletha', 'White', 'aletha@mail.com', 'dce0b27ba675df41e9cc07af80ec59c475810824', 'Laboratory', 'BKTWQ', 'defaultimg.jpg'),
(6, 'Bryan', 'Arreola', 'bryan@mail.com', '55c3b5386c486feb662a0785f340938f518d547f', 'Surgery | Theatre', 'YDS7L', 'user-default-2-min.png'),
(12, 'Jessica', 'Spencer', 'jessica@mail.com', 'dce0b27ba675df41e9cc07af80ec59c475810824', 'Accounting', '5VIFT', 'usric.png');



--
-- Table structure for table `his_laboratory`
--

CREATE TABLE `his_laboratory` (
  `lab_id` int(20) NOT NULL,
  `lab_pat_name` varchar(200) DEFAULT NULL,
  `lab_pat_ailment` varchar(200) DEFAULT NULL,
  `lab_pat_number` varchar(200) DEFAULT NULL,
  `lab_pat_tests` longtext DEFAULT NULL,
  `lab_pat_results` longtext DEFAULT NULL,
  `lab_number` varchar(200) DEFAULT NULL,
  `lab_date_rec` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




--
-- Table structure for table `his_medical_records`
--

CREATE TABLE `his_medical_records` (
  `mdr_id` int(20) NOT NULL,
  `mdr_number` varchar(200) DEFAULT NULL,
  `mdr_pat_name` varchar(200) DEFAULT NULL,
  `mdr_pat_adr` varchar(200) DEFAULT NULL,
  `mdr_pat_age` varchar(200) DEFAULT NULL,
  `mdr_pat_ailment` varchar(200) DEFAULT NULL,
  `mdr_pat_number` varchar(200) DEFAULT NULL,
  `mdr_pat_prescr` longtext DEFAULT NULL,
  `mdr_date_rec` timestamp(4) NOT NULL DEFAULT current_timestamp(4) ON UPDATE current_timestamp(4)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--

--
-- Table structure for table `his_patients`
--

CREATE TABLE `his_patients` (
  `pat_id` int(20) NOT NULL,
  `pat_fname` varchar(200) DEFAULT NULL,
  `pat_lname` varchar(200) DEFAULT NULL,
  `pat_dob` varchar(200) DEFAULT NULL,
  `pat_age` varchar(200) DEFAULT NULL,
  `pat_number` varchar(200) DEFAULT NULL,
  `pat_addr` varchar(200) DEFAULT NULL,
  `pat_phone` varchar(200) DEFAULT NULL,
  `pat_date_joined` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `pat_ailment` varchar(200) DEFAULT NULL,
  `pat_discharge_status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--

--
-- Table structure for table `his_patient_transfers`
--

CREATE TABLE `his_patient_transfers` (
  `t_id` int(20) NOT NULL,
  `t_hospital` varchar(200) DEFAULT NULL,
  `t_date` varchar(200) DEFAULT NULL,
  `t_pat_name` varchar(200) DEFAULT NULL,
  `t_pat_number` varchar(200) DEFAULT NULL,
  `t_status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--




--
-- Table structure for table `his_prescriptions`
--

CREATE TABLE `his_prescriptions` (
  `pres_id` int(200) NOT NULL,
  `pres_pat_name` varchar(200) DEFAULT NULL,
  `pres_pat_age` varchar(200) DEFAULT NULL,
  `pres_pat_number` varchar(200) DEFAULT NULL,
  `pres_number` varchar(200) DEFAULT NULL,
  `pres_pat_addr` varchar(200) DEFAULT NULL,
  `pres_date` timestamp(4) NOT NULL DEFAULT current_timestamp(4) ON UPDATE current_timestamp(4),
  `pres_pat_ailment` varchar(200) DEFAULT NULL,
  `pres_ins` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--


--
-- Table structure for table `his_pwdresets`
--

CREATE TABLE `his_pwdresets` (
  `id` int(20) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `his_surgery`
--

CREATE TABLE `his_surgery` (
  `s_id` int(200) NOT NULL,
  `s_number` varchar(200) DEFAULT NULL,
  `s_doc` varchar(200) DEFAULT NULL,
  `s_pat_number` varchar(200) DEFAULT NULL,
  `s_pat_name` varchar(200) DEFAULT NULL,
  `s_pat_ailment` varchar(200) DEFAULT NULL,
  `s_pat_date` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `s_pat_status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--

--

--
-- Table structure for table `his_vitals`
--

CREATE TABLE `his_vitals` (
  `vit_id` int(20) NOT NULL,
  `vit_number` varchar(200) DEFAULT NULL,
  `vit_pat_number` varchar(200) DEFAULT NULL,
  `vit_bodytemp` varchar(200) DEFAULT NULL,
  `vit_heartpulse` varchar(200) DEFAULT NULL,
  `vit_resprate` varchar(200) DEFAULT NULL,
  `vit_bloodpress` varchar(200) DEFAULT NULL,
  `vit_daterec` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--


--
-- Table structure for table `his_wards`
--

CREATE TABLE `his_wards` (
  `ward_id` int(11) NOT NULL,
  `ward_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `his_wards`
--

INSERT INTO `his_wards` (`ward_id`, `ward_name`) VALUES
(1, 'Ward 1'),
(2, 'Ward 2'),
(3, 'Ward 3'),
(4, 'Ward 4');

--


--

--
-- Indexes for table `his_admin`
--
ALTER TABLE `his_admin`
  ADD PRIMARY KEY (`ad_id`);

--

--
-- Indexes for table `his_beds`
--
ALTER TABLE `his_beds`
  ADD PRIMARY KEY (`bed_id`),
  ADD KEY `ward_id` (`ward_id`),
  ADD KEY `pat_id` (`pat_id`);

--
-- Indexes for table `his_docs`
--
ALTER TABLE `his_docs`
  ADD PRIMARY KEY (`doc_id`);

--

--
-- Indexes for table `his_laboratory`
--
ALTER TABLE `his_laboratory`
  ADD PRIMARY KEY (`lab_id`);

--
-- Indexes for table `his_medical_records`
--
ALTER TABLE `his_medical_records`
  ADD PRIMARY KEY (`mdr_id`);

--
-- Indexes for table `his_patients`
--
ALTER TABLE `his_patients`
  ADD PRIMARY KEY (`pat_id`);

--
-- Indexes for table `his_patient_transfers`
--
ALTER TABLE `his_patient_transfers`
  ADD PRIMARY KEY (`t_id`);

--

--

--


--
-- Indexes for table `his_prescriptions`
--
ALTER TABLE `his_prescriptions`
  ADD PRIMARY KEY (`pres_id`);

--
-- Indexes for table `his_pwdresets`
--
ALTER TABLE `his_pwdresets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `his_surgery`
--
ALTER TABLE `his_surgery`
  ADD PRIMARY KEY (`s_id`);

--

--
-- Indexes for table `his_vitals`
--
ALTER TABLE `his_vitals`
  ADD PRIMARY KEY (`vit_id`);

--
-- Indexes for table `his_wards`
--
ALTER TABLE `his_wards`
  ADD PRIMARY KEY (`ward_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--


--
-- AUTO_INCREMENT for table `his_admin`
--
ALTER TABLE `his_admin`
  MODIFY `ad_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--


--
-- AUTO_INCREMENT for table `his_beds`
--
ALTER TABLE `his_beds`
  MODIFY `bed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `his_docs`
--
ALTER TABLE `his_docs`
  MODIFY `doc_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--

--
-- AUTO_INCREMENT for table `his_laboratory`
--
ALTER TABLE `his_laboratory`
  MODIFY `lab_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `his_medical_records`
--
ALTER TABLE `his_medical_records`
  MODIFY `mdr_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `his_patients`
--
ALTER TABLE `his_patients`
  MODIFY `pat_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `his_patient_transfers`
--
ALTER TABLE `his_patient_transfers`
  MODIFY `t_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;



--
-- AUTO_INCREMENT for table `his_prescriptions`
--
ALTER TABLE `his_prescriptions`
  MODIFY `pres_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `his_pwdresets`
--
ALTER TABLE `his_pwdresets`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `his_surgery`
--
ALTER TABLE `his_surgery`
  MODIFY `s_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--


--
-- AUTO_INCREMENT for table `his_vitals`
--
ALTER TABLE `his_vitals`
  MODIFY `vit_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `his_wards`
--
ALTER TABLE `his_wards`
  MODIFY `ward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--

--

--
-- Constraints for table `his_beds`
--
ALTER TABLE `his_beds`
  ADD CONSTRAINT `his_beds_ibfk_1` FOREIGN KEY (`ward_id`) REFERENCES `his_wards` (`ward_id`),
  ADD CONSTRAINT `his_beds_ibfk_2` FOREIGN KEY (`pat_id`) REFERENCES `his_patients` (`pat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
