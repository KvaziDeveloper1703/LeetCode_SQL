/*
You are given two tables: "Employee" and "Bonus".

The "Employee" table stores information about employees, including their unique ID, name, salary, and their supervisor's ID. Each row represents a single employee.
Each row in this table contains:
+ The employee's ID (empId), which is unique for every employee;
+ The employee's name (name);
+ The ID of the supervisor (supervisor)—this indicates the employee’s manager. If the value is NULL, the employee does not have a supervisor;
+ The employee's salary (salary), which represents their earnings.

The "Bonus" table stores information about employee bonuses. Each row represents a bonus record for a specific employee. However, not all employees have a bonus entry.
Each row in this table contains:
+ The employee's ID (empId), which links to the "Employee" table as a foreign key;
+ The bonus amount (bonus) assigned to the employee. If an employee does not have a row in this table, it means they did not receive a recorded bonus.

Write an SQL query to return the name and bonus amount of employees whose bonus is less than 1000.
If an employee does not have a bonus record, their bonus should be displayed as NULL.

Return the result table in any order.

Даны две таблицы: "Employee" и "Bonus".

Таблица "Employee" содержит информацию о сотрудниках, включая их уникальный ID, имя, зарплату и ID их руководителя. Каждая строка представляет одного сотрудника.
Каждая строка этой таблицы содержит:
+ ID сотрудника (empId), который является уникальным для каждого работника;
+ Имя сотрудника (name);
+ ID руководителя (supervisor) — это идентификатор начальника данного сотрудника. Если значение NULL, значит, у сотрудника нет руководителя (например, если он занимает самую высокую должность);
+ Зарплату (salary) сотрудника.

Таблица "Bonus" содержит информацию о премиях сотрудников. Каждая строка в ней представляет запись о премии конкретного сотрудника. Однако не у всех сотрудников есть запись о премии в этой таблице.
Каждая строка этой таблицы содержит:
+ ID сотрудника (empId), который ссылается на empId из таблицы Employee (внешний ключ);
+ Размер премии (bonus), которую получил сотрудник. Если у сотрудника нет строки в этой таблице, значит, он не получал премию.

Напишите SQL-запрос, который вернёт имя и размер премии сотрудников, у которых премия меньше 1000.
Если у сотрудника нет записи о премии, его премия должна отображаться как NULL.

Верните результат в любом порядке.
*/

SELECT Employee.name, Bonus.bonus
FROM Employee
LEFT JOIN Bonus ON Employee.empId = Bonus.empId
WHERE Bonus.bonus < 1000 OR Bonus.bonus IS NULL;