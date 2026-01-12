/*
You are given a table ActorDirector that records collaborations between actors and directors.
Each row represents one cooperation.

Find all pairs (actor_id, director_id) where the actor has cooperated with the director at least 3 times.

Return the result in any order.

Дана таблица ActorDirector, в которой записаны сотрудничества актёров и режиссёров.
Каждая строка - одно сотрудничество.

Найдите все пары (actor_id, director_id), которые сотрудничали не менее 3 раз.

Порядок строк не важен.
*/

SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(timestamp) >= 3;