/*
You are given two tables:
Users:
    - account
    - name

Transactions:
    - trans_id
    - account
    - amount
    - transacted_on

Each account starts with a balance of 0. The account balance is the sum of all amount values for that account.
Return name and balance for users whose balance is greater than 10000. The result can be in any order.

Вам даны две таблицы:
Users:
    - account
    - name

Transactions:
    - trans_id
    - account
    - amount
    - transacted_on

Баланс каждого счёта изначально равен 0. Баланс счёта считается как сумма всех значений amount по этому счёту.
Верните name и balance пользователей, у которых баланс больше 10000. Порядок вывода любой.

Sinulle annetaan kaksi taulukkoa:
Users:
    - account
    - name

Transactions:
    - trans_id
    - account
    - amount
    - transacted_on

Jokaisen tilin alkusaldo on 0. Tilin saldo on kaikkien kyseiseen tiliin liittyvien amount-arvojen summa.
Palauta käyttäjien name ja balance, joiden saldo on suurempi kuin 10000. Tulokset voidaan palauttaa missä tahansa järjestyksessä.
*/

SELECT Users.name, SUM(Transactions.amount) AS balance
FROM Users
JOIN Transactions ON Users.account = Transactions.account
GROUP BY Users.account, Users.name
HAVING SUM(Transactions.amount) > 10000;