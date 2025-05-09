/*
You are given two tables:

Employee
+ id: Unique employee ID (primary key)
+ name: Name of the employee
+ salary: Salary of the employee
+ departmentId: Foreign key referencing Department.id

Department
+ id: Unique department ID (primary key)
+ name: Name of the department (never NULL)

Write a SQL query to find the employees with the highest salary in each department.

Return a table with the following columns:
+ Department — department name
+ Employee — employee name
+ Salary — employee salary

The output can be in any order.

Даны две таблицы:

Employee
+ id: уникальный идентификатор сотрудника (первичный ключ)
+ name: имя сотрудника
+ salary: зарплата
+ departmentId: внешний ключ на Department.id

Department
+ id: уникальный идентификатор отдела (первичный ключ)
+ name: название отдела (не бывает NULL)

Напишите SQL-запрос, который вернёт сотрудников с наибольшей зарплатой в каждом отделе.

Результат должен содержать следующие столбцы:
+ Department — название отдела
+ Employee — имя сотрудника
+ Salary — его зарплата

Порядок строк — любой.
*/

SELECT Department.name AS Department, Employee.name AS Employee, Employee.salary AS Salary
FROM Employee
JOIN Department ON Employee.departmentId = Department.id
WHERE Employee.salary = (   SELECT MAX(EmployeeSub.salary)
                            FROM Employee AS EmployeeSub
                            WHERE EmployeeSub.departmentId = Employee.departmentId
                    );