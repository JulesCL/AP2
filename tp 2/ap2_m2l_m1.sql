-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 02 mai 2023 à 22:33
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ap2_m2l_m1`
--

-- --------------------------------------------------------

--
-- Structure de la table `creneau`
--

CREATE TABLE `creneau` (
  `id_creneau` int NOT NULL,
  `date` date DEFAULT NULL,
  `heure` int DEFAULT NULL,
  `id_sal` int DEFAULT NULL,
  `id_us` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `creneau`
--

INSERT INTO `creneau` (`id_creneau`, `date`, `heure`, `id_sal`, `id_us`) VALUES
(9, '2023-05-02', 8, 1, 1),
(10, '2023-05-02', 11, 3, 1),
(12, '2023-05-01', 9, 4, 1),
(13, '2023-04-29', 13, 4, 1),
(14, '2023-05-02', 10, 5, 1),
(15, '2023-05-02', 12, 7, 1);

--
-- Déclencheurs `creneau`
--
DELIMITER $$
CREATE TRIGGER `PURGE` AFTER DELETE ON `creneau` FOR EACH ROW BEGIN
    DELETE FROM creneau WHERE date < DATE_SUB(NOW(), INTERVAL 2 DAY);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `id_salle` int NOT NULL,
  `nom_salle` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id_salle`, `nom_salle`) VALUES
(1, 'salle de réunion 1'),
(2, 'salle de réunion 2'),
(3, 'salle de réunion 3'),
(4, 'salle de réunion 4'),
(5, 'salle de réunion 5'),
(6, 'salle de réunion 6'),
(7, 'salle de réunion 7'),
(8, 'salle de réunion 8'),
(9, 'amphithéâtre'),
(10, 'salle multimédia');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `login` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mdp` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `role` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `login`, `mdp`, `role`) VALUES
(1, 'user', 'user', 1),
(2, 'admin', 'admin', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `creneau`
--
ALTER TABLE `creneau`
  ADD PRIMARY KEY (`id_creneau`),
  ADD KEY `id_sal` (`id_sal`),
  ADD KEY `id_us` (`id_us`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id_salle`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `creneau`
--
ALTER TABLE `creneau`
  MODIFY `id_creneau` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `salle`
--
ALTER TABLE `salle`
  MODIFY `id_salle` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `creneau`
--
ALTER TABLE `creneau`
  ADD CONSTRAINT `creneau_ibfk_1` FOREIGN KEY (`id_sal`) REFERENCES `salle` (`id_salle`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `creneau_ibfk_2` FOREIGN KEY (`id_us`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
