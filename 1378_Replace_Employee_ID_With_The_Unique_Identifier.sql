/*
We have two tables:

+ Table Employees:
    + id (integer, unique employee identifier, primary key);
    + name (string, employee name).
This table contains a list of all employees in the company.

+ Table EmployeeUNI:
    + id (integer, employee ID);
    + unique_id (integer, employee's unique ID).
The primary key for this table is the combination of (id, unique_id).
This table maps regular employee ids to their unique_id.
However, not all employees have a unique_id, so some ids from Employees may be missing in EmployeeUNI.

Write an SQL query to join the data from both tables and return the unique_id of each employee.
If an employee does not have a unique_id, the column should contain NULL.

Return a table with the following columns:
+ unique_id (employee's unique identifier or NULL if no unique_id exists);
+ name (employee's name).

The result order can be arbitrary.
*/

SELECT EmployeeUNI.unique_id, Employees.name
FROM Employees
LEFT JOIN EmployeeUNI
ON Employees.id = EmployeeUNI.id;