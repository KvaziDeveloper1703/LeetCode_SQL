/*
You are given a table called Employee with the following columns:
+ id: The primary key (unique for each employee)
+ salary: The salary of the employee

Write a SQL query to return the nth highest distinct salary in the table.
If there are fewer than n distinct salaries, return NULL.

You must return the result with the column named NthHighestSalary.

Вам дана таблица Employee со следующими столбцами:
+ id: идентификатор сотрудника (первичный ключ)
+ salary: зарплата сотрудника

Напишите SQL-запрос, который вернёт n-ую по величине (уникальную) зарплату из таблицы.
Если в таблице меньше n различных зарплат, нужно вернуть NULL.

Результат должен содержать один столбец с названием NthHighestSalary.
*/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
DETERMINISTIC
BEGIN
  RETURN (
    SELECT salary FROM (
      SELECT DISTINCT salary,
             DENSE_RANK() OVER (ORDER BY salary DESC) as rnk
      FROM Employee
    ) AS ranked
    WHERE rnk = N
  );
END;