CREATE DATABASE  IF NOT EXISTS `crm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `crm`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: crm
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_join_date` date NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_email` (`customer_email`),
  UNIQUE KEY `customer_email_2` (`customer_email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (10,'Olivia Brown','olivia.b@example.com','9123456782','2024-04-10'),(11,'Ethan Taylor','ethan.t@example.com','9123456783','2024-04-15'),(22,'Rahul','rahul@gmail.com','9856412578','2024-12-24'),(23,'Krish','krish@gmail.com','7854126582','2024-12-24');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generated_reports`
--

DROP TABLE IF EXISTS `generated_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generated_reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `report_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `generated_reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generated_reports`
--

LOCK TABLES `generated_reports` WRITE;
/*!40000 ALTER TABLE `generated_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `generated_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interactions`
--

DROP TABLE IF EXISTS `interactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `interaction_type` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `interaction_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interactions`
--

LOCK TABLES `interactions` WRITE;
/*!40000 ALTER TABLE `interactions` DISABLE KEYS */;
INSERT INTO `interactions` VALUES (2,'Jane Smith','jane.smith@example.com','Email','Follow-up on pricing','2024-03-02 14:00:00'),(3,'Alice Johnson','alice.j@example.com','Meeting','Product demo scheduled','2024-03-05 16:00:00'),(4,'Bob Williams','bob.w@example.com','Call','Resolved service query','2024-03-06 11:30:00'),(6,'Charlie Brown','charlie.b@example.com','Call','Discussed service upgrades','2024-03-07 15:30:00'),(7,'Emily Davis','emily.d@example.com','Email','Requested a quote','2024-03-02 11:00:00'),(8,'David Harris','david.h@example.com','Meeting','Discussed long-term contract','2024-03-16 14:00:00'),(9,'Sophia Martinez','sophia.m@example.com','Call','Asked about product demo','2024-03-30 09:30:00'),(10,'Michael Scott','michael.s@example.com','Call','Customer support query','2024-04-06 15:00:00'),(11,'Olivia Brown','olivia.b@example.com','Email','Follow-up on order delivery','2024-04-12 13:45:00'),(12,'Ethan Taylor','ethan.t@example.com','Call','Discussed custom pricing','2024-04-16 10:15:00'),(13,'Emily Davis','emily.d@example.com','Call','Feedback on service','2024-03-04 16:30:00'),(14,'Sophia Martinez','sophia.m@example.com','Email','Sent product details','2024-03-29 08:15:00'),(15,'John Doe','john.doe@example.com','Meeting','Renewal contract discussion','2024-03-10 12:00:00'),(16,'Michael Scott','michael.s@example.com','Call','Follow-up call on product','2024-04-07 10:30:00'),(17,'Olivia Brown','olivia.b@example.com','Email','Sent feedback request','2024-04-13 09:15:00'),(19,'Emily Davis','emily.d@example.com','Email','Product update notification','2024-04-05 11:00:00'),(20,'David Harris','david.h@example.com','Call','Service status inquiry','2024-04-18 08:30:00'),(21,'Sophia Martinez','sophia.m@example.com','Meeting','Negotiated contract','2024-04-20 13:00:00'),(22,'Michael Scott','michael.s@example.com','Call','Help with product installation','2024-04-21 09:00:00'),(23,'Olivia Brown','olivia.b@example.com','Call','Clarified delivery time','2024-04-22 15:45:00'),(24,'Ethan Taylor','ethan.t@example.com','Email','Sent invoice details','2024-04-23 11:30:00'),(25,'Emily Davis','emily.d@example.com','Meeting','Final contract negotiation','2024-04-25 16:00:00'),(34,'Jane','jane.smith@example.com','Having Issue','Explain  the problem occur in my System.','2024-12-24 15:50:00');
/*!40000 ALTER TABLE `interactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'king','king@gmail.com','123','admin','2024-12-19 10:24:07'),(8,'king','king@king.com','123456','admin','2025-04-09 17:53:10'),(9,'king','theviralplay01@gmail.com','123456','admin','2025-04-13 17:36:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-13 23:58:09
