/*
You are given a table:
+ Employee:
    + employee_id: ID of the employee;
    + department_id: ID of the department the employee is part of;
    + primary_flag: 'Y' if this is the employee's primary department, 'N' otherwise;
    + (employee_id, department_id) is the primary key.

Each employee can belong to multiple departments, but must have one primary department.
If an employee belongs to only one department, their primary_flag will be 'N', but that department should still be treated as their primary.

Write an SQL query to return the employee_id and their primary department_id.
For employees with only one department, return that department.

Return results in any order.

Дана таблица:
+ Employee:
    + employee_id: ID сотрудника;
    + department_id: ID отдела, к которому он принадлежит;
    + primary_flag: 'Y' — если это основной отдел, 'N' — если нет;
    + (employee_id, department_id) — составной первичный ключ.

Сотрудник может состоять в нескольких отделах, но должен иметь один основной отдел.
Если сотрудник состоит только в одном отделе, то primary_flag будет 'N', но этот отдел всё равно считается основным.

Напиши SQL-запрос, который вернёт ID сотрудников и ID их основного отдела.
Для сотрудников с одним отделом — возвращай этот единственный отдел.

Порядок строк в результате не имеет значения.
*/

SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION

SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(*) = 1;