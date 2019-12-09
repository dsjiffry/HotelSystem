-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 29, 2018 at 06:25 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deletedhotelsystem`
--
CREATE DATABASE IF NOT EXISTS `deletedhotelsystem` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `deletedhotelsystem`;

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

DROP TABLE IF EXISTS `applicants`;
CREATE TABLE IF NOT EXISTS `applicants` (
  `Aid` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  `NIC` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `qualifications` varchar(150) NOT NULL,
  `BDay` date NOT NULL,
  `phone` varchar(150) NOT NULL,
  `Gender` varchar(150) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`Aid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `StaffID` int(11) NOT NULL,
  `ArrTime` time NOT NULL,
  `Lvtime` time NOT NULL,
  `Name` varchar(150) NOT NULL,
  `Date` date NOT NULL,
  `Month` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `AttnType` varchar(150) NOT NULL DEFAULT 'day',
  `Overtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `numberofRooms` int(11) NOT NULL,
  `amount` double NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `guestID` int(11) DEFAULT NULL,
  `paymentID` int(11) DEFAULT NULL,
  `today` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_booking_guestID` (`guestID`),
  KEY `fk_bookings_PaymentID` (`paymentID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drinks`
--

DROP TABLE IF EXISTS `drinks`;
CREATE TABLE IF NOT EXISTS `drinks` (
  `menuId` int(11) NOT NULL,
  `Dtype` varchar(150) NOT NULL,
  `dName` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `taxID` int(11) DEFAULT NULL,
  `itemCode` int(11) NOT NULL,
  `staffID` int(11) NOT NULL,
  `month` varchar(150) NOT NULL,
  `Year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
CREATE TABLE IF NOT EXISTS `guest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `type` varchar(150) NOT NULL,
  `number` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
CREATE TABLE IF NOT EXISTS `halls` (
  `number` int(11) NOT NULL,
  `type` varchar(150) NOT NULL,
  `price` double NOT NULL,
  `ReservationID` int(11) DEFAULT NULL,
  `GuestID` int(11) DEFAULT NULL,
  `Booked` tinyint(1) NOT NULL,
  `discount` double NOT NULL,
  PRIMARY KEY (`number`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `cost` double NOT NULL,
  `category` varchar(150) NOT NULL,
  `description` varchar(150) NOT NULL,
  `UOM` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `qty` int(11) NOT NULL,
  `store` varchar(300) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `laundry`
--

DROP TABLE IF EXISTS `laundry`;
CREATE TABLE IF NOT EXISTS `laundry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `Item` varchar(150) NOT NULL,
  `noOfItems` int(11) NOT NULL,
  `Ltype` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
CREATE TABLE IF NOT EXISTS `leaves` (
  `StaffID` int(11) NOT NULL,
  `LType` varchar(150) NOT NULL,
  `LeavesNeeded` double NOT NULL,
  `approval` varchar(150) NOT NULL,
  `FromDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Reason` varchar(1500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(150) NOT NULL,
  `password` int(150) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

DROP TABLE IF EXISTS `meals`;
CREATE TABLE IF NOT EXISTS `meals` (
  `menuId` int(11) NOT NULL,
  `mtype` varchar(150) NOT NULL,
  `foodName` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Sender` varchar(50) NOT NULL,
  `Message` varchar(1500) NOT NULL,
  `Receiver` varchar(50) NOT NULL,
  `Reply` varchar(1500) DEFAULT NULL,
  `Received` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `tableNO` varchar(150) NOT NULL,
  `paid` varchar(150) NOT NULL DEFAULT 'No',
  `paymentID` int(11) DEFAULT NULL,
  `menuID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `type` varchar(150) NOT NULL,
  `taxID` int(11) DEFAULT NULL,
  `GuestID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paymentitems`
--

DROP TABLE IF EXISTS `paymentitems`;
CREATE TABLE IF NOT EXISTS `paymentitems` (
  `paymentID` int(11) NOT NULL,
  `ItemsID` int(11) NOT NULL,
  PRIMARY KEY (`paymentID`,`ItemsID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permenant`
--

DROP TABLE IF EXISTS `permenant`;
CREATE TABLE IF NOT EXISTS `permenant` (
  `staffID` int(11) DEFAULT NULL,
  `Experiance` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recieved`
--

DROP TABLE IF EXISTS `recieved`;
CREATE TABLE IF NOT EXISTS `recieved` (
  `itemNo` int(11) NOT NULL AUTO_INCREMENT,
  `supName` varchar(150) NOT NULL,
  `qty` int(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `itemCode` int(11) NOT NULL,
  `totalCost` double NOT NULL,
  `cost` double NOT NULL,
  PRIMARY KEY (`itemNo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `requested`
--

DROP TABLE IF EXISTS `requested`;
CREATE TABLE IF NOT EXISTS `requested` (
  `itemCode` int(11) NOT NULL AUTO_INCREMENT,
  `supName` varchar(150) NOT NULL,
  `qty` int(40) NOT NULL,
  `date_of_order` varchar(25) NOT NULL,
  `itemName` varchar(200) NOT NULL,
  `category` varchar(300) NOT NULL,
  `UOM` varchar(200) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`itemCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tableNo` int(11) NOT NULL,
  `type` varchar(150) DEFAULT NULL,
  `noOfGuests` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `date` date NOT NULL,
  `guestId` int(11) DEFAULT NULL,
  `needs` varchar(150) DEFAULT NULL,
  `phone` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservationtables`
--

DROP TABLE IF EXISTS `reservationtables`;
CREATE TABLE IF NOT EXISTS `reservationtables` (
  `reservationID` int(11) NOT NULL,
  `tablesID` int(11) NOT NULL,
  PRIMARY KEY (`reservationID`,`tablesID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `number` int(11) NOT NULL,
  `type` varchar(150) NOT NULL,
  `price` double NOT NULL,
  `BookingID` int(11) DEFAULT NULL,
  `Booked` tinyint(1) NOT NULL,
  `GuestID` int(11) DEFAULT NULL,
  `discount` double DEFAULT '0',
  PRIMARY KEY (`number`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roomstaff`
--

DROP TABLE IF EXISTS `roomstaff`;
CREATE TABLE IF NOT EXISTS `roomstaff` (
  `RoomNo` int(11) NOT NULL,
  `StaffId` int(11) NOT NULL,
  PRIMARY KEY (`RoomNo`,`StaffId`),
  KEY `fk_roomstaff_staffID` (`StaffId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
CREATE TABLE IF NOT EXISTS `shift` (
  `StaffID` int(11) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `wTime` int(11) NOT NULL,
  `Department` varchar(150) NOT NULL,
  `type` varchar(150) NOT NULL DEFAULT 'day',
  `date` date NOT NULL,
  `roomNo` int(11) DEFAULT NULL,
  `workPlace` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `NIC` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `gender` varchar(150) NOT NULL,
  `Bday` date NOT NULL,
  `designation` varchar(150) NOT NULL,
  `contactNo` varchar(150) NOT NULL,
  `department` varchar(150) NOT NULL,
  `Employd` varchar(150) NOT NULL,
  `EmpType` varchar(150) NOT NULL,
  `JoinDate` date NOT NULL,
  `Salary` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1007 DEFAULT CHARSET=latin1;

--
-- Triggers `staff`
--
DROP TRIGGER IF EXISTS `CreateLogin`;
DELIMITER $$
CREATE TRIGGER `CreateLogin` AFTER INSERT ON `staff` FOR EACH ROW BEGIN

		INSERT INTO login (username) VALUES (NEW.id);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staffitems`
--

DROP TABLE IF EXISTS `staffitems`;
CREATE TABLE IF NOT EXISTS `staffitems` (
  `StaffID` int(11) NOT NULL,
  `ItemsID` int(11) NOT NULL,
  PRIMARY KEY (`StaffID`,`ItemsID`),
  KEY `fk_staffItems_StaffID` (`ItemsID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stafflaundry`
--

DROP TABLE IF EXISTS `stafflaundry`;
CREATE TABLE IF NOT EXISTS `stafflaundry` (
  `laundryID` int(11) NOT NULL,
  `StaffId` int(11) NOT NULL,
  PRIMARY KEY (`laundryID`,`StaffId`),
  KEY `fk_stafflaundry_staffID` (`StaffId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `NIC` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `contactPerson` varchar(150) NOT NULL,
  `companyName` varchar(100) NOT NULL,
  `store` varchar(200) NOT NULL,
  `itemName` varchar(200) NOT NULL,
  `itemCode` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplieritems`
--

DROP TABLE IF EXISTS `supplieritems`;
CREATE TABLE IF NOT EXISTS `supplieritems` (
  `supplierID` int(11) NOT NULL,
  `ItemsID` int(11) NOT NULL,
  PRIMARY KEY (`supplierID`,`ItemsID`),
  KEY `fk_supplierItems_itemsID` (`ItemsID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
CREATE TABLE IF NOT EXISTS `tables` (
  `tid` int(11) NOT NULL,
  `view` varchar(150) NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
CREATE TABLE IF NOT EXISTS `tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `income` double NOT NULL,
  `taxrate` double NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL,
  `taxAmount` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trainee`
--

DROP TABLE IF EXISTS `trainee`;
CREATE TABLE IF NOT EXISTS `trainee` (
  `staffID` int(11) NOT NULL,
  `TPeriod` varchar(150) NOT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
CREATE TABLE IF NOT EXISTS `transfer` (
  `itemCode` int(11) NOT NULL AUTO_INCREMENT,
  `Tdate` varchar(150) NOT NULL,
  `Tdept` varchar(150) NOT NULL,
  `suplierName` varchar(300) NOT NULL,
  `qty` int(11) NOT NULL,
  `balanceQty` int(11) NOT NULL,
  PRIMARY KEY (`itemCode`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
--
-- Database: `hotelreports`
--
CREATE DATABASE IF NOT EXISTS `hotelreports` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hotelreports`;

-- --------------------------------------------------------

--
-- Table structure for table `receptionmonthlyguest`
--

DROP TABLE IF EXISTS `receptionmonthlyguest`;
CREATE TABLE IF NOT EXISTS `receptionmonthlyguest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GuestIDtype` varchar(150) NOT NULL,
  `GuestIDNumber` varchar(150) NOT NULL,
  `GuestEmail` varchar(150) NOT NULL,
  `NoOfVisits` int(11) NOT NULL DEFAULT '0',
  `NoOfDaysTotal` int(11) NOT NULL DEFAULT '0',
  `NoOfRoomsTotal` int(11) NOT NULL DEFAULT '0',
  `month` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `GuestEmail` (`GuestEmail`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receptionmonthlyguest`
--

INSERT INTO `receptionmonthlyguest` (`ID`, `GuestIDtype`, `GuestIDNumber`, `GuestEmail`, `NoOfVisits`, `NoOfDaysTotal`, `NoOfRoomsTotal`, `month`) VALUES
(1, 'NIC', '423570018V', 'KristenLiliana@gmail.com', 1, 3, 2, 'Oct'),
(2, 'NIC', '396024196V', 'SkyeTopsy@hotmail.com', 1, 3, 4, 'Oct'),
(3, 'Passport', '171705579', 'LaytonMitchell@yahoo.com', 1, 2, 1, 'Oct'),
(4, 'Passport', '728978471', 'DaynaWarrick@gmail.com', 1, 3, 1, 'Oct'),
(5, 'Passport', '234699130', 'CaitlinLotus@hotmail.com', 1, 3, 2, 'Oct'),
(7, 'Passport', '543885705', 'Alex_Rider@hotmail.com', 1, 3, 1, 'Oct');
--
-- Database: `hotelsystem`
--
CREATE DATABASE IF NOT EXISTS `hotelsystem` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hotelsystem`;

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

DROP TABLE IF EXISTS `applicants`;
CREATE TABLE IF NOT EXISTS `applicants` (
  `Aid` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  `NIC` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `qualifications` varchar(150) NOT NULL,
  `BDay` date NOT NULL,
  `phone` varchar(150) NOT NULL,
  `Gender` varchar(150) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`Aid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicants`
--

INSERT INTO `applicants` (`Aid`, `Name`, `NIC`, `email`, `qualifications`, `BDay`, `phone`, `Gender`, `Address`, `Date`) VALUES
(1, 'Rosalyn Esmond', '807291662V', 'RosalynEsmond@gmail.com', 'Management\r\n', '1991-03-15', '0739882093', 'Female', '565 Summer Ave. \r\nRichmond, VA 23223', '2018-10-01'),
(2, 'Woodrow Kalyn', '163759250', 'WoodrowKalyn@hotmail.com', 'Maintenance and Cleaning', '1998-06-10', '0713759250\r\n', 'Male', '9466 Mill Pond Street \r\nNorthville, MI 48167', '2018-09-30'),
(3, 'Curt Brooke', '132333752V', 'CurtBrooke@yahoo.com', 'Food and Beverage Preparation', '1991-03-28', '0737983303', 'Male', '9406 1st Rd. \r\nEast Stroudsburg, PA 18301', '2018-10-02'),
(4, 'Terra Shane', '242051330V', 'TerraShane@gmail.com', 'Hotel Operations', '1994-01-16', '0713552800', 'Female', '71 Trusel Street \r\nMentor, OH 44060', '2018-10-01'),
(5, 'Vicky Laurissa', '777259725V', 'VickyLaurissa@hotmail.com', 'Personal Skills', '1998-08-10', '0771571216', 'Female', '30 South Gainsway Ave. \r\nElyria, OH 44035', '2018-10-01');

--
-- Triggers `applicants`
--
DROP TRIGGER IF EXISTS `deltedApplicants`;
DELIMITER $$
CREATE TRIGGER `deltedApplicants` BEFORE DELETE ON `applicants` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.applicants(`Name`, `NIC`, `email`, `qualifications`, `BDay`, `phone`, `Gender`, `Address`, `Date`) 
        VALUES (OLD.`Name`, OLD.`NIC`, OLD.`email`, OLD.`qualifications`, OLD.`BDay`, OLD.`phone`, OLD.`Gender`, OLD.`Address`, OLD.`Date`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `StaffID` int(11) NOT NULL,
  `ArrTime` time NOT NULL,
  `Lvtime` time NOT NULL,
  `Name` varchar(150) NOT NULL,
  `Date` date NOT NULL,
  `Month` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `AttnType` varchar(150) NOT NULL DEFAULT 'day',
  `Overtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `attendance`
--
DROP TRIGGER IF EXISTS `deltedAttendance`;
DELIMITER $$
CREATE TRIGGER `deltedAttendance` BEFORE DELETE ON `attendance` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.attendance(`StaffID`, `ArrTime`, `Lvtime`, `Name`, `Date`, `Month`, `Year`, `AttnType`, `Overtime`)
        VALUES (OLD.`StaffID`, OLD.`ArrTime`, OLD.`Lvtime`, OLD.`Name`, OLD.`Date`, OLD.`Month`, OLD.`Year`, OLD.`AttnType`, OLD.`Overtime`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `numberofRooms` int(11) NOT NULL,
  `amount` double NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `guestID` int(11) DEFAULT NULL,
  `paymentID` int(11) DEFAULT NULL,
  `today` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_booking_guestID` (`guestID`),
  KEY `fk_bookings_PaymentID` (`paymentID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `type`, `paid`, `numberofRooms`, `amount`, `startDate`, `endDate`, `guestID`, `paymentID`, `today`) VALUES
(1, 'Single', 0, 2, 90000, '2018-10-01', '2018-10-04', 1, 1, 0),
(2, 'Double', 0, 4, 360000, '2018-10-02', '2018-10-05', 2, 2, 0),
(3, 'Triple', 0, 1, 100000, '2018-10-03', '2018-10-05', 3, 3, 0),
(4, 'Single', 0, 1, 45000, '2018-10-09', '2018-10-12', 4, 4, 0),
(5, 'Single', 0, 2, 90000, '2018-10-14', '2018-10-17', 5, 5, 0);

--
-- Triggers `bookings`
--
DROP TRIGGER IF EXISTS `deltedBookings`;
DELIMITER $$
CREATE TRIGGER `deltedBookings` BEFORE DELETE ON `bookings` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`bookings`(`type`, `paid`, `numberofRooms`, `amount`, `startDate`, `endDate`, `guestID`, `paymentID`, `today`)
        VALUES (OLD.`type`, OLD.`paid`, OLD.`numberofRooms`, OLD.`amount`, OLD.`startDate`, OLD.`endDate`, OLD.`guestID`, OLD.`paymentID`, OLD.`today`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `drinks`
--

DROP TABLE IF EXISTS `drinks`;
CREATE TABLE IF NOT EXISTS `drinks` (
  `menuId` int(11) NOT NULL,
  `Dtype` varchar(150) NOT NULL,
  `dName` varchar(150) NOT NULL,
  UNIQUE KEY `menuId` (`menuId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drinks`
--

INSERT INTO `drinks` (`menuId`, `Dtype`, `dName`) VALUES
(100, 'Juice', 'Wood Apple juice'),
(102, 'Juice', 'lime Juice'),
(103, 'Beer', 'Tin Beer'),
(104, 'Liquor', 'Red Lable'),
(105, 'Liquor', 'Black Lable');

--
-- Triggers `drinks`
--
DROP TRIGGER IF EXISTS `delteddrinks`;
DELIMITER $$
CREATE TRIGGER `delteddrinks` BEFORE DELETE ON `drinks` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`drinks`(`menuId`, `Dtype`, `dName`)
        VALUES (`menuId`, `Dtype`, `dName`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `taxID` int(11) DEFAULT NULL,
  `itemCode` int(11) NOT NULL,
  `staffID` int(11) NOT NULL,
  `month` varchar(150) NOT NULL,
  `Year` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_expenses_taxID` (`taxID`),
  KEY `fk_expenses_itemCode` (`itemCode`),
  KEY `fk_expenses_staffID` (`staffID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `expenses`
--
DROP TRIGGER IF EXISTS `deltedexpenses`;
DELIMITER $$
CREATE TRIGGER `deltedexpenses` BEFORE DELETE ON `expenses` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`expenses`( `amount`, `taxID`, `itemCode`, `staffID`, `month`, `Year`)
        VALUES (OLD.`amount`, OLD.`taxID`, OLD.`itemCode`, OLD.`staffID`, OLD.`month`, OLD.`Year`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
CREATE TABLE IF NOT EXISTS `guest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `type` varchar(150) NOT NULL,
  `number` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`ID`, `name`, `email`, `type`, `number`) VALUES
(1, 'Kristen Liliana', 'KristenLiliana@gmail.com', 'NIC', '423570018V'),
(2, 'Skye Topsy', 'SkyeTopsy@hotmail.com', 'NIC', '396024196V'),
(3, 'Layton Mitchell', 'LaytonMitchell@yahoo.com', 'Passport', '171705579'),
(4, 'Dayna Warrick', 'DaynaWarrick@gmail.com', 'Passport', '728978471'),
(5, 'Caitlin Lotus', 'CaitlinLotus@hotmail.com', 'Passport', '234699130');

--
-- Triggers `guest`
--
DROP TRIGGER IF EXISTS `deltedguest`;
DELIMITER $$
CREATE TRIGGER `deltedguest` BEFORE DELETE ON `guest` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`guest`( `name`, `email`, `type`, `number`)
        VALUES (OLD.`name`, OLD.`email`, OLD.`type`, OLD.`number`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
CREATE TABLE IF NOT EXISTS `halls` (
  `number` int(11) NOT NULL,
  `type` varchar(150) NOT NULL,
  `price` double NOT NULL,
  `ReservationID` int(11) DEFAULT NULL,
  `GuestID` int(11) DEFAULT NULL,
  `Booked` tinyint(1) NOT NULL,
  `discount` double NOT NULL,
  PRIMARY KEY (`number`),
  KEY `fk_halls_ReservationID` (`ReservationID`),
  KEY `fk_halls_GuestID` (`GuestID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `halls`
--

INSERT INTO `halls` (`number`, `type`, `price`, `ReservationID`, `GuestID`, `Booked`, `discount`) VALUES
(9901, 'Hall 01', 80000, NULL, NULL, 0, 0),
(9902, 'Hall 02', 100000, NULL, NULL, 0, 0);

--
-- Triggers `halls`
--
DROP TRIGGER IF EXISTS `deltedhalls`;
DELIMITER $$
CREATE TRIGGER `deltedhalls` BEFORE DELETE ON `halls` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`halls`(`number`, `type`, `price`, `ReservationID`, `GuestID`, `Booked`, `discount`)
        VALUES (`number`, `type`, `price`, `ReservationID`, `GuestID`, `Booked`, `discount`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `cost` double NOT NULL,
  `category` varchar(150) NOT NULL,
  `description` varchar(150) NOT NULL,
  `UOM` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `qty` int(11) NOT NULL,
  `store` varchar(300) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `items`
--
DROP TRIGGER IF EXISTS `delteditems`;
DELIMITER $$
CREATE TRIGGER `delteditems` BEFORE DELETE ON `items` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`items`(`cost`, `category`, `description`, `UOM`, `name`, `qty`, `store`)
        VALUES (OLD.`cost`, OLD.`category`, OLD.`description`, OLD.`UOM`, OLD.`name`, OLD.`qty`, OLD.`store`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laundry`
--

DROP TABLE IF EXISTS `laundry`;
CREATE TABLE IF NOT EXISTS `laundry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `Item` varchar(150) NOT NULL,
  `noOfItems` int(11) NOT NULL,
  `Ltype` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `laundry`
--
DROP TRIGGER IF EXISTS `deltedlaundry`;
DELIMITER $$
CREATE TRIGGER `deltedlaundry` BEFORE DELETE ON `laundry` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`laundry`(`date`, `Item`, `noOfItems`, `Ltype`)
        VALUES (OLD.`date`, OLD.`Item`, OLD.`noOfItems`, OLD.`Ltype`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
CREATE TABLE IF NOT EXISTS `leaves` (
  `StaffID` int(11) NOT NULL,
  `LType` varchar(150) NOT NULL,
  `LeavesNeeded` double NOT NULL,
  `approval` varchar(150) NOT NULL,
  `FromDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Reason` varchar(1500) NOT NULL,
  KEY `fk_leaves_StaffID` (`StaffID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `leaves`
--
DROP TRIGGER IF EXISTS `deltedleaves`;
DELIMITER $$
CREATE TRIGGER `deltedleaves` BEFORE DELETE ON `leaves` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`leaves`(`StaffID`, `LType`, `LeavesNeeded`, `approval`, `FromDate`, `EndDate`, `Reason`)
        VALUES (OLD.`StaffID`, OLD.`LType`, OLD.`LeavesNeeded`, OLD.`approval`, OLD.`FromDate`, OLD.`EndDate`, OLD.`Reason`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(150) NOT NULL,
  `password` int(150) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('1000', 1509442),
('1001', 1509442),
('1002', 1509442),
('1003', 1509442),
('1004', 1509442),
('1005', 1509442),
('1006', 1509442),
('9999', 92668751);

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

DROP TABLE IF EXISTS `meals`;
CREATE TABLE IF NOT EXISTS `meals` (
  `menuId` int(11) NOT NULL,
  `mtype` varchar(150) NOT NULL,
  `foodName` varchar(150) NOT NULL,
  UNIQUE KEY `menuId` (`menuId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meals`
--

INSERT INTO `meals` (`menuId`, `mtype`, `foodName`) VALUES
(1, 'Starters', 'Chicken Soup'),
(2, 'Main Cause', 'Sea Food Rice'),
(3, 'dessert', 'Ice Cream'),
(4, 'Starters', 'Mushroom Soup '),
(8, 'Starters', 'mutton Soup'),
(7, 'Starters', 'veg corn soup'),
(9, 'Starters', 'Beef soup'),
(10, 'Main Cause', 'Chicken Fried Rice'),
(11, 'Main Cause', 'Noodles'),
(12, 'Main Cause', 'Beef Fried Rice'),
(13, 'Main Cause', 'Rice & Curry'),
(14, 'dessert', 'custard Pudding'),
(15, 'dessert', 'jelly'),
(16, 'dessert', 'Fruit Salad '),
(17, 'dessert', 'watalapam');

--
-- Triggers `meals`
--
DROP TRIGGER IF EXISTS `deltedmeals`;
DELIMITER $$
CREATE TRIGGER `deltedmeals` BEFORE DELETE ON `meals` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`meals`(`menuId`, `mtype`, `foodName`)
        VALUES (OLD.`menuId`, OLD.`mtype`, OLD.`foodName`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`ID`, `price`) VALUES
(1, 200),
(2, 550),
(3, 150),
(4, 250),
(8, 350),
(7, 150),
(9, 350),
(10, 450),
(11, 550),
(12, 600),
(13, 200),
(14, 250),
(15, 150),
(16, 200),
(17, 600),
(100, 150),
(102, 100),
(103, 360),
(104, 1500),
(105, 2600);

--
-- Triggers `menu`
--
DROP TRIGGER IF EXISTS `deltedmenu`;
DELIMITER $$
CREATE TRIGGER `deltedmenu` BEFORE DELETE ON `menu` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`menu`(`price`)
        VALUES (OLD.`price`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Sender` varchar(50) NOT NULL,
  `Message` varchar(1500) NOT NULL,
  `Receiver` varchar(50) NOT NULL,
  `Reply` varchar(1500) DEFAULT NULL,
  `Received` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `tableNO` varchar(150) NOT NULL,
  `paid` varchar(150) NOT NULL DEFAULT 'No',
  `paymentID` int(11) DEFAULT NULL,
  `menuID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_paymentID` (`paymentID`),
  KEY `fk_orders_menuID` (`menuID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `orders`
--
DROP TRIGGER IF EXISTS `deltedorders`;
DELIMITER $$
CREATE TRIGGER `deltedorders` BEFORE DELETE ON `orders` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`orders`(`quantity`, `tableNO`, `paid`, `paymentID`, `menuID`)
        VALUES (OLD.`quantity`, OLD.`tableNO`, OLD.`paid`, OLD.`paymentID`, OLD.`menuID`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `type` varchar(150) NOT NULL,
  `taxID` int(11) DEFAULT NULL,
  `GuestID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_taxID` (`taxID`),
  KEY `fk_payment_guestID` (`GuestID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `amount`, `discount`, `type`, `taxID`, `GuestID`) VALUES
(1, 22500, 0, 'Advance', NULL, 1),
(2, 90000, 0, 'Advance', NULL, 2),
(3, 25000, 0, 'Advance', NULL, 3),
(4, 11250, 0, 'Advance', NULL, 4),
(5, 22500, 0, 'Advance', NULL, 5);

--
-- Triggers `payment`
--
DROP TRIGGER IF EXISTS `deltedpayment`;
DELIMITER $$
CREATE TRIGGER `deltedpayment` BEFORE DELETE ON `payment` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`payment`(`amount`, `discount`, `type`, `taxID`, `GuestID`)
        VALUES (OLD.`amount`, OLD.`discount`, OLD.`type`, OLD.`taxID`, OLD.`GuestID`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `paymentitems`
--

DROP TABLE IF EXISTS `paymentitems`;
CREATE TABLE IF NOT EXISTS `paymentitems` (
  `paymentID` int(11) NOT NULL,
  `ItemsID` int(11) NOT NULL,
  PRIMARY KEY (`paymentID`,`ItemsID`),
  KEY `fk_paymentItems_itemsID` (`ItemsID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `paymentitems`
--
DROP TRIGGER IF EXISTS `deltedpaymentitems`;
DELIMITER $$
CREATE TRIGGER `deltedpaymentitems` BEFORE DELETE ON `paymentitems` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`paymentitems`(`paymentID`, `ItemsID`)
        VALUES (OLD.`paymentID`, OLD.`ItemsID`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `permenant`
--

DROP TABLE IF EXISTS `permenant`;
CREATE TABLE IF NOT EXISTS `permenant` (
  `staffID` int(11) DEFAULT NULL,
  `Experiance` int(11) NOT NULL,
  KEY `fk_permenant_staffID` (`staffID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `permenant`
--
DROP TRIGGER IF EXISTS `deltedpermenant`;
DELIMITER $$
CREATE TRIGGER `deltedpermenant` BEFORE DELETE ON `permenant` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`permenant`(`staffID`, `Experiance`)
        VALUES (`staffID`, `Experiance`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `recieved`
--

DROP TABLE IF EXISTS `recieved`;
CREATE TABLE IF NOT EXISTS `recieved` (
  `itemNo` int(11) NOT NULL AUTO_INCREMENT,
  `supName` varchar(150) NOT NULL,
  `qty` int(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `itemCode` int(11) NOT NULL,
  `totalCost` double NOT NULL,
  `cost` double NOT NULL,
  PRIMARY KEY (`itemNo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `recieved`
--
DROP TRIGGER IF EXISTS `deltedrecieved`;
DELIMITER $$
CREATE TRIGGER `deltedrecieved` BEFORE DELETE ON `recieved` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`recieved`(`supName`, `qty`, `date`, `itemCode`, `totalCost`, `cost`)
        VALUES (OLD.`supName`, OLD.`qty`, OLD.`date`, OLD.`itemCode`, OLD.`totalCost`, OLD.`cost`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `requested`
--

DROP TABLE IF EXISTS `requested`;
CREATE TABLE IF NOT EXISTS `requested` (
  `itemCode` int(11) NOT NULL AUTO_INCREMENT,
  `supName` varchar(150) NOT NULL,
  `qty` int(40) NOT NULL,
  `date_of_order` varchar(25) NOT NULL,
  `itemName` varchar(200) NOT NULL,
  `category` varchar(300) NOT NULL,
  `UOM` varchar(200) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`itemCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `requested`
--
DROP TRIGGER IF EXISTS `deltedrequested`;
DELIMITER $$
CREATE TRIGGER `deltedrequested` BEFORE DELETE ON `requested` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`requested`(`supName`, `qty`, `date_of_order`, `itemName`, `category`, `UOM`, `description`)
        VALUES (OLD.`supName`, OLD.`qty`, OLD.`date_of_order`, OLD.`itemName`, OLD.`category`, OLD.`UOM`, OLD.`description`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tableNo` int(11) NOT NULL,
  `type` varchar(150) DEFAULT NULL,
  `noOfGuests` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `date` date NOT NULL,
  `guestId` int(11) DEFAULT NULL,
  `needs` varchar(150) DEFAULT NULL,
  `phone` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reservation_guestID` (`guestId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `reservation`
--
DROP TRIGGER IF EXISTS `deltedreservation`;
DELIMITER $$
CREATE TRIGGER `deltedreservation` BEFORE DELETE ON `reservation` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`reservation`(`tableNo`, `type`, `noOfGuests`, `time`, `date`, `guestId`, `needs`, `phone`)
        VALUES (OLD.`tableNo`, OLD.`type`, OLD.`noOfGuests`, OLD.`time`, OLD.`date`, OLD.`guestId`, OLD.`needs`, OLD.`phone`);		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reservationtables`
--

DROP TABLE IF EXISTS `reservationtables`;
CREATE TABLE IF NOT EXISTS `reservationtables` (
  `reservationID` int(11) NOT NULL,
  `tablesID` int(11) NOT NULL,
  PRIMARY KEY (`reservationID`,`tablesID`),
  KEY `fk_reservationTables_tablesID` (`tablesID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `reservationtables`
--
DROP TRIGGER IF EXISTS `deltedreservationtables`;
DELIMITER $$
CREATE TRIGGER `deltedreservationtables` BEFORE DELETE ON `reservationtables` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`reservationtables`(`reservationID`, `tablesID`)
        VALUES (OLD.`reservationID`, OLD.`tablesID`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `number` int(11) NOT NULL,
  `type` varchar(150) NOT NULL,
  `price` double NOT NULL,
  `BookingID` int(11) DEFAULT NULL,
  `Booked` tinyint(1) NOT NULL,
  `GuestID` int(11) DEFAULT NULL,
  `discount` double DEFAULT '0',
  PRIMARY KEY (`number`),
  KEY `fk_Room_BookingID` (`BookingID`),
  KEY `fk_room_guestID` (`GuestID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`number`, `type`, `price`, `BookingID`, `Booked`, `GuestID`, `discount`) VALUES
(101, 'Single', 15000, NULL, 0, NULL, 0),
(102, 'Single', 15000, NULL, 0, NULL, 0),
(103, 'Double', 30000, NULL, 0, NULL, 0),
(104, 'Double', 30000, NULL, 0, NULL, 0),
(105, 'Triple', 50000, NULL, 0, NULL, 0),
(201, 'Single', 15000, NULL, 0, NULL, 0),
(202, 'Single', 15000, NULL, 0, NULL, 0),
(203, 'Double', 30000, NULL, 0, NULL, 0),
(204, 'Double', 30000, NULL, 0, NULL, 0),
(205, 'Triple', 50000, NULL, 0, NULL, 0),
(301, 'Single', 15000, NULL, 0, NULL, 0),
(302, 'Single', 15000, NULL, 0, NULL, 0),
(303, 'Double', 30000, NULL, 0, NULL, 0),
(304, 'Double', 30000, NULL, 0, NULL, 0),
(305, 'Triple', 50000, NULL, 0, NULL, 0),
(401, 'Single', 15000, NULL, 0, NULL, 0),
(402, 'Single', 15000, NULL, 0, NULL, 0),
(403, 'Double', 30000, NULL, 0, NULL, 0),
(404, 'Double', 30000, NULL, 0, NULL, 0),
(405, 'Triple', 50000, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `roomstaff`
--

DROP TABLE IF EXISTS `roomstaff`;
CREATE TABLE IF NOT EXISTS `roomstaff` (
  `RoomNo` int(11) NOT NULL,
  `StaffId` int(11) NOT NULL,
  PRIMARY KEY (`RoomNo`,`StaffId`),
  KEY `fk_roomstaff_staffID` (`StaffId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
CREATE TABLE IF NOT EXISTS `shift` (
  `StaffID` int(11) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `wTime` int(11) NOT NULL,
  `Department` varchar(150) NOT NULL,
  `type` varchar(150) NOT NULL DEFAULT 'day',
  `date` date NOT NULL,
  `roomNo` int(11) DEFAULT NULL,
  `workPlace` varchar(150) DEFAULT NULL,
  KEY `fk_shift_staffID` (`StaffID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `shift`
--
DROP TRIGGER IF EXISTS `deltedshift`;
DELIMITER $$
CREATE TRIGGER `deltedshift` BEFORE DELETE ON `shift` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`shift`(`StaffID`, `Name`, `wTime`, `Department`, `type`, `date`, `roomNo`, `workPlace`)
        VALUES (OLD.`StaffID`, OLD.`Name`, OLD.`wTime`, OLD.`Department`, OLD.`type`, OLD.`date`, OLD.`roomNo`, OLD.`workPlace`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `NIC` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `gender` varchar(150) NOT NULL,
  `Bday` date NOT NULL,
  `designation` varchar(150) NOT NULL,
  `contactNo` varchar(150) NOT NULL,
  `department` varchar(150) NOT NULL,
  `Employd` varchar(150) NOT NULL,
  `EmpType` varchar(150) NOT NULL,
  `JoinDate` date NOT NULL,
  `Salary` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1007 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `NIC`, `email`, `address`, `gender`, `Bday`, `designation`, `contactNo`, `department`, `Employd`, `EmpType`, `JoinDate`, `Salary`) VALUES
(1000, 'Receptionist23', 'Receptionist23', 'Receptionist23', 'Receptionist23', 'Receptionist23', '2018-09-04', 'Receptionist23', 'Receptionist23', 'Receptionist', 'Receptionist23', 'Receptionist23', '2018-09-12', 45656456),
(1001, 'Accounting', 'Accounting', 'Accounting', 'Accounting', 'Accounting', '2018-09-04', 'Accounting', 'Accounting', 'Accounting', 'Accounting', 'Accounting', '2018-09-12', 45656456),
(1002, 'HR', 'HR', 'HR', 'HR', 'HR', '2018-09-04', 'HR', 'HR', 'HR', 'HR', 'HR', '2018-09-12', 45656456),
(1003, 'Inventory', 'Inventory', 'Inventory', 'Inventory', 'Inventory', '2018-09-04', 'Inventory', 'Inventory', 'Inventory', 'Inventory', 'Inventory', '2018-09-12', 45656456),
(1004, 'HouseKeeping', 'HouseKeeping', 'HouseKeeping', 'HouseKeeping', 'HouseKeeping', '2018-09-04', 'HouseKeeping', 'HouseKeeping', 'HouseKeeping', 'HouseKeeping', 'HouseKeeping', '2018-09-12', 45656456),
(1005, 'Resturant', 'Resturant', 'Resturant', 'Resturant', 'Resturant', '2018-09-04', 'Resturant', 'Resturant', 'Resturant', 'Resturant', 'Resturant', '2018-09-12', 45656456),
(1006, 'POS', 'POS', 'POS', 'POS', 'POS', '2018-09-04', 'POS', 'POS', 'POS', 'POS', 'POS', '2018-09-12', 45656456);

--
-- Triggers `staff`
--
DROP TRIGGER IF EXISTS `CreateLogin`;
DELIMITER $$
CREATE TRIGGER `CreateLogin` AFTER INSERT ON `staff` FOR EACH ROW BEGIN

		INSERT INTO login (username) VALUES (NEW.id);
		
    END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `deltedstaff`;
DELIMITER $$
CREATE TRIGGER `deltedstaff` BEFORE DELETE ON `staff` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`staff`(`name`, `NIC`, `email`, `address`, `gender`, `Bday`, `designation`, `contactNo`, `department`, `Employd`, `EmpType`, `JoinDate`, `Salary`)
        VALUES (OLD.`name`, OLD.`NIC`, OLD.`email`, OLD.`address`, OLD.`gender`, OLD.`Bday`, OLD.`designation`, OLD.`contactNo`, OLD.`department`, OLD.`Employd`, OLD.`EmpType`, OLD.`JoinDate`, OLD.`Salary`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staffitems`
--

DROP TABLE IF EXISTS `staffitems`;
CREATE TABLE IF NOT EXISTS `staffitems` (
  `StaffID` int(11) NOT NULL,
  `ItemsID` int(11) NOT NULL,
  PRIMARY KEY (`StaffID`,`ItemsID`),
  KEY `fk_staffItems_StaffID` (`ItemsID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stafflaundry`
--

DROP TABLE IF EXISTS `stafflaundry`;
CREATE TABLE IF NOT EXISTS `stafflaundry` (
  `laundryID` int(11) NOT NULL,
  `StaffId` int(11) NOT NULL,
  PRIMARY KEY (`laundryID`,`StaffId`),
  KEY `fk_stafflaundry_staffID` (`StaffId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `NIC` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `contactPerson` varchar(150) NOT NULL,
  `companyName` varchar(100) NOT NULL,
  `store` varchar(200) NOT NULL,
  `itemName` varchar(200) NOT NULL,
  `itemCode` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Triggers `supplier`
--
DROP TRIGGER IF EXISTS `deltedsupplier`;
DELIMITER $$
CREATE TRIGGER `deltedsupplier` BEFORE DELETE ON `supplier` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`supplier`(`Name`, `address`, `NIC`, `phone`, `email`, `contactPerson`, `companyName`, `store`, `itemName`, `itemCode`)
        VALUES (OLD.`Name`, OLD.`address`, OLD.`NIC`, OLD.`phone`, OLD.`email`, OLD.`contactPerson`, OLD.`companyName`, OLD.`store`, OLD.`itemName`, OLD.`itemCode`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supplieritems`
--

DROP TABLE IF EXISTS `supplieritems`;
CREATE TABLE IF NOT EXISTS `supplieritems` (
  `supplierID` int(11) NOT NULL,
  `ItemsID` int(11) NOT NULL,
  PRIMARY KEY (`supplierID`,`ItemsID`),
  KEY `fk_supplierItems_itemsID` (`ItemsID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
CREATE TABLE IF NOT EXISTS `tables` (
  `tid` int(11) NOT NULL,
  `view` varchar(150) NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`tid`, `view`, `price`, `amount`) VALUES
(101, 'Window', 0, 2000),
(102, 'Window', 0, 2000),
(103, 'Window', 0, 2000),
(104, 'Window', 0, 2000),
(105, 'Window', 0, 2000),
(106, 'Window', 0, 2000),
(107, 'Normal', 0, 1000),
(108, 'Normal', 0, 1000),
(109, 'Normal', 0, 1000),
(110, 'Window', 0, 2000),
(111, 'Window', 0, 2000),
(112, 'Normal', 0, 1000),
(113, 'Normal', 0, 1000),
(114, 'Normal', 0, 1000),
(115, 'Window', 0, 2000),
(116, 'Window', 0, 2000),
(117, 'Normal', 0, 1000),
(118, 'Normal', 0, 1000),
(119, 'Normal', 0, 1000),
(120, 'Window', 0, 2000),
(121, 'Window', 0, 2000),
(122, 'Normal', 0, 1000),
(123, 'Normal', 0, 1000),
(124, 'Normal', 0, 1000),
(125, 'Window', 0, 2000),
(126, 'Window', 0, 2000),
(127, 'Normal', 0, 1000),
(128, 'Window', 0, 2000),
(129, 'pool', 0, 3000),
(130, 'pool', 0, 3000),
(131, 'pool', 0, 3000),
(132, 'pool', 0, 3000),
(133, 'pool', 0, 3000),
(134, 'pool', 0, 3000);

--
-- Triggers `tables`
--
DROP TRIGGER IF EXISTS `deltedtables`;
DELIMITER $$
CREATE TRIGGER `deltedtables` BEFORE DELETE ON `tables` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`tables`(`tid`, `view`, `price`, `amount`)
        VALUES (OLD.`tid`, OLD.`view`, OLD.`price`, OLD.`amount`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
CREATE TABLE IF NOT EXISTS `tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `income` double NOT NULL,
  `taxrate` double NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL,
  `taxAmount` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`id`, `income`, `taxrate`, `date`, `taxAmount`) VALUES
(10, 3389000, 1.5, 2013, 50835),
(11, 4205500, 2.3, 2014, 96726.5),
(12, 2400000, 1.8, 2015, 43200),
(13, 3200500, 2.1, 2016, 67211.5),
(14, 4101200, 0, 2017, 0);

--
-- Triggers `tax`
--
DROP TRIGGER IF EXISTS `deltedtax`;
DELIMITER $$
CREATE TRIGGER `deltedtax` BEFORE DELETE ON `tax` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`tax`(`income`, `taxrate`, `date`, `taxAmount`)
        VALUES (OLD.`income`, OLD.`taxrate`, OLD.`date`, OLD.`taxAmount`);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `trainee`
--

DROP TABLE IF EXISTS `trainee`;
CREATE TABLE IF NOT EXISTS `trainee` (
  `staffID` int(11) NOT NULL,
  `TPeriod` varchar(150) NOT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
CREATE TABLE IF NOT EXISTS `transfer` (
  `itemCode` int(11) NOT NULL AUTO_INCREMENT,
  `Tdate` varchar(150) NOT NULL,
  `Tdept` varchar(150) NOT NULL,
  `suplierName` varchar(300) NOT NULL,
  `qty` int(11) NOT NULL,
  `balanceQty` int(11) NOT NULL,
  PRIMARY KEY (`itemCode`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Triggers `transfer`
--
DROP TRIGGER IF EXISTS `deltedtransfer`;
DELIMITER $$
CREATE TRIGGER `deltedtransfer` BEFORE DELETE ON `transfer` FOR EACH ROW BEGIN

		INSERT INTO deletedhotelsystem.`transfer`(`Tdate`, `Tdept`, `suplierName`, `qty`, `balanceQty`)
        VALUES (OLD.`Tdate`, OLD.`Tdept`, OLD.`suplierName`, OLD.`qty`, OLD.`balanceQty`);
		
    END
$$
DELIMITER ;
--
-- Database: `oopdb`
--
CREATE DATABASE IF NOT EXISTS `oopdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `oopdb`;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `BookingID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `StartingLocation` varchar(50) NOT NULL,
  `EndingLocation` varchar(50) NOT NULL,
  `Date` varchar(20) NOT NULL,
  `StartingTime` varchar(50) NOT NULL,
  `EndingTime` varchar(50) NOT NULL,
  `Tickets` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `fk_username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingID`, `username`, `StartingLocation`, `EndingLocation`, `Date`, `StartingTime`, `EndingTime`, `Tickets`, `class`, `Price`) VALUES
(1, 'Alex', 'Kandy', 'Colombo Fort', '2018-05-21', '10am', '1pm', 5, 3, 500),
(2, 'John', 'Kandy', 'Colombo Fort', '2018-05-21', '6am', '9am', 2, 1, 600),
(3, 'Jane', 'Kandy', 'Colombo Fort', '2018-05-28', '6am', '9am', 1, 1, 300),
(6, 'Shehan', 'Kandy', 'Colombo Fort', '2018-06-12', '6am', '9am', 2, 1, 600),
(5, 'Alex', 'Colombo Fort', 'Kandy', '2018-05-22', '6am', '9am', 5, 1, 1500),
(7, 'Shehan', 'Kandy', 'Colombo Fort', '2018-06-09', '6am', '9am', 3, 1, 900);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `Message` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
  `Start` varchar(50) NOT NULL,
  `End` varchar(50) NOT NULL,
  `Day` varchar(15) NOT NULL,
  `StartTime` varchar(10) NOT NULL,
  `EndTime` varchar(10) NOT NULL,
  `Price` int(11) NOT NULL,
  `class` int(11) NOT NULL DEFAULT '0',
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TrainID` int(11) NOT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`Start`, `End`, `Day`, `StartTime`, `EndTime`, `Price`, `class`, `ID`, `TrainID`) VALUES
('Kandy', 'Colombo Fort', 'Weekday', '6am', '9am', 100, 3, 33, 149844),
('Kandy', 'Colombo Fort', 'Weekday', '6am', '9am', 200, 2, 34, 149844),
('Kandy', 'Colombo Fort', 'Weekday', '6am', '9am', 300, 1, 35, 149844),
('Kandy', 'Colombo Fort', 'Weekday', '10am', '1pm', 100, 3, 36, 750976),
('Kandy', 'Colombo Fort', 'Weekday', '10am', '1pm', 200, 2, 37, 750976),
('Kandy', 'Colombo Fort', 'Weekday', '10am', '1pm', 300, 1, 38, 750976),
('Colombo Fort', 'Kandy', 'Weekday', '6am', '9am', 300, 1, 41, 552250),
('Colombo Fort', 'Kandy', 'Weekday', '6am', '9am', 200, 2, 42, 552250),
('Colombo Fort', 'Kandy', 'Weekday', '6am', '9am', 100, 3, 43, 552250),
('Colombo Fort', 'Kandy', 'Weekday', '10am', '1pm', 100, 1, 44, 819791),
('Colombo Fort', 'Kandy', 'Weekday', '10am', '1pm', 100, 1, 45, 819791),
('Colombo Fort', 'Kandy', 'Weekday', '10am', '1pm', 100, 1, 46, 819791),
('Kandy', 'Colombo Fort', 'Saturday', '6am', '10am', 200, 2, 47, 552250),
('Kandy', 'Colombo Fort', 'Sunday', '7am', '11am', 200, 2, 48, 552250),
('Kandy', 'Colombo Fort', 'Saturday', '6am', '10am', 200, 2, 49, 552250),
('Kandy', 'Colombo Fort', 'Sunday', '7am', '11am', 200, 2, 50, 552250),
('Colombo Fort', 'Kandy', 'Sunday', '6am', '10am', 200, 2, 51, 552250),
('Colombo Fort', 'Kandy', 'Saturday', '7am', '11am', 200, 2, 52, 552250);

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
CREATE TABLE IF NOT EXISTS `seat` (
  `BookingID` int(11) NOT NULL DEFAULT '0',
  `seatNo` int(11) NOT NULL,
  `ScheduleID` int(11) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`BookingID`,`seatNo`,`ScheduleID`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`BookingID`, `seatNo`, `ScheduleID`, `date`) VALUES
(1, 1, 36, '2018-05-21'),
(1, 2, 36, '2018-05-21'),
(1, 3, 36, '2018-05-21'),
(1, 4, 36, '2018-05-21'),
(1, 5, 36, '2018-05-21'),
(2, 1, 35, '2018-05-21'),
(2, 2, 35, '2018-05-21'),
(3, 1, 35, '2018-05-28'),
(5, 1, 41, '2018-05-22'),
(5, 2, 41, '2018-05-22'),
(5, 3, 41, '2018-05-22'),
(5, 4, 41, '2018-05-22'),
(5, 5, 41, '2018-05-22'),
(6, 1, 35, '2018-06-12'),
(6, 2, 35, '2018-06-12'),
(7, 1, 35, '2018-06-09'),
(7, 2, 35, '2018-06-09'),
(7, 3, 35, '2018-06-09');

-- --------------------------------------------------------

--
-- Table structure for table `ticketsales`
--

DROP TABLE IF EXISTS `ticketsales`;
CREATE TABLE IF NOT EXISTS `ticketsales` (
  `username` varchar(50) NOT NULL,
  `TicketsPurchased` int(11) NOT NULL,
  `Price` double NOT NULL,
  KEY `fk_usernameTicketsales` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticketsales`
--

INSERT INTO `ticketsales` (`username`, `TicketsPurchased`, `Price`) VALUES
('Alex', 10, 2000),
('Mary', 0, 0),
('John', 2, 600),
('Jane', 1, 300),
('Percy', 5, 500),
('Shehan', 5, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
CREATE TABLE IF NOT EXISTS `train` (
  `tid` int(11) NOT NULL,
  `Tstatus` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`tid`, `Tstatus`) VALUES
(149844, 'fine'),
(750976, 'fine'),
(552250, 'fine'),
(819791, 'fine'),
(956157, 'Broken'),
(606212, 'Broken');

-- --------------------------------------------------------

--
-- Table structure for table `trainroute`
--

DROP TABLE IF EXISTS `trainroute`;
CREATE TABLE IF NOT EXISTS `trainroute` (
  `rid` int(11) NOT NULL,
  `Rstatus` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trainroute`
--

INSERT INTO `trainroute` (`rid`, `Rstatus`) VALUES
(530662, 'fine'),
(689659, 'fine'),
(591066, 'Broken'),
(349999, 'fine'),
(133414, 'Broken');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `password` int(50) NOT NULL,
  `age` int(11) NOT NULL,
  `credit` double NOT NULL,
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `UID` (`UID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UID`, `username`, `Email`, `password`, `age`, `credit`) VALUES
(6, 'Alex', 'alex@gmail.com', -917608620, 25, 159753684246),
(7, 'Mary', 'mary@gmail.com', 839615863, 26, 137926845795),
(9, 'Jane', 'jane@gmail.com', -1827185084, 28, 951753684153),
(8, 'John', 'john@gmail.com', -1431649977, 30, 351624789138),
(10, 'Percy', 'percy@gmail.com', 428625663, 35, 139742681579),
(11, 'Shehan', 'dsjiffry@gmail.com', 1678712877, 22, 156374582445);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
