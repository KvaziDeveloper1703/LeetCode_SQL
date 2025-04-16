/*
You are given a table:
+ Teacher:
    + teacher_id: ID of the teacher;
    + subject_id: ID of the subject;
    + dept_id: ID of the department;
    + (subject_id, dept_id) is the primary key.

Each row shows that a teacher teaches a subject in a specific department.
Write an SQL query to return, for each teacher, the number of unique subjects they teach, regardless of department.

Дана таблица:
+ Teacher:
    + teacher_id: идентификатор преподавателя;
    + subject_id: идентификатор предмета;
    + dept_id: идентификатор кафедры;
    + (subject_id, dept_id) — первичный ключ.

Каждая строка показывает, что преподаватель ведёт предмет в определённой кафедре.
Напиши SQL-запрос, который вернёт для каждого преподавателя количество уникальных предметов, которые он преподаёт (независимо от кафедры).
*/

SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;