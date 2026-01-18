/*
You are given two tables:
Signups:
    - user_id
    - time_stamp

Confirmations:
    - user_id
    - time_stamp
    - action

Write an SQL query to calculate the confirmation rate for each user.

The confirmation rate is calculated as: number of ’confirmed’ messages / total number of confirmation requests.
    - If a user did not request any confirmation messages, their confirmation rate should be 0;
    - The result should be rounded to two decimal places.

Return the result table in any order.

Даны две таблицы:
Таблица Signups:
    - user_id
    - time_stamp

Таблица Confirmations:
    - user_id
    - time_stamp
    - action

Напишите SQL-запрос для вычисления коэффициента подтверждения для каждого пользователя.

Формула расчёта коэффициента подтверждения: количество ’confirmed’ сообщений / общее количество запросов на подтверждение:
    - Если пользователь не запрашивал подтверждений, его коэффициент подтверждения должен быть 0;
    - Результат должен быть округлён до двух знаков после запятой.

Верните результат в любом порядке.

Annetaan kaksi taulua:
Taulu Signups:
    - user_id
    - time_stamp

Taulu Confirmations:
    - user_id
    - time_stamp
    - action

Kirjoita SQL-kysely, joka laskee vahvistuskertoimen (confirmation rate) jokaiselle käyttäjälle.

Vahvistuskertoimen kaava: ’confirmed’-viestien määrä / vahvistuspyyntöjen kokonaismäärä.
    - Jos käyttäjä ei ole pyytänyt yhtään vahvistusta, hänen vahvistuskertoimensa on 0;
    - Tulos tulee pyöristää kahden desimaalin tarkkuudelle.

Palauta tulos missä tahansa järjestyksessä.
*/

SELECT Signups.user_id, COALESCE(ROUND(SUM(CASE WHEN Confirmations.action = 'confirmed' THEN 1 ELSE 0 END) / NULLIF(COUNT(Confirmations.user_id), 0), 2), 0.00) AS confirmation_rate
FROM Signups
LEFT JOIN Confirmations ON Signups.user_id = Confirmations.user_id
GROUP BY Signups.user_id;