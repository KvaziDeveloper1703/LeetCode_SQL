/*
You are given a table Salary with employee information.
The column sex has values 'm' or 'f'.

Swap all values in the sex column:
    - change 'm' to 'f';
    - change 'f' to 'm'.

You must use one UPDATE statement only, without any temporary tables and without using SELECT.

Дана таблица Salary с информацией о сотрудниках.
Столбец sex принимает значения 'm' или 'f'.

Поменяйте местами все значения в столбце sex:
    - 'm' → 'f';
    - 'f' → 'm'.

Необходимо использовать один оператор UPDATE, без временных таблиц и без использования SELECT.
*/

UPDATE Salary
SET sex = CASE
    WHEN sex = 'm' THEN 'f'
    WHEN sex = 'f' THEN 'm'
END;