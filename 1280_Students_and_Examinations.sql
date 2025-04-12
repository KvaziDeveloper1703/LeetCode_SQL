/*
There are three tables: "Students", "Subjects", and "Examinations".

The "Students" table contains a list of students with their unique IDs and names. Each row represents one student.
+ student_id – Unique identifier for each student;
+ student_name – Name of the student.

The "Subjects" table contains the names of all subjects available at the school. Each row represents one subject.
+ subject_name – Name of the subject (unique for each subject).

The "Examinations" table records which students have taken exams in which subjects. A student can take the same exam multiple times, and some students may not take any exams at all.
+ student_id – The ID of the student who attended the exam;
+ subject_name – The name of the subject for which the student took the exam.

Write a query that counts how many times each student has attended each subject's exam. If a student has not taken an exam for a subject, the result should show zero.

The result should include all students and all subjects, even if there are no exam records. The output should be sorted by student ID and subject name.

Даны три таблицы: "Students", "Subjects" и "Exams".

Таблица "Students" содержит список учащихся с их уникальными идентификаторами и именами. Каждая строка представляет одного студента.
+ student_id – Уникальный идентификатор студента;
+ student_name – Имя студента.

Таблица "Subjects" содержит названия всех предметов, изучаемых в школе. Каждая строка представляет один предмет.
+ subject_name – Название предмета (уникально для каждого предмета).

Таблица "Exams" фиксирует, какие студенты сдавали экзамены по каким предметам. Один студент может сдавать один и тот же экзамен несколько раз, а некоторые студенты могут не сдавать экзамены вовсе.
+ student_id – Идентификатор студента, который сдавал экзамен;
+ subject_name – Название предмета, по которому студент сдавал экзамен.

Написать запрос, который для каждого студента посчитает, сколько раз он сдавал экзамен по каждому предмету. Если студент не сдавал экзамен, результат должен быть ноль.

Результат должен включать всех студентов и все предметы, даже если у них нет записей об экзаменах. Итоговую таблицу нужно отсортировать по идентификатору студента и названию предмета.
*/

WITH StudentSubjects AS (
    SELECT Students.student_id, Students.student_name, Subjects.subject_name
    FROM Students
    CROSS JOIN Subjects
)

SELECT StudentSubjects.student_id, StudentSubjects.student_name, StudentSubjects.subject_name, COALESCE(COUNT(Examinations.subject_name), 0) AS attended_exams
FROM StudentSubjects
LEFT JOIN Examinations ON StudentSubjects.student_id = Examinations.student_id AND StudentSubjects.subject_name = Examinations.subject_name
GROUP BY StudentSubjects.student_id, StudentSubjects.student_name, StudentSubjects.subject_name
ORDER BY StudentSubjects.student_id, StudentSubjects.subject_name;