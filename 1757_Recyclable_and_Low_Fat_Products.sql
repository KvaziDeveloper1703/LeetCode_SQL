/*
You are given a table:
+ Products:
    + product_id: unique ID of the product (primary key);
    + low_fats: 'Y' if the product is low fat, 'N' otherwise;
    + recyclable: 'Y' if the product is recyclable, 'N' otherwise.

Write an SQL query to find the product IDs of all products that are both low fat and recyclable.
Return the result with the following column:
+ product_id

The result can be returned in any order.

Дана таблица:
+ Products:
    + product_id: уникальный идентификатор продукта (первичный ключ);
    + low_fats: 'Y', если продукт с пониженным содержанием жира, иначе 'N';
    + recyclable: 'Y', если продукт подлежит переработке, иначе 'N'.

Напиши SQL-запрос, который вернёт идентификаторы продуктов, одновременно:
+ с пониженным содержанием жира (low_fats = 'Y'),
+ и подлежащих переработке (recyclable = 'Y').

Результат должен содержать колонку:
+ product_id

Порядок строк в результате не имеет значения.
*/

SELECT Products.product_id
FROM Products
WHERE Products.low_fats = 'Y' AND Products.recyclable = 'Y';