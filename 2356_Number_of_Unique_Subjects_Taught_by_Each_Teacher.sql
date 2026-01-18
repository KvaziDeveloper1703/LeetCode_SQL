/*
You are given a table Teacher:
    - teacher_id
    - subject_id
    - dept_id

Each row shows that a teacher teaches a subject in a specific department.

Write an SQL query to return, for each teacher, the number of unique subjects they teach, regardless of department.

Дана таблица Teacher:
    - teacher_id
    - subject_id
    - dept_id

Каждая строка показывает, что преподаватель ведёт предмет в определённой кафедре.

Напиши SQL-запрос, который вернёт для каждого преподавателя количество уникальных предметов, которые он преподаёт.
*/

SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;