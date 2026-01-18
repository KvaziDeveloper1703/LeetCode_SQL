/*
You are given a table Queries:
    - query_name
    - result
    - position
    - rating

A poor query is defined as one with a rating less than 3.

Define:
    - Query quality as the average of rating / position for all results with the same query_name;
    - Poor query percentage as the percentage of results with rating < 3 for each query_name.

Write an SQL query to return each query_name along with its quality and poor_query_percentage, both rounded to 2 decimal places.
You can return the results in any order.

Дана таблица Queries:
    - query_name
    - result
    - position
    - rating

Плохим считается результат с оценкой меньше 3.

Определим:
    - Качество запроса - это среднее значение rating / position для всех строк с одним query_name;
    - Процент плохих результатов — доля строк с rating < 3 среди всех результатов по данному query_name, выраженная в процентах.

Напиши SQL-запрос, который вернёт для каждого query_name его качество и процент плохих результатов, округлённые до двух знаков после запятой.
Порядок строк в результате не важен.

Annetaan taulu Queries:
    - query_name
    - result
    - position
    - rating

Tulosta pidetään huonona, jos sen arvio (rating) on alle 3.

Määritellään:
    - kyselyn laatu = keskiarvo arvosta rating / position kaikille riveille, joilla on sama query_name;
    - huonojen tulosten prosenttiosuus = niiden rivien osuus, joilla rating < 3, kaikista kyseisen query_name-arvon tuloksista, ilmaistuna prosentteina.

Kirjoita SQL-kysely, joka palauttaa jokaiselle query_name-arvolle sen laadun ja huonojen tulosten prosenttiosuuden, pyöristettynä kahden desimaalin tarkkuuteen.
Rivien järjestyksellä tuloksessa ei ole väliä.
*/

SELECT
    query_name,
    ROUND(AVG(CAST(rating AS DECIMAL) / position), 2) AS quality,
    ROUND(
        SUM(
            CASE
                WHEN rating < 3 THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS poor_query_percentage
FROM Queries
GROUP BY query_name;