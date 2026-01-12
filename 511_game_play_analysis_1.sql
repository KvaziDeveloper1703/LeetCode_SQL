/*
You are given a table Activity with information about players’ logins.
Each row represents one day when a player logged in and played games.
The combination (player_id, event_date) is unique.

For each player_id, find the date of their first login.

Return a table with:
    - player_id
    - first_login

The result can be returned in any order.

Дана таблица Activity с информацией о входах игроков.
Каждая строка - это день, когда игрок вошёл в систему и играл в игры.
Комбинация (player_id, event_date) уникальна.

Для каждого player_id найдите дату первого входа.

Вернуть таблицу с полями:
    - player_id
    - first_login

Порядок строк не важен.
*/

SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;