/*
You are given two tables:
+ Sales:
    + sale_id: ID of the sale (together with year, forms a unique key);
    + product_id: ID of the product sold (foreign key to Product table);
    + year: Year of the sale;
    + quantity: Quantity of product sold;
    + price: Price per unit.

+ Product:
    + product_id: ID of the product (primary key);
    + product_name: Name of the product.

Write an SQL query to return, for each product, the first year it was sold, along with the product_id, quantity, and price from that first year.
Return the result in any order.

Даны две таблицы:
+ Sales:
    + sale_id: идентификатор продажи (вместе с year образует уникальную строку);
    + product_id: идентификатор товара (внешний ключ к таблице Product);
    + year: год продажи;
    + quantity: количество проданных единиц;
    + price: цена за единицу.

+ Product:
    + product_id: идентификатор товара (первичный ключ);
    + product_name: название товара.

Напиши SQL-запрос, который вернёт для каждого товара информацию о первом годе его продажи: product_id, first_year, quantity, price.
Порядок строк в результате — любой.
*/

SELECT  Sales.product_id,
        Sales.year AS first_year,
        Sales.quantity,
        Sales.price
FROM Sales
JOIN (  SELECT Sales.product_id, MIN(Sales.year) AS first_year
        FROM Sales
        GROUP BY Sales.product_id
) AS FirstSales ON Sales.product_id = FirstSales.product_id
                AND Sales.year = FirstSales.first_year;