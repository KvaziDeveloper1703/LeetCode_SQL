/*
You are given a table Users:
    - user_id
    - name
    - mail

Some emails may be invalid.

Write an SQL query to find users with valid email addresses, where a valid email must satisfy both conditions:

The prefix (before the @) must start with a letter and may contain only:  + letters (uppercase or lowercase),
    - digits
    - underscore
    - period
    - or dash

The domain must be exactly @leetcode.com.

Return the result with the following columns:
    - user_id
    - name
    - mail

The result can be in any order.

Дана таблица:
Users:
    - user_id
    - name
    - mail

Некоторые email-адреса могут быть некорректными.

Напиши SQL-запрос, который выберет пользователей с валидными email-адресами, удовлетворяющими следующим условиям:

Префикс (часть до символа @) должен начинаться с буквы и может содержать только:
    - буквы
    - цифры
    - подчёркивание
    - точку
    - дефис

Домен должен быть строго @leetcode.com.

Результат должен содержать колонки:
    - user_id
    - name
    - mail

Порядок строк может быть произвольным.

Annetaan taulu:
Users:
    - user_id
    - name
    - mail

Jotkin sähköpostiosoitteet voivat olla virheellisiä.

Kirjoita SQL-kysely, joka valitsee käyttäjät, joilla on kelvollinen sähköpostiosoite ja joka täyttää seuraavat ehdot:

Etuliitteen (osa ennen @-merkkiä) on alettava kirjaimella ja se saa sisältää vain:
    - kirjaimia
    - numeroita
    - alaviivan (_)
    - pisteen (.)
    - yhdysmerkin (-)

Verkkotunnuksen on oltava täsmälleen @leetcode.com.

Tuloksen tulee sisältää sarakkeet:
    - user_id
    - name
    - mail

Rivien järjestyksellä ei ole väliä.
*/

SELECT Users.user_id, Users.name, Users.mail
FROM Users
WHERE Users.mail REGEXP '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$';