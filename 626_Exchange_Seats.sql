/*
You are given a table:
+ Seat:
    + id: Unique ID of the seat (starts from 1 and increases continuously);
    + student: Name of the student.

Each row represents a student and the seat they are currently in.

Write an SQL query to swap the seat ID of every two consecutive students.
If the total number of students is odd, the last student’s seat remains unchanged.

Return the result ordered by id in ascending order.

Дана таблица:
+ Seat:
    + id: уникальный номер места (начинается с 1 и увеличивается без пропусков);
    + student: имя студента.

Каждая строка представляет студента и его текущее место.

Напиши SQL-запрос, который поменяет местами каждую пару соседних студентов.
Если студентов нечётное количество — последний остаётся на своём месте.

Результат отсортируй по id по возрастанию.
*/

SELECT
    CASE
        WHEN id % 2 = 1 AND id + 1 <= (SELECT MAX(id) FROM Seat) THEN id + 1
        WHEN id % 2 = 0 THEN id - 1
        ELSE id
    END AS id,
    student
FROM Seat
ORDER BY id;