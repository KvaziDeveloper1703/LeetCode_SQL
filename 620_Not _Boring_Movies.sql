/*
You are given a table Cinema:
    - id
    - movie
    - description
    - rating

Return all movies with an odd-numbered id and a description that is not equal to "boring".
The result should be sorted by rating in descending order.

У вас есть таблица Cinema:
    - id
    - movie
    - description
    - rating

Необходимо выбрать фильмы, у которых нечетный идентификатор и описание не равно "boring".
Результат отсортируйте по убыванию рейтинга.

Sinulla on taulukko Cinema:
    - id
    - movie
    - description
    - rating

Valitse elokuvat, joilla on pariton id ja joiden description ei ole "boring".
Järjestä tulos rating-sarakkeen mukaan laskevaan järjestykseen.
*/

SELECT *
FROM Cinema
WHERE id % 2 = 1 AND description != 'boring'
ORDER BY rating DESC;