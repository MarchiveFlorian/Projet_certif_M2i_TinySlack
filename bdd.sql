-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour tinyslack
CREATE DATABASE IF NOT EXISTS `tinyslack` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tinyslack`;

-- Listage de la structure de table tinyslack. channels
CREATE TABLE IF NOT EXISTS `channels` (
  `channel_id` binary(16) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `channel_name` varchar(255) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `protection` int DEFAULT NULL,
  `user_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`channel_id`),
  KEY `FKi78dq62d5f9wn545wcdl4kohf` (`user_id`),
  CONSTRAINT `FKi78dq62d5f9wn545wcdl4kohf` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tinyslack.channels : ~4 rows (environ)
INSERT INTO `channels` (`channel_id`, `description`, `channel_name`, `creation_date`, `protection`, `user_id`) VALUES
	(_binary 0x003eef5d5fe44a499f1a0a1930f5228b, 'description du channel 3', 'Channel3', '2023-09-03', NULL, NULL),
	(_binary 0x44d0b5eb22554a96a01908e6cafbed37, 'description du channel 1 + modifications', 'channel1', '2023-09-04', 0, _binary 0xb56b286ec8404ca0bf0aa5d8d7486f74),
	(_binary 0x6b84c755c06f467d89b90516ad606d6e, 'description4', 'channel4', '2023-09-02', 0, _binary 0xb56b286ec8404ca0bf0aa5d8d7486f74),
	(_binary 0xa3f6c79d918a4d4bbdfbd54d3a43390d, 'Le canal de base protégé', 'General', '2023-09-04', 1, _binary 0xb56b286ec8404ca0bf0aa5d8d7486f74);

-- Listage de la structure de table tinyslack. messages
CREATE TABLE IF NOT EXISTS `messages` (
  `message_id` binary(16) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `message_date` datetime(6) DEFAULT NULL,
  `channel_id` binary(16) DEFAULT NULL,
  `user_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `FK3u3ckbhwq9se1cmopk2pq05b2` (`channel_id`),
  KEY `FKpsmh6clh3csorw43eaodlqvkn` (`user_id`),
  CONSTRAINT `FK3u3ckbhwq9se1cmopk2pq05b2` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`channel_id`),
  CONSTRAINT `FKpsmh6clh3csorw43eaodlqvkn` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tinyslack.messages : ~7 rows (environ)
INSERT INTO `messages` (`message_id`, `message`, `message_date`, `channel_id`, `user_id`) VALUES
	(_binary 0x196d6f21037e433c8073bdb4b557e1ef, 'test 2', '2023-09-03 19:16:34.917416', _binary 0x6b84c755c06f467d89b90516ad606d6e, _binary 0xc07851cf33c44b7d868ff0e9740a5da5),
	(_binary 0x323681845fb245a28ae8ad47473eaf86, 'On va essayer de faire défiler les messages !!', '2023-09-03 19:20:39.654499', _binary 0x6b84c755c06f467d89b90516ad606d6e, _binary 0xc07851cf33c44b7d868ff0e9740a5da5),
	(_binary 0x6361894c6d6d4a0582b2666704107e5c, 'Hello it\'s me + modifications', '2023-09-04 11:24:25.387000', _binary 0x44d0b5eb22554a96a01908e6cafbed37, _binary 0xb56b286ec8404ca0bf0aa5d8d7486f74),
	(_binary 0x7a48e24cee374be7b54edef39914a1dc, 'test', '2023-09-03 19:04:27.169521', _binary 0x6b84c755c06f467d89b90516ad606d6e, _binary 0xc07851cf33c44b7d868ff0e9740a5da5),
	(_binary 0x9695532a42424a3e8b07a2065172c6d9, 'Hello', '2023-09-02 18:32:10.024785', _binary 0x6b84c755c06f467d89b90516ad606d6e, _binary 0xc07851cf33c44b7d868ff0e9740a5da5),
	(_binary 0xa89ada00050b4e8096dceef1230ff2a6, 'Bonjour', '2023-09-02 18:31:40.859041', _binary 0x6b84c755c06f467d89b90516ad606d6e, _binary 0xb56b286ec8404ca0bf0aa5d8d7486f74),
	(_binary 0xbc07bbd36c6d44d49b5f2219334ebb7b, 'On va essayer de faire défiler les messages !!', '2023-09-03 19:20:17.899974', _binary 0x6b84c755c06f467d89b90516ad606d6e, _binary 0xc07851cf33c44b7d868ff0e9740a5da5);

-- Listage de la structure de table tinyslack. users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` binary(16) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_mail` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tinyslack.users : ~4 rows (environ)
INSERT INTO `users` (`user_id`, `password`, `user_mail`, `user_name`) VALUES
	(_binary 0x78a55bb30d1848c78be8f391002e0757, '33333', 'mail3@3', 'user3'),
	(_binary 0xb56b286ec8404ca0bf0aa5d8d7486f74, '11111', 'mail1@11', 'user1'),
	(_binary 0xc07851cf33c44b7d868ff0e9740a5da5, '22222', 'mail2@2', 'user2'),
	(_binary 0xedb46394d5cc4ab28aaeb17c8d22c02f, '44444', 'mail4@4', 'user4');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
