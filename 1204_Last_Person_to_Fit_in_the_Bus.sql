/*
You are given a table:
+ Queue:
    + person_id: Unique ID of the person;
    + person_name: Name of the person;
    + weight: Weight of the person in kilograms;
    + turn: The boarding order (from 1 to n).

People board a bus one by one according to their turn, and the total weight on the bus must not exceed 1000 kg.
You need to find the name of the last person who can board the bus without exceeding the limit.

The test cases are guaranteed such that the first person always fits.
Return the name in a column called person_name.

Дана таблица:
+ Queue:
    + person_id: уникальный идентификатор человека;
    + person_name: имя человека;
    + weight: вес человека в килограммах;
    + turn: порядок посадки в автобус (от 1 до n).

Люди садятся в автобус по порядку turn, но автобус имеет ограничение по весу — 1000 кг.
Нужно определить, кто был последним, кто смог сесть в автобус, не превысив лимит.

Гарантируется, что первый человек всегда влезает.
Верни имя в колонке person_name.
*/

WITH CumulativeWeight AS ( SELECT   person_id,
                                    person_name,
                                    weight,
                                    turn,
                                    SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
)
SELECT person_name
FROM CumulativeWeight
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;