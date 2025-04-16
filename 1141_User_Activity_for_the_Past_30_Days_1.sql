/*
You are given a table:
+ Activity:
    + user_id: ID of the user;
    + session_id: ID of the session;
    + ctivity_date: Date of the activity;
    + activity_type: One of 'open_session', 'end_session', 'scroll_down', 'send_message'.

Each session belongs to exactly one user. The table may have duplicates.

Write an SQL query to find the number of active users per day for the 30-day period ending on 2019-07-27 (inclusive).
A user is considered active on a given day if they performed at least one activity on that day.

Return the result in any order. Only include days with at least one active user.

Дана таблица:
+ Activity:
    + user_id: идентификатор пользователя;
    + session_id: идентификатор сессии;
    + activity_date: дата активности;
    + activity_type: одно из 'open_session', 'end_session', 'scroll_down', 'send_message'.

Каждая сессия принадлежит одному пользователю. В таблице могут быть дубликаты.

Напиши SQL-запрос, который вернёт количество активных пользователей в день за 30-дневный период, заканчивающийся 27 июля 2019 года (включительно).
Пользователь считается активным в день, если у него была хотя бы одна активность в этот день.

Верни результат в любом порядке. Включай только дни, когда были активные пользователи.
*/

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY activity_date;