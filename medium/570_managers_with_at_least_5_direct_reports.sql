/*
You are given a table Employee:
    - id
    - name
    - department
    - managerId

No employee is their own manager.

Write a query to find all managers who have at least five direct reports.
Return the result in any order.

Дана таблица Employee:
    - id
    - name
    - department
    - managerId

Никто не может быть сам себе начальником.

Напишите SQL-запрос, который найдёт всех менеджеров, у которых есть как минимум 5 подчинённых.
Верните результат в любом порядке.

Annetaan taulu Employee:
    - id
    - name
    - department
    - managerId

Kukaan ei voi olla itsensä esihenkilö.

Kirjoita SQL-kysely, joka löytää kaikki esihenkilöt, joilla on vähintään 5 alaista.
Palauta tulos missä tahansa järjestyksessä.
*/

SELECT Employee.name
FROM Employee JOIN Employee AS Subordinate ON Employee.id = Subordinate.managerId
GROUP BY Employee.id, Employee.name
HAVING COUNT(Subordinate.id) >= 5;