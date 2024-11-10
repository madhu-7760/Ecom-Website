-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2023 at 07:55 AM
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
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `role`, `email`, `mobile`, `status`) VALUES
(1, 'admin', 'admin', 0, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brand`, `status`) VALUES
(1, 'Henlo', 1),
(2, 'Whiskas', 1),
(3, 'Drools', 1),
(4, 'Callas', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(1, 'Accessories', 1),
(2, 'Food', 1),
(3, 'Shop-By-Breed', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_master`
--

CREATE TABLE `coupon_master` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `coupon_type` varchar(10) NOT NULL,
  `cart_min_value` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `coupon_master`
--

INSERT INTO `coupon_master` (`id`, `coupon_code`, `coupon_value`, `coupon_type`, `cart_min_value`, `status`) VALUES
(1, '28J2350', 50, 'Rupee', 2000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `length` float NOT NULL,
  `breadth` float NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `mihpayid` varchar(20) NOT NULL,
  `ship_order_id` int(11) NOT NULL,
  `ship_shipment_id` int(11) NOT NULL,
  `payu_status` varchar(10) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `coupon_value` varchar(50) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `length`, `breadth`, `height`, `weight`, `txnid`, `mihpayid`, `ship_order_id`, `ship_shipment_id`, `payu_status`, `coupon_id`, `coupon_value`, `coupon_code`, `added_on`) VALUES
(1, 1, '#1', 'Belgaum', 590006, 'COD', 1950, 'Success', 5, 0, 0, 0, 0, '5312956b112125c627ac', '', 0, 0, '', 1, '50', '28J2350', '2023-07-28 07:54:15');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(1, 1, 4, 1, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `best_seller` int(11) NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `added_by` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `sub_categories_id`, `brand_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `best_seller`, `meta_title`, `meta_desc`, `meta_keyword`, `added_by`, `status`) VALUES
(1, 2, 4, 1, 'Henlo Baked Dry Food for Adult Dogs | 12kg (4 x 3Kg)', 10048, 7937, 10, '645165197_TRUELOVE-BOOT_9_7dcc15ba-e34b-46ea-b61a-3c959db4ed0c.jpg', 'Henlo Baked Dry Food for Adult Dogs | 100% human-grade ingredients | 12kg (4 x 3Kg)', 'Our Dry Food is a brainchild of over 14 months of dog-obsessed research, all to give your fur baby the healthiest and happiest life. It is a complete and balanced everyday meal, carefully crafted with simple ingredients essential to your dog’s holistic nutrition. Our recipe features clean sources like 100% human-grade chicken, fresh freeze-dried veggies, and organic Indian spices, ensuring that our baked dry food doesn’t leave the room stinking. Most importantly, our dry food is baked at low heat temperatures, ensuring maximum crunch and full-bodied flavours from the ingredients. We bet your doggo will instantly fall in love with our baked dry food.\r\n\r\n<br><b>Key Features</b>\r\n<br> Improves gut health\r\n<br> Boosts energy levels\r\n<br> Strengthens bones & teeth\r\n<br> Builds strong muscle\r\n<br> Enhances skin & coat \r\n<br> Supports heart health', 1, '', '', '', 1, 1),
(2, 2, 3, 2, 'Whiskas Tuna Flavour Adult Cat Dry Food (20kg)', 5500, 4675, 10, '389554910_Supertails_1.jpg', 'Whiskas Tuna Flavour Adult Cat Dry Food (20kg)', 'Whiskas tuna flavour adult dry cat food is a nutritionally complete and balanced recipe that has carefully been created to cater to the requirements of an adult cat’s system. It is made with high-quality ingredients and nutrition for pet cats.\r\n\r\n<br><b>Key Features</b>\r\n<br> Crunchy chunks packed with real fish flavor\r\n<br> Special blend of nutrients support the cat\'s vital system\r\n<br> Provides adult cats with shiny coat, better eye sight & energy\r\n<br> A balanced cat food that helps prevent obesity when fed right and can be given to cats as treat\r\n<br> Backed by research done by the Waltham Centre for Pet Nutrition', 1, '', '', '', 1, 1),
(3, 1, 2, 3, 'Drools Non Toxic Rubber Spike Bone Toy for Dogs', 199, 189, 10, '586524938_Fetcher_d560ed37-ed6b-4e57-908e-3b039861ba67.jpg', 'Drools Non Toxic Rubber Spike Bone Toy for Dogs', 'Drools Non- Toxic Rubber Spike Bone Dog Toy, Puppy/Dog Teething Toy is a flexible, non-toxic rubber chew toy. It helps improve dental health and encourages non-destructive chewing. It is suitable for all dogs.\r\n\r\n<br><b>Key Features</b>\r\n<br> Flexible & Non-Toxic Rubber Chew Toy\r\n<br> Improves Dental Health\r\n<br> Encourages Non-Destructive Chewing\r\n<br> Suitable for all dogs\r\n<br> Ideal for dog’s indoor and outdoor activities.\r\n<br> Remove the toy from dog if it shows sign of wear or damage.\r\n<br> Please understand no dog toy is \"indestructible\" even though it is made of durable material.', 1, '', '', '', 1, 1),
(4, 1, 1, 4, 'Callas Round Tree Condo with Sisal Scratching Posts', 3999, 2000, 10, '567020733_Frame10431_53120775-3820-4cd0-9b1b-eb341c814168.jpg', 'Callas Round Tree Condo with Sisal Scratching Posts for Kittens & Cats', 'Spacious & Versatile Fun Center - No matter your kitten wants to overlook the world on the top perch, melt into the luxury deep hammock, or feel spoiled in the cozy cradle, this multi-purpose cat playground works perfectly as a recreation paradise! Your furry friends can play with the interactive hanging ball and loop, tour freely in their castle across the platforms, or just be lazy inside the warm condo - Exploration never ends!\r\n<br><b>Key Features</b>\r\n<br> Designed to Fulfill Your Cat\'s Nature - This indoor cat treehouse is a go-to spot for your cat to play, exercise, and relax. Multiple scratching posts reinforced with natural sisal rope will satisfy your cat’s instinct of scratching. Multiple layers and ladder also meet your feline’s climbing nature. The cozy condo is a perfect hideaway for your sensitive baby to enjoy privacy. The top perch with raised edge feeds your cat’s desire to look out the window and to take a sunbath on sunny days.\r\n<br> Sturdy Construction for Maximum Safety - Crafted of heavy-duty particle wood, the strengthened base plates double secure the overall stability so this kitty climber won’t shake or fall down when your cat jumps in or out. The robust posts are made of high-density particle wood tubes which can bear lots of weight and hold all platforms firmly without any wobbling, ideal for large kittens and adult cats.\r\n<br> Superior Quality Materials - All platforms and supporting posts are made of strong P2-grade particle wood, ensuring the safety of your restless cat while climbing up and down. The skin-friendly plush covering gives feline-friendly softness and optimum warmth which your cat will never get enough of. The durable sisal rope allows your cat to sharpen the nails while saving your delicate furniture from scratches.\r\n<br> Easy Assembly Cat Tree - Easy-to-use cat tower equipped with detailed graphic instructions for hassle-free installation. This attractive cat play tree in elegant gray will blend nicely with your room decor as a piece of modern cat furniture. A purrrfect gift for both your kitten and your sweet home! Suitable for kitten and adult cate up to 10 kg.\r\n<br> Product Dimensions 49L x 43.6H Centimeters', 1, '', '', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shiprocket_token`
--

CREATE TABLE `shiprocket_token` (
  `id` int(11) NOT NULL,
  `token` varchar(500) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categories_id`, `sub_categories`, `status`) VALUES
(1, 1, 'Cat', 1),
(2, 1, 'Dog', 1),
(3, 2, 'Cat', 1),
(4, 2, 'Dog', 1),
(5, 3, 'Dog', 1),
(6, 3, 'Cat', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(1, 'Vinay K', '123456', 'vinay@gmail.com', '7259588979', '2023-07-28 07:53:51');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_master`
--
ALTER TABLE `coupon_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shiprocket_token`
--
ALTER TABLE `shiprocket_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
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
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_master`
--
ALTER TABLE `coupon_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shiprocket_token`
--
ALTER TABLE `shiprocket_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
