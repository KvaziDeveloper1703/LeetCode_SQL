/*
You are given a table Employees:
    - employee_id
    - name
    - reports_to
    - age

A manager is an employee who has at least one other employee reporting directly to them.

Write an SQL query to return:
    - employee_id
    - reports_count
    - average_age

Return the result sorted by employee_id.

Дана таблица Employees:
    - employee_id
    - name
    - reports_to
    - age

Руководитель - это сотрудник, у которого есть хотя бы один прямой подчинённый.

Напиши SQL-запрос, который вернёт:
    - employee_id
    - reports_count
    - average_age

Результат отсортируй по employee_id.

Annetaan taulu Employees:
    - employee_id
    - name
    - reports_to
    - age

Esihenkilö on työntekijä, jolla on vähintään yksi suora alainen.

Kirjoita SQL-kysely, joka palauttaa:
    - employee_id
    - reports_count
    - average_age

Järjestä tulos employee_id-sarakkeen mukaan.
*/

SELECT Employees.employee_id, Employees.name, COUNT(Reports.employee_id) AS reports_count, ROUND(AVG(Reports.age)) AS average_age
FROM Employees
JOIN Employees AS Reports ON Employees.employee_id = Reports.reports_to
GROUP BY Employees.employee_id, Employees.name
ORDER BY Employees.employee_id;