/*
You are given a table Followers:
    - user_id
    - follower_id

Each row indicates that follower_id follows user_id.

Write an SQL query to return the number of followers for each user, sorted by user_id in ascending order.

Дана таблица Followers:
    - user_id
    - follower_id

Каждая строка показывает, что follower_id подписан на user_id.

Напиши SQL-запрос, который вернёт количество подписчиков для каждого пользователя, отсортированных по user_id по возрастанию.

Annetaan taulu Followers:
    - user_id
    - follower_id

Jokainen rivi tarkoittaa, että follower_id seuraa käyttäjää user_id.

Kirjoita SQL-kysely, joka palauttaa seuraajien lukumäärän jokaiselle käyttäjälle, järjestettynä user_id-sarakkeen mukaan nousevaan järjestykseen.
*/

SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id ASC;