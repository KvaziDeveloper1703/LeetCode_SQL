/*
You are given a table:
+ Employees:
    + employee_id: Unique ID of the employee (primary key);
    + name: Name of the employee;
    + manager_id: ID of the employee’s manager (can be NULL);
    + salary: Employee's salary.

Some employees do not have a manager (manager_id is NULL). If a manager leaves the company, their record is deleted from the table, but employees who reported to them will still have their manager_id set.
Write an SQL query to find the employee_ids of employees who:
+ Have a salary less than 30000;
+ Their manager no longer works at the company.

Return the results ordered by employee_id.

Дана таблица:
+ Employees:
    + employee_id: уникальный ID сотрудника (первичный ключ);
    + name: имя сотрудника;
    + manager_id: ID менеджера (может быть NULL);
    + salary: зарплата сотрудника.

Некоторые сотрудники не имеют менеджера (manager_id = NULL). Если менеджер уходит из компании, его запись удаляется из таблицы, но у сотрудников, которые ему подчинялись, manager_id остаётся прежним.
Напиши SQL-запрос, который вернёт employee_id сотрудников, у которых:
+ Зарплата меньше 30000;
+ Их менеджер больше не работает в компании.

Результат отсортируй по employee_id.
*/

SELECT employee_id
FROM Employees
WHERE   Employees.salary < 30000
        AND Employees.manager_id IS NOT NULL
        AND Employees.manager_id NOT IN ( SELECT employee_id FROM Employees
    )
ORDER BY employee_id;