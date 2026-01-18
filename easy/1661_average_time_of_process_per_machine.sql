/*
You are given a table Activity:
    - machine_id
    - process_id
    - activity_type
    - timestamp

A factory website manages multiple machines, each running the same number of processes. Write an SQL query to calculate the average time each machine takes to complete a process.
The time to complete a process is calculated as: end_timestamp - start_timestamp.

The average processing time for each machine is computed by summing up all process times and dividing by the number of processes.

The result table should contain:
    - machine_id
    - processing_time

Return the result table in any order.

Вам дана таблица Activity:
    - machine_id
    - process_id
    - activity_type
    - timestamp

На заводском сайте работают несколько машин, каждая из которых выполняет одинаковое количество процессов. Напишите SQL-запрос, который вычислит среднее время выполнения процесса для каждой машины.
Время выполнения процесса вычисляется как: end_timestamp - start_timestamp.

Среднее время выполнения для каждой машины рассчитывается как сумма всех временных интервалов, деленная на количество процессов.

Результирующая таблица должна содержать:
    - machine_id
    - processing_time

Верните таблицу в любом порядке.

Sinulle annetaan taulu Activity:
    - machine_id
    - process_id
    - activity_type
    - timestamp

Tehdassivustolla toimii useita koneita, joista jokainen suorittaa saman määrän prosesseja. Kirjoita SQL-kysely, joka laskee kullekin koneelle prosessin keskimääräisen suoritusaikaan.
Prosessin suoritusaika lasketaan näin: end_timestamp - start_timestamp.

Kunkin koneen keskimääräinen suoritusaika lasketaan siten, että kaikkien aikavälien summa jaetaan prosessien lukumäärällä.

Tulostaulukon tulee sisältää:
    - machine_id
    - processing_time

Palauta taulu missä tahansa järjestyksessä.
*/

WITH ProcessTime AS (
    SELECT machine_id, process_id, MAX(timestamp) - MIN(timestamp) AS time_taken
    FROM Activity
    GROUP BY machine_id, process_id
)
SELECT machine_id, ROUND(AVG(time_taken), 3) AS processing_time
FROM ProcessTime
GROUP BY machine_id;