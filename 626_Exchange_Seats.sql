/*
You are given a table Seat:
    - id
    - student

Each row represents a student and the seat they are currently in.

Write an SQL query to swap the seat ID of every two consecutive students.
If the total number of students is odd, the last student’s seat remains unchanged.

Return the result ordered by id in ascending order.

Дана таблица Seat:
    - id
    - student

Каждая строка представляет студента и его текущее место.

Напиши SQL-запрос, который поменяет местами каждую пару соседних студентов.
Если студентов нечётное количество - последний остаётся на своём месте.

Результат отсортируй по id по возрастанию.

Annetaan taulu Seat:
    - id
    - student

Jokainen rivi edustaa opiskelijaa ja hänen nykyistä paikkaansa.

Kirjoita SQL-kysely, joka vaihtaa jokaisen vierekkäisen opiskelijaparin paikat keskenään.
Jos opiskelijoiden määrä on pariton, viimeinen opiskelija jää omalle paikalleen.

Palauta tulos järjestettynä id:n mukaan nousevasti.
*/

SELECT
    CASE
        WHEN id % 2 = 1 AND id + 1 <= (SELECT MAX(id) FROM Seat)
        THEN id + 1

        WHEN id % 2 = 0
        THEN id - 1

        ELSE id
    END AS id,
    student
FROM Seat
ORDER BY id;