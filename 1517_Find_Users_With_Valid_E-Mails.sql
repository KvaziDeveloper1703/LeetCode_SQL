/*
You are given a table:
+ Users:
    + user_id: unique identifier of the user (primary key);
    + name: name of the user;
    + mail: email address of the user.

Some emails may be invalid.

Write an SQL query to find users with valid email addresses, where a valid email must satisfy both conditions:
1) The prefix (before the @) must start with a letter and may contain only:  + letters (uppercase or lowercase),
    + digits,
    + underscore _,
    + period .,
    + or dash -.

2) The domain must be exactly @leetcode.com.

Return the result with the following columns:
+ user_id
+ name
+ mail

The result can be in any order.

Дана таблица:
+ Users:
    + user_id: уникальный идентификатор пользователя (первичный ключ);
    + name: имя пользователя;
    + mail: email-адрес пользователя.

Некоторые email-адреса могут быть некорректными.

Напиши SQL-запрос, который выберет пользователей с валидными email-адресами, удовлетворяющими следующим условиям:
1) Префикс (часть до @) должен начинаться с буквы, а также может содержать только:
    + буквы (в любом регистре),
    + цифры,
    + символы _, ., -

2) Домен должен быть строго @leetcode.com.

Результат должен содержать колонки:
+ user_id
+ name
+ mail

Порядок строк может быть произвольным.
*/

SELECT  Users.user_id,
        Users.name,
        Users.mail
FROM Users
WHERE Users.mail REGEXP '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$';