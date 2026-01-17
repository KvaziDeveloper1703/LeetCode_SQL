/*
You are given a table Accounts:
    - account_id
    - income

Write an SQL query to return the number of bank accounts in each salary category:
    - "Low Salary": income < 20000;
    - "Average Salary": income between 20000 and 50000;
    - "High Salary": income > 50000.

The result must include all three categories, even if the count is 0.
Return the result with:
    - category: the name of the salary category;
    - accounts_count: number of accounts in that category.

Result can be in any order.

Дана таблица Accounts:
    - account_id
    - income

Напиши SQL-запрос, который посчитает, сколько аккаунтов попадают в каждую категорию доходов:
    - "Low Salary" - доход меньше 20000;
    - "Average Salary" - доход от 20000 до 50000;
    - "High Salary" - доход больше 50000.

Результат должен содержать все три категории, даже если в какой-то из них нет ни одного счёта.
Верни таблицу с колонками:
    - category: название категории;
    - accounts_count: количество аккаунтов в этой категории.

Порядок строк не важен.

Annetaan taulu Accounts:
    - account_id
    - income

Kirjoita SQL-kysely, joka laskee, kuinka monta tiliä kuuluu kuhunkin tuloluokkaan:
    - "Low Salary" - tulot alle 20000;
    - "Average Salary" - tulot välillä 20000–50000;
    - "High Salary" - tulot yli 50000.

Tuloksen tulee sisältää kaikki kolme luokkaa, vaikka jossakin luokassa ei olisi yhtään tiliä.

Palauta taulu, jossa on sarakkeet:
    - category: luokan nimi;
    - accounts_count: tilien määrä kyseisessä luokassa.

Rivien järjestyksellä ei ole väliä.
*/

SELECT categories.category, COALESCE(counts.accounts_count, 0) AS accounts_count
FROM (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
) AS categories
LEFT JOIN (
    SELECT
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            WHEN income > 50000 THEN 'High Salary'
        END AS category,
        COUNT(*) AS accounts_count
    FROM Accounts
    GROUP BY category
) AS counts ON categories.category = counts.category;