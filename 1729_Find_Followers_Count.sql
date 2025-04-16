/*
You are given a table:
+ Followers:
    + user_id: The ID of the user being followed;
    + follower_id: The ID of the follower;
    + (user_id, follower_id) is the primary key.

Each row indicates that follower_id follows user_id.
Write an SQL query to return the number of followers for each user, sorted by user_id in ascending order.

Дана таблица:
+ Followers:
    + user_id: идентификатор пользователя, на которого подписались;
    + follower_id: идентификатор подписчика;
    + (user_id, follower_id) — первичный ключ.

Каждая строка показывает, что follower_id подписан на user_id.
Напиши SQL-запрос, который вернёт количество подписчиков для каждого пользователя, отсортированных по user_id по возрастанию.
*/

SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id ASC;