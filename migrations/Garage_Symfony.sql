-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 27 juil. 2023 à 09:37
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
-- Base de données : `Garage_Symfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `horaires`
--

CREATE TABLE `horaires` (
  `jour` varchar(20) NOT NULL,
  `heure_debut` varchar(50) NOT NULL,
  `heure_fin` varchar(50) NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tables des horaires';

--
-- Déchargement des données de la table `horaires`
--

INSERT INTO `horaires` (`jour`, `heure_debut`, `heure_fin`, `id`) VALUES
('Lundi', '08h00-12h00', '14h00-18h00', 23),
('Mardi', '08h00-12h00', '14h00-18h00', 24),
('Mercredi', '08h00-12h00', '14h00-18h00', 25),
('Jeudi', '08h00-12h00', '14h00-18h00', 26),
('Vendredi', '08h00-12h00', '14h00-18h00', 27),
('Samedi', '08h00', '13h00', 28),
('Dimanche', 'Fermeture ', '-', 29);

-- --------------------------------------------------------

--
-- Structure de la table `img`
--

CREATE TABLE `img` (
  `image` varchar(255) NOT NULL,
  `id_image` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tables des images';

-- --------------------------------------------------------

--
-- Structure de la table `information_garage_parrot`
--

CREATE TABLE `information_garage_parrot` (
  `adress` varchar(50) NOT NULL,
  `num` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table information du site';

-- --------------------------------------------------------

--
-- Structure de la table `page_d_accueil`
--

CREATE TABLE `page_d_accueil` (
  `Temoignage` varchar(50) NOT NULL,
  `id_image` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contenu de la page d''Accueil';

--
-- Déchargement des données de la table `page_d_accueil`
--

INSERT INTO `page_d_accueil` (`Temoignage`, `id_image`) VALUES
('Nouveaux Temoignage 00', 0),
('Nouveaux Temoignage 01', 1),
('Nouveaux Temoignage 03', 3),
('Nouveaux Temoignage 02', 2);

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id` int NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `temps_estime` int NOT NULL,
  `image` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(1, 'Service 1', 'Description du service 1', 50.00, 60);
INSERT INTO `service` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(9, 'Service 5', 'Description du service 5\r\n', 100.00, 100);
INSERT INTO `service` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(10, 'Service 6', 'Description du service 6', 100.00, 100);
INSERT INTO `service` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(13, 'Service 7', 'Description du service 7', 100.00, 100);
INSERT INTO `service` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(14, 'Service 8', 'Description du service 8\r\n', 100.00, 150);
INSERT INTO `service` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(15, 'Service 9', 'Description du service 9', 100.00, 100);

-- --------------------------------------------------------

--
-- Structure de la table `témoignages`
--

CREATE TABLE `témoignages` (
  `id` int NOT NULL,
  `contenu` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `nom` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tables des commentaires/témoignages';

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) NOT NULL,
  `name_users` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if user is admin, 0 otherwise'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table Utilisateur (Pour admin et employé)';

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `password`, `email`, `name_users`, `is_admin`) VALUES
(5, '$argon2i$v=19$m=65536,t=4,p=1$eS95UTVNYUlPMGJTRUhuSg$iHvPKiKZdjS34CGBNOyhQ9LXW2VW2rGhVgR2p3TndKI', 'VincentParrot@gmail.com', 'Vincent Parrot', 1),
(6, '$argon2i$v=19$m=65536,t=4,p=1$SElJeW1ZMlFhMUEvWng0Ug$9tDyOwG9oQy/3ex7yoZ2Q/CVvPMESnEYCgSzeY2Cp7I', 'Employer1@gmail.com', 'Bincent Narrot', 0),
(8, '$argon2i$v=19$m=65536,t=4,p=1$c1EySHF1ek51YzhEVEdQNw$wD4eYdKIl1s0dHAJQE6FoOGpSgZ2KERcUfGb/ZCIdIQ', 'Test1@protonmail.com', 'Vincent Barrot', 0);

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

CREATE TABLE `voiture` (
  `id` int NOT NULL,
  `image` longblob,
  `prix` float NOT NULL,
  `annee` int NOT NULL,
  `kilometrage` int NOT NULL,
  `marque` varchar(50) NOT NULL,
  `modele` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) NOT NULL,
  `users_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table de voiture, liée au catalogue';

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`id`, `image`, `prix`, `annee`, `kilometrage`, `marque`, `modele`, `description`, `users_id`) VALUES
(19, 50000, 2022, 5000, 'Ford de tes morts', 'Mustang', 'Ford Mustang GT, une voiture de sport emblématique avec un design élégant et des performances puissantes.', 5);
INSERT INTO `voiture` (`id`, `image`, `prix`, `annee`, `kilometrage`, `marque`, `modele`, `description`, `users_id`) VALUES
(20, 150000, 2023, 2000, 'Audi de ta vie', 'R8 V10', 'Audi R8 V10, une supercar de luxe avec un moteur V10 et une tenue de route exceptionnelle.', 5);
INSERT INTO `voiture` (`id`, `image`, `prix`, `annee`, `kilometrage`, `marque`, `modele`, `description`, `users_id`) VALUES
(21, 45000, 2022, 3000, 'BMWord', 'Série 5', 'La BMW Série 5 est une berline de luxe offrant un mélange parfait de confort, de performances et de technologies avancées.', 5);
INSERT INTO `voiture` (`id`, `image`, `prix`, `annee`, `kilometrage`, `marque`, `modele`, `description`, `users_id`) VALUES
(22, , 370000, 2018, 1000, 'Lamborghini', 'Aventador SVJ', 'Lamborghini Aventador SVJ, une voiture de course légendaire avec un design agressif et des performances extrêmes.', 5);
INSERT INTO `voiture` (`id`, `image`, `prix`, `annee`, `kilometrage`, `marque`, `modele`, `description`, `users_id`) VALUES
(23, 100000000, 2025, 0, 'Camionnette du futur', 'qui déchire sa raceuux', 'Ma belle petite camionnette du furtur, qui déchire sa race.', 5);
INSERT INTO `voiture` (`id`, `image`, `prix`, `annee`, `kilometrage`, `marque`, `modele`, `description`, `users_id`) VALUES
(24, 10, 2025, 10, 'Une voiture mystérieuse', 'qui fait pleins de mystère, hein hein.', 'Une mystérieuse voiturette, pleine de rebondissement, et d\'ombre sombre, et ténébreuse, qui roule la nuit. ', 5);
INSERT INTO `voiture` (`id`, `image`, `prix`, `annee`, `kilometrage`, `marque`, `modele`, `description`, `users_id`) VALUES
(25, 100, 2000, 15000, 'Voiture d\'arthurrreuxix', 'Arthur, pas cuillère pour fromage !', 'Arthooouurr, arthooourrr !! Toi, pas cuillère pour fromage !!!!\r\n\r\n', 6);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `horaires`
--
ALTER TABLE `horaires`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`id_image`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `témoignages`
--
ALTER TABLE `témoignages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `horaires`
--
ALTER TABLE `horaires`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `img`
--
ALTER TABLE `img`
  MODIFY `id_image` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `témoignages`
--
ALTER TABLE `témoignages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `voiture`
--
ALTER TABLE `voiture`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD CONSTRAINT `fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
