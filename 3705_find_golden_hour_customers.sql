/*
You are given the table restaurant_orders.
Find golden hour customers.

Peak hours:
    - 11:00-14:00;
    - 18:00-21:00.

A customer is golden hour if ALL conditions are met:
    - Made at least 3 orders;
    - At least 60% of orders were made during peak hours;
    - Rated at least 50% of their orders;
    - Average rating ≥ 4.0, calculated using only rated orders.

Output columns:
    - customer_id
    - total_orders
    - peak_hour_percentage
    - average_rating

Ordering:
    - By average_rating descending;
    - Then by customer_id descending.

Дана таблица restaurant_orders.
Найти golden hour клиентов.

Часы пик:
    - 11:00-14:00;
    - 18:00-21:00.

Клиент считается golden hour, если выполняются ВСЕ условия:
    - Сделал минимум 3 заказа.
    - Не менее 60% заказов сделаны в часы пик.
    - Оценено минимум 50% заказов.
    - Средняя оценка ≥ 4.0, считается только по оценённым заказам.

Результат должен содержать:
    - customer_id
    - total_orders
    - peak_hour_percentage
    - average_rating

Сортировка:
    - По average_rating по убыванию;
    - Затем по customer_id по убыванию.
*/

SELECT customer_id, COUNT(*) AS total_orders, ROUND(100 * SUM(CASE WHEN ((TIME(order_timestamp) BETWEEN '11:00:00' AND '13:59:59') OR (TIME(order_timestamp) BETWEEN '18:00:00' AND '20:59:59')) THEN 1 ELSE 0 END) / COUNT(*), 0) AS peak_hour_percentage, ROUND(AVG(order_rating), 2) AS average_rating
FROM restaurant_orders
GROUP BY customer_id
HAVING COUNT(*) >= 3 AND SUM(CASE WHEN ((TIME(order_timestamp) BETWEEN '11:00:00' AND '13:59:59') OR (TIME(order_timestamp) BETWEEN '18:00:00' AND '20:59:59')) THEN 1 ELSE 0 END) / COUNT(*) >= 0.6 AND COUNT(order_rating) / COUNT(*) >= 0.5 AND AVG(order_rating) >= 4.0
ORDER BY average_rating DESC, customer_id DESC;