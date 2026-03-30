# 🗄️ MySQL Database Management Systems (DBMS) Lab

Welcome to my DBMS Lab repository! This repository contains a collection of SQL scripts, database schemas, and query solutions developed during my Database Management Systems course. 

The purpose of this repository is to demonstrate practical, hands-on experience with relational database design, data manipulation, and complex querying using MySQL.

## 🛠️ Technology Stack
* **Database Engine:** MySQL (Server version: 8.0+)
* **Environment:** Linux (Ubuntu) Terminal / Command Line
* **Language:** SQL (DDL, DML, DQL, DCL, TCL)

---

## 📂 Repository Structure & Lab Experiments

This repository is organized into multiple lab assignments. Each folder/section contains the SQL script (`.sql` file) to create the database, insert sample data, and the queries written to solve the lab questions.

### 1. ⛵ Sailors & Boats Database (`sailor_db`)
A reservation system demonstrating many-to-many relationships.
* **Concepts Covered:** Foreign keys, `INNER JOIN`, Subqueries (`IN`, `ALL`, `ANY`), Aggregate functions (`COUNT`, `AVG`), and `GROUP BY` / `HAVING` clauses.
* **Tables:** `SAILORS`, `BOATS`, `RESERVES`

### 2. 🏢 Employee Management Database (Example - *Update with your actual lab*)
A database to track company departments, employees, and project assignments.
* **Concepts Covered:** Left/Right Outer Joins, String matching (`LIKE`), Date functions, and Triggers.
* **Tables:** `EMPLOYEE`, `DEPARTMENT`, `PROJECT`, `WORKS_ON`

### 3. 📚 Library Information System (Example - *Update with your actual lab*)
A system tracking book lending, members, and due dates.
* **Concepts Covered:** Views, Stored Procedures, and complex specific date filtering.
* **Tables:** `BOOKS`, `MEMBERS`, `BORROWED`, `AUTHORS`

*(Add as many sections here as you have labs in your repository!)*

---

## 🚀 How to Run These Labs Locally

To run any of these lab assignments on your local machine, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/lover3123/MYSQL-DATABASE-LAB.git](https://github.com/lover3123/MYSQL-DATABASE-LAB.git)
   cd MYSQL-DATABASE-LAB
