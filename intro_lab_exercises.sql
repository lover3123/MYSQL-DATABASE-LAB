

-- 1. Create and use the database
CREATE DATABASE IF NOT EXISTS University;
USE University;

-- ==========================================
-- PART 1: Table without a Primary Key
-- ==========================================

-- 2. Create the Students table (No Primary Key)
CREATE TABLE Students(
    USN varchar(10), 
    Name varchar(30), 
    Sem int, 
    Dept varchar(10), 
    Address varchar(20)
);

-- 3. Insert data into Students
INSERT INTO Students VALUES('1NT24CS001','Arvinda Joshi',4,'CSE','Bengaluru');

INSERT INTO Students(USN, Name, Sem, Dept, Address) VALUES 
    ('1NT24CS002','Babin Sharma', 4,'CSE','Lucknow'), 
    ('1NT24CS003','Caleb Jonas', 4,'CSE','Bengaluru');

-- 4. Insert duplicate data 
-- (This succeeds because the Students table has no Primary Key to stop duplicates)
INSERT INTO Students VALUES('1NT24CS001','Arvinda Joshi',4,'CSE','Bengaluru');


-- ==========================================
-- PART 2: Table with a Primary Key
-- ==========================================

-- 5. Create the s1 table (With Primary Key)
CREATE TABLE s1(
    USN varchar(10) PRIMARY KEY, 
    Name varchar(30), 
    Sem int
);

-- 6. Insert data into s1
INSERT INTO s1 VALUES('1NT24CS001','Arvinda Joshi',4);

INSERT INTO s1(USN, Name, Sem) VALUES 
    ('1NT24CS002','Babin Sharma',4),
    ('1NT24CS003','Caleb Jonas',4);

-- 7. Attempt to insert duplicate data
-- (If run, this throws ERROR 1062: Duplicate entry '1NT24CS001' for key 's1.PRIMARY')
-- I have commented it out so your script doesn't crash here!
-- INSERT INTO s1 VALUES('1NT24CS001','Arvinda Joshi',4);


-- ==========================================
-- PART 3: Data Manipulation (DELETE, ALTER, DROP)
-- ==========================================

-- 8. Delete a specific row from s1
DELETE FROM s1 WHERE USN='1NT24CS003';

-- 9. Alter s1 to add a new column
ALTER TABLE s1 ADD(dept varchar(10));

-- 10. Delete all rows from Students table without removing the table structure
DELETE FROM Students;

-- 11. Drop the Students table completely (removes the structure and data)
DROP TABLE Students;

-- Save the changes
COMMIT;
