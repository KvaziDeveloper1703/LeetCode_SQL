/*
You are given a table:
+ Logs:
    + id: Unique ID (auto-incrementing from 1);
    + num: A value represented as varchar.

Each row represents a log entry, and the order is determined by id.
Write an SQL query to find all numbers (num) that appear at least three times in a row (i.e., three or more consecutive rows with the same num).
Return the result with a single column named ConsecutiveNums.
The result can be in any order.

Дана таблица:
+ Logs:
    + id: уникальный идентификатор строки (автоинкремент с 1);
    + num: значение в виде строки (varchar).

Каждая строка — это запись в логах. Порядок определяется по id.
Напиши SQL-запрос, который найдёт все значения num, которые идут подряд хотя бы три раза (то есть встречаются минимум в трёх соседних строках подряд с одинаковым значением).
Верни результат в виде одной колонки ConsecutiveNums.
Порядок строк в результате не важен.
*/

SELECT DISTINCT logs_1.num AS ConsecutiveNums
FROM Logs logs_1
JOIN Logs logs_2 ON logs_1.id = logs_2.id - 1
JOIN Logs logs_3 ON logs_1.id = logs_3.id - 2
WHERE logs_1.num = logs_2.num AND logs_2.num = logs_3.num;