/*
You are given a table:
+ Queries:
    + query_name: Name of the query;
    + result: Result returned by the query;
    + position: Position of the result (1 to 500);
    + rating: Rating of the result (1 to 5).

A poor query is defined as one with a rating less than 3.

Define:
+ Query quality as the average of rating / position for all results with the same query_name;
+ Poor query percentage as the percentage of results with rating < 3 for each query_name.

Write an SQL query to return each query_name along with its quality and poor_query_percentage, both rounded to 2 decimal places.
You can return the results in any order.

Дана таблица:
+ Queries:
    + query_name: название запроса;
    + result: результат, полученный в ответ;
    + position: позиция результата (от 1 до 500);
    + rating: оценка результата (от 1 до 5).

Плохим считается результат с оценкой меньше 3.

Определим:
+ Качество запроса — это среднее значение rating / position для всех строк с одним query_name;
+ Процент плохих результатов — доля строк с rating < 3 среди всех результатов по данному query_name, выраженная в процентах.

Напиши SQL-запрос, который вернёт для каждого query_name его качество и процент плохих результатов, округлённые до двух знаков после запятой.
Порядок строк в результате не важен.
*/

SELECT  query_name,
        ROUND(AVG(CAST(rating AS DECIMAL) / position), 2) AS quality,
        ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;