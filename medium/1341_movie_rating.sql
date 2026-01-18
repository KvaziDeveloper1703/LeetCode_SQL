/*
You are given three tables:
Movies:
    - movie_id
    - title

Users:
    - user_id
    - name

MovieRating:
    - movie_id
    - user_id
    - rating
    - created_at

Write an SQL query to return:
    - The name of the user who has rated the most movies. If there is a tie, return the name that is lexicographically smaller.
    - The title of the movie with the highest average rating in February 2020. If there is a tie, return the title that is lexicographically smaller.

Return the result as a single-row table with two columns:
    - results
    - movie

Даны три таблицы:
Movies:
    - movie_id
    - title

Users:
    - user_id
    - name

MovieRating:
    - movie_id
    - user_id
    - rating
    - created_at

Напиши SQL-запрос, который вернёт:
    - Имя пользователя, который оценил наибольшее количество фильмов. При равенстве выбери лексикографически меньшее имя.
    - Название фильма с наивысшим средним рейтингом за февраль 2020 года. При равенстве выбери лексикографически меньшее название.

Результат - одна строка с двумя столбцами:
    - results
    - movie

Annetaan kolme taulua:
Movies:
    - movie_id
    - title

Users:
    - user_id
    - name

MovieRating:
    - movie_id
    - user_id
    - rating
    - created_at

Kirjoita SQL-kysely, joka palauttaa:
    - Sen käyttäjän nimen, joka on arvostellut eniten elokuvia. Tasatilanteessa valitse leksikografisesti pienempi nimi.
    - Sen elokuvan nimen, jolla on korkein keskiarvoarvosana helmikuussa 2020. Tasatilanteessa valitse leksikografisesti pienempi elokuvan nimi.

Tuloksen tulee olla yksi rivi, jossa on kaksi saraketta:
    - results
    - movie
*/

SELECT results
FROM (
    SELECT Users.name AS results
    FROM Users
    JOIN MovieRating ON Users.user_id = MovieRating.user_id
    GROUP BY Users.user_id, Users.name
    ORDER BY COUNT(*) DESC, Users.name ASC
    LIMIT 1
) AS TopUser

UNION ALL

SELECT results
FROM (
    SELECT Movies.title AS results
    FROM Movies
    JOIN MovieRating ON Movies.movie_id = MovieRating.movie_id
    WHERE MovieRating.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY Movies.movie_id, Movies.title
    ORDER BY AVG(MovieRating.rating) DESC, Movies.title ASC
    LIMIT 1
) AS TopMovie;