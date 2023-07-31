SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Base de données : `Garage_Symfony`

-- --------------------------------------------------------

-- Structure de la table `hours`

CREATE TABLE `hours` (
  `jour` varchar(20) NOT NULL,
  `heure_debut` varchar(50) NOT NULL,
  `heure_fin` varchar(50) NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tables des hours';

-- Déchargement des données de la table `hours`

INSERT INTO `hours` (`jour`, `heure_debut`, `heure_fin`, `id`) VALUES
('Lundi', '08h00-12h00', '14h00-18h00', 23),
('Mardi', '08h00-12h00', '14h00-18h00', 24),
('Mercredi', '08h00-12h00', '14h00-18h00', 25),
('Jeudi', '08h00-12h00', '14h00-18h00', 26),
('Vendredi', '08h00-12h00', '14h00-18h00', 27),
('Samedi', '08h00', '13h00', 28),
('Dimanche', 'Fermeture ', '-------', 29);

-- --------------------------------------------------------

-- Structure de la table `image`

CREATE TABLE `image` (
  `image` varchar(255) NOT NULL,
  `id_image` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tables des images';

-- --------------------------------------------------------

-- Structure de la table `information_garage_parrot`

CREATE TABLE `informations` (
  `adress` varchar(50) NOT NULL,
  `num` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table information du site';

-- --------------------------------------------------------

-- Structure de la table `page_d_accueil`

CREATE TABLE `homepage` (
  `commentary` varchar(50) NOT NULL,
  `id_image` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contenu de la page d''Accueil';

-- Déchargement des données de la table `homepage`

INSERT INTO `homepage` (`commentary`, `id_image`) VALUES
('Nouveaux commentary 00', 0),
('Nouveaux commentary 01', 1),
('Nouveaux commentary 03', 3),
('Nouveaux commentary 02', 2);

-- --------------------------------------------------------

-- Structure de la table `services` --

CREATE TABLE `services` (
  `id` int NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `temps_estime` int NOT NULL,
  `image` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Déchargement des données de la table `services` --

INSERT INTO `services` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(1, 'Service 1', 'Description du service 1', 50.00, 60, '');
INSERT INTO `services` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(2, 'Service 2', 'Description du service 2', 80.00, 90, '');
INSERT INTO `services` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(3, 'Service 3', 'Description du service 3', 100.00, 120, '');
INSERT INTO `services` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(4, 'Service 4', 'Description du service 4', 100.00, 100, '');
INSERT INTO `services` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(9, 'Service 5', 'Description du service 5\r\n', 100.00, 100, '');
INSERT INTO `services` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(10, 'Service 6', 'Description du service 6', 100.00, 100, '');
INSERT INTO `services` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(13, 'Service 7', 'Description du service 7', 100.00, 100, '');
INSERT INTO `services` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(14, 'Service 8', 'Description du service 8\r\n', 100.00, 150, '');
INSERT INTO `services` (`id`, `nom`, `description`, `prix`, `temps_estime`, `image`) VALUES
(15, 'Service 9', 'Description du service 9', 100.00, 100, '');

-- --------------------------------------------------------

--
-- Structure de la table `commentary`
--

CREATE TABLE `commentary` (
  `id` int NOT NULL,
  `contenu` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `nom` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tables des commentaires/commentary';

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
-- Structure de la table `cars`
--

CREATE TABLE `cars` (
  `id` int NOT NULL,
  `image` longblob,
  `prix` float NOT NULL,
  `annee` int NOT NULL,
  `kilometrage` int NOT NULL,
  `marque` varchar(50) NOT NULL,
  `modele` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) NOT NULL,
  `users_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table de cars, liée au catalogue';

--
-- Déchargement des données de la table `cars`
--

INSERT INTO `cars` (`id`, `image`, `prix`, `annee`, `kilometrage`, `marque`, `modele`, `description`, `users_id`) VALUES
(19, '', 50000, 2022, 5000, 'Ford de tes morts', 'Mustang', 'Ford Mustang GT, une voiture de sport emblématique avec un design élégant et des performances puissantes.', 5);
INSERT INTO `cars` (`id`, `image`, `prix`, `annee`, `kilometrage`, `marque`, `modele`, `description`, `users_id`) VALUES
(20, '', 150000, 2023, 2000, 'Audi de ta vie', 'R8 V10', 'Audi R8 V10, une supercar de luxe avec un moteur V10 et une tenue de route exceptionnelle.', 5);
INSERT INTO `cars` (`id`, `image`, `prix`, `annee`, `kilometrage`, `marque`, `modele`, `description`, `users_id`) VALUES
(21, '', 45000, 2022, 3000, 'BMWord', 'Série 5', 'La BMW Série 5 est une berline de luxe offrant un mélange parfait de confort, de performances et de technologies avancées.', 5);
INSERT INTO `cars` (`id`, `image`, `prix`, `annee`, `kilometrage`, `marque`, `modele`, `description`, `users_id`) VALUES
(22, '', 370000, 2018, 1000, 'Lamborghini', 'Aventador SVJ', 'Lamborghini Aventador SVJ, une voiture de course légendaire avec un design agressif et des performances extrêmes.', 5);
INSERT INTO `cars` (`id`, `image`, `prix`, `annee`, `kilometrage`, `marque`, `modele`, `description`, `users_id`) VALUES
(23, '', 100000000, 2025, 0, 'Camionnette du futur', 'qui déchire sa raceuux', 'Ma belle petite camionnette du furtur, qui déchire sa race.', 5);
INSERT INTO `cars` (`id`, `image`, `prix`, `annee`, `kilometrage`, `marque`, `modele`, `description`, `users_id`) VALUES
(24, '', 10, 2025, 10, 'Une voiture mystérieuse', 'qui fait pleins de mystère, hein hein.', 'Une mystérieuse voiturette, pleine de rebondissement, et d\'ombre sombre, et ténébreuse, qui roule la nuit. ', 5);
INSERT INTO `cars` (`id`, `image`, `prix`, `annee`, `kilometrage`, `marque`, `modele`, `description`, `users_id`) VALUES
(25, '', 100, 2000, 15000, 'Voiture d\'arthurrreux', 'Arthur, pas cuillère pour fromage !', 'Arthooouurr, arthooourrr !! Toi, pas cuillère pour fromage !!\r\n\r\n', 6);

-- Index pour les tables déchargées

-- Index pour la table `hours`
ALTER TABLE `hours`
  ADD PRIMARY KEY (`id`);

-- Index pour la table `image`
ALTER TABLE `image`
  ADD PRIMARY KEY (`id_image`);

-- Index pour la table `services`
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

-- Index pour la table `commentary`
ALTER TABLE `commentary`
  ADD PRIMARY KEY (`id`);

-- Index pour la table `users`
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_id` (`user_id`);

-- Index pour la table `cars`
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `id` (`id`);

-- AUTO_INCREMENT pour les tables déchargées

-- AUTO_INCREMENT pour la table `hours`

ALTER TABLE `hours`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;


-- AUTO_INCREMENT pour la table `image`

ALTER TABLE `image`
  MODIFY `id_image` int NOT NULL AUTO_INCREMENT;


-- AUTO_INCREMENT pour la table `services`

ALTER TABLE `services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;


-- AUTO_INCREMENT pour la table `commentary`

ALTER TABLE `commentary`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;


-- AUTO_INCREMENT pour la table `users`

ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;


-- AUTO_INCREMENT pour la table `cars`

ALTER TABLE `cars`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;


-- Contraintes pour les tables déchargées


-- Contraintes pour la table `cars`

ALTER TABLE `cars`
  ADD CONSTRAINT `fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`user_id`);
COMMIT;
