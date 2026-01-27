/*
You are given a table course_completions:
    - user_id
    - course_id
    - course_name
    - completion_date
    - course_rating

Each row represents a course completed by a user with a rating from 1 to 5.
Each user can complete each course only once.

A user is considered a top-performing student if:
    - they completed at least 5 courses, and
    - their average course rating is at least 4.

For each top-performing student:
    - order their completed courses by completion_date
    - identify all consecutive course pairs (Course A → Course B)

For all such users, count how many times each course pair occurs.

Return a result table with:
    - first_course
    - second_course
    - transition_count

Order the result by:
    - transition_count DESC
    - first_course ASC
    - second_course ASC

Дана таблица course_completions:
    - user_id
    - course_id
    - course_name
    - completion_date
    - course_rating

Каждая строка - это завершённый пользователем курс с оценкой от 1 до 5.
Пользователь может пройти каждый курс только один раз.

Пользователь считается успешным (top-performing), если:
    - он завершил не менее 5 курсов, и
    - его средняя оценка не ниже 4.

Для каждого успешного пользователя:
    - упорядочить курсы по completion_date
    - определить все последовательные пары курсов (Курс A → Курс B)

Для всех таких пользователей посчитать, сколько раз встречается каждая пара курсов.

Вернуть таблицу с колонками:
    - first_course
    - second_course
    - transition_count

Отсортировать результат:
    - по transition_count по убыванию
    - по first_course по возрастанию
    - по second_course по возрастанию

Annetaan taulu course_completions:
    - user_id
    - course_id
    - course_name
    - completion_date
    - course_rating

Jokainen rivi kuvaa käyttäjän suorittamaa kurssia, jolle on annettu arvosana välillä 1–5.
Käyttäjä voi suorittaa jokaisen kurssin vain kerran.

Käyttäjä on huippusuoriutuja (top-performing student), jos:
    - hän on suorittanut vähintään 5 kurssia, ja
    - hänen kurssien keskiarvoarvosanansa on vähintään 4.

Jokaiselle huippusuoriutujalle:
    - järjestä suoritetut kurssit completion_date-kentän mukaan
    - tunnista kaikki peräkkäiset kurssiparit (Kurssi A → Kurssi B)

Laske, kuinka monta kertaa kukin kurssipari esiintyy kaikkien huippusuoriutujien joukossa.

Palauta tulostaulu, jossa on sarakkeet:
    - first_course
    - second_course
    - transition_count

Järjestä tulos:
    - transition_count laskevassa järjestyksessä
    - first_course nousevassa järjestyksessä
    - second_course nousevassa järjestyksessä
*/

WITH top_performing_users AS (
    SELECT user_id
    FROM course_completions
    GROUP BY user_id
    HAVING COUNT(*) >= 5 AND AVG(course_rating) >= 4
),
ordered_course_completions AS (
    SELECT
        course_completions.user_id,
        course_completions.course_name AS first_course,
        LEAD(course_completions.course_name) OVER (
            PARTITION BY course_completions.user_id
            ORDER BY course_completions.completion_date
        ) AS second_course
    FROM course_completions
    JOIN top_performing_users ON course_completions.user_id = top_performing_users.user_id
),
consecutive_course_pairs AS (
    SELECT first_course, second_course
    FROM ordered_course_completions
    WHERE second_course IS NOT NULL
)
SELECT first_course, second_course, COUNT(*) AS transition_count
FROM consecutive_course_pairs
GROUP BY first_course, second_course
ORDER BY transition_count DESC, first_course ASC, second_course ASC;