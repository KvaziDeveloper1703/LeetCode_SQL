/*
You are given two tables:

Customers
+ id: Primary key (unique for each customer)
+ name: Name of the customer

Orders
+ id: Primary key (unique for each order)
+ customerId: Foreign key referencing Customers.id

Write a SQL query to find all customers who never placed an order.

Return a table with the column name, containing the names of those customers.
The result can be in any order.

Даны две таблицы:

Customers
+ id: идентификатор клиента (первичный ключ)
+ name: имя клиента

Orders
+ id: идентификатор заказа (первичный ключ)
+ customerId: внешний ключ, ссылающийся на Customers.id

Напишите SQL-запрос, который вернёт всех клиентов, не сделавших ни одного заказа.

Результирующая таблица должна содержать один столбец name с именами таких клиентов.
Порядок строк — произвольный.
*/

SELECT Customers.name as Customers
FROM Customers
LEFT JOIN Orders ON Customers.id = Orders.customerId
WHERE Orders.id IS NULL;