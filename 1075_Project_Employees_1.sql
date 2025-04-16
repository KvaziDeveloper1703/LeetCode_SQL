/*
You are given two tables:
+ Project:
    + project_id: ID of the project;
    + employee_id: ID of the employee working on the project;
    + (project_id, employee_id) is the primary key.

+ Employee:
    + employee_id: ID of the employee;
    + name: Employee's name;
    + experience_years: Number of years of experience (not NULL).

Write an SQL query to return the average years of experience of employees for each project, rounded to 2 decimal places.

Даны две таблицы:
+ Project:
    + project_id: идентификатор проекта;
    + employee_id: идентификатор сотрудника, работающего над проектом;
    + (project_id, employee_id) — первичный ключ.

+ Employee:
employee_id: идентификатор сотрудника
name: имя сотрудника
experience_years: количество лет опыта (не NULL)

Напиши SQL-запрос, который вернёт средний опыт сотрудников для каждого проекта, округлённый до двух знаков после запятой.
*/

SELECT  Project.project_id,
        ROUND(AVG(Employee.experience_years), 2) AS average_years
FROM Project
JOIN Employee ON Project.employee_id = Employee.employee_id
GROUP BY Project.project_id;