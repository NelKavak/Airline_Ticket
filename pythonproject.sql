-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mar. 14 nov. 2023 à 13:55
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
-- Base de données : `pythonproject`
--

-- --------------------------------------------------------

--
-- Structure de la table `Booking`
--

CREATE TABLE `Booking` (
  `BookingID` int(11) NOT NULL,
  `FlightID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `NumTicket` int(11) NOT NULL,
  `BookingDate` date NOT NULL,
  `TotalAmount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Customer`
--

CREATE TABLE `Customer` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `UserType` varchar(50) NOT NULL,
  `MemberType` varchar(50) NOT NULL,
  `MembershipStartDate` date NOT NULL,
  `MembershipEndDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Customer`
--

INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `Password`, `UserType`, `MemberType`, `MembershipStartDate`, `MembershipEndDate`) VALUES
(1, 'TEST', 'TESTN', 'aa', 'ab', 'C', 'E', '2023-11-22', '2023-11-22'),
(2, 'Nel', 'Kavakdjian', 'abc', 'abc', 'C', 'E', '2023-11-22', '2023-11-22');

-- --------------------------------------------------------

--
-- Structure de la table `Discount`
--

CREATE TABLE `Discount` (
  `DiscountID` int(11) NOT NULL,
  `DiscountType` varchar(50) NOT NULL,
  `DiscountPercentage` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Flight`
--

CREATE TABLE `Flight` (
  `DepartureCity` varchar(255) NOT NULL,
  `ArrivalCity` varchar(255) NOT NULL,
  `DepartureTime` datetime NOT NULL,
  `ArrivalTime` datetime NOT NULL,
  `TicketPrice` float NOT NULL,
  `FlightID` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `UserType` varchar(50) NOT NULL,
  `MemberType` varchar(50) NOT NULL,
  `MembershipStartDate` datetime NOT NULL,
  `MemberShipEndDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Booking`
--
ALTER TABLE `Booking`
  ADD KEY `FlightID` (`FlightID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Index pour la table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Index pour la table `Discount`
--
ALTER TABLE `Discount`
  ADD PRIMARY KEY (`DiscountID`);

--
-- Index pour la table `Flight`
--
ALTER TABLE `Flight`
  ADD PRIMARY KEY (`FlightID`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Booking`
--
ALTER TABLE `Booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `Flight` (`FlightID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
