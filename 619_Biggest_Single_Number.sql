/*
You are given a table:
+ MyNumbers:
    + num: An integer value;
    + The table may contain duplicates (no primary key).

A single number is one that appears only once in the table.
Write an SQL query to find the largest single number. If there are no single numbers, return null.

Дана таблица:
+ MyNumbers:
    + num: целое число;
    + В таблице могут быть дубликаты (первичного ключа нет).

Одиночное число — это число, которое встречается только один раз в таблице.
Напиши SQL-запрос, который вернёт наибольшее одиночное число. Если таких чисел нет — верни null.
*/

SELECT MAX(num) AS num
FROM (  SELECT num
        FROM MyNumbers
        GROUP BY num
        HAVING COUNT(*) = 1
) AS SingleNumbers;