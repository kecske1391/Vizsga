-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Nov 24. 11:13
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `book_review`
--

DROP DATABASE  book_review;

CREATE DATABASE IF NOT EXISTS book_review;

USE book_review;


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `be_ki`
--

CREATE TABLE IF NOT EXISTS `be_ki` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `bejelentkezes` timestamp NOT NULL DEFAULT current_timestamp(),
  `kijelentkezes` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `be_ki`
--

INSERT INTO `be_ki` (`id`, `user_id`, `bejelentkezes`, `kijelentkezes`) VALUES
(1, 1, '2026-11-20 07:15:00', '2026-11-20 08:02:30'),
(2, 1, '2026-11-22 18:40:10', '2026-11-22 20:05:44'),
(3, 2, '2026-11-20 11:05:21', '2026-11-20 11:48:09'),
(4, 2, '2026-11-23 06:55:00', '2026-11-23 07:20:15'),
(5, 3, '2026-11-21 15:30:00', '2026-11-21 17:12:37'),
(6, 3, '2026-11-24 08:10:05', NULL),
(7, 4, '2026-11-21 20:00:00', '2026-11-21 21:15:00'),
(8, 4, '2026-11-23 12:25:48', '2026-11-23 13:01:02'),
(9, 5, '2026-11-22 09:00:00', '2026-11-22 09:45:20'),
(10, 5, '2026-11-24 07:30:12', NULL),
(11, 6, '2026-11-22 16:18:33', '2026-11-22 17:00:00'),
(12, 7, '2026-11-23 19:05:00', '2026-11-23 21:30:41'),
(13, 7, '2026-11-24 06:45:00', '2026-11-24 07:10:00'),
(14, 8, '2026-11-21 10:11:11', '2026-11-21 10:59:59'),
(15, 8, '2026-11-24 09:02:00', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `book_language` varchar(30) NOT NULL,
  `publication_year` smallint(6) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `book_language`, `publication_year`, `user_id`) VALUES
(1, 'Egri csillagok', 'Gárdonyi Géza', 'magyar', 1901, 1),
(2, 'A Pál utcai fiúk', 'Molnár Ferenc', 'magyar', 1906, 1),
(3, 'Az ember tragédiája', 'Madách Imre', 'magyar', 1861, 2),
(4, 'Harry Potter and the Philosopher\'s Stone', 'J. K. Rowling', 'angol', 1997, 3),
(5, 'A Gyűrűk Ura: A Gyűrű Szövetsége', 'J. R. R. Tolkien', 'magyar', 1954, 3),
(6, '1984', 'George Orwell', 'angol', 1949, 4),
(7, 'Gyilkosság az Orient expresszen', 'Agatha Christie', 'magyar', 1934, 5),
(8, 'Dracula', 'Bram Stoker', 'angol', 1897, 5),
(9, 'Büszkeség és balítélet', 'Jane Austen', 'magyar', 1813, 6),
(10, 'Bűn és bűnhődés', 'Fjodor Mihajlovics Dosztojevszkij', 'magyar', 1866, 6),
(11, 'Dűne', 'Frank Herbert', 'magyar', 1965, 7),
(12, 'A kis herceg', 'Antoine de Saint-Exupéry', 'francia', 1943, 7),
(13, 'The Adventures of Sherlock Holmes', 'Arthur Conan Doyle', 'angol', 1892, 8),
(14, 'Az alkimista', 'Paulo Coelho', 'magyar', 1988, 2),
(15, 'Sapiens: Az emberiség rövid története', 'Yuval Noah Harari', 'magyar', 2011, 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `book_tags`
--

CREATE TABLE `book_tags` (
  `book_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `book_tags`
--

INSERT INTO `book_tags` (`book_id`, `tag_id`) VALUES
(1, 7),
(1, 11),
(1, 56),
(2, 1),
(2, 7),
(2, 56),
(3, 1),
(3, 5),
(3, 43),
(4, 7),
(4, 10),
(4, 52),
(5, 7),
(5, 10),
(5, 54),
(6, 17),
(6, 21),
(6, 24),
(7, 9),
(7, 15),
(7, 55),
(8, 12),
(8, 16),
(8, 54),
(9, 13),
(9, 20),
(9, 56),
(10, 4),
(10, 9),
(10, 18),
(11, 7),
(11, 21),
(12, 2),
(12, 43),
(12, 56),
(13, 15),
(13, 22),
(13, 55),
(14, 7),
(14, 43),
(14, 56),
(15, 38),
(15, 47),
(15, 48);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `data_bank`
--

CREATE TABLE IF NOT EXISTS `data_bank` (
  `id` int(10) UNSIGNED NOT NULL,
  `card_last4` char(4) NOT NULL,
  `szamlaszam` varchar(34) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `genres` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `tags`
--

INSERT INTO `tags` (`id`, `genres`) VALUES
(6, 'Action'),
(7, 'Adventure'),
(34, 'Architecture'),
(35, 'Art'),
(8, 'Biographical'),
(58, 'BL'),
(53, 'Comedy'),
(26, 'Cooking'),
(27, 'Crafts'),
(9, 'Crime'),
(55, 'Detective Stories'),
(40, 'Disciplines'),
(1, 'Drama'),
(36, 'Education'),
(50, 'Engineering'),
(2, 'Fairy Tales'),
(10, 'Fantasy'),
(31, 'Fitness'),
(37, 'Foreign Language Study'),
(29, 'Games'),
(30, 'Health'),
(11, 'Historical'),
(38, 'History'),
(28, 'Hobbies'),
(12, 'Horror'),
(39, 'Language Arts'),
(57, 'LGBTQ+'),
(4, 'Literary'),
(13, 'Love Stories'),
(52, 'Magic'),
(41, 'Mathematics'),
(14, 'Medical'),
(54, 'Monsters'),
(32, 'Music'),
(15, 'Mystery'),
(3, 'Mythology'),
(42, 'Nature'),
(56, 'Novel'),
(33, 'Pets'),
(43, 'Philosophy'),
(5, 'Poetry'),
(17, 'Political'),
(44, 'Political Science'),
(18, 'Psychological'),
(45, 'Psychology'),
(46, 'Religion'),
(19, 'Religious'),
(20, 'Romance'),
(60, 'Romantasy'),
(47, 'Science'),
(21, 'Science Fiction'),
(22, 'Short Stories'),
(48, 'Social Science'),
(23, 'Sports'),
(16, 'Supernatural'),
(49, 'Technology'),
(24, 'Thrillers'),
(25, 'Tragedy Novel'),
(51, 'Transportation'),
(59, 'WL');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `phone`) VALUES
(1, 'Kovács Anna', 'kovacs.anna@example.com', '+36201234567'),
(2, 'Nagy Péter', 'nagy.peter@example.com', '+36301234568'),
(3, 'Szabó Réka', 'szabo.reka@example.com', '+36701234569'),
(4, 'Tóth Gábor', 'toth.gabor@example.com', '+36201234570'),
(5, 'Horváth Eszter', 'horvath.eszter@example.com', '+36301234571'),
(6, 'Varga Bence', 'varga.bence@example.com', '+36201234572'),
(7, 'Kiss Dóra', 'kiss.dora@example.com', '+36701234573'),
(8, 'Molnár Márton', 'molnar.marton@example.com', '+36301234574');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `be_ki`
--
ALTER TABLE `be_ki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `book_tags`
--
ALTER TABLE `book_tags`
  ADD PRIMARY KEY (`book_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- A tábla indexei `data_bank`
--
ALTER TABLE `data_bank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `genres` (`genres`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `be_ki`
--
ALTER TABLE `be_ki`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `data_bank`
--
ALTER TABLE `data_bank`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `be_ki`
--
ALTER TABLE `be_ki`
  ADD CONSTRAINT `be_ki_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `book_tags`
--
ALTER TABLE `book_tags`
  ADD CONSTRAINT `book_tags_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `data_bank`
--
ALTER TABLE `data_bank`
  ADD CONSTRAINT `data_bank_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
