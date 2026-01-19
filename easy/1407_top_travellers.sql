/*
You are given two tables:
Users:
    - id
    - name

Rides:
    - id
    - user_id
    - distance

For each user, calculate the total distance they traveled. If a user has no rides, the total is 0.
Return name and travelled_distance, sorted by travelled_distance descending, and if equal then by name ascending.

Вам даны две таблицы:
Users:
    - id
    - name

Rides:
    - id
    - user_id
    - distance

Для каждого пользователя посчитайте суммарное расстояние, которое он проехал. Если у пользователя нет поездок, то сумма равна 0.
Верните name и travelled_distance, отсортировав по travelled_distance по убыванию, а при равенстве по name по возрастанию.

Sinulle annetaan kaksi taulukkoa:
Users:
    - id
    - name

Rides:
    - id
    - user_id
    - distance

Laske jokaiselle käyttäjälle hänen matkustamansa kokonaismatka (summa kaikista matkoista). Jos käyttäjällä ei ole yhtään matkaa, kokonaismatka on 0.
Palauta name ja travelled_distance, ja järjestä tulokset travelled_distance-sarakkeen mukaan laskevasti, ja jos arvot ovat samat, name-sarakkeen mukaan nousevasti.
*/

SELECT Users.name, COALESCE(SUM(Rides.distance), 0) AS travelled_distance
FROM Users
LEFT JOIN Rides ON Users.id = Rides.user_id
GROUP BY Users.id, Users.name
ORDER BY travelled_distance DESC, Users.name ASC;