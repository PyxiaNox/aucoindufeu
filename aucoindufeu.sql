-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 15 jan. 2021 à 22:42
-- Version du serveur :  8.0.21
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `aucoindufeu`
--

-- --------------------------------------------------------

--
-- Structure de la table `adress`
--

DROP TABLE IF EXISTS `adress`;
CREATE TABLE IF NOT EXISTS `adress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5CECC7BEA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adress`
--

INSERT INTO `adress` (`id`, `user_id`, `name`, `firstname`, `lastname`, `company`, `adress`, `zipcode`, `city`, `country`, `phone`) VALUES
(4, 6, 'Adresse maison', 'André', 'Claudel', NULL, '125 Avenue Jean Jaurès', '59000', 'Lille', 'FR', '0781452298'),
(5, 6, 'Adresse boutique', 'André', 'Claudel', 'Famille Claudel - Antiquités', '36 Boulevard du Général de Gaulle', '59000', 'Lille', 'FR', '0781452298'),
(6, 4, 'Adresse maison', 'Kathleen', 'Dubarle', NULL, '33 Rue Auguste Lamire', '33700', 'Mérignac', 'FR', '0606060606'),
(7, 7, 'Adresse maison', 'Michel', 'Dupont', NULL, '8 Rue Albert Camus', '44000', 'Nantes', 'FR', '0698741523'),
(8, 9, 'Adresse 1', 'Adam', 'Van Houten', NULL, '365ter Boulevard Simone Veil', '67000', 'Strasbourg', 'FR', '0754848484'),
(9, 10, 'Adresse maison', 'Xavier', 'Dang', NULL, '15 Rue de Paris', '75000', 'Paris', 'FR', '0606060606'),
(10, 8, 'Adresse bureau', 'Kathleen', 'Dubarle', 'Pyxia Nox', '36 Chemin des Acacias', '33700', 'Mérignac', 'FR', '0606060606');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

DROP TABLE IF EXISTS `carrier`;
CREATE TABLE IF NOT EXISTS `carrier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'Colissimo', 'Livraison du colis au domicile sous 48 h (2 jours ouvrables), toutefois sans garantie et sans contrepartie en cas de livraison plus tardive. \r\nLes colis peuvent être suivis en ligne via un numéro d\'identification, et sont assurés en cas de détérioration, perte ou vol.\r\n\r\nUn service international existe pour l\'envoi de colis vers les pays étrangers (les envois peuvent être soumis à des formalités douanières).', 990),
(2, 'UPS', 'UPS met à votre disposition des solutions de livraisons pour particuliers qui vous permettront d\'expédier des colis depuis leur domicile ou d\'un centre UPS proche, puis de suivre et de gérer ces colis pendant leur trajet.\r\n\r\nVous pouvez facilement planifier les livraisons ou les enlèvements, intercepter un colis en transit si vous changez d’avis, et même recueillir des conseils et des astuces pour l’emballage et l’expédition.\r\n\r\nLivraison en un jour ouvrable ou selon la date souhaitée (si précisée avant l\'expédition).', 1290);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Histoire'),
(2, 'Politique'),
(3, 'Religion'),
(4, 'Littérature'),
(5, 'Arts'),
(6, 'Sciences');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20201220040853', '2020-12-20 04:09:11', 1352),
('DoctrineMigrations\\Version20201226130745', '2020-12-26 13:08:00', 2193),
('DoctrineMigrations\\Version20201226132508', '2020-12-26 13:25:26', 3755),
('DoctrineMigrations\\Version20210101181346', '2021-01-01 18:14:07', 6594),
('DoctrineMigrations\\Version20210102030755', '2021-01-02 03:08:17', 2711),
('DoctrineMigrations\\Version20210102034016', '2021-01-02 03:40:30', 5374),
('DoctrineMigrations\\Version20210103205433', '2021-01-03 20:54:49', 2319),
('DoctrineMigrations\\Version20210104040244', '2021-01-04 04:02:56', 1709),
('DoctrineMigrations\\Version20210105003319', '2021-01-05 00:33:38', 3424),
('DoctrineMigrations\\Version20210107050953', '2021-01-07 05:10:08', 5429),
('DoctrineMigrations\\Version20210109142231', '2021-01-09 14:22:44', 3306),
('DoctrineMigrations\\Version20210109143338', '2021-01-09 15:07:18', 2050),
('DoctrineMigrations\\Version20210109154230', '2021-01-09 15:42:43', 2938),
('DoctrineMigrations\\Version20210109234640', '2021-01-09 23:46:56', 7574),
('DoctrineMigrations\\Version20210115004747', '2021-01-15 00:48:05', 3551),
('DoctrineMigrations\\Version20210115011022', '2021-01-15 01:10:35', 3391);

-- --------------------------------------------------------

--
-- Structure de la table `header`
--

DROP TABLE IF EXISTS `header`;
CREATE TABLE IF NOT EXISTS `header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `btntitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btnurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `header`
--

INSERT INTO `header` (`id`, `title`, `content`, `btntitle`, `btnurl`, `illustration`) VALUES
(5, 'Au Coin du Feu', 'Venez vous plonger dans une ambiance chaleureuse et intimiste au sein de notre bouquinerie', 'Venir nous voir', 'http://localhost/aucoindufeu/public/nous-contacter', '86d9d5b7be5bebed17810b7afee5c434896e11ad.jpg'),
(6, 'Expertise', 'Nous expertisons vos ouvrages avec soin, Au Coin du Feu ou chez vous', 'Nous contacter', 'http://localhost/aucoindufeu/public/nous-contacter', 'e9217bce79e3cb42da0b59b3714ef84257e52fab.jpg'),
(7, 'Vente', 'Nous achetons et vendons des ouvrages anciens et pour certains, rares et au prix du marché actuel', 'Nos livres', 'http://localhost/aucoindufeu/public/produits', 'c1785be5c480748af628274021732788607f0e8d.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `create_at` datetime NOT NULL,
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F5299398A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `create_at`, `carrier_name`, `carrier_price`, `delivery`, `reference`, `stripe_session_id`, `state`) VALUES
(1, 4, '2021-01-04 00:27:22', 'Colissimo', 9.15, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '', NULL, 0),
(2, 4, '2021-01-04 01:55:36', 'Colissimo', 9.15, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '', NULL, 0),
(3, 4, '2021-01-04 21:11:49', 'Colissimo', 9.15, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '04012021-5ff3849511142', NULL, 0),
(4, 4, '2021-01-04 21:13:27', 'Colissimo', 9.15, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '04012021-5ff384f7cb7e1', NULL, 0),
(5, 4, '2021-01-04 21:15:55', 'Colissimo', 9.15, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '04012021-5ff3858b178c2', NULL, 0),
(6, 4, '2021-01-04 21:17:17', 'Colissimo', 9.15, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '04012021-5ff385dd6f04c', NULL, 0),
(7, 4, '2021-01-04 21:22:34', 'Colissimo', 9.15, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '04012021-5ff3871ad7fab', NULL, 0),
(8, 4, '2021-01-04 21:23:11', 'Colissimo', 9.15, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '04012021-5ff3873f010ef', NULL, 0),
(9, 4, '2021-01-04 21:25:14', 'Colissimo', 9.15, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '04012021-5ff387ba850eb', NULL, 0),
(10, 4, '2021-01-04 21:27:29', 'Colissimo', 9.15, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '04012021-5ff3884181a46', NULL, 0),
(11, 4, '2021-01-04 21:28:18', 'Colissimo', 9.15, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '04012021-5ff38872471a2', NULL, 0),
(12, 6, '2021-01-05 00:04:57', 'Colissimo', 9.15, 'André Claudel<br>0781452298<br>Famille Claudel - Antiquités<br>36 Boulevard du Général de Gaulle<br>59000 Lille<br>FR', '05012021-5ff3ad298c795', NULL, 0),
(13, 6, '2021-01-05 01:33:45', 'Colissimo', 9.15, 'André Claudel<br>0781452298<br>Famille Claudel - Antiquités<br>36 Boulevard du Général de Gaulle<br>59000 Lille<br>FR', '05012021-5ff3c1f9489bb', NULL, 0),
(14, 4, '2021-01-05 01:48:28', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff3c56c216c0', NULL, 0),
(15, 4, '2021-01-05 01:49:58', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff3c5c6c3156', NULL, 0),
(16, 4, '2021-01-05 01:52:54', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff3c676ef718', NULL, 0),
(17, 4, '2021-01-05 01:53:42', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff3c6a652039', NULL, 0),
(18, 4, '2021-01-05 01:56:07', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff3c7375e41d', NULL, 0),
(19, 4, '2021-01-05 02:00:13', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff3c82d4031f', NULL, 0),
(20, 4, '2021-01-05 02:00:45', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff3c84dab536', NULL, 0),
(21, 4, '2021-01-05 03:18:55', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff3da9f46673', NULL, 0),
(22, 4, '2021-01-05 21:02:38', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4d3ee25f7f', NULL, 0),
(23, 4, '2021-01-05 21:23:35', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4d8d7c0bd5', NULL, 0),
(24, 4, '2021-01-05 21:27:46', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4d9d2eac73', NULL, 0),
(25, 4, '2021-01-05 21:55:15', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e043dd71b', NULL, 0),
(26, 4, '2021-01-05 22:02:05', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e1dd48295', NULL, 0),
(27, 4, '2021-01-05 22:04:04', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e254d8d9d', NULL, 0),
(28, 4, '2021-01-05 22:05:40', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e2b455a0f', NULL, 0),
(29, 4, '2021-01-05 22:06:23', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e2df0e000', NULL, 0),
(30, 4, '2021-01-05 22:07:01', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e305ec378', NULL, 0),
(31, 4, '2021-01-05 22:07:35', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e327a5cea', NULL, 0),
(32, 4, '2021-01-05 22:09:56', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e3b4a3095', NULL, 0),
(33, 4, '2021-01-05 22:10:26', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e3d237282', NULL, 0),
(34, 4, '2021-01-05 22:14:58', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e4e274f75', NULL, 0),
(35, 4, '2021-01-05 22:16:43', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e54be46ea', NULL, 0),
(36, 4, '2021-01-05 22:19:27', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e5ef2e4ab', NULL, 0),
(37, 4, '2021-01-05 22:21:58', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e68643a0b', NULL, 0),
(38, 4, '2021-01-05 22:25:18', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e74e46e49', NULL, 0),
(39, 4, '2021-01-05 22:26:28', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e7947a281', NULL, 0),
(40, 4, '2021-01-05 22:27:22', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4e7cac477a', NULL, 0),
(41, 4, '2021-01-05 22:41:33', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4eb1d67234', NULL, 0),
(42, 4, '2021-01-05 22:49:41', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4ed050b000', NULL, 0),
(43, 4, '2021-01-05 22:50:21', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4ed2d68752', NULL, 0),
(44, 4, '2021-01-05 22:51:07', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4ed5b0e02c', NULL, 0),
(45, 4, '2021-01-05 22:52:08', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4ed985a315', NULL, 0),
(46, 4, '2021-01-05 22:52:50', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4edc29a979', NULL, 0),
(47, 4, '2021-01-05 22:53:27', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4ede70904b', NULL, 0),
(48, 4, '2021-01-05 22:54:21', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4ee1d59a16', NULL, 0),
(49, 4, '2021-01-05 22:58:24', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4ef1006b99', NULL, 0),
(50, 4, '2021-01-05 23:13:10', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4f286e82d1', NULL, 0),
(51, 4, '2021-01-05 23:33:38', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4f752cf106', NULL, 0),
(52, 4, '2021-01-05 23:34:07', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4f76f43abb', NULL, 0),
(53, 4, '2021-01-05 23:35:13', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4f7b10f317', NULL, 0),
(54, 4, '2021-01-05 23:37:44', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '05012021-5ff4f8485a4a7', NULL, 0),
(55, 4, '2021-01-06 03:25:08', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '06012021-5ff52d944256c', NULL, 0),
(56, 4, '2021-01-06 04:16:22', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '06012021-5ff53996bf9bf', NULL, 0),
(57, 4, '2021-01-06 04:18:21', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '06012021-5ff53a0d49eb6', NULL, 0),
(58, 4, '2021-01-06 04:19:20', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '06012021-5ff53a484d968', NULL, 0),
(59, 4, '2021-01-06 04:20:45', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '06012021-5ff53a9d77ea3', NULL, 3),
(60, 4, '2021-01-06 04:21:33', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '06012021-5ff53acd83819', NULL, 2),
(61, 4, '2021-01-06 04:23:25', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>33 Rue Auguste Lamire<br>33700 Mérignac<br>FR', '06012021-5ff53b3d16604', NULL, 3),
(62, 7, '2021-01-07 04:54:50', 'Colissimo', 990, 'Michel Dupont<br>0698741523<br>8 Rue Albert Camus<br>44000 Nantes<br>FR', '07012021-5ff6941a4b3d3', NULL, 2),
(63, 6, '2021-01-10 19:27:09', 'Colissimo', 990, 'André Claudel<br>0781452298<br>Famille Claudel - Antiquités<br>36 Boulevard du Général de Gaulle<br>59000 Lille<br>FR', '10012021-5ffb550d0c523', NULL, 0),
(64, 6, '2021-01-10 21:04:18', 'Colissimo', 990, 'André Claudel<br>0781452298<br>125 Avenue Jean Jaurès<br>59000 Lille<br>FR', '10012021-5ffb6bd2b01ab', NULL, 0),
(65, 6, '2021-01-10 22:10:55', 'UPS', 1290, 'André Claudel<br>0781452298<br>Famille Claudel - Antiquités<br>36 Boulevard du Général de Gaulle<br>59000 Lille<br>FR', '10012021-5ffb7b6fa7cc1', NULL, 0),
(66, 6, '2021-01-10 22:11:54', 'UPS', 1290, 'André Claudel<br>0781452298<br>Famille Claudel - Antiquités<br>36 Boulevard du Général de Gaulle<br>59000 Lille<br>FR', '10012021-5ffb7baa86e43', NULL, 0),
(67, 6, '2021-01-11 01:36:33', 'Colissimo', 990, 'André Claudel<br>0781452298<br>125 Avenue Jean Jaurès<br>59000 Lille<br>FR', '11012021-5ffbaba15fbfa', NULL, 0),
(68, 6, '2021-01-11 01:38:40', 'Colissimo', 990, 'André Claudel<br>0781452298<br>125 Avenue Jean Jaurès<br>59000 Lille<br>FR', '11012021-5ffbac20523c9', NULL, 0),
(69, 6, '2021-01-11 03:31:57', 'Colissimo', 990, 'André Claudel<br>0781452298<br>125 Avenue Jean Jaurès<br>59000 Lille<br>FR', '11012021-5ffbc6adb9d0f', NULL, 0),
(70, 6, '2021-01-11 03:32:50', 'Colissimo', 990, 'André Claudel<br>0781452298<br>125 Avenue Jean Jaurès<br>59000 Lille<br>FR', '11012021-5ffbc6e2588b3', NULL, 0),
(71, 6, '2021-01-11 03:33:28', 'Colissimo', 990, 'André Claudel<br>0781452298<br>Famille Claudel - Antiquités<br>36 Boulevard du Général de Gaulle<br>59000 Lille<br>FR', '11012021-5ffbc708ba4ae', NULL, 0),
(72, 6, '2021-01-11 03:35:13', 'Colissimo', 990, 'André Claudel<br>0781452298<br>Famille Claudel - Antiquités<br>36 Boulevard du Général de Gaulle<br>59000 Lille<br>FR', '11012021-5ffbc7714cbf6', NULL, 2),
(73, 6, '2021-01-11 09:02:05', 'Colissimo', 990, 'André Claudel<br>0781452298<br>Famille Claudel - Antiquités<br>36 Boulevard du Général de Gaulle<br>59000 Lille<br>FR', '11012021-5ffc140ddc6d1', NULL, 0),
(74, 6, '2021-01-11 23:44:29', 'Colissimo', 990, 'André Claudel<br>0781452298<br>125 Avenue Jean Jaurès<br>59000 Lille<br>FR', '11012021-5ffce2dd54163', NULL, 0),
(75, 6, '2021-01-12 01:22:18', 'Colissimo', 990, 'André Claudel<br>0781452298<br>Famille Claudel - Antiquités<br>36 Boulevard du Général de Gaulle<br>59000 Lille<br>FR', '12012021-5ffcf9ca2626f', NULL, 0),
(76, 10, '2021-01-12 02:58:13', 'Colissimo', 990, 'Xavier Dang<br>0606060606<br>15 Rue de Paris<br>75000 Paris<br>FR', '12012021-5ffd104537cb3', NULL, 0),
(77, 6, '2021-01-14 16:26:10', 'Colissimo', 990, 'André Claudel<br>0781452298<br>Famille Claudel - Antiquités<br>36 Boulevard du Général de Gaulle<br>59000 Lille<br>FR', '14012021-600070a22a460', NULL, 0),
(78, 6, '2021-01-14 22:56:37', 'Colissimo', 990, 'André Claudel<br>0781452298<br>Famille Claudel - Antiquités<br>36 Boulevard du Général de Gaulle<br>59000 Lille<br>FR', '14012021-6000cc2586748', NULL, 2),
(83, 6, '2021-01-15 01:10:54', 'Colissimo', 990, 'André Claudel<br>0781452298<br>Famille Claudel - Antiquités<br>36 Boulevard du Général de Gaulle<br>59000 Lille<br>FR', '15012021-6000eb9ea124c', NULL, 0),
(84, 6, '2021-01-15 01:11:52', 'Colissimo', 990, 'André Claudel<br>0781452298<br>Famille Claudel - Antiquités<br>36 Boulevard du Général de Gaulle<br>59000 Lille<br>FR', '15012021-6000ebd8e812c', NULL, 3),
(85, 7, '2021-01-15 01:24:54', 'Colissimo', 990, 'Michel Dupont<br>0698741523<br>8 Rue Albert Camus<br>44000 Nantes<br>FR', '15012021-6000eee67a48c', NULL, 0),
(86, 8, '2021-01-15 01:29:53', 'Colissimo', 990, 'Kathleen Dubarle<br>0606060606<br>Pyxia Nox<br>36 Chemin des Acacias<br>33700 Mérignac<br>FR', '15012021-6000f0113fcaf', NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `my_order_id` int NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_845CA2C1BFCDF877` (`my_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `product`, `price`, `total`) VALUES
(1, 1, 'Grammaire égyptienne ou Principes généraux de l\'écriture sacrée égyptienne', 400000, 0),
(2, 1, 'La Morale de la Science', 1590, 0),
(3, 2, 'Grammaire égyptienne ou Principes généraux de l\'écriture sacrée égyptienne', 400000, 0),
(4, 2, 'La Morale de la Science', 1590, 0),
(5, 3, 'Grammaire égyptienne ou Principes généraux de l\'écriture sacrée égyptienne', 400000, 0),
(6, 3, 'La Morale de la Science', 1590, 0),
(7, 4, 'La Morale de la Science', 1590, 0),
(8, 4, 'La Divine Comédie', 3000, 0),
(9, 5, 'La Morale de la Science', 1590, 0),
(10, 5, 'La Divine Comédie', 3000, 0),
(11, 6, 'La Morale de la Science', 1590, 0),
(12, 6, 'La Divine Comédie', 3000, 0),
(13, 7, 'La Morale de la Science', 1590, 0),
(14, 7, 'La Divine Comédie', 3000, 0),
(15, 8, 'La Morale de la Science', 1590, 0),
(16, 8, 'La Divine Comédie', 3000, 0),
(17, 9, 'La Morale de la Science', 1590, 0),
(18, 9, 'La Divine Comédie', 3000, 0),
(19, 10, 'La Morale de la Science', 1590, 0),
(20, 10, 'La Divine Comédie', 3000, 0),
(21, 11, 'La Morale de la Science', 1590, 0),
(22, 11, 'La Divine Comédie', 3000, 0),
(23, 11, 'Grammaire égyptienne ou Principes généraux de l\'écriture sacrée égyptienne', 400000, 0),
(24, 12, 'Grand dictionnaire de cuisine', 140000, 0),
(25, 12, 'Sainte Bible', 1500, 0),
(26, 13, 'Grand dictionnaire de cuisine', 140000, 0),
(27, 13, 'Sainte Bible', 1500, 0),
(28, 14, 'Les luttes de classes en France', 2050, 0),
(29, 15, 'Les luttes de classes en France', 2050, 0),
(30, 16, 'Les luttes de classes en France', 2050, 0),
(31, 17, 'Les luttes de classes en France', 2050, 0),
(32, 18, 'Les luttes de classes en France', 2050, 0),
(33, 19, 'Les luttes de classes en France', 2050, 0),
(34, 20, 'Les luttes de classes en France', 2050, 0),
(35, 21, 'Les luttes de classes en France', 2050, 0),
(36, 21, 'Grand dictionnaire de cuisine', 140000, 0),
(37, 22, 'Sainte Bible', 1500, 0),
(38, 22, 'La Divine Comédie', 3000, 0),
(39, 23, 'Sainte Bible', 1500, 0),
(40, 23, 'La Divine Comédie', 3000, 0),
(41, 24, 'Sainte Bible', 1500, 0),
(42, 24, 'La Divine Comédie', 3000, 0),
(43, 25, 'Sainte Bible', 1500, 0),
(44, 25, 'La Divine Comédie', 3000, 0),
(45, 26, 'Sainte Bible', 1500, 0),
(46, 26, 'La Divine Comédie', 3000, 0),
(47, 26, 'Grand dictionnaire de cuisine', 140000, 0),
(48, 27, 'Sainte Bible', 1500, 0),
(49, 27, 'La Divine Comédie', 3000, 0),
(50, 27, 'Grand dictionnaire de cuisine', 140000, 0),
(51, 28, 'Sainte Bible', 1500, 0),
(52, 28, 'La Divine Comédie', 3000, 0),
(53, 28, 'Grand dictionnaire de cuisine', 140000, 0),
(54, 29, 'Sainte Bible', 1500, 0),
(55, 29, 'La Divine Comédie', 3000, 0),
(56, 29, 'Grand dictionnaire de cuisine', 140000, 0),
(57, 30, 'Sainte Bible', 1500, 0),
(58, 30, 'La Divine Comédie', 3000, 0),
(59, 30, 'Grand dictionnaire de cuisine', 140000, 0),
(60, 31, 'Sainte Bible', 1500, 0),
(61, 31, 'La Divine Comédie', 3000, 0),
(62, 31, 'Grand dictionnaire de cuisine', 140000, 0),
(63, 32, 'Sainte Bible', 1500, 0),
(64, 32, 'La Divine Comédie', 3000, 0),
(65, 32, 'Grand dictionnaire de cuisine', 140000, 0),
(66, 33, 'Sainte Bible', 1500, 0),
(67, 33, 'La Divine Comédie', 3000, 0),
(68, 33, 'Grand dictionnaire de cuisine', 140000, 0),
(69, 34, 'Sainte Bible', 1500, 0),
(70, 34, 'La Divine Comédie', 3000, 0),
(71, 34, 'Grand dictionnaire de cuisine', 140000, 0),
(72, 35, 'Sainte Bible', 1500, 0),
(73, 35, 'La Divine Comédie', 3000, 0),
(74, 35, 'Grand dictionnaire de cuisine', 140000, 0),
(75, 36, 'Sainte Bible', 1500, 0),
(76, 36, 'La Divine Comédie', 3000, 0),
(77, 36, 'Grand dictionnaire de cuisine', 140000, 0),
(78, 37, 'Sainte Bible', 1500, 0),
(79, 37, 'La Divine Comédie', 3000, 0),
(80, 37, 'Grand dictionnaire de cuisine', 140000, 0),
(81, 38, 'Sainte Bible', 1500, 0),
(82, 38, 'La Divine Comédie', 3000, 0),
(83, 38, 'Grand dictionnaire de cuisine', 140000, 0),
(84, 39, 'Sainte Bible', 1500, 0),
(85, 39, 'La Divine Comédie', 3000, 0),
(86, 39, 'Grand dictionnaire de cuisine', 140000, 0),
(87, 40, 'Sainte Bible', 1500, 0),
(88, 40, 'La Divine Comédie', 3000, 0),
(89, 40, 'Grand dictionnaire de cuisine', 140000, 0),
(90, 41, 'Sainte Bible', 1500, 0),
(91, 41, 'La Divine Comédie', 3000, 0),
(92, 41, 'Grand dictionnaire de cuisine', 140000, 0),
(93, 42, 'Sainte Bible', 1500, 0),
(94, 42, 'La Divine Comédie', 3000, 0),
(95, 42, 'Grand dictionnaire de cuisine', 140000, 0),
(96, 43, 'Sainte Bible', 1500, 0),
(97, 43, 'La Divine Comédie', 3000, 0),
(98, 43, 'Grand dictionnaire de cuisine', 140000, 0),
(99, 44, 'Sainte Bible', 1500, 0),
(100, 44, 'La Divine Comédie', 3000, 0),
(101, 44, 'Grand dictionnaire de cuisine', 140000, 0),
(102, 45, 'Sainte Bible', 1500, 0),
(103, 45, 'La Divine Comédie', 3000, 0),
(104, 45, 'Grand dictionnaire de cuisine', 140000, 0),
(105, 46, 'Sainte Bible', 1500, 0),
(106, 46, 'La Divine Comédie', 3000, 0),
(107, 46, 'Grand dictionnaire de cuisine', 140000, 0),
(108, 47, 'Sainte Bible', 1500, 0),
(109, 47, 'La Divine Comédie', 3000, 0),
(110, 47, 'Grand dictionnaire de cuisine', 140000, 0),
(111, 48, 'Sainte Bible', 1500, 0),
(112, 48, 'La Divine Comédie', 3000, 0),
(113, 48, 'Grand dictionnaire de cuisine', 140000, 0),
(114, 49, 'Sainte Bible', 1500, 0),
(115, 49, 'La Divine Comédie', 3000, 0),
(116, 49, 'Grand dictionnaire de cuisine', 140000, 0),
(117, 50, 'Sainte Bible', 1500, 0),
(118, 50, 'La Divine Comédie', 3000, 0),
(119, 50, 'Grand dictionnaire de cuisine', 140000, 0),
(120, 51, 'Sainte Bible', 1500, 0),
(121, 51, 'La Divine Comédie', 3000, 0),
(122, 51, 'Grand dictionnaire de cuisine', 140000, 0),
(123, 52, 'Sainte Bible', 1500, 0),
(124, 52, 'La Divine Comédie', 3000, 0),
(125, 52, 'Grand dictionnaire de cuisine', 140000, 0),
(126, 53, 'Sainte Bible', 1500, 0),
(127, 53, 'La Divine Comédie', 3000, 0),
(128, 53, 'Grand dictionnaire de cuisine', 140000, 0),
(129, 54, 'Sainte Bible', 1500, 0),
(130, 54, 'La Divine Comédie', 3000, 0),
(131, 54, 'Grand dictionnaire de cuisine', 140000, 0),
(132, 55, 'Sainte Bible', 1500, 0),
(133, 55, 'La Divine Comédie', 3000, 0),
(134, 55, 'Grand dictionnaire de cuisine', 140000, 0),
(135, 55, 'La Morale de la Science', 1590, 0),
(136, 56, 'Sainte Bible', 1500, 0),
(137, 56, 'La Divine Comédie', 3000, 0),
(138, 57, 'Sainte Bible', 1500, 0),
(139, 57, 'La Divine Comédie', 3000, 0),
(140, 58, 'Sainte Bible', 1500, 0),
(141, 58, 'La Divine Comédie', 3000, 0),
(142, 59, 'Sainte Bible', 1500, 0),
(143, 59, 'La Divine Comédie', 3000, 0),
(144, 60, 'Sainte Bible', 1500, 0),
(145, 60, 'La Divine Comédie', 3000, 0),
(146, 61, 'Sainte Bible', 1500, 0),
(147, 61, 'La Divine Comédie', 3000, 0),
(148, 62, 'La Divine Comédie', 3000, 0),
(149, 63, 'Grammaire égyptienne ou Principes généraux de l\'écriture sacrée égyptienne', 400000, 0),
(150, 64, 'Grammaire égyptienne ou Principes généraux de l\'écriture sacrée égyptienne', 400000, 0),
(151, 64, 'Grand dictionnaire de cuisine', 140000, 0),
(152, 65, 'Grammaire égyptienne ou Principes généraux de l\'écriture sacrée égyptienne', 400000, 0),
(153, 65, 'Grand dictionnaire de cuisine', 140000, 0),
(154, 66, 'Grammaire égyptienne ou Principes généraux de l\'écriture sacrée égyptienne', 400000, 0),
(155, 66, 'Grand dictionnaire de cuisine', 140000, 0),
(156, 67, 'Grand dictionnaire de cuisine', 140000, 0),
(157, 68, 'Grand dictionnaire de cuisine', 140000, 0),
(158, 69, 'La Divine Comédie', 3000, 0),
(159, 70, 'La Divine Comédie', 3000, 0),
(160, 71, 'La Divine Comédie', 3000, 0),
(161, 72, 'La Divine Comédie', 3000, 0),
(162, 73, 'Grammaire égyptienne ou Principes généraux de l\'écriture sacrée égyptienne', 400000, 0),
(163, 73, 'Grand dictionnaire de cuisine', 140000, 0),
(164, 74, 'Les luttes de classes en France', 2050, 0),
(165, 75, 'Les luttes de classes en France', 2050, 0),
(166, 75, 'Grand dictionnaire de cuisine', 140000, 0),
(167, 76, 'Sainte Bible', 1500, 0),
(168, 77, 'Sainte Bible', 1500, 0),
(169, 77, 'Annales du Musée Guimet', 4000, 0),
(170, 78, 'La Divine Comédie', 3000, 0),
(171, 78, 'Annales du Musée Guimet', 4000, 0),
(172, 83, 'La Divine Comédie', 3000, NULL),
(173, 83, 'Annales du Musée Guimet', 4000, NULL),
(174, 84, 'La Divine Comédie', 3000, NULL),
(175, 84, 'Annales du Musée Guimet', 4000, NULL),
(176, 84, 'Grand dictionnaire de cuisine', 140000, NULL),
(177, 85, 'Grammaire égyptienne ou Principes généraux de l\'écriture sacrée égyptienne', 400000, NULL),
(178, 86, 'Grand dictionnaire de cuisine', 140000, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_date` int NOT NULL,
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_best` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `picture`, `subtitle`, `description`, `price`, `author`, `publication_date`, `editor`, `is_best`) VALUES
(1, 5, 'Grand dictionnaire de cuisine', 'grand-dictionnaire-de-cuisine', '0749364c9af2358e985e07cd0c3f138dd1924650.jpg', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lobortis interdum massa eu ultricies. Sed venenatis est imperdiet accumsan rutrum. Aenean egestas orci id ultricies blandit. Nulla non risus vitae sem laoreet sagittis a sit amet lacus. Pellentesque aliquam magna sem, vitae accumsan nunc consectetur id.', 140000, 'Alexandre Dumas', 1873, 'Alphonse Lemerre', 1),
(2, 4, 'La Divine Comédie', 'la-divine-comedie', '1501a13fc1860cc476d484b4fff53f28998604a6.jpg', NULL, 'Duis ac gravida sem. Aliquam vel felis in leo finibus commodo quis a tellus. Mauris at finibus mauris, eu sollicitudin diam. Sed nec dictum justo. Nam egestas venenatis lacus aliquam accumsan. Phasellus nunc quam, venenatis convallis massa quis, dapibus elementum tellus. Nulla luctus aliquam ipsum, in sodales sapien.', 3000, 'Dante Alighieri', 1912, 'Librairie académique Perrin', 0),
(3, 1, 'Grammaire égyptienne ou Principes généraux de l\'écriture sacrée égyptienne', 'grammaire-egyptienne-ou-principes-generaux-de-lecriture-sacree-egyptienne', '78642ca4db6338bc709936247216215cd68a86a6.jpg', NULL, 'Nam felis dui, scelerisque in maximus quis, accumsan id ipsum. Phasellus euismod vel dui quis vehicula. Nulla eget est in erat dapibus malesuada. Pellentesque augue eros, convallis ac finibus sed, pellentesque id purus. Sed fermentum quis sem ac sollicitudin. Praesent lectus lorem, laoreet id venenatis sed, sollicitudin fringilla nisl. Nullam suscipit vehicula ultrices.', 400000, 'Jean-François Champollion', 1841, 'Frères Firmin Didot', 1),
(4, 2, 'Les luttes de classes en France', 'les-luttes-de-classes-en-france', '90776daa527dd25ed48fad7a414dbe1de423951f.jpg', NULL, 'Proin vitae ultricies justo, eu volutpat dui. Proin scelerisque commodo enim vel molestie. Nullam in libero et metus sodales ullamcorper vel et eros. Sed consequat quis ligula ac consectetur. Proin mattis lorem augue, at mollis dolor laoreet ac. Vestibulum quis pulvinar arcu. Nullam sit amet pulvinar nulla, vel dignissim dolor. Duis ante elit, malesuada eget ultricies ac, pretium sit amet lacus.', 2050, 'Karl Marx', 1935, 'Editions Sociales Internationales', 0),
(5, 6, 'La Morale de la Science', 'la-morale-de-la-science', '23c77fa13e0b0f2f7592f6d3b7b1677423d2f427.jpg', NULL, 'Duis cursus vulputate dui vitae egestas. Nunc nec nisi aliquam, commodo nibh vitae, sollicitudin mi. Curabitur pellentesque et turpis sed auctor. In convallis felis ex, vitae convallis enim suscipit aliquet. In sollicitudin leo sit amet pellentesque porta. Nullam blandit euismod sem, ac posuere odio finibus id.', 1590, 'Albert Bayet', 1947, 'Editions Rationalistes', 0),
(6, 3, 'Sainte Bible', 'sainte-bible', '82d785b1bff95b8287a977febe60ada0f5825dcb.jpg', 'Volume I - Ancien Testament', 'Duis sit amet ligula finibus, tempus nisi eget, aliquam felis. Donec bibendum nisl justo, quis ultrices turpis luctus ac. Morbi eget lobortis sapien. Integer aliquet nibh eget lorem ultricies condimentum. Quisque ac euismod urna, sit amet aliquet ante. Nullam maximus libero ac ex convallis, et sagittis sem dapibus.', 1500, 'Abbés Glaire et Vigouroux', 1916, 'Abdré Blot', 0),
(7, 3, 'Sainte Bible - Reliure vélin', 'sainte-bible-reliure-velin', '299759c07b9d942015d9335b033923d73ed1438f.jpg', 'Ancien et Nouveau Testaments', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam urna dolor, pretium vitae posuere in, bibendum sit amet arcu. Nam aliquet lobortis dapibus. Etiam non erat et libero aliquam condimentum ut id velit. Donec a tellus id nisl dignissim ultrices a a orci. Morbi eget consectetur nisi. Aliquam nec enim mollis velit ornare suscipit.', 48000, 'Théologiens de l\'Université de Louvain', 1639, 'Pierre Ménard', 0),
(8, 1, 'Annales du Musée Guimet', 'annales-du-musee-guimet', '69dcecfa785972f90bd56e9d031eccb76c81da40.jpg', 'Tome 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 4000, 'Musée Guimet', 1880, 'Ernest Leroux', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password`
--

DROP TABLE IF EXISTS `reset_password`;
CREATE TABLE IF NOT EXISTS `reset_password` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B9983CE5A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reset_password`
--

INSERT INTO `reset_password` (`id`, `user_id`, `token`, `created_at`) VALUES
(1, 4, '5ffa46f38ec93', '2021-01-10 00:14:43'),
(2, 4, '5ffa4729cb034', '2021-01-10 00:15:37'),
(3, 4, '5ffa48c925045', '2021-01-10 00:22:33'),
(4, 4, '5ffa4e948830e', '2021-01-10 00:47:16'),
(5, 4, '5ffb54830b8c6', '2021-01-10 19:24:51'),
(6, 9, '5ffc05316b24a', '2021-01-11 07:58:41'),
(7, 4, '6000ee63a0a10', '2021-01-15 01:22:43');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(2, 'pouet1@pouet.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$bElqZmt6eXJEUTd4aVNWZg$qZzHmAme8t/2G5Sb1kOKpQ9jaOb2nKI0n9Uzs/L5cmM', 'pouet', 'pouetpouet'),
(4, 'kathleen.1d20@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$UjVhcy9yN2N4eEtoQS55Tg$wgM2qUfsSCRYYAqB2DvcIPqAJX05auN0cjYmr3/7wkA', 'Kathleen', 'Dubarle'),
(6, 'andre.claudel.bouquiniste@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$d0RZVDlHUTdwaGk4YkpNVA$P4fp1FjSgi4GPv0Fkoz0O0e4ZvwjNNw88Th5GE+ceSY', 'André', 'Claudel'),
(7, 'kathleen.dubarle@lapiscine.pro', '[]', '$argon2id$v=19$m=65536,t=4,p=1$c0hlRk1YSDlmM2lHMEtOTw$A1BuTr2fgnxOF01DUoHvlTt0sVmWPDZ4m927fYsyfFM', 'Michel', 'Dupont'),
(8, 'pyxianox.twitch@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$YVdBcnlEWG0weFVOTk5ESA$Y+FaOHrMTqHfw/VzFQ4fexnMT31YeemugZ1GsAgxGss', 'Pyxia', 'Nox'),
(9, 'a.van.h@live.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$NjBxVkdmdVRYVkZiMzd5bw$w6kjh8yqPSt325Y5YajELRgi+vbcBKbhBwrOTKrjjH8', 'Adam', 'Van Houten'),
(10, 'xavier.dang@yahoo.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$RUd5MEV0ZTFHRHlpaTRUWA$BZRKm+PEsZHkqWHcn3C+fxkk5z3yMWALPUw9dQD0514', 'Xavier', 'Dang');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adress`
--
ALTER TABLE `adress`
  ADD CONSTRAINT `FK_5CECC7BEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `reset_password`
--
ALTER TABLE `reset_password`
  ADD CONSTRAINT `FK_B9983CE5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
