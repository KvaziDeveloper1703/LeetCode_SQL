/*
You are given a table Logins:
    - user_id
    - time_stamp

For each user, find their latest login in the year 2020.
    - Consider only logins that occurred in 2020;
    - Exclude users who have no logins in 2020.

Return the result with columns: user_id, last_stamp.
The result order does not matter.

Дана таблица Logins со столбцами:
    - user_id
    - time_stamp

Для каждого пользователя найти последний вход в систему в 2020 году.
    - Учитывать только записи за 2020 год;
    - Исключить пользователей, у которых нет входов в 2020.

Вернуть таблицу: user_id, last_stamp.
Порядок строк не важен.

Annetaan taulu Logins, jossa on sarakkeet:
    - user_id
    - time_stamp

Etsi jokaiselle käyttäjälle viimeisin kirjautuminen vuonna 2020.
    - Ota huomioon vain vuoden 2020 kirjautumistapahtumat;
    - Sulje pois käyttäjät, joilla ei ole yhtään kirjautumista vuonna 2020.

Palauta taulu: user_id, last_stamp.
Rivien järjestyksellä ei ole väliä.
*/

SELECT user_id, MAX(time_stamp) AS last_stamp
FROM Logins
WHERE time_stamp >= '2020-01-01' AND time_stamp < '2021-01-01'
GROUP BY user_id;