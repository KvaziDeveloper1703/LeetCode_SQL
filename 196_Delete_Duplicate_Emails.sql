/*
You are given a table:

Person:
 + id: unique ID of the row (primary key);
 + email: email address of the person.

The email values consist of lowercase letters only and may contain duplicates.

Write an SQL DELETE statement to remove all duplicate emails, keeping only the row with the smallest id for each unique email.

After your query runs, the Person table should only contain unique emails with the lowest id per email.

You should modify the table in place, and the final order of the rows does not matter.

Дана таблица:

Person:
 + id: уникальный идентификатор строки (первичный ключ);
 + email: электронная почта пользователя.

Значения email состоят только из строчных букв и могут повторяться.

Напиши SQL-запрос с использованием DELETE, чтобы удалить все повторяющиеся email-адреса, оставив только одну строку с наименьшим id для каждого уникального email.

После выполнения запроса таблица Person должна содержать только уникальные email-адреса, и для каждого — строку с наименьшим идентификатором.

Ты должен изменить таблицу на месте, и порядок строк в результате не имеет значения.
*/

DELETE FROM Person
WHERE id NOT IN ( SELECT min_id FROM (  SELECT MIN(id) AS min_id
                                        FROM Person
                                        GROUP BY email
                                    ) AS keep_ids
);