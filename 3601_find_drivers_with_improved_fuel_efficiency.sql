/*
You are given two tables: drivers and trips.

Find drivers whose fuel efficiency improved from the first half of the year to the second half of the year.

Rules:
    - Fuel efficiency per trip = distance_km / fuel_consumed;
    - First half: January-June;
    - Second half: July-December;
    - Include only drivers who have trips in both halves;
    - Efficiency improvement = second_half_avg - first_half_avg;
    - Round all calculated values to 2 decimal places.

Return: driver_id, driver_name, first_half_avg, second_half_avg, efficiency_improvement.

Order by:
    - efficiency_improvement DESC;
    - driver_name ASC.

Даны таблицы drivers и trips.

Найти водителей, у которых улучшилась топливная эффективность при сравнении первой и второй половины года.

Условия:
    - Топливная эффективность поездки = distance_km / fuel_consumed;
    - Первая половина года: январь-июнь;
    - Вторая половина года: июль-декабрь;
    - Учитываются только водители, у которых есть поездки в обеих половинах года;
    - Улучшение эффективности = second_half_avg - first_half_avg;
    - Все значения округлить до 2 знаков.

Вывести:
    - driver_id, driver_name, first_half_avg, second_half_avg, efficiency_improvement;
    - Сортировка:
        - efficiency_improvement по убыванию;
        - driver_name по возрастанию.

Annetaan taulut drivers ja trips.

Etsi kuljettajat, joiden polttoainetehokkuus on parantunut verrattaessa vuoden ensimmäistä ja toista puoliskoa.

Ehdot:
    - matkan polttoainetehokkuus = distance_km / fuel_consumed;
    - vuoden ensimmäinen puolisko: tammikuu–kesäkuu;
    - vuoden toinen puolisko: heinäkuu–joulukuu;
    - huomioidaan vain kuljettajat, joilla on matkoja molemmissa vuoden puoliskoissa;
    - tehokkuuden parannus = second_half_avg − first_half_avg;
    - pyöristä kaikki arvot kahden desimaalin tarkkuuteen.

Tulosta: driver_id, driver_name, first_half_avg, second_half_avg, efficiency_improvement.

Järjestä tulos:
    - efficiency_improvement laskevaan järjestykseen;
    - driver_name nousevaan järjestykseen.
*/

WITH trip_efficiency_by_half AS (
    SELECT driver_id,
        CASE
            WHEN MONTH(trip_date) BETWEEN 1 AND 6 THEN 'FIRST_HALF'
            ELSE 'SECOND_HALF'
        END AS year_half,
        distance_km / fuel_consumed AS fuel_efficiency
    FROM trips
),
average_efficiency_per_half AS (
    SELECT driver_id, year_half, AVG(fuel_efficiency) AS average_fuel_efficiency
    FROM trip_efficiency_by_half
    GROUP BY driver_id, year_half
),
drivers_with_both_halves AS (
    SELECT first_half.driver_id, first_half.average_fuel_efficiency AS first_half_avg, second_half.average_fuel_efficiency AS second_half_avg
    FROM average_efficiency_per_half first_half
    JOIN average_efficiency_per_half second_half ON first_half.driver_id = second_half.driver_id
    WHERE first_half.year_half = 'FIRST_HALF' AND second_half.year_half = 'SECOND_HALF' AND second_half.average_fuel_efficiency > first_half.average_fuel_efficiency
)
SELECT drivers.driver_id, drivers.driver_name, ROUND(first_half_avg, 2) AS first_half_avg, ROUND(second_half_avg, 2) AS second_half_avg, ROUND(second_half_avg - first_half_avg, 2) AS efficiency_improvement
FROM drivers_with_both_halves
JOIN drivers ON drivers.driver_id = drivers_with_both_halves.driver_id
ORDER BY efficiency_improvement DESC, drivers.driver_name ASC;