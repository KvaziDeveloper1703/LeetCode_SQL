/*
You are given a table:
RequestAccepted:
 + requester_id: the ID of the user who sent the friend request;
 + accepter_id: the ID of the user who accepted the request;
 + accept_date: the date the request was accepted.

The combination (requester_id, accepter_id) is the primary key.

Friendship is bidirectional — if a person A sends a request to person B and it's accepted, then A and B are considered friends.

Write an SQL query to find the user who has the most friends, along with the number of friends they have.
It is guaranteed that there is only one person with the most friends.

Return the result with the following columns:
+ id: the ID of the person with the most friends;
+ num: the number of their friends.

Дана таблица:

RequestAccepted:
 + requester_id: ID пользователя, отправившего заявку в друзья;
 + accepter_id: ID пользователя, принявшего заявку;
 + accept_date: дата принятия заявки.

Составной первичный ключ — (requester_id, accepter_id).

Дружба считается взаимной: если человек A отправил запрос человеку B, и он был принят, значит, A и B стали друзьями.

Напиши SQL-запрос, который определит пользователя с наибольшим числом друзей, а также количество этих друзей.
Гарантируется, что существует только один такой пользователь.

Верни результат с колонками:
+ id: ID пользователя с наибольшим числом друзей;
+ num: количество его друзей.
*/

SELECT id, COUNT(*) AS num
FROM (  SELECT requester_id AS id FROM RequestAccepted
        UNION ALL
        SELECT accepter_id AS id FROM RequestAccepted
    ) AS all_friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;