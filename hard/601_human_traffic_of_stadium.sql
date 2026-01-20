/*
Table Stadium:
    - id
    - visit_date
    - people

Return all records that belong to a sequence of at least 3 consecutive ids, where people ≥ 100 in every row of that sequence.
Order the result by visit_date ASC.

Есть таблица Stadium:
    - id
    - visit_date
    - people

Нужно вывести все строки, которые входят в последовательность минимум из 3 подряд идущих id, где people ≥ 100 в каждой строке.
Результат отсортировать по visit_date ASC.

On taulu Stadium:
    - id
    - visit_date
    - people

Pitää hakea kaikki rivit, jotka kuuluvat vähintään kolmen peräkkäisen id:n jaksoon, jossa jokaisella rivillä people ≥ 100.
Tulos järjestetään visit_date ASC.
*/

WITH StadiumFiltered AS (
    SELECT id, visit_date, people, id - ROW_NUMBER() OVER (ORDER BY id) AS group_id
    FROM Stadium
    WHERE people >= 100
),
ValidGroups AS (
    SELECT group_id
    FROM StadiumFiltered
    GROUP BY group_id
    HAVING COUNT(*) >= 3
)
SELECT id, visit_date, people
FROM StadiumFiltered
WHERE group_id IN (SELECT group_id FROM ValidGroups)
ORDER BY visit_date ASC;