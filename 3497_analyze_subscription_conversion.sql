/*
You are given a table UserActivity with users’ daily activity records.

Find users who converted from a free trial to a paid subscription.

For each such user:
    - Calculate the average daily activity duration during the free trial;
    - Calculate the average daily activity duration during the paid period;
    - Round both averages to 2 decimal places.

Return:
    - user_id
    - trial_avg_duration
    - paid_avg_duration

Order the result by user_id in ascending order.

Дана таблица UserActivity с ежедневной активностью пользователей.

Найдите пользователей, которые перешли с бесплатного пробного периода на платную подписку.

Для каждого такого пользователя:
    - Рассчитайте среднюю дневную активность в период free trial;
    - Рассчитайте среднюю дневную активность в платный период;
    - Округлите оба значения до 2 знаков после запятой.

Выведите:
    - user_id
    - trial_avg_duration
    - paid_avg_duration

Отсортируйте результат по user_id по возрастанию.
*/

WITH aggregated AS (
    SELECT user_id,
        AVG(CASE
                WHEN activity_type = 'free_trial'
                THEN activity_duration
            END) AS trial_avg_duration,
        AVG(CASE
                WHEN activity_type = 'paid'
                THEN activity_duration
            END) AS paid_avg_duration,
        SUM(CASE WHEN activity_type = 'paid' THEN 1 ELSE 0 END) AS paid_days
    FROM UserActivity
    GROUP BY user_id
)
SELECT user_id, ROUND(trial_avg_duration, 2) AS trial_avg_duration, ROUND(paid_avg_duration, 2)  AS paid_avg_duration
FROM aggregated
WHERE paid_days > 0
ORDER BY user_id;