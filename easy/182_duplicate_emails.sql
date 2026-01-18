/*
You are given a table called Person with the following columns:
    - id
    - email

Write a SQL query to return all duplicate email addresses - i.e., emails that appear more than once in the table.

The result should have one column: email. The output can be in any order.

Дана таблица Person со следующими столбцами:
    - id
    - email

Напишите SQL-запрос, который вернёт все повторяющиеся email-адреса, то есть такие, которые встречаются больше одного раза.

Результирующая таблица должна содержать один столбец: email. Порядок строк в результате - любой.

Sinulle on annettu taulu Person, jossa on seuraavat sarakkeet:
    - id
    - email

Kirjoita SQL-kysely, joka palauttaa kaikki toistuvat sähköpostiosoitteet, eli ne, jotka esiintyvät useammin kuin kerran.

Tulostaulussa tulee olla yksi sarake: email. Rivien järjestyksellä ei ole merkitystä.
*/

SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;