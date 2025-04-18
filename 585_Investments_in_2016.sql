/*
You are given a table:
Insurance:
 + pid: policy ID (unique);
 + tiv_2015: total investment value in 2015;
 + tiv_2016: total investment value in 2016;
 + lat: latitude of the policyholder’s city (not NULL);
 + lon: longitude of the policyholder’s city (not NULL).

Each row represents one insurance policy.

Write an SQL query to return the sum of tiv_2016 for all policyholders who meet both of the following conditions:
+ Their tiv_2015 value appears in at least one other record;
+ Their location (lat, lon) is unique among all records.

Return the result with the column:
+ tiv_2016 — the sum of investment values in 2016, rounded to two decimal places.

Дана таблица:
Insurance:
 + pid: идентификатор полиса (уникальный);
 + tiv_2015: общая сумма инвестиций в 2015 году;
 + tiv_2016: общая сумма инвестиций в 2016 году;
 + lat: широта города владельца полиса (не NULL);
 + lon: долгота города владельца полиса (не NULL).

Каждая строка представляет собой одну страховую запись.

Напиши SQL-запрос, который вернёт сумму tiv_2016 для всех полисов, удовлетворяющих обоим условиям:
+ Значение tiv_2015 встречается хотя бы у одного другого владельца полиса;
+ Местоположение (lat, lon) этого полиса уникально — то есть такое сочетание координат встречается только один раз в таблице.

Результат должен содержать колонку:
+ tiv_2016 — сумма инвестиций за 2016 год, округлённая до двух знаков после запятой.
*/

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN ( SELECT tiv_2015
                    FROM Insurance
                    GROUP BY tiv_2015
                    HAVING COUNT(*) > 1
                )
AND (lat, lon) IN ( SELECT lat, lon
                    FROM Insurance
                    GROUP BY lat, lon
                    HAVING COUNT(*) = 1
                );