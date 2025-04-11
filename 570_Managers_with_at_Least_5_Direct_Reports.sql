/*
You are given a table named "Employee", which contains information about employees in a company.

Table Description:
+ Each row in the table represents an employee, including their ID, name, department, and the ID of their manager;
+ id is the primary key;
+ name is the employee’s name;
+ department represents the department in which the employee works;
+ managerId is the ID of the employee’s manager. If managerId is NULL, the employee does not have a manager;
+ No employee is their own manager.

Write a query to find all managers who have at least five direct reports.

Return the result in any order.

Дана таблица Employee, содержащая информацию о сотрудниках компании.

Описание таблицы:
+ Каждая строка в таблице представляет одного сотрудника, включая его ID, имя, отдел и ID его начальника;
+ id — первичный ключ;
+ name — имя сотрудника;
+ department — отдел, в котором работает сотрудник;
+ managerId — ID начальника сотрудника. Если значение NULL, значит у сотрудника нет руководителя;
+ Никто не может быть сам себе начальником.

Напишите SQL-запрос, который найдёт всех менеджеров, у которых есть как минимум 5 подчинённых.

Верните результат в любом порядке.
*/

SELECT Employee.name
FROM Employee JOIN Employee AS Subordinate ON Employee.id = Subordinate.managerId
GROUP BY Employee.id, Employee.name
HAVING COUNT(Subordinate.id) >= 5;