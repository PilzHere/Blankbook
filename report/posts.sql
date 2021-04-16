-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 16, 2021 at 04:12 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `posts`
--

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `post` varchar(255) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `post`, `tag`, `author`, `time`) VALUES
(1, 'This is a post!', 'iLovePosts', 'PilzHere', '2021-04-14 15:39:00'),
(2, 'this is the second message.', '#2ndMsg', 'Marcus', '2021-04-14 21:30:04'),
(3, 'This is the 3rd message.', '#Number3', 'Marcus', '2021-04-15 21:38:36'),
(4, 'message 4', '#4', 'Marcus', '2021-04-15 21:42:09'),
(5, 'Message5', '#5', 'Marcus', '2021-04-15 21:43:57'),
(6, 'Message 5', '#numbero sinco', 'Marcus', '2021-04-15 21:48:28'),
(7, 'asd', '#323', 'Marcus', '2021-04-15 21:58:05'),
(8, 'asd', '', 'Marcus', '2021-04-15 23:21:41'),
(9, 'ökajshdökjahsödkjabnsödkjbn', '', 'Marcus', '2021-04-15 23:22:30'),
(10, 'Meddelande', 'enTag', 'Marcus', '2021-04-16 11:03:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
