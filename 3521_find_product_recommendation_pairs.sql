/*
You are given tables ProductPurchases and ProductInfo.

Find distinct pairs of products (product1_id < product2_id) that were purchased by the same users.

For each product pair:
    - Count how many different customers bought both products;
    - Keep only pairs purchased by at least 3 customers;
    - Include each product’s category.

Return:
    - product1_id, product2_id;
    - product1_category, product2_category;
    - customer_count.

Order the result by:
    - customer_count (descending);
    - product1_id (ascending);
    - product2_id (ascending).

Даны таблицы ProductPurchases и ProductInfo.

Найдите уникальные пары товаров (product1_id < product2_id), которые покупались одними и теми же пользователями.

Для каждой пары:
    - Посчитайте количество разных покупателей, купивших оба товара;
    - Оставьте пары, купленные минимум 3 покупателями;
    - Укажите категории обоих товаров.

Выведите:
    - product1_id, product2_id;
    - product1_category, product2_category;
    - customer_count.

Отсортируйте результат по:
    - customer_count по убыванию;
    - product1_id по возрастанию;
    - product2_id по возрастанию.

Annetaan taulut ProductPurchases ja ProductInfo.

Etsi uniikit tuotepareja (product1_id < product2_id), joita samat käyttäjät ovat ostaneet.

Jokaiselle parille:
    - laske eri ostajien määrä, jotka ovat ostaneet molemmat tuotteet;
    - jätä mukaan parit, jotka vähintään 3 eri ostajaa on ostanut;
    - ilmoita molempien tuotteiden kategoriat.

Tulosta:
    - product1_id, product2_id;
    - product1_category, product2_category;
    - customer_count.

Järjestä tulos seuraavasti:
    - customer_count laskevaan järjestykseen;
    - product1_id nousevaan järjestykseen;
    - product2_id nousevaan järjestykseen.
*/

WITH user_product_pairs AS (
    SELECT first_purchase.user_id AS user_id, first_purchase.product_id AS product1_id, second_purchase.product_id AS product2_id
    FROM ProductPurchases AS first_purchase
    JOIN ProductPurchases AS second_purchase ON first_purchase.user_id = second_purchase.user_id AND first_purchase.product_id < second_purchase.product_id
),
product_pair_customer_counts AS (
    SELECT product1_id, product2_id, COUNT(DISTINCT user_id) AS customer_count
    FROM user_product_pairs
    GROUP BY product1_id, product2_id
    HAVING COUNT(DISTINCT user_id) >= 3
)
SELECT product_pair_customer_counts.product1_id, product_pair_customer_counts.product2_id, first_product_info.category AS product1_category, second_product_info.category AS product2_category, product_pair_customer_counts.customer_count
FROM product_pair_customer_counts
JOIN ProductInfo AS first_product_info ON product_pair_customer_counts.product1_id = first_product_info.product_id
JOIN ProductInfo AS second_product_info ON product_pair_customer_counts.product2_id = second_product_info.product_id
ORDER BY product_pair_customer_counts.customer_count DESC, product_pair_customer_counts.product1_id ASC, product_pair_customer_counts.product2_id ASC;