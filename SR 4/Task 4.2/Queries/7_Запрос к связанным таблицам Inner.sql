USE books_db;
SELECT BookInLib.LibID, Book.Author, Book.Title
FROM Book INNER JOIN BookInLib
ON Book.BookID = BookInLib.BookID;