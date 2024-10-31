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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Programming Languages','Discussions about various programming languages, their features, and best practices','2024-10-29 19:30:52','2024-10-29 19:30:52'),(2,'Web Development','Topics related to frontend and backend web development, frameworks, and tools','2024-10-29 19:30:52','2024-10-29 19:30:52'),(3,'Databases','Everything about SQL, NoSQL, and data management strategies','2024-10-29 19:30:52','2024-10-29 19:30:52'),(4,'Cloud Computing','Discussions on cloud platforms, services, and migration strategies','2024-10-29 19:30:52','2024-10-29 19:30:52'),(5,'Data Science','Topics covering data analysis, machine learning, AI, and related tools','2024-10-29 19:30:52','2024-10-29 19:30:52'),(6,'DevOps','Best practices, tools, and methodologies for DevOps and automation','2024-10-29 19:30:52','2024-10-29 19:30:52'),(7,'Software Architecture','Discussions on software design patterns, architectural styles, and system design','2024-10-29 19:30:52','2024-10-29 19:30:52'),(8,'Mobile Development','Topics related to iOS, Android, and cross-platform mobile app development','2024-10-29 19:30:52','2024-10-29 19:30:52'),(9,'Security','Cybersecurity, application security, and best practices for secure coding','2024-10-29 19:30:52','2024-10-29 19:30:52'),(10,'Performance Optimization','Techniques and tools for optimizing software and system performance','2024-10-29 19:30:52','2024-10-29 19:30:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_likes`
--

LOCK TABLES `comment_likes` WRITE;
/*!40000 ALTER TABLE `comment_likes` DISABLE KEYS */;
INSERT INTO `comment_likes` VALUES (1,1,1,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(2,1,2,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(3,1,3,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(4,2,2,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(5,2,3,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(6,2,4,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(7,3,1,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(8,3,3,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(9,3,5,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(10,4,2,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(11,4,4,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(12,4,6,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(13,5,3,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(14,5,5,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(15,5,7,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(16,6,4,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(17,6,6,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(18,6,8,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(19,7,5,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(20,7,7,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(21,7,9,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(22,8,6,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(23,8,8,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(24,8,10,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(25,9,7,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(26,9,9,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(27,9,11,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(28,10,8,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(29,10,10,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(30,10,12,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(31,11,9,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(32,11,11,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(33,11,13,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(34,12,10,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(35,12,12,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(36,12,14,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(37,13,11,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(38,13,13,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(39,13,15,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(40,14,12,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(41,14,14,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(42,14,16,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(43,15,13,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(44,15,15,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(45,15,17,'like','2024-10-29 19:30:52','2024-10-29 19:30:52');
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
  `parent_comment_id` int,
  `content` mediumtext NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `rating` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `comments_users_user_id_FK` (`user_id`),
  KEY `comments_posts_post_id_FK` (`post_id`),
  KEY `idx_comments_status` (`status`),
  CONSTRAINT `comments_posts_post_id_FK` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_users_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_parent_comment_id_FK` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES
(1, 2, 1, NULL, 'Great question! I\'d recommend working on some real-world projects. Maybe try building a web scraper or a simple API?', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(2, 3, 1, NULL, 'Codecademy has some excellent Python courses that really helped me level up my skills.', 'active', 3, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(3, 4, 2, NULL, 'As a beginner, I found Vue.js to be the most approachable. The documentation is excellent!', 'active', 2, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(4, 5, 2, NULL, 'React has a steeper learning curve but it\'s widely used in the industry. Might be worth the initial struggle.', 'active', 3, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(5, 6, 3, NULL, 'Think of joins as a way to combine tables based on related columns. Inner joins keep matching rows, left joins keep all rows from the left table, etc.', 'active', 1, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(6, 7, 3, NULL, 'Here\'s a visual explanation that helped me understand joins: [link to visual guide]', 'active', 1, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(7, 8, 4, NULL, 'Make sure you\'re closing resources properly and consider using try-with-resources for automatic resource management.', 'active', 3, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(8, 9, 4, NULL, 'The Java Garbage Collector usually handles memory well, but you might want to look into profiling tools to identify leaks.', 'active', 3, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(9, 10, 5, NULL, 'The official React documentation is actually a great place to start. They have an excellent tutorial.', 'active', 1, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(10, 1, 5, NULL, 'I\'d recommend having a solid understanding of JavaScript, especially ES6 features, before diving into React.', 'active', 1, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(11, 2, 6, NULL, 'Docker is great for creating consistent development environments. It lets you package your app with all its dependencies.', 'active', 1, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(12, 3, 6, NULL, 'I use Docker to ensure my app runs the same way on my machine and in production. It\'s a game-changer for deployment.', 'active', 3, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(13, 4, 7, NULL, 'Cloud computing can significantly reduce upfront infrastructure costs. It\'s great for scalability too.', 'active', 3, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(14, 5, 7, NULL, 'Consider factors like data privacy regulations in your region before moving to the cloud.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(15, 6, 8, NULL, 'Think of blockchain as a distributed ledger. Every transaction is recorded and verified by multiple parties, making it very secure.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(16, 7, 8, NULL, 'Unlike traditional databases, blockchain is decentralized. No single entity has control over the entire chain.', 'active', 1, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(17, 8, 9, NULL, 'TDD helps catch bugs early in the development process. It also encourages you to write more modular, testable code.', 'inactive', 1, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(18, 9, 9, NULL, 'Start small with unit tests for individual functions. Gradually incorporate TDD into your workflow as you get comfortable with it.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(19, 10, 10, NULL, 'NumPy and Pandas are essential for data manipulation. For visualization, start with Matplotlib and Seaborn.', 'inactive', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(20, 11, 10, NULL, 'Don\'t forget about Scikit-learn for machine learning tasks. It\'s a great library to start with.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(21, 12, 11, NULL, 'Indexing is crucial for large datasets. Make sure you have appropriate indexes on columns used in WHERE, JOIN, and ORDER BY clauses.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(22, 13, 11, NULL, 'Consider partitioning your tables if you\'re dealing with really large amounts of data. It can significantly improve query performance.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(23, 14, 12, NULL, 'Always use HTTPS and implement proper authentication. JWT (JSON Web Tokens) is a popular choice for API authentication.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(24, 15, 12, NULL, 'Don\'t forget about rate limiting to prevent abuse of your API. Also, validate and sanitize all input to prevent injection attacks.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(25, 1, 13, NULL, 'MongoDB is great for flexible, document-based data models. It\'s easier to scale horizontally.', 'inactive', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(26, 2, 13, NULL, 'Cassandra is better for scenarios requiring high write throughput and where data is naturally partitioned.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(27, 3, 14, NULL, 'Follow the DRY (Don\'t Repeat Yourself) principle. Extract repeated code into reusable functions or classes.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(28, 4, 14, NULL, 'Meaningful variable and function names go a long way in making code readable. Don\'t be afraid of longer, more descriptive names.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(29, 5, 15, NULL, 'Jenkins is a popular, open-source CI/CD tool that\'s relatively easy to set up. GitHub Actions is another good option if you\'re using GitHub.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(30, 6, 15, NULL, 'Start with automating your build and test processes. Once that\'s stable, you can move on to automated deployments.', 'inactive', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(31, 1, 1, 1, 'I agree with the previous comments. Also, try contributing to open-source projects. It\'s a great way to learn and get feedback.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(32, 2, 2, 4, 'I think starting with Vue.js is a good idea. It\'s simpler and you can always move to React or Angular later.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(33, 3, 3, 6, 'Another tip for understanding joins is to practice with real datasets. Try joining tables from a sample database.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(34, 4, 4, 8, 'In addition to profiling tools, consider using memory leak detection tools like VisualVM or YourKit.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(35, 5, 5, 10, 'Before starting with React, make sure you are comfortable with JavaScript ES6 features like arrow functions, classes, and modules.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52'),
(36, 6, 6, 12, 'Docker also helps in isolating your application from the host environment, making it easier to manage dependencies.', 'active', 0, '2024-10-29 19:30:52', '2024-10-29 19:30:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_posts`
--

LOCK TABLES `favorite_posts` WRITE;
/*!40000 ALTER TABLE `favorite_posts` DISABLE KEYS */;
INSERT INTO `favorite_posts` VALUES (1,1,2,'2024-10-29 19:30:52'),(2,1,5,'2024-10-29 19:30:52'),(3,1,8,'2024-10-29 19:30:52'),(4,2,1,'2024-10-29 19:30:52'),(5,2,3,'2024-10-29 19:30:52'),(6,2,6,'2024-10-29 19:30:52'),(7,3,4,'2024-10-29 19:30:52'),(8,3,7,'2024-10-29 19:30:52'),(9,3,10,'2024-10-29 19:30:52'),(10,5,11,'2024-10-29 19:30:52'),(11,5,13,'2024-10-29 19:30:52'),(12,5,14,'2024-10-29 19:30:52'),(13,6,1,'2024-10-29 19:30:52'),(14,6,10,'2024-10-29 19:30:52'),(15,8,3,'2024-10-29 19:30:52'),(16,8,8,'2024-10-29 19:30:52'),(17,8,13,'2024-10-29 19:30:52'),(18,9,4,'2024-10-29 19:30:52'),(19,9,9,'2024-10-29 19:30:52'),(20,9,14,'2024-10-29 19:30:52'),(21,10,5,'2024-10-29 19:30:52'),(22,10,10,'2024-10-29 19:30:52'),(23,10,15,'2024-10-29 19:30:52');
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
INSERT INTO `post_files` VALUES (1,1,'3cda95bd-ad25-410e-881a-9b8db62717f5.pdf','2024-10-29 19:30:52','2024-10-29 19:30:52'),(2,1,'024255f9-6d3a-45ba-ae17-6c6d1030e068.png','2024-10-29 19:30:52','2024-10-29 19:30:52'),(3,2,'7adb471b-d15d-4b9a-ad21-79070eb10f7f.png','2024-10-29 19:30:52','2024-10-29 19:30:52'),(4,2,'8d470f5c-ede4-45e2-9c8a-83cbeb10b5b2.png','2024-10-29 19:30:52','2024-10-29 19:30:52'),(5,3,'30dee164-42ef-4b49-9921-717a450b5f7d.png','2024-10-29 19:30:52','2024-10-29 19:30:52'),(6,4,'8a08e7b9-c9dc-4d30-975a-547462570fa6.png','2024-10-29 19:30:52','2024-10-29 19:30:52'),(7,5,'7f2e3332-bad4-4978-8ab8-21bb7851b258.png','2024-10-29 19:30:52','2024-10-29 19:30:52'),(8,6,'0549bdce-a192-41cc-b337-38f559c6ce99.jpg','2024-10-29 19:30:52','2024-10-29 19:30:52'),(9,8,'df78c964-860d-45f8-87bf-a251a814e23f.png','2024-10-29 19:30:52','2024-10-29 19:30:52'),(10,9,'577d7ed2-0a7a-42ea-be25-5fe97ea85c52.png','2024-10-29 19:30:52','2024-10-29 19:30:52'),(11,10,'c9ed3f8a-8a00-490d-b0eb-a140cee60e8a.png','2024-10-29 19:30:52','2024-10-29 19:30:52'),(12,11,'47d53e7b-4abc-4bae-b517-d19f53a20a5c.png','2024-10-29 19:30:52','2024-10-29 19:30:52'),(13,12,'f6415990-4d5d-49f2-ae47-3e559215122d.png','2024-10-29 19:30:52','2024-10-29 19:30:52'),(14,12,'fff705cb-3eb7-4c9a-9467-8f79e915bd49.jpg','2024-10-29 19:30:52','2024-10-29 19:30:52'),(15,13,'d5c84e0e-0a87-4280-b3fd-a5ce75e138e1.png','2024-10-29 19:30:52','2024-10-29 19:30:52'),(16,15,'5855a11a-0b4d-4b16-9f7b-4d9a2dd10c5e.png','2024-10-29 19:30:52','2024-10-29 19:30:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'How can I improve my Python skills?','active','I\'ve been learning Python for a few months but feel stuck. Any tips on resources or projects I should try to take my skills to the next level?',9,'2024-10-29 19:30:52','2024-10-29 19:30:52'),(2,2,'What are the best JavaScript frameworks for beginners?','active','I\'m new to web development and want to know which JavaScript frameworks are beginner-friendly. I\'ve heard about React, Vue, and Angular, but I\'m not sure where to start.',13,'2024-10-29 19:30:52','2024-10-29 19:30:52'),(3,3,'Can someone explain SQL joins to me?','active','I\'m having a hard time understanding how SQL joins work. Can anyone provide a clear explanation with some practical examples?',10,'2024-10-29 19:30:52','2024-10-29 19:30:52'),(4,4,'Help with Java memory management issues','active','I keep facing memory management problems in Java. How can I tackle this effectively? Are there any best practices or tools I should be aware of?',14,'2024-10-29 19:30:52','2024-10-29 19:30:52'),(5,5,'How do I get started with React?','active','I want to learn React but don\'t know where to begin. Any suggestions for good tutorials or courses? What prerequisites should I have before diving in?',6,'2024-10-29 19:30:52','2024-10-29 19:30:52'),(6,5,'What is Docker and how can it help me?','active','I\'ve heard a lot about Docker but don\'t really understand what it is or how to use it. Can someone explain its benefits and provide some use cases?',6,'2024-10-29 19:30:52','2024-10-29 19:30:52'),(7,7,'Is cloud computing worth the investment?','active','I\'m considering cloud services for my projects. Is it worth the cost? What are the pros and cons compared to traditional hosting?',7,'2024-10-29 19:30:52','2024-10-29 19:30:52'),(8,8,'Can someone simplify blockchain technology for me?','active','I find blockchain confusing. Can anyone break it down in simple terms? How is it different from traditional databases?',-1,'2024-10-29 19:30:52','2024-10-29 19:30:52'),(9,9,'What are the advantages of Test-Driven Development?','active','I\'ve heard about TDD, but what are its actual benefits in real-world applications? How do I start implementing it in my workflow?',7,'2024-10-29 19:30:52','2024-10-29 19:30:52'),(10,10,'Which Python libraries are essential for data science?','inactive','I want to delve into data science using Python. Which libraries should I focus on learning first? Any recommendations for good resources?',6,'2024-10-29 19:30:52','2024-10-29 19:30:52'),(11,11,'How to optimize database queries for large datasets?','active','I\'m working with a database that has millions of records. What are some strategies to optimize my queries and improve performance?',0,'2024-10-29 19:30:52','2024-10-29 19:30:52'),(12,12,'Best practices for securing a REST API','inactive','I\'m developing a REST API and want to ensure it\'s secure. What are the best practices for authentication, authorization, and data protection?',2,'2024-10-29 19:30:52','2024-10-29 19:30:52'),(13,13,'Comparing NoSQL databases: MongoDB vs. Cassandra','active','I\'m trying to choose between MongoDB and Cassandra for a new project. Can someone explain the pros and cons of each? Which scenarios are they best suited for?',0,'2024-10-29 19:30:52','2024-10-29 19:30:52'),(14,14,'Tips for writing clean and maintainable code','active','I want to improve the quality of my code. What are some tips and best practices for writing clean, maintainable, and easily understandable code?',0,'2024-10-29 19:30:52','2024-10-29 19:30:52'),(15,15,'How to implement CI/CD in a small team?','inactive','Our small development team wants to implement CI/CD. What are some lightweight tools and practices we can start with? Any gotchas to watch out for?',-6,'2024-10-29 19:30:52','2024-10-29 19:30:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_categories`
--

LOCK TABLES `posts_categories` WRITE;
/*!40000 ALTER TABLE `posts_categories` DISABLE KEYS */;
INSERT INTO `posts_categories` VALUES (1,1,1,'2024-10-29 19:30:52'),(2,1,5,'2024-10-29 19:30:52'),(3,2,2,'2024-10-29 19:30:52'),(4,2,1,'2024-10-29 19:30:52'),(5,3,3,'2024-10-29 19:30:52'),(6,4,1,'2024-10-29 19:30:52'),(7,4,10,'2024-10-29 19:30:52'),(8,5,2,'2024-10-29 19:30:52'),(9,6,6,'2024-10-29 19:30:52'),(10,6,4,'2024-10-29 19:30:52'),(11,7,4,'2024-10-29 19:30:52'),(12,8,1,'2024-10-29 19:30:52'),(13,8,3,'2024-10-29 19:30:52'),(14,9,6,'2024-10-29 19:30:52'),(15,9,7,'2024-10-29 19:30:52'),(16,10,1,'2024-10-29 19:30:52'),(17,10,5,'2024-10-29 19:30:52'),(18,11,3,'2024-10-29 19:30:52'),(19,11,10,'2024-10-29 19:30:52'),(20,12,2,'2024-10-29 19:30:52'),(21,12,9,'2024-10-29 19:30:52'),(22,13,3,'2024-10-29 19:30:52'),(23,14,1,'2024-10-29 19:30:52'),(24,14,7,'2024-10-29 19:30:52'),(25,15,6,'2024-10-29 19:30:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_likes`
--

LOCK TABLES `posts_likes` WRITE;
/*!40000 ALTER TABLE `posts_likes` DISABLE KEYS */;
INSERT INTO `posts_likes` VALUES (1,1,2,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(2,1,3,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(3,1,4,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(4,2,1,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(5,2,3,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(6,2,5,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(7,3,1,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(8,3,2,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(9,3,4,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(10,4,2,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(11,4,3,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(12,4,5,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(13,4,15,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(14,5,1,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(15,5,3,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(16,5,4,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(17,6,2,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(18,6,4,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(19,7,1,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(20,7,3,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(21,7,5,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(22,8,2,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(23,8,4,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(24,8,5,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(25,9,1,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(26,9,3,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(27,9,5,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(28,10,2,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(29,10,4,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(30,10,5,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(31,11,6,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(32,11,7,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(33,11,8,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(34,12,7,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(35,12,8,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(36,12,9,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(37,13,8,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(38,13,9,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(39,13,10,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(40,13,15,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(41,14,9,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(42,14,10,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(43,14,11,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(44,14,15,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(45,15,10,'like','2024-10-29 19:30:52','2024-10-29 19:30:52'),(46,15,11,'dislike','2024-10-29 19:30:52','2024-10-29 19:30:52'),(47,15,12,'like','2024-10-29 19:30:52','2024-10-29 19:30:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'tech_guru92','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','John Doe','john.doe@gmail.com','default-avatar.png',7,_binary '','user','2024-10-29 19:30:52','2024-10-29 19:30:52'),(2,'jane_dev','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Jane Smith','jane.smith@gmail.com','default-avatar.png',9,_binary '','user','2024-10-29 19:30:52','2024-10-29 19:30:52'),(3,'alice_admin','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Alice Admin','alice.admin@gmail.com','0ba5c307-25ef-48f7-9369-ac9afb44c3e0.png',14,_binary '','admin','2024-10-29 19:30:52','2024-10-29 19:30:52'),(4,'bob_the_builder','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Bob Brown','bob.brown@gmail.com','default-avatar.png',13,_binary '','user','2024-10-29 19:30:52','2024-10-29 19:30:52'),(5,'charlie_green','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Charlie Green','charlie.green@gmail.com','04ce9bdc-ae08-480b-8ea1-14a2d031971d.png',9,_binary '','user','2024-10-29 19:30:52','2024-10-29 19:30:52'),(6,'dave_admin','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Dave Admin','dave.admin@gmail.com','6aec2dbc-a8e4-4a5a-881c-9f345caeb695.png',1,_binary '','admin','2024-10-29 19:30:52','2024-10-29 19:30:52'),(7,'emma_coder','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Emma White','emma.white@gmail.com','7f7f9ed5-337a-4c98-9ffd-f2e397d87af6.png',6,_binary '','user','2024-10-29 19:30:52','2024-10-29 19:30:52'),(8,'frank_black','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Frank Black','frank.black@gmail.com','0350d3e2-a613-46c2-8b49-336d0d3bb537.png',2,_binary '','user','2024-10-29 19:30:52','2024-10-29 19:30:52'),(9,'grace_blue','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Grace Blue','grace.blue@gmail.com','b0e97330-0482-46f4-8020-56edb594f3c9.png',9,_binary '','user','2024-10-29 19:30:52','2024-10-29 19:30:52'),(10,'henry_dev','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Henry Yellow','den.koleskos@gmail.com','fd976a04-bf88-4fa7-80e2-6ab9b79b7612.png',7,_binary '','user','2024-10-29 19:30:52','2024-10-29 19:30:52'),(11,'ivy_tester','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Ivy Green','denis.kolesnichenko112@gmail.com','default-avatar.png',0,_binary '','user','2024-10-29 19:30:52','2024-10-29 19:30:52'),(12,'jack_fullstack','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Jack Brown','jack.brown@gmail.com','default-avatar.png',2,_binary '','user','2024-10-29 19:30:52','2024-10-29 19:30:52'),(13,'karen_backend','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Karen White','karen.white@gmail.com','default-avatar.png',0,_binary '','user','2024-10-29 19:30:52','2024-10-29 19:30:52'),(14,'leo_frontend','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Leo Gray','leo.gray@gmail.com','default-avatar.png',0,_binary '','user','2024-10-29 19:30:52','2024-10-29 19:30:52'),(15,'mia_designer','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe','Mia Black','mia.black@gmail.com','default-avatar.png',-6,_binary '','user','2024-10-29 19:30:52','2024-10-29 19:30:52'),(16,'tech_guru93','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe',NULL,'john.white@gmail.com','default-avatar.png',0,_binary '\0','user','2024-10-29 19:30:52','2024-10-29 19:30:52'),(17,'mia_designer2','$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe',NULL,'mia.white@gmail.com','default-avatar.png',0,_binary '\0','user','2024-10-29 19:30:52','2024-10-29 19:30:52');
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

-- Dump completed on 2024-10-29 21:36:30
