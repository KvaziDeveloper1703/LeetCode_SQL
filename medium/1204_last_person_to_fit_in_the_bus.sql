/*
You are given a table Queue:
    - person_id
    - person_name
    - weight
    - turn

People board a bus one by one according to their turn, and the total weight on the bus must not exceed 1000 kg.
You need to find the name of the last person who can board the bus without exceeding the limit.

The test cases are guaranteed such that the first person always fits.
Return the name in a column called person_name.

Дана таблица Queue:
    - person_id
    - person_name
    - weight
    - turn

Люди садятся в автобус по порядку turn, но автобус имеет ограничение по весу - 1000 кг.
Нужно определить, кто был последним, кто смог сесть в автобус, не превысив лимит.

Гарантируется, что первый человек всегда влезает.
Верни имя в колонке person_name.

Annetaan taulu Queue:
    - person_id
    - person_name
    - weight
    - turn

Ihmiset nousevat bussiin turn-järjestyksessä, mutta bussilla on painoraja 1000 kg.
Tehtävänä on määrittää, kuka oli viimeinen henkilö, joka pystyi nousemaan bussiin ylittämättä painorajaa.

On taattu, että ensimmäinen henkilö mahtuu aina mukaan.
Palauta tuloksena nimi sarakkeessa person_name.
*/

WITH CumulativeWeight AS (
    SELECT person_id, person_name, weight, turn, SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
)
SELECT person_name
FROM CumulativeWeight
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;