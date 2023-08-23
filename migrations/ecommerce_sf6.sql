-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 23 août 2023 à 15:23
-- Version du serveur : 8.0.30
-- Version de PHP : 8.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce_sf6`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `category_order`) VALUES
(118, NULL, 'Voiture', 'voiture', 1),
(119, 118, 'Voitures d\'occasions', 'voitures-d-occasions', 2),
(120, 118, 'Voitures de course', 'voitures-de-course', 3),
(121, 118, 'Voitures Familiale', 'voitures-familiale', 4),
(122, NULL, 'Services', 'services', 5),
(123, 122, 'Service 1', 'service-1', 6),
(124, 122, 'Service 2', 'service-2', 7),
(125, 122, 'Service 3', 'service-3', 8);

-- --------------------------------------------------------

--
-- Structure de la table `coupons`
--

CREATE TABLE `coupons` (
  `id` int NOT NULL,
  `coupons_types_id` int NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int NOT NULL,
  `max_usage` int NOT NULL,
  `validity` datetime NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `coupons_types`
--

CREATE TABLE `coupons_types` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230731170158', '2023-07-31 17:16:57', 4950),
('DoctrineMigrations\\Version20230811104046', '2023-08-11 12:50:54', 444),
('DoctrineMigrations\\Version20230811151954', '2023-08-11 15:20:45', 331),
('DoctrineMigrations\\Version20230816135326', '2023-08-16 13:54:06', 233),
('DoctrineMigrations\\Version20230816135625', '2023-08-16 13:56:37', 210),
('DoctrineMigrations\\Version20230818081720', '2023-08-18 08:25:32', 1067),
('DoctrineMigrations\\Version20230822073728', '2023-08-22 07:38:53', 288);

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` int NOT NULL,
  `products_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `products_id`, `name`) VALUES
(1, 16, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\9c77519d96bf0f6c9a4f82ce45f1407e.png'),
(2, 15, ''),
(3, 16, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\58d66c1ff59b92a9d75571f9d1a7cecf.png'),
(4, 15, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\15fef9211421611e6716821777e5a9c0.png'),
(5, 14, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\ed95ff31f59fa00ecdbcaef88fce88df.png'),
(6, 13, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\37ff5bc8f597b543a391b8c43d1296c2.png'),
(7, 16, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\f9c0f4fb1b65b1e9773f7726fce6c334.png'),
(8, 15, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\146e70f5f126a3c798a115fea12c8f66.png'),
(9, 13, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\ed53ee0fe34a2b986af3776822172307.png'),
(10, 11, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\fc3760e15b67bb7350775a355f624e24.png'),
(11, 15, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\b9b1fa93960e552a34f84800a96469c2.png'),
(12, 15, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\a6ffc4ab521d53b61c76db7c9541f2ac.png'),
(13, 13, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\780034895e664712e4606f93f3ef6a30.png'),
(14, 19, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\55042be246abc75b43b930bbf5114f86.png'),
(15, 20, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\0fb91fe332acb27604947ae93e07dc16.png'),
(16, 17, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\398324aaafb9aad4c3d530769594de61.png'),
(17, 11, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\edf3796562c69bc9f78f6a77c4a7d317.png'),
(18, 12, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\c36b6fa415298a3109ed73b169842256.png'),
(19, 18, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\10479c35ea465e80a7f881df55d3a95b.png'),
(20, 17, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\64e30854ea0cbf771dec02497ee8d163.png'),
(21, 11, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\cea1206053e2b2bee5ee857ebc026f96.png'),
(22, 11, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\513afb9135f00d52af0228b3e45afc6a.png'),
(23, 15, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\8f40ed48105b2789b8f22056862e608e.png'),
(24, 18, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\70bab6713c0801f908e52e6003637bd3.png'),
(25, 18, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\825855326c6e308f53bef43e04b53bcd.png'),
(26, 18, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\72f00f93c21bf6f23540b84da0ccbcf4.png'),
(27, 18, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\c3a53958e8c990fd093913a59d423bae.png'),
(28, 16, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\f0608b2d0938527cd1fa4c9224166e86.png'),
(29, 18, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\37f93bcbe515a721bd6858000122ddc2.png'),
(30, 15, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\e9ff447b046add8a57ee8e874d33b401.png'),
(31, 15, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\a5cd098a0d2d2bc01a43e05caab1c020.png'),
(32, 16, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\88d1faf25ece35e0b9cf42de4f9f8a6d.png'),
(33, 20, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\11f81695f7fe5bf5e22c7bd2b317ffe1.png'),
(34, 13, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\d908ad272f7e243b66a666eec66ffe2b.png'),
(35, 19, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\69edd79592420ce2a7f64357cf02a92d.png'),
(36, 17, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\a259d0f332b3fc7fdcda0388a6ba0a7c.png'),
(37, 18, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\a19ffe34dda2563d27f61b128e56fd6e.png'),
(38, 15, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\031623683d6b4f410b288f4fcd2829da.png'),
(39, 19, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\3508071582e86270e4b6bf07708596d7.png'),
(40, 16, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\fef82a36883da9d149ee7c5db7b30ac8.png'),
(41, 13, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\bccd53e838d484721c201d5cbdf7018f.png'),
(42, 13, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\d0e2b0e69277f7e809bd0cf0cd1ac74d.png'),
(43, 14, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\f425364b1c72989071e20fdc254a814a.png'),
(44, 20, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\f2168139d5473845af4f0504e49db6bf.png'),
(45, 12, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\cfe6c95bb17a415d7740022edc89a65f.png'),
(46, 17, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\830b9c93aa7d5f5ec8aef6f95b8dc42a.png'),
(47, 15, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\257abf1aadf39058e529f1c184db32c9.png'),
(48, 18, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\e9f9a306ea0ca0f7a08ff2b95e9ba2ce.png'),
(49, 13, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\20289f3acab99ad91d4a1825b0f7647f.png'),
(50, 20, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\3ffb94deb55da52a5fc60d093eb5da63.png'),
(51, 14, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\9a238d081b7d3c037f483ee878756085.png'),
(52, 17, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\026da58032f2fbfb3c472d92ff8d6a63.png'),
(53, 12, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\654e5c4b15937182efdcee64cf8726b8.png'),
(54, 11, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\41445ebd2c7bd909f658ebcfff1862b8.png'),
(55, 19, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\0bcc3debdd45568568082dfbebc9f467.png'),
(56, 19, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\9ddcbaaa725f014c0db536c34bf8ef43.png'),
(57, 13, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\a562f392775fbcd218d5335e56f33d73.png'),
(58, 15, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\ad8f9dd2bc5437d9ddd1dcf92e356fbc.png'),
(59, 20, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\c5dcfef5a51f10673c14791a8dca1958.png'),
(60, 20, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\8d4dcf71c04c22d9e3844b9b5f93bf1b.png'),
(61, 18, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\9a3d9b4640737fcd32761bc286ede421.png'),
(62, 11, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\6dfc4ec1ef43cad0c7d9dc1876b4aaa2.png'),
(63, 20, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\81df24cf869cf0ac7bd346e60c10ec38.png'),
(64, 13, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\a814405ac31e16dd21eb80573391605e.png'),
(65, 20, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\64dccaa9851043dc840418d41e3fe168.png'),
(66, 17, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\8a22a03323c38768b258d6741e5c4ff5.png'),
(67, 18, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\f18be66977b6eb395b84d9bf76b50520.png'),
(68, 11, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\6029a27e9a21f632a786b4d2066ed671.png'),
(69, 14, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\b5a743636301648e60c2a1c96821ede0.png'),
(70, 14, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\972e19305e9d1a84260a95d1f723e186.png'),
(71, 19, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\10ce496285b8cf60aa4d90011dd27ddf.png'),
(72, 19, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\6f97ef25e386f0a098166c33537b42d1.png'),
(73, 19, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\3798901073b218bd1557bd83107f2a59.png'),
(74, 19, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\030f78f6934b0fd4dc8b3172dc26ed58.png'),
(75, 19, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\b559c3922241f8e92a69d4aa37f88618.png'),
(76, 17, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\94c9bef33629ddeaba26c24d623e5d90.png'),
(77, 13, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\d061dbf96ddaff8878e0cb55f21059ec.png'),
(78, 15, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\52db630fcaaeae8f3e57d7bf9f17233a.png'),
(79, 13, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\9492836599e737c0248f10825c6ff638.png'),
(80, 16, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\3ab56d1cac8842eb3c95757ef392b62c.png'),
(81, 18, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\08bccee5e0faa177eef6c099326a7abc.png'),
(82, 12, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\b09014143351ec6a2da7d9dbfc2e02df.png'),
(83, 11, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\9054841e9fed427583107b748c5651f1.png'),
(84, 19, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\20c4ab687b3180db314001924d6a8961.png'),
(85, 18, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\bf53fe8259e5e13cb89a2d835573a361.png'),
(86, 20, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\b02ff679c824324046ba2c446bb171ba.png'),
(87, 16, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\fdf882c69bf05ad68e5f7888eecccf7e.png'),
(88, 19, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\37f2a6dea34d27e2ced858c2eb5e6e8a.png'),
(89, 16, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\0e665988c6f2c9f1e17f8db27f615fd6.png'),
(90, 19, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\5c50b9e6fe725d304871f42b2f63838d.png'),
(91, 19, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\5ff1b49353ef8f57a10c79618482d6bf.png'),
(92, 14, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\7b1316c2495a0b6a8f75aef4ca87b30b.png'),
(93, 20, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\c1559ea06036b03a724f0f0dcf05b137.png'),
(94, 13, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\dc81bb0705521c7dfc384689ef0fc437.png'),
(95, 20, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\ffa6c32d3c9a4427584efb7d07da5ab1.png'),
(96, 12, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\0e6e1340e61a6cf92adfcb21d122c1f6.png'),
(97, 17, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\10d0ed4ab8a525ddfddff9e59c93347a.png'),
(98, 17, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\d44858830282fc548cf37e83e547e328.png'),
(99, 11, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\56636b9a39b98ccfe2af876a074cff6a.png'),
(100, 20, 'C:\\Users\\Ilan\\AppData\\Local\\Temp\\a1827b72cee421e570c511eb269b217a.png');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:25:\\\"emails/register.html.twig\\\";i:1;N;i:2;a:1:{s:4:\\\"user\\\";O:16:\\\"App\\\\Entity\\\\Users\\\":12:{s:20:\\\"\\0App\\\\Entity\\\\Users\\0id\\\";i:31;s:23:\\\"\\0App\\\\Entity\\\\Users\\0email\\\";s:21:\\\"test2.test@wanadoo.fr\\\";s:23:\\\"\\0App\\\\Entity\\\\Users\\0roles\\\";a:0:{}s:26:\\\"\\0App\\\\Entity\\\\Users\\0password\\\";s:60:\\\"$2y$13$38ahn0FLdV6NsVEv9RGcHerbEhVQZD25TkjNfIq2is//LLKj70./q\\\";s:26:\\\"\\0App\\\\Entity\\\\Users\\0lastname\\\";s:4:\\\"test\\\";s:27:\\\"\\0App\\\\Entity\\\\Users\\0firstname\\\";s:4:\\\"test\\\";s:25:\\\"\\0App\\\\Entity\\\\Users\\0address\\\";s:21:\\\"4 Rue Eugène Galbrun\\\";s:25:\\\"\\0App\\\\Entity\\\\Users\\0zipcode\\\";s:5:\\\"94130\\\";s:22:\\\"\\0App\\\\Entity\\\\Users\\0city\\\";s:16:\\\"Nogent-sur-Marne\\\";s:29:\\\"\\0App\\\\Entity\\\\Users\\0is_verified\\\";b:0;s:24:\\\"\\0App\\\\Entity\\\\Users\\0orders\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:1;}s:28:\\\"\\0App\\\\Entity\\\\Users\\0created_at\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2023-08-18 10:40:56.436811\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:20:\\\"no-reply@monsite.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:21:\\\"test2.test@wanadoo.fr\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:51:\\\"Activation de votre compte sur le site d\\\'E-Commerce\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2023-08-18 10:40:57', '2023-08-18 10:40:57', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `coupons_id` int DEFAULT NULL,
  `users_id` int NOT NULL,
  `reference` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `orders_details`
--

CREATE TABLE `orders_details` (
  `orders_id` int NOT NULL,
  `products_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `categories_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `stock` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `categories_id`, `name`, `description`, `price`, `stock`, `created_at`, `slug`) VALUES
(11, 124, 'Hic.', 'Autem dolorum veritatis consequatur neque. Omnis aliquam quos et. Labore adipisci et dicta.', 62693, 7, '2023-08-14 14:04:49', 'hic'),
(12, 118, 'Vel.', 'Qui nesciunt voluptatem tempora esse odit autem. Placeat sit nesciunt deleniti laboriosam id. Earum expedita consequuntur quidem eius et. Incidunt quidem sed magnam rerum.', 105726, 1, '2023-08-14 14:04:49', 'vel'),
(13, 122, 'Nemo.', 'Exercitationem magnam reiciendis provident impedit. Harum aut dicta incidunt quis. Quam dolorum cumque sunt consequatur voluptas temporibus explicabo aut.', 68564, 6, '2023-08-14 14:04:49', 'nemo'),
(14, 119, 'Enim.', 'Explicabo labore corrupti neque atque. Commodi possimus minima aut laudantium dolorem veritatis. Totam recusandae nesciunt sunt fugit.', 136194, 5, '2023-08-14 14:04:49', 'enim'),
(15, 121, 'Qui.', 'Vitae quis debitis reiciendis rerum eum. Quis temporibus odit ad aut dolor sed excepturi. Ea excepturi et ut autem eum sequi quasi facilis.', 20058, 2, '2023-08-14 14:04:49', 'qui'),
(16, 120, 'Aut.', 'Dolorum autem nihil omnis eaque recusandae delectus. Earum inventore qui placeat.', 146010, 6, '2023-08-14 14:04:49', 'aut'),
(17, 123, 'Ut.', 'Laborum non cum explicabo labore quos voluptatem. Sequi eos enim officiis. Sunt tempora rerum quod sint velit.', 93797, 3, '2023-08-14 14:04:49', 'ut'),
(18, 122, 'Non.', 'Necessitatibus aut voluptatem atque dolore est. Ipsa officiis necessitatibus deleniti rerum beatae. Et omnis provident porro odit sed similique velit.', 29431, 9, '2023-08-14 14:04:49', 'non'),
(19, 124, 'Et.', 'Eum corrupti ex tempore qui. Assumenda omnis sit natus qui. Voluptas harum sunt esse non dolores quasi.', 117630, 6, '2023-08-14 14:04:49', 'et'),
(20, 121, 'Et.', 'Eveniet sapiente deserunt nam dolorem repudiandae. Voluptate hic consequuntur itaque rem maiores. Odit voluptates quod alias.', 38560, 8, '2023-08-14 14:04:49', 'et');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `is_verified` tinyint(1) NOT NULL,
  `reset_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `roles`, `password`, `lastname`, `firstname`, `address`, `zipcode`, `city`, `created_at`, `is_verified`, `reset_token`) VALUES
(22, 'admin@example.com', '[\"ROLE_ADMIN\"]', '$2y$13$l6M26E4rHoj0u1R.L2O34usPsOeoLV/ztGVYtZZ6vnnsg.DZF8lt6', 'Tervil', 'Ilan', '4 rue Eugène Galbrun', '94130', 'Nogent sur Marne', '2023-08-14 14:04:49', 1, '1_72Lah3eg9G3RZsP81UO4ISYd64T57DUTLsPrQYmww'),
(23, 'olivie90@orange.fr', '[]', '$2y$13$RS0Wn3GSf5em09KIYp6d3OvwGRSL2kXeto3hO3oVogT9Ul9puipEa', 'Duhamel', 'Claudine', '60, rue Boucher', '09872', 'Meunier-la-Forêt', '2023-08-14 14:04:50', 0, ''),
(24, 'jules38@sfr.fr', '[]', '$2y$13$O6zdQb8BTX9NjdtQWXQt3OE0j61kP43e1mAIyUByx3kWyBOTX286.', 'Besnard', 'Pauline', '756, boulevard Collin', '03091', 'Lebon', '2023-08-14 14:04:50', 0, ''),
(25, 'rodrigues.helene@berger.com', '[]', '$2y$13$97mrwT2No0UzypF0uQFTReTiIX189zCbYJYc00S8AU1flHpNwip36', 'Robert', 'Aimé', '68, chemin Denis', '28038', 'Blanchard-sur-Mer', '2023-08-14 14:04:51', 0, ''),
(26, 'capucine.hamel@vallee.fr', '[]', '$2y$13$N3FaAKnaCbdSJztjPn9UTelXz8oMBVguNKpPB4vFdX9vokCWmWBwe', 'Samson', 'Martine', '956, avenue Jérôme Lecomte', '43587', 'Guibert', '2023-08-14 14:04:51', 0, ''),
(27, 'dufour.sylvie@perret.com', '[]', '$2y$13$7Atbf9MOZcPBa0VbC3syj.CkZUVB6NReANTOlmWHTvi4DsIPnBFVC', 'Dupuy', 'Léon', '590, chemin de Masse', '74369', 'Neveu', '2023-08-14 14:04:52', 0, ''),
(38, 'ilan.tervil@wanadoo.fr', '[]', '$2y$13$PpBXrSjz4Tm5qRJG3D00SuQ5vEuguS7nVi.wii0cyEOYEQUmWf4We', 'Tervil', 'Ilan', '4 Rue Eugène Galbrun', '94130', 'Nogent-sur-Marne', '2023-08-21 08:07:13', 0, ''),
(39, 'test.tervil@wanadoo.fr', '[]', '$2y$13$2BroQgisbVyok68FNdBsq.Nxt2DJa9XxSK5G6LabcxtZ60Hk9ouNS', 'Tervilux', 'Ilanux', '4 Rue Eugène Galbrun', '94130', 'Nogent-sur-Marne', '2023-08-21 12:53:07', 1, '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3AF34668727ACA70` (`parent_id`);

--
-- Index pour la table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_F564111877153098` (`code`),
  ADD KEY `IDX_F56411183DDD47B7` (`coupons_types_id`);

--
-- Index pour la table `coupons_types`
--
ALTER TABLE `coupons_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E01FBE6A6C8A81A9` (`products_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_E52FFDEEAEA34913` (`reference`),
  ADD KEY `IDX_E52FFDEE6D72B15C` (`coupons_id`),
  ADD KEY `IDX_E52FFDEE67B3B43D` (`users_id`);

--
-- Index pour la table `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`orders_id`,`products_id`),
  ADD KEY `IDX_835379F1CFFE9AD6` (`orders_id`),
  ADD KEY `IDX_835379F16C8A81A9` (`products_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B3BA5A5AA21214B7` (`categories_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT pour la table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `coupons_types`
--
ALTER TABLE `coupons_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK_3AF34668727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `FK_F56411183DDD47B7` FOREIGN KEY (`coupons_types_id`) REFERENCES `coupons_types` (`id`);

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `FK_E01FBE6A6C8A81A9` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEE67B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_E52FFDEE6D72B15C` FOREIGN KEY (`coupons_id`) REFERENCES `coupons` (`id`);

--
-- Contraintes pour la table `orders_details`
--
ALTER TABLE `orders_details`
  ADD CONSTRAINT `FK_835379F16C8A81A9` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_835379F1CFFE9AD6` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_B3BA5A5AA21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
