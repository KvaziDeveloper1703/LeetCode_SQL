/*
You are given two tables:

Customers:
    - id
    - name

Orders:
    - id
    - customerId

Write a SQL query to find all customers who never placed an order.

Return a table with the column name, containing the names of those customers.
The result can be in any order.

Даны две таблицы:

Customers:
    - id
    - name

Orders:
    - id
    - customerId

Напишите SQL-запрос, который вернёт всех клиентов, не сделавших ни одного заказа.

Результирующая таблица должна содержать один столбец name с именами таких клиентов.
Порядок строк - произвольный.

Sinulle on annettu kaksi taulua:

Customers:
    - id
    - name

Orders:
    - id
    - customerId

Kirjoita SQL-kysely, joka palauttaa kaikki asiakkaat, jotka eivät ole tehneet yhtään tilausta.

Tulostaulussa tulee olla yksi sarake name, joka sisältää näiden asiakkaiden nimet.
Rivien järjestyksellä ei ole merkitystä.
*/

SELECT Customers.name as Customers
FROM Customers
LEFT JOIN Orders ON Customers.id = Orders.customerId
WHERE Orders.id IS NULL;