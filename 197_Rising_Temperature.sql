/*
You are given a table named Weather with the following structure:
+ The id column contains unique values.
+ There are no duplicate rows with the same recordDate.
+ The table records the temperature on a specific date.

Write a SQL query to find all id values where the temperature is higher than the previous day's temperature.
Return the result table in any order.

Вам дана таблица Weather со следующей структурой:
+ Колонка id содержит уникальные значения.
+ В таблице нет строк с одинаковым recordDate.
+ В таблице записана температура за определённый день.

Напишите SQL-запрос, который найдёт все id, у которых температура выше, чем в предыдущий день.
Верните таблицу с результатом в любом порядке.
*/

SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;
