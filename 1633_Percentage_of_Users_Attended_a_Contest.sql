/*
You are given two tables:
Users:
    - user_id
    - user_name

Register:
    - contest_id
    - user_id

Write an SQL query to find the percentage of users who registered for each contest, rounded to two decimal places.
Return the result sorted by percentage in descending order, and by contest_id in ascending order if there is a tie.

Даны две таблицы:
Users:
    - user_id
    - user_name

Register
    - contest_id
    - user_id

Напиши SQL-запрос, который вернёт процент пользователей, зарегистрированных на каждый контест, округлённый до двух знаков после запятой.
Результат отсортируй по убыванию percentage, а при равенстве — по возрастанию contest_id.

Annetaan kaksi taulua:
Users:
    - user_id
    - user_name

Register:
    - contest_id
    - user_id

Kirjoita SQL-kysely, joka palauttaa niiden käyttäjien prosenttiosuuden, jotka ovat rekisteröityneet kuhunkin kilpailuun, pyöristettynä kahteen desimaaliin.
Järjestä tulos laskevasti sarakkeen percentage mukaan, ja tasatilanteessa nousevasti sarakkeen contest_id mukaan.
*/

SELECT Register.contest_id, ROUND(COUNT(DISTINCT Register.user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register
GROUP BY Register.contest_id
ORDER BY percentage DESC, Register.contest_id ASC;