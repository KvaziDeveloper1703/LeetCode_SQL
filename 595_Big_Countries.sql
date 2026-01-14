/*
We have a table World:
    - name
    - continent
    - area
    - population
    - gdp

A country is considered big if at least one of the following conditions is met:
    - Its area is at least 3,000,000 km², or
    - Its population is at least 25,000,000.

Write an SQL query to find the name, population, and area of all big countries.
Return a table with the columns name, population, and area, containing information only about big countries.
The result order can be arbitrary.

У нас есть таблица World:
    - name
    - continent
    - area
    - population
    - gdp

Страна считается большой, если выполняется хотя бы одно из условий:
    - её площадь не менее 3 000 000 км², или
    - её население не менее 25 000 000 человек.

Написать SQL-запрос, который находит имена, население и площадь всех больших стран.
Вывести таблицу с колонками name, population, area, содержащую информацию только о больших странах.
Порядок строк в ответе может быть произвольным.

Meillä on taulukko World:
    - name
    - continent
    - area
    - population
    - gdp

Maa katsotaan suureksi, jos vähintään yksi seuraavista ehdoista täyttyy:
    - sen pinta-ala on vähintään 3 000 000 km², tai
    - sen väkiluku on vähintään 25 000 000.

Kirjoita SQL-kysely, joka hakee nimet, väkiluvun ja pinta-alan kaikista suurista maista.
Tulosta taulukko sarakkeilla name, population, area, joka sisältää tiedot vain suurista maista.
Rivien järjestyksellä ei ole väliä.
*/

SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;