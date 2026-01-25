/*
You are given table Transactions:
    - transaction_id
    - amount
    - transaction_date

For each transaction_date, calculate:
    - odd_sum = sum of amount where transaction_id is odd;
    - even_sum = sum of amount where transaction_id is even.

If there are no odd/even transactions on a date, output 0.

Return transaction_date, odd_sum, even_sum, ordered by transaction_date ASC.

Дана таблица Transactions:
    - transaction_id
    - amount
    - transaction_date

Для каждой даты transaction_date посчитай:
    - odd_sum = сумма amount, где transaction_id нечётный;
    - even_sum = сумма amount, где transaction_id чётный.

Если для даты нет нечётных/чётных транзакций, выводи 0.

Верни transaction_date, odd_sum, even_sum, отсортируй по transaction_date по возрастанию.

Annettu taulukko Transactions, jossa:
    - transaction_id
    - amount
    - transaction_date

Laske jokaiselle päivämäärälle transaction_date:
    - odd_sum = amount-summa, jossa transaction_id on pariton;
    - even_sum = amount-summa, jossa transaction_id on parillinen.

Jos tietylle päivälle ei ole parittomia/parillisia tapahtumia, tulosta 0.

Palauta transaction_date, odd_sum, even_sum, ja lajittele transaction_date nousevaan järjestykseen.
*/

SELECT
    transaction_date,
    SUM(CASE WHEN amount % 2 = 1 THEN amount ELSE 0 END) AS odd_sum,
    SUM(CASE WHEN amount % 2 = 0 THEN amount ELSE 0 END) AS even_sum
FROM transactions
GROUP BY transaction_date
ORDER BY transaction_date;