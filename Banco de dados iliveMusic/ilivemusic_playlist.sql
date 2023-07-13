CREATE DATABASE  IF NOT EXISTS `ilivemusic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `ilivemusic`;
-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ilivemusic
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `id_playlist` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `caminho_pasta` varchar(100) NOT NULL,
  `nome_playlist` varchar(50) NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `caminho_imagem` varchar(100) DEFAULT NULL,
  `privado` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_playlist`),
  KEY `fk_playlist_usuario1` (`usuario_id`),
  CONSTRAINT `fk_playlist_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (95,1,'C:\\Java Web\\ILiveMusic\\build\\web\\playlists/1/Minhas musicas gospel de 2023','Minhas musicas gospel de 2023','2023-07-03 00:55:53','playlists/1/Minhas musicas gospel de 2023/capa_playlist/bg22.jpg',NULL),(100,1,'C:\\Java Web\\ILiveMusic\\build\\web\\playlists/1/radsds','radsds','2023-07-08 18:17:07','playlists/1/radsds/capa_playlist/WhatsApp Image 2023-07-05 at 23.17.33.jpeg',NULL),(103,1,'C:\\Java Web\\ILiveMusic\\build\\web\\playlists/1/dsad','dsad','2023-07-08 19:40:06','playlists/1/dsad/capa_playlist/2.jpg',NULL),(104,1,'C:\\Java Web\\ILiveMusic\\build\\web\\playlists/1/asdasdsa','asdasdsa','2023-07-08 19:40:48','playlists/1/asdasdsa/capa_playlist/party.gif',NULL),(106,1,'C:\\Java Web\\ILiveMusic\\build\\web\\playlists/1/dasds','dasds','2023-07-08 23:21:50','playlists/1/dasds/capa_playlist/inicial-bg.jpg',0);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-09  8:57:14
