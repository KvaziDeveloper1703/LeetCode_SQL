/*
You are given a table MyNumbers:
    - num

The table may contain duplicates.

A single number is one that appears only once in the table.
Write an SQL query to find the largest single number. 
If there are no single numbers, return null.

Дана таблица MyNumbers:
    - num

В таблице могут быть дубликаты.

Одиночное число - это число, которое встречается только один раз в таблице.
Напишите SQL-запрос, который вернёт наибольшее одиночное число.
Если таких чисел нет - верните null.

Annettu taulukko MyNumbers:
    - num

Taulukossa voi olla duplikaatteja.

Yksittäinen luku on luku, joka esiintyy taulukossa vain kerran.
Kirjoita SQL-kysely, joka palauttaa suurimman yksittäisen luvun.
Jos tällaisia lukuja ei ole, palauta null.
*/

SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS SingleNumbers;