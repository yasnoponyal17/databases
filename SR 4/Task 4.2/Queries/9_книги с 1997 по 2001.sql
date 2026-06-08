USE books_db;
SELECT Book.Author, Book.Title, Book.Publisher, Book.BookYear
FROM Book
WHERE Book.BookYear BETWEEN 1997 AND 2001;