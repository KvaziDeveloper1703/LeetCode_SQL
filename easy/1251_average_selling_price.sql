/*
You are given two tables:
Prices:
    - product_id
    - start_date
    - end_date
    - price

UnitsSold:
    - product_id
    - purchase_date
    - units

Find the average selling price for each product, rounded to 2 decimal places. If a product was never sold, its average price is 0.

Даны две таблицы:
Prices:
    - product_id
    - start_date
    - end_date
    - price

UnitsSold:
    - product_id
    - purchase_date
    - units

Найди среднюю цену продажи для каждого товара, округлённую до двух знаков после запятой. Если товар не продавался - цена считается равной 0.

Annetaan kaksi taulua:
Prices:
    - product_id
    - start_date
    - end_date
    - price

UnitsSold:
    - product_id
    - purchase_date
    - units

Etsi jokaiselle tuotteelle keskimääräinen myyntihinta, pyöristettynä kahden desimaalin tarkkuuteen.
Jos tuotetta ei ole myyty, hinnaksi katsotaan 0.
*/

SELECT Prices.product_id, ROUND(COALESCE(SUM(UnitsSold.units * Prices.price), 0.0) / COALESCE(SUM(UnitsSold.units), 1), 2) AS average_price
FROM Prices
LEFT JOIN UnitsSold ON Prices.product_id = UnitsSold.product_id AND UnitsSold.purchase_date BETWEEN Prices.start_date AND Prices.end_date
GROUP BY Prices.product_id;