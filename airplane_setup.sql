-- 1. Create and use the database
CREATE DATABASE IF NOT EXISTS airplane;
USE airplane;

-- 2. Create the Tables
CREATE TABLE AIRCRAFT (
    AID INT PRIMARY KEY,
    ANAME VARCHAR(50),
    CRUISINGRANGE INT
);

CREATE TABLE EMPLOYEES (
    EID INT PRIMARY KEY,
    ENAME VARCHAR(50),
    SALARY DECIMAL(10, 2)
);

CREATE TABLE FLIGHTS (
    FLNO INT PRIMARY KEY,
    `FROM` VARCHAR(15),
    FTO VARCHAR(15),
    DISTANCE INT,
    DEPARTS TIME,
    ARRIVES TIME,
    PRICE INT
);

CREATE TABLE CERTIFIED (
    EID INT,
    AID INT,
    PRIMARY KEY (EID, AID),
    FOREIGN KEY (EID) REFERENCES EMPLOYEES (EID),
    FOREIGN KEY (AID) REFERENCES AIRCRAFT(AID)
);

-- 3. Insert Data into AIRCRAFT
INSERT INTO AIRCRAFT (AID, ANAME, CRUISINGRANGE) VALUES
    (101, 'Boeing 747', 8000),
    (102, 'Airbus A320', 3500),
    (103, 'Cessna 172', 800),
    (104, 'Boeing 777', 9500),
    (105, 'Airbus A380', 8200),
    (106, 'Embraer E190', 2400),
    (107, 'Gulfstream G650', 7000),
    (108, 'Bombardier CRJ900', 1500),
    (109, 'Boeing 737 MAX', 3800),
    (110, 'Airbus A350', 9300);

-- 4. Insert Data into EMPLOYEES
INSERT INTO EMPLOYEES (EID, ENAME, SALARY) VALUES
    (101, 'Smith', 125000),
    (102, 'Reed', 85000),
    (103, 'Brown', 42000),
    (104, 'Garcia', 130000),
    (105, 'Chen', 78000),
    (106, 'Desai', 52000),
    (107, 'ONeil', 145000),
    (108, 'Belcher', 46000),
    (109, 'Miller', 91000),
    (110, 'Satoshi', 110000);

-- 5. Insert Data into FLIGHTS (Including the Frankfurt flight)
INSERT INTO FLIGHTS (FLNO, `FROM`, FTO, DISTANCE, DEPARTS, ARRIVES, PRICE) VALUES
    (102, 'BENGALURU', 'DELHI', 1730, '20:15:03', '15:15:15', 8000),
    (103, 'MUMBAI', 'CHENNAI', 1030, '10:00:00', '11:55:00', 4500),
    (104, 'KOLKATA', 'HYDERABAD', 1180, '14:30:00', '16:45:00', 5200),
    (105, 'GOA', 'KOCHI', 530, '08:15:00', '09:30:00', 3100),
    (106, 'JAIPUR', 'LUCKNOW', 440, '18:00:00', '19:15:00', 2800),
    (107, 'AHMEDABAD', 'PUNE', 520, '06:45:00', '08:00:00', 3500),
    (108, 'PATNA', 'RANCHI', 250, '12:00:00', '13:00:00', 2100),
    (109, 'GUWAHATI', 'IMPHAL', 270, '15:20:00', '16:10:00', 1900),
    (110, 'AMRITSAR', 'CHANDIGARH', 230, '09:00:00', '09:50:00', 1500),
    (111, 'INDORE', 'BHOPAL', 190, '21:30:00', '22:15:00', 1200),
    (999, 'BENGALURU', 'FRANKFURT', 7400, '02:00:00', '08:30:00', 50000);

-- 6. Insert Data into CERTIFIED (Including extra certifications for EID 101)
INSERT INTO CERTIFIED (EID, AID) VALUES
    (101, 101), (102, 101), (103, 102), (104, 104), (105, 105),
    (106, 102), (107, 107), (108, 108), (109, 109), (110, 110),
    (101, 102), (101, 103), (101, 104);

-- 7. Query: Find distinct aircraft names for employees making over 8000
SELECT DISTINCT a.ANAME
FROM AIRCRAFT a, CERTIFIED c, EMPLOYEES e
WHERE c.EID = e.EID
AND c.AID = a.AID
AND e.SALARY > 8000;

-- 8. Query: Find employees making less than the cheapest flight from BENGALURU to FRANKFURT
SELECT DISTINCT ENAME
FROM EMPLOYEES
WHERE SALARY < (
    SELECT MIN(PRICE)
    FROM FLIGHTS
    WHERE `FROM` = 'BENGALURU' AND FTO = 'FRANKFURT'
);

-- 9. Query: Find max cruising range for employees certified on more than 3 aircraft
SELECT c.EID, MAX(a.CRUISINGRANGE)
FROM CERTIFIED c, AIRCRAFT a
WHERE c.AID = a.AID
GROUP BY c.EID
HAVING COUNT(*) > 3;

-- 10. Query: Find the second highest salary
SELECT MAX(SALARY) AS 'Second Highest'
FROM EMPLOYEES
WHERE SALARY < (
    SELECT MAX(SALARY)
    FROM EMPLOYEES
);
