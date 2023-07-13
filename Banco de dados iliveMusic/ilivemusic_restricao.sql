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
-- Table structure for table `restricao`
--

DROP TABLE IF EXISTS `restricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restricao` (
  `id_restricao` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `restrito` tinyint(1) NOT NULL,
  `dataInicio` datetime NOT NULL,
  `dataTermino` datetime NOT NULL,
  `motivo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_restricao`),
  KEY `fk_restricao_usuario` (`usuario_id`),
  CONSTRAINT `fk_restricao_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restricao`
--

LOCK TABLES `restricao` WRITE;
/*!40000 ALTER TABLE `restricao` DISABLE KEYS */;
INSERT INTO `restricao` VALUES (195,193,0,'2023-06-26 00:00:00','2023-06-30 00:00:00','Reincidencia no uso indevido dos conteudos da plataforma'),(196,195,0,'2023-06-26 00:00:00','2023-05-29 00:00:00','ghffgh'),(197,2,0,'2023-06-26 00:00:00','2023-06-30 00:00:00','5'),(198,196,0,'2023-06-26 00:00:00','2023-06-18 00:00:00','Conta com nome inapropriado!'),(199,193,0,'2023-06-26 00:00:00','2023-06-19 00:00:00','Utilizou os conteudos da plataforma de forma indevida'),(200,193,0,'2023-06-30 00:00:00','2023-07-01 00:00:00','teste'),(201,2,0,'2023-06-30 00:00:00','2023-07-01 00:00:00','teeeeeeeeeeeeeeeeeeeeeeeeeste'),(202,204,0,'2023-07-01 00:00:00','2023-07-07 00:00:00','Voce e gay'),(203,205,1,'2023-07-02 00:00:00','2023-07-20 00:00:00','Me faz amar muito');
/*!40000 ALTER TABLE `restricao` ENABLE KEYS */;
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
