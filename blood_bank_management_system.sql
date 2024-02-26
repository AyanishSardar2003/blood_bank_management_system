-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2024 at 09:48 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blood_bank_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bloodavailable`
--

CREATE TABLE `bloodavailable` (
  `BID` int(11) NOT NULL,
  `Blood_Type` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bloodavailable`
--

INSERT INTO `bloodavailable` (`BID`, `Blood_Type`, `Quantity`) VALUES
(2002, 'A+', 0),
(2002, 'A-', 16),
(2002, 'B+', 9),
(2002, 'B-', 18),
(2002, 'AB+', 25),
(2002, 'AB-', 28),
(2002, 'O+', 14),
(2002, 'O-', 13);

-- --------------------------------------------------------

--
-- Table structure for table `bloodbank`
--

CREATE TABLE `bloodbank` (
  `BID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Contact` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bloodbank`
--

INSERT INTO `bloodbank` (`BID`, `Name`, `Address`, `Contact`) VALUES
(2002, 'Kolkata Blood Center', 'ABC, Saltlake', 'kolkata.bloodcenter@example.com'),
(3003, 'Mumbai Blood Bank', '123 Gandhi Street', 'contact@mumbaibloodbank.com'),
(4004, 'Chennai Blood Center', '456 Main Street', 'chennai.bloodcenter@example.com'),
(5005, 'Hyderabad Blood Bank', 'LMN Avenue', 'hyderabad.bloodbank@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `dispatchlogs`
--

CREATE TABLE `dispatchlogs` (
  `RID` int(11) NOT NULL,
  `RequestID` int(11) NOT NULL,
  `Blood_Type` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donorregistration`
--

CREATE TABLE `donorregistration` (
  `DonorID` int(11) NOT NULL,
  `First_Name` varchar(30) DEFAULT NULL,
  `Last_Name` varchar(30) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` enum('Male','Female','other') DEFAULT NULL,
  `Date_of_birth` date DEFAULT NULL,
  `Blood_Type` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `Last_Donation_Time` int(11) DEFAULT NULL,
  `Contact_number` text,
  `Email` text,
  `Address` text,
  `Disease` enum('HIV','Blood Cancer','Anaemia','Dog Bite','None of these') DEFAULT NULL,
  `Username` text,
  `Password` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donorregistration`
--

INSERT INTO `donorregistration` (`DonorID`, `First_Name`, `Last_Name`, `Age`, `Gender`, `Date_of_birth`, `Blood_Type`, `Last_Donation_Time`, `Contact_number`, `Email`, `Address`, `Disease`, `Username`, `Password`) VALUES
(2, 'Vicky', 'Vicky', 199, 'Male', '1000-12-12', 'AB+', 0, '13', 'abcd', '1234', 'None of these', 'vcky', 'vcky123'),
(4, 'ds', 'dd', 23, 'Male', '2024-01-24', 'A+', 0, '44', 'frf', 'fwf', 'None of these', 'wer', '123');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `RID` int(11) NOT NULL,
  `RequestID` int(11) NOT NULL,
  `FeedbackText` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`RID`, `RequestID`, `FeedbackText`) VALUES
(8, 4743, 'Nice');

-- --------------------------------------------------------

--
-- Table structure for table `pendingrequests`
--

CREATE TABLE `pendingrequests` (
  `RID` int(11) NOT NULL,
  `RequestID` int(11) NOT NULL,
  `Blood_Type` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pendingrequests`
--

INSERT INTO `pendingrequests` (`RID`, `RequestID`, `Blood_Type`, `Quantity`) VALUES
(9, 1774, 'A+', 12);

-- --------------------------------------------------------

--
-- Table structure for table `recipientpastrecords`
--

CREATE TABLE `recipientpastrecords` (
  `RID` int(11) NOT NULL,
  `Disease` text,
  `TreatmentDescription` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipientpastrecords`
--

INSERT INTO `recipientpastrecords` (`RID`, `Disease`, `TreatmentDescription`) VALUES
(9, '', 'trhrh');

-- --------------------------------------------------------

--
-- Table structure for table `recipientregistration`
--

CREATE TABLE `recipientregistration` (
  `RID` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `date_of_birth` date NOT NULL,
  `Blood_Type` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipientregistration`
--

INSERT INTO `recipientregistration` (`RID`, `first_name`, `last_name`, `gender`, `date_of_birth`, `Blood_Type`, `contact_number`, `email`, `address`, `username`, `password`, `registration_date`) VALUES
(8, 'shirshak', 'ghosh', 'Male', '2024-01-16', 'A+', '7595800225', 'sks@gmail.com', 'fsfs', 'shirshak', '12345', '2024-01-13 05:24:32'),
(9, 'aa', 'bb', 'Female', '2000-01-24', 'A+', '1235666', 'aa@gmail.com', 'asdsjkadslajdla', 'aya', '123', '2024-01-13 09:38:26');

-- --------------------------------------------------------

--
-- Table structure for table `recipientrequest`
--

CREATE TABLE `recipientrequest` (
  `RequestID` int(11) NOT NULL,
  `RID` int(11) DEFAULT NULL,
  `RecipientName` varchar(255) DEFAULT NULL,
  `Blood_Type` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `RequestDate` date DEFAULT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipientrequest`
--

INSERT INTO `recipientrequest` (`RequestID`, `RID`, `RecipientName`, `Blood_Type`, `Quantity`, `RequestDate`, `ContactNumber`, `Address`) VALUES
(1774, 9, 'dd', 'A+', 12, '2024-01-13', '0', 'adssadsdada'),
(4743, 8, 'Shirshak Ghosh', 'A+', 45, '2024-01-13', '1234', 'Delhi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloodavailable`
--
ALTER TABLE `bloodavailable`
  ADD PRIMARY KEY (`BID`,`Blood_Type`);

--
-- Indexes for table `bloodbank`
--
ALTER TABLE `bloodbank`
  ADD PRIMARY KEY (`BID`);

--
-- Indexes for table `dispatchlogs`
--
ALTER TABLE `dispatchlogs`
  ADD PRIMARY KEY (`RID`,`RequestID`,`Blood_Type`),
  ADD KEY `RequestID` (`RequestID`);

--
-- Indexes for table `donorregistration`
--
ALTER TABLE `donorregistration`
  ADD PRIMARY KEY (`DonorID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`RID`,`RequestID`),
  ADD KEY `RequestID` (`RequestID`);

--
-- Indexes for table `pendingrequests`
--
ALTER TABLE `pendingrequests`
  ADD PRIMARY KEY (`RID`,`RequestID`,`Blood_Type`),
  ADD KEY `RequestID` (`RequestID`);

--
-- Indexes for table `recipientpastrecords`
--
ALTER TABLE `recipientpastrecords`
  ADD PRIMARY KEY (`RID`);

--
-- Indexes for table `recipientregistration`
--
ALTER TABLE `recipientregistration`
  ADD PRIMARY KEY (`RID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `recipientrequest`
--
ALTER TABLE `recipientrequest`
  ADD PRIMARY KEY (`RequestID`),
  ADD KEY `RID` (`RID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donorregistration`
--
ALTER TABLE `donorregistration`
  MODIFY `DonorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `recipientregistration`
--
ALTER TABLE `recipientregistration`
  MODIFY `RID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `recipientrequest`
--
ALTER TABLE `recipientrequest`
  MODIFY `RequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4744;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bloodavailable`
--
ALTER TABLE `bloodavailable`
  ADD CONSTRAINT `bloodavailable_ibfk_1` FOREIGN KEY (`BID`) REFERENCES `bloodbank` (`BID`);

--
-- Constraints for table `dispatchlogs`
--
ALTER TABLE `dispatchlogs`
  ADD CONSTRAINT `dispatchlogs_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `recipientregistration` (`RID`),
  ADD CONSTRAINT `dispatchlogs_ibfk_2` FOREIGN KEY (`RequestID`) REFERENCES `recipientrequest` (`RequestID`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`RequestID`) REFERENCES `recipientrequest` (`RequestID`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`RID`) REFERENCES `recipientregistration` (`RID`);

--
-- Constraints for table `pendingrequests`
--
ALTER TABLE `pendingrequests`
  ADD CONSTRAINT `pendingrequests_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `recipientregistration` (`RID`),
  ADD CONSTRAINT `pendingrequests_ibfk_2` FOREIGN KEY (`RequestID`) REFERENCES `recipientrequest` (`RequestID`);

--
-- Constraints for table `recipientpastrecords`
--
ALTER TABLE `recipientpastrecords`
  ADD CONSTRAINT `recipientpastrecords_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `recipientregistration` (`RID`);

--
-- Constraints for table `recipientrequest`
--
ALTER TABLE `recipientrequest`
  ADD CONSTRAINT `recipientrequest_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `recipientregistration` (`RID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
