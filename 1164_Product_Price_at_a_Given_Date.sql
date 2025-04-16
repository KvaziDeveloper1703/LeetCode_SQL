/*
You are given a table:
+ Products:
    + product_id: ID of the product;
    + new_price: Price the product was changed to;
    + change_date: Date when the price change occurred;
    + (product_id, change_date) is the primary key.

Each row shows when and how the price of a product was changed.
Write an SQL query to return the price of every product on the date 2019-08-16.
Assume the initial price of every product is 10 (before any changes).

Return the result table with:
+ product_id;
+ price — price of the product on 2019-08-16.

Return rows in any order.

Дана таблица:
+ Products:
    + product_id: идентификатор продукта;
    + new_price: новая цена продукта;
    + change_date: дата изменения цены;
    + (product_id, change_date) — составной первичный ключ.

Каждая строка показывает, как и когда изменялась цена товара.
Напиши SQL-запрос, который вернёт цену каждого продукта на дату 2019-08-16.
Считай, что начальная цена всех товаров — 10 (до любых изменений).

Верни таблицу с колонками:
+ product_id;
+ price — цена товара на 16 августа 2019 года.

Порядок строк в результате не имеет значения.
*/

WITH latest_prices AS ( SELECT  product_id,
                                new_price,
                                ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rn
                        FROM Products
                        WHERE change_date <= '2019-08-16'
                    )
SELECT all_products.product_id, COALESCE(latest_prices.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) AS all_products
LEFT JOIN latest_prices ON all_products.product_id = latest_prices.product_id AND latest_prices.rn = 1;