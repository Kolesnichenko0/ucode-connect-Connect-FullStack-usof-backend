-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: dkolesnych_solve_stack_db_production
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_title_uq` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Programming Languages','Discussions about various programming languages, their features, and best practices','2024-12-02 16:51:05','2024-12-02 16:51:05'),(2,'Web Development','Topics related to frontend and backend web development, frameworks, and tools','2024-12-02 16:51:05','2024-12-02 16:51:05'),(3,'Databases','Everything about SQL, NoSQL, and data management strategies','2024-12-02 16:51:05','2024-12-02 16:51:05'),(4,'Cloud Computing','Discussions on cloud platforms, services, and migration strategies','2024-12-02 16:51:05','2024-12-02 16:51:05'),(5,'Data Science','Topics covering data analysis, machine learning, AI, and related tools','2024-12-02 16:51:05','2024-12-02 16:51:05'),(6,'DevOps','Best practices, tools, and methodologies for DevOps and automation','2024-12-02 16:51:05','2024-12-02 16:51:05'),(7,'Software Architecture','Discussions on software design patterns, architectural styles, and system design','2024-12-02 16:51:05','2024-12-02 16:51:05'),(8,'Mobile Development','Topics related to iOS, Android, and cross-platform mobile app development','2024-12-02 16:51:05','2024-12-02 16:51:05'),(9,'Security','Cybersecurity, application security, and best practices for secure coding','2024-12-02 16:51:05','2024-12-02 16:51:05'),(10,'Performance Optimization','Techniques and tools for optimizing software and system performance','2024-12-02 16:51:05','2024-12-02 16:51:05'),(11,'Artificial Intelligence','Discussions on AI, machine learning, and deep learning technologies','2024-12-02 16:51:05','2024-12-02 16:51:05'),(12,'Blockchain','Topics related to blockchain technology, cryptocurrencies, and decentralized applications','2024-12-02 16:51:05','2024-12-02 16:51:05'),(13,'IoT (Internet of Things)','Exploring the world of connected devices and IoT applications','2024-12-02 16:51:05','2024-12-02 16:51:05'),(14,'Augmented and Virtual Reality','Discussions on AR, VR, and mixed reality technologies','2024-12-02 16:51:05','2024-12-02 16:51:05'),(15,'Quantum Computing','Exploring the principles and applications of quantum computing','2024-12-02 16:51:05','2024-12-02 16:51:05'),(16,'Robotics','Topics covering robotics, automation, and related technologies','2024-12-02 16:51:05','2024-12-02 16:51:05'),(17,'5G and Wireless Technologies','Discussions on 5G, wireless networking, and communication technologies','2024-12-02 16:51:05','2024-12-02 16:51:05'),(18,'Edge Computing','Exploring edge computing architectures and use cases','2024-12-02 16:51:05','2024-12-02 16:51:05'),(19,'Bioinformatics','Intersection of biology, computer science, and data analysis','2024-12-02 16:51:05','2024-12-02 16:51:05'),(20,'Green Technology','Discussions on sustainable and environmentally friendly tech solutions','2024-12-02 16:51:05','2024-12-02 16:51:05'),(21,'Cybersecurity','Advanced topics in cybersecurity, threat detection, and prevention','2024-12-02 16:51:05','2024-12-02 16:51:05'),(22,'Big Data','Handling, processing, and analyzing large-scale datasets','2024-12-02 16:51:05','2024-12-02 16:51:05'),(23,'Microservices','Design, implementation, and management of microservices architectures','2024-12-02 16:51:05','2024-12-02 16:51:05'),(24,'Progressive Web Apps','Developing modern web applications with native-like capabilities','2024-12-02 16:51:05','2024-12-02 16:51:05'),(25,'Serverless Computing','Exploring serverless architectures and Function-as-a-Service (FaaS)','2024-12-02 16:51:05','2024-12-02 16:51:05'),(26,'GraphQL','Discussions on GraphQL APIs, schema design, and client integration','2024-12-02 16:51:05','2024-12-02 16:51:05'),(27,'Containerization','Topics related to Docker, container orchestration, and best practices','2024-12-02 16:51:05','2024-12-02 16:51:05'),(28,'Functional Programming','Exploring functional programming paradigms and languages','2024-12-02 16:51:05','2024-12-02 16:51:05'),(29,'Low-Code/No-Code Development','Platforms and tools for rapid application development','2024-12-02 16:51:05','2024-12-02 16:51:05'),(30,'API Design and Management','Best practices in API design, versioning, and lifecycle management','2024-12-02 16:51:05','2024-12-02 16:51:05'),(31,'Distributed Systems','Architectures and challenges in building distributed systems','2024-12-02 16:51:05','2024-12-02 16:51:05'),(32,'Natural Language Processing','AI techniques for processing and understanding human language','2024-12-02 16:51:05','2024-12-02 16:51:05'),(33,'Computer Vision','AI applications in image and video analysis','2024-12-02 16:51:05','2024-12-02 16:51:05'),(34,'Embedded Systems','Development and optimization of embedded software and hardware','2024-12-02 16:51:05','2024-12-02 16:51:05'),(35,'Agile and DevOps','Methodologies and tools for agile development and DevOps practices','2024-12-02 16:51:05','2024-12-02 16:51:05'),(36,'UI/UX Design','Principles and techniques for creating effective user interfaces and experiences','2024-12-02 16:51:05','2024-12-02 16:51:05'),(37,'Parallel Computing','Techniques and technologies for parallel and concurrent processing','2024-12-02 16:51:05','2024-12-02 16:51:05'),(38,'Network Security','Advanced topics in securing computer networks and communications','2024-12-02 16:51:05','2024-12-02 16:51:05'),(39,'Data Visualization','Tools and techniques for effectively visualizing complex datasets','2024-12-02 16:51:05','2024-12-02 16:51:05'),(40,'Ethical Hacking','Exploring cybersecurity from an offensive security perspective','2024-12-02 16:51:05','2024-12-02 16:51:05');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_likes`
--

DROP TABLE IF EXISTS `comment_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `comment_id` int NOT NULL,
  `type` enum('like','dislike') DEFAULT 'like',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `comment_likes_users_user_id_FK` (`user_id`),
  KEY `comment_likes_comments_comment_id_FK` (`comment_id`),
  KEY `idx_comment_likes_type` (`type`),
  CONSTRAINT `comment_likes_comments_comment_id_FK` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_likes_users_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_likes`
--

LOCK TABLES `comment_likes` WRITE;
/*!40000 ALTER TABLE `comment_likes` DISABLE KEYS */;
INSERT INTO `comment_likes` VALUES (1,1,1,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(2,1,2,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(3,1,3,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(4,2,2,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(5,2,3,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(6,2,4,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(7,3,1,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(8,3,3,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(9,3,5,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(10,4,2,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(11,4,4,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(12,4,6,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(13,5,3,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(14,5,5,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(15,5,7,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(16,6,4,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(17,6,6,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(18,6,8,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(19,7,5,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(20,7,7,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(21,7,9,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(22,8,6,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(23,8,8,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(24,8,10,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(25,9,7,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(26,9,9,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(27,9,11,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(28,10,8,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(29,10,10,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(30,10,12,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(31,11,9,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(32,11,11,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(33,11,13,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(34,12,10,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(35,12,12,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(36,12,14,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(37,13,11,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(38,13,13,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(39,13,15,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(40,14,12,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(41,14,14,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(42,14,16,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(43,15,13,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(44,15,15,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(45,15,17,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(46,16,31,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(47,17,31,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(48,18,31,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(49,19,32,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(50,20,32,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(51,21,32,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(52,22,33,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(53,23,33,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(54,24,33,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(55,25,34,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(56,26,34,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(57,27,34,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(58,28,35,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(59,29,35,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(60,30,35,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(61,1,36,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(62,2,36,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(63,3,36,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(64,4,37,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(65,5,37,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(66,6,37,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(67,7,38,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(68,8,38,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(69,9,38,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(70,10,39,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(71,11,39,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(72,12,39,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(73,13,40,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(74,14,40,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(75,15,40,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(76,16,41,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(77,17,41,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(78,18,41,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(79,19,42,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(80,20,42,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(81,21,42,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(82,22,43,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(83,23,43,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(84,24,43,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(85,25,44,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(86,26,44,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(87,27,44,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(88,28,45,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(89,29,45,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(90,30,45,'like','2024-12-02 16:51:05','2024-12-02 16:51:05');
/*!40000 ALTER TABLE `comment_likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `increase_rating_on_like_comments` AFTER INSERT ON `comment_likes` FOR EACH ROW BEGIN
    IF NEW.type = 'like' THEN
        UPDATE users
        SET rating = rating + 1
        WHERE id = (SELECT user_id FROM comments WHERE id = NEW.comment_id);

        UPDATE comments
        SET rating = rating + 1
        WHERE id = NEW.comment_id;

        UPDATE posts
        SET rating = rating + 1
        WHERE id = (SELECT post_id FROM comments WHERE id = NEW.comment_id);
    ELSEIF NEW.type = 'dislike' THEN
        UPDATE users
        SET rating = rating - 1
        WHERE id = (SELECT user_id FROM comments WHERE id = NEW.comment_id);

        UPDATE comments
        SET rating = rating - 1
        WHERE id = NEW.comment_id;

        UPDATE posts
        SET rating = rating - 1
        WHERE id = (SELECT post_id FROM comments WHERE id = NEW.comment_id);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `switch_like_dislike_comments` AFTER UPDATE ON `comment_likes` FOR EACH ROW BEGIN
    IF OLD.type = 'like' AND NEW.type = 'dislike' THEN
        UPDATE users
        SET rating = rating - 2
        WHERE id = (SELECT user_id FROM comments WHERE id = NEW.comment_id);

        UPDATE comments
        SET rating = rating - 2
        WHERE id = NEW.comment_id;

        UPDATE posts
        SET rating = rating - 2
        WHERE id = (SELECT post_id FROM comments WHERE id = NEW.comment_id);
    ELSEIF OLD.type = 'dislike' AND NEW.type = 'like' THEN
        UPDATE users
        SET rating = rating + 2
        WHERE id = (SELECT user_id FROM comments WHERE id = NEW.comment_id);

        UPDATE comments
        SET rating = rating + 2
        WHERE id = NEW.comment_id;

        UPDATE posts
        SET rating = rating + 2
        WHERE id = (SELECT post_id FROM comments WHERE id = NEW.comment_id);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `decrease_rating_on_delete_like_comments` AFTER DELETE ON `comment_likes` FOR EACH ROW BEGIN
    IF OLD.type = 'like' THEN
        UPDATE users
        SET rating = rating - 1
        WHERE id = (SELECT user_id FROM comments WHERE id = OLD.comment_id);

        UPDATE comments
        SET rating = rating - 1
        WHERE id = OLD.comment_id;

        UPDATE posts
        SET rating = rating - 1
        WHERE id = (SELECT post_id FROM comments WHERE id = OLD.comment_id);
    ELSEIF OLD.type = 'dislike' THEN
        UPDATE users
        SET rating = rating + 1
        WHERE id = (SELECT user_id FROM comments WHERE id = OLD.comment_id);

        UPDATE comments
        SET rating = rating + 1
        WHERE id = OLD.comment_id;

        UPDATE posts
        SET rating = rating + 1
        WHERE id = (SELECT post_id FROM comments WHERE id = OLD.comment_id);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `parent_comment_id` int DEFAULT NULL,
  `content` mediumtext NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `rating` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `comments_users_user_id_FK` (`user_id`),
  KEY `comments_posts_post_id_FK` (`post_id`),
  KEY `comments_parent_comment_id_FK` (`parent_comment_id`),
  KEY `idx_comments_status` (`status`),
  CONSTRAINT `comments_parent_comment_id_FK` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_posts_post_id_FK` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_users_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,2,1,NULL,'Great question! I\'d recommend working on some real-world projects. Maybe try building a web scraper or a simple API?','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(2,3,1,NULL,'Codecademy has some excellent Python courses that really helped me level up my skills.','active',3,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(3,4,2,NULL,'As a beginner, I found Vue.js to be the most approachable. The documentation is excellent!','active',2,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(4,5,2,NULL,'React has a steeper learning curve but it\'s widely used in the industry. Might be worth the initial struggle.','active',3,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(5,6,3,NULL,'Think of joins as a way to combine tables based on related columns. Inner joins keep matching rows, left joins keep all rows from the left table, etc.','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(6,7,3,NULL,'Here\'s a visual explanation that helped me understand joins: [link to visual guide]','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(7,8,4,NULL,'Make sure you\'re closing resources properly and consider using try-with-resources for automatic resource management.','active',3,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(8,9,4,NULL,'The Java Garbage Collector usually handles memory well, but you might want to look into profiling tools to identify leaks.','active',3,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(9,10,5,NULL,'The official React documentation is actually a great place to start. They have an excellent tutorial.','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(10,1,5,NULL,'I\'d recommend having a solid understanding of JavaScript, especially ES6 features, before diving into React.','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(11,2,6,NULL,'Docker is great for creating consistent development environments. It lets you package your app with all its dependencies.','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(12,3,6,NULL,'I use Docker to ensure my app runs the same way on my machine and in production. It\'s a game-changer for deployment.','active',3,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(13,4,7,NULL,'Cloud computing can significantly reduce upfront infrastructure costs. It\'s great for scalability too.','active',3,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(14,5,7,NULL,'Consider factors like data privacy regulations in your region before moving to the cloud.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(15,6,8,NULL,'Think of blockchain as a distributed ledger. Every transaction is recorded and verified by multiple parties, making it very secure.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(16,7,8,NULL,'Unlike traditional databases, blockchain is decentralized. No single entity has control over the entire chain.','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(17,8,9,NULL,'TDD helps catch bugs early in the development process. It also encourages you to write more modular, testable code.','inactive',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(18,9,9,NULL,'Start small with unit tests for individual functions. Gradually incorporate TDD into your workflow as you get comfortable with it.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(19,10,10,NULL,'NumPy and Pandas are essential for data manipulation. For visualization, start with Matplotlib and Seaborn.','inactive',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(20,11,10,NULL,'Don\'t forget about Scikit-learn for machine learning tasks. It\'s a great library to start with.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(21,12,11,NULL,'Indexing is crucial for large datasets. Make sure you have appropriate indexes on columns used in WHERE, JOIN, and ORDER BY clauses.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(22,13,11,NULL,'Consider partitioning your tables if you\'re dealing with really large amounts of data. It can significantly improve query performance.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(23,14,12,NULL,'Always use HTTPS and implement proper authentication. JWT (JSON Web Tokens) is a popular choice for API authentication.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(24,15,12,NULL,'Don\'t forget about rate limiting to prevent abuse of your API. Also, validate and sanitize all input to prevent injection attacks.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(25,1,13,NULL,'MongoDB is great for flexible, document-based data models. It\'s easier to scale horizontally.','inactive',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(26,2,13,NULL,'Cassandra is better for scenarios requiring high write throughput and where data is naturally partitioned.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(27,3,14,NULL,'Follow the DRY (Don\'t Repeat Yourself) principle. Extract repeated code into reusable functions or classes.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(28,4,14,NULL,'Meaningful variable and function names go a long way in making code readable. Don\'t be afraid of longer, more descriptive names.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(29,5,15,NULL,'Jenkins is a popular, open-source CI/CD tool that\'s relatively easy to set up. GitHub Actions is another good option if you\'re using GitHub.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(30,6,15,NULL,'Start with automating your build and test processes. Once that\'s stable, you can move on to automated deployments.','inactive',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(31,11,16,NULL,'When designing RESTful APIs, always use nouns for resource names and rely on HTTP methods for actions. For example, use POST /users to create a user, not GET /createUser.','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(32,12,16,NULL,'I highly recommend using tools like Swagger or OpenAPI for documenting your APIs. They make it easy to keep documentation up-to-date and even generate client libraries.','active',3,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(33,13,17,NULL,'Start with the basics of linear algebra and statistics. These are fundamental to understanding many machine learning algorithms.','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(34,14,17,NULL,'Python is definitely the way to go for machine learning. Start with scikit-learn for classical ML algorithms, then move on to TensorFlow or PyTorch for deep learning.','active',3,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(35,15,18,NULL,'Microservices are great for large, complex applications that need to scale independently. For smaller projects, the overhead of microservices might not be worth it.','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(36,1,18,NULL,'One big advantage of microservices is the ability to use different technologies for different services. This can be great for adopting new technologies gradually.','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(37,2,19,NULL,'Always sanitize user inputs to prevent XSS attacks. Libraries like DOMPurify can be really helpful for this.','active',3,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(38,3,19,NULL,'Implement strong password policies and consider using multi-factor authentication for sensitive operations.','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(39,4,20,NULL,'Proper indexing is crucial for database performance. Analyze your most common queries and create indexes based on those.','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(40,5,20,NULL,'Consider using database-specific features like PostgreSQL\'s EXPLAIN ANALYZE to understand query performance and optimize accordingly.','active',3,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(41,6,21,NULL,'Multi-stage builds in Docker can significantly reduce your final image size. It\'s a must-learn technique for optimizing Docker workflows.','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(42,7,21,NULL,'For complex applications, Docker Compose is a lifesaver. It makes managing multi-container applications so much easier.','active',3,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(43,8,22,NULL,'Lazy loading images can have a huge impact on initial page load times, especially for image-heavy sites.','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(44,9,22,NULL,'Don\'t forget about server-side rendering for improved initial load performance and SEO benefits.','active',3,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(45,10,23,NULL,'JWT (JSON Web Tokens) are great for SPA authentication. Just make sure to store them securely and handle token renewal properly.','active',1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(46,11,23,NULL,'Consider using OAuth 2.0 with PKCE for secure authentication in SPAs, especially if you\'re dealing with third-party services.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(47,12,24,NULL,'One of the biggest advantages of serverless is the potential for cost savings, especially for applications with variable traffic.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(48,13,24,NULL,'Cold starts can be a real issue with serverless. Consider keeping your functions \"warm\" for critical paths in your application.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(49,14,25,NULL,'GraphQL is fantastic for mobile applications where bandwidth is a concern. It allows clients to request exactly the data they need.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(50,15,25,NULL,'While GraphQL is powerful, REST can be simpler to implement and might be a better choice for smaller projects or when working with external APIs that are already REST-based.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(51,1,26,NULL,'Spring Boot is fantastic for building microservices. The Spring Cloud suite provides great tools for service discovery, config management, and more.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(52,2,27,NULL,'Containerization is key for ML model deployment. It ensures consistency across development and production environments.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(53,3,28,NULL,'Socket.IO is a great library for implementing WebSockets. It provides fallbacks for browsers that don\'t support WebSockets natively.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(54,4,29,NULL,'Solidity is the go-to language for Ethereum smart contract development. Definitely worth learning if you\'re interested in blockchain.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(55,5,30,NULL,'Automated linting and formatting tools like ESLint and Prettier can greatly improve code review efficiency by catching style issues automatically.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(56,6,31,NULL,'Fastlane is an excellent tool for automating iOS and Android deployments. It can save tons of time in the CI/CD process.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(57,7,32,NULL,'Implementing a service mesh like Istio can greatly simplify security in a microservices architecture.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(58,8,33,NULL,'React.memo and useMemo are powerful tools for optimizing React performance. Just be careful not to overuse them.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(59,9,34,NULL,'Apache Kafka is a robust choice for implementing event-driven architectures. It\'s particularly good for high-throughput systems.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(60,10,35,NULL,'NLTK and spaCy are two excellent libraries for NLP in Python. spaCy is generally faster, while NLTK has a wider range of algorithms implemented.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(61,1,1,1,'I agree with the previous comments. Also, try contributing to open-source projects. It\'s a great way to learn and get feedback.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(62,2,2,4,'I think starting with Vue.js is a good idea. It\'s simpler and you can always move to React or Angular later.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(63,3,3,6,'Another tip for understanding joins is to practice with real datasets. Try joining tables from a sample database.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(64,4,4,8,'In addition to profiling tools, consider using memory leak detection tools like VisualVM or YourKit.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(65,5,5,10,'Before starting with React, make sure you are comfortable with JavaScript ES6 features like arrow functions, classes, and modules.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(66,6,6,12,'Docker also helps in isolating your application from the host environment, making it easier to manage dependencies.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(67,1,16,31,'Great point about using nouns for resource names. It\'s a common mistake to see verb-based endpoints in RESTful APIs.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(68,2,17,33,'Any specific resources you\'d recommend for learning the math behind machine learning?','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(69,3,18,35,'How do you handle data consistency across microservices? That\'s been a challenge for our team.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(70,4,19,37,'DOMPurify is great! We\'ve also had success with the OWASP Java HTML Sanitizer for backend sanitization.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(71,5,20,40,'EXPLAIN ANALYZE is indeed super helpful. For MySQL users, the equivalent EXPLAIN can be just as useful.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(72,11,26,51,'Have you tried Quarkus? It\'s a promising alternative to Spring Boot, especially for microservices.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(73,12,27,52,'Any thoughts on using Kubernetes for orchestrating ML model deployments?','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(74,13,28,53,'How do you handle scaling WebSocket connections? We\'ve run into issues with large numbers of concurrent connections.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(75,14,29,54,'Truffle is a great development framework for Ethereum. It makes testing and deploying smart contracts much easier.','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(76,15,30,55,'We\'ve found that having a code review checklist helps ensure consistency across reviews. Do you use anything similar?','active',0,'2024-12-02 16:51:05','2024-12-02 16:51:05');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_posts`
--

DROP TABLE IF EXISTS `favorite_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `favorites_user_post_unique` (`user_id`,`post_id`),
  KEY `favorites_posts_post_id_FK` (`post_id`),
  CONSTRAINT `favorites_posts_post_id_FK` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_users_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_posts`
--

LOCK TABLES `favorite_posts` WRITE;
/*!40000 ALTER TABLE `favorite_posts` DISABLE KEYS */;
INSERT INTO `favorite_posts` VALUES (1,1,2,'2024-12-02 16:51:05'),(2,1,5,'2024-12-02 16:51:05'),(3,1,8,'2024-12-02 16:51:05'),(4,2,1,'2024-12-02 16:51:05'),(5,2,3,'2024-12-02 16:51:05'),(6,2,6,'2024-12-02 16:51:05'),(7,3,4,'2024-12-02 16:51:05'),(8,3,7,'2024-12-02 16:51:05'),(9,3,10,'2024-12-02 16:51:05'),(10,5,11,'2024-12-02 16:51:05'),(11,5,13,'2024-12-02 16:51:05'),(12,5,14,'2024-12-02 16:51:05'),(13,6,1,'2024-12-02 16:51:05'),(14,6,10,'2024-12-02 16:51:05'),(15,8,3,'2024-12-02 16:51:05'),(16,8,8,'2024-12-02 16:51:05'),(17,8,13,'2024-12-02 16:51:05'),(18,9,4,'2024-12-02 16:51:05'),(19,9,9,'2024-12-02 16:51:05'),(20,9,14,'2024-12-02 16:51:05'),(21,10,5,'2024-12-02 16:51:05'),(22,10,10,'2024-12-02 16:51:05'),(23,10,15,'2024-12-02 16:51:05'),(24,11,16,'2024-12-02 16:51:05'),(25,11,17,'2024-12-02 16:51:05'),(26,11,18,'2024-12-02 16:51:05'),(27,12,19,'2024-12-02 16:51:05'),(28,12,20,'2024-12-02 16:51:05'),(29,12,21,'2024-12-02 16:51:05'),(30,13,22,'2024-12-02 16:51:05'),(31,13,23,'2024-12-02 16:51:05'),(32,13,24,'2024-12-02 16:51:05'),(33,14,25,'2024-12-02 16:51:05'),(34,14,26,'2024-12-02 16:51:05'),(35,14,27,'2024-12-02 16:51:05'),(36,15,28,'2024-12-02 16:51:05'),(37,15,29,'2024-12-02 16:51:05'),(38,15,30,'2024-12-02 16:51:05'),(39,1,31,'2024-12-02 16:51:05'),(40,1,32,'2024-12-02 16:51:05'),(41,1,33,'2024-12-02 16:51:05'),(42,2,34,'2024-12-02 16:51:05'),(43,2,35,'2024-12-02 16:51:05'),(44,2,36,'2024-12-02 16:51:05'),(45,3,37,'2024-12-02 16:51:05'),(46,3,38,'2024-12-02 16:51:05'),(47,3,39,'2024-12-02 16:51:05'),(48,4,40,'2024-12-02 16:51:05');
/*!40000 ALTER TABLE `favorite_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_files`
--

DROP TABLE IF EXISTS `post_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `post_files_posts_post_id_FK` (`post_id`),
  CONSTRAINT `post_files_posts_post_id_FK` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_files`
--

LOCK TABLES `post_files` WRITE;
/*!40000 ALTER TABLE `post_files` DISABLE KEYS */;
INSERT INTO `post_files` VALUES (1,1,'3cda95bd-ad25-410e-881a-9b8db62717f5.pdf','2024-12-02 16:51:05','2024-12-02 16:51:05'),(2,1,'024255f9-6d3a-45ba-ae17-6c6d1030e068.png','2024-12-02 16:51:05','2024-12-02 16:51:05'),(3,2,'7adb471b-d15d-4b9a-ad21-79070eb10f7f.png','2024-12-02 16:51:05','2024-12-02 16:51:05'),(4,2,'8d470f5c-ede4-45e2-9c8a-83cbeb10b5b2.png','2024-12-02 16:51:05','2024-12-02 16:51:05'),(5,3,'30dee164-42ef-4b49-9921-717a450b5f7d.png','2024-12-02 16:51:05','2024-12-02 16:51:05'),(6,4,'8a08e7b9-c9dc-4d30-975a-547462570fa6.png','2024-12-02 16:51:05','2024-12-02 16:51:05'),(7,5,'7f2e3332-bad4-4978-8ab8-21bb7851b258.png','2024-12-02 16:51:05','2024-12-02 16:51:05'),(8,6,'0549bdce-a192-41cc-b337-38f559c6ce99.jpg','2024-12-02 16:51:05','2024-12-02 16:51:05'),(9,8,'df78c964-860d-45f8-87bf-a251a814e23f.png','2024-12-02 16:51:05','2024-12-02 16:51:05'),(10,9,'577d7ed2-0a7a-42ea-be25-5fe97ea85c52.png','2024-12-02 16:51:05','2024-12-02 16:51:05'),(11,10,'c9ed3f8a-8a00-490d-b0eb-a140cee60e8a.png','2024-12-02 16:51:05','2024-12-02 16:51:05'),(12,11,'47d53e7b-4abc-4bae-b517-d19f53a20a5c.png','2024-12-02 16:51:05','2024-12-02 16:51:05'),(13,12,'f6415990-4d5d-49f2-ae47-3e559215122d.png','2024-12-02 16:51:05','2024-12-02 16:51:05'),(14,12,'fff705cb-3eb7-4c9a-9467-8f79e915bd49.jpg','2024-12-02 16:51:05','2024-12-02 16:51:05'),(15,13,'d5c84e0e-0a87-4280-b3fd-a5ce75e138e1.png','2024-12-02 16:51:05','2024-12-02 16:51:05'),(16,15,'5855a11a-0b4d-4b16-9f7b-4d9a2dd10c5e.png','2024-12-02 16:51:05','2024-12-02 16:51:05');
/*!40000 ALTER TABLE `post_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `content` mediumtext NOT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `posts_users_user_id_FK` (`user_id`),
  KEY `idx_posts_status` (`status`),
  KEY `idx_posts_created_at` (`created_at`),
  CONSTRAINT `posts_users_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'How can I improve my Python skills?','active','<p>I\'ve been learning Python for a few months but feel stuck. Any tips on resources or projects I should try to take my skills to the next level?</p><ul><li>Online courses I\'ve tried</li><li>Books I\'ve read</li><li>Small projects I\'ve completed</li></ul><p>I\'m particularly interested in data analysis and web development with Python. Any guidance would be appreciated!</p>',9,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(2,2,'What are the best JavaScript frameworks for beginners?','active','<h2>JavaScript Frameworks for Beginners</h2><p>I\'m new to web development and want to know which JavaScript frameworks are beginner-friendly. I\'ve heard about React, Vue, and Angular, but I\'m not sure where to start.</p><ol><li>React</li><li>Vue.js</li><li>Angular</li><li>Svelte</li></ol><p>What are the pros and cons of each for a beginner? Which one has the best learning resources?</p>',13,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(3,3,'Can someone explain SQL joins to me?','active','<h3>SQL Joins Explained</h3><p>I\'m having a hard time understanding how SQL joins work. Can anyone provide a clear explanation with some practical examples?</p><pre><code>SELECT * FROM table1 JOIN table2 ON table1.id = table2.id;</code></pre><p>I\'m particularly confused about the differences between INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN. A visual explanation would be really helpful!</p>',10,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(4,4,'Help with Java memory management issues','active','<h2>Java Memory Management Issues</h2><p>I keep facing memory management problems in Java. How can I tackle this effectively? Are there any best practices or tools I should be aware of?</p><ul><li>Heap vs Stack</li><li>Garbage Collection</li><li>Memory Leaks</li><li>OutOfMemoryError</li></ul><p>I\'d appreciate any tips on profiling tools or techniques to identify and resolve these issues.</p>',14,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(5,5,'How do I get started with React?','active','<h1>Getting Started with React</h1><p>I want to learn React but don\'t know where to begin. Any suggestions for good tutorials or courses? What prerequisites should I have before diving in?</p><ol><li>JavaScript fundamentals</li><li>ES6 features</li><li>Basic HTML and CSS</li></ol><p>Are there any specific projects you\'d recommend for a beginner to build while learning React?</p>',6,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(6,5,'What is Docker and how can it help me?','active','<h2>Understanding Docker and Its Benefits</h2><p>I\'ve heard a lot about Docker but don\'t really understand what it is or how to use it. Can someone explain its benefits and provide some use cases?</p><ul><li>What exactly is containerization?</li><li>How does Docker differ from virtual machines?</li><li>What are the main advantages of using Docker?</li><li>Are there any specific industries or project types where Docker excels?</li></ul><p>I\'d appreciate any real-world examples or beginner-friendly resources to help me get started with Docker.</p>',6,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(7,7,'Is cloud computing worth the investment?','active','<h2>Evaluating Cloud Computing for Projects</h2><p>I\'m considering cloud services for my projects. Is it worth the cost? What are the pros and cons compared to traditional hosting?</p><table><tr><th>Cloud Computing</th><th>Traditional Hosting</th></tr><tr><td>Scalability</td><td>Fixed Resources</td></tr><tr><td>Pay-as-you-go</td><td>Fixed Costs</td></tr></table><p>I\'m particularly interested in:</p><ol><li>Cost comparisons for different project sizes</li><li>Performance differences</li><li>Security considerations</li><li>Ease of management and deployment</li></ol><p>Has anyone made the switch from traditional hosting to cloud? What was your experience?</p>',7,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(8,8,'Can someone simplify blockchain technology for me?','active','<h2>Demystifying Blockchain Technology</h2><p>I find blockchain confusing. Can anyone break it down in simple terms? How is it different from traditional databases?</p><h3>Key Concepts:</h3><ul><li>Decentralization</li><li>Immutability</li><li>Transparency</li><li>Consensus Mechanisms</li></ul><p>I\'d appreciate explanations that don\'t assume a deep technical background. Also, are there any good visual resources that explain blockchain?</p><h3>Questions:</h3><ol><li>What problems does blockchain solve?</li><li>What are some non-cryptocurrency applications of blockchain?</li><li>How does blockchain ensure security and trust?</li></ol>',-1,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(9,9,'What are the advantages of Test-Driven Development?','active','<h2>Understanding the Benefits of Test-Driven Development (TDD)</h2><p>I\'ve heard about TDD, but what are its actual benefits in real-world applications? How do I start implementing it in my workflow?</p><h3>Potential Advantages:</h3><ul><li>Improved code quality</li><li>Better design and architecture</li><li>Easier refactoring</li><li>Built-in documentation</li></ul><p>I\'m looking for concrete examples of how TDD has improved projects or development processes. Also, any tips for overcoming the initial hurdles when adopting TDD would be greatly appreciated.</p><h3>Getting Started:</h3><ol><li>How to write effective test cases?</li><li>Recommended tools and frameworks for TDD?</li><li>Balancing TDD with development speed?</li><li>Applying TDD to legacy code?</li></ol>',7,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(10,10,'Which Python libraries are essential for data science?','active','<h2>Essential Python Libraries for Data Science</h2><p>I want to delve into data science using Python. Which libraries should I focus on learning first? Any recommendations for good resources?</p><h3>Popular Libraries:</h3><ul><li>NumPy</li><li>Pandas</li><li>Matplotlib</li><li>Scikit-learn</li><li>TensorFlow or PyTorch</li></ul><p>I\'m looking for explanations of what each library is best used for, and possibly some simple code examples to get started.</p><h3>Learning Path:</h3><ol><li>Which order should I learn these libraries in?</li><li>Are there any good online courses or books you\'d recommend?</li><li>How can I practice using these libraries with real-world datasets?</li><li>Any tips for transitioning from data analysis to machine learning?</li></ol>',6,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(11,11,'How to optimize database queries for large datasets?','active','<h2>Optimizing Database Queries for Large Datasets</h2><p>I\'m working with a database that has millions of records. What are some strategies to optimize my queries and improve performance?</p><h3>Areas to Consider:</h3><ul><li>Indexing strategies</li><li>Query optimization techniques</li><li>Database design considerations</li><li>Caching mechanisms</li></ul><p>I\'d appreciate both general tips and specific techniques for different types of databases (e.g., MySQL, PostgreSQL, Oracle).</p><h3>Specific Questions:</h3><ol><li>How do I identify slow queries in my application?</li><li>What tools can I use for query analysis and optimization?</li><li>Are there any query patterns I should avoid with large datasets?</li><li>How does database partitioning help with large datasets?</li></ol>',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(12,12,'Best practices for securing a REST API','inactive','<h2>Securing REST APIs: Best Practices</h2><p>I\'m developing a REST API and want to ensure it\'s secure. What are the best practices for authentication, authorization, and data protection?</p><h3>Key Security Aspects:</h3><ul><li>Authentication methods (e.g., JWT, OAuth)</li><li>Authorization and role-based access control</li><li>HTTPS implementation</li><li>Input validation and sanitization</li><li>Rate limiting and DDoS protection</li></ul><p>I\'m particularly interested in real-world examples and common pitfalls to avoid.</p><h3>Implementation Questions:</h3><ol><li>What are the pros and cons of different authentication methods?</li><li>How should I handle API keys and secrets securely?</li><li>Are there any good security testing tools for REST APIs?</li><li>How can I ensure my API remains secure over time?</li></ol>',2,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(13,13,'Comparing NoSQL databases: MongoDB vs. Cassandra','active','<h2>MongoDB vs. Cassandra: Choosing the Right NoSQL Database</h2><p>I\'m trying to choose between MongoDB and Cassandra for a new project. Can someone explain the pros and cons of each? Which scenarios are they best suited for?</p><table><tr><th>Feature</th><th>MongoDB</th><th>Cassandra</th></tr><tr><td>Data Model</td><td>Document-oriented</td><td>Wide-column store</td></tr><tr><td>Scalability</td><td>Horizontal</td><td>Linear scalability</td></tr><tr><td>Use Cases</td><td>?</td><td>?</td></tr></table><p>I\'d appreciate insights on:</p><ul><li>Performance characteristics</li><li>Ease of use and learning curve</li><li>Community support and ecosystem</li><li>Specific strengths and weaknesses</li></ul><p>Has anyone used both in production? What were your experiences?</p>',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(14,14,'Tips for writing clean and maintainable code','active','<h2>Writing Clean and Maintainable Code: Best Practices</h2><p>I want to improve the quality of my code. What are some tips and best practices for writing clean, maintainable, and easily understandable code?</p><h3>Key Principles:</h3><ul><li>DRY (Don\'t Repeat Yourself)</li><li>SOLID principles</li><li>Meaningful naming conventions</li><li>Proper code organization and structure</li><li>Effective commenting and documentation</li></ul><p>I\'m looking for practical examples and maybe before/after comparisons to illustrate these concepts.</p><h3>Specific Areas of Interest:</h3><ol><li>How to balance code readability with performance?</li><li>Tips for writing self-documenting code</li><li>Best practices for error handling and logging</li><li>How to approach refactoring legacy code?</li></ol><p>Any recommended books or resources on this topic would also be greatly appreciated!</p>',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(15,15,'How to implement CI/CD in a small team?','inactive','<h2>Implementing CI/CD in a Small Team</h2><p>Our small development team wants to implement CI/CD. What are some lightweight tools and practices we can start with? Any gotchas to watch out for?</p><h3>Key Components:</h3><ul><li>Version control best practices</li><li>Automated testing</li><li>Build automation</li><li>Deployment strategies</li></ul><p>We\'re particularly interested in solutions that don\'t require a huge upfront investment in time or resources.</p><h3>Specific Questions:</h3><ol><li>What are some good CI/CD tools for small teams?</li><li>How can we gradually introduce CI/CD practices?</li><li>What metrics should we track to measure the effectiveness of our CI/CD pipeline?</li><li>How do we handle database changes in a CI/CD workflow?</li></ol><p>Any experiences or case studies from other small teams who\'ve successfully implemented CI/CD would be incredibly helpful!</p>',-6,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(16,1,'Understanding RESTful API Design','active','<h2>RESTful API Design Principles</h2><p>I\'m trying to design my first RESTful API and want to ensure I\'m following best practices. Can someone explain the key principles of RESTful design?</p><ul><li>Resource naming conventions</li><li>HTTP methods (GET, POST, PUT, DELETE)</li><li>Status codes</li><li>Authentication methods</li></ul><p>Are there any tools or frameworks you\'d recommend for building and documenting RESTful APIs?</p>',6,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(17,2,'Machine Learning: Where to Start?','active','<h1>Getting Started with Machine Learning</h1><p>I\'m a software developer looking to transition into machine learning. Where should I start?</p><ol><li>Mathematics prerequisites</li><li>Programming languages (Python? R?)</li><li>Key algorithms to learn</li><li>Recommended courses or books</li></ol><p>I\'d also love to hear about your journey into machine learning and any advice you have for beginners.</p>',10,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(18,3,'Microservices vs Monolithic Architecture','active','<h2>Choosing Between Microservices and Monolithic Architecture</h2><p>I\'m designing a new application and trying to decide between a microservices architecture and a monolithic one. What are the pros and cons of each?</p><table><tr><th>Microservices</th><th>Monolithic</th></tr><tr><td>Scalability</td><td>Simplicity</td></tr><tr><td>Technology Diversity</td><td>Easier Deployment</td></tr></table><p>In what scenarios would you recommend one over the other?</p>',4,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(19,4,'Securing Web Applications: Best Practices','active','<h1>Web Application Security Best Practices</h1><p>As cyber threats continue to evolve, what are the current best practices for securing web applications?</p><ul><li>HTTPS implementation</li><li>Cross-Site Scripting (XSS) prevention</li><li>SQL injection protection</li><li>Authentication and authorization</li></ul><p>Are there any security frameworks or tools you\'d recommend for different programming languages or frameworks?</p>',10,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(20,5,'Optimizing Database Performance','active','<h2>Strategies for Database Performance Optimization</h2><p>I\'m working on a project with a large database, and queries are starting to slow down. What strategies can I use to optimize database performance?</p><ol><li>Indexing best practices</li><li>Query optimization techniques</li><li>Caching strategies</li><li>Database scaling options</li></ol><p>Has anyone had experience with database sharding or read replicas? I\'d love to hear about real-world implementations.</p>',6,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(21,6,'Containerization with Docker: Tips and Tricks','active','<h2>Docker Containerization Best Practices</h2><p>I\'ve started using Docker for my projects, but I feel like I\'m not using it to its full potential. What are some advanced tips and tricks for Docker?</p><ul><li>Optimizing Dockerfiles</li><li>Multi-stage builds</li><li>Docker Compose for complex applications</li><li>Docker networking</li></ul><p>I\'d also love to hear about your experiences with orchestration tools like Kubernetes.</p>',6,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(22,7,'Frontend Performance Optimization Techniques','active','<h1>Boosting Frontend Performance</h1><p>What are the latest techniques for optimizing frontend performance? I want to ensure my web applications are as fast and responsive as possible.</p><ol><li>Lazy loading</li><li>Code splitting</li><li>Caching strategies</li><li>Image optimization</li></ol><p>Are there any tools you recommend for measuring and monitoring frontend performance?</p>',10,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(23,8,'Implementing Authentication in Single Page Applications','active','<h2>SPA Authentication Strategies</h2><p>I\'m building a Single Page Application (SPA) and need to implement user authentication. What are the best practices for SPA authentication?</p><ul><li>JWT vs. session-based auth</li><li>OAuth 2.0 and OpenID Connect</li><li>Handling token storage and renewal</li><li>CSRF protection in SPAs</li></ul><p>Has anyone implemented passwordless authentication in an SPA? I\'d be interested in hearing about your experience.</p>',3,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(24,9,'Serverless Architecture: Pros and Cons','active','<h1>Exploring Serverless Architecture</h1><p>I\'m considering moving some of our services to a serverless architecture. What are the main advantages and disadvantages of going serverless?</p><table><tr><th>Pros</th><th>Cons</th></tr><tr><td>Scalability</td><td>Cold Starts</td></tr><tr><td>Cost-effective</td><td>Vendor Lock-in</td></tr></table><p>If you\'ve migrated to serverless, what challenges did you face and how did you overcome them?</p>',2,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(25,10,'GraphQL vs REST: When to Use Which?','active','<h2>Choosing Between GraphQL and REST</h2><p>I\'m designing a new API and trying to decide between GraphQL and REST. In what scenarios would you recommend one over the other?</p><ul><li>Data fetching efficiency</li><li>Learning curve</li><li>Caching</li><li>Versioning</li></ul><p>For those who have used both, what were the main differences in terms of development experience and client-side integration?</p>',6,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(26,11,'Implementing Microservices with Spring Boot','active','<h1>Building Microservices using Spring Boot</h1><p>I\'m planning to build a microservices-based application using Spring Boot. What are some best practices and common pitfalls to avoid?</p><ol><li>Service discovery</li><li>Inter-service communication</li><li>Centralized configuration</li><li>Distributed tracing</li></ol><p>Has anyone used Spring Cloud? How does it compare to other microservices frameworks?</p>',2,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(27,12,'Machine Learning Model Deployment Strategies','active','<h2>Deploying Machine Learning Models in Production</h2><p>What are the best practices for deploying machine learning models in a production environment? I\'m particularly interested in strategies for model versioning and A/B testing.</p><ul><li>Containerization of ML models</li><li>Model serving frameworks</li><li>Monitoring model performance</li><li>Handling model updates</li></ul><p>If you\'ve deployed ML models at scale, what challenges did you face and how did you address them?</p>',6,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(28,13,'Implementing Real-time Features with WebSockets','active','<h1>Building Real-time Applications with WebSockets</h1><p>I want to add real-time features to my web application. What are the best practices for implementing WebSockets?</p><ol><li>Choosing a WebSocket library</li><li>Scaling WebSocket connections</li><li>Handling connection drops</li><li>Security considerations</li></ol><p>Has anyone compared WebSockets to other real-time technologies like Server-Sent Events or Long Polling?</p>',2,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(29,14,'Blockchain Development: Where to Start?','active','<h2>Getting Started with Blockchain Development</h2><p>I\'m interested in blockchain development but don\'t know where to begin. What languages and tools should I focus on?</p><ul><li>Ethereum and Solidity</li><li>Hyperledger Fabric</li><li>Smart contract development</li><li>Decentralized application (DApp) architectures</li></ul><p>Are there any good resources or courses you\'d recommend for someone new to blockchain development?</p>',2,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(30,15,'Best Practices for Code Review','active','<h1>Effective Code Review Techniques</h1><p>What are your best practices for conducting effective code reviews? I want to ensure our team is getting the most out of our review process.</p><ol><li>Automated checks vs. manual review</li><li>Code review checklists</li><li>Giving constructive feedback</li><li>Handling disagreements</li></ol><p>How do you balance thoroughness with keeping the development process moving quickly?</p>',6,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(31,1,'Implementing CI/CD for Mobile App Development','active','<h2>CI/CD Pipelines for Mobile Apps</h2><p>I\'m looking to set up a CI/CD pipeline for our mobile app development. What are some recommended tools and best practices?</p><ul><li>iOS vs. Android considerations</li><li>Automated testing for mobile apps</li><li>Beta distribution</li><li>App store submission automation</li></ul><p>If you\'ve implemented CI/CD for mobile apps, what were the main challenges you faced?</p>',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(32,2,'Securing Microservices Architecture','active','<h1>Security in Microservices</h1><p>What are the key security considerations when implementing a microservices architecture? How do they differ from monolithic application security?</p><ol><li>Service-to-service authentication</li><li>API gateways and security</li><li>Secrets management</li><li>Monitoring and logging in distributed systems</li></ol><p>Has anyone implemented a zero-trust security model in a microservices environment?</p>',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(33,3,'Optimizing React Application Performance','active','<h2>React Performance Optimization Techniques</h2><p>I\'m working on a large-scale React application and noticing some performance issues. What are some effective ways to optimize React app performance?</p><ul><li>Memoization techniques</li><li>Virtual DOM optimization</li><li>Code splitting and lazy loading</li><li>State management optimization</li></ul><p>Are there any tools you recommend for profiling and identifying performance bottlenecks in React apps?</p>',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(34,4,'Implementing Event-Driven Architecture','active','<h1>Building Event-Driven Systems</h1><p>I\'m interested in implementing an event-driven architecture for our next project. What are the key principles and best practices to follow?</p><ol><li>Choosing a message broker</li><li>Event schema design</li><li>Handling event ordering and idempotency</li><li>Error handling and dead letter queues</li></ol><p>If you\'ve built event-driven systems, what were the main benefits and challenges you encountered?</p>',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(35,5,'Machine Learning for Natural Language Processing','active','<h2>Getting Started with NLP and Machine Learning</h2><p>I want to explore machine learning techniques for natural language processing. Where should I start, and what are some good projects for beginners?</p><ul><li>Key NLP concepts</li><li>Popular NLP libraries</li><li>Pre-trained models vs. training from scratch</li><li>Ethical considerations in NLP</li></ul><p>Has anyone worked on interesting NLP projects they\'d like to share?</p>',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(36,6,'Implementing Dark Mode in Web Applications','active','<h1>Dark Mode Implementation Strategies</h1><p>What are the best practices for implementing dark mode in web applications? I want to ensure a smooth transition and maintain accessibility.</p><ol><li>CSS variables vs. separate stylesheets</li><li>Handling user preferences</li><li>Image and media considerations</li><li>Testing dark mode implementations</li></ol><p>Have you implemented dark mode in a large-scale application? What challenges did you face?</p>',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(37,7,'Scaling PostgreSQL for High Traffic Applications','active','<h2>PostgreSQL Scaling Techniques</h2><p>Our application is experiencing rapid growth, and we need to scale our PostgreSQL database. What are some effective strategies for scaling PostgreSQL?</p><ul><li>Read replicas and load balancing</li><li>Partitioning and sharding</li><li>Connection pooling</li><li>Query optimization for scale</li></ul><p>Has anyone successfully implemented a multi-master PostgreSQL setup? I\'d love to hear about your experience.</p>',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(38,8,'Implementing OAuth 2.0 and OpenID Connect','active','<h1>OAuth 2.0 and OpenID Connect Integration</h1><p>I\'m implementing authentication for a new application and want to use OAuth 2.0 and OpenID Connect. What are the best practices and common pitfalls to avoid?</p><ol><li>Choosing the right OAuth 2.0 flow</li><li>Implementing PKCE for mobile and SPA clients</li><li>Handling token storage and renewal</li><li>Integrating with popular identity providers</li></ol><p>Are there any good libraries or tools you recommend for OAuth 2.0 and OpenID Connect implementation?</p>',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(39,9,'Kubernetes vs. Docker Swarm: Which to Choose?','active','<h2>Container Orchestration: Kubernetes vs. Docker Swarm</h2><p>I\'m looking into container orchestration solutions and trying to decide between Kubernetes and Docker Swarm. What are the pros and cons of each?</p><table><tr><th>Kubernetes</th><th>Docker Swarm</th></tr><tr><td>Flexibility</td><td>Simplicity</td></tr><tr><td>Large ecosystem</td><td>Native Docker integration</td></tr></table><p>For those who have used both, in what scenarios would you recommend one over the other?</p>',0,'2024-12-02 16:51:05','2024-12-02 16:51:05'),(40,10,'Implementing Serverless Functions with AWS Lambda','active','<h1>AWS Lambda and Serverless Architecture</h1><p>I\'m new to serverless architecture and want to start using AWS Lambda. What are some best practices and things to watch out for when developing Lambda functions?</p><ul><li>Function sizing and performance optimization</li><li>Handling cold starts</li><li>Serverless frameworks (e.g., Serverless Framework, AWS SAM)</li><li>Monitoring and debugging Lambda functions</li></ul><p>Has anyone migrated a significant portion of their infrastructure to Lambda? How did it impact your development process and costs?</p>',0,'2024-12-02 16:51:05','2024-12-02 16:51:05');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_categories`
--

DROP TABLE IF EXISTS `posts_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `category_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_categories_post_category_unique` (`post_id`,`category_id`),
  KEY `posts_categories_categories_category_id_FK` (`category_id`),
  CONSTRAINT `posts_categories_categories_category_id_FK` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_categories_posts_post_id_FK` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_categories`
--

LOCK TABLES `posts_categories` WRITE;
/*!40000 ALTER TABLE `posts_categories` DISABLE KEYS */;
INSERT INTO `posts_categories` VALUES (1,1,1,'2024-12-02 16:51:05'),(2,1,5,'2024-12-02 16:51:05'),(3,2,2,'2024-12-02 16:51:05'),(4,2,1,'2024-12-02 16:51:05'),(5,3,3,'2024-12-02 16:51:05'),(6,4,1,'2024-12-02 16:51:05'),(7,4,10,'2024-12-02 16:51:05'),(8,5,2,'2024-12-02 16:51:05'),(9,6,6,'2024-12-02 16:51:05'),(10,6,4,'2024-12-02 16:51:05'),(11,8,1,'2024-12-02 16:51:05'),(12,8,3,'2024-12-02 16:51:05'),(13,9,6,'2024-12-02 16:51:05'),(14,10,1,'2024-12-02 16:51:05'),(15,10,5,'2024-12-02 16:51:05'),(16,11,3,'2024-12-02 16:51:05'),(17,11,10,'2024-12-02 16:51:05'),(18,12,2,'2024-12-02 16:51:05'),(19,12,9,'2024-12-02 16:51:05'),(20,13,3,'2024-12-02 16:51:05'),(21,14,1,'2024-12-02 16:51:05'),(22,14,7,'2024-12-02 16:51:05'),(23,15,6,'2024-12-02 16:51:05'),(24,1,18,'2024-12-02 16:51:05'),(25,1,26,'2024-12-02 16:51:05'),(26,2,14,'2024-12-02 16:51:05'),(27,2,26,'2024-12-02 16:51:05'),(28,3,12,'2024-12-02 16:51:05'),(29,3,29,'2024-12-02 16:51:05'),(30,4,27,'2024-12-02 16:51:05'),(31,4,18,'2024-12-02 16:51:05'),(32,5,14,'2024-12-02 16:51:05'),(33,5,26,'2024-12-02 16:51:05'),(34,6,17,'2024-12-02 16:51:05'),(35,6,15,'2024-12-02 16:51:05'),(36,7,4,'2024-12-02 16:51:05'),(37,7,15,'2024-12-02 16:51:05'),(38,8,12,'2024-12-02 16:51:05'),(39,8,21,'2024-12-02 16:51:05'),(40,9,25,'2024-12-02 16:51:05'),(41,9,7,'2024-12-02 16:51:05'),(42,10,11,'2024-12-02 16:51:05'),(43,10,29,'2024-12-02 16:51:05'),(44,12,20,'2024-12-02 16:51:05'),(45,13,12,'2024-12-02 16:51:05'),(46,14,25,'2024-12-02 16:51:05'),(47,15,25,'2024-12-02 16:51:05'),(48,16,20,'2024-12-02 16:51:05'),(49,16,2,'2024-12-02 16:51:05'),(50,17,11,'2024-12-02 16:51:05'),(51,17,5,'2024-12-02 16:51:05'),(52,18,13,'2024-12-02 16:51:05'),(53,18,21,'2024-12-02 16:51:05'),(54,19,11,'2024-12-02 16:51:05'),(55,19,9,'2024-12-02 16:51:05'),(56,20,3,'2024-12-02 16:51:05'),(57,20,12,'2024-12-02 16:51:05'),(58,21,17,'2024-12-02 16:51:05'),(59,21,6,'2024-12-02 16:51:05'),(60,22,2,'2024-12-02 16:51:05'),(61,22,14,'2024-12-02 16:51:05'),(62,23,9,'2024-12-02 16:51:05'),(63,23,2,'2024-12-02 16:51:05'),(64,24,15,'2024-12-02 16:51:05'),(65,24,4,'2024-12-02 16:51:05'),(66,25,16,'2024-12-02 16:51:05'),(67,25,20,'2024-12-02 16:51:05'),(68,26,13,'2024-12-02 16:51:05'),(69,26,6,'2024-12-02 16:51:05'),(70,27,11,'2024-12-02 16:51:05'),(71,27,5,'2024-12-02 16:51:05'),(72,28,2,'2024-12-02 16:51:05'),(73,28,21,'2024-12-02 16:51:05'),(74,29,12,'2024-12-02 16:51:05'),(75,29,2,'2024-12-02 16:51:05'),(76,30,25,'2024-12-02 16:51:05'),(77,30,7,'2024-12-02 16:51:05'),(78,31,25,'2024-12-02 16:51:05'),(79,31,8,'2024-12-02 16:51:05'),(80,32,11,'2024-12-02 16:51:05'),(81,32,13,'2024-12-02 16:51:05'),(82,33,2,'2024-12-02 16:51:05'),(83,33,14,'2024-12-02 16:51:05'),(84,34,21,'2024-12-02 16:51:05'),(85,34,13,'2024-12-02 16:51:05'),(86,35,22,'2024-12-02 16:51:05'),(87,35,11,'2024-12-02 16:51:05'),(88,36,26,'2024-12-02 16:51:05'),(89,36,2,'2024-12-02 16:51:05'),(90,37,3,'2024-12-02 16:51:05'),(91,37,10,'2024-12-02 16:51:05'),(92,38,9,'2024-12-02 16:51:05'),(93,38,20,'2024-12-02 16:51:05'),(94,39,17,'2024-12-02 16:51:05'),(95,39,6,'2024-12-02 16:51:05'),(96,40,15,'2024-12-02 16:51:05'),(97,40,4,'2024-12-02 16:51:05');
/*!40000 ALTER TABLE `posts_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_likes`
--

DROP TABLE IF EXISTS `posts_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `type` enum('like','dislike') DEFAULT 'like',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `posts_likes_users_user_id_FK` (`user_id`),
  KEY `posts_likes_posts_post_id_FK` (`post_id`),
  KEY `idx_posts_likes_type` (`type`),
  CONSTRAINT `posts_likes_posts_post_id_FK` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_likes_users_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_likes`
--

LOCK TABLES `posts_likes` WRITE;
/*!40000 ALTER TABLE `posts_likes` DISABLE KEYS */;
INSERT INTO `posts_likes` VALUES (1,1,2,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(2,1,3,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(3,1,4,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(4,2,1,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(5,2,3,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(6,2,5,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(7,3,1,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(8,3,2,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(9,3,4,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(10,4,2,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(11,4,3,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(12,4,5,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(13,4,15,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(14,5,1,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(15,5,3,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(16,5,4,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(17,6,2,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(18,6,4,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(19,7,1,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(20,7,3,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(21,7,5,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(22,8,2,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(23,8,4,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(24,8,5,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(25,9,1,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(26,9,3,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(27,9,5,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(28,10,2,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(29,10,4,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(30,10,5,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(31,11,6,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(32,11,7,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(33,11,8,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(34,12,7,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(35,12,8,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(36,12,9,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(37,13,8,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(38,13,9,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(39,13,10,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(40,13,15,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(41,14,9,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(42,14,10,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(43,14,11,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(44,14,15,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(45,15,10,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(46,15,11,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(47,15,12,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(48,16,16,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(49,17,16,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(50,18,16,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(51,19,17,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(52,20,17,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(53,21,17,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(54,22,18,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(55,23,18,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(56,24,18,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(57,25,19,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(58,26,19,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(59,27,19,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(60,28,20,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(61,29,20,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(62,30,20,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(63,1,21,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(64,2,21,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(65,3,21,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(66,4,22,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(67,5,22,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(68,6,22,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(69,7,23,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(70,8,23,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(71,9,23,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(72,10,24,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(73,11,24,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(74,12,24,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(75,13,25,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(76,14,25,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(77,15,25,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(78,16,26,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(79,17,26,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(80,18,26,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(81,19,27,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(82,20,27,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(83,21,27,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(84,22,28,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(85,23,28,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(86,24,28,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(87,25,29,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(88,26,29,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(89,27,29,'dislike','2024-12-02 16:51:05','2024-12-02 16:51:05'),(90,28,30,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(91,29,30,'like','2024-12-02 16:51:05','2024-12-02 16:51:05'),(92,30,30,'like','2024-12-02 16:51:05','2024-12-02 16:51:05');
/*!40000 ALTER TABLE `posts_likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `increase_rating_on_like_posts` AFTER INSERT ON `posts_likes` FOR EACH ROW BEGIN
    IF NEW.type = 'like' THEN
        UPDATE users
        SET rating = rating + 2
        WHERE id = (SELECT user_id FROM posts WHERE id = NEW.post_id);

        UPDATE posts
        SET rating = rating + 2
        WHERE id = NEW.post_id;
    ELSEIF NEW.type = 'dislike' THEN
        UPDATE users
        SET rating = rating - 2
        WHERE id = (SELECT user_id FROM posts WHERE id = NEW.post_id);

        UPDATE posts
        SET rating = rating - 2
        WHERE id = NEW.post_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `switch_like_dislike_posts` AFTER UPDATE ON `posts_likes` FOR EACH ROW BEGIN
    IF OLD.type = 'like' AND NEW.type = 'dislike' THEN
        UPDATE users
        SET rating = rating - 4
        WHERE id = (SELECT user_id FROM posts WHERE id = NEW.post_id);

        UPDATE posts
        SET rating = rating - 4
        WHERE id = NEW.post_id;
    ELSEIF OLD.type = 'dislike' AND NEW.type = 'like' THEN
        UPDATE users
        SET rating = rating + 4
        WHERE id = (SELECT user_id FROM posts WHERE id = NEW.post_id);

        UPDATE posts
        SET rating = rating + 4
        WHERE id = NEW.post_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `decrease_rating_on_delete_like_posts` AFTER DELETE ON `posts_likes` FOR EACH ROW BEGIN
    IF OLD.type = 'like' THEN
        UPDATE users
        SET rating = rating - 2
        WHERE id = (SELECT user_id FROM posts WHERE id = OLD.post_id);

        UPDATE posts
        SET rating = rating - 2
        WHERE id = OLD.post_id;
    ELSEIF OLD.type = 'dislike' THEN
        UPDATE users
        SET rating = rating + 2
        WHERE id = (SELECT user_id FROM posts WHERE id = OLD.post_id);

        UPDATE posts
        SET rating = rating + 2
        WHERE id = OLD.post_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `refresh_token` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tokens_users_user_id_FK` (`user_id`),
  CONSTRAINT `tokens_users_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `password` char(60) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `profile_picture_name` varchar(255) DEFAULT 'default-avatar.png',
  `rating` int NOT NULL DEFAULT '0',
  `email_verified` bit(1) NOT NULL DEFAULT b'0',
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_login_uq` (`login`),
  UNIQUE KEY `users_email_uq` (`email`),
  CONSTRAINT `users_chk_1` CHECK (regexp_like(`login`,_utf8mb4'^[a-zA-Z0-9_]{3,30}$',_utf8mb4'c'))
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'tech_guru92','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','John Doe','john.doe@gmail.com','default-avatar.png',10,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(2,'jane_dev','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Jane Smith','jane.smith@gmail.com','default-avatar.png',18,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(3,'alice_admin','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Alice Admin','alice.admin@gmail.com','0ba5c307-25ef-48f7-9369-ac9afb44c3e0.png',17,_binary '','admin','2024-12-02 16:51:05','2024-12-02 16:51:05'),(4,'bob_the_builder','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Bob Brown','bob.brown@gmail.com','default-avatar.png',20,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(5,'charlie_green','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Charlie Green','charlie.green@gmail.com','04ce9bdc-ae08-480b-8ea1-14a2d031971d.png',14,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(6,'dave_admin','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Dave Admin','dave.admin@gmail.com','6aec2dbc-a8e4-4a5a-881c-9f345caeb695.png',4,_binary '','admin','2024-12-02 16:51:05','2024-12-02 16:51:05'),(7,'emma_coder','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Emma White','emma.white@gmail.com','7f7f9ed5-337a-4c98-9ffd-f2e397d87af6.png',15,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(8,'frank_black','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Frank Black','frank.black@gmail.com','0350d3e2-a613-46c2-8b49-336d0d3bb537.png',5,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(9,'grace_blue','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Grace Blue','grace.blue@gmail.com','b0e97330-0482-46f4-8020-56edb594f3c9.png',14,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(10,'henry_dev','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Henry Yellow','den.koleskos@gmail.com','fd976a04-bf88-4fa7-80e2-6ab9b79b7612.png',14,_binary '','admin','2024-12-02 16:51:05','2024-12-02 16:51:05'),(11,'ivy_tester','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Ivy Green','denis.kolesnichenko112@gmail.com','default-avatar.png',3,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(12,'jack_fullstack','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Jack Brown','jack.brown@gmail.com','default-avatar.png',11,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(13,'karen_backend','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Karen White','karen.white@gmail.com','0ba5c307-25ef-48f7-9369-ac9afb44c3e0.png',3,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(14,'leo_frontend','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Leo Gray','leo.gray@gmail.com','default-avatar.png',5,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(15,'mia_designer','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Mia Black','mia.black@gmail.com','0ba5c307-25ef-48f7-9369-ac9afb44c3e0.png',1,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(16,'code_ninja','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Nina Coder','nina.coder@gmail.com','default-avatar.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(17,'data_wizard','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','David Wizard','david.wizard@gmail.com','default-avatar.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(18,'ai_enthusiast','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Anna Intel','anna.intel@gmail.com','0ba5c307-25ef-48f7-9369-ac9afb44c3e0.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(19,'cloud_surfer','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Chris Cloud','chris.cloud@gmail.com','6aec2dbc-a8e4-4a5a-881c-9f345caeb695.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(20,'security_sentinel','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Sarah Secure','sarah.secure@gmail.com','default-avatar.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(21,'mobile_maestro','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Mike Mobile','mike.mobile@gmail.com','0ba5c307-25ef-48f7-9369-ac9afb44c3e0.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(22,'ux_unicorn','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Uma UX','uma.ux@gmail.com','default-avatar.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(23,'devops_dynamo','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Derek DevOps','derek.devops@gmail.com','0ba5c307-25ef-48f7-9369-ac9afb44c3e0.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(24,'quantum_quester','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Quincy Quantum','quincy.quantum@gmail.com','default-avatar.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(25,'blockchain_buff','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Bella Blockchain','bella.blockchain@gmail.com','6aec2dbc-a8e4-4a5a-881c-9f345caeb695.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(26,'ml_maverick','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Max ML','max.ml@gmail.com','6aec2dbc-a8e4-4a5a-881c-9f345caeb695.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(27,'iot_innovator','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Ivy IoT','ivy.iot@gmail.com','7f7f9ed5-337a-4c98-9ffd-f2e397d87af6.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(28,'game_dev_guru','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Gary GameDev','gary.gamedev@gmail.com','default-avatar.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(29,'ar_architect','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Alice AR','alice.ar@gmail.com','0ba5c307-25ef-48f7-9369-ac9afb44c3e0.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(30,'vr_virtuoso','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Victor VR','victor.vr@gmail.com','default-avatar.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(31,'crypto_coder','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Cynthia Crypto','cynthia.crypto@gmail.com','0ba5c307-25ef-48f7-9369-ac9afb44c3e0.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(32,'embedded_expert','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Ethan Embedded','ethan.embedded@gmail.com','0ba5c307-25ef-48f7-9369-ac9afb44c3e0.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(33,'network_ninja','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Nora Network','nora.network@gmail.com','6aec2dbc-a8e4-4a5a-881c-9f345caeb695.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(34,'robotics_rockstar','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Robert Robotics','robert.robotics@gmail.com','default-avatar.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(35,'cyber_sleuth','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Chloe Cyber','chloe.cyber@gmail.com','default-avatar.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(36,'data_detective','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Dexter Data','dexter.data@gmail.com','6aec2dbc-a8e4-4a5a-881c-9f345caeb695.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(37,'api_ace','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Amelia API','amelia.api@gmail.com','7f7f9ed5-337a-4c98-9ffd-f2e397d87af6.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(38,'linux_lord','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Liam Linux','liam.linux@gmail.com','6aec2dbc-a8e4-4a5a-881c-9f345caeb695.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05'),(39,'agile_ace','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Abby Agile','abby.agile@gmail.com','7f7f9ed5-337a-4c98-9ffd-f2e397d87af6.png',0,_binary '','user','2024-12-02 16:51:05','2024-12-02 16:51:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dkolesnych_solve_stack_db_production'
--
/*!50003 DROP FUNCTION IF EXISTS `get_comment_dislikes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_comment_dislikes`(commentId INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE dislike_count INT;
    SELECT COUNT(*) INTO dislike_count
    FROM comment_likes
    WHERE comment_id = commentId AND type = 'dislike';
    RETURN dislike_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_comment_likes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_comment_likes`(commentId INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE like_count INT;
    SELECT COUNT(*) INTO like_count
    FROM comment_likes
    WHERE comment_id = commentId AND type = 'like';
    RETURN like_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_post_dislikes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_post_dislikes`(postId INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE dislike_count INT;
    SELECT COUNT(*) INTO dislike_count
    FROM posts_likes
    WHERE post_id = postId AND type = 'dislike';
    RETURN dislike_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_post_likes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_post_likes`(postId INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE like_count INT;
    SELECT COUNT(*) INTO like_count
    FROM posts_likes
    WHERE post_id = postId AND type = 'like';
    RETURN like_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-02 18:55:09
