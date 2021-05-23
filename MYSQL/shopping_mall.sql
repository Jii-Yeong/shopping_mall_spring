CREATE DATABASE  IF NOT EXISTS `mall_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mall_db`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: mall_db
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `product_info`
--

DROP TABLE IF EXISTS `product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `color` varchar(45) NOT NULL,
  `size_s` int NOT NULL DEFAULT '0',
  `size_m` int NOT NULL DEFAULT '0',
  `size_l` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `number_idx` (`number`),
  CONSTRAINT `number` FOREIGN KEY (`number`) REFERENCES `product_upload` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_info`
--

LOCK TABLES `product_info` WRITE;
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
INSERT INTO `product_info` VALUES (1,24,'Red',0,2,3),(2,24,'Yellow',1,2,3),(3,24,'Blue',4,3,2),(4,24,'Mint',100,100,100),(5,1,'123',123,123,123);
/*!40000 ALTER TABLE `product_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_order` (
  `number` int NOT NULL AUTO_INCREMENT,
  `product_num` int NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `color` varchar(45) NOT NULL,
  `size` varchar(5) NOT NULL,
  `amount` int NOT NULL,
  `total_price` int NOT NULL,
  PRIMARY KEY (`number`),
  KEY `product_num_idx` (`product_num`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `product_num` FOREIGN KEY (`product_num`) REFERENCES `product_upload` (`number`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_upload`
--

DROP TABLE IF EXISTS `product_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_upload` (
  `number` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `photo_1` text NOT NULL,
  `photo_2` text,
  `photo_3` text,
  `price` int NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_upload`
--

LOCK TABLES `product_upload` WRITE;
/*!40000 ALTER TABLE `product_upload` DISABLE KEYS */;
INSERT INTO `product_upload` VALUES (1,'123','2021-05-23-15_54_23_b3bb4b30a796335e054a4431085841e1.jpg',NULL,NULL,123,'123');
/*!40000 ALTER TABLE `product_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `qna_num` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `writer` varchar(50) DEFAULT NULL,
  `regDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `viewCnt` int DEFAULT '0',
  PRIMARY KEY (`qna_num`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,'1','1',NULL,'2021-05-23 21:17:18',0),(2,'2','2',NULL,'2021-05-23 21:17:18',0),(3,'3','3',NULL,'2021-05-23 21:17:18',0),(4,'4','4',NULL,'2021-05-23 21:17:18',0),(5,'5','5',NULL,'2021-05-23 21:17:18',0),(6,'6','6',NULL,'2021-05-23 21:17:18',0),(7,'7','7',NULL,'2021-05-23 21:17:18',0),(8,'8','8',NULL,'2021-05-23 21:17:18',0),(9,'9','9',NULL,'2021-05-23 21:17:18',0),(10,'10','10',NULL,'2021-05-23 21:17:18',0),(11,'11','11',NULL,'2021-05-23 21:17:18',0),(12,'12','12',NULL,'2021-05-23 21:17:18',0),(13,'13','13',NULL,'2021-05-23 21:17:18',0),(14,'14','14',NULL,'2021-05-23 21:17:18',0),(15,'15','15',NULL,'2021-05-23 21:17:18',0),(16,'질문글 작성 멈춰!','멈춰!!',NULL,'2021-05-23 21:17:18',0);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(50) NOT NULL,
  `fileName` varchar(500) NOT NULL,
  `text` text NOT NULL,
  UNIQUE KEY `number_UNIQUE` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'글순서1','2021-05-16-16_57_37_옷.PNG','글순서1'),(2,'글순서2','2021-05-16-16_57_50_옷임다.PNG','글순서2'),(3,'글순서3','2021-05-16-16_58_11_일상.PNG','글순서3'),(4,'글순서4','2021-05-16-16_58_25_한복.PNG','글순서4'),(5,'글순서5','2021-05-16-16_58_44_옷.PNG','글순서5'),(6,'글순서6','2021-05-16-16_59_09_일상.PNG','글순서6'),(7,'글순서7','2021-05-16-16_59_25_옷임다.PNG','글순서7'),(8,'글순서8','2021-05-16-16_59_53_한복.PNG','글순서8'),(9,'글순서9','2021-05-16-17_00_21_일상.PNG','글순서9'),(10,'글순서10','2021-05-16-17_00_44_옷.PNG','글순서10'),(11,'글순서11','2021-05-16-17_01_05_한복.PNG','글순서11'),(12,'글순서12','2021-05-16-17_01_20_옷임다.PNG','글순서12'),(13,'글순서13','2021-05-16-17_01_43_일상.PNG','글순서13'),(14,'글순서14','2021-05-16-17_01_58_한복.PNG','글순서14'),(15,'글순서15','2021-05-16-17_02_21_옷.PNG','글순서15'),(16,'글순서16','2021-05-16-17_02_36_옷임다.PNG','글순서16');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_num` int NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `birth` date NOT NULL,
  `phone_num` int NOT NULL,
  `address` varchar(50) NOT NULL,
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `grade` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_num`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `phone_num_UNIQUE` (`phone_num`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'id','password','name','2021-05-17',1012345678,'부산광역시 해운대구','2021-05-17 17:37:18',1),(2,'abc','password','이름','2020-11-17',1098765432,'서울특별시 관악구','2021-05-17 17:37:19',1),(3,'def','password','대한','1994-05-17',1055515548,'부산광역시 부산진구','2021-05-17 17:37:19',1),(4,'ggg','password','민국','2000-07-18',1012515545,'광주광역시','2021-05-17 17:37:20',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor` (
  `date` varchar(10) NOT NULL,
  `cnt` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` VALUES ('05월 16일',90),('05월 17일',5),('05월 18일',10),('05월 19일',60),('05월 20일',30),('05월 21일',20),('05월 22일',14),('05월 23일',4),('05�썡 22�씪',2),('05�썡 23�씪',2);
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mall_db'
--

--
-- Dumping routines for database 'mall_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23 21:17:51
