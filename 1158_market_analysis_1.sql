/*
You are given three tables: Users, Orders, and Items.
    + Users contains information about users of an online marketplace;
    + Orders records each transaction, with buyer_id and seller_id linking to Users;
    + Items stores the brand information for each item listed in the marketplace.

Your task is to write a query that, for each user, returns:
    + Their user_id;
    + Their join_date;
    + The number of orders they placed as a buyer in the year 2019.

Return the results in any order.

Даны три таблицы: Users, Orders и Items.
    + Таблица Users содержит информацию о пользователях онлайн-платформы для покупки и продажи товаров;
    + Таблица Orders хранит данные о заказах. В ней buyer_id и seller_id ссылаются на пользователей;
    + Таблица Items содержит информацию о бренде каждого товара.

Твоя задача — написать SQL-запрос, который для каждого пользователя вернёт:
    + user_id;
    + join_date;
    + Количество заказов, которые пользователь сделал как покупатель в 2019 году.

Порядок строк в результате не имеет значения.
*/

SELECT Users.user_id AS buyer_id, Users.join_date, COUNT(Orders.order_id) AS orders_in_2019
FROM Users
LEFT JOIN Orders ON Users.user_id = Orders.buyer_id AND YEAR(Orders.order_date) = 2019
GROUP BY Users.user_id, Users.join_date;