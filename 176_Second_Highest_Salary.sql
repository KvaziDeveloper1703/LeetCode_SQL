/*
You are given a table:
+ Employee:
    + id: unique ID of the employee (primary key);
    + salary: salary of the employee.

Each row represents the salary of one employee.

Write an SQL query to return the second highest distinct salary from the Employee table.
If there is no second highest salary, return null.

Return the result with the following column:
+ SecondHighestSalary

Дана таблица:
+ Employee:
    + id: уникальный идентификатор сотрудника (первичный ключ);
    + salary: зарплата сотрудника.

Каждая строка содержит информацию о зарплате одного сотрудника.

Напиши SQL-запрос, который вернёт вторую по величине уникальную зарплату из таблицы.
Если второй зарплаты не существует, верни null.

Результат должен содержать одну колонку:
+ SecondHighestSalary
*/

SELECT (SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1
    ) AS SecondHighestSalary;