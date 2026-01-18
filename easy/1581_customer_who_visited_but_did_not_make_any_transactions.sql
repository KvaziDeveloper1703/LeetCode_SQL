/*
We have two tables:
Visits:
    - visit_id
    - customer_id

This table contains information about customers who visited the mall.

Transactions:
    - transaction_id
    - visit_id
    - amount

This table contains information about purchases made during each visit_id.

Write an SQL query to find the IDs of customers who visited the mall without making any transactions and count how many times they made such visits.

Return a table with the following columns:
    - customer_id
    - count_no_trans

The result should be sorted in any order.

У нас есть две таблицы:
Visits:
    - visit_id
    - customer_id

Эта таблица содержит информацию о клиентах, которые посещали торговый центр.

Transactions:
    - transaction_id
    - visit_id
    - amount

Эта таблица содержит информацию о покупках, совершённых во время каждого визита (visit_id).

Написать SQL-запрос, который находит ID клиентов, посещавших торговый центр без совершения покупок, а также количество таких визитов для каждого клиента.

Вывести таблицу с колонками:
    - customer_id
    - count_no_trans

Результат должен быть отсортирован в любом порядке.

Meillä on kaksi taulua:
Visits:
    - visit_id
    - customer_id

Tämä taulu sisältää tiedot asiakkaista, jotka ovat käyneet ostoskeskuksessa.

Transactions:
    - transaction_id
    - visit_id
    - amount

Tämä taulu sisältää tiedot ostoksista, jotka on tehty jokaisen käynnin (visit_id) aikana.

Kirjoita SQL-kysely, joka löytää niiden asiakkaiden tunnisteet, jotka kävivät ostoskeskuksessa tekemättä ostoksia, sekä tällaisten käyntien määrän jokaiselle asiakkaalle.

Tulosta taulu sarakkeilla:
    - customer_id
    - count_no_trans

Tuloksen järjestys voi olla mikä tahansa.
*/

SELECT Visits.customer_id, COUNT(DISTINCT Visits.visit_id) AS count_no_trans
FROM Visits
LEFT JOIN Transactions ON Visits.visit_id = Transactions.visit_id
WHERE Transactions.visit_id IS NULL
GROUP BY Visits.customer_id
ORDER BY Visits.customer_id;