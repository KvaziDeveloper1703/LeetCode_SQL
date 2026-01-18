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

Write a SQL query to find the employees with the highest salary in each department.

Return a table with the following columns:
    - Department - department name;
    - Employee - employee name;
    - Salary - employee salary.

The output can be in any order.

Даны две таблицы:

Employee:
    - id
    - name
    - salary
    - departmentId

Department
    - id
    - name

Напишите SQL-запрос, который вернёт сотрудников с наибольшей зарплатой в каждом отделе.

Результат должен содержать следующие столбцы:
    - Department - название отдела;
    - Employee - имя сотрудника;
    - Salary - его зарплата.

Порядок строк любой.

Sinulle on annettu kaksi taulua:

Employee:
    - id
    - name
    - salary
    - departmentId

Department:
    - id
    - name

Kirjoita SQL-kysely, joka palauttaa kunkin osaston korkeimman palkan saavat työntekijät.

Tuloksen tulee sisältää seuraavat sarakkeet:
    - Department - osaston nimi;
    - Employee - työntekijän nimi;
    - Salary - hänen palkkansa.

Rivien järjestyksellä ei ole merkitystä.
*/

SELECT
    Department.name AS Department,
    Employee.name   AS Employee,
    Employee.salary AS Salary
FROM Employee
JOIN Department
    ON Employee.departmentId = Department.id
WHERE Employee.salary = (
    SELECT MAX(EmployeeSub.salary)
    FROM Employee AS EmployeeSub
    WHERE EmployeeSub.departmentId = Employee.departmentId
);