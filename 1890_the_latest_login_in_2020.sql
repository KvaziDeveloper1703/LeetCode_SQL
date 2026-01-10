/*
You are given a table Logins with columns:
    - user_id
    - time_stamp

For each user, find their latest login in the year 2020.
    - Consider only logins that occurred in 2020;
    - Exclude users who have no logins in 2020.

Return the result with columns: user_id, last_stamp.
The result order does not matter.

Дана таблица Logins со столбцами:
    - user_id
    - time_stamp

Для каждого пользователя найти последний вход в систему в 2020 году.
    - Учитывать только записи за 2020 год;
    - Исключить пользователей, у которых нет входов в 2020.

Вернуть таблицу: user_id, last_stamp.
Порядок строк не важен.
*/

SELECT user_id, MAX(time_stamp) AS last_stamp
FROM Logins
WHERE time_stamp >= '2020-01-01' AND time_stamp <  '2021-01-01'
GROUP BY user_id;