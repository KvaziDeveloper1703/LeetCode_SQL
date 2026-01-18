/*
You are given the table customer_transactions.
Find loyal customers.

A customer is loyal if ALL conditions are met:
    - Made at least 3 purchase transactions;
    - Was active for at least 30 days;
    - Refund rate < 20%.

Definitions:
    - Refund rate = number of refund transactions / total number of transactions;
    - Total transactions = purchases + refunds.

Return only customer_id.

Order by customer_id ascending.

Дана таблица customer_transactions.
Найти лояльных клиентов.

Клиент считается лояльным, если выполняются ВСЕ условия:
    - Совершил минимум 3 покупки;
    - Был активен не менее 30 дней;
    - Доля возвратов < 20%.

Определения:
    - Доля возвратов = количество refund / общее количество транзакций;
    - Общее количество = покупки + возвраты.

Выведите только customer_id.

Отсортируйте customer_id по возрастанию.

Annetaan taulu customer_transactions.
Etsi lojaalit asiakkaat.

Asiakas katsotaan lojaaliksi, jos hän täyttää kaikki seuraavat ehdot:
    - on tehnyt vähintään 3 ostosta;
    - on ollut aktiivinen vähintään 30 päivää;
    - palautusten osuus on < 20 %.

Määritelmät:
    - palautusten osuus = refund-tapahtumien määrä / kaikkien transaktioiden määrä;
    - kaikkien transaktioiden määrä = ostot + palautukset.

Tulosta vain: customer_id.

Järjestä customer_id nousevaan järjestykseen.
*/

SELECT customer_id
FROM customer_transactions
GROUP BY customer_id
HAVING SUM(CASE WHEN transaction_type = 'purchase' THEN 1 ELSE 0 END) >= 3 AND DATEDIFF(MAX(transaction_date), MIN(transaction_date)) >= 30 AND (SUM(CASE WHEN transaction_type = 'refund' THEN 1 ELSE 0 END) / COUNT(*)) < 0.2
ORDER BY customer_id ASC;