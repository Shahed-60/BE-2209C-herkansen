-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 13 jun 2023 om 11:55
-- Serverversie: 5.7.36
-- PHP-versie: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvc-2209c-herkansen`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Leerling`
--

DROP TABLE IF EXISTS `Leerling`;
CREATE TABLE IF NOT EXISTS `Leerling` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(50) NOT NULL,
  `Tussenvoegsel` varchar(10) NOT NULL,
  `Achternaam` varchar(30) NOT NULL,
  `Mobiel` varchar(12) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Leerling`
--

INSERT INTO `Leerling` (`Id`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Mobiel`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Bas', 'De', 'Bakker', '06-28493823', b'1', NULL, '2023-06-13 13:07:56.939029', '2023-06-13 13:07:56.939031'),
(2, 'Terence', '', 'Draaijer', '06-39398734', b'1', NULL, '2023-06-13 13:07:56.939088', '2023-06-13 13:07:56.939088'),
(3, 'Samuel', '', 'Werachter', '06-24383291', b'1', NULL, '2023-06-13 13:07:56.939102', '2023-06-13 13:07:56.939102'),
(4, 'Sharida', '', 'Tetehuka', '06-48293823', b'1', NULL, '2023-06-13 13:07:56.939106', '2023-06-13 13:07:56.939106'),
(5, 'Fatma', '', 'Yilmaz', '06-34291234', b'1', NULL, '2023-06-13 13:07:56.939109', '2023-06-13 13:07:56.939110');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `LeerlingPerLesPakket`
--

DROP TABLE IF EXISTS `LeerlingPerLesPakket`;
CREATE TABLE IF NOT EXISTS `LeerlingPerLesPakket` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `LespakketId` tinyint(3) UNSIGNED NOT NULL,
  `LeerlingId` tinyint(3) UNSIGNED NOT NULL,
  `StartDatumRijlessen` date NOT NULL,
  `DatumRijbewijsBehaald` varchar(20) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_LeerlingPerLesPakket_LespakketId_Lespakket_Id` (`LespakketId`),
  KEY `FK_LeerlingPerLesPakket_LeerlingId_Leerling_Id` (`LeerlingId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `LeerlingPerLesPakket`
--

INSERT INTO `LeerlingPerLesPakket` (`Id`, `LespakketId`, `LeerlingId`, `StartDatumRijlessen`, `DatumRijbewijsBehaald`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 5, '2023-05-23', 'NULL', b'1', NULL, '2023-06-13 13:07:57.001290', '2023-06-13 13:07:57.001292'),
(2, 4, 1, '2022-06-03', '05-08-2022', b'1', NULL, '2023-06-13 13:07:57.001384', '2023-06-13 13:07:57.001384'),
(3, 1, 1, '2023-06-02', 'NULL', b'1', NULL, '2023-06-13 13:07:57.001397', '2023-06-13 13:07:57.001397'),
(4, 3, 4, '2023-01-01', 'NULL', b'1', NULL, '2023-06-13 13:07:57.001403', '2023-06-13 13:07:57.001404'),
(5, 1, 2, '2022-11-30', '23-05-2023', b'1', NULL, '2023-06-13 13:07:57.001410', '2023-06-13 13:07:57.001410'),
(6, 2, 3, '2022-06-06', '06-06-2023', b'1', NULL, '2023-06-13 13:07:57.001416', '2023-06-13 13:07:57.001416');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Lespakket`
--

DROP TABLE IF EXISTS `Lespakket`;
CREATE TABLE IF NOT EXISTS `Lespakket` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `PakketNaam` varchar(50) NOT NULL,
  `AantalLessen` int(10) NOT NULL,
  `Rijbewijscategorie` varchar(5) NOT NULL,
  `Prijs` varchar(10) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Lespakket`
--

INSERT INTO `Lespakket` (`Id`, `PakketNaam`, `AantalLessen`, `Rijbewijscategorie`, `Prijs`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Personenauto Extra', 40, 'B', '2700', b'1', NULL, '2023-06-13 13:07:56.877866', '2023-06-13 13:07:56.877870'),
(2, 'Vrachtwagen Subliem', 60, 'C', '5400', b'1', NULL, '2023-06-13 13:07:56.877957', '2023-06-13 13:07:56.877957'),
(3, 'Bus Extraordinaire', 80, 'D', '7300', b'1', NULL, '2023-06-13 13:07:56.877966', '2023-06-13 13:07:56.877966'),
(4, 'Bromfiets', 10, 'AM', '230', b'1', NULL, '2023-06-13 13:07:56.877969', '2023-06-13 13:07:56.877969');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `LeerlingPerLesPakket`
--
ALTER TABLE `LeerlingPerLesPakket`
  ADD CONSTRAINT `FK_LeerlingPerLesPakket_LeerlingId_Leerling_Id` FOREIGN KEY (`LeerlingId`) REFERENCES `Leerling` (`Id`),
  ADD CONSTRAINT `FK_LeerlingPerLesPakket_LespakketId_Lespakket_Id` FOREIGN KEY (`LespakketId`) REFERENCES `Lespakket` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
