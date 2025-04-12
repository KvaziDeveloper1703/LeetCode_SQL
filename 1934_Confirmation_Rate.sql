/*
You are given two tables: "Signups" and "Confirmations".

The "Signups" table contains information about when users signed up. Each row represents a unique user.
+ user_id – Unique identifier for each user (Primary Key);
+ time_stamp – The date and time when the user signed up.

The "Confirmations" table contains information about confirmation requests sent to users. Each row represents a confirmation request.
+ user_id – ID of the user who requested confirmation (Foreign Key referencing the Signups table);
+ time_stamp – The date and time when the confirmation request was sent;
+ action – The status of the confirmation request, which can be either 'confirmed' (successful confirmation) or 'timeout' (expired without confirmation).

Write an SQL query to calculate the confirmation rate for each user.

The confirmation rate is calculated as: number of ’confirmed’ messages / total number of confirmation requests
+ If a user did not request any confirmation messages, their confirmation rate should be 0;
+ The result should be rounded to two decimal places.

Return the result table in any order.

Даны две таблицы: "Signups" и "Confirmations".

Таблица "Signups" содержит информацию о времени регистрации пользователей. Каждая строка представляет одного уникального пользователя.
+ user_id – Уникальный идентификатор пользователя (Первичный ключ);
+ time_stamp – Дата и время регистрации пользователя.

Таблица "Confirmations" содержит информацию о запросах подтверждения, отправленных пользователям. Каждая строка представляет отдельный запрос.
+ user_id – Идентификатор пользователя, который запрашивал подтверждение (Внешний ключ, ссылающийся на таблицу Signups);
+ time_stamp – Дата и время отправки запроса на подтверждение;
+ action – Статус подтверждения, который может быть 'confirmed' (успешное подтверждение) или 'timeout' (истекший запрос без подтверждения).

Напишите SQL-запрос для вычисления коэффициента подтверждения для каждого пользователя.

Формула расчёта коэффициента подтверждения: количество ’confirmed’ сообщений / общее количество запросов на подтверждение
+ Если пользователь не запрашивал подтверждений, его коэффициент подтверждения должен быть 0;
+ Результат должен быть округлён до двух знаков после запятой.

Верните результат в любом порядке.
*/

SELECT Signups.user_id, COALESCE(ROUND(SUM(CASE WHEN Confirmations.action = 'confirmed' THEN 1 ELSE 0 END) / NULLIF(COUNT(Confirmations.user_id), 0), 2), 0.00) AS confirmation_rate
FROM Signups
LEFT JOIN Confirmations ON Signups.user_id = Confirmations.user_id
GROUP BY Signups.user_id;