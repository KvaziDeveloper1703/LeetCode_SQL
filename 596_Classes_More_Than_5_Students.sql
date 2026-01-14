/*
You are given a table Courses:
    - student
    - class

Each row shows which student is enrolled in which class.
Write an SQL query to find all classes with at least five students.
Return the result in any order.

Дана таблица Courses:
    - student
    - class

Каждая строка показывает, в каком классе учится студент.
Напиши SQL-запрос, который вернёт все классы, в которых минимум 5 студентов.
Порядок строк в результате любой.

Annettu taulukko Courses:
    - student
    - class

Jokainen rivi näyttää, missä luokassa opiskelija opiskelee.
Kirjoita SQL-kysely, joka palauttaa kaikki luokat, joissa on vähintään 5 opiskelijaa.
Tuloksen rivien järjestyksellä ei ole väliä.
*/

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;