USE solve_stack_db;

SELECT id, title, get_post_likes(id) AS likes
FROM posts
ORDER BY likes DESC
LIMIT 5;

SELECT id, title, get_post_dislikes(id) AS dislikes
FROM posts
ORDER BY dislikes DESC
LIMIT 5;

SELECT id, content, get_comment_likes(id) AS likes
FROM comments
ORDER BY likes DESC
LIMIT 5;

SELECT id, content, get_comment_dislikes(id) AS dislikes
FROM comments
ORDER BY dislikes DESC
LIMIT 5;

SELECT id, title,
       get_post_likes(id) AS likes,
       get_post_dislikes(id) AS dislikes
FROM posts
ORDER BY (get_post_likes(id) + get_post_dislikes(id)) DESC
LIMIT 5;

SELECT id, LEFT(content, 50) AS content_preview,
       get_comment_likes(id) AS likes,
       get_comment_dislikes(id) AS dislikes
FROM comments
ORDER BY (get_comment_likes(id) + get_comment_dislikes(id)) DESC
LIMIT 5;
