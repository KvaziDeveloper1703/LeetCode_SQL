/*
You are given a table called Person with the following columns:
+ id: Primary key (unique for each person)
+ email: Email address (all lowercase, never NULL)

Write a SQL query to return all duplicate email addresses — i.e., emails that appear more than once in the table.

The result should have one column: email. The output can be in any order.

Дана таблица Person со следующими столбцами:
+ id: идентификатор (уникальный для каждого человека)
+ email: адрес электронной почты (в нижнем регистре, не бывает NULL)

Напишите SQL-запрос, который вернёт все повторяющиеся email-адреса, то есть такие, которые встречаются больше одного раза.

Результирующая таблица должна содержать один столбец: email. Порядок строк в результате — любой.
*/

SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;