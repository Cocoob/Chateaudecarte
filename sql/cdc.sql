-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mar. 30 mars 2021 à 09:25
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données : `Formulaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `Connexion`
--

CREATE TABLE `Connexion` (
  `Id` int(11) NOT NULL,
  `Pseudo` varchar(30) NOT NULL,
  `Nom` varchar(30) NOT NULL,
  `Mdp` text NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Token` varchar(64) NOT NULL,
  `date_inscription` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Connexion`
--

INSERT INTO `Connexion` (`Id`, `Pseudo`, `Nom`, `Mdp`, `Email`, `Token`, `date_inscription`) VALUES
(1, 'coco', 'coco', '$2y$12$mAZwnAbU/eCW6mc5tOL.Q.8p0kV1i8FwFigUUljiHEGgWllavv2w.', 'coco@test.fr', '', '2021-03-01 14:56:38'),
(2, 'test', 'test', '$2y$12$SrvOghKhgjDbV9ObJ7FIcOqNwTZRjEGIE3aSSA8igyUtdNnZXH0qS', 'test@test.fr', '', '2021-03-01 15:59:03'),
(3, 'coco', 'coco', '$2y$12$qMXcHx5p069f9oPggSVQGeFrO4GeSOWIy8RMrFq52CPy7PvK76UKK', 'coco@coco.fr', '', '2021-03-01 16:10:31'),
(4, 'test', 'test', 'test', 'test@coco.fr', '', '2021-03-02 14:24:57'),
(5, 'Cocob', 'Corentin', '$2y$12$Wxui3NLZdcNNpLFwM6amxe9OkqIPs..ui6a4igRbIziSEUN4gFRW6', 'test@ttt.fr', 'da8fc80be556126e60dbf496991ec8977c9c72d230a0c6ab', '2021-03-04 11:29:49');

-- --------------------------------------------------------

--
-- Structure de la table `Mdp_oublie`
--

CREATE TABLE `Mdp_oublie` (
  `Id` int(11) NOT NULL,
  `Token_user` varchar(64) NOT NULL,
  `Token` varchar(64) NOT NULL,
  `Date_recover` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Connexion`
--
ALTER TABLE `Connexion`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Mdp_oublie`
--
ALTER TABLE `Mdp_oublie`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Connexion`
--
ALTER TABLE `Connexion`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `Mdp_oublie`
--
ALTER TABLE `Mdp_oublie`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;