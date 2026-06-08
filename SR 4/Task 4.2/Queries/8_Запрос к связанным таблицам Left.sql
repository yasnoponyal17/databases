USE books_db;
SELECT BookInLib.LibID, Book.Author, Book.Title
FROM Book LEFT JOIN BookInLib
ON Book.BookID = BookInLib.BookID;