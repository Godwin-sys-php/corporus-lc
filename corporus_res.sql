-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 04 mars 2024 à 05:48
-- Version du serveur : 5.7.39
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `corporus_res`
--
CREATE DATABASE IF NOT EXISTS `corporus_res` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `corporus_res`;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nameOfUser` varchar(500) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `phoneNumber` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `birthday` varchar(500) DEFAULT NULL,
  `debt` float NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `nameOfUser`, `name`, `phoneNumber`, `email`, `birthday`, `debt`, `timestamp`) VALUES
(1, 'Patient Burume', 'E1000', '0810102000 / 0999102000', 'e1000.bilemo@gmail.com', '28 mai', 34, 1608057228),
(2, 'Patient Burume', 'Gaby', '0851111111', 'gabyingwa@hotmail.ft', '19 novembre', 461, 1608057532),
(4, 'Patient Burume', 'TSHIONY', '0819942110', 'etiennetke@gmail.com', '21 Octobre', 106, 1608057804),
(5, 'Patient Burume', 'Martin Lumbayi', '0824000317', 'iis.ets.mlumbayi@gmail.com', '25 juin', 0, 1608057937),
(9, 'Fanny', 'Patient Burume', '0810001904', 'burume.batuluke@gmail.com', '30 juillet', 129, 1608061770),
(11, 'Fanny', 'Pascal', NULL, NULL, NULL, 0, 1608145284),
(13, 'Fanny', 'Josué', NULL, NULL, NULL, 0, 1608146617),
(14, 'Fanny', 'François  Xavier', NULL, NULL, '29 janvier', 0, 1608148041),
(15, 'Fanny', 'San deep', '0826991330', NULL, NULL, 0, 1608151642),
(16, 'Fanny', 'Didier', NULL, NULL, NULL, 0, 1608152122),
(17, 'Fanny', 'Daddy', NULL, NULL, NULL, 0, 1608155244),
(18, 'Fanny', 'Chem', NULL, NULL, NULL, 0, 1608230282),
(19, 'Fanny', 'Yvon', NULL, NULL, NULL, 0, 1608235593),
(20, 'Fanny', 'JP', NULL, NULL, NULL, 0, 1608235609),
(21, 'Fanny', 'Maitre Robert', NULL, NULL, NULL, 217.5, 1608238917),
(22, 'Fanny', 'Pym', NULL, NULL, NULL, 0, 1608387531),
(23, 'Fanny', 'Claude', NULL, NULL, NULL, 10.5, 1608387558),
(24, 'Fanny', 'Jamais', NULL, NULL, NULL, 0, 1608390704),
(25, 'Fanny', 'Patrick Tshidibi', NULL, NULL, NULL, 0, 1608396534),
(26, 'Fanny', 'Philipe', NULL, NULL, NULL, 0, 1608456951),
(27, 'Fanny', 'ADAL', NULL, NULL, NULL, 480.5, 1608577140),
(28, 'Fanny', 'Larissa', NULL, NULL, NULL, 12, 1608629604),
(29, 'Fanny', 'Mylor', 'Mondobe', NULL, NULL, 0, 1608745424),
(30, 'Fanny', 'Henry', NULL, NULL, NULL, 0, 1608747915),
(31, 'Fanny', 'Victor', NULL, NULL, NULL, 0, 1608822390),
(32, 'Fanny', 'Offre Patient', NULL, NULL, NULL, 0, 1608832703),
(33, 'Fanny', 'SOLA', NULL, NULL, NULL, 0, 1608996409),
(34, 'Fanny', 'Moisie', NULL, NULL, NULL, 0, 1609004165),
(35, 'Fanny', 'Patrick', NULL, NULL, NULL, 0, 1609082214),
(36, 'Fanny', 'Sandra', 'Le 28.12.2020', NULL, NULL, 0, 1609326006),
(37, 'Fanny', 'le 29.12.2020', NULL, NULL, NULL, 0, 1609330740),
(38, 'Fanny', 'Freddy', NULL, NULL, NULL, 15, 1609409455),
(39, 'Fanny', 'David', NULL, NULL, NULL, 0, 1609417247),
(40, 'Fanny', 'Sabiti', NULL, NULL, NULL, 0, 1609432968),
(41, 'Fanny', 'Asta', NULL, NULL, NULL, 12, 1609615930),
(43, 'Fanny', 'Murphy', NULL, NULL, NULL, 0, 1609866464),
(44, 'Fanny', 'Maitre Gérard', NULL, NULL, NULL, 0, 1609866615),
(45, 'Fanny', 'Gaél', NULL, NULL, NULL, 0, 1609867791),
(46, 'Fanny', 'Emilie', NULL, NULL, NULL, 0, 1610113664),
(47, 'Fanny', 'Uwe', NULL, NULL, NULL, 0, 1610207050),
(48, 'Fanny', 'Serge', NULL, NULL, NULL, 11, 1610215450),
(49, 'Fanny', 'Eric', NULL, NULL, NULL, 0, 1610465411),
(50, 'Fanny', 'Guy-Pierre', NULL, NULL, NULL, 0, 1610467537),
(51, 'Fanny', 'Aurelien', NULL, NULL, NULL, 0, 1610645607),
(52, 'Fanny', 'Marie-ange', NULL, NULL, NULL, 18, 1610646523),
(53, 'Fanny', 'Colonel', NULL, NULL, NULL, 15, 1610731844),
(54, 'Fanny', 'Le 15.01.2021', NULL, NULL, NULL, 0, 1610794823),
(55, 'Fanny', 'Le 17.01.2021', NULL, NULL, NULL, 0, 1610963978),
(56, 'Fanny', 'Guylite', NULL, NULL, NULL, 0, 1611244928),
(57, 'Fanny', 'Junior', NULL, NULL, NULL, 0, 1611251227),
(58, 'Fanny', 'Jean-claude', NULL, NULL, NULL, 0, 1611333856),
(59, 'Fanny', 'Le 25.01.2021', NULL, NULL, NULL, 0, 1611655910),
(60, 'Fanny', 'Anna', NULL, NULL, NULL, 0, 1611771636),
(61, 'Fanny', 'Lenine', NULL, NULL, NULL, 0, 1612016018),
(62, 'Fanny', 'Kassapa', NULL, NULL, NULL, 0, 1612032603),
(63, 'Fanny', 'Ralex', NULL, NULL, NULL, 0, 1612286276),
(64, 'Fanny', 'Tangy', NULL, NULL, NULL, 0, 1612289102),
(65, 'Fanny', 'JC', NULL, NULL, NULL, 0, 1612297494),
(66, 'Fanny', 'Steve', NULL, NULL, NULL, 0, 1612378084),
(67, 'Fanny', 'Kelly', NULL, NULL, NULL, 13, 1612436679),
(69, 'Fanny', 'Edna', NULL, NULL, NULL, 0, 1612542739),
(70, 'Fanny', 'Papy', NULL, NULL, NULL, 24, 1612554279),
(71, 'Fanny', 'Joyce', NULL, NULL, NULL, 0, 1612555722),
(72, 'Fanny', 'le 08.02.2021', NULL, NULL, NULL, 0, 1612887169),
(73, 'Fanny', 'Guillaume', NULL, NULL, NULL, 0, 1612890059),
(74, 'Fanny', 'Richard', NULL, NULL, NULL, 0, 1612891487),
(75, 'Fanny', 'Gobi-jr', NULL, NULL, NULL, 0, 1612891749),
(76, 'Fanny', 'Simon', NULL, NULL, NULL, 0, 1612973130),
(77, 'Fanny', 'Abdalla', NULL, NULL, NULL, 0, 1613215845),
(78, 'Fanny', 'Consommation eau', NULL, NULL, NULL, 0, 1613245984),
(79, 'Fanny', 'Le 19.02.2021', NULL, NULL, NULL, 0, 1613816095),
(80, 'Fanny', 'LOÏC', NULL, NULL, NULL, 0, 1613850682),
(81, 'Fanny', 'Cuisine', NULL, NULL, NULL, 0, 1613934814),
(82, 'Fanny', 'Le 22.02.2021', NULL, NULL, NULL, 0, 1614074199),
(83, 'Fanny', 'Kalubi', NULL, NULL, NULL, 0, 1614095714),
(84, 'Fanny', 'Teddy', NULL, NULL, NULL, 0, 1614248408),
(85, 'Fanny', 'Thys', NULL, NULL, NULL, 13, 1614258007),
(86, 'Fanny', 'Hanse', NULL, NULL, NULL, 0, 1614879664),
(87, 'Fanny', 'Le08.02.2021', NULL, NULL, NULL, 0, 1615281454),
(88, 'Fanny', 'Michel', NULL, NULL, NULL, 0, 1615306589),
(89, 'Fanny', 'Enzo', NULL, NULL, NULL, 0, 1615813347),
(90, 'Fanny', 'Nino', NULL, NULL, NULL, 0, 1615996438),
(91, 'Fanny', 'Arsene', NULL, NULL, NULL, 0, 1616517696),
(92, 'Fanny', 'Guilain kabongo', NULL, NULL, NULL, 5, 1616692135),
(93, 'Fanny', 'Bob', NULL, NULL, NULL, 15.5, 1616779533),
(94, 'Fanny', 'Jeremy', NULL, NULL, NULL, 0, 1617122433),
(95, 'Fanny', 'Sam', NULL, NULL, NULL, 0, 1617123066),
(96, 'Fanny', 'Fabrice', NULL, NULL, NULL, 0, 1617125137),
(97, 'Fanny', 'Emile', NULL, NULL, NULL, 0, 1617206198),
(98, 'Fanny', 'Nicolas', NULL, NULL, NULL, 0, 1617365447),
(99, 'Fanny', 'Carol', NULL, NULL, NULL, 0, 1617390838),
(100, 'Fanny', 'Lyz', NULL, NULL, NULL, 0, 1617562139),
(101, 'Fanny', 'Le 10/04/2021', NULL, NULL, NULL, 0, 1618223819),
(102, 'Fanny', 'Fanny', NULL, NULL, NULL, 0, 1618223872),
(103, 'Fanny', 'Julien', NULL, NULL, NULL, 0, 1618227294),
(104, 'Fanny', 'Willy', NULL, NULL, NULL, 0, 1618433170),
(105, 'Fanny', 'Gilbert', NULL, NULL, NULL, 0, 1618513279),
(106, 'Fanny', 'Bastean', NULL, NULL, NULL, 0, 1618602987),
(107, 'Fanny', 'omar', NULL, NULL, NULL, 4, 1620243266),
(108, 'Fanny', 'Le 10.05.2021', NULL, NULL, NULL, 0, 1620726595),
(109, 'Fanny', 'Bini', NULL, NULL, NULL, 0, 1620758650),
(110, 'Fanny', 'Kerline', NULL, NULL, NULL, 0, 1620846076),
(111, 'Fanny', 'Rosine', NULL, NULL, NULL, 0, 1621020437),
(112, 'Fanny', 'Bluechip', NULL, NULL, NULL, 0, 1622311300),
(113, 'Fanny', 'Cédrick', NULL, NULL, NULL, 0, 1627148406),
(114, 'Fanny', 'Docta guy', NULL, NULL, NULL, 0, 1627576588),
(115, 'Fanny', 'bacardi', NULL, NULL, NULL, 0, 1627846259),
(116, 'Fanny', 'Mandack', NULL, NULL, NULL, 0, 1628170553),
(117, 'Fanny', 'Paul K', NULL, NULL, NULL, 120, 1628449353),
(118, 'Fanny', 'Florys', NULL, NULL, NULL, 0, 1628879542),
(119, 'Fanny', 'Eddy', NULL, NULL, NULL, 0, 1628885303),
(120, 'Fanny', 'Samuel vieux', NULL, NULL, NULL, 0, 1628955137),
(121, 'Fanny', 'Yves', NULL, NULL, NULL, 0, 1629304372),
(122, 'Fanny', 'Simiyu', NULL, NULL, NULL, 0, 1629394488),
(123, 'Fanny', 'Bijoux', NULL, NULL, NULL, 0, 1629394891),
(124, 'Fanny', 'Prince', NULL, NULL, NULL, 0, 1629919420),
(125, 'Fanny', 'Duarte', NULL, NULL, NULL, 0, 1630102074),
(126, 'Fanny', 'Marry', NULL, NULL, NULL, 0, 1630171643),
(128, 'Fanny', 'Cyril', NULL, NULL, NULL, 0, 1630172860),
(129, 'Fanny', 'Mathy', NULL, NULL, NULL, 0, 1630264536),
(130, 'Fanny', 'Billy', NULL, NULL, NULL, 0, 1630685219),
(131, 'Fanny', 'Winnie', NULL, NULL, NULL, 0, 1630774375),
(132, 'Fanny', 'Yannick', NULL, NULL, NULL, 3, 1630774432),
(133, 'Fanny', 'Rahab', NULL, NULL, NULL, 0, 1630774464),
(134, 'Fanny', 'Voisin', NULL, NULL, NULL, 0, 1630964883),
(135, 'Fanny', 'Lucas', NULL, NULL, NULL, 0, 1631213077),
(136, 'Fanny', 'gritao', NULL, NULL, NULL, 0, 1631464030),
(137, 'Fanny', 'Andrea', NULL, NULL, NULL, 0, 1631534104),
(138, 'Fanny', 'Kizitho', NULL, NULL, NULL, 0, 1631826031),
(139, 'Fanny', 'Yahaya', NULL, NULL, NULL, 0, 1631905697),
(140, 'Fanny', 'Joseph', NULL, NULL, NULL, 0, 1632513595),
(141, 'Fanny', 'Vodacom', NULL, NULL, NULL, 0, 1632571276),
(142, 'Fanny', 'Carine KATENDE', NULL, NULL, NULL, 0, 1632574845),
(143, 'Fanny', 'Stephanie', NULL, NULL, NULL, 0, 1632575818),
(144, 'Fanny', 'Bennedict', NULL, NULL, NULL, 0, 1632580638),
(145, 'Fanny', 'Christian', NULL, NULL, NULL, 0, 1632580664),
(146, 'Fanny', 'Adolph', NULL, NULL, NULL, 0, 1632580685),
(147, 'Fanny', 'Patricia', NULL, NULL, NULL, 0, 1632580756),
(148, 'Fanny', 'Dan', NULL, NULL, NULL, 0, 1632580809),
(149, 'Fanny', 'Aridja', NULL, NULL, NULL, 0, 1632580842),
(150, 'Fanny', 'Oscar', NULL, NULL, NULL, 0, 1632583981),
(151, 'Fanny', 'Dino', NULL, NULL, NULL, 0, 1632591648),
(152, 'Fanny', 'Coco', NULL, NULL, NULL, 0, 1632593769),
(153, 'Fanny', 'Accompagnement', NULL, NULL, NULL, 0, 1632596304),
(154, 'Fanny', 'Mrs Ben', NULL, NULL, NULL, 0, 1633098123),
(155, 'Fanny', 'Nicy', NULL, NULL, NULL, 0, 1633523912),
(156, 'Fanny', 'Olivier', NULL, NULL, NULL, 0, 1633704421),
(157, 'Fanny', 'Pitou', NULL, NULL, NULL, 0, 1633803840),
(158, 'Fanny', 'Eyck', NULL, NULL, NULL, 0, 1634233959),
(159, 'Fanny', 'anne', NULL, NULL, NULL, 0, 1634237987),
(160, 'Fanny', 'Alain', NULL, NULL, NULL, 0, 1634395919),
(161, 'Fanny', 'Ingenieur', NULL, NULL, NULL, 0, 1634556889),
(162, 'Fanny', 'nousky', NULL, NULL, NULL, 0, 1634666512),
(163, 'Fanny', 'Fred', NULL, NULL, NULL, 0, 1634834886),
(164, 'Fanny', 'KALAMBAY', NULL, NULL, NULL, 0, 1634834905),
(165, 'Fanny', 'Djo', NULL, NULL, NULL, 0, 1634834923),
(166, 'Fanny', 'Arxel', NULL, NULL, NULL, 0, 1634834952),
(167, 'Fanny', 'Angelos', NULL, NULL, NULL, 0, 1634834972),
(168, 'Fanny', 'Vincent', NULL, NULL, NULL, 0, 1634907118),
(169, 'Fanny', 'Déo', NULL, NULL, NULL, 0, 1634912789),
(170, 'Fanny', 'Fortune', NULL, NULL, NULL, 0, 1634932439),
(171, 'Fanny', 'Foner', NULL, NULL, NULL, 0, 1634992489),
(172, 'Fanny', 'Gracia', NULL, NULL, NULL, 0, 1635265044),
(173, 'Fanny', 'Ben', NULL, NULL, NULL, 0, 1635525408),
(174, 'Fanny', 'Alem', NULL, NULL, NULL, 0, 1635525598),
(175, 'Fanny', 'Grâce', NULL, NULL, NULL, 0, 1635625456),
(176, 'Fanny', 'Chester', NULL, NULL, NULL, 0, 1635972719),
(177, 'Fanny', 'Marc', NULL, NULL, NULL, 0, 1636061204),
(178, 'Fanny', 'Duncan', NULL, NULL, NULL, 0, 1636212020),
(179, 'Fanny', 'Germain', NULL, NULL, NULL, 0, 1636219485),
(180, 'Fanny', 'Jayna', NULL, NULL, NULL, 0, 1636563664),
(182, 'Fanny', 'Poop', NULL, NULL, NULL, 0, 1637081482),
(183, 'Fanny', 'Robert', NULL, NULL, NULL, 0, 1637084413),
(184, 'Fanny', 'Thimotee', NULL, NULL, NULL, 0, 1637335853),
(185, 'Fanny', 'Gitao', NULL, NULL, NULL, 0, 1637409853),
(186, 'Fanny', 'Ndaya', NULL, NULL, NULL, 0, 1637411180),
(187, 'Fanny', 'Livingston', NULL, NULL, NULL, 6, 1638277546),
(188, 'Fanny', 'MUSOKE', NULL, NULL, NULL, 0, 1638288096),
(189, 'Fanny', 'JL', NULL, NULL, NULL, 9.5, 1638307232),
(190, 'Fanny', 'Toussaint', NULL, NULL, NULL, 0, 1638892901),
(191, 'Fanny', 'Albert', NULL, NULL, NULL, 0, 1638898280),
(192, 'Fanny', 'Dody', NULL, NULL, NULL, 34.5, 1639055301),
(193, 'Fanny', 'Sarah', NULL, NULL, NULL, 0, 1639073794),
(194, 'Fanny', 'Omri', NULL, NULL, NULL, 0, 1639412013),
(195, 'Fanny', 'naomie', NULL, NULL, NULL, 0, 1639425259),
(196, 'Fanny', 'Jacques', NULL, NULL, NULL, 0, 1639483161),
(197, 'Fanny', 'Trésor', NULL, NULL, NULL, 0, 1639512521),
(198, 'Fanny', 'Achille', NULL, NULL, NULL, 0, 1639862905),
(199, 'Fanny', 'Marie Louise', NULL, NULL, NULL, 0, 1640360988),
(200, 'Fanny', 'Jean-Paul', NULL, NULL, NULL, 0, 1640546205),
(201, 'Fanny', 'Mike', NULL, NULL, NULL, 0, 1640975094),
(202, 'Fanny', 'gobi', NULL, NULL, NULL, 0, 1641133244),
(203, 'Fanny', 'Arhol', NULL, NULL, NULL, 0, 1641213141),
(204, 'Fanny', 'Jorge', NULL, NULL, NULL, 0, 1641677458),
(205, 'Fanny', 'Alain K', NULL, NULL, NULL, 0, 1642168747),
(206, 'Fanny', 'Guy-guy', NULL, NULL, NULL, 0, 1642528683),
(207, 'Fanny', 'Tonny', NULL, NULL, NULL, 0, 1642784586),
(208, 'Fanny', 'andy', NULL, NULL, NULL, 0, 1643384692),
(209, 'Fanny', 'parfait', NULL, NULL, NULL, 0, 1643469435),
(210, 'Fanny', 'pierre', NULL, NULL, NULL, 0, 1643485752),
(211, 'Fanny', 'Harold', NULL, NULL, NULL, 0, 1643567243),
(213, 'Fanny', 'Jhon', NULL, NULL, NULL, 0, 1643820870),
(214, 'Fanny', 'Raphe K', NULL, NULL, NULL, 0, 1644058522),
(215, 'Fanny', 'Jonathan', NULL, NULL, NULL, 0, 1644331059),
(216, 'Fanny', 'Tanzaniens', NULL, NULL, NULL, 0, 1644433711),
(217, 'Fanny', 'Thierry', NULL, NULL, NULL, 0, 1644512532),
(218, 'Fanny', 'Mini-Foot', NULL, NULL, NULL, 0, 1644678858),
(219, 'Fanny', 'Norah', NULL, NULL, NULL, 0, 1645019798),
(220, 'Fanny', 'Branly', NULL, NULL, NULL, 16.5, 1645031993),
(222, 'Fanny', 'mavie', NULL, NULL, NULL, 0, 1645465727),
(223, 'Fanny', 'Lesly', NULL, NULL, NULL, 0, 1645562350),
(224, 'Fanny', 'Selu', NULL, NULL, NULL, 0, 1645734450),
(225, 'Fanny', 'Fabio', NULL, NULL, NULL, 0, 1646683325),
(226, 'Fanny', 'Chris', NULL, NULL, NULL, 0, 1646743308),
(227, 'Fanny', 'sedar', NULL, NULL, NULL, 0, 1648832134),
(228, 'Fanny', 'sortie cuisine', NULL, NULL, NULL, 0, 1649347410),
(229, 'Fanny', 'Fête d\'anniversaire', NULL, NULL, NULL, 0, 1649353370),
(230, 'Fanny', 'merrylorry', NULL, NULL, NULL, 0, 1649519862),
(231, 'Fanny', 'Spécial Foot - 40 et +40', NULL, NULL, NULL, 0, 1651411416),
(232, 'Godwin Burume', 'Godwin Burume', NULL, NULL, NULL, 34, 1651500906),
(233, 'Fanny', 'marche le 17 mai', NULL, NULL, NULL, 0, 1652790613),
(234, 'Fanny', 'nestor', NULL, NULL, NULL, 0, 1653063309),
(235, 'Fanny', 'Final CL LIVERPOOL VS REAL MADRID', NULL, NULL, NULL, 0, 1653750240),
(236, 'Fanny', 'nana', NULL, NULL, NULL, 46.5, 1654526934),
(237, 'Fanny', 'Théo', NULL, NULL, NULL, 0, 1655314198),
(238, 'Fanny', 'comptoir 1', NULL, NULL, NULL, 0, 1656183350),
(239, 'Fanny', 'comptoir', NULL, NULL, NULL, 0, 1656183372),
(240, 'Fanny', 'yano', NULL, NULL, NULL, 0, 1657130117),
(241, 'Fanny', 'flory luhanga', NULL, NULL, NULL, 0, 1657402258),
(242, 'exaucée', 'jean bosco', NULL, NULL, NULL, 31, 1662580863),
(243, 'exaucée', 'divine', NULL, NULL, NULL, 0, 1662831500),
(244, 'exaucée', 'lisette', NULL, NULL, NULL, 0, 1663018845),
(245, 'exaucée', 'robert burume', NULL, NULL, NULL, 0, 1663262568),
(246, 'exaucée', 'fraterne', NULL, NULL, NULL, 17, 1665772503),
(247, 'exaucée', 'exaucee', '0826873376', NULL, '21.02.', 0, 1667250477),
(248, 'exaucée', 'patrick nloso', NULL, NULL, NULL, 0, 1667333036),
(249, 'exaucée', 'kuria', NULL, NULL, NULL, 0, 1668885165),
(250, 'exaucée', 'kevin', NULL, NULL, NULL, 0, 1669550325),
(251, 'exaucée', 'saade', NULL, NULL, NULL, 0, 1669550347),
(252, 'exaucée', 'luizi christian', NULL, NULL, NULL, 0, 1669550529),
(253, 'exaucée', 'pedro', NULL, NULL, NULL, 0, 1669553288),
(254, 'exaucée', 'ruffin', NULL, NULL, NULL, 0, 1669554629),
(255, 'exaucée', 'maravilla', NULL, NULL, NULL, 0, 1669824192),
(256, 'exaucée', 'tony', NULL, NULL, NULL, 0, 1669916229),
(257, 'exaucée', 'mimina', NULL, NULL, NULL, 0, 1670592822),
(258, 'exaucée', 'jule', NULL, NULL, NULL, 0, 1670597442),
(260, 'exaucée', 'maitre mulumba guy', NULL, NULL, NULL, 0, 1670598453),
(261, 'Patient Burume', 'ZTE Corporation', NULL, NULL, NULL, 0, 1670602488),
(262, 'exaucée', 'judicael', NULL, NULL, NULL, 0, 1670697564),
(263, 'exaucée', 'papin', NULL, NULL, NULL, 0, 1670697632),
(264, 'exaucée', 'peter', NULL, NULL, NULL, 0, 1670706642),
(265, 'exaucée', 'lucien', NULL, NULL, NULL, 0, 1670870008),
(266, 'exaucée', 'abraham', NULL, NULL, NULL, 0, 1671038728),
(267, 'exaucée', 'axel', NULL, NULL, NULL, 0, 1671045121),
(268, 'exaucée', 'felix', NULL, NULL, NULL, 0, 1671046922),
(269, 'exaucée', 'marco', NULL, NULL, NULL, 0, 1671122890),
(271, 'exaucée', 'make', NULL, NULL, NULL, 0, 1671132825),
(272, 'exaucée', 'joeluf', NULL, NULL, NULL, 0, 1671371269),
(273, 'exaucée', 'tarlos', NULL, NULL, NULL, 0, 1671371754),
(274, 'exaucée', 'jean willy', NULL, NULL, NULL, 0, 1671373122),
(275, 'Rebecca', 'AK46', NULL, NULL, NULL, 0, 1672778620),
(276, 'Patient Burume', 'Cindy', '+243 974 126 350', NULL, '10 avril', 0, 1672863421),
(277, 'Rebecca', 'anis', NULL, NULL, NULL, 0, 1673201181),
(278, 'Rebecca', 'djimbrile', NULL, NULL, NULL, 0, 1673643302),
(279, 'Rebecca', 'rebecca', NULL, NULL, NULL, 119, 1674429814),
(280, 'Rebecca', 'dan mulunda', NULL, NULL, NULL, 0, 1674761898),
(281, 'Rebecca', 'anselm', NULL, NULL, '15/2', 0, 1675365193),
(282, 'Rebecca', 'omer', NULL, NULL, NULL, 91.5, 1675699352),
(283, 'Rebecca', 'aristide', NULL, NULL, NULL, 6, 1675701111),
(284, 'Rebecca', 'rebeca', NULL, NULL, '14/10', 0, 1675862155),
(285, 'Rebecca', 'tunde', NULL, NULL, NULL, 0, 1676645428),
(286, 'Rebecca', 'mickael', NULL, NULL, NULL, 0, 1676645542),
(287, 'Rebecca', 'wedgett', NULL, NULL, NULL, 0, 1676645996),
(288, 'Rebecca', 'kenya', NULL, NULL, NULL, 0, 1676657264),
(290, 'Rebecca', 'tambwe thomas', NULL, NULL, NULL, 0, 1677345544),
(291, 'Rebecca', 'delphin', NULL, NULL, NULL, 0, 1677615971),
(292, 'Lisette', 'Deborah Mukasa', '0997939200', NULL, NULL, 0, 1677958843),
(293, 'Lisette', 'Gabi VUVU', '0822370494,', NULL, NULL, 0, 1678279651),
(294, 'Lisette', 'Mr Roudine', NULL, NULL, NULL, 0, 1679937756),
(295, 'Lisette', 'Noël Junior', '+243813273487', NULL, NULL, 0, 1679937893),
(296, 'Rebecca', 'mr innocent', '0999273000', NULL, NULL, 0, 1680739852),
(297, 'Rebecca', 'justin', NULL, NULL, NULL, 0, 1682861642),
(299, 'Lisette', 'Kisaka Pascal', NULL, NULL, NULL, 0, 1683911863),
(300, 'Rebecca', 'baleke', NULL, NULL, NULL, 0, 1684250114),
(301, 'Lisette', 'Joëlle Musawu', '0970908096', 'musauchristine16@gmail.com', '17/05/2000', 0, 1684336268),
(302, 'patient', 'Deo Tambaki', NULL, NULL, NULL, 0, 1687534422),
(303, 'Rebecca', 'Déo kambaki', NULL, NULL, NULL, 0, 1687534660),
(304, 'Rebecca', 'anniversaire patient', NULL, NULL, NULL, 0, 1690815791),
(305, 'Rebecca', 'heritie', NULL, NULL, NULL, 0, 1691415986),
(306, 'Rebecca', 'bob cuisine', NULL, NULL, NULL, 0, 1691416671),
(307, 'Rebecca', 'ORLINE', NULL, NULL, NULL, 0, 1693661525),
(308, 'Rebecca', 'REAGAN', NULL, NULL, NULL, 45.5, 1693661548),
(309, 'Rebecca', 'ROSE', NULL, NULL, NULL, 0, 1693661565),
(310, 'Rebecca', 'richard vunda', NULL, NULL, NULL, 0, 1694268660),
(311, 'Rebecca', 'pathy', NULL, NULL, NULL, 0, 1694710625),
(312, 'Rebecca', 'serge ami gobi', NULL, NULL, NULL, 0, 1696605245),
(313, 'Rebecca', 'Théodore', NULL, NULL, NULL, 0, 1698238619),
(314, 'Rebecca', 'Heritier', '0897335900', 'hemanih20@gmail.com', '14 novembre', 28.5, 1698238711),
(315, 'Rebecca', 'Paulin', NULL, NULL, NULL, 0, 1698238749),
(316, 'Rebecca', 'dan michel', NULL, NULL, NULL, 0, 1704825488),
(317, 'Rebecca', 'junior mbenzo', NULL, NULL, NULL, 0, 1705061968),
(318, 'Rebecca', 'jimmy', NULL, NULL, NULL, 0, 1705157379),
(319, 'Rebecca', 'felicien', NULL, NULL, NULL, 0, 1705171639),
(320, 'Rebecca', 'maitre hugor', NULL, NULL, NULL, 0, 1705332364),
(321, 'Rebecca', 'minina', NULL, NULL, NULL, 0, 1705515613),
(322, 'Rebecca', 'hugue', NULL, NULL, NULL, 0, 1705689522),
(323, 'patient', 'xavier', NULL, NULL, NULL, 0, 1705746490),
(324, 'patient', 'terra', NULL, NULL, NULL, 67, 1705746803),
(325, 'patient', 'Erick Staff', NULL, NULL, NULL, 17, 1705746830),
(327, 'Rebecca', 'landry', NULL, NULL, NULL, 0, 1705767686),
(328, 'Rebecca', 'thsilombo', NULL, NULL, NULL, 0, 1705952631),
(329, 'Rebecca', 'Antoni', NULL, NULL, NULL, 0, 1706366681),
(330, 'Rebecca', 'hubert', NULL, NULL, NULL, 0, 1706375738),
(331, 'Rebecca', 'jean jacques k', NULL, NULL, NULL, 0, 1706454374),
(332, 'Rebecca', 'major serge', NULL, NULL, NULL, 0, 1706464925),
(333, 'Rebecca', 'nancy', NULL, NULL, NULL, 0, 1706721207),
(334, 'Rebecca', 'tely', NULL, NULL, NULL, 0, 1707318552),
(335, 'Rebecca', 'taly', NULL, NULL, NULL, 0, 1707318569),
(336, 'Rebecca', 'franck', NULL, NULL, NULL, 0, 1708977396);

-- --------------------------------------------------------

--
-- Structure de la table `debts`
--

CREATE TABLE `debts` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `sessionId` int(11) DEFAULT NULL,
  `accountId` int(11) DEFAULT NULL,
  `userName` varchar(400) NOT NULL,
  `clientName` varchar(400) NOT NULL,
  `accountName` varchar(400) DEFAULT NULL,
  `enter` float NOT NULL,
  `outlet` float NOT NULL,
  `note` varchar(400) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `dTransactions`
--

CREATE TABLE `dTransactions` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `categoryName` varchar(500) NOT NULL,
  `productName` varchar(500) NOT NULL,
  `userName` varchar(500) NOT NULL,
  `enter` float DEFAULT NULL,
  `outlet` float DEFAULT NULL,
  `after` float NOT NULL,
  `description` varchar(1500) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mAccount`
--

CREATE TABLE `mAccount` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `mAccount`
--

INSERT INTO `mAccount` (`id`, `name`, `amount`) VALUES
(1, 'Cash', 0),
(2, 'Carte Bancaire', 0),
(3, 'M-Pesa', 0),
(4, 'Illico Cash', 0);

-- --------------------------------------------------------

--
-- Structure de la table `mCategory`
--

CREATE TABLE `mCategory` (
  `id` int(11) NOT NULL,
  `pCategoryId` int(11) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `type` varchar(500) NOT NULL,
  `defaultForBuy` tinyint(1) NOT NULL DEFAULT '0',
  `defaultForSell` tinyint(1) NOT NULL DEFAULT '0',
  `isSystem` tinyint(1) NOT NULL DEFAULT '0',
  `cannotDelete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `mCategory`
--

INSERT INTO `mCategory` (`id`, `pCategoryId`, `name`, `type`, `defaultForBuy`, `defaultForSell`, `isSystem`, `cannotDelete`) VALUES
(1, NULL, 'Vente', 'enter', 0, 1, 0, 1),
(2, NULL, 'Achat Produit', 'outlet', 1, 0, 0, 1),
(3, NULL, 'Paiement Dette', 'enter', 0, 0, 0, 1),
(4, 1, 'Achat Boissons', 'outlet', 0, 0, 0, 0),
(5, 2, 'Achat Spiritueux', 'outlet', 0, 0, 0, 0),
(6, 3, 'Achat Plats', 'outlet', 0, 0, 0, 0),
(7, 4, 'Achat Cigarettes', 'outlet', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `mTransactions`
--

CREATE TABLE `mTransactions` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `transactionId` int(11) DEFAULT NULL,
  `accountId` int(11) NOT NULL,
  `categoryName` varchar(500) NOT NULL,
  `userName` varchar(500) NOT NULL,
  `accountName` varchar(200) NOT NULL,
  `enter` float DEFAULT NULL,
  `outlet` float DEFAULT NULL,
  `after` float DEFAULT NULL,
  `description` varchar(1500) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(500) NOT NULL,
  `name` varchar(500) NOT NULL,
  `unit` varchar(500) NOT NULL,
  `isSellable` tinyint(1) NOT NULL,
  `isVersatile` tinyint(1) NOT NULL,
  `price` float DEFAULT NULL,
  `buyPrice` float DEFAULT NULL,
  `inStock` float DEFAULT NULL,
  `depotStock` float NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `categoryId`, `categoryName`, `name`, `unit`, `isSellable`, `isVersatile`, `price`, `buyPrice`, `inStock`, `depotStock`, `timestamp`) VALUES
(1, 2, 'Spiritueux', '4 Cousins Chardonnay Blanc', '-', 1, 0, 10, 0, 2, 0, 1709475989),
(2, 2, 'Spiritueux', '4 Cousins Rouge Merlot', '-', 1, 0, 10, 0, 5, 0, 1709475989),
(3, 2, 'Spiritueux', '4 Cousins Sauvignon Blanc', '-', 1, 0, 10, 0, 5, 0, 1709475989),
(4, 2, 'Spiritueux', '4 Cousins Sauvignon Rouge', '-', 1, 0, 10, 0, 3, 0, 1709475989),
(5, 2, 'Spiritueux', '4 Cousins Sweet White', '-', 1, 0, 10, 0, 3, 0, 1709475989),
(6, 2, 'Spiritueux', 'Baron Blanc de Blancs', '-', 1, 0, 20, 0, 5, 0, 1709475989),
(7, 2, 'Spiritueux', 'Baron d\'arignac Rosé', '-', 1, 0, 20, 0, 0, 0, 1709475989),
(8, 2, 'Spiritueux', 'Baron D\'arignac rouge moelleux', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(9, 2, 'Spiritueux', 'Baron D\'arignac Rouge Sec', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(10, 2, 'Spiritueux', 'Baron d\'Arignac Medium Sweet', '-', 1, 0, 15, 0, 3, 0, 1709475989),
(11, 2, 'Spiritueux', 'BARON ICE', '-', 1, 0, 20, 0, 0, 0, 1709475989),
(12, 2, 'Spiritueux', 'Beluga Vodka Mesure', '-', 1, 0, 7, 0, 0, 0, 1709475989),
(13, 2, 'Spiritueux', 'Bonobo KwiluRhum Mesures', '-', 1, 0, 7, 0, 10, 0, 1709475989),
(14, 2, 'Spiritueux', 'Bouteille Capitain Morgan', '-', 1, 0, 50, 0, 1, 0, 1709475989),
(15, 2, 'Spiritueux', 'Bouteille de AMARULA', '-', 1, 0, 50, 0, 0, 0, 1709475989),
(16, 2, 'Spiritueux', 'Bouteille de BAILEYS', '-', 1, 0, 60, 0, 1, 0, 1709475989),
(17, 2, 'Spiritueux', 'Bouteille de BLACK LABEL', '-', 1, 0, 80, 0, 0, 0, 1709475989),
(18, 2, 'Spiritueux', 'Bouteille de Black Label 37.5cl', '-', 1, 0, 35, 0, 3, 0, 1709475989),
(19, 2, 'Spiritueux', 'Bouteille de CHIVAS 12yrs', '-', 1, 0, 80, 0, 0, 0, 1709475989),
(20, 2, 'Spiritueux', 'Bouteille de CHIVAS 15ans', '-', 1, 0, 100, 0, 0, 0, 1709475989),
(21, 2, 'Spiritueux', 'Bouteille de CHIVAS 18ans', '-', 1, 0, 150, 0, 1, 0, 1709475989),
(22, 2, 'Spiritueux', 'Bouteille de Courvoisier', '-', 1, 0, 110, 0, 0, 0, 1709475989),
(23, 2, 'Spiritueux', 'Bouteille de DOUBLE BLACK 75cl', '-', 1, 0, 100, 0, 1, 0, 1709475989),
(24, 2, 'Spiritueux', 'Bouteille de Gin Bombay 1L', '-', 1, 0, 70, 0, 0, 0, 1709475989),
(25, 2, 'Spiritueux', 'Bouteille de GIN BOMBAY 75cl', '-', 1, 0, 50, 0, 0, 0, 1709475989),
(26, 2, 'Spiritueux', 'Bouteille de GIN GORDON', '-', 1, 0, 50, 0, 0, 0, 1709475989),
(27, 2, 'Spiritueux', 'Bouteille de HENNESSY VS', '-', 1, 0, 120, 0, 0, 0, 1709475989),
(28, 2, 'Spiritueux', 'Bouteille de J&B', '-', 1, 0, 50, 0, 1, 0, 1709475989),
(29, 2, 'Spiritueux', 'Bouteille de Jagermeifter', '-', 1, 0, 70, 0, 0, 0, 1709475989),
(30, 2, 'Spiritueux', 'Bouteille de JACK DANIEL\'S', '-', 1, 0, 60, 0, 0, 0, 1709475989),
(31, 2, 'Spiritueux', 'Bouteille de JACK DANIEL\'S HONEY', '-', 1, 0, 80, 0, 1, 0, 1709475989),
(32, 2, 'Spiritueux', 'Bouteille de JAMSON', '-', 1, 0, 50, 0, 0, 0, 1709475989),
(33, 2, 'Spiritueux', 'Bouteille de MALIBU', '-', 1, 0, 50, 0, 1, 0, 1709475989),
(34, 2, 'Spiritueux', 'Bouteille de MARTINI BLANC', '-', 1, 0, 50, 0, 0, 0, 1709475989),
(35, 2, 'Spiritueux', 'Bouteille de MARTINI ROUGE', '-', 1, 0, 50, 0, 0, 0, 1709475989),
(36, 2, 'Spiritueux', 'Bouteille de RED LABEL', '-', 1, 0, 50, 0, 1, 0, 1709475989),
(37, 2, 'Spiritueux', 'Bouteille de Red Label 37.5cl', '-', 1, 0, 25, 0, 3, 0, 1709475989),
(38, 2, 'Spiritueux', 'Bouteille Disaronno', '-', 1, 0, 70, 0, 0, 0, 1709475989),
(39, 2, 'Spiritueux', 'Bouteille Double Black 1L', '-', 1, 0, 120, 0, 0, 0, 1709475989),
(40, 2, 'Spiritueux', 'Bouteille Glenfiddich 12ans', '-', 1, 0, 80, 0, 0, 0, 1709475989),
(41, 2, 'Spiritueux', 'Bouteille Glenfiddich 15ans', '-', 1, 0, 100, 0, 0, 0, 1709475989),
(42, 2, 'Spiritueux', 'Bouteille Glenfiddich 18 yrs', '-', 1, 0, 150, 0, 1, 0, 1709475989),
(43, 2, 'Spiritueux', 'Bouteille Jack Daniel\'s 1L', '-', 1, 0, 100, 0, 0, 0, 1709475989),
(44, 2, 'Spiritueux', 'Bouteille Jack Daniel\'s Rye', '-', 1, 0, 100, 0, 0, 0, 1709475989),
(45, 2, 'Spiritueux', 'Bouteille Jack Daniels Gentleman 70 cl', '-', 1, 0, 120, 0, 1, 0, 1709475989),
(46, 2, 'Spiritueux', 'Bouteille Jack Daniels Single barrel', '-', 1, 0, 90, 0, 0, 0, 1709475989),
(47, 2, 'Spiritueux', 'Bouteille Johnny Walker Gold 75Cl', '-', 1, 0, 110, 0, 0, 0, 1709475989),
(48, 2, 'Spiritueux', 'Bouteille Martell Blue Swift', '-', 1, 0, 100, 0, 1, 0, 1709475989),
(49, 2, 'Spiritueux', 'Bouteille Martell VS', '-', 1, 0, 100, 0, 0, 0, 1709475989),
(50, 2, 'Spiritueux', 'Bouteille Martell XO', '-', 1, 0, 250, 0, 0, 0, 1709475989),
(51, 2, 'Spiritueux', 'Bouteille Sheridan\'s', '-', 1, 0, 80, 0, 0, 0, 1709475989),
(52, 2, 'Spiritueux', 'Bouteille Signore Prosecco', '-', 1, 0, 20, 0, 0, 0, 1709475989),
(53, 2, 'Spiritueux', 'Bouteille Sir Edward', '-', 1, 0, 25, 0, 6, 0, 1709475989),
(54, 2, 'Spiritueux', 'Champagne Billecart-Salmon Réserve', '-', 1, 0, 50, 0, 2, 0, 1709475989),
(55, 2, 'Spiritueux', 'Champagne Mercier Brut', '-', 1, 0, 80, 0, 0, 0, 1709475989),
(56, 2, 'Spiritueux', 'Champagne Veuve Clicquot Rosé', '-', 1, 0, 150, 0, 0, 0, 1709475989),
(57, 2, 'Spiritueux', 'Chivas 12Y Mesures', '-', 1, 0, 8, 0, 7, 0, 1709475989),
(58, 2, 'Spiritueux', 'Chivas 15 ans mesures', '-', 1, 0, 10, 0, 4, 0, 1709475989),
(59, 2, 'Spiritueux', 'Cognac Bisquit Mesure', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(60, 2, 'Spiritueux', 'Courvoisier Bouteille 1L', '-', 1, 0, 120, 0, 1, 0, 1709475989),
(61, 2, 'Spiritueux', 'DON OSCART BLANC DE BLANC', '-', 1, 0, 60, 0, 0, 0, 1709475989),
(62, 2, 'Spiritueux', 'DON OSCART BRUT', '-', 1, 0, 65, 0, 4, 0, 1709475989),
(63, 2, 'Spiritueux', 'DON OSCART ROSEE', '-', 1, 0, 60, 0, 1, 0, 1709475989),
(64, 2, 'Spiritueux', 'Glenfiddish 12Y 35cl', '-', 1, 0, 35, 0, 0, 0, 1709475989),
(65, 2, 'Spiritueux', 'L.-E Cabernet Sauvignon', '-', 1, 0, 15, 0, 4, 0, 1709475989),
(66, 2, 'Spiritueux', 'L.-E Merlot', '-', 1, 0, 15, 0, 6, 0, 1709475989),
(67, 2, 'Spiritueux', 'L.-E Sauvignon Blanc', '-', 1, 0, 15, 0, 4, 0, 1709475989),
(68, 2, 'Spiritueux', 'LAGAVULIN Mesures', '-', 1, 0, 20, 0, 5, 0, 1709475989),
(69, 2, 'Spiritueux', 'Martini sans Alcool', '-', 1, 0, 15, 0, 2, 0, 1709475989),
(70, 2, 'Spiritueux', 'Mateus', '-', 1, 0, 20, 0, 0, 0, 1709475989),
(71, 2, 'Spiritueux', 'Mesure d\'Amarula', '-', 1, 0, 5, 0, 4, 0, 1709475989),
(72, 2, 'Spiritueux', 'Mesure de Absolut VODKA', '-', 1, 0, 5, 0, 2, 0, 1709475989),
(73, 2, 'Spiritueux', 'Mesure de Bacardi Blanc', '-', 1, 0, 5, 0, 13, 0, 1709475989),
(74, 2, 'Spiritueux', 'Mesure de Bacardi Brun', '-', 1, 0, 5, 0, 0, 0, 1709475989),
(75, 2, 'Spiritueux', 'Mesure de Baileys', '-', 1, 0, 6, 0, 0, 0, 1709475989),
(76, 2, 'Spiritueux', 'Mesure de Black Label', '-', 1, 0, 8, 0, 6, 0, 1709475989),
(77, 2, 'Spiritueux', 'Mesure de Blue Label', '-', 1, 0, 35, 0, 4, 0, 1709475989),
(78, 2, 'Spiritueux', 'Mesure de Campari', '-', 1, 0, 5, 0, 3, 0, 1709475989),
(79, 2, 'Spiritueux', 'Mesure de CAPITAINE MORGAN', '-', 1, 0, 5, 0, 2, 0, 1709475989),
(80, 2, 'Spiritueux', 'Mesure de Cassis', '-', 1, 0, 5, 0, 10, 0, 1709475989),
(81, 2, 'Spiritueux', 'Mesure de Cinzano Bianco', '-', 1, 0, 5, 0, 7, 0, 1709475989),
(82, 2, 'Spiritueux', 'Mesure de COINTREAU', '-', 1, 0, 7, 0, 0, 0, 1709475989),
(83, 2, 'Spiritueux', 'Mesure de DISARONNO', '-', 1, 0, 5, 0, 8, 0, 1709475989),
(84, 2, 'Spiritueux', 'Mesure de DOUBLE BLACK', '-', 1, 0, 10, 0, 6, 0, 1709475989),
(85, 2, 'Spiritueux', 'Mesure de GET 27', '-', 1, 0, 6, 0, 8, 0, 1709475989),
(86, 2, 'Spiritueux', 'Mesure de GIN BOMBAY', '-', 1, 0, 5, 0, 10, 0, 1709475989),
(87, 2, 'Spiritueux', 'Mesure de GIN GORDON', '-', 1, 0, 5, 0, 3, 0, 1709475989),
(88, 2, 'Spiritueux', 'Mesure de HENNESSY VS', '-', 1, 0, 10, 0, 5, 0, 1709475989),
(89, 2, 'Spiritueux', 'Mesure de J&B', '-', 1, 0, 5, 0, 6, 0, 1709475989),
(90, 2, 'Spiritueux', 'Mesure de JACK DANIEL\'S HONEY', '-', 1, 0, 8, 0, 10, 0, 1709475989),
(91, 2, 'Spiritueux', 'Mesure de JACK DANIELS', '-', 1, 0, 8, 0, 8, 0, 1709475989),
(92, 2, 'Spiritueux', 'Mesure de JAGERMEIFTER', '-', 1, 0, 5, 0, 6, 0, 1709475989),
(93, 2, 'Spiritueux', 'Mesure de JAMSON', '-', 1, 0, 5, 0, 7, 0, 1709475989),
(94, 2, 'Spiritueux', 'Mesure de LIMONCELLO', '-', 1, 0, 5, 0, 5, 0, 1709475989),
(95, 2, 'Spiritueux', 'Mesure de MALIBU', '-', 1, 0, 6, 0, 7, 0, 1709475989),
(96, 2, 'Spiritueux', 'Mesure de MARTINI BLANC', '-', 1, 0, 5, 0, 2, 0, 1709475989),
(97, 2, 'Spiritueux', 'Mesure de MARTINI ROUGE', '-', 1, 0, 5, 0, 2, 0, 1709475989),
(98, 2, 'Spiritueux', 'Mesure de RED LABEL', '-', 1, 0, 5, 0, 16, 0, 1709475989),
(99, 2, 'Spiritueux', 'Mesure de Sheridan\'s', '-', 1, 0, 8, 0, 1, 0, 1709475989),
(100, 2, 'Spiritueux', 'Mesure de TEQUILA Camilo', '-', 1, 0, 5, 0, 27, 0, 1709475989),
(101, 2, 'Spiritueux', 'Mesure Glenfiddish 12 ans', '-', 1, 0, 8, 0, 2, 0, 1709475989),
(102, 2, 'Spiritueux', 'Mesure Grundheim', '-', 1, 0, 5, 0, 18, 0, 1709475989),
(103, 2, 'Spiritueux', 'Mesure Jack Daniel Single Barrel', '-', 1, 0, 10, 0, 8, 0, 1709475989),
(104, 2, 'Spiritueux', 'Mesure Martel VS', '-', 1, 0, 10, 0, 8, 0, 1709475989),
(105, 2, 'Spiritueux', 'Mesure Martell Blue Swift', '-', 1, 0, 10, 0, 0, 0, 1709475989),
(106, 2, 'Spiritueux', 'Mesure Triple Sec', '-', 1, 0, 5, 0, 0, 0, 1709475989),
(107, 2, 'Spiritueux', 'Mesures de Tequila Anejo Patron', '-', 1, 0, 7, 0, 10, 0, 1709475989),
(108, 2, 'Spiritueux', 'Mesures Glenfiddich 15ans', '-', 1, 0, 10, 0, 12, 0, 1709475989),
(109, 2, 'Spiritueux', 'Mesures Grand Marnier', '-', 1, 0, 10, 0, 7, 0, 1709475989),
(110, 2, 'Spiritueux', 'Mesures Grant\'s 1L', '-', 1, 0, 5, 0, 15, 0, 1709475989),
(111, 2, 'Spiritueux', 'MOET BRUT 75cl', '-', 1, 0, 80, 0, 3, 0, 1709475989),
(112, 2, 'Spiritueux', 'Moet Brut Moyen', '-', 1, 0, 65, 0, 4, 0, 1709475989),
(113, 2, 'Spiritueux', 'MOET ICE', '-', 1, 0, 100, 0, 0, 0, 1709475989),
(114, 2, 'Spiritueux', 'Papillon Brut', '-', 1, 0, 12.5, 0, 2, 0, 1709475989),
(115, 2, 'Spiritueux', 'Papillon Demi Sec', '-', 1, 0, 20, 0, 1, 0, 1709475989),
(116, 2, 'Spiritueux', 'Pierre Grandet', '-', 1, 0, 60, 0, 1, 0, 1709475989),
(117, 2, 'Spiritueux', 'Ruinart Blanc de Blancs', '-', 1, 0, 225, 0, 1, 0, 1709475989),
(118, 2, 'Spiritueux', 'Ruinart Brut', '-', 1, 0, 150, 0, 1, 0, 1709475989),
(119, 2, 'Spiritueux', 'Ruinart Petit Brut', '-', 1, 0, 80, 0, 0, 0, 1709475989),
(120, 2, 'Spiritueux', 'Shot de Olmeca Chocolate', '-', 1, 0, 7, 0, 5, 0, 1709475989),
(121, 2, 'Spiritueux', 'Shot de Olmeca Sivler', '-', 1, 0, 7, 0, 17, 0, 1709475989),
(122, 2, 'Spiritueux', 'Sir Edward Smoky', '-', 1, 0, 25, 0, 1, 0, 1709475989),
(123, 2, 'Spiritueux', 'Vin Baron d\'arignac Sec', '-', 1, 0, 30, 0, 1, 0, 1709475989),
(124, 2, 'Spiritueux', 'Vin Blanc Domaine de Baume', '-', 1, 0, 30, 0, 1, 0, 1709475989),
(125, 2, 'Spiritueux', 'Vin Rouge Celier D\'Or sec', '-', 1, 0, 15, 0, 1, 0, 1709475989),
(126, 2, 'Spiritueux', 'Vin Rouge Durbanville Hills', '-', 1, 0, 30, 0, 0, 0, 1709475989),
(127, 2, 'Spiritueux', 'Vin Rouge Fleur Du Cap', '-', 1, 0, 35, 0, 0, 0, 1709475989),
(128, 2, 'Spiritueux', 'Vin Rouge Haut de Medoc', '-', 1, 0, 60, 0, 0, 0, 1709475989),
(129, 1, 'Boissons', '33 Export', '-', 1, 0, 4, 0, 20, 24, 1709475989),
(130, 1, 'Boissons', 'BAVARIA', '-', 1, 0, 2.5, 0, 25, 48, 1709475989),
(131, 1, 'Boissons', 'BEAUFORT GRAND', '-', 1, 0, 3, 0, 32, 40, 1709475989),
(132, 1, 'Boissons', 'BEAUFORT PETIT', '-', 1, 0, 2, 0, 50, 144, 1709475989),
(133, 1, 'Boissons', 'CAFE', '-', 1, 0, 3, 0, 8, 0, 1709475989),
(134, 1, 'Boissons', 'CAPUCCINO', '-', 1, 0, 3, 0, 4, 0, 1709475989),
(135, 1, 'Boissons', 'CARTON JUS', '-', 1, 0, 7.5, 0, 1, 0, 1709475989),
(136, 1, 'Boissons', 'CASTEL', '-', 1, 0, 3, 0, 53, 0, 1709475989),
(137, 1, 'Boissons', 'COCA EN BOUTEILLE', '-', 1, 0, 2, 0, 37, 0, 1709475989),
(138, 1, 'Boissons', 'COCA EN CANETTE', '-', 1, 0, 2, 0, 0, 0, 1709475989),
(139, 1, 'Boissons', 'COCA ZERO', '-', 1, 0, 2, 0, 0, 0, 1709475989),
(140, 1, 'Boissons', 'CORONA', '-', 1, 0, 5, 0, 13, 0, 1709475989),
(141, 1, 'Boissons', 'DOPPEL', '-', 1, 0, 3, 0, 0, 0, 1709475989),
(142, 1, 'Boissons', 'Duvel', '-', 1, 0, 7, 0, 24, 60, 1709475989),
(143, 1, 'Boissons', 'Duvel Grand', '-', 1, 0, 18, 0, 1, 0, 1709475989),
(144, 1, 'Boissons', 'EAU', '-', 1, 0, 1.5, 0, 38, 48, 1709475989),
(145, 1, 'Boissons', 'Energie Malt', '-', 1, 0, 2, 0, 17, 24, 1709475989),
(146, 1, 'Boissons', 'FANTA ORANGE', '-', 1, 0, 2, 0, 0, 0, 1709475989),
(147, 1, 'Boissons', 'Guinness', '-', 1, 0, 5, 0, 20, 60, 1709475989),
(148, 1, 'Boissons', 'Heineken Importé', '-', 1, 0, 5, 0, 38, 240, 1709475989),
(149, 1, 'Boissons', 'Heineken Locale', '-', 1, 0, 3, 0, 34, 144, 1709475989),
(150, 1, 'Boissons', 'Heineken Zéro', '-', 1, 0, 4, 0, 2, 0, 1709475989),
(151, 1, 'Boissons', 'Kwak', '-', 1, 0, 10, 0, 2, 0, 1709475989),
(152, 1, 'Boissons', 'LEFFE BLONDE', '-', 1, 0, 5, 0, 17, 12, 1709475989),
(153, 1, 'Boissons', 'LEFFE BRUNE', '-', 1, 0, 5, 0, 29, 36, 1709475989),
(154, 1, 'Boissons', 'LEGEND', '-', 1, 0, 2, 0, 4, 60, 1709475989),
(155, 1, 'Boissons', 'Legend Grand', '-', 1, 0, 3, 0, 0, 0, 1709475989),
(156, 1, 'Boissons', 'Maltina', '-', 1, 0, 2, 0, 15, 60, 1709475989),
(157, 1, 'Boissons', 'MUTZIG', '-', 1, 0, 2, 0, 16, 10, 1709475989),
(158, 1, 'Boissons', 'NESPRESSO', '-', 1, 0, 3, 0, 6, 0, 1709475989),
(159, 1, 'Boissons', 'NKOYI', '-', 1, 0, 3, 0, 5, 48, 1709475989),
(160, 1, 'Boissons', 'PRIMUS', '-', 1, 0, 3, 0, 16, 12, 1709475989),
(161, 1, 'Boissons', 'Primus La Petite', '-', 1, 0, 2, 0, 0, 0, 1709475989),
(162, 1, 'Boissons', 'REDBULL', '-', 1, 0, 4, 0, 6, 48, 1709475989),
(163, 1, 'Boissons', 'SAVANA', '-', 1, 0, 3, 0, 18, 0, 1709475989),
(164, 1, 'Boissons', 'SKOL', '-', 1, 0, 3, 0, 0, 0, 1709475989),
(165, 1, 'Boissons', 'SODA', '-', 1, 0, 1.5, 0, 9, 48, 1709475989),
(166, 1, 'Boissons', 'SPRITE', '-', 1, 0, 2, 0, 10, 24, 1709475989),
(167, 1, 'Boissons', 'STELLA ARTOIS', '-', 1, 0, 5, 0, 10, 12, 1709475989),
(168, 1, 'Boissons', 'TEMBO BOUTEILLE', '-', 1, 0, 4, 0, 52, 36, 1709475989),
(169, 1, 'Boissons', 'TEMBO PRESSION', '-', 1, 0, 3, 0, 45, 90, 1709475989),
(170, 1, 'Boissons', 'THE', '-', 1, 0, 1, 0, 0, 0, 1709475989),
(171, 1, 'Boissons', 'TONIC', '-', 1, 0, 1.5, 0, 18, 60, 1709475989),
(172, 1, 'Boissons', 'TURBO KING', '-', 1, 0, 3, 0, 14, 0, 1709475989),
(173, 1, 'Boissons', 'VERRE DE JUS', '-', 1, 0, 2.5, 0, 2, 0, 1709475989),
(174, 1, 'Boissons', 'VITALO', '-', 1, 0, 3, 0, 15, 12, 1709475989),
(175, 1, 'Boissons', 'XXL', '-', 1, 0, 2, 0, 5, 82, 1709475989),
(176, 3, 'Plat', 'Ailes de poulet', '-', 1, 0, 7.5, 0, 12, 0, 1709475989),
(177, 3, 'Plat', 'ASSIETTE DE FROMAGE', '-', 1, 0, 5, 0, 0, 0, 1709475989),
(178, 3, 'Plat', 'BANANE', '-', 1, 0, 2, 0, 7, 0, 1709475989),
(179, 3, 'Plat', 'Banane Bouillie', '-', 1, 0, 2, 0, 0, 0, 1709475989),
(180, 3, 'Plat', 'BAVETTE', '-', 1, 0, 15, 0, 11, 0, 1709475989),
(181, 3, 'Plat', 'BOLOGNAISE', '-', 1, 0, 10, 0, 7, 0, 1709475989),
(182, 3, 'Plat', 'Bouillon Makoso', '-', 1, 0, 5, 0, 24, 0, 1709475989),
(183, 3, 'Plat', 'Bouillon Ntaba', '-', 1, 0, 10, 0, 0, 0, 1709475989),
(184, 3, 'Plat', 'Boulette Viande', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(185, 3, 'Plat', 'Bout de Porc Fumé', '-', 1, 0, 10, 0, 0, 0, 1709475989),
(186, 3, 'Plat', 'Brochettes 2 pcs', '-', 1, 0, 7.5, 0, 11, 0, 1709475989),
(187, 3, 'Plat', 'Brochettes en plat', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(188, 3, 'Plat', 'Buffet Spécial', '-', 1, 0, 25, 0, 0, 0, 1709475989),
(189, 3, 'Plat', 'COTE DE PORC', '-', 1, 0, 15, 0, 7, 0, 1709475989),
(190, 3, 'Plat', 'Cailles', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(191, 3, 'Plat', 'Carbonade de Porc', '-', 1, 0, 15, 0, 10, 0, 1709475989),
(192, 3, 'Plat', 'Champignons Frais', '-', 1, 0, 2.5, 0, 0, 0, 1709475989),
(193, 3, 'Plat', 'CONTRE FILET', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(194, 3, 'Plat', 'COTE A L\'OS', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(195, 3, 'Plat', 'COU PORC', '-', 1, 0, 8, 0, 0, 0, 1709475989),
(196, 3, 'Plat', 'CROQUE MONSIEUR', '-', 1, 0, 4, 0, 6, 0, 1709475989),
(197, 3, 'Plat', 'Demi Poulet Fume', '-', 1, 0, 10, 0, 0, 0, 1709475989),
(198, 3, 'Plat', 'Dorade', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(199, 3, 'Plat', 'Emballage', '-', 1, 0, 1, 0, 0, 0, 1709475989),
(200, 3, 'Plat', 'Epinard', '-', 1, 0, 2, 0, 9, 0, 1709475989),
(201, 3, 'Plat', 'Filet pur de Boeuf', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(202, 3, 'Plat', 'FRITES', '-', 1, 0, 3, 0, 54, 0, 1709475989),
(203, 3, 'Plat', 'Fufu', '-', 1, 0, 2, 0, 34, 0, 1709475989),
(204, 3, 'Plat', 'Gesiers de Poulet', '-', 1, 0, 7.5, 0, 0, 0, 1709475989),
(205, 3, 'Plat', 'Gigot d\'Agneau', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(206, 3, 'Plat', 'Gombo', '-', 1, 0, 2, 0, 0, 0, 1709475989),
(207, 3, 'Plat', 'Grand Jambonneau', '-', 1, 0, 25, 0, 0, 0, 1709475989),
(208, 3, 'Plat', 'Grand Nzanda braisé 3 pers', '-', 1, 0, 45, 0, 0, 0, 1709475989),
(209, 3, 'Plat', 'Grand Poisson Braisé', '-', 1, 0, 45, 0, 0, 0, 1709475989),
(210, 3, 'Plat', 'Gros Jeune capitaine', '-', 1, 0, 20, 0, 0, 0, 1709475989),
(211, 3, 'Plat', 'GUE', '-', 1, 0, 1, 0, 4, 0, 1709475989),
(212, 3, 'Plat', 'Hamburger', '-', 1, 0, 7, 0, 0, 0, 1709475989),
(213, 3, 'Plat', 'JAMBONNEAU', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(214, 3, 'Plat', 'Jambonneau Fumé', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(215, 3, 'Plat', 'Lapin', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(216, 3, 'Plat', 'Légume Mixtes', '-', 1, 0, 2, 0, 0, 0, 1709475989),
(217, 3, 'Plat', 'Légumes verts', '-', 1, 0, 2, 0, 9, 0, 1709475989),
(218, 3, 'Plat', 'Légumes verts et poisson fumé', '-', 1, 0, 4, 0, 0, 0, 1709475989),
(219, 3, 'Plat', 'LIBOKE', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(220, 3, 'Plat', 'Liboke de Mboto', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(221, 3, 'Plat', 'Liboke de Monganza', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(222, 3, 'Plat', 'Liboke de Mosombo', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(223, 3, 'Plat', 'Liboke de Mpoka', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(224, 3, 'Plat', 'Liboke de Mpose', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(225, 3, 'Plat', 'Liboke de Mungusu', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(226, 3, 'Plat', 'Liboke de Nzanda', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(227, 3, 'Plat', 'LIBOKE MBIKA', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(228, 3, 'Plat', 'Lituma', '-', 1, 0, 3, 0, 0, 0, 1709475989),
(229, 3, 'Plat', 'Malua', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(230, 3, 'Plat', 'Mercredi poisson Spécial', '-', 1, 0, 12.5, 0, 0, 0, 1709475989),
(231, 3, 'Plat', 'Merguez 3 pcs', '-', 1, 0, 5, 0, 0, 0, 1709475989),
(232, 3, 'Plat', 'Moyen Poisson Braisé', '-', 1, 0, 30, 0, 0, 0, 1709475989),
(233, 3, 'Plat', 'Mpoka Moyen braisé pour 2 pers', '-', 1, 0, 30, 0, 0, 0, 1709475989),
(234, 3, 'Plat', 'Mpose', '-', 1, 0, 10, 0, 0, 0, 1709475989),
(235, 3, 'Plat', 'Ngolo Braisé', '-', 1, 0, 30, 0, 0, 0, 1709475989),
(236, 3, 'Plat', 'Ngulu Braisé 500gr', '-', 1, 0, 6, 0, 0, 0, 1709475989),
(237, 3, 'Plat', 'Nundu - Boss de Vache 500g', '-', 1, 0, 12, 0, 0, 0, 1709475989),
(238, 3, 'Plat', 'Petit Poisson Braisé', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(239, 3, 'Plat', 'Pillon Fumé', '-', 1, 0, 10, 0, 0, 0, 1709475989),
(240, 3, 'Plat', 'Pilon de poulet', '-', 1, 0, 7.5, 0, 6, 0, 1709475989),
(241, 3, 'Plat', 'Pilons panés', '-', 1, 0, 9, 0, 0, 0, 1709475989),
(242, 3, 'Plat', 'Plat viande de Porc', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(243, 3, 'Plat', 'Poisson Bar', '-', 1, 0, 20, 0, 0, 0, 1709475989),
(244, 3, 'Plat', 'Poisson Braisé', '-', 1, 0, 20, 0, 0, 0, 1709475989),
(245, 3, 'Plat', 'Poisson Filet de Capitaine', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(246, 3, 'Plat', 'Poisson fumé Mboto', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(247, 3, 'Plat', 'Poisson Jeune Capitaine', '-', 1, 0, 15, 0, 8, 0, 1709475989),
(248, 3, 'Plat', 'Poisson Makayabu', '-', 1, 0, 10, 0, 16, 0, 1709475989),
(249, 3, 'Plat', 'Poisson Malwa', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(250, 3, 'Plat', 'Poisson Mbenga', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(251, 3, 'Plat', 'Poisson Mboto', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(252, 3, 'Plat', 'Poisson Merou', '-', 1, 0, 20, 0, 0, 0, 1709475989),
(253, 3, 'Plat', 'Poisson Monganza', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(254, 3, 'Plat', 'Poisson Morue', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(255, 3, 'Plat', 'Poisson Mosombo', '-', 1, 0, 15, 0, 8, 0, 1709475989),
(256, 3, 'Plat', 'Poisson Mosombo grand Braisé', '-', 1, 0, 30, 0, 0, 0, 1709475989),
(257, 3, 'Plat', 'Poisson Mosombo moyen  braisé', '-', 1, 0, 20, 0, 0, 0, 1709475989),
(258, 3, 'Plat', 'Poisson Mosombo petit braisé', '-', 1, 0, 12.5, 0, 0, 0, 1709475989),
(259, 3, 'Plat', 'Poisson MPoka', '-', 1, 0, 15, 0, 20, 0, 1709475989),
(260, 3, 'Plat', 'Poisson MPoka braisé 1 pers', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(261, 3, 'Plat', 'Poisson MPoka petit braisé', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(262, 3, 'Plat', 'Poisson Mungusu', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(263, 3, 'Plat', 'Poisson Nkamba', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(264, 3, 'Plat', 'Poisson Nzanda', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(265, 3, 'Plat', 'Poisson Nzanda braisé 1 pers', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(266, 3, 'Plat', 'Poisson Nzanda braisé 2 pers', '-', 1, 0, 30, 0, 0, 0, 1709475989),
(267, 3, 'Plat', 'Poisson Perche', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(268, 3, 'Plat', 'Poisson Perche gros', '-', 1, 0, 30, 0, 0, 0, 1709475989),
(269, 3, 'Plat', 'Poisson Saumon', '-', 1, 0, 20, 0, 0, 0, 1709475989),
(270, 3, 'Plat', 'Poisson Sole', '-', 1, 0, 20, 0, 0, 0, 1709475989),
(271, 3, 'Plat', 'Poisson Tilapia', '-', 1, 0, 15, 0, 3, 0, 1709475989),
(272, 3, 'Plat', 'Pomme de terre', '-', 1, 0, 2, 0, 16, 0, 1709475989),
(273, 3, 'Plat', 'Pomme de terre Frites', '-', 1, 0, 3, 0, 0, 0, 1709475989),
(274, 3, 'Plat', 'PONDU', '-', 1, 0, 2, 0, 33, 0, 1709475989),
(275, 3, 'Plat', 'Porc Braisé 500gr', '-', 1, 0, 6, 0, 0, 0, 1709475989),
(276, 3, 'Plat', 'Porc sauce tomate', '-', 1, 0, 10, 0, 0, 0, 1709475989),
(277, 3, 'Plat', 'Potage', '-', 1, 0, 5, 0, 0, 0, 1709475989),
(278, 3, 'Plat', 'Poulet Entier', '-', 1, 0, 15, 0, 13, 0, 1709475989),
(279, 3, 'Plat', 'Poulet Lumba Lumba', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(280, 3, 'Plat', 'Poussin', '-', 1, 0, 15, 0, 2, 0, 1709475989),
(281, 3, 'Plat', 'Purée de pommes de terre', '-', 1, 0, 4, 0, 0, 0, 1709475989),
(282, 3, 'Plat', 'RIZ', '-', 1, 0, 3, 0, 9, 0, 1709475989),
(283, 3, 'Plat', 'SAMBAZA', '-', 1, 0, 5, 0, 13, 0, 1709475989),
(284, 3, 'Plat', 'SAMOUSSA VIANDE', '-', 1, 0, 10, 0, 42, 0, 1709475989),
(285, 3, 'Plat', 'Sauce aux Champignons', '-', 1, 0, 3, 0, 0, 0, 1709475989),
(286, 3, 'Plat', 'SAUCISSE GOMA', '-', 1, 0, 7.5, 0, 32, 0, 1709475989),
(287, 3, 'Plat', 'Saucisses Fraiches 2 pièces', '-', 1, 0, 10, 0, 6, 0, 1709475989),
(288, 3, 'Plat', 'Saucisses piquantes Belgique', '-', 1, 0, 7.5, 0, 0, 0, 1709475989),
(289, 3, 'Plat', 'Souris d\'agneau', '-', 1, 0, 20, 0, 0, 0, 1709475989),
(290, 3, 'Plat', 'Steak de boeuf', '-', 1, 0, 15, 0, 0, 0, 1709475989),
(291, 3, 'Plat', 'Tomahawk', '-', 1, 0, 30, 0, 0, 0, 1709475989),
(292, 3, 'Plat', 'Tucha', '-', 1, 0, 7, 0, 0, 0, 1709475989);

-- --------------------------------------------------------

--
-- Structure de la table `productsCategory`
--

CREATE TABLE `productsCategory` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `productsCategory`
--

INSERT INTO `productsCategory` (`id`, `name`, `timestamp`) VALUES
(1, 'Boissons', 1709475582),
(2, 'Spiritueux', 1709475591),
(3, 'Plats', 1709475605),
(4, 'Cigarettes', 1709475615);

-- --------------------------------------------------------

--
-- Structure de la table `ptCategory`
--

CREATE TABLE `ptCategory` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `type` varchar(500) NOT NULL,
  `defaultForSell` tinyint(1) NOT NULL DEFAULT '0',
  `defaultForBuy` tinyint(1) NOT NULL DEFAULT '0',
  `isSystem` tinyint(1) NOT NULL DEFAULT '0',
  `cannotDelete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ptCategory`
--

INSERT INTO `ptCategory` (`id`, `name`, `type`, `defaultForSell`, `defaultForBuy`, `isSystem`, `cannotDelete`) VALUES
(1, 'Vente', 'outlet', 1, 0, 0, 1),
(2, 'Entrées GastroSys', 'enter', 0, 0, 1, 1),
(3, 'Sorties GastroSys', 'outlet', 0, 0, 1, 1),
(4, 'Approvisionnement', 'enter', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sessionItems`
--

CREATE TABLE `sessionItems` (
  `id` int(11) NOT NULL,
  `sessionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `userName` varchar(500) NOT NULL,
  `productName` varchar(500) NOT NULL,
  `price` float NOT NULL,
  `quantity` float NOT NULL,
  `taken` float NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `clientName` varchar(500) NOT NULL,
  `userName` varchar(500) NOT NULL,
  `serverName` varchar(500) NOT NULL,
  `total` float NOT NULL,
  `reduction` float NOT NULL,
  `isDone` tinyint(1) NOT NULL DEFAULT '0',
  `isPaid` tinyint(1) NOT NULL DEFAULT '0',
  `isDebt` tinyint(1) NOT NULL DEFAULT '0',
  `invoice` varchar(500) DEFAULT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `sessionId` int(11) DEFAULT NULL,
  `productId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `categoryName` varchar(500) NOT NULL,
  `productName` varchar(500) NOT NULL,
  `userName` varchar(500) NOT NULL,
  `enter` float DEFAULT NULL,
  `outlet` float DEFAULT NULL,
  `after` float NOT NULL,
  `description` varchar(1500) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `username` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `type` varchar(500) NOT NULL,
  `timestamp` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`, `timestamp`) VALUES
(1, 'patient', 'patient', '$2b$10$cDBxg3LVLCl/EsJ508SZJeRZhKcAP7OWTlkTMxiKR9aDP5hZK2zX.', 'admin', 'aujourd\'hui'),
(2, 'Godwin Burume', 'godwin', '$2b$10$o4/x/1UXZfuCGMpvDGa95uxRpEZ5K1WCusTif8UReFu9rG5WXCOFa', 'admin', 'Tue, 15 Dec 2020 07:08:25 GMT'),
(9, 'Manager', 'manager', '$2b$10$8N17we0xGXIPJhjy3qJ/PeVISTu7LwSygoJRr1uoNfRAURFAgbVxW', 'manager', 'Tue, 21 Dec 2021 21:46:42 GMT'),
(10, 'Olivier Mukanya', 'olivier', '$2b$10$sSjigg1bXMrnSlgJIcM0Wums6nuK975aWpDBH/XgYU/JUrKCBS7Ei', 'serveur', 'Mon, 16 May 2022 17:04:35 GMT'),
(12, 'christelle', 'christelle', '$2a$10$gGdYLlRXz262rUwgL.687un6kG2SpjefuUKaIKtpF/c3KAiSibuSe', 'serveur', '05/07/2022'),
(14, 'sandra', 'sandra', '$2a$10$uszdwD7FiRyHSiYLSP50r.GUePVL4hgT.adpNgS0AK2QzKBz4y6gW', 'admin', 'qlsjdf'),
(17, 'Lisette', 'lisette', '$2b$10$MI4XDQ75CS/ykmPqNQ80furNN34Ga4SB6JcDHVy8.I9IrtbOCyima', 'manager', 'Tue, 02 Aug 2022 16:08:05 GMT'),
(19, 'Annie', 'annie', '$2b$10$XYnqbe943WRwDNGlduti/OOVsEjrlNWjQZcLz/LPcIVm1MmlGaec.', 'serveur', 'Sat, 19 Nov 2022 12:25:35 GMT'),
(20, 'jonathan', 'jonathan', '$2a$10$0aqi86TYt8QuOODg4ceKduwrbPNKsUTS6eoVEW1d6wp4LNTvHUf0K', 'serveur', '123'),
(21, 'orline', 'orline', '$2a$10$J4i/n8x9GyhGszwTYlwCiehhSgPnEmQVs3PGKB/wzYIdcl6CY5K2a', 'serveur', '123'),
(22, 'joelle', 'joelle', '$2a$10$64QvjCeBndgYXRK2yxiOaO7qog3ILrIjJ3G482SBSpmnsz8BuEooG', 'serveur', '123'),
(25, 'Rebecca', 'rebecca', '$2a$10$JaDXiVAmDzNlChtLYHr/DO2nirRpyrfdAtXzmZJgO1cnYHdEo/xvC', 'serveur', '1234'),
(27, 'reagan', 'reagan', '$2a$10$eRr3mcgOu6ufz/E9PQ2IIeqwGyQvJjLcOM0p3dEoAhx9mmnuSLTXK', 'serveur', '1691232135'),
(28, 'heritier', 'heritier', '$2a$10$B6ahh3N1hhyRMoJ0cQ55guPXmP1OsYPKFwODP5GpYbugLXMCv2YyO', 'serveur', '1691232135'),
(29, 'jolyda', 'jolyda', '$2a$10$hfAW.8At8p3g4zL3gArxoOdLPQicfj1Dmr9EHh7nsFG5J5kAkJ7kW', 'serveur', '1691232135'),
(30, 'Lydie', 'lydie', '$2a$10$JQiBugiuWytODRhJOsEvVebQsxZxtw7wSaHqUfI3NG1IY7DbIpSGW', 'admin', '23123'),
(31, 'terra', 'terra', '$2a$10$vAOsrgs/PnFkbOo8iLVpne4mHB333l.vFRWgGBj.KbOl1kTRiVep.', 'serveur', '1697206078'),
(32, 'erick', 'erick', '$2a$10$SPIK1c6MvPbv8Y3iri.ptOG3QY2RYrUZXGKYYcbJft1D2cC1ci/3G', 'serveur', '1697206078'),
(33, 'moise', 'moise', '$2a$10$Po7lTzFobFgGbElKdrnshOlip6KhV1aQnf4xBMXgV5scC2OS95jiy', 'serveur', '1697206078'),
(34, 'ivan', 'ivan', '$2a$10$PSEwpn0vqMXrmmD19x5k9.f/w.8QJMitMepRXJ9JHibIgfFLb3L8a', 'serveur', '1697206078'),
(36, 'etienne', 'etienne', '$2a$10$QY3h4.v/K2Y82GpeMtJ82.mXYxLakBRM/GFm0fdv9IdNJ3t7ciQZS', 'manager', '1697206078'),
(37, 'naomie', 'naomie', '$2a$10$Q4MrqOJ4k9KXdJ.vy6eCQ.dl6gWvl1DXCgsGginw66L8432lEbBxC', 'admin', '1697206078'),
(38, 'etienne', 'manuella', '$2a$10$fWly2heoErrWg1BhhbyDreoE89gG.F3PJsK6MFHMzjcUvy46.EosS', 'manager', '1697206078');

-- --------------------------------------------------------

--
-- Structure de la table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL,
  `serverName` varchar(150) NOT NULL,
  `clientName` varchar(400) DEFAULT NULL,
  `voucherUrl` varchar(200) NOT NULL,
  `printed` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `debts`
--
ALTER TABLE `debts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `dTransactions`
--
ALTER TABLE `dTransactions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mAccount`
--
ALTER TABLE `mAccount`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mCategory`
--
ALTER TABLE `mCategory`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mTransactions`
--
ALTER TABLE `mTransactions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `productsCategory`
--
ALTER TABLE `productsCategory`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ptCategory`
--
ALTER TABLE `ptCategory`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sessionItems`
--
ALTER TABLE `sessionItems`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=337;

--
-- AUTO_INCREMENT pour la table `debts`
--
ALTER TABLE `debts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `dTransactions`
--
ALTER TABLE `dTransactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mAccount`
--
ALTER TABLE `mAccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `mCategory`
--
ALTER TABLE `mCategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `mTransactions`
--
ALTER TABLE `mTransactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

--
-- AUTO_INCREMENT pour la table `productsCategory`
--
ALTER TABLE `productsCategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `ptCategory`
--
ALTER TABLE `ptCategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `sessionItems`
--
ALTER TABLE `sessionItems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pour la table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
