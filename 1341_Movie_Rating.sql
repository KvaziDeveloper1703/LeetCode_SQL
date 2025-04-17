/*
You are given three tables:
+ Movies:
    + movie_id: Unique ID of the movie;
    + title: Title of the movie.

+ Users:
    + user_id: Unique ID of the user;
    + name: Name of the user (unique).

+ MovieRating:
    + movie_id: ID of the movie;
    + user_id: ID of the user who rated;
    + rating: Rating given (integer);
    + created_at: Date of the rating;
    + (movie_id, user_id) is the primary key.

Write an SQL query to return:
1) The name of the user who has rated the most movies.
    + If there is a tie, return the name that is lexicographically smaller.
2) The title of the movie with the highest average rating in February 2020.
    + If there is a tie, return the title that is lexicographically smaller.

Return the result as a single-row table with two columns:
+ results: name of the user;
+ movie: title of the movie.

Даны три таблицы:
+ Movies:
    + movie_id: уникальный идентификатор фильма;
    + title: название фильма.

+ Users:
    + user_id: уникальный идентификатор пользователя;
    + name: имя пользователя (уникально).

+ MovieRating:
    + movie_id: ID фильма;
    + user_id: ID пользователя, поставившего оценку;
    + rating: оценка;
    + created_at: дата оценки;
    + (movie_id, user_id) — первичный ключ.

Напиши SQL-запрос, который вернёт:
1) Имя пользователя, который оценил наибольшее количество фильмов
    + При равенстве выбери лексикографически меньшее имя
2) Название фильма с наивысшим средним рейтингом за февраль 2020 года
    + При равенстве выбери лексикографически меньшее название

Результат — одна строка с двумя столбцами:
+ results: имя пользователя
+ movie: название фильма
*/

SELECT results
FROM (  SELECT Users.name AS results
        FROM Users
        JOIN MovieRating ON Users.user_id = MovieRating.user_id
        GROUP BY Users.user_id, Users.name
        ORDER BY COUNT(*) DESC, Users.name ASC
        LIMIT 1
) AS TopUser

UNION ALL

SELECT results
FROM (  SELECT Movies.title AS results
        FROM Movies
        JOIN MovieRating ON Movies.movie_id = MovieRating.movie_id
        WHERE MovieRating.created_at BETWEEN '2020-02-01' AND '2020-02-29'
        GROUP BY Movies.movie_id, Movies.title
        ORDER BY AVG(MovieRating.rating) DESC, Movies.title ASC
        LIMIT 1
) AS TopMovie;