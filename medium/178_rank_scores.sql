/*
You have a table Scores:
    - id
    - score

Write a query to return each score with its rank:
    - Rank scores from highest to lowest;
    - Equal scores get the same rank;
    - After a tie, the next rank is the next integer;
    - Output must be ordered by score DESC.

Есть таблица Scores
    - id
    - score

Нужно написать запрос, который выводит score и его rank:
    - Ранжировать очки по убыванию;
    - Одинаковые значения score имеют одинаковый ранг;
    - После совпадений ранг идёт следующим числом без пропусков;
    - Результат отсортировать по score DESC.

On taulu Scores:
    - id
    - score

Pitää kirjoittaa kysely, joka palauttaa score-arvon ja sen rank-sijoituksen:
    - Pisteet sijoitetaan laskevaan järjestykseen;
    - Samat score-arvot saavat saman sijoituksen;
    - Tasapelin jälkeen seuraava sijoitus on seuraava kokonaisluku ilman aukkoja;
    - Tulos järjestetään score DESC.
*/

SELECT score, DENSE_RANK() OVER (ORDER BY score DESC) AS `rank`
FROM Scores
ORDER BY score DESC;