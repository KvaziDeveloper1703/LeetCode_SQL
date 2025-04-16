/*
You are given a table:
+ Courses:
    + student: Name of the student;
    + class: Name of the class;
    + (student, class) is the primary key.

Each row shows which student is enrolled in which class.
Write an SQL query to find all classes with at least five students.
Return the result in any order.

Дана таблица:
+ Courses:
    + student: имя студента;
    + class: название класса;
    + (student, class) — первичный ключ.

Каждая строка показывает, в каком классе учится студент.
Напиши SQL-запрос, который вернёт все классы, в которых минимум 5 студентов.
Порядок строк в результате любой.
*/

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;