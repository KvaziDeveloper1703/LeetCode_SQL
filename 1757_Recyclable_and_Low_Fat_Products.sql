/*
You are given a table Products:
    - product_id
    - low_fats
    - recyclable

Write an SQL query to find the product IDs of all products that are both low fat and recyclable.

Return the result with the following column:
    - product_id

The result can be returned in any order.

Дана таблица Products:
    - product_id
    - low_fats
    - recyclable

Напиши SQL-запрос, который вернёт идентификаторы продуктов, одновременно:
    - с пониженным содержанием жира (low_fats = 'Y'),
    - и подлежащих переработке (recyclable = 'Y').

Результат должен содержать колонку:
    - product_id

Порядок строк в результате не имеет значения.

Annetaan taulu Products:
    - product_id
    - low_fats
    - recyclable

Kirjoita SQL-kysely, joka palauttaa niiden tuotteiden tunnisteet, jotka ovat samanaikaisesti:
    - vähärasvaisia (low_fats = 'Y'),
    - ja kierrätettäviä (recyclable = 'Y').

Tuloksen tulee sisältää sarake:
    - product_id

Rivien järjestyksellä ei ole väliä.
*/

SELECT Products.product_id
FROM Products
WHERE Products.low_fats = 'Y' AND Products.recyclable = 'Y';