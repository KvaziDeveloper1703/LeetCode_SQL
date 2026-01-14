/*
You are given a table Triangle, with columns x, y, z representing side lengths.

Each row represents a potential triangle defined by three side lengths.
Write an SQL query to determine whether the three lengths can form a triangle.

A triangle is valid if the sum of any two sides is greater than the third side:
    - x + y > z;
    - x + z > y;
    - y + z > x.

Return a column triangle with value "Yes" if the sides form a triangle, and "No" otherwise.
The result can be returned in any order.

Вам дана таблица Triangle, в которой столбцы x, y, z представляют длины трёх отрезков.

Каждая строка описывает потенциальный треугольник, заданный тремя длинами сторон.
Напишите SQL-запрос, который определяет, могут ли эти три длины образовать треугольник.

Треугольник считается корректным, если сумма любых двух сторон больше третьей:
    - x + y > z;
    - x + z > y;
    - y + z > x.

Верните столбец triangle со значением "Yes", если стороны образуют треугольник, и "No" в противном случае.
Результат можно возвращать в любом порядке.

Sinulle annetaan taulukko Triangle, jossa sarakkeet x, y, z kuvaavat kolmen janan pituuksia.

Jokainen rivi kuvaa mahdollista kolmiota, joka on määritelty kolmella sivunpituudella.
Kirjoita SQL-kysely, joka määrittää, voivatko nämä kolme pituutta muodostaa kolmion.

Kolmio on kelvollinen, jos minkä tahansa kahden sivun summa on suurempi kuin kolmas:
    - x + y > z;
    - x + z > y;
    - y + z > x.

Palauta sarake triangle, jonka arvo on "Yes", jos sivut muodostavat kolmion, ja "No" muuten.
Tuloksen rivit voidaan palauttaa missä järjestyksessä tahansa.
*/

SELECT x, y, z,
    CASE
        WHEN x + y > z 
        AND x + z > y 
        AND y + z > x 
        THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;