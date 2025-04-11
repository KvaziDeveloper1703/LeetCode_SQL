/*
We have a table "World" with the following columns:
+ name (string, unique country name, primary key);
+ continent (string, continent the country belongs to);
+ area (integer, country's area in square kilometers);
+ population (integer, country's population);
+ gdp (bigint, country's gross domestic product).

Definition of a "big country"
A country is considered big if at least one of the following conditions is met:
+ Its area is at least 3,000,000 km² (area >= 3000000), or
+ Its population is at least 25,000,000 (population >= 25000000).

Write an SQL query to find the name, population, and area of all big countries.

Return a table with the columns name, population, and area, containing information only about big countries. The result order can be arbitrary.

У нас есть таблица "World" со следующими колонками:
+ name (строка, уникальное имя страны, первичный ключ);
+ continent (строка, континент, на котором расположена страна);
+ area (целое число, площадь страны в квадратных километрах);
+ population (целое число, население страны);
+ gdp (bigint, валовой внутренний продукт страны).

Определение "большой страны"
Страна считается большой, если выполняется хотя бы одно из условий:
+ её площадь не менее 3 000 000 км² (area >= 3000000), или
+ её население не менее 25 000 000 человек (population >= 25000000).

Написать SQL-запрос, который находит имена, население и площадь всех больших стран.

Вывести таблицу с колонками name, population, area, содержащую информацию только о больших странах. Порядок строк в ответе может быть произвольным.
*/

SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;