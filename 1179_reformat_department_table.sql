/*
You are given a table with the following columns: id (department ID), revenue, and month.
    + The combination of (id, month) is the primary key;
    + Each row represents the revenue for a department in a specific month;
    + The month column has values from the set: ["Jan", "Feb", "Mar", ..., "Dec"].

Your task is to pivot the table so that:
    + Each row corresponds to a department (id);
    + There is one column for revenue of each month.

Return the resulting table in any order.

У тебя есть таблица с колонками: id (идентификатор отдела), revenue (выручка) и month (месяц).
    + Первичный ключ — это пара (id, month);
    + Каждая строка отражает выручку определённого отдела за конкретный месяц;
    + Колонка month принимает значения из списка: ["Jan", "Feb", "Mar", ..., "Dec"].

Твоя задача — транспонировать таблицу так, чтобы:
    + Каждая строка соответствовала одному отделу (id);
    + Для каждого месяца была отдельная колонка с выручкой.

Результат можно вернуть в произвольном порядке.
*/

SELECT
    id,
    MAX(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
    MAX(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
    MAX(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue,
    MAX(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
    MAX(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue,
    MAX(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue,
    MAX(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue,
    MAX(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue,
    MAX(CASE WHEN month = 'Sep' THEN revenue END) AS Sep_Revenue,
    MAX(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue,
    MAX(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Revenue,
    MAX(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department
GROUP BY id;