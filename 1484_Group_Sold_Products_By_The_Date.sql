/*
You are given a table:
Activities:
    - sell_date
    - product

There is no primary key, and rows may contain duplicates.

Write an SQL query to find, for each date, the number of distinct products sold, and a comma-separated list of those product names, sorted lexicographically.
Return the result with the following columns:
    - sell_date
    - num_sold
    - products

Return the result ordered by sell_date in ascending order.

Дана таблица:
Activities:
    - sell_date
    - product

Таблица не имеет первичного ключа, строки могут повторяться.

Напиши SQL-запрос, который определит для каждой даты:
    - количество различных проданных продуктов,
    - и список их названий, объединённых через запятую в лексикографическом порядке.

Результат должен содержать колонки:
    - sell_date
    - num_sold
    - products

Результат нужно отсортировать по sell_date по возрастанию.
*/

SELECT sell_date, COUNT(DISTINCT product) AS num_sold, GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;