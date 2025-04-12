/*
You are given a table named "Activity" with the following structure:
+ (machine_id, process_id, activity_type) is the primary key, meaning this combination of columns contains unique values;
+ machine_id represents the ID of a machine;
+ process_id represents the ID of a process running on a machine;
+ activity_type is an ENUM with two possible values: 'start' and 'end';
+ timestamp is a float representing the time in seconds;
+ 'start' means that the machine started the process at the given timestamp;
+ 'end' means that the machine ended the process at the given timestamp;
+ It is guaranteed that each (machine_id, process_id) pair has both a 'start' and 'end' timestamp;
+ The 'start' timestamp will always be before the 'end' timestamp.

A factory website manages multiple machines, each running the same number of processes. Write an SQL query to calculate the average time each machine takes to complete a process.
The time to complete a process is calculated as: end_timestamp - start_timestamp

The average processing time for each machine is computed by summing up all process times and dividing by the number of processes.
The result table should contain:
+ machine_id;
+ processing_time;

Return the result table in any order.

Вам дана таблица Activity со следующей структурой:
+ (machine_id, process_id, activity_type) — это первичный ключ, т.е. комбинация этих колонок содержит уникальные значения;
+ machine_id — идентификатор машины;
+ process_id — идентификатор процесса, выполняемого на машине;
+ activity_type — это ENUM с возможными значениями 'start' и 'end';
+ timestamp — это число с плавающей точкой, обозначающее время в секундах;
+ 'start' означает, что машина запустила процесс в указанное время;
+ 'end' означает, что машина завершила процесс в указанное время;
+ Гарантируется, что у каждой пары (machine_id, process_id) есть как 'start', так и 'end';
+ Время 'start' всегда меньше времени 'end'.

На заводском сайте работают несколько машин, каждая из которых выполняет одинаковое количество процессов. Напишите SQL-запрос, который вычислит среднее время выполнения процесса для каждой машины.
Время выполнения процесса вычисляется как: end_timestamp - start_timestamp

Среднее время выполнения для каждой машины рассчитывается как сумма всех временных интервалов, деленная на количество процессов.

Результирующая таблица должна содержать:
+ machine_id;
+ processing_time;

Верните таблицу в любом порядке.
*/

WITH ProcessTime AS (
    SELECT machine_id, process_id, MAX(timestamp) - MIN(timestamp) AS time_taken
    FROM Activity
    GROUP BY machine_id, process_id
)

SELECT 
    machine_id,
    ROUND(AVG(time_taken), 3) AS processing_time
FROM ProcessTime
GROUP BY machine_id;