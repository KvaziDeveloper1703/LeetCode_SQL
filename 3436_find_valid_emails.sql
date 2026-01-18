/*
You are given a table with the following columns:
    - id
    - revenue
    - month

Each row represents the revenue of a specific department for a specific month.
The month column contains values from the set: ["Jan", "Feb", "Mar", ..., "Dec"].

Write a SQL query to pivot the table such that:
    - Each row corresponds to a single department;
    - There is a separate column for the revenue of each month.

Return the resulting table in any order.

Дана таблица со следующими колонками:
    - id
    - revenue
    - month

Каждая строка отражает выручку определённого отдела за конкретный месяц.
Колонка month принимает значения из множества: ["Jan", "Feb", "Mar", ..., "Dec"].

Напишите SQL-запрос, который транспонирует таблицу так, чтобы:
    - каждая строка соответствовала одному отделу;
    - для каждого месяца (Jan, Feb, Mar, ..., Dec) была отдельная колонка с выручкой.

Итоговую таблицу можно вернуть в произвольном порядке.

Annetaan taulu, jossa on seuraavat sarakkeet:
    - id
    - revenue
    - month

Jokainen rivi kuvaa tietyn osaston liikevaihtoa tiettynä kuukautena.
Sarakkeen month arvot kuuluvat joukkoon: ["Jan", "Feb", "Mar", ..., "Dec"].

Kirjoita SQL-kysely, joka transpontoi taulun siten, että:
    - jokainen rivi vastaa yhtä osastoa;
    - jokaiselle kuukaudelle (Jan, Feb, Mar, ..., Dec) on oma sarake, jossa näkyy liikevaihto.

Lopullisen taulun voi palauttaa missä tahansa järjestyksessä.
*/

SELECT user_id, email
FROM Users
WHERE email REGEXP '^[A-Za-z0-9_]+@[A-Za-z]+\\.com$'
ORDER BY user_id;