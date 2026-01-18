/*
You are given two tables:
Library_books:
    - book_id
    - title
    - author
    - genre
    - publication_year
    - total_copies

Borrowing_records:
    - record_id
    - book_id
    - borrower_name
    - borrow_date
    - return_date

A book is considered currently borrowed if there exists at least one borrowing record with return_date IS NULL.

Write an SQL query to find all books that: are currently borrowed, and have zero available copies.

For each such book, return:
    - book_id
    - title
    - author
    - genre
    - publication_year
    - current_borrowers

Order the result by:
    - current_borrowers in descending order;
    - title in ascending order.

Даны две таблицы:
Library_books:
    - book_id
    - title
    - author
    - genre
    - publication_year
    - total_copies

Borrowing_records:
    - record_id
    - book_id
    - borrower_name
    - borrow_date
    - return_date

Книга считается в данный момент выданной, если существует хотя бы одна запись с return_date IS NULL.

Напишите SQL-запрос, который находит все книги, которые: в данный момент выданы, и имеют ноль доступных экземпляров.

Для каждой такой книги выведите:
    - book_id
    - title
    - author
    - genre
    - publication_year
    - current_borrowers

Отсортируйте результат:
    - по current_borrowers по убыванию;
    - по title по возрастанию.

Annetaan kaksi taulua:
Library_books:
    - book_id
    - title
    - author
    - genre
    - publication_year
    - total_copies

Borrowing_records:
    - record_id
    - book_id
    - borrower_name
    - borrow_date
    - return_date

Kirjan katsotaan olevan tällä hetkellä lainassa, jos löytyy vähintään yksi rivi, jossa return_date IS NULL.

Kirjoita SQL-kysely, joka löytää kaikki kirjat, jotka:
    - ovat tällä hetkellä lainassa, ja
    - joista ei ole yhtään saatavilla olevaa kappaletta.

Jokaiselle tällaiselle kirjalle tulosta:
    - book_id
    - title
    - author
    - genre
    - publication_year
    - current_borrowers

Järjestä tulos:
    - current_borrowers laskevaan järjestykseen;
    - title nousevaan järjestykseen.
*/

SELECT library_books.book_id, library_books.title, library_books.author, library_books.genre, library_books.publication_year, COUNT(borrowing_records.record_id) AS current_borrowers
FROM library_books
JOIN borrowing_records ON library_books.book_id = borrowing_records.book_id AND borrowing_records.return_date IS NULL
GROUP BY library_books.book_id, library_books.title, library_books.author, library_books.genre, library_books.publication_year, library_books.total_copies
HAVING library_books.total_copies - COUNT(borrowing_records.record_id) = 0
ORDER BY current_borrowers DESC, library_books.title ASC;