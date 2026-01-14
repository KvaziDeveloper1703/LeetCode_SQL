/*
You are given three tables: SalesPerson, Company, and Orders.
Each order links a salesperson to a company.

Find the names of all salespersons who did not make any orders for the company with the name "RED".

Return a table with: name - salesperson name.
The result can be in any order.

Даны три таблицы: SalesPerson, Company и Orders.
Каждый заказ связывает продавца с компанией.

Найдите имена всех продавцов, которые не делали ни одного заказа для компании с названием «RED».

Вернуть таблицу с полем: name - имя продавца.
Порядок строк не важен.

Annettu kolme taulukkoa: SalesPerson, Company ja Orders.
Jokainen tilaus yhdistää myyjän ja yrityksen.

Etsi kaikkien niiden myyjien nimet, jotka eivät ole tehneet yhtään tilausta yritykselle, jonka nimi on "RED".

Palauta taulukko, jossa on kenttä: name - myyjän nimi.
Rivien järjestyksellä ei ole väliä.
*/

SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT orders.sales_id
    FROM Orders AS orders
    JOIN Company AS company ON orders.com_id = company.com_id
    WHERE company.name = 'RED'
);