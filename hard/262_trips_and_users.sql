/*
You have two tables:
Trips:
    - id
    - client_id
    - driver_id
    - city_id
    - status
    - request_at

Users:
    - users_id
    - banned
    - role

Find the daily cancellation rate for trips between 2013-10-01 and 2013-10-03:
    - Count only trips where both client and driver are not banned;
    - Cancellation Rate = (number of cancelled trips) / (total trips) for that day;
    - Cancelled trips are those with status cancelled_by_client or cancelled_by_driver;
    - Round the result to 2 decimal places;
    - Return Day and Cancellation Rate.

Есть две таблицы:
Trips:
    - id
    - client_id
    - driver_id
    - city_id
    - status
    - request_at

Users:
    - users_id
    - banned
    - role

Найди долю отмен по дням за период 2013-10-01 до 2013-10-03:
    - Учитывать только поездки, где и клиент, и водитель не забанены;
    - Cancellation Rate = (кол-во отменённых поездок) / (всего поездок) за день;
    - Отменённые поездки это cancelled_by_client или cancelled_by_driver;
    - Округлить до 2 знаков после запятой;
    - Вернуть Day и Cancellation Rate.

On kaksi taulua:
Trips:
    - id
    - client_id
    - driver_id
    - city_id
    - status
    - request_at

Users:
    - users_id
    - banned
    - role

Etsi peruutusprosentti päivittäin ajalta 2013-10-01 – 2013-10-03:
    - Huomioi vain matkat, joissa sekä asiakas että kuljettaja eivät ole bannattuja;
    - Cancellation Rate = (peruutettujen matkojen määrä) / (kaikkien matkojen määrä) kyseisenä päivänä;
    - Peruutetut matkat ovat cancelled_by_client tai cancelled_by_driver;
    - Pyöristä tulos kahden desimaalin tarkkuudella;
    - Palauta Day ja Cancellation Rate.
*/

SELECT Trips.request_at AS Day, ROUND(SUM(Trips.status IN ('cancelled_by_client', 'cancelled_by_driver')) / COUNT(*), 2) AS `Cancellation Rate`
FROM Trips
JOIN Users AS ClientUsers ON Trips.client_id = ClientUsers.users_id AND ClientUsers.banned = 'No'
JOIN Users AS DriverUsers ON Trips.driver_id = DriverUsers.users_id AND DriverUsers.banned = 'No'
WHERE Trips.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY Trips.request_at;