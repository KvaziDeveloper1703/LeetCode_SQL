/*
You are given two tables:
Sales:
    - sale_id
    - product_id
    - year
    - quantity
    - price

Product:
    - product_id
    - product_name

Write an SQL query to return, for each product, the first year it was sold, along with the product_id, quantity, and price from that first year.
Return the result in any order.

Даны две таблицы:
Sales:
    - sale_id
    - product_id
    - year
    - quantity
    - price

Product:
    - product_id
    - product_name

Напиши SQL-запрос, который вернёт для каждого товара информацию о первом годе его продажи: product_id, first_year, quantity, price.
Порядок строк в результате - любой.

Annetaan kaksi taulua:
Sales:
    - sale_id
    - product_id
    - year
    - quantity
    - price

Product:
    - product_id
    - product_name

Kirjoita SQL-kysely, joka palauttaa jokaiselle tuotteelle tiedot sen ensimmäisestä myyntivuodesta: product_id, first_year, quantity, price.
Rivien järjestyksellä tuloksessa ei ole väliä.
*/

SELECT Sales.product_id, Sales.year AS first_year, Sales.quantity, Sales.price
FROM Sales
JOIN (
    SELECT Sales.product_id, MIN(Sales.year) AS first_year
    FROM Sales
    GROUP BY Sales.product_id
) AS FirstSales ON Sales.product_id = FirstSales.product_id AND Sales.year = FirstSales.first_year;