-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 03, 2024 at 02:56 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `frame_me`
--

-- --------------------------------------------------------

--
-- Table structure for table `aboutPage`
--

CREATE TABLE `aboutPage` (
  `id` int(11) NOT NULL,
  `bioText` text DEFAULT NULL,
  `mainImage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aboutPage`
--

INSERT INTO `aboutPage` (`id`, `bioText`, `mainImage`) VALUES
(1, '<h1>Enok Da Rocha Medeiros: The Poet with a Lens</h1>\n<p>Enok Da Rocha Medeiros, a dedicated photographer from Brazil...</p>\n<p>His work is a celebration of life’s simple pleasures...</p>\n<h3>let\'s celebrate life together!!!</h3>\n<h1>i love pekenito muchissimo</h1>\nHello world', 'uploads/1732922434_Main.png');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL,
  `orderDetailsID` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `addressID` int(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'active',
  `type` varchar(20) NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerID`, `orderDetailsID`, `firstName`, `lastName`, `email`, `password`, `phone`, `dob`, `addressID`, `created_at`, `status`, `type`) VALUES
(7, 0, 'Max', 'Gabriel', 'maxim.don.mg@gmail.com', '$2y$10$dVMSLXzCUVad4JeYNry2r.6sr9.9jrOQ01HFYZFXBKKO3Kzxn0GCe', '4168560684', '1985-11-04', NULL, '2024-11-23 20:40:35', 'active', 'admin'),
(9, 0, 'Max', 'Gabriel', 'maxim.don1.mg@gmail.com', '$2y$10$5NPLzhOlyIcmeBGAveBVaO7NH19/RNZjzzogtw9A.mWVv8rwJJBfS', '4168560684', '2024-11-09', NULL, '2024-11-30 01:41:30', 'blocked', 'customer'),
(10, 0, 'Max', 'Gabriel', '123123maxim.don.mg@gmail.com', '$2y$10$YFG3IvIWcUJR8cMM6D70POkRyaamo1eoRHBMNPX6xc.5qR6OhRbZm', '4168560684', '2024-10-30', NULL, '2024-11-30 01:42:15', 'active', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `main_gallery`
--

CREATE TABLE `main_gallery` (
  `id` int(11) NOT NULL,
  `sText` text NOT NULL,
  `sImageMain` varchar(255) NOT NULL,
  `nText` text NOT NULL,
  `nImageMain` varchar(255) NOT NULL,
  `aText` text NOT NULL,
  `aImageMain` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_gallery`
--

INSERT INTO `main_gallery` (`id`, `sText`, `sImageMain`, `nText`, `nImageMain`, `aText`, `aImageMain`) VALUES
(1, '<h3> Pekeno loves good looking guys muchissimo</h3>123123', 'uploads/1732922494_sFile.png', '<h3> Pekeno loves nature muchissimo</h3>\r\nasdfasf123123123', 'uploads/1732922494_nFile.png', '<h3> Pekeno loves city lines muchissimo too!</h3>123123', 'uploads/1732922494_aFile.png');

-- --------------------------------------------------------

--
-- Table structure for table `nature_gallery`
--

CREATE TABLE `nature_gallery` (
  `pictureID` int(11) NOT NULL,
  `natureHigh` varchar(255) DEFAULT NULL,
  `natureLow` varchar(255) DEFAULT NULL,
  `price` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nature_gallery`
--

INSERT INTO `nature_gallery` (`pictureID`, `natureHigh`, `natureLow`, `price`) VALUES
(50, 'uploads/1733103681_natureHigh.jpg', 'uploads/1733103681_natureLow.jpg', 124.30),
(51, 'uploads/1733103698_natureHigh.jpg', 'uploads/1733103698_natureLow.jpg', 123132.99),
(52, 'uploads/1733104063_natureHigh.jpg', 'uploads/1733104063_natureLow.jpg', 123.98),
(53, 'uploads/1733180310_natureHigh.jpg', 'uploads/1733180310_natureLow.jpg', 1000000.99),
(54, 'uploads/1733180327_natureHigh.jpg', 'uploads/1733180327_natureLow.jpg', 99.91),
(55, 'uploads/1733180337_natureHigh.jpg', 'uploads/1733180337_natureLow.jpg', 11.22);

-- --------------------------------------------------------

--
-- Table structure for table `orderDetails`
--

CREATE TABLE `orderDetails` (
  `orderDetailsID` int(11) NOT NULL,
  `orderID` int(20) NOT NULL,
  `date` date NOT NULL,
  `total` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `pictureID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aboutPage`
--
ALTER TABLE `aboutPage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `main_gallery`
--
ALTER TABLE `main_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nature_gallery`
--
ALTER TABLE `nature_gallery`
  ADD PRIMARY KEY (`pictureID`);

--
-- Indexes for table `orderDetails`
--
ALTER TABLE `orderDetails`
  ADD PRIMARY KEY (`orderDetailsID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aboutPage`
--
ALTER TABLE `aboutPage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `main_gallery`
--
ALTER TABLE `main_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nature_gallery`
--
ALTER TABLE `nature_gallery`
  MODIFY `pictureID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `orderDetails`
--
ALTER TABLE `orderDetails`
  MODIFY `orderDetailsID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
