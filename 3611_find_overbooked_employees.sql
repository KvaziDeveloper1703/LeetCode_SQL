/*
You are given two tables: employees and meetings.
Each meeting has a date and duration in hours.
Find employees who are meeting-heavy.

Definitions:
    - A work week is Monday to Sunday;
    - Standard work week = 40 hours;
    - An employee is meeting-heavy in a week if total meeting hours in that week > 20 hours;
    - Sum meeting hours per employee per week;
    - Count how many weeks each employee is meeting-heavy.

Include only employees who were meeting-heavy in at least 2 different weeks

Return:
    - employee_id
    - employee_name
    - department
    - meeting_heavy_weeks

Ordering:
    - By meeting_heavy_weeks descending;
    - Then by employee_name ascending.

Даны две таблицы: employees и meetings.
Каждая встреча имеет дату и продолжительность в часах.
Найти сотрудников, которые являются meeting-heavy.

Определения:
    - Рабочая неделя: с понедельника по воскресенье;
    - Стандартная рабочая неделя = 40 часов;
    - Сотрудник считается meeting-heavy, если за неделю он провёл на встречах более 20 часов;
    - Нужно посчитать суммарные часы встреч по каждому сотруднику за каждую неделю;
    - Подсчитать количество таких недель для каждого сотрудника.

Включать только сотрудников, у которых минимум 2 meeting-heavy недели

Результат должен содержать:
    - employee_id
    - employee_name
    - department
    - meeting_heavy_weeks

Сортировка:
    - По meeting_heavy_weeks по убыванию;
    - Затем по employee_name по возрастанию.
*/

WITH weekly_meeting_hours AS (
    SELECT meetings.employee_id, DATE_SUB(meetings.meeting_date, INTERVAL (WEEKDAY(meetings.meeting_date)) DAY) AS week_start_date, SUM(meetings.duration_hours) AS total_meeting_hours
    FROM meetings
    GROUP BY meetings.employee_id, DATE_SUB(meetings.meeting_date, INTERVAL (WEEKDAY(meetings.meeting_date)) DAY)),
meeting_heavy_weeks_per_employee AS (
    SELECT weekly_meeting_hours.employee_id, COUNT(*) AS meeting_heavy_weeks
    FROM weekly_meeting_hours
    WHERE weekly_meeting_hours.total_meeting_hours > 20
    GROUP BY weekly_meeting_hours.employee_id
)
SELECT employees.employee_id, employees.employee_name, employees.department, meeting_heavy_weeks_per_employee.meeting_heavy_weeks
FROM meeting_heavy_weeks_per_employee
JOIN employees ON employees.employee_id = meeting_heavy_weeks_per_employee.employee_id
WHERE meeting_heavy_weeks_per_employee.meeting_heavy_weeks >= 2
ORDER BY meeting_heavy_weeks_per_employee.meeting_heavy_weeks DESC, employees.employee_name ASC;