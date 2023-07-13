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
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `senha` varchar(15) NOT NULL,
  `permissao` varchar(15) NOT NULL DEFAULT 'gratuito',
  `foto_perfil` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Julio','julio','julio.tablet2012@gmail.com','julio','adm','dadosUsuario/1/foto_perfil/party.gif'),(2,'ademiro','adm','ademirosilvano@gmail.com','adm','adm',NULL),(193,'Priscila Mariano','priscilah22','prih@gmail.com','prih22','comum',NULL),(194,'Emanoel Costa','manel','manel@hotmail.com','manel','comum',NULL),(195,'Daniel Costa Moura','danigordo','daniebola@bol.com','danigordo','comum',NULL),(196,'Cleber Andrade','cleber','cleberiano@outlook.com','cleber','comum',NULL),(197,'Marcos Rafael','marquin','marquinrafa@gmail.com','marquin','comum',NULL),(198,'Marina dos Santos','marina','marinasantos@gmail.com','marina','comum',NULL),(199,'Marciele Pereira','marciele','marciele@gmail.com','marciele','comum',NULL),(200,'Claudio A.','claudinho','claudin@gmail.com','claudinho','comum',NULL),(201,'Denis Ohara','denis','denisoh@gmail.com','denis','comum',NULL),(204,'Rodolfo','rodolfo','teeet@gamdis.com','rodolfo','comum','dadosUsuario/204/foto_perfil/party.gif'),(205,'Gabi Almeida','gabriele','gabrielekarolina17@gmail.com','gabriele','comum','dadosUsuario/205/foto_perfil/party.gif'),(206,'gratuito gratis','gratuito','teeet@gamdis.com','gratuito','comum',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-09  8:57:15
