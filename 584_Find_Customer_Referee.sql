/*
We have a table Customer:
    - id
    - name
    - referee_id

Each row in the table represents a customer, their name, and referee_id, which indicates who referred them. If referee_id is NULL, it means the customer was not referred by anyone.

Write an SQL query to find the names of all customers who were NOT referred by the customer with id = 2.

Return a table with a single column name, containing the names of such customers. The result order can be arbitrary.

У нас есть таблица Customer:
    - id
    - name
    - referee_id

Каждая строка таблицы представляет клиента, его имя и referee_id, указывающий, кто его порекомендовал. Если referee_id имеет значение NULL, значит, этот клиент никем не был рекомендован.

Написать SQL-запрос, который выбирает имена всех клиентов, которых НЕ порекомендовал клиент с id = 2.

Вывести таблицу с одним столбцом name, содержащую имена таких клиентов. Порядок строк в ответе может быть произвольным.

Meillä on taulu Customer:
    - id
    - name
    - referee_id

Jokainen taulun rivi edustaa asiakasta, hänen nimeään sekä referee_id-kenttää, joka kertoo, kuka hänet suositteli. Jos referee_id on NULL, asiakasta ei ole suositellut kukaan.

Kirjoita SQL-kysely, joka hakee kaikkien niiden asiakkaiden nimet, joita asiakas, jonka id = 2, EI ole suositellut.

Palauta tuloksena taulu, jossa on yksi sarake name, ja siinä näiden asiakkaiden nimet. Rivien järjestyksellä ei ole väliä.
*/

SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id <> 2;