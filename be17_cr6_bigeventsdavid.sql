-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 02. Dez 2022 um 14:00
-- Server-Version: 10.4.25-MariaDB
-- PHP-Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `be17_cr6_bigeventsdavid`
--
CREATE DATABASE IF NOT EXISTS `be17_cr6_bigeventsdavid` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be17_cr6_bigeventsdavid`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221202082417', '2022-12-02 09:24:30', 59),
('DoctrineMigrations\\Version20221202082509', '2022-12-02 09:25:13', 54);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `events`
--

INSERT INTO `events` (`id`, `name`, `date`, `description`, `image`, `capacity`, `email`, `address`, `type`, `url`) VALUES
(1, 'Christkindlmarkt', '2022-11-11 16:00:00', 'Hoch die Punschtassen! Die Wiener Christkindlmärkte finden heuer wieder \"wie früher\" statt. Hier findet ihr alle Infos.', 'https://www.city-walks.info/Wien/bilder/Christkindlmarkt-Rathausplatz.JPG', 100000, 'christkindlmarkt@mail.com', 'Rathausplatz, 1010 Wien', 'Christmas', 'https://www.christkindlmarkt.at/'),
(2, 'Der Glöckner von Notre Dame', '2022-12-02 19:30:00', 'Disneys DER GLÖCKNER VON NOTRE DAME erstmals in Wien', 'https://www.musicalvienna.at/media/image/c1280x680/20842.jpg', 300, 'musicalvienna@mail.com', 'Seilerstätte 9, 1010 Wien', 'Theater', 'https://www.musicalvienna.at/de/spielplan-und-tickets/spielplan/production/1053/DER-GLOeCKNER-VON-NOTRE-DAME/calendar'),
(3, 'Rebecca', '2022-12-02 13:00:00', 'Das legendäre Musical Rebecca sorgt ab 22. September 2022 für spannungsvolle Abende im Raimund Theater', 'https://www.wien.info/resource/image/422068/3x2/1100/733/41605ac244a5249e84e24b63728acd22/3E31E7C78F02A5D0F5DFC4158873B08D/rebecca-fensterszene.jpg', 300, 'info@vbw.at', 'Wallgasse 18-20, 1060 Wien', 'Theater', 'https://www.wien.info/de/musik-buehne/musical/rebecca-422074'),
(5, 'Aladin - das Musical', '2022-12-04 16:00:00', 'Über den Mut, das eigene Schicksal zu ändern: Im Musical-Highlight „Aladin“ taucht das Publikum ein in eine Welt voller Abenteuer und Magie.', 'https://www.wien-ticket.at/tools/imager/imager.php?file=%2Fmedia%2Fimage%2Foriginal%2F20249.jpg&width=1500', 200, 'wienticket@mail.com', 'Wiener Stadthalle - Halle F, Wien', 'Theater', 'https://www.wien-ticket.at/de/ticket/87691/aladin-das-musical-wiener-stadthalle-wiener-stadthalle-halle-f-wien'),
(6, 'Super Bowl Night - ADMIRAL Arena', '2023-02-12 21:00:00', 'Am Sonntag den 12. Februar 2023, steigt die coolste und exklusivste Super Bowl Party Wiens bei uns in der ADMIRAL Arena Prater.', 'https://www.wien-ticket.at/tools/imager/imager.php?file=%2Fmedia%2Fimage%2Foriginal%2F21163.jpg&width=1500', 10000, 'wienticket@mail.com', 'Perspektivstraße 141, 1020 Wien', 'Sport', 'https://www.wien-ticket.at/de/ticket/84780/super-bowl-night-admiral-arena-prater-admiral-arena-prater-wien-wien'),
(7, 'FORMULA 1 - GP von Österreich 2023', '2023-06-30 00:00:00', 'Der „Formula 1 Großer Preis von Österreich 2023“ wird heuer wieder am Red Bull Ring vor Fans stattfinden!', 'https://www.wien-ticket.at/tools/imager/imager.php?file=%2Fmedia%2Fimage%2Foriginal%2F20576.jpg&width=1500', 105000, 'wienticket@mail.com', 'Red Bull Ring Straße 1, 8724 Spielberg', 'Sport', 'https://www.wien-ticket.at/de/ticket/89107/formel-1-2023-red-bull-ring-spielberg-red-bull-ring-spielberg'),
(8, 'Erste Bank Open', '2023-10-23 14:00:00', 'Die Erste Bank Open in der Wiener Stadthalle sind alljährlich das Tennis-Highlight im heimischen Sportkalender.', 'https://www.wien-ticket.at/tools/imager/imager.php?file=%2Fmedia%2Fimage%2Foriginal%2F19113.jpg&width=1500', 16000, 'wienticket@mail.com', 'Roland Rainer Platz 1, 1150 Wien', 'Sport', 'https://www.wien-ticket.at/de/ticket/92839/erste-bank-open-2023-wiener-stadthalle-wiener-stadthalle-halle-d-wien'),
(9, 'Omar Sarsam - Sonderklasse - CasaNova Vienna', '2023-01-29 00:00:00', 'Suche Begleitung für einen Abend, 18-99 Jahre, Geschlecht egal. Die mich auf dem Weg vom Lebensretter bis hin zur völligen Systemirrelevanz begleitet. Gerne auch Paare oder Gruppen.', 'https://www.wien-ticket.at/tools/imager/imager.php?file=%2Fmedia%2Fimage%2Foriginal%2F18691.jpg&width=1500', 1000, 'wienticket@mail.com', 'Dorotheergasse 6-8, 1010 Wien', 'Theater', 'https://www.wien-ticket.at/de/ticket/80146/kabarett-omar-sarsam-sonderklasse-casanova-vienna-casanova-vienna-wien');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
