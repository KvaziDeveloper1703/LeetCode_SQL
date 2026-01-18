/*
You are given tables sales and products.

For each season (Winter, Spring, Summer, Fall), find the most popular product category.

Rules:
    - Popularity is based on total quantity sold in that season;
    - If there is a tie, choose the category with higher total revenue;
    - If still tied, choose the lexicographically smaller category.

Return:
    - season
    - category
    - total_quantity
    - total_revenue

Order the result by season in ascending order.

Даны таблицы sales и products.

Для каждого сезона (Winter, Spring, Summer, Fall) найдите самую популярную категорию товаров.

Правила:
    - Популярность определяется по общему количеству проданных товаров;
    - При равенстве выберите категорию с большей выручкой;
    - Если снова равенство - выберите лексикографически меньшую категорию.

Выведите:
    - season
    - category
    - total_quantity
    - total_revenue

Отсортируйте результат по season по возрастанию.

Annetaan taulut sales ja products.

Etsi jokaiselle vuodenajalle (Winter, Spring, Summer, Fall) suosituin tuotekategoria.

Säännöt:
    - suosio määräytyy myytyjen tuotteiden kokonaismäärän perusteella;
    - jos tasapeli, valitse kategoria, jolla on suurempi liikevaihto;
    - jos edelleen tasapeli, valitse leksikografisesti pienempi kategoria.

Tulosta:
    - season
    - category
    - total_quantity
    - total_revenue

Järjestä tulos nousevasti sarakkeen season mukaan.
*/

WITH sales_with_season AS (
    SELECT sales.sale_id, sales.product_id, sales.sale_date, sales.quantity, sales.price, products.category,
        CASE
            WHEN EXTRACT(MONTH FROM sales.sale_date) IN (12, 1, 2) THEN 'Winter'
            WHEN EXTRACT(MONTH FROM sales.sale_date) IN (3, 4, 5) THEN 'Spring'
            WHEN EXTRACT(MONTH FROM sales.sale_date) IN (6, 7, 8) THEN 'Summer'
            WHEN EXTRACT(MONTH FROM sales.sale_date) IN (9, 10, 11) THEN 'Fall'
        END AS season
    FROM sales
    JOIN products ON sales.product_id = products.product_id
),
category_aggregates AS (
    SELECT season, category,
        SUM(quantity) AS total_quantity,
        SUM(quantity * price) AS total_revenue
    FROM sales_with_season
    GROUP BY season, category
),
ranked_categories AS (
    SELECT season, category, total_quantity, total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY season
            ORDER BY total_quantity DESC, total_revenue DESC, category ASC
        ) AS category_rank
    FROM category_aggregates
)
SELECT season, category, total_quantity, total_revenue
FROM ranked_categories
WHERE category_rank = 1
ORDER BY season;