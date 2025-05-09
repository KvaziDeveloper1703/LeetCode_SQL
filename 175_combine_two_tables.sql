/*
You are given two tables: Person and Address.

The Person table contains:
+ personId (primary key)
+ lastName
+ firstName

The Address table contains:
+ addressId (primary key)
+ personId (foreign key to Person)
+ city
+ state

Write a SQL query to return the firstName, lastName, city, and state for each person in the Person table.
If a person does not have an address in the Address table, return NULL for city and state.
The output can be in any order.

Вам даны две таблицы: Person и Address.

Таблица Person содержит:
+ personId — идентификатор человека (первичный ключ)
+ lastName — фамилия
+ firstName — имя

Таблица Address содержит:
+ addressId — идентификатор адреса (первичный ключ)
+ personId — внешний ключ на таблицу Person
+ city — город
+ state — штат

Напишите SQL-запрос, который вернёт имя (firstName), фамилию (lastName), город (city) и штат (state) для каждого человека из таблицы Person.
Если у человека нет адреса в таблице Address, выведите NULL вместо города и штата.
Порядок строк в результирующей таблице может быть любым.
*/

SELECT Person.firstName, Person.lastName, Address.city, Address.state
FROM Person LEFT JOIN Address ON Person.personId = Address.personId;