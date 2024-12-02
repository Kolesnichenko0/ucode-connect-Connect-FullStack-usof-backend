CREATE DATABASE IF NOT EXISTS dkolesnych_solve_stack_db_production;

GRANT ALL ON dkolesnych_solve_stack_db_production.* TO 'dkolesnych'@'localhost';

USE dkolesnych_solve_stack_db_production;

CREATE TABLE IF NOT EXISTS users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(30) NOT NULL CHECK(REGEXP_LIKE(login, '^[a-zA-Z0-9_]{3,30}$', 'c')),
    password CHAR(60) NOT NULL,
    full_name VARCHAR(100),
    email VARCHAR(255) NOT NULL,
    profile_picture_name VARCHAR(255) DEFAULT 'default-avatar.png',
    rating INT NOT NULL DEFAULT 0,
    email_verified BIT(1) NOT NULL DEFAULT b'0',
    role ENUM('user', 'admin') DEFAULT 'user',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT users_login_uq UNIQUE (login),
    CONSTRAINT users_email_uq UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS tokens(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    refresh_token TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT tokens_users_user_id_FK FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    status ENUM('active', 'inactive') DEFAULT 'active',
    content MEDIUMTEXT NOT NULL,
    rating INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT posts_users_user_id_FK FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS post_files(
    id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT post_files_posts_post_id_FK FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT categories_title_uq UNIQUE (title)
);

CREATE TABLE IF NOT EXISTS posts_categories(
    id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT NOT NULL,
    category_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT posts_categories_posts_post_id_FK FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    CONSTRAINT posts_categories_categories_category_id_FK FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE,
    CONSTRAINT posts_categories_post_category_unique UNIQUE (post_id, category_id)
);

CREATE TABLE IF NOT EXISTS favorite_posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT favorites_users_user_id_FK FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT favorites_posts_post_id_FK FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    CONSTRAINT favorites_user_post_unique UNIQUE (user_id, post_id)
);

CREATE TABLE IF NOT EXISTS comments(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    parent_comment_id INT,
    content MEDIUMTEXT NOT NULL,
    status ENUM('active', 'inactive') DEFAULT 'active',
    rating INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT comments_users_user_id_FK FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT comments_posts_post_id_FK FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    CONSTRAINT comments_parent_comment_id_FK FOREIGN KEY (parent_comment_id) REFERENCES comments(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS posts_likes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    type ENUM('like', 'dislike') DEFAULT 'like',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT posts_likes_users_user_id_FK FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT posts_likes_posts_post_id_FK FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS comment_likes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    comment_id INT NOT NULL,
    type ENUM('like', 'dislike') DEFAULT 'like',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT comment_likes_users_user_id_FK FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT comment_likes_comments_comment_id_FK FOREIGN KEY (comment_id) REFERENCES comments(id) ON DELETE CASCADE
);

CREATE INDEX idx_comments_status ON comments (status);
CREATE INDEX idx_posts_status ON posts (status);

CREATE INDEX idx_comment_likes_type ON comment_likes (type);
CREATE INDEX idx_posts_likes_type ON posts_likes (type);

CREATE index idx_posts_created_at ON posts (created_at);

DELIMITER $$

CREATE TRIGGER increase_rating_on_like_posts
AFTER INSERT ON posts_likes
FOR EACH ROW
BEGIN
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
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER decrease_rating_on_delete_like_posts
AFTER DELETE ON posts_likes
FOR EACH ROW
BEGIN
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
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER switch_like_dislike_posts
AFTER UPDATE ON posts_likes
FOR EACH ROW
BEGIN
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
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER increase_rating_on_like_comments
AFTER INSERT ON comment_likes
FOR EACH ROW
BEGIN
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
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER decrease_rating_on_delete_like_comments
AFTER DELETE ON comment_likes
FOR EACH ROW
BEGIN
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
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER switch_like_dislike_comments
AFTER UPDATE ON comment_likes
FOR EACH ROW
BEGIN
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
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION get_post_likes(postId INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE like_count INT;
    SELECT COUNT(*) INTO like_count
    FROM posts_likes
    WHERE post_id = postId AND type = 'like';
    RETURN like_count;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION get_post_dislikes(postId INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE dislike_count INT;
    SELECT COUNT(*) INTO dislike_count
    FROM posts_likes
    WHERE post_id = postId AND type = 'dislike';
    RETURN dislike_count;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION get_comment_likes(commentId INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE like_count INT;
    SELECT COUNT(*) INTO like_count
    FROM comment_likes
    WHERE comment_id = commentId AND type = 'like';
    RETURN like_count;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION get_comment_dislikes(commentId INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE dislike_count INT;
    SELECT COUNT(*) INTO dislike_count
    FROM comment_likes
    WHERE comment_id = commentId AND type = 'dislike';
    RETURN dislike_count;
END $$

DELIMITER ;
