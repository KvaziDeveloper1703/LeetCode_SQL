/*
You are given a table Person:
    - id
    - email

The email values consist of lowercase letters only and may contain duplicates.

Write an SQL DELETE statement to remove all duplicate emails, keeping only the row with the smallest id for each unique email.
After your query runs, the Person table should only contain unique emails with the lowest id per email.

You should modify the table in place, and the final order of the rows does not matter.

Дана таблица Person:
    - id
    - email

Значения email состоят только из строчных букв и могут повторяться.

Напиши SQL-запрос с использованием DELETE, чтобы удалить все повторяющиеся email-адреса, оставив только одну строку с наименьшим id для каждого уникального email.
После выполнения запроса таблица Person должна содержать только уникальные email-адреса, и для каждого — строку с наименьшим идентификатором.

Ты должен изменить таблицу на месте, и порядок строк в результате не имеет значения.

Annetaan taulu Person:
    - id
    - email

Sarakkeen email arvot koostuvat vain pienistä kirjaimista ja ne voivat toistua.

Kirjoita SQL-kysely käyttäen DELETE-lausetta, joka poistaa kaikki toistuvat sähköpostiosoitteet niin, että jokaiselle uniikille sähköpostille jää jäljelle vain yksi rivi - se, jolla on pienin id.
Kyselyn suorittamisen jälkeen taulun Person tulee sisältää vain uniikit sähköpostiosoitteet, ja jokaiselle niistä tulee jäädä rivi, jolla on pienin tunniste.

Sinun täytyy muokata taulua suoraan (paikan päällä), ja rivien järjestyksellä ei ole merkitystä.
*/

DELETE FROM Person
WHERE id NOT IN (
    SELECT min_id
    FROM (
        SELECT MIN(id) AS min_id
        FROM Person
        GROUP BY email
    ) AS keep_ids
);