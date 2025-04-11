/*
We have a table "Views" with the following columns:
+ article_id (integer, ID of the article);
+ author_id (integer, ID of the author of the article);
+ viewer_id (integer, ID of the user who viewed the article);
+ view_date (date, date when the article was viewed).

This table does not have a primary key, so duplicate rows may exist.
Each row represents an event where a viewer_id (user) viewed an article written by an author_id on a specific view_date.
If author_id and viewer_id are the same, it means the author viewed their own article.

Write an SQL query to find all authors who have viewed at least one of their own articles.

Return a table with a single column id, containing the IDs of such authors.
The result must be sorted by id in ascending order.

У нас есть таблица "Views" со следующими колонками:
+ article_id (целое число, id статьи);
+ author_id (целое число, id автора статьи);
+ viewer_id (целое число, id пользователя, который посмотрел статью);
+ view_date (дата, дата просмотра статьи).

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