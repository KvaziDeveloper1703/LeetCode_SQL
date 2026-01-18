/*
We have a table Products:
    - product_id
    - low_fats
    - recyclable

You need to write an SQL query to find the product IDs of the products that are both low fat (low_fats = 'Y') and recyclable (recyclable = 'Y').
Return a table with a single column product_id containing the IDs of products that meet the conditions. The result order can be arbitrary.

У нас есть таблица "Products" со следующими колонками:
    - product_id
    - low_fats
    - recyclable

Требуется написать SQL-запрос, который находит id продуктов, которые одновременно являются низкожировыми (low_fats = 'Y') и подлежат переработке (recyclable = 'Y').
Вывести таблицу с одним столбцом product_id, содержащую идентификаторы продуктов, удовлетворяющих этим условиям. Порядок строк в ответе может быть произвольным.

Meillä on taulu Products, jossa on seuraavat sarakkeet:
    - product_id
    - low_fats
    - recyclable

Tehtävänä on kirjoittaa SQL-kysely, joka hakee niiden tuotteiden tunnisteet, jotka ovat sekä vähärasvaisia (low_fats = 'Y') että kierrätettäviä (recyclable = 'Y').
Tulosta taulu, jossa on yksi sarake product_id, ja jossa on näiden ehdot täyttävien tuotteiden tunnisteet. Rivien järjestyksellä ei ole väliä.
*/

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';