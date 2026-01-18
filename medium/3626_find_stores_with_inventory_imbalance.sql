/*
You are given two tables: stores and inventory.
Find stores with inventory imbalance.

Definitions:
    - For each store:
        - Find the most expensive product and its quantity;
        - Find the cheapest product and its quantity.
    - A store has inventory imbalance if quantity of the most expensive product < quantity of the cheapest product;
    - Imbalance ratio = cheapest_quantity / most_expensive_quantity;
    - Round the ratio to 2 decimal places.

Include only stores with at least 3 different products.

Output columns:
    - store_id
    - store_name
    - location
    - most_exp_product
    - cheapest_product
    - imbalance_ratio

Ordering:
    - By imbalance_ratio descending;
    - Then by store_name ascending.

Даны две таблицы: stores и inventory.
Найдите магазины с дисбалансом запасов.

Определения:
    - Для каждого магазина:
        - Найти самый дорогой товар (максимальная price) и его quantity;
        - Найти самый дешёвый товар (минимальная price) и его quantity.
    - Магазин считается дисбалансным, если количество самого дорогого товара меньше, чем количество самого дешёвого;
    - Коэффициент дисбаланса: cheapest_quantity / most_expensive_quantity;
    - Округлить до 2 знаков.

Учитывайте только магазины с минимум 3 товарами.

Результат должен содержать:
    - store_id
    - store_name
    - location
    - most_exp_product
    - cheapest_product
    - imbalance_ratio

Сортировка:
    - По imbalance_ratio по убыванию;
    - Затем по store_name по возрастанию.

Annetaan kaksi taulua: stores ja inventory.
Etsi myymälät, joissa on varastosaldojen epätasapaino.

Määritelmät:
    - Jokaiselle myymälälle:
        - etsi kallein tuote (suurin price) ja sen quantity;
        - etsi halvin tuote (pienin price) ja sen quantity.
    - Myymälä katsotaan epätasapainoiseksi, jos kalleimman tuotteen määrä on pienempi kuin halvimman tuotteen määrä.
    - Epätasapainokerroin: cheapest_quantity / most_expensive_quantity;
    - pyöristä arvo kahden desimaalin tarkkuuteen.

Huomioi vain myymälät, joilla on vähintään 3 tuotetta.

Tuloksen tulee sisältää:
    - store_id
    - store_name
    - location
    - most_exp_product
    - cheapest_product
    - imbalance_ratio

Järjestä tulos:
    - imbalance_ratio laskevaan järjestykseen;
    - sen jälkeen store_name nousevaan järjestykseen.
*/

WITH inventory_with_ranks AS (
    SELECT
        inventory.store_id,
        inventory.product_name,
        inventory.quantity,
        inventory.price,
        ROW_NUMBER() OVER (
            PARTITION BY inventory.store_id
            ORDER BY inventory.price DESC
        ) AS most_expensive_rank,
        ROW_NUMBER() OVER (
            PARTITION BY inventory.store_id
            ORDER BY inventory.price ASC
        ) AS cheapest_rank,
        COUNT(*) OVER (
            PARTITION BY inventory.store_id
        ) AS product_count
    FROM inventory
),
store_inventory_summary AS (
    SELECT
        store_id,
        MAX(CASE WHEN most_expensive_rank = 1 THEN product_name END) AS most_exp_product,
        MAX(CASE WHEN most_expensive_rank = 1 THEN quantity END) AS most_expensive_quantity,
        MAX(CASE WHEN cheapest_rank = 1 THEN product_name END) AS cheapest_product,
        MAX(CASE WHEN cheapest_rank = 1 THEN quantity END) AS cheapest_quantity,
        MAX(product_count) AS product_count
    FROM inventory_with_ranks
    GROUP BY store_id
)
SELECT
    stores.store_id,
    stores.store_name,
    stores.location,
    store_inventory_summary.most_exp_product,
    store_inventory_summary.cheapest_product,
    ROUND(
        store_inventory_summary.cheapest_quantity
        / store_inventory_summary.most_expensive_quantity,
        2
    ) AS imbalance_ratio
FROM store_inventory_summary
JOIN stores ON stores.store_id = store_inventory_summary.store_id
WHERE store_inventory_summary.product_count >= 3 AND store_inventory_summary.most_expensive_quantity < store_inventory_summary.cheapest_quantity
ORDER BY imbalance_ratio DESC, stores.store_name ASC;