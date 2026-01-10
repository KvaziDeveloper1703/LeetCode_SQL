/*
You are given a table Products with columns:
    - product_id;
    - store1, store2, store3.
Each row represents a product and its price in three stores.

Transform the table so that each row contains: (product_id, store, price).
Include only rows where the product is available in the store.
The result order does not matter.

Дана таблица Products со столбцами:
    - product_id;
    - store1, store2, store3.
Каждая строка - это товар и его цена в трёх магазинах.

Преобразуйте таблицу так, чтобы каждая строка имела вид: (product_id, store, price).
Учитывать только те магазины, где цена не равна NULL.
Порядок строк не важен.
*/

SELECT product_id, 'store1' AS store, store1 AS price
FROM Products
WHERE store1 IS NOT NULL

UNION ALL

SELECT product_id, 'store2' AS store, store2 AS price
FROM Products
WHERE store2 IS NOT NULL

UNION ALL

SELECT product_id, 'store3' AS store, store3 AS price
FROM Products
WHERE store3 IS NOT NULL;