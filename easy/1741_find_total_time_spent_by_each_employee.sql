/*
You are given a table Employees:
    - emp_id
    - event_day
    - in_time
    - out_time

Each row represents one entry and exit of an employee from the office on a given day.
An employee may enter and leave the office multiple times on the same day.
The time spent in the office for one entry is: out_time - in_time.

Write an SQL query to calculate, for each employee and each day: the total time (in minutes) spent in the office.

Return a result table with:
    - day
    - emp_id
    - total_time

The result can be returned in any order.

Дана таблица Employees:
    - emp_id
    - event_day
    - in_time
    - out_time

Каждая строка - это один вход и выход сотрудника из офиса в определённый день.
Сотрудник может несколько раз входить и выходить в один и тот же день.
Время, проведённое в офисе за один вход: out_time − in_time.

Напишите SQL-запрос, который для каждого сотрудника и каждого дня вычисляет: общее время (в минутах), проведённое в офисе.

Верните таблицу с колонками:
    - day
    - emp_id
    - total_time

Порядок строк в результате не важен.

Annetaan taulu Employees:
    - emp_id
    - event_day
    - in_time
    - out_time

Jokainen rivi kuvaa työntekijän yhtä sisään- ja uloskäyntiä toimistosta tiettynä päivänä.
Työntekijä voi käydä toimistossa useita kertoja saman päivän aikana.
Yhden käynnin aikana toimistossa vietetty aika on: out_time − in_time.

Kirjoita SQL-kysely, joka laskee kullekin työntekijälle ja kullekin päivälle: toimistossa vietetyn kokonaisajan minuutteina.

Palauta tulostaulu, jossa on sarakkeet:
    - day
    - emp_id
    - total_time

Tuloksen järjestyksellä ei ole merkitystä.
*/

SELECT event_day AS day, emp_id, SUM(out_time - in_time) AS total_time
FROM Employees
GROUP BY emp_id, event_day;