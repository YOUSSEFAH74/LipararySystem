CREATE DATABASE LiprarySystem0;
GO
USE LiprarySystem0;
GO

CREATE TABLE Books(
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Published DATE
);
GO

CREATE TABLE Readers(
    ReaderID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL
);
GO

CREATE TABLE Loans(
    LoanID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT FOREIGN KEY REFERENCES Books(BookID),
    ReaderID INT FOREIGN KEY REFERENCES Readers(ReaderID),
    LoanDate DATE NOT NULL
);
GO

INSERT INTO Books (Title, Author, Published)
VALUES 
('1984', 'George Orwell', '1949-06-08'),
('To Kill a Mockingbird', 'Harper Lee', '1960-07-11'),
('The Great Gatsby', 'F. Scott Fitzgerald', '1925-04-10'),
('Pride and Prejudice', 'Jane Austen', '1813-01-28'),
('Moby Dick', 'Herman Melville', '1851-10-18');
GO

INSERT INTO Readers (Name, Email, Phone)
VALUES 
('Ahmed Ali', 'ahmed@example.com', '123456789'),
('Sara Mohamed', 'sara@example.com', '987654321'),
('Ali Hassan', 'ali@example.com', '555555555'),
('Fatima Noor', 'fatima@example.com', '444444444');
GO

INSERT INTO Loans (BookID, ReaderID, LoanDate)
VALUES 
(1, 1, '2024-10-01'),
(2, 2, '2024-10-02'),
(3, 3, '2024-10-03'), 
(4, 4, '2024-10-04');
GO

SELECT * FROM Books;
SELECT * FROM Readers;
SELECT * FROM Loans;

SELECT 
    B.Title, 
    B.Author, 
    COUNT(L.LoanID) AS NumberOfLoans
FROM 
    Books B
LEFT JOIN 
    Loans L ON B.BookID = L.BookID
GROUP BY 
    B.Title, B.Author;

SELECT 
    B.Title, 
    B.Author
FROM 
    Books B
WHERE 
    B.BookID NOT IN (SELECT BookID FROM Loans);