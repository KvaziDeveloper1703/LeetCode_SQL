/*
You are given a table:
+ Triangle:
    + x, y, z: Lengths of three line segments;
    + (x, y, z) is the primary key.

Each row represents a potential triangle defined by three side lengths.
Write an SQL query to determine whether the three lengths can form a triangle.
A triangle is valid if the sum of any two sides is greater than the third side:
+ x + y > z;
+ x + z > y;
+ y + z > x.

Return a column triangle with value "Yes" if the sides form a triangle, and "No" otherwise.
The result can be returned in any order.

Дана таблица:
+ Triangle:
    + x, y, z: длины трёх отрезков;
    + (x, y, z) — первичный ключ.

Каждая строка описывает возможный треугольник по трём сторонам.
Напиши SQL-запрос, который определит, можно ли из этих трёх длин составить треугольник.
Треугольник возможен, если сумма любых двух сторон больше третьей:
+ x + y > z;
+ x + z > y;
+ y + z > x.

Верни столбец triangle со значением "Yes", если треугольник можно составить, и "No" — если нельзя.
Порядок строк в результате не важен.
*/

SELECT x, y, z,
    CASE
        WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;