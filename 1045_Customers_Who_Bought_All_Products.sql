/*
You are given two tables:
Customer:
    - customer_id
    - product_key

Product:
    - product_key

Write an SQL query to find all customer IDs who bought every product listed in the Product table.
Return the result in any order.

Даны две таблицы:
Customer:
    - customer_id
    - product_key

Product:
    product_key

Напиши SQL-запрос, который вернёт ID покупателей, купивших все товары, указанные в таблице Product.
Порядок строк в результате не важен.

Annetaan kaksi taulua:
Customer:
    - customer_id
    - product_key

Product:
    - product_key

Kirjoita SQL-kysely, joka palauttaa niiden asiakkaiden ID:t, jotka ovat ostaneet kaikki taulussa Product luetellut tuotteet.
Rivien järjestyksellä tuloksessa ei ole väliä.
*/

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);