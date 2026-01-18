/*
You are given a table Employees:
    - employee_id
    - name
    - manager_id
    - salary

Some employees do not have a manager. If a manager leaves the company, their record is deleted from the table, but employees who reported to them will still have their manager_id set.

Write an SQL query to find the employee_ids of employees who:
    - Have a salary less than 30000;
    - Their manager no longer works at the company.

Return the results ordered by employee_id.

Дана таблица Employees:
    - employee_id
    - name
    - manager_id
    - salary

Некоторые сотрудники не имеют менеджера. Если менеджер уходит из компании, его запись удаляется из таблицы, но у сотрудников, которые ему подчинялись, manager_id остаётся прежним.

Напиши SQL-запрос, который вернёт employee_id сотрудников, у которых:
    - Зарплата меньше 30000;
    - Их менеджер больше не работает в компании.

Результат отсортируй по employee_id.

Annetaan taulu Employees, jossa on sarakkeet:
    - employee_id
    - name
    - manager_id
    - salary

Joillakin työntekijöillä ei ole esihenkilöä. Jos esihenkilö lähtee yrityksestä, hänen rivinsä poistetaan taulusta, mutta niiden työntekijöiden manager_id, jotka olivat hänen alaisiaan, jää ennalleen.

Kirjoita SQL-kysely, joka palauttaa niiden työntekijöiden employee_id, joilla:
    - palkka on alle 30000;
    - heidän esihenkilönsä ei enää työskentele yrityksessä.

Järjestä tulos employee_id-sarakkeen mukaan.
*/

SELECT employee_id
FROM Employees
WHERE Employees.salary < 30000 AND Employees.manager_id IS NOT NULL AND Employees.manager_id NOT IN ( SELECT employee_id FROM Employees)
ORDER BY employee_id;