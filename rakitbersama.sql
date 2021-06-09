-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 09, 2021 at 02:29 PM
-- Server version: 5.7.24
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(4, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2021-05-03 04:28:13', '');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Mainboard - Intel', 'Intel', '2017-01-24 19:17:37', '07-05-2021 09:48:22 PM'),
(4, 'Mainboard - Amd', 'Amd', '2017-01-24 19:19:32', '03-05-2021 06:12:16 PM'),
(5, 'Processor Intel', 'Intel Processor', '2017-01-24 19:19:54', '06-05-2021 06:03:16 PM'),
(6, 'Processor AMD', 'Processor AMD', '2017-02-20 19:18:52', '06-05-2021 06:04:06 PM'),
(7, 'RAM', 'RAM', '2021-05-03 03:50:43', '06-05-2021 06:04:16 PM'),
(8, 'HDD Internal 3.5', 'Harddisk Internal\r\n', '2021-05-06 12:35:19', '07-05-2021 09:18:49 PM'),
(9, 'SSD', 'SSD', '2021-05-06 12:35:32', NULL),
(10, 'Graphic Card', 'Graphic Card', '2021-05-06 12:35:44', NULL),
(11, 'Casing', 'Casing', '2021-05-06 12:36:00', NULL),
(12, 'Casing Accessories', 'Casing Accessories', '2021-05-06 12:36:26', NULL),
(13, 'Accessories', 'Accessories', '2021-05-06 12:36:51', NULL),
(14, 'Power Supply', 'Power Supply', '2021-05-06 12:36:58', NULL),
(15, 'Sound Card', 'Sound Card', '2021-05-06 12:37:11', NULL),
(16, 'Cooler', 'Cooler', '2021-05-06 12:37:38', NULL),
(17, 'Cooler - CPU', 'Cooler - CPU', '2021-05-06 12:37:45', NULL),
(18, 'Cooler - Fan', 'Cooler - Fan', '2021-05-06 12:37:58', NULL),
(19, 'Cooler - Thermal Paste', 'Cooler - Thermal Paste', '2021-05-06 12:38:14', NULL),
(26, 'Networking', 'Network', '2021-05-07 14:42:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(24, 4, '27', 1, '2021-06-09 05:47:09', 'Debit / Credit card', 'Sampai tujuan'),
(25, 4, '22', 1, '2021-06-09 05:54:24', 'Internet Banking', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(19, 24, 'Diproses', '', '2021-06-09 05:47:24'),
(20, 24, 'Sampai tujuan', '', '2021-06-09 05:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productDescription` longtext,
  `productImage1` varchar(255) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `productName`, `productCompany`, `productPrice`, `productDescription`, `productImage1`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(22, 5, 'Intel 9600k', 'Intel', 1200000, '9600k', '9126088_5c25695a-8c66-48ee-aff3-287eef3a5a07_700_525.jpg', 'In Stock', '2021-05-03 12:45:05', NULL),
(23, 7, 'Ram Hyperx RGB', 'Hyperx', 500000, 'Hyperx', 'ram.webp', 'In Stock', '2021-05-06 12:44:31', NULL),
(24, 10, 'MSI RTX 3090', 'MSI', 18000000, 'nVidia Geforce RTX 3090', 'msi_vga_msi_rtx_3090_gaming_x_trio_24g_-_rtx_3090_gddr6x_24g_full06_rmh7f2kd.jpg', 'In Stock', '2021-05-06 12:54:33', NULL),
(25, 9, 'SSD Samsung 970 Evo M.2 nVme', 'Samsung', 2000000, 'SSD samsung super cepat', '5b5058e785563.jpg', NULL, '2021-05-06 13:15:08', NULL),
(26, 6, 'AMD Ryzen 5 3600x 36Ghz', 'Amd', 2000000, 'Ryzen gaming', '84737773_639711d3-488f-455e-8055-93174e105cf4_640_640.jfif', 'In Stock', '2021-05-07 15:17:57', NULL),
(27, 3, 'Asus ROG STRIX Z490-H Gaming', 'Asus', 2000000, 'Motherboard Gaming', 'Asus-ROG-STRIX-Z490-H-GAMING.png', 'In Stock', '2021-05-10 11:49:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
