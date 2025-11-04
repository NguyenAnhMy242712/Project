-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 30, 2023 lúc 03:47 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fashion_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `image`, `created_at`) VALUES
(25, 'Đầm', 'dam', 'Đầm là một loại trang phục thời trang dành riêng cho phái nữ. Nó thường có dáng dài hoặc ngắn, có thể có các kiểu dáng và mẫu mã đa dạng. Đầm thường được làm từ các chất liệu như cotton, lụa, ren, satin, và nhiều chất liệu khác, tùy thuộc vào phong cách thiết kế.', 0, '1685349749.webp', '2023-05-06 06:15:27'),
(26, 'Áo sơ mi ', 'ao-so-mi--91', 'Áo sơ mi là một kiểu áo cổ truyền thường có kiểu dáng cổ điển với nút cài phía trước, cổ áo và tay dài. Nhưng trên Q_FASHION, bạn sẽ tìm thấy một loạt các loại áo sơ mi với nhiều kiểu dáng, màu sắc và chất liệu mới lạ, thời trang trẻ trung, nổi bật', 0, '1685350793.webp', '2023-05-29 08:59:53'),
(27, 'Quần', 'quan-87', 'Nếu bạn muốn tìm kiếm một chiếc quần thoải mái cho hàng ngày hoặc một chiếc quần lịch sự cho các dịp đặc biệt, Q_FASHION sẽ cung cấp cho bạn sự lựa chọn và thuận tiện để mua sắm và tạo dựng phong cách của riêng mình.', 0, '1685351486.webp', '2023-05-29 09:11:26'),
(28, 'Chân váy', 'chan-vay-58', 'Chân váy là một loại trang phục thời trang nữ có dáng dài hoặc ngắn, được làm từ các chất liệu như cotton, lụa, denim, satin, và nhiều chất liệu khác. Trên Q_FASHION thời trang, bạn sẽ tìm thấy một loạt các loại chân váy với kiểu dáng, mẫu mã và chiều dài khác nhau.', 0, '1685352320.webp', '2023-05-29 09:25:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `created_at`) VALUES
(16, 48, 2, '2023-05-29 09:50:39'),
(17, 48, 2, '2023-05-29 10:31:38'),
(18, 49, 2, '2023-05-29 14:44:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

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

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `user_id`, `product_id`, `order_id`, `selling_price`, `quantity`, `status`, `rate`, `comment`, `created_at`) VALUES
(48, 48, 62, 16, 60, 1, 2, NULL, NULL, '2023-05-29 09:50:26'),
(49, 48, 79, 17, 20, 2, 2, NULL, NULL, '2023-05-29 10:30:56'),
(51, 49, 69, 18, 20, 1, 2, NULL, NULL, '2023-05-29 14:44:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

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

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `small_description`, `description`, `original_price`, `selling_price`, `image`, `qty`, `status`, `created_at`) VALUES
(62, 25, 'ĐẦM HOA CẮT LAZER D04012', 'dam-hoa-cat-lazer-d04012-64', 'Đầm dáng A', 'Chất liệu: vải tổng hợp cao cấp\r\nKiểu dáng: ​đầm thiết kế dáng chữ A dài qua gối, cổ vuông, tone màu trắng trơn\r\nThông tin người mẫu: mặc sản phẩm size 2', 70, 60, '1685350167.webp', 9, 0, '2023-05-29 08:49:27'),
(63, 25, 'ĐẦM LIỀN PEPLUM D01932', 'dam-lien-peplum-d01932-33', 'Đầm dáng A', 'Chất liệu: vải tổng hợp cao cấp\r\nKiểu dáng: đầm liền thiết kế dáng chữ A dài qua gối, tay bồng, tone màu đen trơn (sàn phẩm không kèm theo đai)\r\nSản phẩm thuộc dòng sản phẩm:  NEM NEW\r\nThông tin người mẫu: cao 1m60, nặng 50kg, số đo 84 - 64 - 90 mặc sản phẩm size 2', 60, 50, '1685350270.webp', 10, 0, '2023-05-29 08:51:10'),
(64, 25, 'ĐẦM THIẾT KẾ ĐÍNH ĐÁ D20192', 'dam-thiet-ke-dinh-da-d20192-94', 'Đầm dáng ôm', 'Chất liệu: vải tổng hợp cao cấp\r\nKiểu dáng: đầm thiết kế dáng ôm dài qua gối, tay bồng, cổ vuông, tone màu đen trơn, thân trên đính đá\r\nSản phẩm thuộc dòng sản phẩm:  NEM NEW\r\nThông tin người mẫu: mặc sản phẩm size 2', 60, 50, '1685350371.webp', 10, 0, '2023-05-29 08:52:51'),
(65, 25, 'ĐẦM TIỆC CỔ ĐỔ D20002', 'dam-tiec-co-do-d20002-92', 'Đầm dáng ôm', 'Chất liệu: vải tổng hợp cao cấp\r\nKiểu dáng: đầm thiết kế dáng ôm dài qua gối, cổ đổ, tone màu vàng trơn, kèm tag đá cài\r\nSản phẩm thuộc dòng sản phẩm:  NEM NEW\r\nThông tin người mẫu: mặc sản phẩm size 2', 70, 60, '1685350505.webp', 10, 0, '2023-05-29 08:55:05'),
(67, 26, 'ÁO TRỄ VAI PHỐI BÈO SM01882', 'ao-tre-vai-phoi-beo-sm01882-86', 'Áo trễ vai', 'Chất liệu: vải tổng cao cấp\r\nKiểu dáng: áo trễ vai bo gấu, tay bo chun, tone màu trắng trơn, phối khuy bọc phía trước\r\nSản phẩm thuộc dòng sản phẩm : NEM NEW\r\nThông tin người mẫu: cao1m60, nặng 50kg, số đo 84 - 64 - 90 mặc sản phẩm size 2\r\nSản phẩm kết hợp: quần Q20592', 34, 30, '1685350921.webp', 10, 0, '2023-05-29 09:02:01'),
(68, 26, 'SƠ MI TAY RỦ PHỐI HOA 3D SM01822', 'so-mi-tay-ru-phoi-hoa-3d-sm01822-77-90', 'Áo tay rủ', 'Chất liệu: vải tổng cao cấp\r\nKiểu dáng: áo sơ mi thiết kế tay rủ, tone màu trắng trơn, đính hoa 3D bản to\r\nSản phẩm thuộc dòng sản phẩm : NEM NEW\r\nThông tin người mẫu: cao1m60, nặng 50kg, số đo 84 - 64 - 90 mặc sản phẩm size 2\r\nSản phẩm kết hợp: quần Q01832', 43, 40, '1685350999.webp', 10, 0, '2023-05-29 09:03:19'),
(69, 26, 'SƠ MI REN CỔ NƠ SM00022', 'so-mi-ren-co-no-sm00022-71', 'Áo sơ mi', 'Chất liệu: vải tổng cao cấp\r\nKiểu dáng: áo thiết kế cổ tròn, tone màu đen trơn, cổ phối nơ bản to\r\nSản phẩm thuộc dòng sản phẩm : NEM NEW\r\nThông tin người mẫu: cao1m60, nặng 50kg, số đo 84 - 64 - 90 mặc sản phẩm size 2\r\nSản phẩm kết hợp: quần Q01312', 30, 20, '1685351094.webp', 9, 0, '2023-05-29 09:04:54'),
(70, 26, 'SƠ MI PHỐI HOA CẮT NỔI SM02052', 'so-mi-phoi-hoa-cat-noi-sm02052-89', 'Áo sơ mi', 'Chất liệu: vải tổng cao cấp\r\nKiểu dáng: áo sơ mi thiết kế cổ bẻ, tone màu hồng, kết hợp hoa cắt bản to\r\nSản phẩm thuộc dòng sản phẩm : NEM NEW\r\nThông tin người mẫu: cao1m60, nặng 50kg, số đo 84 - 64 - 90 mặc sản phẩm size 2\r\nSản phẩm kết hợp: chân váy Z18842', 40, 30, '1685351191.webp', 10, 0, '2023-05-29 09:06:31'),
(71, 27, 'QUẦN ỐNG ĐỨNG Q40582', 'quan-ong-dung-q40582-38', 'Quần dài', 'Chất liệu: vải tổng hợp cao cấp\r\nKiểu dáng: ​quần dài thiết kế cạp cao, tone màu hồng trơn \r\nSản phẩm thuộc dòng: NEM NEW\r\nThông tin người mẫu: cao1m60, nặng 50kg, số đo 84 - 64 - 90 mặc sản phẩm size 2\r\nSản phẩm kết hợp:áo AK01332', 17, 10, '1685351623.webp', 10, 0, '2023-05-29 09:13:43'),
(72, 27, 'QUẦN SHORT ĐEN Q00782', 'quan-short-den-q00782-64', 'Quần short', 'Chất liệu: vải tổng hợp cao cấp\r\nKiểu dáng: ​quần short thiết kế cạp cao, ống rộng, tone màu đen trơn\r\nSản phẩm thuộc dòng: NEM NEW\r\nThông tin người mẫu: mặc sản phẩm size 2\r\nSản phẩm kết hợp:áo TS60042', 21, 15, '1685351714.webp', 10, 0, '2023-05-29 09:15:14'),
(73, 27, 'QUẦN SHORT CẠP CAO Q14062', 'quan-short-cap-cao-q14062-96', 'Quần short', 'Chất liệu: vải nhung cao cấp\r\nKiểu dáng: quần short thiết kế cạp cao,  ống rộng, tone màu đen trơn\r\nSản phẩm thuộc dòng sản phẩm : NEM NEW\r\nThông tin người mẫu: mặc sản phẩm size 2\r\nSản phẩm kết hợp: áo AL62402', 10, 8, '1685351927.webp', 10, 0, '2023-05-29 09:18:47'),
(74, 27, 'QUẦN ỐNG ĐỨNG Q43342', 'quan-ong-dung-q43342-34', 'Quần dài', 'Chất liệu: vải tổng hợp cao cấp\r\nKiểu dáng: ​quần dài thiết kế cạp cao, ống đứng, tone màu nâu be\r\nSản phẩm thuộc dòng: NEM NEW\r\nThông tin người mẫu: mặc sản phẩm size 2\r\nSản phẩm kết hợp:áo SM40592', 17, 10, '1685352099.webp', 10, 0, '2023-05-29 09:21:39'),
(75, 28, 'CHÂN VÁY XẾP LIZ16382', 'chan-vay-xep-liz16382-90', 'Chân váy xếp li', 'Chất liệu: vải tổng hợp cao cấp\r\nKiểu dáng: ​chân váy xếp li vạt chéo, tone màu trắng trơn\r\nSản phẩm thuộc dòng: NEM NEW\r\nThông tin người mẫu: mặc sản phẩm size 2\r\nSản phẩm kết hợp:áo AK16392', 30, 20, '1685352439.webp', 10, 0, '2023-05-29 09:27:19'),
(76, 28, 'CHÂN VÁY THIẾT KẾ Z18912', 'chan-vay-thiet-ke-z18912-65', 'Chân váy bút chì', 'Chất liệu: vải tổng hợp cao cấp\r\nKiểu dáng: ​chân váy bút chì cạp cao,vạt chéo, tone màu nâu be\r\nSản phẩm thuộc dòng: NEM NEW\r\nThông tin người mẫu: mặc sản phẩm size 2\r\nSản phẩm kết hợp:áo SM18332', 34, 30, '1685352529.webp', 10, 0, '2023-05-29 09:28:49'),
(77, 28, 'CHÂN VÁY BÚT CHÌ Z18362', 'chan-vay-but-chi-z18362-88', 'Chân váy bút chì', 'Chất liệu: vải tổng hợp cao cấp\r\nKiểu dáng: ​chân váy bút chì cạp cao, tone màu nâu nhạt, \r\nSản phẩm thuộc dòng: NEM NEW\r\nThông tin người mẫu: mặc sản phẩm size 2\r\nSản phẩm kết hợp:áo SM17772', 34, 30, '1685352609.webp', 10, 0, '2023-05-29 09:30:09'),
(79, 28, 'CHÂN VÁY XẾP LI Z12132', 'chan-vay-xep-li-z12132-79-44', 'Chân váy xếp li', 'Chất liệu: vải tổng hợp cao cấp\r\nKiểu dáng: ​chân váy xếp li thiết kế dài qua gối, tone màu nâu be trơn\r\nSản phẩm thuộc dòng: NEM NEW\r\nThông tin người mẫu: mặc sản phẩm size 2\r\nSản phẩm kết hợp:áo SM16812', 30, 20, '1685352951.webp', 8, 0, '2023-05-29 09:32:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT 0,
  `creat_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `password`, `role_as`, `creat_at`) VALUES
(48, 'Hoàng Giang', 'hoanggiang@gmail.com', '0123456789', 'Hà Nội', '$2y$10$xdjSZRMIoP0YFO0YwU.iQ.skU42QD41hwyn6h4XXGlJB0rCmkgnvO', 0, '2023-05-05 13:02:43'),
(49, 'Nguyễn Thị Quỳnh', 'nguyenquynh@gmail.com', '0123456789', 'Hà Nội', '$2y$10$arUmT.mvBhIbxK9vCG0uGOw4ly6tQiTITCqBnk/nJRz8BDv9hiB.S', 1, '2023-05-05 13:33:13');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
