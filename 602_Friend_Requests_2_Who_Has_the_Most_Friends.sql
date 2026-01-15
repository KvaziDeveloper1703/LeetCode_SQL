/*
You are given a table RequestAccepted:
    - requester_id
    - accepter_id
    - accept_date

Friendship is bidirectional. If a person A sends a request to person B and it's accepted, then A and B are considered friends.

Write an SQL query to find the user who has the most friends, along with the number of friends they have.
It is guaranteed that there is only one person with the most friends.

Return the result with the following columns:
    - id: the ID of the person with the most friends;
    - num: the number of their friends.

Дана таблица RequestAccepted:
    - requester_id
    - accepter_id
    - accept_date

Дружба считается взаимной: если человек A отправил запрос человеку B, и он был принят, значит, A и B стали друзьями.

Напиши SQL-запрос, который определит пользователя с наибольшим числом друзей, а также количество этих друзей.
Гарантируется, что существует только один такой пользователь.

Верни результат с колонками:
    - id: ID пользователя с наибольшим числом друзей;
    - num: количество его друзей.

Ystävyys on molemminpuolista: jos henkilö A lähetti ystäväpyynnön henkilölle B ja pyyntö hyväksyttiin, A ja B ovat ystäviä.

Kirjoita SQL-kysely, joka määrittää käyttäjän, jolla on eniten ystäviä, sekä näiden ystävien määrän.
On taattu, että tällainen käyttäjä on vain yksi.

Palauta tulos sarakkeilla:
    - id: eniten ystäviä omaavan käyttäjän ID;
    - num: hänen ystäviensä lukumäärä.
*/

SELECT id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id
    FROM RequestAccepted

    UNION ALL

    SELECT accepter_id AS id
    FROM RequestAccepted
) AS all_friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;