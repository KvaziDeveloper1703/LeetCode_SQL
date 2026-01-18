/*
We have a table Views:
    - article_id
    - author_id
    - viewer_id
    - view_date

This table does not have a primary key, so duplicate rows may exist.
Each row represents an event where a viewer_id (user) viewed an article written by an author_id on a specific view_date.
If author_id and viewer_id are the same, it means the author viewed their own article.

Write an SQL query to find all authors who have viewed at least one of their own articles.

Return a table with a single column id, containing the IDs of such authors.
The result must be sorted by id in ascending order.

У нас есть таблица "Views" со следующими колонками:
    - article_id
    - author_id
    - viewer_id
    - view_date

В этой таблице нет первичного ключа, поэтому возможны дубликаты строк.
Каждая строка представляет факт просмотра некоторым пользователем (viewer_id) статьи, написанной определённым автором (author_id), в конкретную дату (view_date).
Если author_id и viewer_id равны, это означает, что автор просмотрел свою же статью.

Написать SQL-запрос, который находит всех авторов, которые хотя бы раз просмотрели одну из своих собственных статей.

Вывести таблицу с одним столбцом id, содержащую id таких авторов.
Результат должен быть отсортирован по id в порядке возрастания.
*/

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;