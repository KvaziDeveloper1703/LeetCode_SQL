/*
You are given two tables:
+ Customer:
    + customer_id: ID of the customer (not null);
    + product_key: ID of the product the customer bought;
    + The table may contain duplicate rows;
    + product_key is a foreign key to the Product table,

+ Product:
    + product_key: Unique ID of the product (primary key).

Write an SQL query to find all customer IDs who bought every product listed in the Product table.
Return the result in any order.

Даны две таблицы:
+ Customer:
    + customer_id: идентификатор покупателя (не NULL);
    + product_key: идентификатор купленного товара;
    + В таблице могут быть дубликаты;
    + product_key — внешний ключ к таблице Product.

+ Product:
    product_key: уникальный идентификатор товара (первичный ключ);

Напиши SQL-запрос, который вернёт ID покупателей, купивших все товары, указанные в таблице Product.
Порядок строк в результате не важен.
*/

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);