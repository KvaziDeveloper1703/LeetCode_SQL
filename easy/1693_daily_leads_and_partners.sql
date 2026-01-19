/*
You are given a table:
DailySales:
    - date_id
    - make_name
    - lead_id
    - partner_id

For each pair of date_id and make_name, count the number of distinct lead_id and the number of distinct partner_id.
Return the result in any order.

Вам дана таблица:
DailySales:
    - date_id
    - make_name
    - lead_id
    - partner_id

Для каждой пары date_id и make_name посчитайте количество уникальных lead_id и количество уникальных partner_id.
Верните результат в любом порядке.

Sinulle annetaan taulukko:
DailySales:
    - date_id
    - make_name
    - lead_id
    - partner_id

Laske jokaiselle date_id- ja make_name-parille erilaisten lead_id-arvojen määrä sekä erilaisten partner_id-arvojen määrä.
Palauta tulos missä tahansa järjestyksessä.
*/

SELECT
    date_id,
    make_name,
    COUNT(DISTINCT lead_id) AS unique_leads,
    COUNT(DISTINCT partner_id) AS unique_partners
FROM DailySales
GROUP BY date_id, make_name;