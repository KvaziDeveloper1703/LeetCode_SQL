/*
You are given a table Activity:
    - player_id
    - device_id
    - event_date
    - games_played

Each row represents a day when a player logged in. (player_id, event_date) is the primary key.
Write an SQL query to calculate the fraction of players who logged in again on the day after their first login date, rounded to 2 decimal places.

Дана таблица Activity:
    - player_id
    - device_id
    - event_date
    - games_played

Каждая строка - это день, в который игрок заходил в игру. (player_id, event_date) - составной первичный ключ.
Напиши SQL-запрос, который вычислит долю игроков, зашедших в игру на следующий день после своего первого входа, округлённую до двух знаков после запятой.

Annetaan taulu Activity:
    - player_id
    - device_id
    - event_date
    - games_played

Jokainen rivi vastaa päivää, jolloin pelaaja kirjautui peliin. (player_id, event_date) on yhdistetty pääavain.
Kirjoita SQL-kysely, joka laskee niiden pelaajien osuuden, jotka kirjautuivat peliin seuraavana päivänä ensimmäisen kirjautumisensa jälkeen, ja pyöristää tuloksen kahden desimaalin tarkkuuteen.
*/

SELECT ROUND(COUNT(DISTINCT NextDayLogin.player_id) * 1.0 / COUNT(DISTINCT AllPlayers.player_id), 2) AS fraction
FROM (
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
) AS AllPlayers
LEFT JOIN Activity AS NextDayLogin ON AllPlayers.player_id = NextDayLogin.player_id AND NextDayLogin.event_date = DATE_ADD(AllPlayers.first_login_date, INTERVAL 1 DAY);