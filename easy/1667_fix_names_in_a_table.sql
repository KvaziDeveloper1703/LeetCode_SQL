/*
You are given a table Users:
    - user_id
    - name

Write an SQL query to format the names so that only the first character is uppercase, and the rest are lowercase.
Return the result table ordered by user_id.

Return the following columns:
    - user_id
    - name

Дана таблица Users:
    - user_id
    - name

Напиши SQL-запрос, который исправит имена так, чтобы только первая буква была заглавной, а остальные - строчными.
Результат должен быть отсортирован по user_id.

Верни таблицу со следующими колонками:
    - user_id
    - name

Annetaan taulu Users:
    - user_id
    - name

Kirjoita SQL-kysely, joka korjaa nimet niin, että vain ensimmäinen kirjain on iso ja loput ovat pieniä kirjaimia.
Tuloksen tulee olla järjestetty sarakkeen user_id mukaan.

Palauta taulu, jossa on seuraavat sarakkeet:
    - user_id
    - name
*/

SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM Users
ORDER BY user_id;