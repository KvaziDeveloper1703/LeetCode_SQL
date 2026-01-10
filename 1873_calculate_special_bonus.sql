/*
You are given a table Employees with columns:
    - employee_id
    - name
    - salary

For each employee, calculate bonus:
    - Bonus = salary, if:
        - employee_id is odd;
        - name does not start with 'M'.
    - Otherwise, bonus = 0.

Return the result with columns: employee_id, bonus.
Order the result by employee_id.

Дана таблица Employees со столбцами:
    - employee_id
    - name
    - salary

Для каждого сотрудника вычислите bonus:
    - bonus = salary, если:
        - employee_id нечётный;
        - name не начинается с 'M'.
    - В остальных случаях bonus = 0.

Вернуть таблицу: employee_id, bonus.
Отсортировать результат по employee_id.
*/

SELECT employee_id,
    CASE
        WHEN employee_id % 2 = 1
             AND name NOT LIKE 'M%'
        THEN salary
        ELSE 0
    END AS bonus
FROM Employees
ORDER BY employee_id;