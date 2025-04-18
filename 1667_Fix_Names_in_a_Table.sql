/*
You are given a table:
+ Users:
    + user_id: unique identifier of the user (primary key);
    + name: name of the user, containing only uppercase and lowercase letters.

Write an SQL query to format the names so that only the first character is uppercase, and the rest are lowercase.
Return the result table ordered by user_id.

Return the following columns:
+ user_id;
+ name — with correct capitalization (e.g., aLice → Alice, bOB → Bob).

Дана таблица:
+ Users:
    + user_id: уникальный идентификатор пользователя (первичный ключ);
    + name: имя пользователя, содержащее только латинские буквы в верхнем и нижнем регистрах.

Напиши SQL-запрос, который исправит имена так, чтобы только первая буква была заглавной, а остальные — строчными.
Результат должен быть отсортирован по user_id.

Верни таблицу со следующими колонками:
+ user_id;
+ name — имя с правильным форматированием (например, aLice → Alice, bOB → Bob).
*/

SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM Users
ORDER BY user_id;