-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 11 Décembre 2015 à 14:48
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `projetapp`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonces`
--

CREATE TABLE IF NOT EXISTS `annonces` (
  `annonces_id` int(11) NOT NULL AUTO_INCREMENT,
  `annonces_user` int(11) NOT NULL,
  `annonces_categorie` int(11) NOT NULL,
  `annonces_titre` varchar(50) NOT NULL,
  `annonces_description` varchar(255) NOT NULL,
  `annonces_prix` int(11) NOT NULL,
  `annonces_fichiers` varchar(20) NOT NULL,
  `annonces_departement` int(11) NOT NULL,
  `annonces_dateCreation` varchar(20) NOT NULL,
  `annonces_dateModif` varchar(20) NOT NULL,
  `annonces_statut` int(11) NOT NULL,
  PRIMARY KEY (`annonces_id`),
  KEY `annonces_user` (`annonces_user`,`annonces_categorie`,`annonces_departement`,`annonces_statut`),
  KEY `annonces_categorie` (`annonces_categorie`),
  KEY `annonces_titre` (`annonces_titre`),
  KEY `annonces_departement` (`annonces_departement`),
  KEY `annonces_statut` (`annonces_statut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_nom` varchar(50) NOT NULL,
  PRIMARY KEY (`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

CREATE TABLE IF NOT EXISTS `departements` (
  `departements_id` int(11) NOT NULL AUTO_INCREMENT,
  `departements_idRegion` int(11) NOT NULL,
  `departements_nom` varchar(50) NOT NULL,
  PRIMARY KEY (`departements_id`),
  KEY `departements_idRegion` (`departements_idRegion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `fichiers`
--

CREATE TABLE IF NOT EXISTS `fichiers` (
  `fichiers_id` int(11) NOT NULL AUTO_INCREMENT,
  `fichiers_url` varchar(255) NOT NULL,
  `fichiers_user` int(11) NOT NULL,
  PRIMARY KEY (`fichiers_id`),
  KEY `fichiers_user` (`fichiers_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `notations`
--

CREATE TABLE IF NOT EXISTS `notations` (
  `notations_id` int(11) NOT NULL AUTO_INCREMENT,
  `notations_userDonneNote` int(11) NOT NULL,
  `notations_userRecoisNote` int(11) NOT NULL,
  `notations_nbEtoile` varchar(1) NOT NULL,
  `notations_commentaires` varchar(100) NOT NULL,
  PRIMARY KEY (`notations_id`),
  KEY `notations_userDonneNote` (`notations_userDonneNote`,`notations_userRecoisNote`),
  KEY `notations_userRecoisNote` (`notations_userRecoisNote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE IF NOT EXISTS `pays` (
  `pays_id` int(11) NOT NULL AUTO_INCREMENT,
  `pays_nom` varchar(50) NOT NULL,
  PRIMARY KEY (`pays_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `regions`
--

CREATE TABLE IF NOT EXISTS `regions` (
  `regions_id` int(11) NOT NULL AUTO_INCREMENT,
  `regions_idPays` int(11) NOT NULL,
  `regions_nom` varchar(50) NOT NULL,
  PRIMARY KEY (`regions_id`),
  KEY `regions_idPays` (`regions_idPays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `souscategories`
--

CREATE TABLE IF NOT EXISTS `souscategories` (
  `sousCategories_id` int(11) NOT NULL AUTO_INCREMENT,
  `sousCategories_idCategorie` int(11) NOT NULL,
  `sousCategories_nom` varchar(50) NOT NULL,
  PRIMARY KEY (`sousCategories_id`),
  KEY `sousCategories_idCategorie` (`sousCategories_idCategorie`),
  KEY `sousCategories_idCategorie_2` (`sousCategories_idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `statuts`
--

CREATE TABLE IF NOT EXISTS `statuts` (
  `statut_id` int(11) NOT NULL AUTO_INCREMENT,
  `statut_nom` int(11) NOT NULL,
  PRIMARY KEY (`statut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `users_id` int(11) NOT NULL AUTO_INCREMENT,
  `users_login` varchar(50) NOT NULL,
  `users_password` varchar(50) NOT NULL,
  `users_nom` varchar(50) NOT NULL,
  `users_prenom` varchar(50) NOT NULL,
  `users_adresse` varchar(50) NOT NULL,
  `users_cp` varchar(10) NOT NULL,
  `users_ville` varchar(50) NOT NULL,
  `users_idDepartement` int(11) NOT NULL,
  `users_dateCreation` date NOT NULL,
  `users_dateNaissance` date NOT NULL,
  `users_email` varchar(50) NOT NULL,
  PRIMARY KEY (`users_id`),
  KEY `users_idDepartement` (`users_idDepartement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `annonces`
--
ALTER TABLE `annonces`
  ADD CONSTRAINT `annonces_ibfk_1` FOREIGN KEY (`annonces_user`) REFERENCES `users` (`users_id`),
  ADD CONSTRAINT `annonces_ibfk_2` FOREIGN KEY (`annonces_categorie`) REFERENCES `souscategories` (`sousCategories_id`),
  ADD CONSTRAINT `annonces_ibfk_3` FOREIGN KEY (`annonces_departement`) REFERENCES `departements` (`departements_id`),
  ADD CONSTRAINT `annonces_ibfk_4` FOREIGN KEY (`annonces_statut`) REFERENCES `statuts` (`statut_id`);

--
-- Contraintes pour la table `departements`
--
ALTER TABLE `departements`
  ADD CONSTRAINT `departements_ibfk_1` FOREIGN KEY (`departements_idRegion`) REFERENCES `regions` (`regions_id`);

--
-- Contraintes pour la table `fichiers`
--
ALTER TABLE `fichiers`
  ADD CONSTRAINT `fichiers_ibfk_1` FOREIGN KEY (`fichiers_user`) REFERENCES `users` (`users_id`);

--
-- Contraintes pour la table `notations`
--
ALTER TABLE `notations`
  ADD CONSTRAINT `notations_ibfk_1` FOREIGN KEY (`notations_userDonneNote`) REFERENCES `users` (`users_id`),
  ADD CONSTRAINT `notations_ibfk_2` FOREIGN KEY (`notations_userRecoisNote`) REFERENCES `users` (`users_id`);

--
-- Contraintes pour la table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_ibfk_1` FOREIGN KEY (`regions_idPays`) REFERENCES `pays` (`pays_id`);

--
-- Contraintes pour la table `souscategories`
--
ALTER TABLE `souscategories`
  ADD CONSTRAINT `souscategories_ibfk_1` FOREIGN KEY (`sousCategories_idCategorie`) REFERENCES `categories` (`categories_id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`users_idDepartement`) REFERENCES `departements` (`departements_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
