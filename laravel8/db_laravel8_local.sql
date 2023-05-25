-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 25, 2023 lúc 10:05 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_laravel8_local`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tin tức', NULL, NULL),
(2, 'Sự kiện quốc tế', NULL, NULL),
(3, 'Sự kiện trong nước', NULL, NULL),
(4, 'Thể thao quốc tế', NULL, NULL),
(5, 'Phóng sự truyền hình', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2023_05_12_023718_create_posts_table', 1),
(5, '2023_05_15_043239_create_profiles_table', 1),
(6, '2023_05_15_065128_create_stores_table', 2),
(13, '2023_05_15_065220_create_products_table', 3),
(14, '2023_05_15_065302_create_product_store_table', 3),
(15, '2023_05_15_073053_alter_product_store_table', 3),
(16, '2023_05_24_025210_create_categories_table', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `hobbie` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `hobbie`, `gender`, `category_id`, `created_at`, `updated_at`) VALUES
(2, 'Nhà ở xã hội 2023', 'mô tả test', NULL, NULL, NULL, '2023-05-21 20:51:14', '2023-05-21 20:51:14'),
(3, 'Nhà ở xã hội 2023', 'mô tả test', NULL, NULL, NULL, '2023-05-21 20:52:04', '2023-05-21 20:52:04'),
(4, 'Nhà ở xã hội a2111', 'mô tả a33', '', 0, NULL, '2023-05-21 21:09:01', '2023-05-25 00:34:17'),
(5, 'sdf', 'fsd', NULL, NULL, NULL, '2023-05-21 21:35:06', '2023-05-21 21:35:06'),
(6, 'ngô kinh', 'ssds', NULL, NULL, NULL, '2023-05-21 23:11:38', '2023-05-21 23:11:38'),
(7, 'f33', 'vccc', NULL, NULL, NULL, '2023-05-21 23:22:10', '2023-05-21 23:22:10'),
(8, 'sd', 'dfsd22', NULL, NULL, NULL, '2023-05-21 23:22:31', '2023-05-21 23:22:31'),
(9, 'dfsdfsdf', 'sdf', NULL, NULL, NULL, '2023-05-21 23:23:07', '2023-05-21 23:23:07'),
(10, 'thuc hien1', 'dd', NULL, NULL, NULL, '2023-05-21 23:52:57', '2023-05-21 23:52:57'),
(11, 'khi nào 22', 'tôi tên tuấn', NULL, NULL, NULL, '2023-05-21 23:53:43', '2023-05-21 23:53:43'),
(12, NULL, NULL, NULL, NULL, NULL, '2023-05-21 23:54:22', '2023-05-21 23:54:22'),
(13, 'test', '221', NULL, NULL, NULL, '2023-05-21 23:54:40', '2023-05-21 23:54:40'),
(14, 'Nhà ở xã hội 202444', 'mô tả test444', NULL, NULL, NULL, '2023-05-22 00:26:52', '2023-05-22 00:26:52'),
(15, 'Nhà ở xã hội 202444', 'mô tả test444', NULL, NULL, NULL, '2023-05-22 00:28:51', '2023-05-22 00:28:51'),
(16, 'Nhà ở xã hội 202444', 'mô tả test444', NULL, NULL, NULL, '2023-05-22 00:29:03', '2023-05-22 00:29:03'),
(17, 'Nhà ở xã hội 20255', 'mô tả test444', NULL, NULL, NULL, '2023-05-22 00:29:13', '2023-05-22 00:29:13'),
(18, 'Nhà ở xã hội 20255', 'mô tả test444', NULL, NULL, NULL, '2023-05-22 00:29:46', '2023-05-22 00:29:46'),
(19, 'Nhà ở xã hội 20255', 'mô tả test444', NULL, NULL, NULL, '2023-05-22 00:30:27', '2023-05-22 00:30:27'),
(21, 'Nhà ở xã hội 2031', 'mô tả test444', NULL, NULL, NULL, '2023-05-22 00:32:00', '2023-05-22 00:32:00'),
(25, 'mo23', 'fsdf', NULL, NULL, NULL, '2023-05-22 01:12:56', '2023-05-22 01:12:56'),
(26, 'một bai bạ', 'jgnnd', NULL, NULL, NULL, '2023-05-22 01:21:47', '2023-05-22 01:21:47'),
(30, 'thêm bài viết mới', 'ssdfsd', NULL, NULL, NULL, '2023-05-22 01:35:56', '2023-05-22 01:35:56'),
(31, NULL, NULL, NULL, NULL, NULL, '2023-05-22 21:20:17', '2023-05-22 21:20:17'),
(32, NULL, NULL, NULL, NULL, NULL, '2023-05-22 23:23:04', '2023-05-22 23:23:04'),
(33, NULL, NULL, NULL, NULL, NULL, '2023-05-22 23:25:57', '2023-05-22 23:25:57'),
(34, NULL, NULL, NULL, NULL, NULL, '2023-05-22 23:26:33', '2023-05-22 23:26:33'),
(36, 'dsdfsdfsd', 'sdfsd', NULL, NULL, NULL, '2023-05-22 23:34:42', '2023-05-22 23:34:42'),
(37, 'sdfsdf', 'd', NULL, NULL, NULL, '2023-05-22 23:37:33', '2023-05-22 23:37:33'),
(38, 'Nhà ở xã hội 999', 'mô tả test1', NULL, NULL, NULL, '2023-05-23 00:20:18', '2023-05-23 00:20:18'),
(39, 'dfsd333', 'fsd', NULL, NULL, NULL, '2023-05-23 00:22:40', '2023-05-23 00:22:40'),
(40, 'chào các bạn 22', 'mô tả chào các bạn 22', NULL, NULL, NULL, '2023-05-23 00:23:02', '2023-05-23 00:23:02'),
(41, 'sdfssdfsdf', 'df', NULL, NULL, NULL, '2023-05-23 00:24:56', '2023-05-23 00:24:56'),
(42, 'sdfsdfsdfs', 'dfsddfsdf', NULL, NULL, NULL, '2023-05-23 01:09:41', '2023-05-23 01:09:41'),
(43, 'sdfsdfsdfs', 'dfsddfsdf', '1,3', NULL, NULL, '2023-05-23 01:10:41', '2023-05-23 01:10:41'),
(44, 'xin cha1', 'dfs1', '1,2', NULL, NULL, '2023-05-23 01:11:26', '2023-05-23 02:28:28'),
(45, 'dddd333', '32', '', NULL, NULL, '2023-05-23 03:22:42', '2023-05-23 03:22:42'),
(46, 'ssssssss222', 'dd', '1,2', NULL, NULL, '2023-05-23 03:23:42', '2023-05-23 03:23:42'),
(47, 'fgdfgdfhdgf', 'fsd', '1,2', NULL, NULL, '2023-05-23 03:25:02', '2023-05-23 03:25:02'),
(48, 'dfsfsd33', 'fsdsd', '1', 2, NULL, '2023-05-23 03:25:43', '2023-05-23 03:25:43'),
(49, 'bài viết smnp', 'mô tả bài viết', '2,3', 3, NULL, '2023-05-23 18:42:00', '2023-05-23 19:41:20'),
(50, 'dfsdfs', 'dfsdfsdf', '2', 2, NULL, '2023-05-23 20:24:55', '2023-05-23 20:24:55'),
(51, 'tuabbb', 'dfsd', '2', 2, NULL, '2023-05-23 20:25:45', '2023-05-23 20:25:45'),
(52, 'sdfsdfs', 'fsdf', '2', 1, 5, '2023-05-23 20:31:41', '2023-05-24 00:55:18'),
(53, 'ngo thb ba t', 'dfsdf', '\'[\"2\",\"7\",\"14\",\"1\"]\'', 2, 1, '2023-05-23 20:32:32', '2023-05-24 00:36:15'),
(54, 'thgg55', 'fhfghfg', '[1,15,14]', 3, 2, '2023-05-23 20:35:27', '2023-05-24 00:55:26'),
(55, 'chủ quan', 'kđk2', '[1,15,14]', 2, 1, '2023-05-23 20:38:11', '2023-05-24 00:36:34'),
(56, 'ccccccc2', 'sád', '[1,2,14]', 1, 3, '2023-05-24 01:13:31', '2023-05-24 01:13:31'),
(57, 'noi ngoai2', 'h12', '1,2', 1, 3, '2023-05-24 01:36:22', '2023-05-24 01:36:22'),
(58, 'Nhà ở xã hội 999', 'mô tả test1', '', 1, 1, '2023-05-25 00:43:00', '2023-05-25 00:43:00'),
(60, 'tesst22', 'sda', '2', 1, 3, '2023-05-25 00:59:34', '2023-05-25 00:59:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `des_info` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `des_info`, `price`, `created_at`, `updated_at`) VALUES
(1, 'sản phẩm aaa loại 1', 'ssa', 150000, NULL, NULL),
(10, 'Sản phẩm 10', 'san pham 10', 150001, NULL, NULL),
(11, 'Sản phẩm 11', 'san pham 11', 190000, NULL, NULL),
(12, 'Sản phẩm 12', 'san pham 12', 160000, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_store`
--

CREATE TABLE `product_store` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_store`
--

INSERT INTO `product_store` (`id`, `product_id`, `store_id`, `created_at`, `updated_at`) VALUES
(1, 10, 1, NULL, NULL),
(2, 11, 1, NULL, NULL),
(3, 10, 2, NULL, NULL),
(4, 12, 1, NULL, NULL),
(5, 10, 2, NULL, NULL),
(6, 12, 3, NULL, NULL),
(7, 10, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `avatar` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `profiles`
--

INSERT INTO `profiles` (`id`, `name`, `avatar`, `created_at`, `updated_at`) VALUES
(1, NULL, 'profile/sEl8NbgHVVcrhcxXROP9LsEGp7nlM0K0uHdS8kPD.jpg', '2023-05-14 21:50:47', '2023-05-14 21:50:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `des_info` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `stores`
--

INSERT INTO `stores` (`id`, `name`, `des_info`, `created_at`, `updated_at`) VALUES
(1, 'Cửa hàng đồ gỗ', 'da hna goc', '2023-05-30 07:23:46', '2023-05-16 07:23:46'),
(2, 'Siêu thị điện máy xanh', 'dien may xanh', NULL, NULL),
(3, 'Nhà hàng Sen đô', 'dxsen do', '2023-05-30 07:24:12', '2023-05-27 07:24:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_store`
--
ALTER TABLE `product_store`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `stores`
--
ALTER TABLE `stores`
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
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `product_store`
--
ALTER TABLE `product_store`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
