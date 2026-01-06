/*
You are given a table named products with the following structure:
    - product_id - int;
    - product_name - varchar;
    - description - varchar.
product_id is the primary key of the table.

Each row represents a product with its unique identifier, name, and description.

Write a SQL query to find all products whose description contains a valid serial number.

A serial number is considered valid if it meets all of the following conditions:
    - It starts with the letters SN;
    - It is followed by exactly 4 digits;
    - Then comes a hyphen (-) followed by exactly 4 digits;
    - The serial number must appear anywhere within the description.

Return the result table containing product_id, product_name, and description, ordered by product_id in ascending order.

Дана таблица products со следующей структурой:
    - product_id - целочисленный идентификатор товара;
    - product_name - название товара;
    - description - описание товара.
Поле product_id является первичным ключом таблицы.

Каждая строка таблицы представляет собой товар с его уникальным идентификатором, названием и описанием.

Напишите SQL-запрос, который находит все товары, в описании которых содержится корректный серийный номер.

Серийный номер считается корректным, если он удовлетворяет всем следующим условиям:
    - начинается с букв SN;
    - далее следуют ровно 4 цифры;
    - затем идёт дефис (-) и ровно 4 цифры;
    - серийный номер может располагаться в любой части описания.

Верните таблицу с колонками product_id, product_name и description, отсортированную по product_id в порядке возрастания.
*/

SELECT product_id, product_name, description
FROM products
WHERE REGEXP_LIKE(
    description,
    '(^|[^A-Za-z0-9])SN[0-9]{4}-[0-9]{4}([^A-Za-z0-9]|$)',
    'c'
)
ORDER BY product_id;