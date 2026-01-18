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

Annetaan taulu Activity, jossa on tietoa pelaajien kirjautumisista.
Jokainen rivi vastaa päivää, jolloin pelaaja kirjautui sisään ja pelasi pelejä.
Yhdistelmä (player_id, event_date) on uniikki.

Jokaiselle player_id-arvolle etsi ensimmäisen kirjautumisen päivämäärä.

Palauta taulu, jossa on kentät:
    - player_id
    - first_login

Rivien järjestyksellä ei ole merkitystä.
*/

SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;