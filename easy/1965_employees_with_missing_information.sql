/*
You are given two tables:
Employees:
    - employee_id
    - name

Salaries:
    - employee_id
    - salary

Return the employee_id of all employees whose information is missing:
    - the employee exists in Salaries but not in Employees (missing name), or
    - the employee exists in Employees but not in Salaries (missing salary).

Output only employee_id, sorted in ascending order.

Даны две таблицы:
Employees:
    - employee_id
    - name

Salaries:
    - employee_id
    - salary

Нужно вывести employee_id всех сотрудников, у которых не хватает данных:
    - сотрудник есть в Salaries, но нет в Employees (нет имени), или
    - сотрудник есть в Employees, но нет в Salaries (нет зарплаты).

Вывести только employee_id, отсортировать по возрастанию.

Annettu kaksi taulukkoa:
Employees:
    - employee_id
    - name

Salaries:
    - employee_id
    - salary

Tarvitaan listata niiden työntekijöiden employee_id, joilta puuttuu tietoja:
    - työntekijä löytyy taulukosta Salaries, mutta ei taulukosta Employees (nimi puuttuu), tai
    - työntekijä löytyy taulukosta Employees, mutta ei taulukosta Salaries (palkka puuttuu).

Tulosta vain employee_id, ja lajittele ne nousevaan järjestykseen.
*/

SELECT employee_id
FROM Employees
WHERE employee_id NOT IN (SELECT employee_id FROM Salaries)

UNION

SELECT employee_id
FROM Salaries
WHERE employee_id NOT IN (SELECT employee_id FROM Employees)

ORDER BY employee_id;