/*
We have a table "Customer" with the following columns:
+ id (integer, primary key);
+ name (string, customer's name);
+ referee_id (integer, ID of the customer who referred them).

Each row in the table represents a customer, their name, and referee_id, which indicates who referred them (if any). If referee_id is NULL, it means the customer was not referred by anyone.

Write an SQL query to find the names of all customers who were NOT referred by the customer with id = 2.

Return a table with a single column name, containing the names of such customers. The result order can be arbitrary.

У нас есть таблица "Customer" со следующими колонками:
+ id (целое число, первичный ключ);
+ name (строка, имя клиента);
+ referee_id (целое число, id клиента, который порекомендовал данного клиента).

Каждая строка таблицы представляет клиента, его имя и referee_id, указывающий, кто его порекомендовал (если есть). Если referee_id имеет значение NULL, значит, этот клиент никем не был рекомендован.

Написать SQL-запрос, который выбирает имена всех клиентов, которых НЕ порекомендовал клиент с id = 2.

Вывести таблицу с одним столбцом name, содержащую имена таких клиентов. Порядок строк в ответе может быть произвольным.
*/

SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id <> 2;