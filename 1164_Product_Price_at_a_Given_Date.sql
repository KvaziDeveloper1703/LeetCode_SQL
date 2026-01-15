/*
You are given a table Products:
    - product_id
    - new_price
    - change_date

Each row shows when and how the price of a product was changed.

Write an SQL query to return the price of every product on the date 2019-08-16.
Assume the initial price of every product is 10.

Return the result table with:
    - product_id;
    - price.

Return rows in any order.

Дана таблица Products:
    - product_id
    - new_price
    - change_date

Каждая строка показывает, как и когда изменялась цена товара.

Напиши SQL-запрос, который вернёт цену каждого продукта на дату 2019-08-16.
Считай, что начальная цена всех товаров - 10.

Верни таблицу с колонками:
    - product_id;
    - price.

Порядок строк в результате не имеет значения.

Annetaan taulu Products:
    - product_id
    - new_price
    - change_date

Jokainen rivi näyttää, miten ja milloin tuotteen hinta muuttui.

Kirjoita SQL-kysely, joka palauttaa jokaisen tuotteen hinnan päivänä 2019-08-16.
Oleta, että kaikkien tuotteiden alkuperäinen hinta on 10.

Palauta taulu, jossa on sarakkeet:
    - product_id
    - price

Rivien järjestyksellä tuloksessa ei ole väliä.
*/

WITH latest_prices AS (
    SELECT
        product_id,
        new_price,
        ROW_NUMBER() OVER (
            PARTITION BY product_id
            ORDER BY change_date DESC
        ) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
)
SELECT
    all_products.product_id,
    COALESCE(latest_prices.new_price, 10) AS price
FROM (
    SELECT DISTINCT product_id
    FROM Products
) AS all_products
LEFT JOIN latest_prices ON all_products.product_id = latest_prices.product_id AND latest_prices.rn = 1;