/*
You are given a table:
+ Transactions:
    + id: Transaction ID (primary key);
    + country: Country where the transaction took place;
    + state: Either "approved" or "declined";
    + amount: Transaction amount;
    + trans_date: Date of the transaction.

Write an SQL query to find, for each month and country:
+ Total number of transactions;
+ Number of approved transactions;
+ Total transaction amount;
+ Total amount of approved transactions.

Return the result with the month in "YYYY-MM" format. The result can be in any order.

Дана таблица:
+ Transactions:
    + id: идентификатор транзакции (первичный ключ);
    + country: страна, где произошла транзакция;
    + state: статус — "approved" или "declined";
    + amount: сумма транзакции;
    + trans_date: дата транзакции.

Напиши SQL-запрос, который вернёт, для каждой страны и месяца:
+ Общее количество транзакций;
+ Количество одобренных транзакций;
+ Общую сумму транзакций;
+ Сумму только одобренных транзакций.

Поле month должно быть в формате "YYYY-MM". Порядок строк не имеет значения.
*/

SELECT  DATE_FORMAT(trans_date, '%Y-%m') AS month,
        country,
        COUNT(*) AS trans_count,
        SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
        SUM(amount) AS trans_total_amount,
        SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country;