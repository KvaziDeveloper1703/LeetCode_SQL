/*
You are given two tables:
+ Prices:
    + product_id: ID of the product;
    + start_date, end_date: Period when the price was active;
    + price: Price during this period;
    + No overlapping periods for the same product.

+ UnitsSold:
    + product_id: ID of the product;
    + purchase_date: Date of sale;
    + units: Number of units sold.

Find the average selling price for each product, rounded to 2 decimal places. If a product was never sold, its average price is 0.

Даны две таблицы:
+ Prices:
    + product_id: идентификатор товара;
    + start_date, end_date: период действия цены;
    + price: цена в этом периоде;
    + Для одного товара периоды не пересекаются.

+ UnitsSold:
    + product_id: идентификатор товара;
    + purchase_date: дата покупки;
    + units: количество проданных единиц.

Найди среднюю цену продажи для каждого товара, округлённую до двух знаков после запятой. Если товар не продавался — цена считается равной 0.
*/

SELECT  Prices.product_id,
        ROUND(
            COALESCE(SUM(UnitsSold.units * Prices.price), 0.0) /
            COALESCE(SUM(UnitsSold.units), 1),
            2
        ) AS average_price
FROM Prices
LEFT JOIN UnitsSold ON Prices.product_id = UnitsSold.product_id
                    AND UnitsSold.purchase_date BETWEEN Prices.start_date AND Prices.end_date
GROUP BY Prices.product_id;