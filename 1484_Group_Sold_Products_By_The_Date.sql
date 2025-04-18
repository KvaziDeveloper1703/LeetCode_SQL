/*
You are given a table:
+ Activities:
    + sell_date: the date on which a product was sold;
    + product: the name of the product sold.

There is no primary key, and rows may contain duplicates.

Write an SQL query to find, for each date, the number of distinct products sold, and a comma-separated list of those product names, sorted lexicographically.
Return the result with the following columns:
+ sell_date: the date;
+ num_sold: the count of distinct products sold on that date;
+ products: the names of sold products, comma-separated and sorted alphabetically.

Return the result ordered by sell_date in ascending order.

Дана таблица:
+ Activities:
    + sell_date: дата продажи продукта;
    + product: название проданного продукта.

Таблица не имеет первичного ключа, строки могут повторяться.

Напиши SQL-запрос, который определит для каждой даты:
+ количество различных проданных продуктов,
+ и список их названий, объединённых через запятую в лексикографическом порядке.

Результат должен содержать колонки:
+ sell_date — дата;
+ num_sold — количество уникальных продуктов, проданных в эту дату;
+ products — строка с названиями продуктов, разделёнными запятой и отсортированными по алфавиту.

Результат нужно отсортировать по sell_date по возрастанию.
*/

SELECT  sell_date,   
        COUNT(DISTINCT product) AS num_sold,
        GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;