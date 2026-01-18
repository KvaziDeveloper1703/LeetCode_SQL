/*
You are given a table ActorDirector that records collaborations between actors and directors.
Each row represents one cooperation.

Find all pairs (actor_id, director_id) where the actor has cooperated with the director at least 3 times.

Return the result in any order.

Дана таблица ActorDirector, в которой записаны сотрудничества актёров и режиссёров.
Каждая строка - одно сотрудничество.

Найдите все пары (actor_id, director_id), которые сотрудничали не менее 3 раз.

Порядок строк не важен.

Annetaan taulu ActorDirector, johon on tallennettu näyttelijöiden ja ohjaajien yhteistyöt.
Jokainen rivi tarkoittaa yhtä yhteistyötä.

Etsi kaikki parit (actor_id, director_id), jotka ovat tehneet yhteistyötä vähintään 3 kertaa.

Rivien järjestyksellä ei ole väliä.
*/

SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(timestamp) >= 3;