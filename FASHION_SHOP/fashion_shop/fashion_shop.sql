CREATE DATABASE IF NOT EXISTS fashion_shop CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE fashion_shop;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS order_detail;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;


CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `image`, `created_at`) VALUES
(25, 'Đầm', 'dam', 'Đầm là một loại trang phục thời trang dành riêng cho phái nữ...', 0, '1685349749.webp', '2023-05-06 06:15:27'),
(26, 'Áo sơ mi ', 'ao-so-mi--91', 'Áo sơ mi...', 0, '1685350793.webp', '2023-05-29 08:59:53'),
(27, 'Quần', 'quan-87', 'Nếu bạn muốn tìm...', 0, '1685351486.webp', '2023-05-29 09:11:26'),
(28, 'Chân váy', 'chan-vay-58', 'Chân váy...', 0, '1685352320.webp', '2023-05-29 09:25:20');

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `orders` (`id`, `user_id`, `status`, `created_at`) VALUES
(16, 48, 2, '2023-05-29 09:50:39'),
(17, 48, 2, '2023-05-29 10:31:38'),
(18, 49, 2, '2023-05-29 14:44:45');

CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `selling_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `rate` tinyint(4) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `order_detail` (`id`, `user_id`, `product_id`, `order_id`, `selling_price`, `quantity`, `status`, `rate`, `comment`, `created_at`) VALUES
(48, 48, 62, 16, 60, 1, 2, NULL, NULL, '2023-05-29 09:50:26'),
(49, 48, 79, 17, 20, 2, 2, NULL, NULL, '2023-05-29 10:30:56'),
(51, 49, 69, 18, 20, 1, 2, NULL, NULL, '2023-05-29 14:44:42');

-- Cần loại bỏ các ký tự lạ không phải SQL trong định nghĩa bảng products
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `small_description` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `original_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `image` varchar(191) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `products` VALUES
(62, 25, 'ĐẦM HOA CẮT LAZER D04012', 'dam-hoa-cat-lazer-d04012-64', 'Đầm dáng A', 'Chất liệu...', 70, 60, '1685350167.webp', 9, 0, '2023-05-29 08:49:27'),
(63, 25, 'ĐẦM LIỀN PEPLUM D01932', 'dam-lien-peplum-d01932-33', 'Đầm dáng A', 'Chất liệu...', 60, 50, '1685350270.webp', 10, 0, '2023-05-29 08:51:10'),
(69, 25, 'ĐẦM THIẾT KẾ ĐÍNH ĐÁ D20192', 'dam-thiet-ke-dinh-da-d20192-94', 'Đầm dáng ôm', 'Chất liệu...', 60, 50, '1685350371.webp', 10, 0, '2023-05-29 08:52:51'),
(79, 25, 'ĐẦM TIỆC CỔ ĐỔ D20002', 'dam-tiec-co-do-d20002-92', 'Đầm dáng ôm', 'Chất liệu...', 70, 60, '1685350505.webp', 10, 0, '2023-05-29 08:55:05');


CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT 0,
  -- Đã sửa lỗi cú pháp ở đây
  `creat_at` timestamp NOT NULL DEFAULT current_timestamp() 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ĐỔ DỮ LIỆU USERS: Mật khẩu đã được thay thế bằng văn bản thuần túy
INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `password`, `role_as`, `creat_at`) VALUES
-- Mật khẩu User: 123456
(48, 'Hoàng Giang', 'hoanggiang@gmail.com', '0123456789', 'Hà Nội', '123456', 0, '2023-05-05 13:02:43'),
-- Mật khẩu Admin: admin123
(49, 'Nguyễn Thị Quỳnh', 'nguyenquynh@gmail.com', '0123456789', 'Hà Nội', 'admin123', 1, '2023-05-05 13:33:13');


ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

ALTER TABLE `order_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

COMMIT;
DROP DATABASE fashion_shop;