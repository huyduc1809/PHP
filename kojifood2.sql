-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 10, 2023 lúc 09:56 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `kojifood2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `role` enum('admin','employee') DEFAULT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `role`, `code`, `date`) VALUES
(6, 'admin', '25d55ad283aa400af464c76d713c07ad', 'admin@gmail.com', 'admin', '', '2023-10-19 03:54:42'),
(9, 'nhanvien', '25d55ad283aa400af464c76d713c07ad', 'ninbook0708@gmail.com', 'employee', 'QFE6ZM', '2023-10-19 03:54:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_codes`
--

CREATE TABLE `admin_codes` (
  `id` int(222) NOT NULL,
  `codes` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_codes`
--

INSERT INTO `admin_codes` (`id`, `codes`) VALUES
(1, 'QX5ZMN'),
(2, 'QFE6ZM'),
(3, 'QMZR92'),
(4, 'QPGIOV'),
(5, 'QSTE52'),
(6, 'QMTZ2J');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiet_voucher`
--

CREATE TABLE `chitiet_voucher` (
  `u_id` int(11) NOT NULL,
  `id_voucher` varchar(11) NOT NULL,
  `TrangThai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiet_voucher`
--

INSERT INTO `chitiet_voucher` (`u_id`, `id_voucher`, `TrangThai`) VALUES
(35, 'VC_004', 1),
(35, 'VC_005', 1),
(36, 'VC_004', 1),
(36, 'VC_005', 1),
(37, 'VC_004', 1),
(37, 'VC_005', 1),
(38, 'VC_004', 1),
(38, 'VC_005', 1),
(39, 'VC_004', 1),
(39, 'VC_005', 1),
(40, 'VC_004', 1),
(40, 'VC_005', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dishes`
--

CREATE TABLE `dishes` (
  `d_id` int(222) NOT NULL,
  `rs_id` int(222) NOT NULL,
  `title` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slogan` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `dishes`
--

INSERT INTO `dishes` (`d_id`, `rs_id`, `title`, `slogan`, `price`, `img`) VALUES
(14, 50, 'Red Robins Chick on a Stick', 'Ức gà nướng truyền thống\n', 30000.00, '5ad759e1546fc.jpg'),
(25, 49, 'Hamburger', 'Hamburger chính là một thức ăn nhanh phổ biến ở Mỹ và các quốc gia, dù rằng Hamburger bắt nguồn từ thủ phủ Hamburg (Đức). Tuy nhiên người Mỹ không hoàn toàn sử dụng Hamburger theo đúng', 67000.00, '65290de305753.jpeg'),
(26, 48, 'Khoai tây chiên', 'Là thức ăn nhanh phổ biến ở tất cả các quốc gia từ thành thị đến nông thôn, đây là món khoái khẩu của nhiều người không phân biệt lứa tuổi. Nguồn gốc của khoai tây chiên có lẽ vẫn là một trong những bí ẩn thực phẩm của nhâ', 34000.00, '65290f050bafc.jpg'),
(27, 54, 'Pasta', 'Pasta là một loại thực phẩm truyền thống của nước Ý, đã có từ năm 1154 và trở thành thức ăn nhanh phổ biến trên khắp thế giới. Pasta có hơn 310 loại với 1300 tên gọi, hương vị và hình dạng khác nhau. Từ cọng dài, hình ống ', 69000.00, '65290f4a8a236.jpg'),
(28, 50, 'Xúc xích', 'Thức ăn nhanh phổ biến xúc xích là một loại thực phẩm chế biến từ thịt. Đây cũng là một trong những món ăn lâu đời nhất mà con người đã tạo ra trong quá trình bảo quản và lưu trữ thực phẩm bằng phương pháp hong khói, phơi ', 32000.00, '65290f77cbe44.jpg'),
(29, 50, 'Bánh mì', 'Bánh mì là thức ăn nhanh của người Việt và thực khách khắp thế giới. Thức ăn nhanh quen thuộc này được dùng cho các bữa ăn sáng, ăn trưa, ăn chiều và ăn tối. Bánh mì trở thành món ăn bình dân của người Việt.', 25000.00, '65290fb75abf1.png'),
(30, 48, 'Donut', 'Là một loại bánh ngọt rán hoặc nướng để dùng làm thức ăn nhanh hoặc tráng miệng. Đây là loại bánh rất nổi tiếng và phổ biến ở nhiều nước phương Tây', 56000.00, '65290fe777f12.jpg'),
(31, 54, 'Kimbap', 'Thức ăn nhanh phổ biến của người Hàn quốc và lan rộng ra khắp các quốc gia. Tên gọi của món ăn rất đơn giản, cơm gói trong lá rong biển. Về hình dạng, Kimbap “có vẻ” giống món Sushi – cũng là món cơm cuốn trong lá rong biể', 67000.00, '6529102e67d75.jpg'),
(32, 50, 'Bim bim', 'Bim bim (hay còn gọi là thức ăn nhẹ hoặc snack) Là các loại thức ăn phục vụ cho việc ăn giữa các bữa ăn và thường dưới hình thức thực phẩm đóng gói và chế biến sẵn cũng như mặt hàng làm từ nguyên liệu tươi được đóng gói ăn', 45000.00, '652e4767ab9bc.jpg'),
(33, 49, 'Hamburger', 'Hamburger chính là một thức ăn nhanh phổ biến ở Mỹ và các quốc gia, dù rằng Hamburger bắt nguồn từ thủ phủ Hamburg (Đức). Tuy nhiên người Mỹ không hoàn toàn sử dụng Hamburger theo đúng', 67000.00, '652910d9e0607.jpeg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `remark`
--

CREATE TABLE `remark` (
  `id` int(11) NOT NULL,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `remark`
--

INSERT INTO `remark` (`id`, `frm_id`, `status`, `remark`, `remarkDate`) VALUES
(62, 32, 'in process', 'hi', '2023-03-03 17:35:52'),
(63, 32, 'closed', 'cc', '2023-03-03 17:36:46'),
(64, 32, 'in process', 'fff', '2023-03-03 18:01:37'),
(65, 32, 'closed', 'hi', '2023-03-03 18:08:55'),
(66, 34, 'in process', 'on a way', '2023-03-03 18:56:32'),
(71, 39, 'closed', 'Giao rồi nha cậu', '2023-04-03 03:30:12'),
(72, 39, 'rejected', 'Ui zoi oi', '2023-04-03 03:35:33'),
(73, 39, 'closed', 'Oke ', '2023-04-03 03:36:44'),
(74, 40, 'in process', 'x', '2023-07-31 08:52:02'),
(75, 43, 'rejected', 'z', '2023-07-31 08:52:25'),
(76, 43, 'closed', 'g', '2023-08-01 04:37:16'),
(77, 45, 'in process', 'd', '2023-08-01 04:37:34'),
(78, 46, 'rejected', 'j', '2023-08-01 04:37:52'),
(79, 61, 'in process', 'oke', '2023-08-01 05:28:03'),
(80, 60, 'closed', 'oke', '2023-08-01 05:28:21'),
(81, 66, 'in process', 'sfsfss', '2023-12-09 09:01:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `restaurant`
--

CREATE TABLE `restaurant` (
  `rs_id` int(222) NOT NULL,
  `c_id` int(222) NOT NULL,
  `title` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `o_hr` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c_hr` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `o_days` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `restaurant`
--

INSERT INTO `restaurant` (`rs_id`, `c_id`, `title`, `email`, `phone`, `url`, `o_hr`, `c_hr`, `o_days`, `address`, `image`, `date`) VALUES
(48, 5, 'Hari Burger', 'HariBurger@gmail.com', ' 090412 64676', 'hari.com', '7am', '4pm', 'mon-tue', '200 Cô Giang,P.Cô Giang, Q.1', 'hari.jpg', '2023-10-13 06:03:15'),
(49, 5, 'KFC', 'kwbab@gmail.com', '011 2677 9070', 'kwbab.com', '6am', '5pm', 'mon-fri', '100 Trần Phú, P.5, Q.10', 'kfc.png', '2023-10-13 06:02:19'),
(50, 6, 'Jollibee', 'Indiantaste@gmail.com', '090410 35147', 'Indiantaste.com', '6am', '6pm', 'mon-sat', '200 Bùi Viện, P.Phạm ngũ lão, Q.1', 'hai1.png', '2023-10-13 06:01:12'),
(54, 9, 'Moon FastFood', 'catfish@gmail.com', '23141324564', 'catfish.com', '6am', '7pm', 'Mon-Sat', 'Ho Chi Minh City', 'download.jpg', '2023-10-13 05:56:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `res_category`
--

CREATE TABLE `res_category` (
  `c_id` int(222) NOT NULL,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `res_category`
--

INSERT INTO `res_category` (`c_id`, `c_name`, `date`) VALUES
(5, 'grill.', '2023-03-08 15:56:04'),
(6, 'pizza.', '2023-03-08 15:55:52'),
(7, 'pasta.', '2023-03-08 15:55:44'),
(8, 'thaifood.', '2023-03-08 15:55:36'),
(9, 'fishh', '2023-10-13 09:44:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `u_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(222) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`u_id`, `username`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `status`, `date`) VALUES
(35, 'xxxx@gmail.com', 'xxxx', 'xxxx', 'xxxx@gmail.com', '9456564645', 'dad3a37aa9d50688b5157698acfd7aee', 'xxxx', 1, '2023-07-31 08:46:57'),
(36, 'anh', 'do', 'anhnah', 'anh@gmail.com', '0987654321', 'dad3a37aa9d50688b5157698acfd7aee', 'hcm vn q10', 1, '2023-08-01 04:29:04'),
(37, 'bb', 'bb', 'bb', 'bb@gmail.com', '0987666642', 'e10adc3949ba59abbe56e057f20f883e', 'khu pho 3 an phu quan 2', 1, '2023-10-13 05:09:52'),
(38, '?fhgfghrthr', 'Anh', 'Anh', 'anhrrrrr@gmail.com', '0987654327', '25d55ad283aa400af464c76d713c07ad', 'mct\r\nhcm q13', 1, '2023-10-17 08:28:48'),
(39, 'chien', 'nguyá»…n', 'chiáº¿n', 'chien@gmail.com', '0386987160', 'e10adc3949ba59abbe56e057f20f883e', 'abc', 1, '2023-10-18 07:11:23'),
(40, 'vvv', 'vvv', 'vvv', 'vvv@gmail.com', '0987666643', '25d55ad283aa400af464c76d713c07ad', 'uuuu\r\nkhu phô?', 1, '2023-10-19 03:54:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_orders`
--

CREATE TABLE `users_orders` (
  `o_id` int(222) NOT NULL,
  `u_id` int(222) NOT NULL,
  `rs_id` int(11) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `users_orders`
--

INSERT INTO `users_orders` (`o_id`, `u_id`, `rs_id`, `title`, `quantity`, `price`, `status`, `date`) VALUES
(39, 34, 48, 'Hard Rock Cafe', 1, 20000.00, 'closed', '2023-12-09 09:39:50'),
(40, 34, 48, 'Hard Rock Cafe', 1, 20000.00, 'in process', '2023-12-09 09:49:50'),
(43, 35, 49, 'Bonefish', 2, 30000.00, 'closed', '2023-12-09 09:50:16'),
(44, 35, 49, 'Hard Rock Cafe', 15, 20000.00, NULL, '2023-12-09 09:50:16'),
(45, 35, 49, 'Bonefish', 2, 30000.00, 'in process', '2023-12-09 09:50:16'),
(47, 35, 0, 'Uno Pizzeria & Grill', 1, 30000.00, NULL, '2023-07-31 08:49:00'),
(49, 35, 0, 'Red Robins Chick on a Stick', 1, 30000.00, NULL, '2023-08-01 05:02:51'),
(50, 35, 0, 'Red Robins Chick on a Stick', 1, 30000.00, NULL, '2023-08-01 05:04:05'),
(51, 35, 0, 'Red Robins Chick on a Stick', 1, 30000.00, NULL, '2023-08-01 05:04:20'),
(52, 35, 0, 'Red Robins Chick on a Stick', 1, 30000.00, NULL, '2023-08-01 05:05:32'),
(53, 35, 0, 'Bonefish', 1, 30000.00, NULL, '2023-08-01 05:05:32'),
(60, 35, 0, 'xx', 1, 99999.00, 'closed', '2023-08-01 05:28:21'),
(61, 35, 0, 'Hard Rock Cafe', 1, 20000.00, 'in process', '2023-08-01 05:28:03'),
(62, 35, 0, 'Hard Rock Cafe', 1, 20000.00, NULL, '2023-08-01 07:02:46'),
(63, 35, 0, 'Uno Pizzeria & Grill', 1, 30000.00, NULL, '2023-08-01 07:18:11'),
(64, 39, 0, 'Hamburger', 1, 67000.00, NULL, '2023-10-18 08:37:39'),
(65, 39, 0, 'Hamburger', 1, 67000.00, NULL, '2023-10-18 08:37:45'),
(66, 36, 0, 'Red Robins Chick on a Stick', 1, 30000.00, 'in process', '2023-12-09 09:01:48'),
(69, 36, 54, 'Xúc xích', 1, 32000.00, NULL, '2023-12-09 15:28:04'),
(70, 36, 50, 'Xúc xích', 1, 32000.00, NULL, '2023-12-09 15:28:45'),
(71, 36, 50, 'Red Robins Chick on a Stick', 1, 30000.00, NULL, '2023-12-09 15:28:45'),
(72, 36, 50, 'Red Robins Chick on a Stick', 1, 30000.00, NULL, '2023-12-10 02:57:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher`
--

CREATE TABLE `voucher` (
  `id_voucher` varchar(11) NOT NULL,
  `Ten` varchar(50) NOT NULL,
  `GiaTriGiamGia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `voucher`
--

INSERT INTO `voucher` (`id_voucher`, `Ten`, `GiaTriGiamGia`) VALUES
('VC_001', 'Giảm giá tất cả', 50000),
('VC_002', 'Giảm đầu năm', 10000),
('VC_003', 'Giảm đầu năm mới', 100000),
('VC_004', 'Giảm đầu năm mới', 10000),
('VC_005', 'Giảm đầu năm mới1', 10000);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Chỉ mục cho bảng `admin_codes`
--
ALTER TABLE `admin_codes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chitiet_voucher`
--
ALTER TABLE `chitiet_voucher`
  ADD PRIMARY KEY (`u_id`,`id_voucher`);

--
-- Chỉ mục cho bảng `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`d_id`);

--
-- Chỉ mục cho bảng `remark`
--
ALTER TABLE `remark`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`rs_id`);

--
-- Chỉ mục cho bảng `res_category`
--
ALTER TABLE `res_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Chỉ mục cho bảng `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`o_id`);

--
-- Chỉ mục cho bảng `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id_voucher`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `admin_codes`
--
ALTER TABLE `admin_codes`
  MODIFY `id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `dishes`
--
ALTER TABLE `dishes`
  MODIFY `d_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `remark`
--
ALTER TABLE `remark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `rs_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT cho bảng `res_category`
--
ALTER TABLE `res_category`
  MODIFY `c_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `users_orders`
--
ALTER TABLE `users_orders`
  MODIFY `o_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
