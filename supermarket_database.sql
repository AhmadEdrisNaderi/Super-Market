-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 04, 2015 at 08:50 AM
-- Server version: 5.1.30-community
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `supermarket`
--
CREATE DATABASE IF NOT EXISTS `supermarket` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `supermarket`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(32) NOT NULL,
  `balance` float NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `balance`) VALUES
(1, 'Ali', 3500),
(2, 'Ahmad', 1973.6),
(3, 'Layla', 995.4),
(6, 'Hamid', 1000),
(7, 'ali shah', 100),
(8, 'ali ahmad', 500),
(9, 'ali reza', 400),
(11, 'ahmad jawad', 597);

-- --------------------------------------------------------

--
-- Table structure for table `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(32) NOT NULL,
  `unitprice` float NOT NULL,
  `category` varchar(32) NOT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `goods`
--

INSERT INTO `goods` (`goods_id`, `goods_name`, `unitprice`, `category`) VALUES
(1, 'Gensing Energy', 0.8, 'Energy Drink'),
(2, 'Cake', 1.4, 'Desert'),
(3, 'Milk', 1, 'Diary'),
(4, 'Rani', 1, 'Juice');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `sales_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `sale_date` datetime NOT NULL,
  `quantity` smallint(6) NOT NULL,
  PRIMARY KEY (`sales_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `customer_id`, `goods_id`, `sale_date`, `quantity`) VALUES
(1, 9, 2, '2015-03-02 00:00:00', 2),
(2, 3, 4, '2015-03-02 00:00:00', 3),
(3, 2, 1, '2015-03-02 12:03:47', 33),
(4, 11, 3, '2015-03-02 12:03:54', 3),
(5, 3, 1, '2015-03-04 10:40:18', 2),
(6, 9, 3, '2015-02-24 10:30:22', 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE IF NOT EXISTS `user_level` (
  `user_id` int(11) NOT NULL,
  `admin_level` tinyint(4) NOT NULL,
  `goods_level` tinyint(4) NOT NULL,
  `customer_level` tinyint(4) NOT NULL,
  `sales_level` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`user_id`, `admin_level`, `goods_level`, `customer_level`, `sales_level`) VALUES
(1, 8, 8, 8, 8),
(9, 0, 1, 8, 1),
(10, 0, 1, 1, 8),
(11, 0, 8, 1, 1),
(12, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`) VALUES
(1, 'administrator', '*A4B6157319038724E3560894F7F932C8886EBFCF'),
(9, 'ali', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257'),
(10, 'layla', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257'),
(11, 'ahmad', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257'),
(12, 'Gol Agha', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
