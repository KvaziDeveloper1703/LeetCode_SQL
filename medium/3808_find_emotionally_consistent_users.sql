/*
You are given a table reactions:
    - user_id
    - content_id
    - reaction

Each row represents a reaction given by a user to a piece of content.
Each user can react to the same content only once.
A user is eligible if they have reacted to at least 5 different content items.
A user is emotionally consistent if at least 60% of their reactions are of the same reaction type.

For each emotionally consistent user, return:
    - user_id
    - dominant_reaction
    - reaction_ratio = dominant_reaction_count / total_reactions, rounded to 2 decimal places

Order the result by:
    - reaction_ratio DESC
    - user_id ASC

Дана таблица reactions:
    - user_id
    - content_id
    - reaction

Каждая строка - это реакция пользователя на контент.
Пользователь может оставить только одну реакцию на один и тот же контент.
Пользователь считается подходящим (eligible), если он отреагировал минимум на 5 разных единиц контента.
Пользователь считается эмоционально последовательным, если не менее 60% его реакций имеют один и тот же тип.

Для каждого эмоционально последовательного пользователя вывести:
    - user_id
    - dominant_reaction
    - reaction_ratio = количество dominant_reaction / общее количество реакций, округлённое до 2 знаков

Отсортировать результат:
    - по reaction_ratio по убыванию
    - по user_id по возрастанию

Annetaan taulu reactions:
    - user_id
    - content_id
    - reaction

Jokainen rivi kuvaa käyttäjän antamaa reaktiota sisältöön.
Käyttäjä voi reagoida samaan sisältöön vain kerran.
Käyttäjä on kelpoinen (eligible), jos hän on reagoinut vähintään 5 eri sisältöön.
Käyttäjä on emotionaalisesti johdonmukainen, jos vähintään 60 % hänen reaktioistaan on samaa reaktiotyyppiä.

Palauta jokaiselle emotionaalisesti johdonmukaiselle käyttäjälle:
    - user_id
    - dominant_reaction
    - reaction_ratio = dominant_reactionin määrä / reaktioiden kokonaismäärä, pyöristetty kahteen desimaaliin

Järjestä tulos:
    - reaction_ratio laskevassa järjestyksessä
    - user_id nousevassa järjestyksessä
*/

WITH reaction_stats AS (
    SELECT user_id, reaction, COUNT(*) AS reaction_count
    FROM reactions
    GROUP BY user_id, reaction
),
user_totals AS (
    SELECT user_id, SUM(reaction_count) AS total_reactions
    FROM reaction_stats
    GROUP BY user_id
),
dominant_reactions AS (
    SELECT
        rs.user_id,
        rs.reaction AS dominant_reaction,
        rs.reaction_count,
        ut.total_reactions,
        ROUND(rs.reaction_count * 1.0 / ut.total_reactions, 2) AS reaction_ratio,
        ROW_NUMBER() OVER (
            PARTITION BY rs.user_id
            ORDER BY rs.reaction_count DESC
        ) AS rn
    FROM reaction_stats rs
    JOIN user_totals ut ON rs.user_id = ut.user_id
)
SELECT user_id, dominant_reaction, reaction_ratio
FROM dominant_reactions
WHERE rn = 1 AND total_reactions >= 5 AND reaction_ratio >= 0.60
ORDER BY reaction_ratio DESC, user_id ASC;