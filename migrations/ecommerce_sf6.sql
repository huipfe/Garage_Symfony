-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 19 sep. 2023 à 08:26
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
('DoctrineMigrations\\Version20230822073728', '2023-08-22 07:38:53', 288),
('DoctrineMigrations\\Version20230912084458', '2023-09-12 08:47:42', 331);

-- --------------------------------------------------------

--
-- Structure de la table `horaires`
--

CREATE TABLE `horaires` (
  `id` int NOT NULL,
  `jour` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heure_debut` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heure_fin` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `horaires`
--

INSERT INTO `horaires` (`id`, `jour`, `heure_debut`, `heure_fin`) VALUES
(23, 'Lundi', '08h00-12h00', '14h00-18h00'),
(24, 'Mardi', '08h00-12h00', '14h00-18h00'),
(25, 'Mercredi', '08h00-12h00', '14h00-18h00'),
(26, 'Jeudi', '08h00-12h00', '14h00-18h00'),
(27, 'Vendredi', '08h00-12h00', '14h00-18h00'),
(28, 'Samedi', '08h00', '13h00'),
(29, 'Dimanche', 'Fermeture ', '-------');

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
(104, 25, 'c00eb0d25120ad325709e0705a4fc601.webp'),
(105, 25, 'f5ee2401f3625418deb7d4ebf41ce0fd.webp'),
(106, 25, 'ae5ba232bd79da8af44ff274dc955a8f.webp'),
(107, 26, 'e8e10ab865b528d49224406b6e68faca.webp'),
(108, 26, '7d8c81cd7bae00428351fe97899da05f.webp'),
(109, 26, '6364ca1f81f5008dcc9e822dedd39cbb.webp'),
(110, 25, '01345f9a6491d8960a433c2b778d099a.webp'),
(111, 29, '1ad44c6243d2ed3ce8ae51044595e948.webp'),
(112, 30, '516da7addbe747de19f3e944853a1058.webp');

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

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `coupons_id`, `users_id`, `reference`, `created_at`) VALUES
(1, NULL, 39, '64f9dcd0db6ab', '2023-09-07 14:23:12'),
(2, NULL, 39, '64f9de04ae590', '2023-09-07 14:28:20'),
(3, NULL, 39, '64f9defdc634c', '2023-09-07 14:32:29'),
(4, NULL, 22, '6501c10fbffb5', '2023-09-13 14:02:55');

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

--
-- Déchargement des données de la table `orders_details`
--

INSERT INTO `orders_details` (`orders_id`, `products_id`, `quantity`, `price`) VALUES
(1, 26, 2, 15000000),
(1, 29, 2, 5000),
(1, 30, 2, 8010),
(2, 26, 1, 15000000),
(2, 29, 1, 5000),
(3, 25, 1, 150000),
(3, 26, 1, 15000000),
(4, 30, 2, 8010);

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
(25, 125, 'Service de massage', 'Humm, les bons messages du chef, hummm', 150000, 1, '2023-08-29 14:32:03', 'Service-de-massage'),
(26, 121, 'Bolide de l\'espace lol.', 'Mdr', 15000000, 2, '2023-08-29 16:03:59', 'Bolide-de-l-espace-lol'),
(29, 123, 'Service Un du Un', 'Description au piff lol', 5000, 1, '2023-09-01 09:55:48', 'Service-Un-du-Un'),
(30, 124, 'Service au piff', 'fddfdf', 8010, 10, '2023-09-01 09:57:55', 'Service-au-piff');

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
(23, 'olivie90@orange.fr', '[\"ROLE_EMPLOYE\"]', '$2y$13$RS0Wn3GSf5em09KIYp6d3OvwGRSL2kXeto3hO3oVogT9Ul9puipEa', 'Duhamel', 'Claudine', '60, rue Boucher', '09872', 'Meunier-la-Forêt', '2023-08-14 14:04:50', 1, ''),
(24, 'jules38@sfr.fr', '[]', '$2y$13$O6zdQb8BTX9NjdtQWXQt3OE0j61kP43e1mAIyUByx3kWyBOTX286.', 'Besnard', 'Pauline', '756, boulevard Collin', '03091', 'Lebon', '2023-08-14 14:04:50', 0, ''),
(25, 'rodrigues.helene@berger.com', '[]', '$2y$13$97mrwT2No0UzypF0uQFTReTiIX189zCbYJYc00S8AU1flHpNwip36', 'Robert', 'Aimé', '68, chemin Denis', '28038', 'Blanchard-sur-Mer', '2023-08-14 14:04:51', 0, ''),
(26, 'capucine.hamel@vallee.fr', '[]', '$2y$13$N3FaAKnaCbdSJztjPn9UTelXz8oMBVguNKpPB4vFdX9vokCWmWBwe', 'Samson', 'Martine', '956, avenue Jérôme Lecomte', '43587', 'Guibert', '2023-08-14 14:04:51', 0, ''),
(27, 'dufour.sylvie@perret.com', '[]', '$2y$13$7Atbf9MOZcPBa0VbC3syj.CkZUVB6NReANTOlmWHTvi4DsIPnBFVC', 'Dupuy', 'Léon', '590, chemin de Masse', '74369', 'Neveu', '2023-08-14 14:04:52', 0, ''),
(38, 'ilan.tervil@wanadoo.fr', '[]', '$2y$13$PpBXrSjz4Tm5qRJG3D00SuQ5vEuguS7nVi.wii0cyEOYEQUmWf4We', 'Tervil', 'Ilan', '4 Rue Eugène Galbrun', '94130', 'Nogent-sur-Marne', '2023-08-21 08:07:13', 1, ''),
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
-- Index pour la table `horaires`
--
ALTER TABLE `horaires`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT pour la table `horaires`
--
ALTER TABLE `horaires`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
