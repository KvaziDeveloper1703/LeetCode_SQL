/*
You are given two tables: Product and Sales.
Each sale is linked to a product.

Find all products that were sold only in the first quarter of 2019, i.e. from 2019-01-01 to 2019-03-31 (inclusive), and were not sold outside this period.

Return a table with:
    - product_id
    - product_name

The result can be in any order.

Даны две таблицы: Product и Sales.
Каждая продажа связана с продуктом.

Найдите все продукты, которые продавались только в первом квартале 2019 года, то есть в период с 2019-01-01 по 2019-03-31 включительно, и не продавались вне этого периода.

Вернуть таблицу с полями:
    - product_id
    - product_name

Порядок строк не важен.
*/

SELECT product.product_id, product.product_name
FROM Product AS product
JOIN Sales AS sales ON product.product_id = sales.product_id
GROUP BY product.product_id, product.product_name
HAVING MIN(sales.sale_date) >= '2019-01-01' AND MAX(sales.sale_date) <= '2019-03-31';