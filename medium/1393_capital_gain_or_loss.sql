/*
You are given table Stocks:
    - stock_name
    - operation (Buy or Sell)
    - operation_day
    - price

For each stock_name, calculate capital_gain_loss = total profit/loss from all transactions:
    - each Buy is money spent;
    - each Sell is money earned.

Return stock_name and capital_gain_loss in any order.

Дана таблица Stocks:
    - stock_name
    - operation (Buy или Sell)
    - operation_day
    - price

Для каждого stock_name посчитай capital_gain_loss = общий итог прибыли/убытка по всем операциям:
    - Buy это трата денег;
    - Sell это получение денег.

Верни stock_name и capital_gain_loss.

Annettu taulukko Stocks, jossa:
    - stock_name
    - operation (Buy tai Sell)
    - operation_day
    - price

Laske jokaiselle stock_name-arvolle capital_gain_loss = kaikkien operaatioiden yhteenlaskettu voitto/tappio:
    - Buy tarkoittaa rahan kulutusta;
    - Sell tarkoittaa rahan saamista.

Palauta stock_name ja capital_gain_loss.
*/

SELECT
    stock_name,
    SUM(
        CASE
            WHEN operation = 'Sell' THEN price
            ELSE -price
        END
    ) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name;