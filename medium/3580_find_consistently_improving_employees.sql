/*
You are given two tables: employees and performance_reviews.

Find employees who consistently improved over their last 3 performance reviews.

Rules:
    - An employee must have at least 3 reviews;
    - Consider only the 3 most recent reviews;
    - Ratings in these 3 reviews must be strictly increasing;
    - Improvement score = latest rating - earliest rating.

Return: employee_id, name, improvement_score.

Order by:
    - improvement_score DESC;
    - name ASC.

Даны таблицы employees и performance_reviews.

Найти сотрудников, у которых наблюдается устойчивый рост оценки в последних 3 отзывах.

Условия:
    - У сотрудника должно быть не менее 3 отзывов;
    - Учитываются только 3 самых последних отзыва;
    - Оценки должны быть строго возрастающими;
    - Показатель улучшения = последняя оценка - первая оценка.

Вывести: employee_id, name, improvement_score.

Сортировка:
    - improvement_score по убыванию;
    - name по возрастанию.

Etsi työntekijät, joilla on havaittavissa tasainen arvioinnin nousu kolmessa viimeisimmässä palautteessa.

Ehdot:
    - työntekijällä täytyy olla vähintään 3 arviota;
    - huomioon otetaan vain 3 viimeisintä arviota;
    - arvioiden täytyy olla tiukasti nousevia;
    - parannusmittari = viimeisin arvio - ensimmäinen arvio.

Tulosta:
    - employee_id
    - name
    - improvement_score

Järjestä tulos:
    - improvement_score laskevaan järjestykseen;
    - name nousevaan järjestykseen.
*/

WITH reviews_with_row_numbers AS (
    SELECT performance_reviews.employee_id, performance_reviews.review_date, performance_reviews.rating, ROW_NUMBER() OVER (PARTITION BY performance_reviews.employee_id ORDER BY performance_reviews.review_date DESC) AS review_order
    FROM performance_reviews
),
last_three_reviews_per_employee AS (
    SELECT employee_id, rating, review_order
    FROM reviews_with_row_numbers
    WHERE review_order <= 3
),
reviews_with_previous_rating AS (
    SELECT employee_id, rating, review_order, LAG(rating) OVER (PARTITION BY employee_id ORDER BY review_order DESC) AS previous_rating
    FROM last_three_reviews_per_employee
),
review_improvement_check AS (
    SELECT employee_id, MIN(rating) AS earliest_rating, MAX(rating) AS latest_rating, COUNT(*) AS review_count,
        SUM(
            CASE
                WHEN previous_rating IS NOT NULL
                     AND rating <= previous_rating
                THEN 1
                ELSE 0
            END
        ) AS non_increasing_steps
    FROM reviews_with_previous_rating
    GROUP BY employee_id
)
SELECT employees.employee_id, employees.name, review_improvement_check.latest_rating - review_improvement_check.earliest_rating AS improvement_score
FROM review_improvement_check
JOIN employees ON employees.employee_id = review_improvement_check.employee_id
WHERE review_improvement_check.review_count = 3 AND review_improvement_check.non_increasing_steps = 0 AND review_improvement_check.latest_rating > review_improvement_check.earliest_rating
ORDER BY improvement_score DESC, employees.name ASC;