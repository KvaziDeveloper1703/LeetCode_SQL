/*
We have a table Products with the following columns:
+ product_id (integer, primary key);
+ low_fats (ENUM type 'Y', 'N'), where 'Y' means the product is low fat, and 'N' means it is not;
+ recyclable (ENUM type 'Y', 'N'), where 'Y' means the product is recyclable, and 'N' means it is not.

You need to write an SQL query to find the product IDs of the products that are both low fat (low_fats = 'Y') and recyclable (recyclable = 'Y').

Return a table with a single column product_id containing the IDs of products that meet the conditions. The result order can be arbitrary.

У нас есть таблица Products со следующими колонками:
+ product_id (целое число, первичный ключ).
+ low_fats (перечислимый тип ENUM('Y', 'N')), где 'Y' означает, что продукт является низкожировым, а 'N' — что не является.
+ recyclable (перечислимый тип ENUM('Y', 'N')), где 'Y' означает, что продукт подлежит переработке, а 'N' — что не подлежит.

Требуется написать SQL-запрос, который находит id продуктов, которые одновременно являются низкожировыми (low_fats = 'Y') и подлежат переработке (recyclable = 'Y').

Вывести таблицу с одним столбцом product_id, содержащую идентификаторы продуктов, удовлетворяющих этим условиям. Порядок строк в ответе может быть произвольным.
*/

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';