-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: veterinaria
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Medina Lozano Mitzy Joselyn','joselin@gmail.com','3221876543','Las moras #125','2023-04-20'),(2,'Medina Lozano Mitzy Joselyn','joselin@gmail.com','3221876543','Las moras #125','2023-04-20'),(3,'Medina Lozano Mitzy Joselyn','joselin@gmail.com','3221876543','Las moras #125','2023-04-20'),(4,'Medina Lozano Mitzy Joselyn','joselin@gmail.com','3221876543','Las moras #125','2023-04-20'),(5,'Jennifer','elenita@gmail.com','3221568721','Mojoneras','2023-04-19'),(6,'Juanito Perez','juanito@gmail.com','32215678123','Pitillal','2023-04-28'),(7,'Elenita','elenita@gmail.com','3221678923','Jarretaderas #134','2023-04-19'),(8,'Jennifer','pv190116921@vallarta.tecmm.edu.mx','3227896512','Independencia','2023-04-12'),(9,'Joselyn Lozano','veronica@gmail.com','3221765423','Gallardas#125','2023-04-20'),(10,'Elenita','juanito@gmail.com','3227896512','Gallardas#125','2023-04-20'),(11,'Joselyn','juanito@gmail.com','32215678123','Las moras #125','2023-04-18'),(12,'Jennifer Carbajal','jennifer_carbajal@gmail.com','3221654321','Jarretaderas #135','2023-04-25'),(13,'Gustavo Viera','gustavo@gmail.com','3221675421','Pitillal','2023-04-25'),(14,'Veronica','veronica123@gmai.com','3221673452','Pitillal','2023-04-29');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `id_mascotas` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `especie` varchar(50) NOT NULL,
  `raza` varchar(50) NOT NULL,
  `sexo` varchar(150) NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `fotografia` varchar(255) NOT NULL,
  PRIMARY KEY (`id_mascotas`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotas`
--

LOCK TABLES `mascotas` WRITE;
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
INSERT INTO `mascotas` VALUES (1,'Ruster','2019-08-21','Perro','Beagle','Macho',1,''),(2,'Ruster','2019-08-21','Perro','Beagle','Macho',2,''),(3,'Ruster','2019-08-21','Perro','Beagle','Macho',3,''),(4,'Ruster','2019-08-21','Perro','Beagle','Macho',4,''),(5,'Bolita','2023-04-21','Gato','Perico','Macho',5,''),(6,'Juanito','2019-07-17','Gato','Esfinge','Macho',6,''),(7,'Ruster','2023-04-10','Perico','Perico','Hembra',7,''),(8,'Ruster','2023-04-30','Perro','Perico','Hembra',8,''),(9,'Nieve','2023-04-17','Perico','Siames','Macho',9,''),(10,'Patita','2023-04-21','Perro','Beagle','Hembra',10,''),(11,'Benus','2023-04-18','Gato','Siames','Macho',11,'foto-1682052357934-672844892.jpg'),(12,'Copo de nieve','2019-03-21','Perro','Salchicha','Macho',12,'foto-1682470295441-701921897.jpg'),(13,'Kala','2021-06-25','Perro','Criollo','Macho',13,'foto-1682472167119-524109303.jpg'),(14,'Nievesita','2023-04-29','Perro','Salchicha','Macho',14,'foto-1682798493392-995023912.jpg');
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membresia`
--

DROP TABLE IF EXISTS `membresia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membresia` (
  `id_membresia` int NOT NULL AUTO_INCREMENT,
  `tipo_membresia` varchar(50) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_membresia`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `membresia_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membresia`
--

LOCK TABLES `membresia` WRITE;
/*!40000 ALTER TABLE `membresia` DISABLE KEYS */;
INSERT INTO `membresia` VALUES (1,'basica','2023-04-22','2023-04-26',100.00,5),(2,'premium','2023-04-20','2023-04-30',200.00,6),(3,'basica','2023-04-24','2023-04-13',100.00,7),(4,'basica','2023-04-25','2023-04-27',100.00,8),(5,'basica','2023-04-19','2023-04-13',100.00,9),(6,'premium','2023-04-21','2023-04-24',200.00,10),(7,'basica','2023-04-18','2023-04-17',100.00,11),(8,'premium','2023-04-25','2023-08-26',200.00,12),(9,'premium','2023-04-25','2023-05-25',200.00,13),(10,'basica','2023-04-28','2023-05-19',100.00,14);
/*!40000 ALTER TABLE `membresia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-29 14:44:00
