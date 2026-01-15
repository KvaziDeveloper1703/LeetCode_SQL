/*
There are three tables:
Students:
    - student_id
    - student_name

Subjects:
    - subject_name

Examinations:
    - student_id
    - subject_name

Write a query that counts how many times each student has attended each subject's exam. If a student has not taken an exam for a subject, the result should show zero.
The result should include all students and all subjects, even if there are no exam records. The output should be sorted by student ID and subject name.

Даны три таблицы:
Таблица Students:
    - student_id
    - student_name

Таблица Subjects:
    - subject_name

Таблица Exams:
    - student_id
    - subject_name

Написать запрос, который для каждого студента посчитает, сколько раз он сдавал экзамен по каждому предмету. Если студент не сдавал экзамен, результат должен быть ноль.
Результат должен включать всех студентов и все предметы, даже если у них нет записей об экзаменах. Итоговую таблицу нужно отсортировать по идентификатору студента и названию предмета.

Annetaan kolme taulua:
Students-taulu:
    - student_id
    - student_name

Subjects-taulu:
    - subject_name

Exams-taulu:
    - student_id
    - subject_name

Kirjoita kysely, joka laskee jokaiselle opiskelijalle, kuinka monta kertaa hän on suorittanut kokeen jokaisessa oppiaineessa. Jos opiskelija ei ole suorittanut koetta, tuloksen tulee olla 0.
Tuloksen tulee sisältää kaikki opiskelijat ja kaikki oppiaineet, vaikka kokeista ei olisi lainkaan merkintöjä.
Lopullinen taulu tulee järjestää opiskelijan tunnisteen ja oppiaineen nimen mukaan.
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