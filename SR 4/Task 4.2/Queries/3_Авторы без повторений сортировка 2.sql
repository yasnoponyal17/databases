USE books_db;
SELECT DISTINCT Book.Author, Book.BookYear FROM Book
ORDER BY Book.Author ASC, Book.BookYear DESC;