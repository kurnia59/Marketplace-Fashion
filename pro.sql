-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 22, 2018 at 09:07 PM
-- Server version: 10.2.3-MariaDB-log
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pro`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `ADD_ID` int(11) NOT NULL,
  `DISTRICT_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ADD_NAME` text NOT NULL,
  `ADD_POSTCODE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `ADMIN_ID` int(11) NOT NULL,
  `CRE_ID` int(11) DEFAULT NULL,
  `ADMIN_EMAIL` varchar(50) NOT NULL,
  `ADMIN_USERNAME` varchar(50) NOT NULL,
  `ADMIN_FIRSTNAME` varchar(50) NOT NULL,
  `ADMIN_LASTNAME` varchar(50) DEFAULT NULL,
  `ADMIN_PASSWORD` text NOT NULL,
  `ADMIN_PHONE` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `COMPANY_BANK_ID` int(11) NOT NULL,
  `ACCOUNT_NUMBER` varchar(50) NOT NULL,
  `BANK_NAME` varchar(50) NOT NULL,
  `BANK_LOGO` text DEFAULT NULL,
  `ACCOUNT_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank_payment`
--

CREATE TABLE `bank_payment` (
  `BP_ID` int(11) NOT NULL,
  `COMPANY_BANK_ID` int(11) DEFAULT NULL,
  `ADMIN_ID` int(11) DEFAULT NULL,
  `AMOUNT` int(11) NOT NULL,
  `CONFIRMATION_PIC_URL` text NOT NULL,
  `CONFIRMED` tinyint(1) NOT NULL,
  `PAYMENT_TIME_CREATE` datetime NOT NULL,
  `CONFIRMATION_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CAT_ID` int(11) NOT NULL,
  `CAT_NAME` varchar(50) NOT NULL,
  `GENDER` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `CHAT_ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `USE_USER_ID` int(11) DEFAULT NULL,
  `MESSAGE` varchar(200) NOT NULL,
  `CHAT_TIME_CREATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `CITY_ID` int(11) NOT NULL,
  `PROVINCE_ID` int(11) DEFAULT NULL,
  `CITY_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `credential`
--

CREATE TABLE `credential` (
  `CRE_ID` int(11) NOT NULL,
  `CRE_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `DISTRICT_ID` int(11) NOT NULL,
  `CITY_ID` int(11) DEFAULT NULL,
  `DISTRICT_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `FAVORITE_ID` int(11) NOT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `FAVORITE_TIME_CREATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `PRODUCT_ID` int(11) NOT NULL,
  `CAT_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `SECONDHAND` tinyint(1) NOT NULL DEFAULT 1,
  `DESCRIPTION` text DEFAULT NULL,
  `PRODUCT_PRICE` int(11) DEFAULT NULL,
  `PIC_MAIN` varchar(6) NOT NULL DEFAULT '0',
  `PIC_0_URL` text NOT NULL,
  `PIC_1_URL` text DEFAULT NULL,
  `PIC_2_URL` text DEFAULT NULL,
  `PIC_3_URL` text DEFAULT NULL,
  `PIC_4_URL` text DEFAULT NULL,
  `PIC_5_URL` text DEFAULT NULL,
  `PIC_6_URL` text DEFAULT NULL,
  `PIC_7_URL` text DEFAULT NULL,
  `PIC_8_URL` text DEFAULT NULL,
  `TIMES_VIEWED` int(11) NOT NULL DEFAULT 0,
  `PRODUCT_TIME_CREATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_buy`
--

CREATE TABLE `product_buy` (
  `BUY_ID` int(11) NOT NULL,
  `PS_ID` int(11) DEFAULT NULL,
  `BP_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `WP_ID` int(11) DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `PRICE_DEAL` int(11) NOT NULL,
  `BUY_DONE` datetime DEFAULT NULL,
  `BUY_TIME_CREATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_return`
--

CREATE TABLE `product_return` (
  `PR_ID` int(11) NOT NULL,
  `WP_ID` int(11) DEFAULT NULL,
  `BUY_ID` int(11) DEFAULT NULL,
  `BP_ID` int(11) DEFAULT NULL,
  `PS_ID` int(11) DEFAULT NULL,
  `PR_TIME_CREATE` datetime DEFAULT NULL,
  `PR_DONE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_shipment`
--

CREATE TABLE `product_shipment` (
  `PS_ID` int(11) NOT NULL,
  `PS_COST` int(11) NOT NULL,
  `PS_RECEIPT` varchar(50) DEFAULT NULL,
  `PS_RECEIVED_TIME` datetime DEFAULT NULL,
  `PS_RECEIPT_TIME_CREATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `PROVINCE_ID` int(11) NOT NULL,
  `PROVINCE_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `USER_ID` int(11) NOT NULL,
  `USER_EMAIL` varchar(50) NOT NULL,
  `USER_USERNAME` varchar(50) NOT NULL,
  `USER_FIRSTNAME` varchar(20) NOT NULL,
  `USER_LASTNAME` varchar(20) DEFAULT NULL,
  `USER_PASSWORD` text NOT NULL,
  `USER_PROFILE_PIC` text DEFAULT NULL,
  `USER_PHONE` varchar(15) DEFAULT NULL,
  `WALLET_BALANCE` int(11) NOT NULL DEFAULT 0,
  `PRODUCT_SOLD` int(11) NOT NULL DEFAULT 0,
  `USER_TIME_CREATE` datetime DEFAULT NULL,
  `USER_LAST_ONLINE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USER_ID`, `USER_EMAIL`, `USER_USERNAME`, `USER_FIRSTNAME`, `USER_LASTNAME`, `USER_PASSWORD`, `USER_PROFILE_PIC`, `USER_PHONE`, `WALLET_BALANCE`, `PRODUCT_SOLD`, `USER_TIME_CREATE`, `USER_LAST_ONLINE`) VALUES
(1, 'tes@tes.com', 'tes', 'tes', 'tes', '28b662d883b6d76fd96e4ddc5e9ba780', 'instagram_circle-128.png', '081', 0, 0, '2018-04-22 10:19:32', '2018-04-22 12:26:15');

-- --------------------------------------------------------

--
-- Table structure for table `user_bank`
--

CREATE TABLE `user_bank` (
  `UB_ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `UB_ACCOUNT_NUMBER` varchar(50) NOT NULL,
  `UB_ACCOUNT_NAME` varchar(50) NOT NULL,
  `UB_BANK_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_payment`
--

CREATE TABLE `wallet_payment` (
  `WP_ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `USE_USER_ID` int(11) DEFAULT NULL,
  `WP_AMOUNT` int(11) NOT NULL,
  `WP_TIME_CREATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_withdrawal`
--

CREATE TABLE `wallet_withdrawal` (
  `WW_ID` int(11) NOT NULL,
  `COMPANY_BANK_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ADMIN_ID` int(11) DEFAULT NULL,
  `UB_ID` int(11) DEFAULT NULL,
  `AMOUNT` int(11) NOT NULL,
  `WW_RECEIPT_PIC_URL` text DEFAULT NULL,
  `WW_TIME_CREATE` datetime NOT NULL,
  `WW_DONE` tinyint(1) NOT NULL,
  `WW_DONE_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ADD_ID`),
  ADD KEY `FK_RELATIONSHIP_28` (`USER_ID`),
  ADD KEY `FK_RELATIONSHIP_29` (`DISTRICT_ID`);

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`ADMIN_ID`),
  ADD KEY `FK_ADMIN_ACCESS_TYPE` (`CRE_ID`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`COMPANY_BANK_ID`);

--
-- Indexes for table `bank_payment`
--
ALTER TABLE `bank_payment`
  ADD PRIMARY KEY (`BP_ID`),
  ADD KEY `FK_ADMIN_IN_CHARGE_OF_BANK_TRANSFER_PAYMENT` (`ADMIN_ID`),
  ADD KEY `FK_PAY_THROUGH_BANK` (`COMPANY_BANK_ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CAT_ID`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`CHAT_ID`),
  ADD KEY `FK_RECEIVER` (`USE_USER_ID`),
  ADD KEY `FK_SENDER` (`USER_ID`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`CITY_ID`),
  ADD KEY `FK_CITIES_IN_PROVINCE` (`PROVINCE_ID`);

--
-- Indexes for table `credential`
--
ALTER TABLE `credential`
  ADD PRIMARY KEY (`CRE_ID`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`DISTRICT_ID`),
  ADD KEY `FK_DISTRICTS__IN_PROVINCE` (`CITY_ID`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`FAVORITE_ID`),
  ADD KEY `FK_FAVORITE_PRODUCT` (`PRODUCT_ID`),
  ADD KEY `FK_PRODUCT_FAVORITE` (`USER_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PRODUCT_ID`),
  ADD KEY `FK_PRODUCT_CATEGORY` (`CAT_ID`),
  ADD KEY `FK_USER_HAS_PRODUCTS` (`USER_ID`);

--
-- Indexes for table `product_buy`
--
ALTER TABLE `product_buy`
  ADD PRIMARY KEY (`BUY_ID`),
  ADD KEY `FK_PRODUCT_BOUGHT` (`PRODUCT_ID`),
  ADD KEY `FK_PRODUCT_OR_PRODUCTS_SHIPMENT` (`PS_ID`),
  ADD KEY `FK_PRODUCT_PAID_BY_BANK_TRANSFER` (`BP_ID`),
  ADD KEY `FK_PRODUCT_PAID_BY_WALLET` (`WP_ID`),
  ADD KEY `FK_USER_BUYS_PRODUCT` (`USER_ID`);

--
-- Indexes for table `product_return`
--
ALTER TABLE `product_return`
  ADD PRIMARY KEY (`PR_ID`),
  ADD KEY `FK_PRODUCT_RETURN_SHIPMENT` (`PS_ID`),
  ADD KEY `FK_PRUDUCT_BOUGHT__RETURNED` (`BUY_ID`),
  ADD KEY `FK_RETURN_MONEY_BY_BANK_TRANSFER` (`BP_ID`),
  ADD KEY `FK_RETURN_MONEY_BY_WALLET_PAYMENT` (`WP_ID`);

--
-- Indexes for table `product_shipment`
--
ALTER TABLE `product_shipment`
  ADD PRIMARY KEY (`PS_ID`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`PROVINCE_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Indexes for table `user_bank`
--
ALTER TABLE `user_bank`
  ADD PRIMARY KEY (`UB_ID`),
  ADD KEY `FK_USER_HAS_BANK_ACCOUNT` (`USER_ID`);

--
-- Indexes for table `wallet_payment`
--
ALTER TABLE `wallet_payment`
  ADD PRIMARY KEY (`WP_ID`),
  ADD KEY `FK_PAY_THROUGH_WALLET__PAYER_` (`USE_USER_ID`),
  ADD KEY `FK_WALLET_PAYMENT_RECEIVER` (`USER_ID`);

--
-- Indexes for table `wallet_withdrawal`
--
ALTER TABLE `wallet_withdrawal`
  ADD PRIMARY KEY (`WW_ID`),
  ADD KEY `FK_ADMIN_IN_CHARGE_OF_WITHDRAWAL` (`ADMIN_ID`),
  ADD KEY `FK_COMPANY_BANK_USED_FOR_WITHDRAWAL` (`COMPANY_BANK_ID`),
  ADD KEY `FK_USER_WITHDRAWS_WALLET` (`USER_ID`),
  ADD KEY `FK_WITHDRAW__TO_BANK` (`UB_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `ADD_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `ADMIN_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `COMPANY_BANK_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bank_payment`
--
ALTER TABLE `bank_payment`
  MODIFY `BP_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `CHAT_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `credential`
--
ALTER TABLE `credential`
  MODIFY `CRE_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `FAVORITE_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `PRODUCT_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_buy`
--
ALTER TABLE `product_buy`
  MODIFY `BUY_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_return`
--
ALTER TABLE `product_return`
  MODIFY `PR_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_shipment`
--
ALTER TABLE `product_shipment`
  MODIFY `PS_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_bank`
--
ALTER TABLE `user_bank`
  MODIFY `UB_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wallet_payment`
--
ALTER TABLE `wallet_payment`
  MODIFY `WP_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wallet_withdrawal`
--
ALTER TABLE `wallet_withdrawal`
  MODIFY `WW_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_RELATIONSHIP_28` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  ADD CONSTRAINT `FK_RELATIONSHIP_29` FOREIGN KEY (`DISTRICT_ID`) REFERENCES `district` (`DISTRICT_ID`);

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `FK_ADMIN_ACCESS_TYPE` FOREIGN KEY (`CRE_ID`) REFERENCES `credential` (`CRE_ID`);

--
-- Constraints for table `bank_payment`
--
ALTER TABLE `bank_payment`
  ADD CONSTRAINT `FK_ADMIN_IN_CHARGE_OF_BANK_TRANSFER_PAYMENT` FOREIGN KEY (`ADMIN_ID`) REFERENCES `administrator` (`ADMIN_ID`),
  ADD CONSTRAINT `FK_PAY_THROUGH_BANK` FOREIGN KEY (`COMPANY_BANK_ID`) REFERENCES `bank` (`COMPANY_BANK_ID`);

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `FK_RECEIVER` FOREIGN KEY (`USE_USER_ID`) REFERENCES `user` (`USER_ID`),
  ADD CONSTRAINT `FK_SENDER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `FK_CITIES_IN_PROVINCE` FOREIGN KEY (`PROVINCE_ID`) REFERENCES `province` (`PROVINCE_ID`);

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `FK_DISTRICTS__IN_PROVINCE` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`);

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `FK_FAVORITE_PRODUCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  ADD CONSTRAINT `FK_PRODUCT_FAVORITE` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_PRODUCT_CATEGORY` FOREIGN KEY (`CAT_ID`) REFERENCES `category` (`CAT_ID`),
  ADD CONSTRAINT `FK_USER_HAS_PRODUCTS` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

--
-- Constraints for table `product_buy`
--
ALTER TABLE `product_buy`
  ADD CONSTRAINT `FK_PRODUCT_BOUGHT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`),
  ADD CONSTRAINT `FK_PRODUCT_OR_PRODUCTS_SHIPMENT` FOREIGN KEY (`PS_ID`) REFERENCES `product_shipment` (`PS_ID`),
  ADD CONSTRAINT `FK_PRODUCT_PAID_BY_BANK_TRANSFER` FOREIGN KEY (`BP_ID`) REFERENCES `bank_payment` (`BP_ID`),
  ADD CONSTRAINT `FK_PRODUCT_PAID_BY_WALLET` FOREIGN KEY (`WP_ID`) REFERENCES `wallet_payment` (`WP_ID`),
  ADD CONSTRAINT `FK_USER_BUYS_PRODUCT` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

--
-- Constraints for table `product_return`
--
ALTER TABLE `product_return`
  ADD CONSTRAINT `FK_PRODUCT_RETURN_SHIPMENT` FOREIGN KEY (`PS_ID`) REFERENCES `product_shipment` (`PS_ID`),
  ADD CONSTRAINT `FK_PRUDUCT_BOUGHT__RETURNED` FOREIGN KEY (`BUY_ID`) REFERENCES `product_buy` (`BUY_ID`),
  ADD CONSTRAINT `FK_RETURN_MONEY_BY_BANK_TRANSFER` FOREIGN KEY (`BP_ID`) REFERENCES `bank_payment` (`BP_ID`),
  ADD CONSTRAINT `FK_RETURN_MONEY_BY_WALLET_PAYMENT` FOREIGN KEY (`WP_ID`) REFERENCES `wallet_payment` (`WP_ID`);

--
-- Constraints for table `user_bank`
--
ALTER TABLE `user_bank`
  ADD CONSTRAINT `FK_USER_HAS_BANK_ACCOUNT` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

--
-- Constraints for table `wallet_payment`
--
ALTER TABLE `wallet_payment`
  ADD CONSTRAINT `FK_PAY_THROUGH_WALLET__PAYER_` FOREIGN KEY (`USE_USER_ID`) REFERENCES `user` (`USER_ID`),
  ADD CONSTRAINT `FK_WALLET_PAYMENT_RECEIVER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

--
-- Constraints for table `wallet_withdrawal`
--
ALTER TABLE `wallet_withdrawal`
  ADD CONSTRAINT `FK_ADMIN_IN_CHARGE_OF_WITHDRAWAL` FOREIGN KEY (`ADMIN_ID`) REFERENCES `administrator` (`ADMIN_ID`),
  ADD CONSTRAINT `FK_COMPANY_BANK_USED_FOR_WITHDRAWAL` FOREIGN KEY (`COMPANY_BANK_ID`) REFERENCES `bank` (`COMPANY_BANK_ID`),
  ADD CONSTRAINT `FK_USER_WITHDRAWS_WALLET` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  ADD CONSTRAINT `FK_WITHDRAW__TO_BANK` FOREIGN KEY (`UB_ID`) REFERENCES `user_bank` (`UB_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
