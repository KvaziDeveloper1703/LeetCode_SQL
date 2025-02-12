/*
We have two tables:

+ Table Sales:
    + sale_id (integer, sale identifier).
    + product_id (integer, product identifier — foreign key referencing Product table).
    + year (integer, year of sale).
    + quantity (integer, number of units sold).
    + price (integer, price per unit).
Primary key for this table is the combination of (sale_id, year).
Each row represents a sale of a specific product (product_id) in a given year (year), with the given price per unit (price).

+ Table Product:
    + product_id (integer, product identifier, primary key).
    + product_name (string, product name).
This table stores product names (product_name) associated with their product_id.

Write an SQL query to join the data from both tables and return the product name, year, and price per unit for each sale.

Return a table with the following columns:
+ product_name (product name),
+ year (year of sale),
+ price (price per unit).

The result order can be arbitrary.

У нас есть две таблицы:

+ Таблица Sales:
    + sale_id (целое число, идентификатор продажи).
    + product_id (целое число, идентификатор товара — внешний ключ к таблице Product).
    + year (целое число, год продажи).
    + quantity (целое число, количество проданных единиц).
    + price (целое число, цена за единицу товара).
Первичный ключ для этой таблицы — комбинация (sale_id, year).
Каждая строка представляет одну продажу конкретного товара (product_id) в определённый год (year), с указанной ценой за единицу (price).

Таблица Product:
+ product_id (целое число, идентификатор товара, первичный ключ).
+ product_name (строка, название товара).
В этой таблице содержатся названия товаров (product_name) по их product_id.

Написать SQL-запрос, который объединяет данные из двух таблиц и выводит название товара, год и цену за единицу для каждой продажи.

Вывести таблицу с колонками:
+ product_name (название товара),
+ year (год продажи),
+ price (цена за единицу товара).

Порядок строк в ответе может быть произвольным.
*/

SELECT Product.product_name, Sales.year, Sales.price
FROM Sales
INNER JOIN Product
ON Sales.product_id = Product.product_id;