USE dkolesnych_solve_stack_db_production;

INSERT INTO users (login, password, full_name, email, email_verified, profile_picture_name, role)
VALUES
('tech_guru92', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'John Doe', 'john.doe@gmail.com', b'1', 'default-avatar.png', 'user'),
('jane_dev', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'Jane Smith', 'jane.smith@gmail.com', b'1', 'default-avatar.png', 'user'),
('alice_admin', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'Alice Admin', 'alice.admin@gmail.com', b'1', '0ba5c307-25ef-48f7-9369-ac9afb44c3e0.png' , 'admin'),
('bob_the_builder', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'Bob Brown', 'bob.brown@gmail.com', b'1', 'default-avatar.png', 'user'),
('charlie_green', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'Charlie Green', 'charlie.green@gmail.com', b'1', '04ce9bdc-ae08-480b-8ea1-14a2d031971d.png' ,'user'),
('dave_admin', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'Dave Admin', 'dave.admin@gmail.com', b'1', '6aec2dbc-a8e4-4a5a-881c-9f345caeb695.png' , 'admin'),
('emma_coder', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'Emma White', 'emma.white@gmail.com', b'1', '7f7f9ed5-337a-4c98-9ffd-f2e397d87af6.png', 'user'),
('frank_black', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'Frank Black', 'frank.black@gmail.com', b'1', '0350d3e2-a613-46c2-8b49-336d0d3bb537.png' , 'user'),
('grace_blue', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'Grace Blue', 'grace.blue@gmail.com', b'1', 'b0e97330-0482-46f4-8020-56edb594f3c9.png' , 'user'),
('henry_dev', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'Henry Yellow', 'den.koleskos@gmail.com', b'1', 'fd976a04-bf88-4fa7-80e2-6ab9b79b7612.png' , 'user'),
('ivy_tester', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'Ivy Green', 'denis.kolesnichenko112@gmail.com', b'1', 'default-avatar.png' ,'user'),
('jack_fullstack', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'Jack Brown', 'jack.brown@gmail.com', b'1', 'default-avatar.png', 'user'),
('karen_backend', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'Karen White', 'karen.white@gmail.com', b'1', 'default-avatar.png', 'user'),
('leo_frontend', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'Leo Gray', 'leo.gray@gmail.com', b'1', 'default-avatar.png','user'),
('mia_designer', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'Mia Black', 'mia.black@gmail.com', b'1', 'default-avatar.png', 'user');

INSERT INTO users (login, password, email, email_verified, role)
VALUES
('tech_guru93', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'john.white@gmail.com', b'0', 'user'),
('mia_designer2', '$2b$10$5eJSA7JvPSHkj3krYfIzHOTwDWVFzCuKO527UuLQtfZyli6CruqRe', 'mia.white@gmail.com', b'0', 'user');

INSERT INTO posts (user_id, title, status, content)
VALUES
(1, 'How can I improve my Python skills?', 'active', 'I\'ve been learning Python for a few months but feel stuck. Any tips on resources or projects I should try to take my skills to the next level?'),
(2, 'What are the best JavaScript frameworks for beginners?', 'active', 'I\'m new to web development and want to know which JavaScript frameworks are beginner-friendly. I\'ve heard about React, Vue, and Angular, but I\'m not sure where to start.'),
(3, 'Can someone explain SQL joins to me?', 'active', 'I\'m having a hard time understanding how SQL joins work. Can anyone provide a clear explanation with some practical examples?'),
(4, 'Help with Java memory management issues', 'active', 'I keep facing memory management problems in Java. How can I tackle this effectively? Are there any best practices or tools I should be aware of?'),
(5, 'How do I get started with React?', 'active', 'I want to learn React but don\'t know where to begin. Any suggestions for good tutorials or courses? What prerequisites should I have before diving in?'),
(5, 'What is Docker and how can it help me?', 'active', 'I\'ve heard a lot about Docker but don\'t really understand what it is or how to use it. Can someone explain its benefits and provide some use cases?'),
(7, 'Is cloud computing worth the investment?', 'active', 'I\'m considering cloud services for my projects. Is it worth the cost? What are the pros and cons compared to traditional hosting?'),
(8, 'Can someone simplify blockchain technology for me?', 'active', 'I find blockchain confusing. Can anyone break it down in simple terms? How is it different from traditional databases?'),
(9, 'What are the advantages of Test-Driven Development?', 'active', 'I\'ve heard about TDD, but what are its actual benefits in real-world applications? How do I start implementing it in my workflow?'),
(10, 'Which Python libraries are essential for data science?', 'inactive', 'I want to delve into data science using Python. Which libraries should I focus on learning first? Any recommendations for good resources?'),
(11, 'How to optimize database queries for large datasets?', 'active', 'I\'m working with a database that has millions of records. What are some strategies to optimize my queries and improve performance?'),
(12, 'Best practices for securing a REST API', 'inactive', 'I\'m developing a REST API and want to ensure it\'s secure. What are the best practices for authentication, authorization, and data protection?'),
(13, 'Comparing NoSQL databases: MongoDB vs. Cassandra', 'active', 'I\'m trying to choose between MongoDB and Cassandra for a new project. Can someone explain the pros and cons of each? Which scenarios are they best suited for?'),
(14, 'Tips for writing clean and maintainable code', 'active', 'I want to improve the quality of my code. What are some tips and best practices for writing clean, maintainable, and easily understandable code?'),
(15, 'How to implement CI/CD in a small team?', 'inactive', 'Our small development team wants to implement CI/CD. What are some lightweight tools and practices we can start with? Any gotchas to watch out for?');

INSERT INTO post_files (post_id, file_name)
VALUES
(1, '3cda95bd-ad25-410e-881a-9b8db62717f5.pdf'),
(1, '024255f9-6d3a-45ba-ae17-6c6d1030e068.png'),
(2, '7adb471b-d15d-4b9a-ad21-79070eb10f7f.png'),
(2, '8d470f5c-ede4-45e2-9c8a-83cbeb10b5b2.png'),
(3, '30dee164-42ef-4b49-9921-717a450b5f7d.png'),
(4, '8a08e7b9-c9dc-4d30-975a-547462570fa6.png'),
(5, '7f2e3332-bad4-4978-8ab8-21bb7851b258.png'),
(6, '0549bdce-a192-41cc-b337-38f559c6ce99.jpg'),
(8, 'df78c964-860d-45f8-87bf-a251a814e23f.png'),
(9, '577d7ed2-0a7a-42ea-be25-5fe97ea85c52.png'),
(10, 'c9ed3f8a-8a00-490d-b0eb-a140cee60e8a.png'),
(11, '47d53e7b-4abc-4bae-b517-d19f53a20a5c.png'),
(12, 'f6415990-4d5d-49f2-ae47-3e559215122d.png'),
(12, 'fff705cb-3eb7-4c9a-9467-8f79e915bd49.jpg'),
(13, 'd5c84e0e-0a87-4280-b3fd-a5ce75e138e1.png'),
(15, '5855a11a-0b4d-4b16-9f7b-4d9a2dd10c5e.png');

INSERT INTO categories (title, description)
VALUES
('Programming Languages', 'Discussions about various programming languages, their features, and best practices'),
('Web Development', 'Topics related to frontend and backend web development, frameworks, and tools'),
('Databases', 'Everything about SQL, NoSQL, and data management strategies'),
('Cloud Computing', 'Discussions on cloud platforms, services, and migration strategies'),
('Data Science', 'Topics covering data analysis, machine learning, AI, and related tools'),
('DevOps', 'Best practices, tools, and methodologies for DevOps and automation'),
('Software Architecture', 'Discussions on software design patterns, architectural styles, and system design'),
('Mobile Development', 'Topics related to iOS, Android, and cross-platform mobile app development'),
('Security', 'Cybersecurity, application security, and best practices for secure coding'),
('Performance Optimization', 'Techniques and tools for optimizing software and system performance');

INSERT INTO posts_categories (post_id, category_id)
VALUES
(1, 1), (1, 5),
(2, 2), (2, 1),
(3, 3),
(4, 1), (4, 10),
(5, 2),
(6, 6), (6, 4),
(7, 4),
(8, 1), (8, 3),
(9, 6), (9, 7),
(10, 1), (10, 5),
(11, 3), (11, 10),
(12, 2), (12, 9),
(13, 3),
(14, 1), (14, 7),
(15, 6);

INSERT INTO favorite_posts (user_id, post_id)
VALUES
(1, 2), (1, 5), (1, 8),
(2, 1), (2, 3), (2, 6),
(3, 4), (3, 7), (3, 10),
(5, 11), (5, 13), (5, 14),
(6, 1), (6, 10),
(8, 3), (8, 8), (8, 13),
(9, 4), (9, 9), (9, 14),
(10, 5), (10, 10), (10, 15);

INSERT INTO comments (user_id, post_id, content, status)
VALUES
(2, 1, 'Great question! I\'d recommend working on some real-world projects. Maybe try building a web scraper or a simple API?', 'active'),
(3, 1, 'Codecademy has some excellent Python courses that really helped me level up my skills.', 'active'),
(4, 2, 'As a beginner, I found Vue.js to be the most approachable. The documentation is excellent!', 'active'),
(5, 2, 'React has a steeper learning curve but it\'s widely used in the industry. Might be worth the initial struggle.', 'active'),
(6, 3, 'Think of joins as a way to combine tables based on related columns. Inner joins keep matching rows, left joins keep all rows from the left table, etc.', 'active'),
(7, 3, 'Here\'s a visual explanation that helped me understand joins: [link to visual guide]', 'active'),
(8, 4, 'Make sure you\'re closing resources properly and consider using try-with-resources for automatic resource management.', 'active'),
(9, 4, 'The Java Garbage Collector usually handles memory well, but you might want to look into profiling tools to identify leaks.', 'active'),
(10, 5, 'The official React documentation is actually a great place to start. They have an excellent tutorial.', 'active'),
(1, 5, 'I\'d recommend having a solid understanding of JavaScript, especially ES6 features, before diving into React.', 'active'),
(2, 6, 'Docker is great for creating consistent development environments. It lets you package your app with all its dependencies.', 'active'),
(3, 6, 'I use Docker to ensure my app runs the same way on my machine and in production. It\'s a game-changer for deployment.', 'active'),
(4, 7, 'Cloud computing can significantly reduce upfront infrastructure costs. It\'s great for scalability too.', 'active'),
(5, 7, 'Consider factors like data privacy regulations in your region before moving to the cloud.', 'active'),
(6, 8, 'Think of blockchain as a distributed ledger. Every transaction is recorded and verified by multiple parties, making it very secure.', 'active'),
(7, 8, 'Unlike traditional databases, blockchain is decentralized. No single entity has control over the entire chain.', 'active'),
(8, 9, 'TDD helps catch bugs early in the development process. It also encourages you to write more modular, testable code.', 'inactive'),
(9, 9, 'Start small with unit tests for individual functions. Gradually incorporate TDD into your workflow as you get comfortable with it.', 'active'),
(10, 10, 'NumPy and Pandas are essential for data manipulation. For visualization, start with Matplotlib and Seaborn.', 'inactive'),
(11, 10, 'Don\'t forget about Scikit-learn for machine learning tasks. It\'s a great library to start with.', 'active'),
(12, 11, 'Indexing is crucial for large datasets. Make sure you have appropriate indexes on columns used in WHERE, JOIN, and ORDER BY clauses.', 'active'),
(13, 11, 'Consider partitioning your tables if you\'re dealing with really large amounts of data. It can significantly improve query performance.', 'active'),
(14, 12, 'Always use HTTPS and implement proper authentication. JWT (JSON Web Tokens) is a popular choice for API authentication.', 'active'),
(15, 12, 'Don\'t forget about rate limiting to prevent abuse of your API. Also, validate and sanitize all input to prevent injection attacks.', 'active'),
(1, 13, 'MongoDB is great for flexible, document-based data models. It\'s easier to scale horizontally.', 'inactive'),
(2, 13, 'Cassandra is better for scenarios requiring high write throughput and where data is naturally partitioned.', 'active'),
(3, 14, 'Follow the DRY (Don\'t Repeat Yourself) principle. Extract repeated code into reusable functions or classes.', 'active'),
(4, 14, 'Meaningful variable and function names go a long way in making code readable. Don\'t be afraid of longer, more descriptive names.', 'active'),
(5, 15, 'Jenkins is a popular, open-source CI/CD tool that\'s relatively easy to set up. GitHub Actions is another good option if you\'re using GitHub.', 'active'),
(6, 15, 'Start with automating your build and test processes. Once that\'s stable, you can move on to automated deployments.', 'inactive');

INSERT INTO comments (user_id, post_id, content, status, parent_comment_id)
VALUES
(1, 1, 'I agree with the previous comments. Also, try contributing to open-source projects. It\'s a great way to learn and get feedback.', 'active', 1),
(2, 2, 'I think starting with Vue.js is a good idea. It\'s simpler and you can always move to React or Angular later.', 'active', 4),
(3, 3, 'Another tip for understanding joins is to practice with real datasets. Try joining tables from a sample database.', 'active', 6),
(4, 4, 'In addition to profiling tools, consider using memory leak detection tools like VisualVM or YourKit.', 'active', 8),
(5, 5, 'Before starting with React, make sure you are comfortable with JavaScript ES6 features like arrow functions, classes, and modules.', 'active', 10),
(6, 6, 'Docker also helps in isolating your application from the host environment, making it easier to manage dependencies.', 'active', 12);

INSERT INTO posts_likes (user_id, post_id, type)
VALUES
(1, 2, 'like'), (1, 3, 'like'), (1, 4, 'like'),
(2, 1, 'like'), (2, 3, 'like'), (2, 5, 'dislike'),
(3, 1, 'like'), (3, 2, 'like'), (3, 4, 'like'),
(4, 2, 'like'), (4, 3, 'dislike'), (4, 5, 'like'), (4, 15, 'dislike'),
(5, 1, 'dislike'), (5, 3, 'like'), (5, 4, 'like'),
(6, 2, 'like'), (6, 4, 'like'),
(7, 1, 'like'), (7, 3, 'like'), (7, 5, 'dislike'),
(8, 2, 'dislike'), (8, 4, 'like'), (8, 5, 'like'),
(9, 1, 'like'), (9, 3, 'like'), (9, 5, 'like'),
(10, 2, 'like'), (10, 4, 'dislike'), (10, 5, 'like'),
(11, 6, 'like'), (11, 7, 'like'), (11, 8, 'dislike'),
(12, 7, 'like'), (12, 8, 'like'), (12, 9, 'like'),
(13, 8, 'dislike'), (13, 9, 'like'), (13, 10, 'like'), (13, 15, 'dislike'),
(14, 9, 'like'), (14, 10, 'like'), (14, 11, 'like'), (14, 15, 'dislike'),
(15, 10, 'like'), (15, 11, 'dislike'), (15, 12, 'like');

INSERT INTO comment_likes (user_id, comment_id, type)
VALUES
(1, 1, 'like'), (1, 2, 'like'), (1, 3, 'dislike'),
(2, 2, 'like'), (2, 3, 'like'), (2, 4, 'like'),
(3, 1, 'dislike'), (3, 3, 'like'), (3, 5, 'like'),
(4, 2, 'like'), (4, 4, 'like'), (4, 6, 'like'),
(5, 3, 'like'), (5, 5, 'dislike'), (5, 7, 'like'),
(6, 4, 'like'), (6, 6, 'like'), (6, 8, 'like'),
(7, 5, 'like'), (7, 7, 'like'), (7, 9, 'dislike'),
(8, 6, 'dislike'), (8, 8, 'like'), (8, 10, 'like'),
(9, 7, 'like'), (9, 9, 'like'), (9, 11, 'like'),
(10, 8, 'like'), (10, 10, 'dislike'), (10, 12, 'like'),
(11, 9, 'like'), (11, 11, 'like'), (11, 13, 'like'),
(12, 10, 'like'), (12, 12, 'like'), (12, 14, 'dislike'),
(13, 11, 'dislike'), (13, 13, 'like'), (13, 15, 'like'),
(14, 12, 'like'), (14, 14, 'like'), (14, 16, 'like'),
(15, 13, 'like'), (15, 15, 'dislike'), (15, 17, 'like');