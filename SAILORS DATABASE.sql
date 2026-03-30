-- ---------------------------------------------------------
-- DBMS Mini-Project: Sailors Database
-- ---------------------------------------------------------

-- Create and use the database
CREATE DATABASE IF NOT EXISTS sailor_db;
USE sailor_db;

-- ---------------------------------------------------------
-- TABLE CREATION
-- ---------------------------------------------------------

CREATE TABLE SAILORS( 
    SID INTEGER PRIMARY KEY, 
    SNAME VARCHAR(32), 
    RATING INTEGER, 
    AGE REAL
);

CREATE TABLE BOATS( 
    BID INTEGER PRIMARY KEY, 
    BNAME VARCHAR(32), 
    COLOR VARCHAR(10)
);

CREATE TABLE RESERVES( 
    SID INT REFERENCES SAILORS(SID), 
    BID INT REFERENCES BOATS(BID), 
    DAY DATE
);

-- ---------------------------------------------------------
-- DATA INSERTION
-- ---------------------------------------------------------

INSERT INTO SAILORS (SID, SNAME, RATING, AGE) VALUES 
(58, 'RUSTY', 10, 35), 
(64, 'HORATIΟ', 7, 35), 
(71, 'ZORBA', 10, 16), 
(85, 'ART', 3, 30), 
(22, 'DUSTIN', 7, 45), 
(29, 'BRUTUS', 1, 33), 
(31, 'LUBBER', 8, 55.5), 
(32, 'ANDY', 8, 25.5), 
(74, 'HORATIΟ', 9, 35), 
(95, 'BOB', 3, 63.5);

INSERT INTO BOATS (BID, BNAME, COLOR) VALUES 
(101, 'Interlake', 'BLUE'), 
(102, 'Interlake', 'RED'), 
(103, 'Clipper', 'GREEN'), 
(104, 'Marine', 'RED');

INSERT INTO RESERVES (SID, BID, DAY) VALUES 
(58, 102, '2023-10-10'), 
(64, 104, '2023-10-11'), 
(22, 101, '2023-10-12'), 
(31, 102, '2023-10-13');

-- ---------------------------------------------------------
-- PROJECT QUERIES
-- ---------------------------------------------------------

-- Query 1: Find the name and age of sailors who have reserved a red boat, ordered by age
SELECT S.SNAME, S.AGE
FROM SAILORS S, RESERVES R, BOATS B
WHERE S.SID = R.SID AND R.BID = B.BID AND B.COLOR = 'RED'
ORDER BY S.AGE;

-- Query 2: Find the names of sailors who have reserved boat 102
SELECT S.SNAME
FROM SAILORS S
WHERE S.SID IN (
    SELECT R.SID
    FROM RESERVES R
    WHERE R.BID = 102
);

-- Query 3: Find the name and age of the youngest sailor
SELECT S.SNAME, S.AGE 
FROM SAILORS S 
WHERE S.AGE <= ALL(SELECT AGE FROM SAILORS);

-- Query 4: Find the average age of sailors for each rating level that has at least two sailors
SELECT S.RATING, AVG(S.AGE) AS AVERAGE_AGE 
FROM SAILORS S 
GROUP BY S.RATING 
HAVING COUNT(*) > 1;

-- Query 5: Find the names of sailors who have reserved at least one boat
SELECT DISTINCT S.SNAME
FROM SAILORS S INNER JOIN RESERVES R ON S.SID = R.SID;

-- Query 6: Find the colors of boats reserved by 'LUBBER'
SELECT B.COLOR 
FROM BOATS B, RESERVES R, SAILORS S 
WHERE B.BID = R.BID AND R.SID = S.SID AND S.SNAME = 'LUBBER';

-- Query 7: Find the names of sailors who have NOT reserved any boat
SELECT SNAME 
FROM SAILORS 
WHERE SID NOT IN (SELECT SID FROM RESERVES);

-- Query 8: Count the total number of different boat names
SELECT COUNT(DISTINCT BNAME) AS UNIQUE_BOAT_NAMES
FROM BOATS;
