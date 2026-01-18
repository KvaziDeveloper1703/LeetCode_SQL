/*
You are given a table Customer:
    - customer_id
    - name
    - visited_on
    - amount

The combination of (customer_id, visited_on) is the primary key.

Define:
    - amount as the total amount paid by all customers on each visited_on day;
    - average_amount as the 7-day moving average of the total paid amount, rounded to 2 decimal places.

Write an SQL query to return for each day:
    - visited_on
    - amount
    - average_amount

Return the result table ordered by visited_on in ascending order.

Дана таблица Customer:
    - customer_id
    - name
    - visited_on
    - amount

Составной первичный ключ - (customer_id, visited_on).

Определим:
    - amount - общая сумма, уплаченная всеми клиентами за каждый день visited_on;
    - average_amount - скользящее среднее за 7 дней от общей суммы, округлённое до двух знаков после запятой.

Напиши SQL-запрос, который вернёт для каждого дня:
    - visited_on
    - amount
    - average_amount

Результат должен быть отсортирован по возрастанию даты visited_on.

Annetaan taulu Customer:
    - customer_id
    - name
    - visited_on
    - amount

Yhdistetty ensisijainen avain on (customer_id, visited_on).

Määritellään:
    - amount - kaikkien asiakkaiden kyseisenä päivänä (visited_on) maksama kokonaissumma;
    - average_amount - 7 päivän liukuva keskiarvo kokonaissummasta, pyöristettynä kahden desimaalin tarkkuuteen.

Kirjoita SQL-kysely, joka palauttaa jokaiselle päivälle:
    - visited_on
    - amount
    - average_amount

Tuloksen tulee olla järjestetty visited_on-päivämäärän mukaan nousevasti.
*/

WITH daily_amount_table AS (
    SELECT Customer.visited_on AS visited_on, SUM(Customer.amount) AS total_amount_per_day
    FROM Customer
    GROUP BY Customer.visited_on
),
moving_average_table AS (
    SELECT
        current_day.visited_on AS visited_on,
        SUM(previous_days.total_amount_per_day) AS total_amount_last_7_days,
        ROUND(SUM(previous_days.total_amount_per_day) * 1.0 / 7, 2) AS average_amount_last_7_days
    FROM daily_amount_table AS current_day
    JOIN daily_amount_table AS previous_days ON previous_days.visited_on BETWEEN DATE_SUB(current_day.visited_on, INTERVAL 6 DAY) AND current_day.visited_on
    GROUP BY current_day.visited_on
)
SELECT
    moving_average_table.visited_on,
    moving_average_table.total_amount_last_7_days AS amount,
    moving_average_table.average_amount_last_7_days AS average_amount
FROM moving_average_table
WHERE moving_average_table.visited_on >= (
    SELECT DATE_ADD(MIN(Customer.visited_on), INTERVAL 6 DAY)
    FROM Customer
)
ORDER BY moving_average_table.visited_on;