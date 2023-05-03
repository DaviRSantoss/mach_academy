-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mach_academy_db
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `mach_academy_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mach_academy_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mach_academy_db`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cli_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cli_nome` varchar(255) NOT NULL,
  `cli_data_de_nascimento` date NOT NULL,
  `cli_email` varchar(255) NOT NULL,
  `cli_senha` varchar(255) NOT NULL,
  `cli_imagem` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`cli_codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'aluno','2004-08-24','aluno','MTIz','ffb4188f58bafde1bdc11b55d7577182.png');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criador_de_conteudo`
--

DROP TABLE IF EXISTS `criador_de_conteudo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criador_de_conteudo` (
  `crc_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `crc_nome` varchar(255) NOT NULL,
  `crc_email` varchar(255) NOT NULL,
  `crc_senha` varchar(255) NOT NULL,
  `crc_data_de_nascimento` date DEFAULT NULL,
  `crc_CPF_CNPJ` varchar(14) DEFAULT NULL,
  `crc_imagem` varchar(38) DEFAULT NULL,
  `fk_Tipo_de_usuario_tiu_codigo` int(11) NOT NULL,
  PRIMARY KEY (`crc_codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criador_de_conteudo`
--

LOCK TABLES `criador_de_conteudo` WRITE;
/*!40000 ALTER TABLE `criador_de_conteudo` DISABLE KEYS */;
INSERT INTO `criador_de_conteudo` VALUES (1,'professor','professor','MTIz','2022-12-03','11111111111','16185f84db64d369fcf35eb32e965f70.png',2);
/*!40000 ALTER TABLE `criador_de_conteudo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculo_interprete`
--

DROP TABLE IF EXISTS `curriculo_interprete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculo_interprete` (
  `cui_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cui_data` date NOT NULL,
  `cui_curriculo` varchar(37) NOT NULL,
  `fk_Interprete_int_codigo` int(11) NOT NULL,
  PRIMARY KEY (`cui_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculo_interprete`
--

LOCK TABLES `curriculo_interprete` WRITE;
/*!40000 ALTER TABLE `curriculo_interprete` DISABLE KEYS */;
INSERT INTO `curriculo_interprete` VALUES (1,'2022-12-03','0fc8b6b8a76a52ef04f850471c098465.pdf',1);
/*!40000 ALTER TABLE `curriculo_interprete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `cur_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cur_nome` varchar(255) NOT NULL,
  `cur_descricao` varchar(255) NOT NULL,
  `cur_imagem` varchar(37) DEFAULT NULL,
  `fk_Tipo_de_Curso_tic_codigo` int(11) NOT NULL,
  `fk_Criador_de_Conteudo_crc_codigo` int(11) NOT NULL,
  `fk_Interprete_int_codigo` int(11) NOT NULL,
  `cur_preco` decimal(10,2) DEFAULT NULL,
  `cur_aprovado` int(2) NOT NULL,
  `cur_traducao` int(2) NOT NULL,
  PRIMARY KEY (`cur_codigo`),
  KEY `FK_Curso_3` (`fk_Criador_de_Conteudo_crc_codigo`),
  KEY `fk_Tipo_de_Curso_tic_codigo` (`fk_Tipo_de_Curso_tic_codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `fun_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `fun_nome` varchar(255) NOT NULL,
  `fun_data_de_nascimento` date DEFAULT NULL,
  `fun_cpf` varchar(11) NOT NULL,
  `fun_salario` decimal(6,2) DEFAULT NULL,
  `fun_funcao` varchar(255) DEFAULT NULL,
  `fun_email` varchar(255) NOT NULL,
  `fun_senha` varchar(255) NOT NULL,
  `fk_Telefone_de_Funcionario_tel_codigo` int(11) DEFAULT NULL,
  `fun_imagem` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fun_codigo`),
  KEY `fk_Telefone_de_Funcionario` (`fk_Telefone_de_Funcionario_tel_codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interprete`
--

DROP TABLE IF EXISTS `interprete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interprete` (
  `int_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `int_nome` varchar(255) NOT NULL,
  `int_email` varchar(255) NOT NULL,
  `int_senha` varchar(255) NOT NULL,
  `int_CPF` varchar(11) NOT NULL,
  `int_data_de_nascimento` date NOT NULL,
  `int_aprovado` int(2) NOT NULL,
  `int_imagem` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`int_codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interprete`
--

LOCK TABLES `interprete` WRITE;
/*!40000 ALTER TABLE `interprete` DISABLE KEYS */;
INSERT INTO `interprete` VALUES (1,'interprete','interprete','MTIz','22222222222','2022-12-03',0,'ee198e9ea204610e2d366505919f64fd.png');
/*!40000 ALTER TABLE `interprete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `mod_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `mod_nome` varchar(255) DEFAULT NULL,
  `mod_descricao` varchar(255) DEFAULT NULL,
  `fk_Curso_cur_codigo` int(11) NOT NULL,
  PRIMARY KEY (`mod_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_curso`
--

DROP TABLE IF EXISTS `tipo_de_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_de_curso` (
  `tic_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `tic_nome` varchar(255) DEFAULT NULL,
  `tic_descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tic_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_curso`
--

LOCK TABLES `tipo_de_curso` WRITE;
/*!40000 ALTER TABLE `tipo_de_curso` DISABLE KEYS */;
INSERT INTO `tipo_de_curso` VALUES (1,'informatica','cursos de informatica'),(2,'humanas','cursos de humanas'),(3,'exatas','cursos de exatas'),(4,'biologicas','cursos de biologicas');
/*!40000 ALTER TABLE `tipo_de_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_usuario`
--

DROP TABLE IF EXISTS `tipo_de_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_de_usuario` (
  `tiu_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `tiu_nome` varchar(255) DEFAULT NULL,
  `tiu_descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tiu_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_usuario`
--

LOCK TABLES `tipo_de_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_de_usuario` DISABLE KEYS */;
INSERT INTO `tipo_de_usuario` VALUES (1,'cliente','id 1 diz respeito ao cliente'),(2,'criador','id 2 diz respeito ao criador'),(3,'interprete','id 3 diz respeito ao interprete');
/*!40000 ALTER TABLE `tipo_de_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_video`
--

DROP TABLE IF EXISTS `tipo_de_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_de_video` (
  `tiv_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `tiv_nome` varchar(100) DEFAULT NULL,
  `tiv_descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tiv_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_video`
--

LOCK TABLES `tipo_de_video` WRITE;
/*!40000 ALTER TABLE `tipo_de_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_de_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `ven_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `ven_data` date DEFAULT NULL,
  `fk_Curso_cur_codigo` int(11) NOT NULL,
  `fk_Cliente_cli_codigo` int(11) NOT NULL,
  PRIMARY KEY (`ven_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `vid_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `vid_nome` varchar(255) DEFAULT NULL,
  `vid_duracao` varchar(100) DEFAULT NULL,
  `vid_url` varchar(255) DEFAULT NULL,
  `fk_Modulo_mod_codigo` int(11) NOT NULL,
  `fk_Tipo_de_Video_tiv_codigo` int(11) NOT NULL,
  PRIMARY KEY (`vid_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-03 13:12:19
