/*
You are given a table Cinema that contains information about movies. The table has the following columns:
+ id (int): the unique ID of the movie (primary key);
+ movie (varchar): the name of the movie;
+ description (varchar): the description or genre of the movie;
+ rating (float): the rating of the movie (with two decimal places, ranging from 0 to 10).

Your task is to return all movies with an odd-numbered id and a description that is not equal to "boring".
The result should be sorted by rating in descending order.

У вас есть таблица Cinema, содержащая информацию о фильмах. Таблица состоит из следующих столбцов:
+ id (int) — уникальный идентификатор фильма;
+ movie (varchar) — название фильма;
+ description (varchar) — описание фильма;
+ rating (float) — рейтинг фильма (два знака после запятой, от 0 до 10).

Необходимо выбрать фильмы, у которых нечетный идентификатор (id) и описание (description) не равно "boring".
Результат отсортируйте по убыванию рейтинга (rating).
*/

SELECT *
FROM Cinema
WHERE id % 2 = 1
  AND description != 'boring'
ORDER BY rating DESC;