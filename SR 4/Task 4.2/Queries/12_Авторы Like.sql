USE books_db;
SELECT Title, Author, Publisher, BookYear
FROM Book
WHERE BookYear > 1999 AND (Author LIKE 'Г%' OR Publisher LIKE '%a')
ORDER BY Title DESC;