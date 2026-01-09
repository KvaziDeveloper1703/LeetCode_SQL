/*
You are given two tables: patients and covid_tests.

Find patients who recovered from COVID.

Rules:
    - A patient must have at least one Positive test;
    - After that Positive test, the patient must have at least one Negative test on a later date;
    - Ignore tests with result Inconclusive;
    - Recovery time = days between:
        - the first Positive test;
        - the first Negative test after that Positive test.

Return: patient_id, patient_name, age, recovery_time.

Order by:
    - recovery_time ASC;
    - patient_name ASC.

Даны таблицы patients и covid_tests.

Найти пациентов, которые выздоровели от COVID.

Условия:
    - У пациента должен быть хотя бы один положительный тест;
    - После этого теста должен быть хотя бы один отрицательный тест на более позднюю дату;
    - Тесты со статусом Inconclusive не учитывать;
    - Время выздоровления = количество дней между:
        - первым положительным тестом;
        - первым отрицательным тестом после него.

Вывести: patient_id, patient_name, age, recovery_time.

Сортировка:
    - recovery_time по возрастанию;
    - patient_name по возрастанию.
*/

WITH first_positive_test AS (
    SELECT patient_id, MIN(test_date) AS first_positive_date
    FROM covid_tests
    WHERE result = 'Positive'
    GROUP BY patient_id
),
first_negative_after_positive AS (
    SELECT covid_tests.patient_id, MIN(covid_tests.test_date) AS first_negative_date
    FROM covid_tests
    JOIN first_positive_test ON covid_tests.patient_id = first_positive_test.patient_id
    WHERE covid_tests.result = 'Negative' AND covid_tests.test_date > first_positive_test.first_positive_date
    GROUP BY covid_tests.patient_id
)
SELECT patients.patient_id, patients.patient_name, patients.age, DATEDIFF(first_negative_after_positive.first_negative_date, first_positive_test.first_positive_date) AS recovery_time
FROM first_positive_test
JOIN first_negative_after_positive ON first_positive_test.patient_id = first_negative_after_positive.patient_id
JOIN patients ON patients.patient_id = first_positive_test.patient_id
ORDER BY recovery_time ASC, patients.patient_name ASC;