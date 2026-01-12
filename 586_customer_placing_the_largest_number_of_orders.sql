/*
You are given a table Orders with information about orders and customers.
Each row represents one order made by a customer. order_number is unique.

Find the customer_number of the customer who has placed the largest number of orders.
It is guaranteed that exactly one customer has more orders than all others.

Дана таблица Orders с информацией о заказах и клиентах.
Каждая строка соответствует одному заказу клиента. order_number — уникальный.

Найдите customer_number клиента, который сделал наибольшее количество заказов.
Гарантируется, что такой клиент единственный.
*/

SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;