# Задание 4.2. Простые запросы на SQL
## Постановка задачи
Написать простые запросы на языке SQL, поддержание нормализации отношений.
## Создание таблиц
```sql
CREATE DATABASE IF NOT EXISTS books_db;
USE books_db;

CREATE TABLE Book (
	BookID INT AUTO_INCREMENT PRIMARY KEY,
    Author VARCHAR(255) NOT NULL,
    Title VARCHAR(255) NOT NULL,
    Publisher VARCHAR(255),
    BookYear INT
);

CREATE TABLE BookInLib (
	LibID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    FOREIGN KEY (BookID) REFERENCES Book(BookID) ON DELETE CASCADE
);
```
## Наполнение таблиц данными
```sql
USE books_db;

INSERT INTO Book (Author, Title, Publisher, BookYear) VALUES
('Гоголь Н.В.', 'Мертвые души', 'Азбука', 1998),
('Гоголь Н.В.', 'Ревизор', 'Политехника', 2001),
('Пушкин А.С.', 'Капитанская дочка', 'Азбука', 1995),
('Толстой Л.Н.', 'Война и мир', 'Просвещение', 2005),
('Достоевский Ф.М.', 'Преступление и наказание', 'Политехника', 1999),
('Грибоедов А.С.', 'Горе от ума', 'Азбука', 1997);

INSERT INTO BookInLib (BookID) VALUES (1), (2), (3), (4);
```
## Простые запросы
### Запрос 0. Все авторы
```sql
USE books_db;
SELECT Book.Author FROM Book;
```
### Запрос 1. Авторы без повторений
```sql
USE books_db;
SELECT DISTINCT Book.Author FROM Book;

```
### Запрос 2. Авторы в алфавитном порядке
```sql
USE books_db;
SELECT DISTINCT Book.Author FROM Book ORDER BY Book.Author;
```
### Запрос 3. Авторы с сортировкой по ФИО и году
```sql
USE books_db;
SELECT DISTINCT Book.Author, Book.BookYear FROM Book
ORDER BY Book.Author ASC, Book.BookYear DESC;
```
### Запрос 4. Книги от старых к новым
```sql
USE books_db;
SELECT * FROM Book
ORDER BY BookYear ASC, Title ASC;
```
### Запрос 5. Две последние книги
```sql
USE books_db;
SELECT * FROM Book
ORDER BY Book.BookYear DESC
LIMIT 2;
```
### Запрос 6. Половина списка
```sql
USE books_db;
SELECT * FROM Book
ORDER BY BookYear ASC
LIMIT 3;
```
### Запрос 7. Связанные таблицы INNER JOIN
```sql
USE books_db;
SELECT BookInLib.LibID, Book.Author, Book.Title
FROM Book INNER JOIN BookInLib
ON Book.BookID = BookInLib.BookID;
```
### Запрос 8. Связанные таблицы LEFT JOIN
```sql
USE books_db;
SELECT BookInLib.LibID, Book.Author, Book.Title
FROM Book LEFT JOIN BookInLib
ON Book.BookID = BookInLib.BookID;
```
### Запрос 9. Книги с 1997 по 2001
```sql
USE books_db;
SELECT Book.Author, Book.Title, Book.Publisher, Book.BookYear
FROM Book
WHERE Book.BookYear BETWEEN 1997 AND 2001;
```
### Запрос 10. Книги с 1997 по 2001 + IN
```sql
USE books_db;
SELECT Book.Author, Book.Title, Book.Publisher, Book.BookYear
FROM Book
WHERE Book.BookYear BETWEEN 1997 AND 2001 AND Book.Publisher IN ('Азбука', 'Политехника');
```
### Запрос 11. Книги с 1997 по 2001 + OR
```sql
USE books_db;
SELECT Book.Author, Book.Title, Book.Publisher, Book.BookYear
FROM Book
WHERE Book.BookYear BETWEEN 1997 AND 2001 AND (Book.Publisher = 'Азбука' OR Book.Publisher = 'Политехника');
```
### Запрос 12. Авторы + LIKE
```sql
USE books_db;
SELECT Title, Author, Publisher, BookYear
FROM Book
WHERE BookYear > 1999 AND (Author LIKE 'Г%' OR Publisher LIKE '%a')
ORDER BY Title DESC;
```
## REGEXP
```sql
USE books_db;
SELECT *
FROM Book
WHERE Author LIKE 'А%' OR (BookYear = 2000 AND Publisher NOT REGEXP '^[ИП]');
```
Этот запрос ищет в таблице книги, которые подходят под одно из условий:
1. Автор начинается с буквы А
2. Книга выпущена в 2000 году И издатель не начинается на буквы И или П