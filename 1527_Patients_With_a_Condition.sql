/*
You are given a table:
+ Patients:
    + patient_id: unique ID of the patient (primary key);
    + patient_name: name of the patient;
    + conditions: a space-separated string of condition codes (can be empty).

Each row contains information about one patient in the hospital.

Write an SQL query to find the patients who have Type I Diabetes, which is identified by any condition code that starts with the prefix DIAB1.
Return the result with the following columns:
+ patient_id;
+ patient_name;
+ conditions.

The result can be returned in any order.

Дана таблица:
+ Patients:
    + patient_id: уникальный идентификатор пациента (первичный ключ);
    + patient_name: имя пациента;
    + conditions: строка, содержащая коды заболеваний, разделённые пробелами (может быть пустой).

Каждая строка содержит информацию об одном пациенте в больнице.

Напиши SQL-запрос, который найдёт всех пациентов с сахарным диабетом 1 типа — его обозначает любой код, начинающийся с префикса DIAB1.
Верни результат с колонками:
+ patient_id;
+ patient_name;
+ conditions.

Порядок строк в результате может быть произвольным.
*/

SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%' 
   OR conditions LIKE '% DIAB1%' 
   OR conditions LIKE '% DIAB1 %' 
   OR conditions LIKE 'DIAB1 %';