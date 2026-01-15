/*
You are given a table Activity:
    - user_id
    - session_id
    - activity_date
    - activity_type

Each session belongs to exactly one user. The table may have duplicates.

Write an SQL query to find the number of active users per day for the 30-day period ending on 2019-07-27.
A user is considered active on a given day if they performed at least one activity on that day.

Return the result in any order. Only include days with at least one active user.

Дана таблица Activity:
    - user_id
    - session_id
    - activity_date
    - activity_type

Каждая сессия принадлежит одному пользователю. В таблице могут быть дубликаты.

Напиши SQL-запрос, который вернёт количество активных пользователей в день за 30-дневный период, заканчивающийся 27 июля 2019 года.
Пользователь считается активным в день, если у него была хотя бы одна активность в этот день.

Верни результат в любом порядке. Включай только дни, когда были активные пользователи.

Annetaan taulu Activity:
    - user_id
    - session_id
    - activity_date
    - activity_type

Jokainen istunto (session) kuuluu yhdelle käyttäjälle. Taulussa voi esiintyä duplikaatteja.

Kirjoita SQL-kysely, joka palauttaa aktiivisten käyttäjien määrän päivää kohti 30 päivän ajanjaksolta, joka päättyy 27. heinäkuuta 2019.
Käyttäjä katsotaan aktiiviseksi tiettynä päivänä, jos hänellä oli vähintään yksi aktiviteetti kyseisenä päivänä.

Palauta tulos missä tahansa järjestyksessä. Ota mukaan vain ne päivät, jolloin aktiivisia käyttäjiä oli.
*/

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY activity_date;