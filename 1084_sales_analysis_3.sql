/*
You are given two tables:
Product:
    - product_id
    - product_name

Sales:
    - sale_id
    - product_id
    - sale_date

Each record in the Sales table represents a sale of a specific product from the Product table.

Find all products that:
    - were sold only in the first quarter of 2019
    - and were not sold on any dates outside this period.

Даны две таблицы:
Product:
    - product_id
    - product_name

Sales:
    - sale_id
    - product_id
    - sale_date

Каждая запись в таблице Sales соответствует продаже определённого товара из таблицы Product.

Нужно найти все товары, которые:
    - продавались только в первом квартале 2019 года
    - и не продавались ни в какие другие даты вне этого периода.

Annetaan kaksi taulua:
Product:
    - product_id
    - product_name

Sales:
    - sale_id
    - product_id
    - sale_date

Jokainen taulun Sales rivi vastaa tietyn tuotteen myyntiä taulusta Product.

Tehtävänä on löytää kaikki tuotteet, jotka:
    - myytiin vain vuoden 2019 ensimmäisellä neljänneksellä
    - eikä niitä myyty minään muuna ajankohtana tämän jakson ulkopuolella.
*/

SELECT product.product_id, product.product_name
FROM Product AS product
JOIN Sales AS sales ON product.product_id = sales.product_id
GROUP BY product.product_id, product.product_name
HAVING MIN(sales.sale_date) >= '2019-01-01' AND MAX(sales.sale_date) <= '2019-03-31';