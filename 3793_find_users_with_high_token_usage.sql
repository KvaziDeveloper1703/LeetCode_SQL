/*
You are given a table prompts with columns:
    - user_id
    - prompt
    - tokens

Each row represents a prompt submitted by a user and the number of tokens used.

Write an SQL query that:
    - for each user, counts the total number of prompts;
    - for each user, calculates the average number of tokens per prompt, rounded to 2 decimal places;
    - includes only users with at least 3 prompts;
    - includes only users who have at least one prompt with tokens greater than their own average.

Return:
    - user_id
    - prompt_count
    - avg_tokens

Order the result by:
    - avg_tokens in descending order;
    - user_id in ascending order.

Дана таблица prompts со столбцами:
    - user_id
    - prompt
    - tokens

Каждая строка - это запрос пользователя и количество использованных токенов.

Напишите SQL-запрос, который:
    - для каждого пользователя считает количество запросов;
    - для каждого пользователя вычисляет среднее число токенов на запрос, округлённое до 2 знаков;
    - учитывает только пользователей с минимум 3 запросами;
    - учитывает только пользователей, у которых есть хотя бы один запрос с числом токенов больше их собственного среднего.

Выведите:
    - user_id
    - prompt_count
    - avg_tokens

Отсортируйте результат:
    - по avg_tokens по убыванию;
    - по user_id по возрастанию.

Annettu taulu prompts, jossa on sarakkeet:
    - user_id
    - prompt
    - tokens

Jokainen rivi on käyttäjän tekemä pyyntö ja siinä käytettyjen tokenien määrä.

Kirjoita SQL-kysely, joka:
    - laskee jokaiselle käyttäjälle pyyntöjen lukumäärän;
    - laskee jokaiselle käyttäjälle keskimääräisen tokenien määrän per pyyntö ja pyöristää sen 2 desimaaliin;
    - huomioi vain käyttäjät, joilla on vähintään 3 pyyntöä;
    - huomioi vain käyttäjät, joilla on vähintään yksi pyyntö, jossa tokenien määrä on suurempi kuin heidän oma keskiarvonsa.

Tulosta:
    - user_id
    - prompt_count
    - avg_tokens

Lajittele tulos:
    - avg_tokens laskevasti;
    - user_id nousevasti.
*/

SELECT
    prompts.user_id,
    COUNT(*) AS prompt_count,
    ROUND(AVG(prompts.tokens), 2) AS avg_tokens
FROM prompts
GROUP BY prompts.user_id
HAVING
    COUNT(*) >= 3
    AND EXISTS (
        SELECT 1
        FROM prompts AS inner_prompts
        WHERE inner_prompts.user_id = prompts.user_id
            AND inner_prompts.tokens > (
                SELECT AVG(average_prompts.tokens)
                 FROM prompts AS average_prompts
                WHERE average_prompts.user_id = prompts.user_id
            )
        )
ORDER BY avg_tokens DESC, prompts.user_id ASC;