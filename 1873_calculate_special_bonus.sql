/*
You are given a table Employees:
    - employee_id
    - name
    - salary

For each employee, calculate bonus:
    - bonus = salary, if:
        - employee_id is odd;
        - name does not start with 'M'.
    - otherwise, bonus = 0.

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

Annetaan taulu Employees, jossa on sarakkeet:
    - employee_id
    - name
    - salary

Laske jokaiselle työntekijälle bonus:
    - bonus = salary, jos:
        - employee_id on pariton;
        - name ei ala kirjaimella 'M'.
    - Muussa tapauksessa bonus = 0.

Palauta taulu: employee_id, bonus.
Järjestä tulos employee_id-sarakkeen mukaan.
*/

SELECT employee_id,
    CASE
        WHEN employee_id % 2 = 1 AND name NOT LIKE 'M%'
        THEN salary
        ELSE 0
    END AS bonus
FROM Employees
ORDER BY employee_id;