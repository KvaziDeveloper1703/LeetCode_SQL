/*
You are given a table named "Weather" with the following structure:
    - The id column contains unique values;
    - There are no duplicate rows with the same recordDate;
    - The table records the temperature on a specific date.

Write a SQL query to find all id values where the temperature is higher than the previous day's temperature.
Return the result table in any order.

Вам дана таблица "Weather" со следующей структурой:
    - Колонка id содержит уникальные значения;
    - В таблице нет строк с одинаковым recordDate;
    - В таблице записана температура за определённый день.

Напишите SQL-запрос, который найдёт все id, у которых температура выше, чем в предыдущий день.
Верните таблицу с результатом в любом порядке.

Sinulle annetaan taulu Weather, jolla on seuraava rakenne:
    - Sarake id sisältää uniikkeja arvoja;
    - Taulussa ei ole rivejä, joilla olisi sama recordDate;
    - Tauluun on tallennettu tietyn päivän lämpötila.

Kirjoita SQL-kysely, joka löytää kaikki id-arvot, joiden lämpötila on korkeampi kuin edellisenä päivänä.
Palauta tulostaulu, ja rivien järjestyksellä ei ole merkitystä.
*/

SELECT Weather.id
FROM Weather
JOIN Weather AS PreviousDay ON Weather.recordDate = DATE_ADD(PreviousDay.recordDate, INTERVAL 1 DAY)
WHERE Weather.temperature > PreviousDay.temperature;