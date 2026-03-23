-- 1. Create and use the database
CREATE DATABASE IF NOT EXISTS Stud_Lib;
USE Stud_Lib;

-- 2. Create the Tables
CREATE TABLE Student (
    Stud_no INTEGER PRIMARY KEY, 
    stud_name VARCHAR(25) NOT NULL
);

CREATE TABLE Membership (
    Mem_no INTEGER PRIMARY KEY, 
    Stud_no INTEGER, 
    FOREIGN KEY (Stud_no) REFERENCES Student(Stud_no)
);

CREATE TABLE Book (
    Book_no INTEGER PRIMARY KEY, 
    Book_name VARCHAR(50) NOT NULL, 
    Author VARCHAR(30) NOT NULL
);

CREATE TABLE Iss_rec (
    Iss_no INTEGER PRIMARY KEY, 
    Iss_date DATE NOT NULL, 
    Mem_no INTEGER, 
    Book_no INTEGER, 
    FOREIGN KEY (Mem_no) REFERENCES Membership(Mem_no), 
    FOREIGN KEY (Book_no) REFERENCES Book(Book_no)
);

-- 3. Insert Data into Student
INSERT INTO Student(Stud_no, Stud_name) VALUES
    (1,'John Doe'), (2,'Jane Smith'), (3,'Michael Johnson'),
    (4,'Emily Brown'), (5,'David Wilson'), (6,'Sarah Lee'),
    (7,'Robert H'), (8,'William Homes'), (9,'John Smith'),
    (10,'Jane Brown');

-- 4. Insert Data into Membership
INSERT INTO Membership(Mem_no, Stud_no) VALUES
    (101,1), (102,2), (103,3), (104,4), (105,5),
    (106,6), (107,7), (108,8), (109,9), (110,10);

-- 5. Insert Data into Book
INSERT INTO Book(Book_no, Book_name, Author) VALUES
    (1001, 'DSA using Java', 'Dr. Albert'), 
    (1002, 'DSA using C++', 'Dr. Jane'),
    (1003, 'Computer Architecture', 'Dr. Jane'), 
    (1004, 'AI Introduction', 'Dr. Abraham'), 
    (1005, 'DBMS Concepts', 'Dr. Henry'),
    (1006, 'UNIX OS', 'Dr. Stuart'),
    (1007, 'Computer Networks', 'Dr. Andrew'),
    (1008, 'Software Engineering', 'Dr. Ian'),
    (1009, 'Digital Logic Design', 'Dr. Morris'),
    (1010, 'Discrete Mathematics', 'Dr. Kenneth');

-- 6. Insert Data into Issue Records
INSERT INTO Iss_rec(Iss_no, Iss_date, Mem_no, Book_no) VALUES
    (151, '2026-01-02', 101, 1001), 
    (152, '2026-01-02', 102, 1002),
    (153, '2026-01-03', 102, 1004), 
    (154, '2026-01-04', 103, 1005),
    (155, '2026-01-05', 104, 1005), 
    (156, '2026-01-06', 106, 1006),
    (157, '2026-01-07', 107, 1007), 
    (158, '2026-01-08', 108, 1008),
    (159, '2026-01-09', 109, 1009), 
    (160, '2026-01-09', 110, 1010);

COMMIT;

-- ==========================================
-- SOLVED EXERCISE QUERIES
-- ==========================================

-- c) List all the student names with their membership numbers
SELECT S.stud_name, M.Mem_no
FROM Student S
JOIN Membership M ON S.Stud_no = M.Stud_no;

-- d) List all the issues for the current date with student and Book names
SELECT S.stud_name, B.Book_name
FROM Iss_rec I
JOIN Membership M ON I.Mem_no = M.Mem_no
JOIN Student S ON M.Stud_no = S.Stud_no
JOIN Book B ON I.Book_no = B.Book_no
WHERE I.Iss_date = CURDATE();

-- e) Give a count of how many books have been bought/issued by each student
SELECT S.stud_name, COUNT(I.Book_no) AS books_issued
FROM Student S
JOIN Membership M ON S.Stud_no = M.Stud_no
LEFT JOIN Iss_rec I ON M.Mem_no = I.Mem_no
GROUP BY S.Stud_no, S.stud_name;

-- f) Give a list of books taken by student with stud_no as 5
-- (Note: Based on the inserted data, Student 5 has not issued any books, so this will return empty)
SELECT B.Book_name
FROM Student S
JOIN Membership M ON S.Stud_no = M.Stud_no
JOIN Iss_rec I ON M.Mem_no = I.Mem_no
JOIN Book B ON I.Book_no = B.Book_no
WHERE S.Stud_no = 5;
