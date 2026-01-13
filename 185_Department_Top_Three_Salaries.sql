/*
You are given two tables:

Employee:
    - id
    - name
    - salary
    - departmentId

Department:
    - id
    - name

Each employee belongs to one department. A high earner in a department is an employee whose salary is among the top three unique salaries in that department.

Write an SQL query to find the high earners in each department.
Return the result with the following columns:
    - Department: the name of the department;
    - Employee: the name of the employee;
    - Salary: the employee's salary.

You may return the result in any order.

Даны две таблицы:

Employee:
    - id
    - name
    - salary
    - departmentId

Department:
    - id
    - name

Каждый сотрудник принадлежит к одному отделу. Сотрудник считается высокооплачиваемым в отделе, если его зарплата входит в три наибольших уникальных зарплаты этого отдела.

Напиши SQL-запрос, который вернёт всех высокооплачиваемых сотрудников по отделам.
Результат должен содержать колонки:
    - Department: название отдела;
    - Employee: имя сотрудника;
    - Salary: зарплата сотрудника.

Порядок строк в результате может быть произвольным.

Annetaan kaksi taulua:

Employee:
    - id
    - name
    - salary
    - departmentId

Department:
    - id
    - name

Jokainen työntekijä kuuluu yhteen osastoon. Työntekijää pidetään osastonsa hyvin palkattuna, jos hänen palkkansa kuuluu kyseisen osaston kolmen suurimman uniikin palkan joukkoon. Kirjoita SQL-kysely, joka palauttaa kaikki hyvin palkatut työntekijät osastoittain.

Tuloksen tulee sisältää sarakkeet:
    - Department: osaston nimi;
    - Employee: työntekijän nimi;
    - Salary: työntekijän palkka.

Tuloksen rivien järjestys voi olla mikä tahansa.
*/

WITH RankedEmployees AS (
    SELECT
        Employee.id AS employee_id,
        Employee.name AS employee_name,
        Employee.salary AS employee_salary,
        Employee.departmentId AS department_id,
        DENSE_RANK() OVER (
            PARTITION BY Employee.departmentId
            ORDER BY Employee.salary DESC
        ) AS salary_rank
    FROM Employee
)
SELECT
    Department.name AS Department,
    RankedEmployees.employee_name AS Employee,
    RankedEmployees.employee_salary AS Salary
FROM RankedEmployees
JOIN Department ON RankedEmployees.department_id = Department.id
WHERE RankedEmployees.salary_rank <= 3;