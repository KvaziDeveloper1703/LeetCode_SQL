/*
You are given two tables:
+ Users:
    + user_id: ID of the user (primary key);
    + user_name: Name of the user.

+ Register:
    + contest_id: ID of the contest;
    + user_id: ID of the user who registered for the contest;
    + (contest_id, user_id) is the primary key.

Write an SQL query to find the percentage of users who registered for each contest, rounded to two decimal places.
Return the result sorted by percentage in descending order, and by contest_id in ascending order if there is a tie.

Даны две таблицы:
+ Users:
    + user_id: идентификатор пользователя (первичный ключ);
    + user_name: имя пользователя.

+ Register
    + contest_id: идентификатор контеста;
    + user_id: идентификатор пользователя, зарегистрированного на контест;
    + (contest_id, user_id) — первичный ключ.

Напиши SQL-запрос, который вернёт процент пользователей, зарегистрированных на каждый контест, округлённый до двух знаков после запятой.
Результат отсортируй по убыванию percentage, а при равенстве — по возрастанию contest_id.
*/

SELECT  Register.contest_id,
        ROUND(COUNT(DISTINCT Register.user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register
GROUP BY Register.contest_id
ORDER BY percentage DESC, Register.contest_id ASC;