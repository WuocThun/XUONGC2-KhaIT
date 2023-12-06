-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 05, 2023 lúc 06:44 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4
use xuong;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `xuong`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `date` datetime NOT NULL,
  `img` varchar(150) NOT NULL,
   `keyword` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `classify` (
  `id` int(11) NOT NULL,
  `classify_name` varchar(255) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT current_timestamp(),
  `description` blob DEFAULT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `service_id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- -----------------------------------------------------
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_order` int(11) NOT NULL,
  `date_order` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `order_id` varchar(100) NOT NULL,
  `service_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `description` blob DEFAULT NULL,
  `classify_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `image` (
  `service_id` int(11) NOT NULL,
  `image` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(3) NOT NULL DEFAULT 'on',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone` char(20) NOT NULL DEFAULT '1234567890',
  `address` text NOT NULL,
  `avatar` mediumtext NOT NULL,
  `born` date NOT NULL,
  `gender` varchar(100) NOT NULL DEFAULT 'nam',
  `role` int(1) NOT NULL DEFAULT 0,
  `api_token` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
--
-- Chỉ mục cho bảng `classify`
--
ALTER TABLE `classify`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
-- ALTER TABLE `comment`
--   ADD PRIMARY KEY (`id`),
--   ADD KEY `comment1` (`product_id`),
--   ADD KEY `comment2` (`id_user`);

--
--

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `classify`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
--
-- AUTO_INCREMENT cho bảng `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  ADD CONSTRAINT `comment2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `service`
  ADD CONSTRAINT `classify_id` FOREIGN KEY (`classify_id`) REFERENCES `classify` (`id`);

-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `image`
  ADD CONSTRAINT `imagess` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`);  
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
