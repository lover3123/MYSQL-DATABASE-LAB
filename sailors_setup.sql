-- Create the new database and use it
CREATE DATABASE IF NOT EXISTS sailor_db;
USE sailor_db;

-- Create the Tables
CREATE TABLE SAILORS( SID INTEGER PRIMARY KEY, SNAME VARCHAR(32), RATING INTEGER, AGE REAL);
CREATE TABLE BOATS( bid integer primary key,bname varchar(32), color varchar(10));
CREATE TABLE RESERVES( SID INT REFERENCES SAILORS(SID), BID INT REFERENCES BOATS(BID), DAY DATE);

-- Insert Data into Sailors
INSERT INTO SAILORS (SID, SNAME, RATING, AGE) 
VALUES 
    (58, 'RUSTY', 10, 35), 
    (64, 'HORATIO', 7, 35),
    (71, 'ZORBA', 10, 16), 
    (85, 'ART', 3, 30),
    (22, 'DUSTIN', 7, 45),
    (29, 'BRUTUS', 1, 33),
    (31, 'LUBBER', 8, 55.5),
    (32, 'ANDY', 8, 25.5),
    (74, 'HORATIO', 9, 35),
    (95, 'BOB', 3, 63.5);

-- Insert Data into Boats
INSERT INTO BOATS (BID, BNAME, COLOR) 
VALUES 
    (101, 'Interlake', 'BLUE'),
    (102, 'Interlake', 'RED'),
    (103, 'Clipper', 'GREEN'),
    (104, 'Marine', 'RED');

-- Insert Data into Reserves
INSERT INTO RESERVES (SID, BID, DAY) 
VALUES 
    (58, 102, '2023-10-10'), 
    (64, 104, '2023-10-11'), 
    (22, 101, '2023-10-12'), 
    (31, 102, '2023-10-13');

-- Example Query 1: Find sailors who reserved a RED boat
SELECT S.SNAME, S.AGE
FROM SAILORS S, RESERVES R, BOATS B
WHERE S.SID = R.SID AND R.BID = B.BID AND B.COLOR = 'RED'
ORDER BY S.AGE;

-- Example Query 2: Find sailors who reserved boat 102
SELECT S.SNAME 
FROM SAILORS S
WHERE S.SID IN (
    SELECT R.SID
    FROM RESERVES R 
    WHERE R.BID = 102
);
