/*
You are given two tables:
+ Products:
    + product_id: unique identifier of the product (primary key);
    + product_name: name of the product;
    + product_category: category of the product.

+ Orders:
    + product_id: ID of the product ordered (foreign key to Products);
    + order_date: date when the order was placed;
    + unit: number of units ordered.

The Orders table may contain duplicates.

Write an SQL query to find all products that had at least 100 units ordered in February 2020, and return their names along with the total units ordered.
Return the result with the following columns:
+ product_name: the name of the product;
+ unit: total number of units ordered in February 2020.

The result can be returned in any order.

Даны две таблицы:
+ Products:
    + product_id: уникальный идентификатор продукта (первичный ключ);
    + product_name: название продукта;
    + product_category: категория продукта.

+ Orders:
    + product_id: ID заказанного продукта (внешний ключ к Products);
    + order_date: дата заказа;
    + unit: количество заказанных единиц.

Таблица Orders может содержать повторяющиеся строки.

Напиши SQL-запрос, который вернёт названия продуктов, по которым было заказано не менее 100 единиц в феврале 2020 года, а также общее количество заказанных единиц.
Результат должен содержать колонки:
+ product_name — название продукта;
+ unit — суммарное количество заказов за февраль 2020.

Порядок строк в результате может быть произвольным.
*/

SELECT  Products.product_name AS product_name,
        SUM(Orders.unit) AS unit
FROM Products
JOIN Orders ON Products.product_id = Orders.product_id
WHERE Orders.order_date >= '2020-02-01' AND Orders.order_date < '2020-03-01'
GROUP BY Products.product_id, Products.product_name
HAVING SUM(Orders.unit) >= 100;