/*
You are given a table:
+ Employees:
    + employee_id: Unique ID of the employee;
    + name: Name of the employee;
    + reports_to: ID of the manager this employee reports to (can be null);
    + age: Age of the employee.

A manager is an employee who has at least one other employee reporting directly to them.

Write an SQL query to return:
+ employee_id and name of each manager;
+ reports_count: number of employees who report directly to them;
+ average_age: average age of their direct reports, rounded to the nearest integer.

Return the result sorted by employee_id.

Дана таблица:
+ Employees:
    + employee_id: уникальный идентификатор сотрудника;
    + name: имя сотрудника;
    + reports_to: ID руководителя, которому он подчиняется (может быть null);
    + age: возраст сотрудника.

Руководитель — это сотрудник, у которого есть хотя бы один прямой подчинённый.

Напиши SQL-запрос, который вернёт:
+ employee_id и name каждого руководителя;
+ reports_count: количество сотрудников, которые напрямую ему подчиняются;
+ average_age: средний возраст этих подчинённых, округлённый до ближайшего целого.

Результат отсортируй по employee_id.
*/

SELECT  Employees.employee_id,
        Employees.name,
        COUNT(Reports.employee_id) AS reports_count,
        ROUND(AVG(Reports.age)) AS average_age
FROM Employees
JOIN Employees AS Reports ON Employees.employee_id = Reports.reports_to
GROUP BY Employees.employee_id, Employees.name
ORDER BY Employees.employee_id;