/*
We have two tables:

+ Table "Visits":
    + visit_id (integer, unique visit identifier);
    + customer_id (integer, customer identifier).
This table contains information about customers who visited the mall.

+ Table "Transactions":
    + transaction_id (integer, unique transaction identifier);
    + visit_id (integer, visit identifier, referencing Visits);
    + amount (integer, transaction amount).
This table contains information about purchases made during each visit_id.

Write an SQL query to find the IDs of customers who visited the mall without making any transactions and count how many times they made such visits.

Return a table with the following columns:
+ customer_id (customer ID);
+ count_no_trans (number of visits without transactions).

The result should be sorted in any order.

У нас есть две таблицы:

+ Таблица "Visits":
    + visit_id (целое число, уникальный идентификатор визита);
    + customer_id (целое число, идентификатор клиента).
Эта таблица содержит информацию о клиентах, которые посещали торговый центр.

+ Таблица "Transactions":
    + transaction_id (целое число, уникальный идентификатор транзакции);
    + visit_id (целое число, идентификатор визита, связанный с Visits);
    + amount (целое число, сумма транзакции).
Эта таблица содержит информацию о покупках, совершённых во время каждого визита (visit_id).

Написать SQL-запрос, который находит ID клиентов, посещавших торговый центр без совершения покупок, а также количество таких визитов для каждого клиента.

Вывести таблицу с колонками:
+ customer_id (ID клиента);
+ count_no_trans (количество визитов без транзакций).

Результат должен быть отсортирован в любом порядке.
*/

SELECT Visits.customer_id, COUNT(DISTINCT Visits.visit_id) AS count_no_trans
FROM Visits
LEFT JOIN Transactions ON Visits.visit_id = Transactions.visit_id
WHERE Transactions.visit_id IS NULL
GROUP BY Visits.customer_id
ORDER BY Visits.customer_id;