/*
You are given a table that contains the following columns:
    - id - Department ID;
    - revenue - Revenue amount;
    - month - Month name.

The combination of (id, month) is the primary key.

Each row represents the revenue of a specific department for a specific month.

The month column contains values from the set: ["Jan", "Feb", "Mar", ..., "Dec"].

Write a SQL query to pivot the table such that:
    - Each row corresponds to a single department (id);
    - There is a separate column for the revenue of each month (Jan, Feb, Mar, ..., Dec).

Return the resulting table in any order.

Дана таблица со следующими колонками:
    - id - идентификатор отдела;
    - revenue - сумма выручки;
    - month - название месяца.

Комбинация значений (id, month) является первичным ключом таблицы.

Каждая строка отражает выручку определённого отдела за конкретный месяц.

Колонка month принимает значения из множества: ["Jan", "Feb", "Mar", ..., "Dec"].

Напишите SQL-запрос, который транспонирует (pivot) таблицу так, чтобы:
    - каждая строка соответствовала одному отделу (id);
    - для каждого месяца (Jan, Feb, Mar, ..., Dec) была отдельная колонка с выручкой.

Итоговую таблицу можно вернуть в произвольном порядке.
*/

SELECT user_id, email
FROM Users
WHERE email REGEXP '^[A-Za-z0-9_]+@[A-Za-z]+\\.com$'
ORDER BY user_id;