-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 05, 2018 lúc 08:51 PM
-- Phiên bản máy phục vụ: 10.1.32-MariaDB
-- Phiên bản PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_banhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(14, 14, '2018-05-04', 160000, 'COD', 'k', '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(13, 13, '2018-05-04', 400000, 'ATM', 'Vui lòng giao hàng trước 5h', '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(12, 12, '2018-05-04', 520000, 'COD', 'Vui lòng chuyển đúng hạn', '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(16, 19, '2018-06-05', 510000, 'ATM', 'Anh hai', '2018-06-05 12:02:16', '2018-06-05 12:02:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(20, 16, 2, 2, 180000, '2018-06-05 12:02:16', '2018-06-05 12:02:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(18, 'Hải Trường Phan', 'nam', 'dnm@gmail.com', 'KTX KHU B DHQG TPHCM, Tô Vĩnh Diện, Đông Hòa, Dĩ An, Binh Duong', '01667906866', 'Anh hai', '2018-06-05 11:56:34', '2018-06-05 11:56:34'),
(19, 'Hải Trường Phan', 'nam', 'dnm@gmail.com', 'KTX KHU B DHQG TPHCM, Tô Vĩnh Diện, Đông Hòa, Dĩ An, Binh Duong', '01667906866', 'Anh hai', '2018-06-05 12:02:16', '2018-06-05 12:02:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(1, ' Toshiba Satellite L40-AS130XG ', 6, 'Bộ vi xử lý: Core i5-4200U(1.6Ghz-3Mb) \r\nBộ nhớ trong: 4Gb \r\nDung lượng ổ cứng: 500Gb \r\nMàn hình: 14.0 HD 200 CSV LD \r\nCạc đồ họa:Nvidia GT755M 2Gb ', 15690000, 14690000, 'toshiba-2.jpg', 'cái', 1, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(2, 'Toshiba Satellite L40-AS130XW', 6, 'Bộ vi xử lý: Core i5-4200U(1.6Ghz-3Mb) \r\nBộ nhớ trong: 4Gb \r\nDung lượng ổ cứng: 500Gb \r\nMàn hình: 14.0 HD 200 CSV LD \r\nCạc đồ họa:Nvidia GT755M 2Gb ', 15690000, 14690000, 'toshiba-1.jpg', 'cái', 1, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(3, 'Acer ES1 533 P6L2', 5, 'Acer ES1 thuộc trong phân khúc giá rẻ thích hợp cho học sinh, sinh viên nên có thiết kế khá cơ bản, vỏ nhựa nhẹ nhàng và các họa tiết in chìm chống bám vân tay hiệu quản. Máy có trọng lượng 2.4 kg, tương đối gọn nhẹ cho nhiều điều kiện sử dụng và di chuyển dễ dàng.', 8490000, 7490000, 'acer-4.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(4, 'Acer Swift SF314 54 51QL', 5, 'Acer Swift SF314 54 51QL sở hữu hiệu năng phần cứng khá mạnh mẽ nhờ CPU Core i5 thế hệ thứ 8 Kabylake Refresh với rất nhiều cải tiến để tăng sức mạnh cũng như tiết kiệm pin hơn. Xung nhịp thông thường 1.6 GHz, có thể tăng lên 3.4 GHz ở các công việc nặng nề hơn. Máy sở hữu RAM 4G công nghệ DDR4 chạy ở xung nhịp cao 2400 MHz kết hợp cùng 1 TB ổ cứng HDD cho mọi tác vụ được trơn tru, lưu giữ được nhiều dữ liệu, có thể nâng cấp ổ cứng SSD M.2 tốc độ c', 16990000, 0, 'acer-3.jpg', 'cái', 1, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(5, 'Acer Nitro 5 AN515 51 739L i7', 5, 'Acer Nitro 5 AN515 là dòng laptop sinh ra để phục vụ nhu cầu chơi game của các game thủ. Với cấu hình vượt trội CPU Intel Core i7 kết hợp cùng card đồ họa GTX 1050 sẽ cho bạn một trải nghiệm chơi game hoàn toàn tuyệt vời.\r\n\r\nAcer Nitro 5 AN515 có thiết kế hầm hố, đầy mạnh mẽ với thiết kế bên trong tản nhiệt rất tốt, tối ưu cho nhu cầu sử dụng liên tục và bền bỉ', 23490000, 0, 'acer-2.gif', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(6, 'Acer Swift SF315 51 530V i5', 5, 'Acer Swift SF315 51 530V là một trong những laptop đầu tiên được trang bị công nghệ CPU Intel mới thế hệ thứ 8 mới nhất tại thời điểm ra mắt. Thuộc dòng sản phẩm tầm trung cao, SF315 có thiết kế đẹp mắt, sang trọng với vỏ kim loại, đồng thời cũng chắc chắn và bền bỉ.', 16990000, 15990000, 'acer-1.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-03 04:00:23'),
(7, 'HP Pavilion x360 11-ad026TU', 4, 'Cân nặng:	1.5 kg\r\nCPU:	Core i3-7100U Processor 2.4GHz (3M Cache)\r\nMàu sắc:	Silver\r\nTình Trạng Máy :	Mới 100%\r\nXuất xứ:	Chính hãng\r\nRAM:	4GB DDr4 (2133MHz)\r\nỔ cứng:	HDD 500GB (5400rpm)\r\nMàn hình:	11.6 HD (1366x768) IPS WLED Backlit MultiTouch Enabled Edge To Edge Glass\r\nVGA/GPU:	Intel HD Graphics 620M', 12490000, 0, 'hp-4.jpg', 'cái', 1, '2018-05-04 06:00:27', '2018-06-03 04:00:23'),
(8, 'DELL VOSTRO 15 3568', 1, 'CPU: Intel Core i5\r\nRAM/HDD: 4GB/1TB\r\nMàn hình: HD 15.6 inch\r\nHĐH: Linux\r\nBảo hành: 12 tháng', 13490000, 12990000, 'dell-vostro-5568x.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(9, 'Laptop HP PAVILION X360 13-U106TU ', 4, 'Cân nặng:	1.6KG\r\nCPU:	Core i3, 7100U, 2.4GHz, 3M\r\nMàu sắc:	Silver\r\nTình Trạng Máy :	Mới 100%\r\nXuất xứ:	Chính hãng\r\nRAM:	4GB DDR4\r\nỔ cứng:	HDD 500GB (5400rpm)\r\nMàn hình:	13.3 inch Touch HD (1366 x 768 pixels) IPS WLED-backlit\r\nVGA/GPU:	Intel® UHD Graphics 620', 12090000, 11090000, 'hp-3.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(10, 'DELL VOSTRO 14 - 5471', 1, 'Vi xử lý Intel core i5 thế hệ 8\r\nRAM DDR4 4GB\r\nỔ cứng 1 TB\r\nMàn hình 14.0\'\' Full HD\r\nHệ điều hành Windows 10 Home\r\nThiết kế nhẹ, cứng cáp', 17490000, 0, 'dell-xxx.jpg', 'cái', 1, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(11, 'Laptop HP Pavilion 14-bf016TU', 4, 'Cân nặng:	1.7KG\r\nCPU:	Core i3, 7100U, 2.4GHz, 3M\r\nMàu sắc:	Silver\r\nTình Trạng Máy :	Mới 100%\r\nXuất xứ:	Chính hãng\r\nRAM:	4GB DDR4\r\nỔ cứng:	HDD 1000GB (5400rpm)\r\nMàn hình:	14 inch Full HD (1920x1080) Resolution, High Brightness Acer ComfyView LED Backlit TFT LCD\r\nVGA/GPU:	Intel® UHD Graphics 620', 11390000, 0, 'hp-2.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(12, 'Laptop Hp Pavilion 14-AL114TU', 4, 'Cân nặng:	2KG\r\nCPU:	Core i3, 7100U, 2.4GHz, 3M\r\nMàu sắc:	Silver\r\nTình Trạng Máy :	Mới 100%\r\nXuất xứ:	Chính hãng\r\nRAM:	4GB DDR4\r\nỔ cứng:	HDD 500GB (5400rpm)\r\nMàn hình:	14 HD (1366 x 768) Diagonal SVA BrightView WLED Backlit\r\nVGA/GPU:	Intel® UHD Graphics 620', 10990000, 9990000, 'hp-1.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-03 04:00:23'),
(14, 'ASUS VIVOBOOK S14 S410UA – EB218T', 3, '-CPU: Intel® Core™ i3-7100U Processor (3M Cache 2.4 GHz)\r\n-VGA: Intel® HD Graphics 620\r\n-RAM: 4GB DDR4 2400 MHz SDRAM HDD: 1000G HDD\r\n-DISPLAY:14 inch - 16:9 FHD (1920x1080) LED Backlight\r\n-OS: Windows 10 Home 64 bit', 11990000, 10990000, 'Asuc-4.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(15, 'ASUS UX490UA-XS74-B', 3, '-CPU:7th Generation Intel Core i7 - 7500U Processor\r\n-VGA: Intel® HD Graphics\r\n-RAM: 16GB DDR4 HDD: 512GB Solid State Drive\r\n-DISPLAY: 14\" LED FHD (1920x1080) Anit Glaire\r\n-OS: Windows 10', 36900000, 34900000, 'Asuc-3.jpg', 'cái', 1, '2018-05-04 06:00:27', '2018-06-03 04:00:23'),
(16, 'ASUS TUF GAMING FX504GD-E4177', 3, '-CPU: Intel® Core i5-8300H (2.3GHz upto 4.0GHz)\r\n-VGA: NVIDIA GeForce GTX 1050 2GB GDDR5 + Intel UHD Graphics 630\r\n-RAM: 8GB DDR4 - 2666MHz\r\n-HDD: 1TB HDD 5400rpm (SSHD 8GB)\r\n-DISPLAY: 15.6\" FHD (1920 x 1080) IPS\r\n-OS: Windows 10', 18900000, 17900000, 'Ausc-2.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(17, 'ASUS FX53VD-MS72', 3, '-CPU: 7th Generation Intel® Core™ i7 7700HQ Processors\r\n-VGA: NVIDIA GeForce GTX 1050\r\n-RAM: 8GB DDR4 2400MHz\r\n-HDD: 256G SATA 3 SSD\r\n-DISPLAY: 15.6\" FHD (1920x1080) Anti-Glare LED-backlit\r\n-OS: Win10', 20190000, 21500000, 'Asus-fx53vd.jpg', 'cai', 0, '2018-05-04 06:00:27', '2018-06-03 04:00:23'),
(18, 'MPXY2 - Macbook Pro Retina 2017 13inch SSD 512GB', 2, '3.1GHz dual-core Intel Core i5 processor, Turbo Boost up to 3.5GHz\r\n8GB 2133MHz LPDDR3 memory\r\n512GB SSD storage\r\nIntel Iris Plus Graphics 650\r\nFour Thunderbolt 3 ports\r\nBacklit Keyboard - US English', 42900000, 0, 'Apple-Macbook-Pro-retina-2017.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(19, 'Macbook Pro Retina MJLQ2 (15.4 inch, Mid 2018) ', 2, '- CPU: 2.2 GHz Quad-Core Intel Core i7 (Turbo Boost 3.4 GHz) Crystalwell\r\n- Graphics: Integrated Intel Iris Graphics\r\n- RAM: 16 GB 1600MHz DDR3L\r\n- Ổ cứng SSD: 256 GB\r\n- Màn hình Retina 15.4 inch. Độ phân giải : 2880 x 1800\r\n- Cổng Mạng : 802.11ac Wi-Fi, Bluetooth 4.0\r\n- Khe Cắm : Thunderbolt 2, USB 3.0, HDMI\r\n- Thiết bị nghe nhìn : FaceTime HD Camera, Dual Mics\r\n- Force Touch Trackpad\r\n- Hệ điều hành : Mac OS X Yosimite', 37500000, 0, 'Apple-Macbook-Pro-retina.jpg', 'cái', 1, '2018-05-15 02:16:15', '2018-06-03 04:00:23'),
(20, 'MPXW2 - Macbook Pro Retina 2017 13inch', 2, '3.1GHz dual-core Intel Core i5 processor, Turbo Boost up to 3.5GHz\r\n8GB 2133MHz LPDDR3 memory\r\n512GB SSD storage\r\nIntel Iris Plus Graphics 650\r\nFour Thunderbolt 3 ports\r\nBacklit Keyboard - US English', 41500000, 0, 'Apple-Macbook-Pro-17.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(21, 'Macbook Pro 13\'\' 2017 MPXW2 -I5', 2, '3.1GHz dual-core Intel Core i5 processor, Turbo Boost up to 3.8Gh\r\n16GB 2133MHz LPDDR3 memory\r\n1TB SSD storage\r\nIntel Iris Plus Graphics 650\r\nFour Thunderbolt 3 ports\r\nBacklit Keyboard - US English', 41500000, 39500000, 'Apple-Macbook-Pro-13.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 07:25:27'),
(22, 'ALIENWARE 17 R4', 1, '-CPU:\r\nIntel® Core™ i7-7700HQ Processor 6M Cache up to 3.80 GHz\r\n-VGA:\r\nGeForce GTX 1060 6GB GDDR5\r\n-RAM:\r\n16GB DDR4-2400Mhz\r\n-HDD:\r\n1000G HDD\r\n-DISPLAY:\r\n17.3\"\" FHD IPS Tobii IR Eye\r\n-OS:\r\nWindows 10 Home\r\n-TÌNH TRẠNG:\r\nDell Outlet New', 37990000, 35990000, 'Dell-Alienware-17-r4.jpg', 'cái', 1, '2018-05-04 06:00:27', '2018-06-03 04:00:23'),
(23, 'Dell XPS 13 9360 2017 i5', 1, '-Dell XPS 13 2017 9360 i7 Kabe lake thế hệ 7 Dòng Ultrabook cao cấp của Dell mạnh nhất hiện nay\r\n-Máy Xách Tay từ Mỹ về đời mới nhất như mới Like New 99%', 24390000, 0, 'Dell XPS 13.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(24, 'LAPTOP DELL VOSTRO 5568 ', 1, '-Nắp lưng kim loại sang trọng\r\n-Màn hình 15.6 inch HD sắc nét\r\n-Vi xử lý Intel core i5 7200U\r\n-RAM 4GB, Ổ cứng HDD 1TB', 16990000, 0, 'dell-vostro-5568.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-03 04:00:23'),
(25, 'Dell XPS 15 9560 2107', 1, 'Dell XPS 15 9560 2017 i7 7700HQ 2.8Ghz, Ram 16GB, SSD 512GB, Vga GTX1050 4GB, 15.6\" IPS UHD 4K IGZO 3840x2160 Touch Screen New Full Box', 47790000, 44290000, 'Dell XPS 15 9560 2017.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(26, 'Dell Precision M6700', 1, ' CPU 	 Intel Core i7 3720QM ( 8 x 2.6Ghz, Turbo Boost 3.6Ghz, 6MB Cache)\r\n RAM	 8GB PC3 1600MHz, up to 32GB\r\n Hard Disk	 HDD 500GB 7200rpm\r\n VGA	 NVIDIA Quadro K3000M ( 2GB 256 bit upto 10GB vs Ram ) + Intel HD Graphics 4000\r\n LCD 	 17.3-inch Anti-Glare FHD Ultrasharp (1920x1080)\r\n OS	 Windows 7 Professional 64bit\r\n Wifi	 Wireless-N Wi-Fi (802.11b/g/n) for connectivity\r\n Lan	 Ethernet (10/100/1000)\r\n Battery	 Up to 2 hours of battery life (9-cell)\r\n Options	 DVD-RW, Webcam, Card Reader, Out VGA, HDMI, 4 x USB,....\r\n Tình trạng	 Máy đẹp 98%, hàng nhập USA\r\n Bảo hành	12 Tháng', 15500000, 0, 'dell-m670f0-6.jpg', 'cái', 0, '2018-05-15 02:16:15', '2018-06-04 07:25:27'),
(27, 'LENOVO IDEAPAD 320 - 15IKB', 7, 'Màn hình: 15.6 inch Full HD\r\nVi xử lý: Intel Core i5 thế hệ 8\r\nRAM: 4 GB\r\nỔ cứng: HDD 1TB\r\nHệ điều hành Free DOS\r\nĐồ họa tích hợp', 11990000, 10990000, 'lenovo-5.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(28, 'Toshiba Satellite C40-A117', 6, 'Bộ vi xử lý : Intel Core i3-3120M 2.5GHz\r\nBộ nhớ trong : RAM 4G \r\nỔ đĩa cứng : HDD 500G(SATA5400)\r\nKích cỡ màn hình : 14 inch\r\nỔ đĩa quang : DVD-RW', 9390000, 0, 'toshiba-3.jpg', 'cái', 1, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(29, 'Toshiba Satellite C50', 6, 'Hãng Sản Xuất : Toshiba\r\nBộ vi xử lý : N2830 2*2.16Ghz-1Mb\r\nMàn hình : 15.6Inch\r\nBộ nhớ trong : 2 GB \r\nỔ đĩa cứng : 500GB', 6999000, 0, 'toshiba-4.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(30, 'LAPTOP LENOVO THINKPAD E470', 7, 'Màu sắc:	Đen\r\nNhà sản xuất:	Lenovo\r\nXuất xứ:	Trung Quốc\r\nThời gian bảo hành:	12 tháng\r\nĐịa điểm bảo hành:	Nguyễn Kim\r\nCPU:	Intel Core i5\r\nLoại CPU:	7200U\r\nTốc độ CPU:	2.50 GHz\r\nBộ nhớ đệm:	3 MB Cache', 15190000, 14190000, 'lenovo-1.jpg', 'cái', 1, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(31, 'LENOVO IDEAPAD 710S PLUS 13.3\'\'', 7, 'Màn hình: IPS FullHD 13.3 inch\r\nVi xử lý: Intel core i5 7200U\r\nRAM: 8 GB\r\nỔ cứng: SSD 256 GB\r\nĐồ họa: Intel HD Graphics 620\r\nHệ điều hành: Windows 10 Home SL', 20490000, 19490000, 'lenovo-2.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(32, 'LENOVO YOGA 520-14IKB', 7, 'CPU: Intel Core i5\r\nRAM/HDD: 4GB/1TB\r\nMàn hình: FHD 14 inch\r\nCard MH: Intel HD Graphics\r\nHĐH: Windows 10 Home EM', 15900000, 14900000, 'lenovo-3.jpg', 'cái', 0, '2018-05-04 06:00:27', '2018-06-04 01:38:35'),
(33, 'LENOVO IDEAPAD Y520-15IKBN', 7, 'Màn hình IPS 15.6\'\' FullHD\r\nRAM 8GB/HDD 1TB/SSD 128GB\r\nVi xử lý Intel Core i5\r\nĐồ họa NVIDIA® GeForce® GTX 1050 4GB', 20990000, 19990000, 'lenovo-4.jpg', 'cái', 1, '2018-05-04 06:00:27', '2018-06-04 01:38:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'laptop-h-slide-1920x750.jpg'),
(2, '', 'slide_index_3.jpg'),
(3, '', 'P.jpg'),
(4, '', '1487908354_banner1.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Laptop Dell', 'Dell Inc là một công ty đa quốc gia của Hoa Kỳ về phát triển và thương mại hóa công nghệ máy tính có trụ sở tại Round Rock, Texas, Hoa Kỳ. Dell được thành lập năm 1984 do chủ quản gia Michael Dell đồng sáng lập. Đây là công ty có thu nhập lớn thứ 28 tại Hoa Kỳ.', '', NULL, NULL),
(2, 'Laptop Apple', 'Chắc hẳn đã có lần bạn bị vẻ đẹp từ những chiếc máy tính Mac quyến rũ ngay từ cái nhìn đầu tiên và bạn sẽ bắt đầu tìm hiểu về thiết kế, khả năng làm việc và giá bán của những chiếc máy tính xách tay này.', '', '2018-05-15 02:16:15', '2018-06-04 01:38:35'),
(3, 'Laptop Asus', 'Được thành lập năm 1989, ASUS là công ty điện tử tiêu dùng và phần cứng máy tính đa quốc gia có trụ sở tại Đài Loan. Luôn cam kết tạo nên những sản phẩm thông minh cho cuộc sống hiện tại và tương lai, ASUS là thương hiệu gaming và bo mạch chủ Số 1 thế giới, đồng thời thuộc top 3 nhà cung cấp máy tính xách tay tiêu dùng hàng đầu.', '', '2018-05-04 06:00:27', '2018-06-04 07:25:27'),
(4, 'Laptop HP', 'Thương hiệu HP có nguồn gốc từ Mỹ, cùng với Dell và Acer, HP đã trở thành một trong ba nhà sản xuất PC lớn nhất. Ngoài ra HP còn là một trong những nhà sản xuất luôn đưa ra những cái đầu tiên trong làng laptop và có rất nhiều dòng laptop đa dạng khác nhau.', '', '2018-05-04 03:12:30', '2018-06-04 02:22:22'),
(5, 'Laptop Acer', 'Acer là một tập đoàn có trụ sở tại Đài Loan, chuyên sản xuất và kinh doanh các thiết bị, phần cứng máy tính, được thành lập từ năm 1976. Tại Việt Nam, Acer được biết đến nhiều nhất với sản phẩm máy tính sách tay. Thế nhưng, ngoài Laptop, Acer còn sản xuất máy tính để bàn, máy tính bảng, server, các thiết bị lưu trữ, màn hình hiển thị, smartphone và các thiết bị ngoại vi. ', '', '2018-05-28 04:00:00', '2018-06-03 04:00:23'),
(6, 'Laptop Toshiba', 'Nói đến thiết kế của Toshiba trong năm nay vẫn là một sự dậm chân tại chỗ, chưa có một sản phẩm nào \"độc đáo\" và \"khác lạ\" mang dấu ấn của chính hãng ngoài một điểm sáng trong dòng Toshiba Kirabook và thiết kế Skyline mới đặc trưng trên Toshiba Satellite P55t, Satellite S55t, Satellite E45t với vỏ nhôm và các góc được bo tròn mang theo sự mềm mại.', '', '2018-05-25 17:19:00', '2018-05-31 22:19:20'),
(7, 'Laptop Lenovo', 'Lenovo là một trong những hãng điện tử sản xuất máy tính và các thiết bị di động lớn đến từ nhà sản xuất Trung Quốc, mang thương hiệu toàn cầu.', '', '2018-05-25 17:19:00', '2018-06-03 04:00:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 'Phan Hải Trường', 'admin@gmail.com', '$2y$10$fGXEqkvlbcVTIcTgL/PrJu1GkapwJwsxWBVbqU.lQONB5mS8dIAR6', '01667906866', 'Hà Nội', 'wOMkQnq2aiQ9PJrZaOlWwKbQ0BpJuiAYMPtaqtSD6n72OZvkwCSWF0hOPi4c', '2018-06-05 12:35:17', '2018-06-05 12:35:17'),
(8, 'Hai Hai', 'admin1@gmail.com', '$2y$10$hirHHDzwVG.T2XKiZuu.ze0VKOzoqL9TbrHRJ7VCMV/paCToAV0mS', '111111', 'Hà Nội', 'FI9hYc2sSGdSIyU7zDofVUykLkIFIay7FVdwtk1kObW3TjfNHLEoIgtjGasf', '2018-06-05 13:18:33', '2018-06-05 13:18:33');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
