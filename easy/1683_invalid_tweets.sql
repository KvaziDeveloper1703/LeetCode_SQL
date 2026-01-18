/*
We have a table Tweets:
    - tweet_id
    - content

All characters in content are from an American keyboard, and no other special characters are used.
This table contains all tweets posted in a social media app.

Definition of an "invalid" tweet: A tweet is considered invalid if its length is strictly greater than 15 characters (LENGTH(content) > 15).

Write an SQL query to find the tweet_id of all invalid tweets.

Return a table with a single column tweet_id, containing the IDs of such tweets.
The result order can be arbitrary.

У нас есть таблица Tweets:
    - tweet_id
    - content

Все символы в content набраны на американской клавиатуре, и в тексте нет других специальных символов.
Эта таблица содержит все твиты, опубликованные в социальной сети.

Определение "некорректного" твита: Твит считается некорректным, если его длина строго больше 15 символов (LENGTH(content) > 15).

Написать SQL-запрос, который находит tweet_id всех некорректных твитов.

Вывести таблицу с одним столбцом tweet_id, содержащую идентификаторы таких твитов.
Порядок строк в ответе может быть произвольным.

Meillä on taulu Tweets:
    - tweet_id
    - content

Kaikki content-sarakkeen merkit on kirjoitettu amerikkalaisella näppäimistöllä, eikä tekstissä ole muita erikoismerkkejä.
Tämä taulu sisältää kaikki sosiaalisessa mediassa julkaistut twiitit.

“Virheellisen” twiitin määritelmä: Twiitti katsotaan virheelliseksi, jos sen pituus on tiukasti suurempi kuin 15 merkkiä (LENGTH(content) > 15).

Kirjoita SQL-kysely, joka hakee kaikkien virheellisten twiittien tweet_id-arvot.

Tulosta taulu, jossa on yksi sarake tweet_id, ja jossa on näiden twiittien tunnisteet.
Rivien järjestyksellä ei ole väliä.
*/

SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;