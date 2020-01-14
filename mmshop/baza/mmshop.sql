-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2019 at 07:54 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mmshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brand`) VALUES
(1, 'Gibson'),
(2, 'Fender'),
(6, 'Ibanez'),
(7, 'Yamaha'),
(8, 'Stagg'),
(9, 'Behringer'),
(10, 'Squier'),
(11, 'Taylor'),
(12, 'Epiphone'),
(13, 'Marshall'),
(14, 'Blackstar'),
(15, 'AKG'),
(16, 'Dobro');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `items` text COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  `ordered` tinyint(4) NOT NULL DEFAULT '0',
  `shipped` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `items`, `expire_date`, `ordered`, `shipped`) VALUES
(8, '[{\"id\":\"2\",\"size\":\"Black\",\"quantity\":1}]', '2020-03-01 11:53:13', 1, 0),
(9, '[{\"id\":\"28\",\"size\":\"Green\",\"quantity\":2}]', '2020-03-01 14:54:28', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `parent`) VALUES
(1, 'Gitare', 0),
(2, 'Oprema', 0),
(3, 'Akusticne', 1),
(4, 'Elektricne', 1),
(5, 'Klasicne', 1),
(6, 'Bas', 1),
(7, 'Pojacala', 2),
(8, 'Trzalice', 2),
(9, 'Zice', 2),
(10, 'Torbe', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `cart_id`, `full_name`, `email`, `phone`, `street`, `city`, `zip_code`, `sub_total`, `description`, `order_date`) VALUES
(10, 8, 'Pavle Markovic', 'pavle@gmail.com', '025544845', 'Nikole Tesle 32', 'Cacak', '32000', '19990.00', '1 proizvod od MM shop-a.', '2019-01-30 11:56:05'),
(11, 9, 'Marko Peric', 'marko@yahoo.com', '3222324', 'Bulevar despota Stefana ', 'Beograd', '11000', '118.00', '2 proizvoda od MM shop-a.', '2019-01-30 19:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `list_price` decimal(10,2) NOT NULL,
  `brand` int(11) NOT NULL,
  `categories` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `sizes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `list_price`, `brand`, `categories`, `image`, `description`, `featured`, `sizes`) VALUES
(1, 'Gibson SG Tribute Future', '91990.00', '99990.00', 1, '4', '/mmshop/img/products/3elektricna.jpg', 'Gibson USA is celebrating 2013 as the Year of Les Paul, and is blowing it up big with a new series of decade-dedicated Tribute SGs, each of which honors the artistry and innovation of inventor and guitarist Les Paul by capturing the essence of a great SG guitar from one of four different eras. All embody the full magic of this legendary guitar design, but are stripped down for improved value and no-nonsense performance.', 1, 'Black:5, Sunburst: 4'),
(2, 'Fender CD-60. Black', '19990.00', '25400.00', 2, '3', '/mmshop/img/products/11gitara.png', 'Zelite karakteristike koje biste ocekivali na mnogo skupljem instrumentu? Onda je Fender CD-60 gitara za Vas, sa karakteristikama koje ukljucuju gornju plocu od smreke, mahagoni stranice i ledja, oklopljene civije. Dostupna je u Black, Natural i Sunburst bojama.', 1, 'Black:5,Natural:4,Sunburst:2'),
(3, 'Ibanez bass ', '659.00', '699.00', 6, '9', '/mmshop/img/products/2zice.jpg', 'Long scale strings', 1, 'Metalne:5'),
(4, 'YAMAHA A 670 ', '20990.00', '24990.00', 7, '7', '/mmshop/img/products/51pojacalo.jpg', 'Snazno jeftino pojacalo', 0, 'Black:5'),
(5, 'Yamaha C30 II ', '15990.00', '18990.00', 7, '5', '/mmshop/img/products/2klasicna.jpg', 'Gitara izvanrednog kvaliteta i zvuka, pribliznih karakteristikao znatno skuplji modeli.', 1, 'Black: 2, Sunburst: 4'),
(8, 'Gibson J-15 akusticna gitara', '189990.00', '199990.00', 1, '3', '/mmshop/img/products/33gitara.jpg', 'The J-15 features the same round-shoulder body shape of Gibson\'s J-45, aka \"The Workhorse\", an incredibly popular acoustic that has been one of Gibson\'s best-selling guitars since it\'s introduction in 1942. With it\'s electronics and high-quality body construction, the J-15 can easily become your new workhorse as it can handle the demands of both intimate settings and larger venues.', 0, 'Black:5,Natural:5,Sunburst:4'),
(9, 'Behringer akusticna gitara', '8990.00', '11990.00', 9, '3', '/mmshop/img/products/1gitara.png', 'Behringer gitara odlicna za pocetnike. Zapocnite svoje prve muzicke korake sa ovom gitarom prelepog dizanjna.', 1, 'Black:4,Natural:4,Sunburst:2'),
(10, 'Squier By Fender SA-105CE', '12990.00', '15990.00', 10, '3', '/mmshop/img/products/44gitara.jpg', 'Fender Squier SA-105 CE BK Dreadnought Acoustic Guitar, cutaway, laminated spruce top, laminated nato back & sides, nato thomann neck, painted maple fretboard, 20 frets, painted maple bridge with compensated saddle, die-cast tuners, 643mm scale, Nut width 43 mm., Fishman Isys-T pickup system, Colour: Sunburst', 0, 'Black:2,Natural:3,Sunburst:5'),
(11, 'Taylor GS Mini, Sapele', '69900.00', '75000.00', 11, '3', '/mmshop/img/products/5gitara.jpg', 'From the couch to the campfire to the concert hall, the GS Mini Acoustic Guitar promises big fun for everyone. Inspired by the big, bold sound of Taylor\'s award-winning GS body shape, the GS Mini scales things down without skimping on sound, packing a lot of tone into a comfortable, portable size and giving you a guitar that\'s incredibly fun to play. With Taylor\'s patented straight and stable NT neck, you\'ll always enjoy signature Taylor intonation and playability. So, wherever you end up, whether you\'re on tour or on the porch, the GS Mini is always ready to play. ', 0, 'Black:5,Natural:5,Sunburst:2'),
(13, 'Epiphone Les Paul Custom PRO', '64990.00', '70990.00', 12, '4', '/mmshop/img/products/1elektricna.jpg', 'The king of solid body guitars, the Les Paul Custom made its debut in 1954 after the initial success of the Les Paul Goldtop. Les Paul himself suggested black as a great color for a new Les Paul because it looked \"classy\" and went well with a tuxedo on stage. Now with its ebony or antique white finish, the Les Paul Custom has often been referred to as the \"tuxedo\" Les Paul.', 1, 'Black:4,Natural:3,Sunburst:4'),
(14, 'Epiphone LES PAUL PLUS TOP PRO WINE RED', '62990.00', '66990.00', 12, '4', '/mmshop/img/products/2elektricna.jpg', 'The Epiphone Les Paul PlusTop PRO sets a new standard for guitars in its price range. Two Epiphone ProBucker humbucking pickups with coil-splitting deliver big slabs of the fat, warm tones, transcontinental sustain, and deep, soulful distortion that made this guitar famous. Crafted with a solid mahogany body and flamed maple carved top, a set mahogany neck, 22-fret rosewood fingerboard, cream body and fingerboard binding, and chrome hardware. The Tune-o-matic bridge and LockTone stopbar tailpiece add seemingly unending sustain and make string changes easier.', 0, 'Red wine: 3'),
(15, 'Taylor T5S1 elektricna gitara', '299990.00', '319990.00', 11, '4', '/mmshop/img/products/4elektricna.jpg', 'The visual allure of a figured maple top is hard to resist on the T5-S1. Opt for the organic beauty of a natural finish, or up the ante with one of several optional color stains like Tobacco Sunburst or Red Edgeburst. ', 0, 'Sunburst:2, Red:3'),
(16, 'Stagg C542 BK', '6990.00', '7499.00', 8, '5', '/mmshop/img/products/2klasicna.jpeg', 'Top, Back & Sides: basswood - Neck: nato - Fingerboard & Bridge: solid maple (black painted) - Machine heads: standard, nickel - Finish: highgloss, Colour: natural - 4/4 Model - Scale Length: 646 mm.', 0, 'Black: 5, Sunburst:5'),
(17, 'Yamaha CG142C', '39990.00', '44990.00', 7, '5', '/mmshop/img/products/3klasicna.jpg', 'Verzija CG142MS/MC gitare sa sjajnim finisom.', 1, 'Black:3, Sunburst: 5'),
(18, 'Fender ESC-80 Natural', '13875.00', '18500.00', 2, '5', '/mmshop/img/products/1klasicna.jpg', 'Fender ESC80: 6-String 3/4 Size Classical Guitar, Rosewood Fretboard, Natural finish.\r\n\r\nThe Fender ESC80 Educational Series 3/4 Size classical acoustic guitar is designed to offer playability, sound, appearance, and the affordability necessary to stimulate the desire and drive to play music.', 0, 'Black:3, Sunburst: 5'),
(19, 'Stagg BC300-SB\r\n', '24990.00', '25990.00', 8, '6', '/mmshop/img/products/5bas.jpg', '4-String \"Fusion\" electric Bass guitar - Pickups: 1 x JB + 1 x PB - Controls: 2 x Volume + 1 x Tone - Body: solid Alder - Neck: Hard Maple, bolt-on, 867 mm (34.2 in.) - Fingerboard: Rosewood, 24 frets - Bridge: \"JB\" Classic - Machine heads: diecast, black - Colour: Sunburst.\r\n\r\n', 1, 'Sunburst:5'),
(20, 'Marshall Bass', '89990.00', '99990.00', 13, '6', '/mmshop/img/products/3bas.jpg', 'First Marshall bass guitar, amazing design.', 0, 'Sunburst: 2'),
(21, 'Blackstar SG 302 Bass', '39990.00', '40990.00', 14, '6', '/mmshop/img/products/1bas.jpg', 'Amazing low price bass guitar\r\n', 1, 'Black/white:5'),
(22, 'Squier By Fender Vintage', '38990.00', '40990.00', 10, '6', '/mmshop/img/products/4bas.jpg', ' The all new Vintage Modified Jazz Bass Left Hand features include an offset-waist body and ultra-slim fast-action neck. ', 0, 'White:10, Sunburst:5'),
(23, 'Gibson Thunderbird Bass', '159990.00', '166990.00', 1, '6', '/mmshop/img/products/2bas.jpg', 'Amazing bass guitar', 0, 'Black:3, Sunburst:4'),
(24, 'Fender SQUIER SP 10 ', '24990.00', '26990.00', 10, '7', '/mmshop/img/products/4pojacalo.jpg', 'Pojacalo idealno za pocetnike', 0, 'Black:4'),
(25, 'Epiphone v2 pojacalo', '40990.00', '45990.00', 12, '7', '/mmshop/img/products/1pojacalojpg.jpg', 'Profesionalno pojacalo pristupacne cene.', 1, 'Black:5'),
(26, 'Epiphone QSC PLD4.5\r\n\r\n', '54990.00', '59990.00', 12, '7', '/mmshop/img/products/2pojacalo.jpg', 'With four flexible channels of up to 2000 watts each, lightweight PowerLight universal power supply, DSP on-board for each channel, and all the right connectors, the PLD4.5 is ideal for production and live sound applications.', 0, 'Black:5, White: 3'),
(27, 'Marshall MG50CFX', '40990.00', '45990.00', 13, '7', '/mmshop/img/products/3pojacalo.jpg', 'The Marshall MG Series MG50CFX 50W 1x12 Guitar Combo Amp is an ideal amp for practicing and even performing in small to medium settings. Boasting a bold carbon fibre clad look, solid digital effects and MG\'s critically acclaimed, analogue tonal heart, the MGCF Series has arrived and is already the practice amp choice of some of the world\'s leading players.', 1, 'Gold:3, Black:5'),
(28, 'Epiphone Jazz', '59.00', '99.00', 12, '8', '/mmshop/img/products/3trzalica.jpg', 'Epiphone jazz trzalica u raznim bojama', 1, 'Green:3,Yellow:5,Red:5'),
(29, 'Trzalica v1', '59.00', '99.00', 15, '8', '/mmshop/img/products/1trzalica.jpg', 'AKG trzalica raznih boja', 0, 'Black:5, White:4,Yellow:5'),
(30, 'Trzalica Skull', '99.00', '129.00', 15, '8', '/mmshop/img/products/2trzalica.jpg', 'AKG trzalica sa likom lobanje', 0, 'Skull:5'),
(31, 'Medium trzalica', '99.00', '119.00', 6, '8', '/mmshop/img/products/5trzalica.jpg', 'Medium trzalica od materijala koji ne kliza pod prstima ', 0, 'Black:4,White:4'),
(32, 'Trzalica v1', '39.00', '59.00', 11, '8', '/mmshop/img/products/6trzalica.jpg', 'Dostupna u razlicitim bojama', 1, 'Black:3,Red:5,Yellow:4'),
(33, 'Stagg AC 1048', '499.00', '599.00', 8, '9', '/mmshop/img/products/3zice.jpg', 'Kvalitetne metalne zice', 0, 'Metalne:5'),
(34, 'Dobro TLP', '599.00', '649.00', 16, '9', '/mmshop/img/products/1zice.jpg', 'Dobro zice za akusticne, elektricne kao i bas gitare.', 1, 'Metalne: 4,Plasticne:3'),
(35, 'CS 28', '399.00', '499.00', 7, '9', '/mmshop/img/products/4zice.jpg', 'Kvalitetne zice za klasicnu gitaru', 0, 'Plasticne:5'),
(36, 'Yamaha F310', '4990.00', '5990.00', 7, '10', '/mmshop/img/products/5torba.jpeg', 'A custom shaped,lightweight soft case,Perfect for most standard Acoustic guitars,Soft case design combines the protection of a thick pad,Interior with the portability of a canvas bag,Manufactured from a rugged material,Interior is lined with sponge like foam material,Provides substantial protection for your guitar,Easy to carry around Long life.,', 0, 'Black/Red:4'),
(37, 'Stagg Classic 3', '2647.00', '3530.00', 8, '10', '/mmshop/img/products/4torba.jpg', 'Torba za klasicne gitare', 1, 'Black:5'),
(38, 'Fender GIG BAG FA620', '7990.00', '8190.00', 2, '10', '/mmshop/img/products/1torba.jpg', 'Fender\'s F620 Series gig bag is a stylish and secure way to keep your dreadnought acoustic guitar safe while traveling. Featuring the iconic asymmetrical Fender shape, its durable outer layer is constructed of tough 600 Denier polyester that protects against impacts while avoiding ripping and tearing.', 0, 'Black:5'),
(39, 'Marshall GIG BAG', '3817.00', '5090.00', 13, '10', '/mmshop/img/products/3torba.jpg', 'Prostrana i kvalitetna MARSHALL torba', 0, 'Black:5'),
(40, 'Ibanez IAB510', '4555.00', '5940.00', 6, '10', '/mmshop/img/products/2torba.png', 'Pametan dizajn zatvaraca omogucuje brzo i sigurno uzimanje i vracanje instrumenta / gitare', 1, 'Black:3');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime NOT NULL,
  `permissions` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `join_date`, `last_login`, `permissions`) VALUES
(6, 'Marko Zlatic', 'Marko@gmail.com', '$2y$10$BQ6EIHFynOb8js7Ql0ZjF.ktciWnqrNdO442WI3bj1jU//O2NXiSe', '2019-01-30 11:48:10', '2019-01-30 11:49:48', 'admin,editor'),
(7, 'Petar Peric', 'petar@gmail.com', '$2y$10$KJrxloIAmqetMfsqYabNV.8ofpmdRCTcD/64BTcchddUcc07baKo6', '2019-01-30 11:48:50', '0000-00-00 00:00:00', 'editor'),
(8, 'Aleksandar Mandic', 'aleksandar@gmail.com', '$2y$10$42sy1iGwCZA7CnXhdTg1xeDF2vY7EzrUX7pq04OrgVZezppqrCxsW', '2019-01-30 11:49:21', '2019-01-30 19:53:55', 'admin,editor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
