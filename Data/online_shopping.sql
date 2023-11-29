-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 29, 2023 lúc 08:06 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `online_shopping`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `cname` varchar(200) NOT NULL,
  `cdesc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`cid`, `cname`, `cdesc`) VALUES
(4, 'Bàn ăn', 'Chọn lựa từ bàn nhỏ đến bàn lớn phục vụ gia đình.'),
(9, 'Bàn làm việc', 'Thiết kế chuyên nghiệp cho không gian làm việc.'),
(1, 'Bàn trang điểm', 'Dành cho việc trang điểm và làm đẹp.'),
(3, 'Ghế sofa', 'Đa dạng về kiểu dáng và chất liệu.'),
(5, 'Giường ngủ', 'Phong cách hiện đại và thoải mái.'),
(2, 'Gối và chăn', 'Phụ kiện trang trí và làm ấm không gian.'),
(7, 'Kệ sách', 'Bảo quản và trưng bày sách một cách ngăn nắp.'),
(10, 'Thảm trải sàn', 'Mang đến sự ấm áp và thoải mái cho không gian.'),
(8, 'Tủ quần áo', 'Bảo quản và sắp xếp quần áo một cách gọn gàng.'),
(6, 'Đèn trang trí', 'Tạo điểm nhấn và ánh sáng cho không gian.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `pid` int(11) NOT NULL,
  `pname` varchar(200) DEFAULT NULL,
  `cname` varchar(200) DEFAULT NULL,
  `pqty` int(11) DEFAULT NULL,
  `pprice` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`pid`, `pname`, `cname`, `pqty`, `pprice`) VALUES
(1, 'Bàn ăn gấp gọn', 'Bàn ăn', 30, 179000),
(2, 'Bàn ăn gỗ sồi', 'Bàn ăn', 50, 249000),
(3, 'Bàn ăn mặt kính', 'Bàn ăn', 45, 299000),
(4, 'Gối nỉ trơn', 'Gối và chăn', 200, 30000),
(5, 'Chăn len dáng dài', 'Gối và chăn', 100, 49000),
(6, 'Bộ chăn gối họa tiết hoa lá', 'Bàn ăn', 100, 49000),
(7, 'Bàn làm việc chân sắt', 'Bàn làm việc', 48, 199000),
(8, 'Bàn làm việc gỗ tự nhiên', 'Bàn làm việc', 200, 249000),
(9, 'Ghế sofa da cao cấp', 'Ghế sofa', 150, 899000),
(10, 'Ghế sofa vải thoải mái', 'Ghế sofa', 64, 349000),
(11, 'Kệ sách treo tường', 'Kệ sách', 300, 290000),
(12, 'Kệ sách đa năng', 'Kệ sách', 99, 250000),
(13, 'Đèn đứng phòng ngủ', 'Đèn trang trí', 99, 599000),
(14, 'Giường ngủ gỗ tự nhiên', 'Giường ngủ', 99, 999000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `uname` varchar(200) DEFAULT NULL,
  `uphone` varchar(15) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `p_date` varchar(20) DEFAULT NULL,
  `uaddress` text DEFAULT NULL,
  `receive_date` varchar(20) DEFAULT NULL,
  `supplier` varchar(200) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `purchase`
--

INSERT INTO `purchase` (`id`, `uid`, `uname`, `uphone`, `pid`, `product_name`, `qty`, `price`, `total`, `p_date`, `uaddress`, `receive_date`, `supplier`, `status`) VALUES
(1, 2, 'aaa', '1234567888', 10, 'Ghế sofa vải thoải mái', 15, 349000, 5235000, '2023-11-29', 'dsf, dsfsaadsd', NULL, 'Rya', 'On the way'),
(2, 2, 'aaa', '1234567888', 3, 'Bàn ăn mặt kính', 1, 299000, 299000, '2023-11-29', 'dsf, dsfsaadsd', NULL, 'Rya', 'On the way'),
(3, 3, 'ly', '0124578963', 13, 'Đèn đứng phòng ngủ', 10, 599000, 5990000, '2023-11-29', 'ssaad, adadad', NULL, 'Rya', 'On the way'),
(4, 3, 'ly', '0124578963', 12, 'Kệ sách đa năng', 1, 250000, 250000, '2023-11-29', 'ssaad, adadad', NULL, 'Rya', 'On the way'),
(5, 3, 'ly', '0124578963', 9, 'Ghế sofa da cao cấp', 2, 899000, 1798000, '2023-11-29', 'ssaad, adadad', NULL, 'lyn', 'On the way'),
(6, 3, 'ly', '0124578963', 3, 'Bàn ăn mặt kính', 1, 299000, 299000, '2023-11-29', 'ssaad, adadad', NULL, 'aaa', 'On the way'),
(7, 4, 'mike', '0202987654', 11, 'Kệ sách treo tường', 1, 290000, 290000, '2023-11-29', 'asdsd, vdfgxfg', NULL, 'lyn', 'On the way'),
(8, 4, 'mike', '0202987654', 13, 'Đèn đứng phòng ngủ', 2, 599000, 1198000, '2023-11-29', 'asdsd, vdfgxfg', NULL, 'Rya', 'On the way'),
(9, 4, 'mike', '0202987654', 14, 'Giường ngủ gỗ tự nhiên', 1, 999000, 999000, '2023-11-29', 'asdsd, vdfgxfg', NULL, 'aaa', 'On the way'),
(10, 4, 'mike', '0202987654', 5, 'Chăn len dáng dài', 3, 49000, 147000, '2023-11-29', 'asdsd, vdfgxfg', NULL, 'lyn', 'On the way');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `sid` int(11) NOT NULL,
  `sname` varchar(100) NOT NULL,
  `semail` varchar(100) DEFAULT NULL,
  `spassword` varchar(100) DEFAULT NULL,
  `sphone` varchar(15) DEFAULT NULL,
  `saddress1` text DEFAULT NULL,
  `saddress2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `supplier`
--

INSERT INTO `supplier` (`sid`, `sname`, `semail`, `spassword`, `sphone`, `saddress1`, `saddress2`) VALUES
(1, 'aaa', 'supplier@gmail.com', '1234', '0147852369', 'asda9', 'sds84'),
(2, 'lyn', 'lyn@gmail.com', '1234', '0123579461', 'assdg', 'sdsdghs'),
(3, 'Rya', 'rya@gmail.com', '1234', '7984561230', 'asdf', 'dsvg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(200) DEFAULT NULL,
  `uemail` varchar(100) DEFAULT NULL,
  `upassword` varchar(100) DEFAULT NULL,
  `uphone` varchar(15) DEFAULT NULL,
  `usecqus` text DEFAULT NULL,
  `uans` text DEFAULT NULL,
  `uaddress1` text DEFAULT NULL,
  `uaddress2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`uid`, `uname`, `uemail`, `upassword`, `uphone`, `usecqus`, `uans`, `uaddress1`, `uaddress2`) VALUES
(2, 'son', 'user@gmail.com', '1234', '1234567888', 'What is your favorite color?', 'red', 'dsf', 'dsfsaadsd'),
(3, 'ly', 'ly@gmail.com', '1234', '0124578963', 'What is your favorite color?', 'green', 'ssaad', 'adadad'),
(4, 'mike', 'mike@gmail.com', '1234', '0202987654', 'What is your favorite color?', 'red', 'asdsd', 'vdfgxfg');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cname`),
  ADD UNIQUE KEY `cid_UNIQUE` (`cid`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `fk_category_name` (`cname`);

--
-- Chỉ mục cho bảng `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_uid` (`uid`),
  ADD KEY `fk_supplier_name` (`supplier`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`sname`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_category_name` FOREIGN KEY (`cname`) REFERENCES `category` (`cname`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `fk_supplier_name` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`sname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
