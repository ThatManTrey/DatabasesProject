-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2019 at 03:55 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rival`
--

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `dist_ID` decimal(4,0) NOT NULL,
  `d_name` varchar(15) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`dist_ID`, `d_name`, `address`, `phone`) VALUES
('1111', 'Tyson', '525 Lawrence Street Emporia, K', '3301111111'),
('1234', 'Deer Park', '23 Proctor Street Thomasville,', '3301234567'),
('2222', 'Extra', '9609 South Oakwood Court Summe', '3302222222'),
('3333', 'Miller Lite', '638 St Margarets Drive Wooster', '3303333333'),
('4444', 'Ohio Lottery', '273 SW. Glen Palos Verdes Peni', '3304444444'),
('5555', 'Ritz', '24 Superior Street Franksville', '3305555555'),
('6666', 'Lerch', '11 Strong Street Wooster, OH 4', '3306666666'),
('7777', 'Monster', '111 Burch Street Townsville, N', '3307777777'),
('8888', 'Ohio Gas', '39 Proctor Street Thomasville,', '3308888888');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ID` decimal(4,0) NOT NULL,
  `e_name` varchar(30) DEFAULT NULL,
  `pay` decimal(4,0) DEFAULT NULL
) ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ID`, `e_name`, `pay`) VALUES
('1111', 'Jake', '10'),
('1234', 'Jaden', '10'),
('2222', 'Trey', '10'),
('3333', 'Amjad', '10');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `ID` decimal(4,0) NOT NULL,
  `storenum` decimal(4,0) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`ID`, `storenum`, `role`) VALUES
('1111', '1234', 'Manager'),
('1234', '1111', 'Manager'),
('2222', '1234', 'Manager'),
('3333', '2222', 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `storenum` decimal(4,0) NOT NULL,
  `SKU` decimal(8,0) NOT NULL,
  `no_item` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`storenum`, `SKU`, `no_item`) VALUES
('1111', '11111111', '100'),
('1111', '22222222', '100'),
('1111', '33333333', '100'),
('1111', '44444444', '100'),
('2222', '55555555', '100'),
('2222', '66666666', '100'),
('2222', '77777777', '100'),
('2222', '88888888', '100');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `storenum` decimal(4,0) NOT NULL,
  `l_name` varchar(20) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`storenum`, `l_name`, `address`, `phone`) VALUES
('1111', 'Holmes Sales', '128 Cherry Ave Berlin, OH, 446', '3303303302'),
('1234', 'Stark Sales', '889 Stadelman Ave Akron, OH, 4', '3303303301'),
('2222', 'Wayne Sales', '512 Bosch Street Wooster, OH, ', '3303303303');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ordernum` varchar(5) NOT NULL,
  `dist_ID` decimal(4,0) DEFAULT NULL,
  `storenum` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ordernum`, `dist_ID`, `storenum`) VALUES
('54321', '1234', '2222'),
('54322', '1111', '2222'),
('54323', '2222', '2222'),
('55555', '6666', '1111'),
('55556', '7777', '1111'),
('55557', '8888', '1111'),
('66666', '3333', '1234'),
('66667', '4444', '1234'),
('66668', '5555', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `order_amount`
--

CREATE TABLE `order_amount` (
  `ordernum` varchar(5) NOT NULL,
  `SKU` decimal(8,0) DEFAULT NULL,
  `no_item` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_amount`
--

INSERT INTO `order_amount` (`ordernum`, `SKU`, `no_item`) VALUES
('54321', '11111111', '100');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `SKU` decimal(8,0) NOT NULL,
  `p_name` varchar(20) DEFAULT NULL,
  `p_type` varchar(5) DEFAULT NULL,
  `price` decimal(5,0) DEFAULT NULL,
  `p_size` decimal(5,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`SKU`, `p_name`, `p_type`, `price`, `p_size`) VALUES
('11111111', 'chicken', 'food', '3', '10'),
('12345678', 'water', 'food', '2', '10'),
('22222222', 'gum', 'food', '1', '10'),
('33333333', 'beer', 'food', '3', '10'),
('44444444', 'lottery ticket', 'lotte', '5', '10'),
('55555555', 'crackers', 'food', '2', '10'),
('66666666', 'donut', 'food', '2', '10'),
('77777777', 'monster', 'food', '2', '10'),
('88888888', 'gas', 'gasol', '2', '10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`dist_ID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `storenum` (`storenum`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`storenum`,`SKU`),
  ADD KEY `SKU` (`SKU`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`storenum`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ordernum`),
  ADD KEY `dist_ID` (`dist_ID`),
  ADD KEY `storenum` (`storenum`);

--
-- Indexes for table `order_amount`
--
ALTER TABLE `order_amount`
  ADD PRIMARY KEY (`ordernum`),
  ADD KEY `SKU` (`SKU`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`SKU`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `employee` (`ID`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`storenum`) REFERENCES `location` (`storenum`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`storenum`) REFERENCES `location` (`storenum`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`SKU`) REFERENCES `product` (`SKU`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`dist_ID`) REFERENCES `distributor` (`dist_ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`storenum`) REFERENCES `location` (`storenum`);

--
-- Constraints for table `order_amount`
--
ALTER TABLE `order_amount`
  ADD CONSTRAINT `order_amount_ibfk_1` FOREIGN KEY (`ordernum`) REFERENCES `orders` (`ordernum`),
  ADD CONSTRAINT `order_amount_ibfk_2` FOREIGN KEY (`SKU`) REFERENCES `product` (`SKU`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
