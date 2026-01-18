'''
You are given two tables:
Books:
    - book_id
    - title
    - author
    - genre
    - pages

Reading_sessions:
    - session_id
    - book_id
    - reader_name
    - pages_read
    - session_rating

A book has polarized opinions if it has:
    - at least one rating ≥ 4, and
    - at least one rating ≤ 2.

Consider only books with at least 5 reading sessions.

For each such book:
    - calculate rating_spread = max(session_rating) − min(session_rating);
    - calculate polarization_score = (number of ratings ≤ 2 or ≥ 4) ÷ (total sessions).

Include only books where polarization_score ≥ 0.6.

Return:
    - book_id
    - title
    - author
    - genre
    - pages
    - rating_spread
    - polarization_score

Order the result by:
    - polarization_score descending;
    - title descending.

Даны две таблицы:
Books:
    - book_id
    - title
    - author
    - genre
    - pages

Reading_sessions:
    - session_id
    - book_id
    - reader_name
    - pages_read
    - session_rating

Книга считается имеющей полярные оценки, если:
    - есть хотя бы одна оценка ≥ 4, и
    - есть хотя бы одна оценка ≤ 2.

Рассматривать только книги с минимум 5 сессиями чтения.

Для каждой такой книги:
    - вычислить rating_spread = max(session_rating) − min(session_rating);
    - вычислить polarization_score = (количество оценок ≤ 2 или ≥ 4) ÷ (общее число сессий).

Включать только книги, у которых polarization_score ≥ 0.6.

Вывести:
    - book_id
    - title
    - author
    - genre
    - pages
    - rating_spread
    - polarization_score

Отсортировать результат:
    - по polarization_score по убыванию;
    - по title по убыванию.

Annetaan kaksi taulua:
Books:
    - book_id
    - title
    - author
    - genre
    - pages

Reading_sessions:
    - session_id
    - book_id
    - reader_name
    - pages_read
    - session_rating

Kirjan katsotaan saaneen polarisoituneita arvioita, jos:
    - sillä on vähintään yksi arvio ≥ 4, ja
    - vähintään yksi arvio ≤ 2.

Huomioi vain kirjat, joilla on vähintään 5 lukusessiota.

Jokaiselle tällaiselle kirjalle:
    - laske rating_spread = max(session_rating) − min(session_rating);
    - laske polarization_score = (arvioiden määrä ≤ 2 tai ≥ 4) ÷ (sessioiden kokonaismäärä).

Ota mukaan vain kirjat, joilla polarization_score ≥ 0.6.

Tulosta:
    - book_id
    - title
    - author
    - genre
    - pages
    - rating_spread
    - polarization_score

Järjestä tulos:
    - polarization_score laskevaan järjestykseen;
    - title laskevaan järjestykseen.
'''

SELECT books.book_id, books.title, books.author, books.genre, books.pages,
    MAX(reading_sessions.session_rating) - MIN(reading_sessions.session_rating) AS rating_spread,
    CAST(
        SUM(
            CASE
                WHEN reading_sessions.session_rating >= 4
                     OR reading_sessions.session_rating <= 2
                THEN 1
                ELSE 0
            END
        ) AS DECIMAL(10, 2)
    ) / COUNT(reading_sessions.session_id) AS polarization_score
FROM books
JOIN reading_sessions ON books.book_id = reading_sessions.book_id
GROUP BY books.book_id, books.title, books.author, books.genre, books.pages
HAVING
    COUNT(reading_sessions.session_id) >= 5
    AND MAX(reading_sessions.session_rating) >= 4
    AND MIN(reading_sessions.session_rating) <= 2
    AND (
        CAST(
            SUM(
                CASE
                    WHEN reading_sessions.session_rating >= 4
                         OR reading_sessions.session_rating <= 2
                    THEN 1
                    ELSE 0
                END
            ) AS DECIMAL(10, 2)
        ) / COUNT(reading_sessions.session_id)
    ) >= 0.6
ORDER BY polarization_score DESC, books.title DESC;