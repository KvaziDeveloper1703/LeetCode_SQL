/*
You are given a table:
+ Delivery:
    + delivery_id: Unique ID for each delivery;
    + customer_id: ID of the customer;
    + order_date: Date the order was placed;
    + customer_pref_delivery_date: Preferred delivery date by the customer.

An order is considered:
+ Immediate if order_date = customer_pref_delivery_date;
+ Scheduled otherwise.

Each customer has exactly one first order, which is the one with the earliest order_date.
Write an SQL query to calculate the percentage of immediate orders among all first orders, rounded to 2 decimal places.

Дана таблица:
+ Delivery:
    + delivery_id: уникальный идентификатор доставки;
    + customer_id: идентификатор клиента;
    + order_date: дата оформления заказа;
    + customer_pref_delivery_date: желаемая дата доставки.

Заказ считается:
+ Мгновенным, если order_date = customer_pref_delivery_date;
+ Запланированным — в противном случае.

У каждого клиента есть ровно один первый заказ — это заказ с наименьшей датой оформления.
Напиши SQL-запрос, который вычислит процент мгновенных заказов среди первых заказов всех клиентов, округлённый до двух знаков после запятой.
*/

SELECT ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (    SELECT customer_id, MIN(order_date)
                                        FROM Delivery
                                        GROUP BY customer_id
                                );