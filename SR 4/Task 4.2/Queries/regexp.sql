USE books_db;
SELECT *
FROM Book
WHERE Author LIKE 'А%' OR (BookYear = 2000 AND Publisher NOT REGEXP '^[ИП]');