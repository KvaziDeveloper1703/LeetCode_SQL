/*
You are given a table Scores with students exam results.

A student is considered to have shown improvement in a subject if:
    - The student took exams in the same subject on at least two different dates;
    - The latest score is higher than the first score.

For each such student and subject, return:
    - student_id
    - subject
    - first_score
    - latest_score

Order the result by student_id and subject in ascending order.

Дана таблица Scores с результатами экзаменов студентов.

Студент считается улучшившим результат по предмету, если:
    - Он сдавал экзамен по одному и тому же предмету минимум в две разные даты;
    - Его последний балл выше первого.

Для таких студентов и предметов выведите:
    - student_id
    - subject
    - first_score
    - latest_score

Отсортируйте результат по student_id и subject по возрастанию.

Annetaan taulu Scores, jossa on opiskelijoiden koetulokset.

Opiskelijan katsotaan parantaneen tulostaan aineessa, jos:
    - hän on suorittanut kokeen samassa aineessa vähintään kahtena eri päivänä;
    - hänen viimeisin pistemääränsä on korkeampi kuin ensimmäinen.

Näille opiskelijoille ja aineille tulosta:
    - student_id
    - subject
    - first_score
    - latest_score

Järjestä tulos nousevasti sarakkeiden student_id ja subject mukaan.
*/

WITH ranked_scores AS (
    SELECT
        student_id,
        subject,
        score,
        exam_date,
        ROW_NUMBER() OVER (
            PARTITION BY student_id, subject
            ORDER BY exam_date ASC
        ) AS rn_first,
        ROW_NUMBER() OVER (
            PARTITION BY student_id, subject
            ORDER BY exam_date DESC
        ) AS rn_last
    FROM Scores
),
aggregated AS (
    SELECT
        student_id,
        subject,
        MAX(CASE WHEN rn_first = 1 THEN score END) AS first_score,
        MAX(CASE WHEN rn_last = 1 THEN score END) AS latest_score
    FROM ranked_scores
    GROUP BY student_id, subject
)
SELECT
    student_id,
    subject,
    first_score,
    latest_score
FROM aggregated
WHERE latest_score > first_score
ORDER BY student_id, subject;