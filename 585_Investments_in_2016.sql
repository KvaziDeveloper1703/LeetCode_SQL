/*
You are given a table Insurance:
    - pid: policy ID;
    - tiv_2015: total investment value in 2015;
    - tiv_2016: total investment value in 2016;
    - lat: latitude of the policyholder’s city;
    - lon: longitude of the policyholder’s city.

Each row represents one insurance policy.

Write an SQL query to return the sum of tiv_2016 for all policyholders who meet both of the following conditions:
    - Their tiv_2015 value appears in at least one other record;
    - Their location (lat, lon) is unique among all records.

Return the result with the column: tiv_2016 - the sum of investment values in 2016, rounded to two decimal places.

Дана таблица Insurance:
    - pid: идентификатор полиса;
    - tiv_2015: общая сумма инвестиций в 2015 году;
    - tiv_2016: общая сумма инвестиций в 2016 году;
    - lat: широта города владельца полиса;
    - lon: долгота города владельца полиса.

Каждая строка представляет собой одну страховую запись.

Напиши SQL-запрос, который вернёт сумму tiv_2016 для всех полисов, удовлетворяющих обоим условиям:
    - Значение tiv_2015 встречается хотя бы у одного другого владельца полиса;
    - Местоположение (lat, lon) этого полиса уникально - то есть такое сочетание координат встречается только один раз в таблице.

Результат должен содержать колонку: tiv_2016 - сумма инвестиций за 2016 год, округлённая до двух знаков после запятой.

Annetaan taulu Insurance:
    - pid: vakuutuksen tunniste;
    - tiv_2015: sijoitusten kokonaismäärä vuonna 2015;
    - tiv_2016: sijoitusten kokonaismäärä vuonna 2016;
    - lat: vakuutuksen omistajan kaupungin leveysaste;
    - lon: vakuutuksen omistajan kaupungin pituusaste.

Jokainen rivi edustaa yhtä vakuutustietuetta.

Kirjoita SQL-kysely, joka palauttaa tiv_2016-arvojen summan kaikille vakuutuksille, jotka täyttävät molemmat ehdot:
    - tiv_2015-arvo esiintyy vähintään yhdellä toisella vakuutuksen omistajalla;
    - vakuutuksen sijainti (lat, lon) on uniikki - eli sama koordinaattipari esiintyy taulussa vain kerran.

Tuloksen tulee sisältää sarake tiv_2016, eli vuoden 2016 sijoitusten summa, pyöristettynä kahden desimaalin tarkkuuteen.
*/

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);