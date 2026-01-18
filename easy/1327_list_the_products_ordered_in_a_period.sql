/*
You are given two tables:
Products:
    - product_id
    - product_name
    - product_category

Orders:
    - product_id
    - order_date
    - unit

The Orders table may contain duplicates.

Write an SQL query to find all products that had at least 100 units ordered in February 2020, and return their names along with the total units ordered.

Return the result with the following columns:
    - product_name
    - unit

The result can be returned in any order.

Даны две таблицы:
Products:
    - product_id
    - product_name
    - product_category

Orders:
    - product_id
    - order_date
    - unit

Таблица Orders может содержать повторяющиеся строки.

Напиши SQL-запрос, который вернёт названия продуктов, по которым было заказано не менее 100 единиц в феврале 2020 года, а также общее количество заказанных единиц.

Результат должен содержать колонки:
    - product_name - название продукта;
    - unit - суммарное количество заказов за февраль 2020.

Порядок строк в результате может быть произвольным.

Annetaan kaksi taulua:
Products:
    - product_id
    - product_name
    - product_category

Orders:
    - product_id
    - order_date
    - unit

Taulu Orders voi sisältää päällekkäisiä rivejä.

Kirjoita SQL-kysely, joka palauttaa niiden tuotteiden nimet, joista tilattiin vähintään 100 yksikköä helmikuussa 2020, sekä tilattujen yksiköiden kokonaismäärän.

Tuloksen tulee sisältää sarakkeet:
    - product_name - tuotteen nimi;
    - unit - helmikuussa 2020 tilattujen yksikköjen kokonaismäärä.

Rivien järjestyksellä tuloksessa ei ole väliä.
*/

SELECT Products.product_name AS product_name, SUM(Orders.unit) AS unit
FROM Products
JOIN Orders ON Products.product_id = Orders.product_id
WHERE Orders.order_date >= '2020-02-01' AND Orders.order_date < '2020-03-01'
GROUP BY Products.product_id, Products.product_name
HAVING SUM(Orders.unit) >= 100;