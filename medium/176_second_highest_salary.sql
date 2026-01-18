/*
You are given a table Employee:
    - id
    - salary

Each row represents the salary of one employee.
Write an SQL query to return the second highest distinct salary from the Employee table.
If there is no second highest salary, return null.

Return the result with the following column: SecondHighestSalary.

Дана таблица Employee:
    - id
    - salary

Каждая строка содержит информацию о зарплате одного сотрудника.
Напиши SQL-запрос, который вернёт вторую по величине уникальную зарплату из таблицы.
Если второй зарплаты не существует, верни null.

Результат должен содержать одну колонку: SecondHighestSalary.

Annettu taulu Employee:
    - id
    - salary

Jokainen rivi sisältää tiedon yhden työntekijän palkasta.
Kirjoita SQL-kysely, joka palauttaa taulusta toiseksi suurimman yksilöllisen palkan.
Jos toista palkkaa ei ole olemassa, palauta NULL.

Tulostaulussa tulee olla yksi sarake: SecondHighestSalary.
*/

SELECT (   
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1
) AS SecondHighestSalary;