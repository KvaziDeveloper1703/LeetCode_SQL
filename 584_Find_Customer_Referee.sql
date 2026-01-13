/*
We have a table Customer:
    - id
    - name
    - referee_id

Each row in the table represents a customer, their name, and referee_id, which indicates who referred them. If referee_id is NULL, it means the customer was not referred by anyone.

Write an SQL query to find the names of all customers who were NOT referred by the customer with id = 2.

Return a table with a single column name, containing the names of such customers. The result order can be arbitrary.

У нас есть таблица Customer:
    - id
    - name
    - referee_id

Каждая строка таблицы представляет клиента, его имя и referee_id, указывающий, кто его порекомендовал. Если referee_id имеет значение NULL, значит, этот клиент никем не был рекомендован.

Написать SQL-запрос, который выбирает имена всех клиентов, которых НЕ порекомендовал клиент с id = 2.

Вывести таблицу с одним столбцом name, содержащую имена таких клиентов. Порядок строк в ответе может быть произвольным.
*/

SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id <> 2;