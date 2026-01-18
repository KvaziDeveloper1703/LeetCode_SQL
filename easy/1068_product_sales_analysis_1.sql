/*
We have two tables:
Sales:
    - sale_id
    - product_id
    - year
    - quantity
    - price

Product:
    - product_id
    - product_name

Write an SQL query to join the data from both tables and return the product name, year, and price per unit for each sale.

Return a table with the following columns:
    - product_name
    - year
    - price

The result order can be arbitrary.

У нас есть две таблицы:
Sales:
    - sale_id
    - product_id
    - year
    - quantity
    - price

Product:
    - product_id
    - product_name

Напишите SQL-запрос, который объединяет данные из двух таблиц и выводит название товара, год и цену за единицу для каждой продажи.

Вывести таблицу с колонками:
    - product_name
    - year
    - price

Порядок строк в ответе может быть произвольным.

Meillä on kaksi taulua:
Sales:
    - sale_id
    - product_id
    - year
    - quantity
    - price

Product:
    - product_id
    - product_name

Kirjoita SQL-kysely, joka yhdistää näiden kahden taulun tiedot ja näyttää jokaisesta myynnistä tuotteen nimen, vuoden ja yksikköhinnan.

Palauta taulu, jossa on sarakkeet:
    - product_name
    - year
    - price

Rivien järjestys tuloksessa voi olla mikä tahansa.
*/

SELECT Product.product_name, Sales.year, Sales.price
FROM Sales
INNER JOIN Product ON Sales.product_id = Product.product_id;