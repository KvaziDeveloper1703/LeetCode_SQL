/*
We have two tables:
Employees:
    - id
    - name

This table contains a list of all employees in the company.

EmployeeUNI:
    - id
    - unique_id

The primary key for this table is the combination of (id, unique_id).

This table maps regular employee ids to their unique_id.
However, not all employees have a unique_id, so some ids from Employees may be missing in EmployeeUNI.

Write an SQL query to join the data from both tables and return the unique_id of each employee.
If an employee does not have a unique_id, the column should contain NULL.

Return a table with the following columns:
    - unique_id
    - name

The result order can be arbitrary.

У нас есть две таблицы:
Employees:
    - id
    - name

Эта таблица содержит список всех сотрудников компании.

EmployeeUNI:
    - id
    - unique_id

Первичным ключом этой таблицы является комбинация (id, unique_id).

Эта таблица сопоставляет обычные идентификаторы сотрудников с их уникальными идентификаторами.
Однако не у всех сотрудников есть уникальный идентификатор, поэтому некоторые id из таблицы Employees могут отсутствовать в таблице EmployeeUNI.

Напишите SQL-запрос, который объединит данные из обеих таблиц и вернёт уникальный идентификатор (unique_id) каждого сотрудника.
Если у сотрудника нет unique_id, в соответствующей колонке должно быть значение NULL.

Верните таблицу со следующими колонками:
    - unique_id
    - name

Порядок строк в результате может быть произвольным.
*/

SELECT EmployeeUNI.unique_id, Employees.name
FROM Employees
LEFT JOIN EmployeeUNI ON Employees.id = EmployeeUNI.id;