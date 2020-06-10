-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2020 at 04:32 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `RBAC`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_matrix`
--

CREATE TABLE `access_matrix` (
  `Roles` int(11) NOT NULL,
  `Objects_ID` text NOT NULL,
  `Read_Access` tinyint(1) NOT NULL,
  `Write_Access` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access_matrix`
--

INSERT INTO `access_matrix` (`Roles`, `Objects_ID`, `Read_Access`, `Write_Access`) VALUES
(3, 'items', 1, 0),
(3, 'godowns', 1, 1),
(3, '1', 1, 1),
(3, '1p', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` smallint(6) NOT NULL,
  `Customer_Name` varchar(10) NOT NULL,
  `Sales_Exec_ID` smallint(6) NOT NULL,
  `Contact_Number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Customer_Name`, `Sales_Exec_ID`, `Contact_Number`) VALUES
(1, 'Suresh', 2, '9999999995'),
(2, 'Ram', 1, '1234567890'),
(3, 'Hitesh', 1, '1212121212'),
(4, 'Ramesh', 1, '7897897899');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_ID` smallint(6) NOT NULL,
  `Employee_Name` varchar(20) NOT NULL,
  `Supervisor_ID` smallint(6) DEFAULT NULL,
  `Home_Number` varchar(10) NOT NULL,
  `Street` varchar(20) NOT NULL,
  `Pincode` int(6) NOT NULL,
  `Password` text NOT NULL,
  `Clearance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_ID`, `Employee_Name`, `Supervisor_ID`, `Home_Number`, `Street`, `Pincode`, `Password`, `Clearance`) VALUES
(1, 'Rahul', NULL, 'asd', 'asd', 131, '7c4a8d09ca3762af61e59520943dc26494f8941b', 3),
(2, 'K Rahul Reddy', 1, '123', 'Srinivas Nagar, Nitk', 575025, '7b52009b64fd0a2a49e6d8a939753077792b0554', 0),
(3, 'Sush', 2, '12', 'abc', 564789, '7b52009b64fd0a2a49e6d8a939753077792b0554', 0),
(4, 'abc', 1, '123', 'asd', 123456, '7ab515d12bd2cf431745511ac4ee13fed15ab578', 0),
(5, 'rahul', 1, '1', '1', 1, '7c4a8d09ca3762af61e59520943dc26494f8941b', 2),
(6, 'K Rahul Reddy', 1, '12', 'Srinivas Nagar', 575025, '7c4a8d09ca3762af61e59520943dc26494f8941b', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_contacts`
--

CREATE TABLE `employee_contacts` (
  `Employee_ID` smallint(6) NOT NULL,
  `Contact` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_contacts`
--

INSERT INTO `employee_contacts` (`Employee_ID`, `Contact`) VALUES
(1, '9879635456'),
(1, '9999999994'),
(2, '9999999999'),
(4, '9999999994'),
(5, '9599599595'),
(6, '9999999994');

-- --------------------------------------------------------

--
-- Table structure for table `godown`
--

CREATE TABLE `godown` (
  `Godown_ID` smallint(6) NOT NULL,
  `Godown_Location` varchar(20) NOT NULL,
  `Manager_ID` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `godown`
--

INSERT INTO `godown` (`Godown_ID`, `Godown_Location`, `Manager_ID`) VALUES
(1, 'Malpe', 2),
(2, 'Mangalore', 1),
(14, 'asd', 1),
(22, 'gd1', 3),
(23, 'gd2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `godown_item_details`
--

CREATE TABLE `godown_item_details` (
  `Godown_ID` smallint(6) NOT NULL,
  `Item_ID` smallint(6) NOT NULL,
  `Quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `godown_item_details`
--

INSERT INTO `godown_item_details` (`Godown_ID`, `Item_ID`, `Quantity`) VALUES
(2, 1, 100),
(2, 2, 300),
(2, 3, 80),
(2, 5, 460),
(2, 6, 16),
(2, 10, 100),
(14, 1, 5),
(14, 6, 1),
(23, 11, 300);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `Item_ID` smallint(6) NOT NULL,
  `Item_Name` varchar(20) NOT NULL,
  `Item_Units` varchar(10) NOT NULL,
  `Item_Unit_Price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`Item_ID`, `Item_Name`, `Item_Units`, `Item_Unit_Price`) VALUES
(1, 'Good day', 'piece', 6),
(2, 'Good day cashew', 'piece', 10),
(3, 'Good day golden', 'piece', 12),
(4, 'Tomato', 'kg', 20),
(5, 'Potato', 'kg', 15),
(6, 'Bread', 'Loaf', 30),
(7, 'Mango', 'kg', 50),
(8, 'Banana', 'dozen', 35),
(9, 'Cashew', 'kg', 1000),
(10, 'Oranges', 'kg', 50),
(11, 'Apples', 'kg', 100),
(12, 'asd', 'piece', 15),
(13, 'M&M', 'piece', 5),
(14, 'Carrot', 'kg', 10),
(15, 'Capsicum', 'kg', 50),
(16, 'Brinjal', 'kg', 20),
(17, 'Bitter guard', 'kg', 25);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `Purchase_ID` smallint(6) NOT NULL,
  `Supplier_ID` smallint(6) NOT NULL,
  `Godown_ID` smallint(6) NOT NULL,
  `DOP` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`Purchase_ID`, `Supplier_ID`, `Godown_ID`, `DOP`) VALUES
(24, 1, 2, '1970-01-01'),
(25, 3, 2, '1970-01-01'),
(26, 1, 2, '2019-02-02'),
(27, 1, 14, '1970-01-01'),
(28, 4, 14, '1970-01-01'),
(29, 1, 23, '1970-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item_details`
--

CREATE TABLE `purchase_item_details` (
  `Purchase_ID` smallint(6) NOT NULL,
  `Item_ID` smallint(6) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_item_details`
--

INSERT INTO `purchase_item_details` (`Purchase_ID`, `Item_ID`, `Quantity`) VALUES
(24, 1, 2000),
(24, 2, 300),
(24, 6, 30),
(24, 10, 100),
(25, 5, 500),
(26, 3, 80),
(27, 6, 15),
(28, 1, 5),
(29, 11, 400);

-- --------------------------------------------------------

--
-- Table structure for table `restock`
--

CREATE TABLE `restock` (
  `Restock_ID` smallint(6) NOT NULL,
  `Godown_ID` smallint(6) NOT NULL,
  `Showroom_ID` smallint(6) NOT NULL,
  `DOR` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restock`
--

INSERT INTO `restock` (`Restock_ID`, `Godown_ID`, `Showroom_ID`, `DOR`) VALUES
(13, 2, 1, '1970-01-01'),
(14, 14, 1, '1970-01-01'),
(15, 2, 1, '2000-02-02'),
(16, 23, 5, '1970-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `restock_item_details`
--

CREATE TABLE `restock_item_details` (
  `Restock_ID` smallint(6) NOT NULL,
  `Item_ID` smallint(6) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restock_item_details`
--

INSERT INTO `restock_item_details` (`Restock_ID`, `Item_ID`, `Quantity`) VALUES
(13, 1, 1500),
(13, 5, 20),
(13, 6, 10),
(14, 6, 14),
(15, 1, 400),
(15, 5, 20),
(15, 6, 4),
(16, 11, 100);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `Sale_ID` smallint(6) NOT NULL,
  `Showroom_ID` smallint(6) NOT NULL,
  `Customer_ID` smallint(6) NOT NULL,
  `DOS` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`Sale_ID`, `Showroom_ID`, `Customer_ID`, `DOS`) VALUES
(7, 2, 1, '1970-01-01'),
(8, 1, 1, '1970-01-01'),
(9, 5, 4, '1970-01-01'),
(10, 5, 1, '1970-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `sale_item_details`
--

CREATE TABLE `sale_item_details` (
  `Sale_ID` smallint(6) NOT NULL,
  `Item_ID` smallint(6) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_item_details`
--

INSERT INTO `sale_item_details` (`Sale_ID`, `Item_ID`, `Quantity`) VALUES
(8, 1, 20),
(8, 5, 2),
(9, 11, 20),
(10, 11, 3);

-- --------------------------------------------------------

--
-- Table structure for table `showroom`
--

CREATE TABLE `showroom` (
  `Showroom_ID` smallint(6) NOT NULL,
  `Showroom_Name` varchar(20) NOT NULL,
  `Showroom_Location` varchar(20) NOT NULL,
  `Manager_ID` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `showroom`
--

INSERT INTO `showroom` (`Showroom_ID`, `Showroom_Name`, `Showroom_Location`, `Manager_ID`) VALUES
(1, 'Showroom 1', 'Surathkal', 2),
(2, 'Showroom 2', 'Malpe', 2),
(3, 'Showroom 3', 'Malore', 1),
(4, 'Sh3', 'NITK', 3),
(5, 'sh4', 'Surat', 2),
(6, 'asd', 'asdas', 1);

-- --------------------------------------------------------

--
-- Table structure for table `showroom_employee_details`
--

CREATE TABLE `showroom_employee_details` (
  `Showroom_ID` smallint(6) NOT NULL,
  `Employee_ID` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `showroom_employee_details`
--

INSERT INTO `showroom_employee_details` (`Showroom_ID`, `Employee_ID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `showroom_item_details`
--

CREATE TABLE `showroom_item_details` (
  `Showroom_ID` smallint(6) NOT NULL,
  `Item_ID` smallint(6) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `showroom_item_details`
--

INSERT INTO `showroom_item_details` (`Showroom_ID`, `Item_ID`, `Quantity`) VALUES
(1, 1, 480),
(1, 5, 18),
(1, 6, 10),
(5, 11, 77);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_ID` smallint(6) NOT NULL,
  `Supplier_Name` varchar(10) NOT NULL,
  `Supplier_Contact` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_ID`, `Supplier_Name`, `Supplier_Contact`) VALUES
(1, 'Ramesh', '9999998887'),
(3, 'asd', '1321654123'),
(4, 'Supplier 1', '1234567891'),
(5, 'Supplier 2', '9494949494'),
(6, 's', '12'),
(7, 'Sup 3', '12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`),
  ADD KEY `Sales_Exec_ID` (`Sales_Exec_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_ID`),
  ADD KEY `Supervisor_ID` (`Supervisor_ID`);

--
-- Indexes for table `employee_contacts`
--
ALTER TABLE `employee_contacts`
  ADD PRIMARY KEY (`Employee_ID`,`Contact`);

--
-- Indexes for table `godown`
--
ALTER TABLE `godown`
  ADD PRIMARY KEY (`Godown_ID`),
  ADD KEY `Manager_ID` (`Manager_ID`);

--
-- Indexes for table `godown_item_details`
--
ALTER TABLE `godown_item_details`
  ADD PRIMARY KEY (`Godown_ID`,`Item_ID`),
  ADD KEY `Item_ID` (`Item_ID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`Item_ID`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`Purchase_ID`),
  ADD KEY `Godown_ID` (`Godown_ID`),
  ADD KEY `Supplier_ID` (`Supplier_ID`);

--
-- Indexes for table `purchase_item_details`
--
ALTER TABLE `purchase_item_details`
  ADD PRIMARY KEY (`Purchase_ID`,`Item_ID`),
  ADD KEY `Item_ID` (`Item_ID`);

--
-- Indexes for table `restock`
--
ALTER TABLE `restock`
  ADD PRIMARY KEY (`Restock_ID`),
  ADD KEY `Godown_ID` (`Godown_ID`),
  ADD KEY `Showroom_ID` (`Showroom_ID`);

--
-- Indexes for table `restock_item_details`
--
ALTER TABLE `restock_item_details`
  ADD PRIMARY KEY (`Restock_ID`,`Item_ID`),
  ADD KEY `Item_ID` (`Item_ID`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`Sale_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Showroom_ID` (`Showroom_ID`);

--
-- Indexes for table `sale_item_details`
--
ALTER TABLE `sale_item_details`
  ADD PRIMARY KEY (`Sale_ID`,`Item_ID`),
  ADD KEY `Item_ID` (`Item_ID`);

--
-- Indexes for table `showroom`
--
ALTER TABLE `showroom`
  ADD PRIMARY KEY (`Showroom_ID`),
  ADD KEY `Manager_ID` (`Manager_ID`);

--
-- Indexes for table `showroom_employee_details`
--
ALTER TABLE `showroom_employee_details`
  ADD PRIMARY KEY (`Showroom_ID`,`Employee_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- Indexes for table `showroom_item_details`
--
ALTER TABLE `showroom_item_details`
  ADD PRIMARY KEY (`Showroom_ID`,`Item_ID`),
  ADD KEY `Item_ID` (`Item_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `Employee_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `godown`
--
ALTER TABLE `godown`
  MODIFY `Godown_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `Item_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `Purchase_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `restock`
--
ALTER TABLE `restock`
  MODIFY `Restock_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `Sale_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `showroom`
--
ALTER TABLE `showroom`
  MODIFY `Showroom_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `Supplier_ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Sales_Exec_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Supervisor_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_contacts`
--
ALTER TABLE `employee_contacts`
  ADD CONSTRAINT `employee_contacts_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `godown`
--
ALTER TABLE `godown`
  ADD CONSTRAINT `godown_ibfk_1` FOREIGN KEY (`Manager_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `godown_item_details`
--
ALTER TABLE `godown_item_details`
  ADD CONSTRAINT `godown_item_details_ibfk_1` FOREIGN KEY (`Godown_ID`) REFERENCES `godown` (`Godown_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `godown_item_details_ibfk_2` FOREIGN KEY (`Item_ID`) REFERENCES `item` (`Item_ID`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`Godown_ID`) REFERENCES `godown` (`Godown_ID`),
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`Supplier_ID`);

--
-- Constraints for table `purchase_item_details`
--
ALTER TABLE `purchase_item_details`
  ADD CONSTRAINT `purchase_item_details_ibfk_1` FOREIGN KEY (`Purchase_ID`) REFERENCES `purchase` (`Purchase_ID`),
  ADD CONSTRAINT `purchase_item_details_ibfk_2` FOREIGN KEY (`Item_ID`) REFERENCES `item` (`Item_ID`);

--
-- Constraints for table `restock`
--
ALTER TABLE `restock`
  ADD CONSTRAINT `restock_ibfk_1` FOREIGN KEY (`Godown_ID`) REFERENCES `godown` (`Godown_ID`),
  ADD CONSTRAINT `restock_ibfk_2` FOREIGN KEY (`Showroom_ID`) REFERENCES `showroom` (`Showroom_ID`);

--
-- Constraints for table `restock_item_details`
--
ALTER TABLE `restock_item_details`
  ADD CONSTRAINT `restock_item_details_ibfk_1` FOREIGN KEY (`Restock_ID`) REFERENCES `restock` (`Restock_ID`),
  ADD CONSTRAINT `restock_item_details_ibfk_2` FOREIGN KEY (`Item_ID`) REFERENCES `item` (`Item_ID`);

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`Showroom_ID`) REFERENCES `showroom` (`Showroom_ID`);

--
-- Constraints for table `sale_item_details`
--
ALTER TABLE `sale_item_details`
  ADD CONSTRAINT `sale_item_details_ibfk_1` FOREIGN KEY (`Sale_ID`) REFERENCES `sale` (`Sale_ID`),
  ADD CONSTRAINT `sale_item_details_ibfk_2` FOREIGN KEY (`Item_ID`) REFERENCES `item` (`Item_ID`);

--
-- Constraints for table `showroom`
--
ALTER TABLE `showroom`
  ADD CONSTRAINT `showroom_ibfk_1` FOREIGN KEY (`Manager_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `showroom_employee_details`
--
ALTER TABLE `showroom_employee_details`
  ADD CONSTRAINT `showroom_employee_details_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`),
  ADD CONSTRAINT `showroom_employee_details_ibfk_2` FOREIGN KEY (`Showroom_ID`) REFERENCES `showroom` (`Showroom_ID`);

--
-- Constraints for table `showroom_item_details`
--
ALTER TABLE `showroom_item_details`
  ADD CONSTRAINT `showroom_item_details_ibfk_1` FOREIGN KEY (`Showroom_ID`) REFERENCES `showroom` (`Showroom_ID`),
  ADD CONSTRAINT `showroom_item_details_ibfk_2` FOREIGN KEY (`Item_ID`) REFERENCES `item` (`Item_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
