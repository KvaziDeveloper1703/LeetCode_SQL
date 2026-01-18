/*
You are given a table Patients:
    - patient_id
    - patient_name
    - conditions

Each row contains information about one patient in the hospital.

Write an SQL query to find the patients who have Type I Diabetes, which is identified by any condition code that starts with the prefix DIAB1.

Return the result with the following columns:
    - patient_id
    - patient_name
    - conditions

The result can be returned in any order.

Дана таблица Patients:
    - patient_id
    - patient_name
    - conditions

Каждая строка содержит информацию об одном пациенте в больнице.

Напиши SQL-запрос, который найдёт всех пациентов с сахарным диабетом 1 типа — его обозначает любой код, начинающийся с префикса DIAB1.

Верни результат с колонками:
    - patient_id
    - patient_name
    - conditions

Порядок строк в результате может быть произвольным.

Annetaan taulu Patients:
    - patient_id
    - patient_name
    - conditions

Jokainen rivi sisältää tiedot yhdestä sairaalan potilaasta.

Kirjoita SQL-kysely, joka löytää kaikki potilaat, joilla on tyypin 1 diabetes. Se tunnistetaan kaikista koodeista, jotka alkavat etuliitteellä DIAB1.

Palauta tulos sarakkeilla:
    - patient_id
    - patient_name
    - conditions

Rivien järjestys tuloksessa voi olla mikä tahansa.
*/

SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%' 
   OR conditions LIKE '% DIAB1%' 
   OR conditions LIKE '% DIAB1 %' 
   OR conditions LIKE 'DIAB1 %';