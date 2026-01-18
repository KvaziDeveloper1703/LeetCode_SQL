/*
You are given a table Employee:
    - employee_id
    - department_id
    - primary_flag

Each employee can belong to multiple departments, but must have one primary department.
If an employee belongs to only one department, their primary_flag will be 'N', but that department should still be treated as their primary.

Write an SQL query to return the employee_id and their primary department_id.
For employees with only one department, return that department.

Return results in any order.

Дана таблица Employee:
    - employee_id
    - department_id
    - primary_flag

Сотрудник может состоять в нескольких отделах, но должен иметь один основной отдел.
Если сотрудник состоит только в одном отделе, то primary_flag будет 'N', но этот отдел всё равно считается основным.

Напиши SQL-запрос, который вернёт ID сотрудников и ID их основного отдела.
Для сотрудников с одним отделом - возвращай этот единственный отдел.

Порядок строк в результате не имеет значения.

Annetaan taulu Employee:
    - employee_id
    - department_id
    - primary_flag

Työntekijä voi kuulua useaan osastoon, mutta hänellä täytyy olla yksi pääosasto.
Jos työntekijä kuuluu vain yhteen osastoon, silloin primary_flag on 'N', mutta kyseinen osasto katsotaan silti pääosastoksi.

Kirjoita SQL-kysely, joka palauttaa työntekijöiden tunnisteet ja heidän pääosastonsa tunnisteen.
Niille työntekijöille, joilla on vain yksi osasto, palauta tämä ainoa osasto.

Rivien järjestyksellä ei ole väliä.
*/

SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION

SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(*) = 1;