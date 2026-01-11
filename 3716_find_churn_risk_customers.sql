/*
You are given the table subscription_events.
Find churn risk customers.

A user is churn risk if ALL conditions are met:
    - Currently active - their last event is not cancel;
    - Has at least one downgrade in their history;
    - Current monthly amount < 50% of their maximum historical monthly amount;
    - Days as subscriber ≥ 60.

Definitions:
    - Current plan and amount → from the latest event;
    - Maximum historical amount → MAX(monthly_amount) over all events;
    - Days as subscriber → last_event_date - first_event_date.

Output columns:
    - user_id
    - current_plan
    - current_monthly_amount
    - max_historical_amount
    - days_as_subscriber

Ordering:
    - By days_as_subscriber descending;
    - Then by user_id ascending.

Дана таблица subscription_events.
Найти пользователей с риском оттока.

Пользователь считается churn risk, если выполняются ВСЕ условия:
    - Подписка активна - последний event_type не cancel;
    - Есть минимум один downgrade в истории;
    - Текущий платёж < 50% от максимального исторического платежа;
    - Срок подписки ≥ 60 дней.

Определения:
    - Текущий тариф и сумма → по последнему событию;
    - Максимальный исторический платёж → MAX(monthly_amount) по всем событиям;
    - Срок подписки → дата последнего события − дата первого события.

Результат должен содержать:
    - user_id
    - current_plan
    - current_monthly_amount
    - max_historical_amount
    - days_as_subscriber

Сортировка:
    - По days_as_subscriber по убыванию;
    - Затем по user_id по возрастанию.
*/

WITH user_subscription_summary AS (
    SELECT user_id, MIN(event_date) AS first_event_date, MAX(event_date) AS last_event_date, MAX(monthly_amount) AS max_historical_amount, SUM(CASE WHEN event_type = 'downgrade' THEN 1 ELSE 0 END) AS downgrade_count
    FROM subscription_events
    GROUP BY user_id
),
last_subscription_event AS (
    SELECT subscription_events.user_id, subscription_events.plan_name AS current_plan, subscription_events.monthly_amount AS current_monthly_amount, subscription_events.event_type AS last_event_type
    FROM subscription_events
    JOIN (
        SELECT user_id, MAX(event_date) AS last_event_date
        FROM subscription_events
        GROUP BY user_id
    ) last_event ON subscription_events.user_id = last_event.user_id AND subscription_events.event_date = last_event.last_event_date
)
SELECT user_subscription_summary.user_id, last_subscription_event.current_plan, last_subscription_event.current_monthly_amount, user_subscription_summary.max_historical_amount, DATEDIFF(user_subscription_summary.last_event_date, user_subscription_summary.first_event_date) AS days_as_subscriber
FROM user_subscription_summary
JOIN last_subscription_event ON user_subscription_summary.user_id = last_subscription_event.user_id
WHERE last_subscription_event.last_event_type <> 'cancel' AND user_subscription_summary.downgrade_count >= 1 AND last_subscription_event.current_monthly_amount < user_subscription_summary.max_historical_amount * 0.5 AND DATEDIFF(user_subscription_summary.last_event_date, user_subscription_summary.first_event_date) >= 60
ORDER BY days_as_subscriber DESC, user_subscription_summary.user_id ASC;