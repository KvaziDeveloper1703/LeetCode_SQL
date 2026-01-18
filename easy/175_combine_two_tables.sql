/*
You are given two tables: Person and Address.

The Person table contains:
    - personId
    - lastName
    - firstName

The Address table contains:
    - addressId
    - personId
    - city
    - state

Write a SQL query to return the firstName, lastName, city, and state for each person in the Person table.
If a person does not have an address in the Address table, return NULL for city and state.
The output can be in any order.

Вам даны две таблицы: Person и Address.

Таблица Person содержит:
    - personId
    - lastName
    - firstName

Таблица Address содержит:
    - addressId
    - personId
    - city
    - state

Напишите SQL-запрос, который вернёт имя (firstName), фамилию (lastName), город (city) и штат (state) для каждого человека из таблицы Person.
Если у человека нет адреса в таблице Address, выведите NULL вместо города и штата.
Порядок строк в результирующей таблице может быть любым.

Sinulle on annettu kaksi taulua: Person ja Address.

Taulu Person sisältää:
    - personId
    - lastName
    - firstName

Taulu Address sisältää:
    - addressId
    - personId
    - city
    - state

Kirjoita SQL-kysely, joka palauttaa etunimen (firstName), sukunimen (lastName), kaupungin (city) ja osavaltion (state) jokaiselle henkilölle taulusta Person.
Jos henkilöllä ei ole osoitetta taulussa Address, näytä NULL kaupungin ja osavaltion kohdalla.
Tulostaulun rivien järjestyksellä ei ole merkitystä.
*/

SELECT Person.firstName, Person.lastName, Address.city, Address.state
FROM Person 
LEFT JOIN Address ON Person.personId = Address.personId;