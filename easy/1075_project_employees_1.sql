/*
You are given two tables:
Project:
    - project_id
    - employee_id

Employee:
    - employee_id
    - name
    - experience_years

Write an SQL query to return the average years of experience of employees for each project, rounded to 2 decimal places.

Даны две таблицы:
Project:
    - project_id
    - employee_id

Employee:
    - employee_id
    - name
    - experience_years

Напиши SQL-запрос, который вернёт средний опыт сотрудников для каждого проекта, округлённый до двух знаков после запятой.

Annetaan kaksi taulua:
Project:
    - project_id
    - employee_id

Employee:
    - employee_id
    - name
    - experience_years

Kirjoita SQL-kysely, joka palauttaa kunkin projektin työntekijöiden keskimääräisen työkokemuksen, pyöristettynä kahden desimaalin tarkkuuteen.
*/

SELECT Project.project_id, ROUND(AVG(Employee.experience_years), 2) AS average_years
FROM Project
JOIN Employee ON Project.employee_id = Employee.employee_id
GROUP BY Project.project_id;