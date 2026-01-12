/* 
You are given a table Logs:
    - id
    - num

Each row represents a log entry, and the order is determined by id.

Write an SQL query to find all numbers (num) that appear at least three times in a row.

Return the result with a single column named ConsecutiveNums.
The result can be in any order.

Дана таблица Logs:
    - id
    - num

Каждая строка - это запись в логах. Порядок определяется по id.

Напиши SQL-запрос, который найдёт все значения num, которые идут подряд хотя бы три раза.

Верни результат в виде одной колонки ConsecutiveNums.
Порядок строк в результате не важен.

Sinulle on annettu taulu Logs, jossa on seuraavat sarakkeet:
    - id
    - num

Jokainen rivi on lokimerkintä. Rivien järjestys määräytyy sarakkeen id perusteella.

Kirjoita SQL-kysely, joka löytää kaikki num-arvot, jotka esiintyvät peräkkäin vähintään kolme kertaa.

Palauta tulos yhtenä sarakkeena nimeltä ConsecutiveNums.
Tulostaulun rivien järjestyksellä ei ole merkitystä.
*/

SELECT DISTINCT logs_1.num AS ConsecutiveNums
FROM Logs logs_1
JOIN Logs logs_2 ON logs_1.id = logs_2.id - 1
JOIN Logs logs_3 ON logs_1.id = logs_3.id - 2
WHERE logs_1.num = logs_2.num AND logs_2.num = logs_3.num;