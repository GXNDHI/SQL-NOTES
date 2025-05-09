-- SQL stands for Standard Query Language. It is a programming language used to interact
-- with database.It is the standard language for querying , inserting , updating and 
-- managing data stored in relational database.

-- => It simplifies working with large databases
-- => Enables easy and efficient data management
-- => SQL is universal and works with almost all database systems


-- => What is DATABASE ?
-- A database is a collection of data that can be easily accessed digitally.

-- A software to manage database is called DBMS.

-- TYPES OF SQL COMMAND
-- DDL (DATA DEFINITION LANGUAGE)
-- DML (DATA MANUPULATION LANGUAGE)
-- TCL (TRANSACTION CONTROL LANGUAGE)
-- DCL (DATA CONTROL LANGUAGE)
-- DQL (DATA QUERY LANGUAGE)



-- DDL (DATA DEFINITION LANGUAGE)
-- 1.CREATE
-- 2.ALTER
-- 3.DROP
-- 4.TRUNCATE



-- DML (DATA MANUPULATION LANGUAGE)
-- 1.INSERT
-- 2.UPDATE
-- 3.DELETE
-- 4.SELECT



-- TCL (TRANSACTION CONROL LANGUAGE)
-- 1.BEGIN
-- 2.COMMIT
-- 3.ROLLBACK
-- 4.SAVEPOINT



-- DCL (DATA CONTROL LANGUAGE)
-- 1.GRANT
-- 2.REVOKE



-- DQL (DATA QUERY LANGUAGE)
-- 1.SELECT




-- CREATE DATABASE AND TABLE

-- CREATING DATABASE NAMED COMPANY
CREATE DATABASE company;


-- Now after creating the database we will work on it.

-- DELETING THE DATABASE
DROP DATABASE company;



-- CREATING TABLE
create table employee(
	emp_id serial primary key, -- emp_id is col name and serial is data type
	name varchar(50) not null,
	position varchar(50),
	department varchar(50),
	hire_date date,
	salary numeric(10,2)
);


-- DISPLAYING RECORDS IN THE TABLE
select * from employee;


-- INSERTING DATA INTO TABLE
INSERT INTO employee(name, position, department, hire_date, salary)
		VALUES ('Ajit Sharma', 'Data Analyst', 'Data Science', '2022-05-15', 65000.00),
			('Priya Desai','Software Engineer', 'IT', '2021-09-20',75000.00),
			('Rajesh Kumar', 'HR Manager', 'Human Resources', '2019-03-10', 82000.00),
			('Sneha Patel', 'Marketing Specialist', 'Marketing', '2020-11-25', 58000.00),
			('Vikram Singh', 'Sales Executive', 'Sales', '2023-02-12', 62000.00);


-- RENAME COLUMN
alter table employee
rename column column1 to column2;

-- TRUNCATE TABLE (ALL RECORDS WILL BE DELETED)
truncate table employee;

-- TRUNCATE TABLE WHEN USING SERIAL
truncate table employee restart identity;
-- We use restart identity command when we use serial data type in table.Else serial
-- will not start from beginning , it will start from where the last serial no ended.


-- DELETE A PARTICULAR ROW
DELETE FROM employee2
WHERE employee_id=105;


-- DELETE A COLUMN
ALTER TABLE employee2
DROP COLUMN salary;


-- DELETE THE WHOLE TABLE
DROP TABLE IF EXISTS employee2;


-- DELETE THE WHOLE TABLE IF EXISTS
DROP DATABASE IF EXISTS company2;



--                           NUMERIC DATA TYPES 
-- INTEGER => Stores whole number
-- SERIAL => Auto increment integer + primary number
-- BIGINT => Stores large integers
-- NUMERIC(p,s) => Stores decimal/high precision values
-- REAL => Stores single precision floating point values
-- DOUBLE PRECISION => Stores double precision floating point numbers


-- 							CHARACTER DATA TYPES
-- CHAR(n) => It uses fixed length string of n characters
-- VARCHAR(n) => It uses variable length string up to n characters
-- TEXT => Unlimited length string



-- 							DATE AND TIME DATA TYPES
-- DATE => Stores date (YYYY-MM-DD)
-- TIME => Stores time (Hour,min,sec)
-- TIMESTAMP => Stores date and time
-- TIMESTAMPTZ => Stores date and time with timezone info
-- INTERVAL => Stores duration of time


-- 							BOOLEAN DATA TYPE
-- BOOLEAN => Stores true false or null 



-- 							POSTGRE SQL CONSTRAINTS
--  Constraints are rules enforced on data in table to ensure accuracy,consistency
-- and integrity .They define condition that data must meet and are applied to columns
-- and tables during table creation and modification.
-- 1.NOT NULL Constraints
-- 2.UNIQUE Constraints
-- 3.PRIMARY KEY Constraints
-- 4.FOREIGN KEY Constraints
-- 5.CHECK Constraints
-- 6.DEFAULT Constraints
-- 7.EXCLUSION Constraint


-- 							ASSIGNING CONSTRAINTS
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INTEGER CHECK (age >= 18),
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 

-- PRIMARY KEY => Student_id uniquely identifies each student
-- NOT NULL => name cannot be NULL
-- UNIQUE => email must be unique
-- CHECK => age must be 18 yrs or older
-- DEFAULT => registration_date defaults to current_time

-- UPDATE USER
UPDATE users 
SET age=28
WHERE username='Rajesh';

UPDATE users
SET city='Chennai'
WHERE age>=30;

UPDATE users
SET age=31, city='kolkat1a'
WHERE username='Priya';

UPDATE users
SET age=age+1
WHERE email LIKE '%@gmail.com'; 


-- SORTING IN ASCENDING ORDER (ORDER)
SELECT * FROM users ORDER BY user_id ASC;



-- TO RENAME THE USERNAME COLUMN
ALTER TABLE users
RENAME COLUMN username TO full_name;



--To change the age column's data type from INT to SMALLINT

ALTER TABLE users
ALTER COLUMN age TYPE SMALLINT;


-- TO add a NOT NULL CONSTRAINT to city column

ALTER TABLE users
ALTER COLUMN city SET NOT NULL;


-- Adding CHECK constraint to age column
ALTER TABLE users
DROP CONSTRAINT age;


ALTER TABLE users
ADD CONSTRAINT age CHECK(age>=18);

-- inserting data to check constraint of age
INSERT INTO USERS (FULL_NAME,EMAIL, AGE,CITY)
VALUES ('Vinod', 'rajesh@gmail.com',19, 'Mumbai');


-- change the table name
ALTER TABLE users
RENAME TO customers;

-- Drop the table if it already exists
DROP TABLE IF EXISTS employees;
-- Create the employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10, 2) CHECK (salary > 0),
    joining_date DATE NOT NULL,
    age INT CHECK (age >= 18)
);

SELECT * FROM employees;

-- Insert data into employees table
INSERT INTO employees (first_name, last_name, department, salary, joining_date, age) VALUES
('Amit', 'Sharma', 'IT', 60000.00, '2022-05-01', 29),
('Neha', 'Patel', 'HR', 55000.00, '2021-08-15', 32),
('Ravi', 'Kumar', 'Finance', 70000.00, '2020-03-10', 35),
('Anjali', 'Verma', 'IT', 65000.00, '2019-11-22', 28),
('Suresh', 'Reddy', 'Operations', 50000.00, '2023-01-10', 26);

-- Assignment Questions
--Q1: Retrieve all employees’ first_name and their departments.

SELECT FIRST_NAME,
	DEPARTMENT
FROM EMPLOYEES;

--Q2: Update the salary of all employees in the 'IT' department by increasing it by 10%.

UPDATE employees
SET salary=salary + (salary*0.1 )
WHERE department ='IT';


SELECT * FROM employees;
--Q3: Delete all employees who are older than 34 years.

DELETE FROM employees
WHERE age>34;


--Q4: Add a new column `email` to the `employees` table.

ALTER TABLE employees
ADD COLUMN email VARCHAR(100);



--Q5: Rename the `department` column to `dept_name`.
ALTER TABLE employees
RENAME COLUMN department TO dept_name;

SELECT * FROM employees;
--Q6: Retrieve the names of employees who joined after January 1, 2021.

SELECT first_name, last_name, joining_date FROM employees
WHERE joining_date > '2021-01-01';


--Q7: Change the data type of the `salary` column to `INTEGER`.

ALTER TABLE employees 
ALTER COLUMN salary TYPE INTEGER USING salary::INTEGER;

--Q8: List all employees with their age and salary in descending order of salary.

SELECT first_name, age, salary FROM employees 
ORDER BY salary DESC;

--Q9: Insert a new employee with the following details: 
		-- ('Raj', 'Singh', 'Marketing', 60000, '2023-09-15', 30)

INSERT INTO employees(first_name, last_name, dept_name, salary, joining_date, age)
VALUES('Raj', 'Singh', 'Marketing', 60000, '2023-09-15', 30);
		
--Q10: Update age of employee +1 to every employee 

UPDATE employees
SET age=age+1;


-- COPY CSV FILE
COPY
employee2(employee_id, first_name, last_name, email, department, salary, joining_date, age)
FROM 'D:\Course Updates\30 Day Series\SQL\CSV\employee_data.csv'
DELIMITER','
CSV HEADER;


-- TYPES OF OPERATOR IN SQL --

-- 1.ARITHMETIC OPERATOR (+,-,*,/,%)
SELECT first_name, salary, 
		(salary*0.10) AS Bonus
FROM employee2;


--CALCULATE NEW SALARY
SELECT first_name, last_name, salary,
		(salary*12) AS annual_salary,
		(salary*0.05) AS increment_slary,
		(salary + salary*0.05) as new_salary,
		(salary *1.05) AS new_salary2
FROM employee2;

-- 2.COMPARISON OPERATOR (=,!= or  <>,>,<,>=,<=)
-- matches age 30
SELECT * FROM employee2
WHERE age=30;


--matches all except 30
SELECT first_name, age FROM employee2
WHERE age!=30;


-- salary greather than 50000
SELECT first_name, salary FROM employee2
WHERE salary<50000;

-- 3.LOGICAL OPERATOR (AND , OR , NOT)
--USING AND OPERATORS
SELECT * FROM employee2
WHERE age>=60 AND salary >=90000;


--USING OR OPERTORS
SELECT * FROM employee2
WHERE age>=60 OR salary >=100000;

--USING NOT
SELECT * FROM employee2
WHERE NOT (department='IT');

-- 1) Retrieve employees whose salary is between 40,000 and 60,000. - Use BETWEEN Operators

SELECT first_name, last_name, salary 
FROM employee2
WHERE salary BETWEEN 40000 AND 60000;


-- 2) Find employees whose email addresses end with gmail.com - Use LIKE Operators

SELECT first_name, last_name, email 
FROM employee2
WHERE email LIKE '%@gmail.com';


SELECT first_name FROM employee2
WHERE first_name LIKE '%j%';


-- 3) Retrieve employees who belong to either the 'Finance' or 'Marketing' departments-- Use IN Operator

SELECT first_name, last_name, department
FROM employee2
WHERE department IN ('Finance','Marketing', 'IT');


-- 4.BITWISE OPERATOR 
-- 5.SET OPERATOR
DROP TABLE IF EXISTS students_2023;
CREATE TABLE students_2023 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50)
);

INSERT INTO students_2023 (student_id, student_name, course) VALUES
(1, 'Aarav Sharma', 'Computer Science'),
(2, 'Ishita Verma', 'Mechanical Engineering'),
(3, 'Kabir Patel', 'Electronics'),
(4, 'Ananya Desai', 'Civil Engineering'),
(5, 'Rahul Gupta', 'Computer Science');

SELECT * FROM students_2023;


DROP TABLE IF EXISTS students_2024;
CREATE TABLE students_2024 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50)
);

INSERT INTO students_2024 (student_id, student_name, course) VALUES
(3, 'Kabir Patel', 'Electronics'),   -- Same as students_2023
(4, 'Ananya Desai', 'Civil Engineering'), -- Same as students_2023
(6, 'Meera Rao', 'Computer Science'),
(7, 'Vikram Singh', 'Mathematics'),
(8, 'Sanya Kapoor', 'Physics');


SELECT * FROM students_2024;

-- UNION -- Combines results, removes duplicates
SELECT student_name, course 
FROM students_2023
UNION
SELECT student_name, course
FROM students_2024;




-- UNION ALL - Combines results, keeps duplicates
SELECT student_name, course 
FROM students_2023
UNION ALL
SELECT student_name, course
FROM students_2024;


-- INTERSECT - Returns common results in both tables
SELECT student_name, course 
FROM students_2023
INTERSECT
SELECT student_name, course
FROM students_2024;


-- EXCEPT  -- Returns results in the first table but not in the second

SELECT student_name, course 
FROM students_2023
EXCEPT
SELECT student_name, course
FROM students_2024;

-- 6.STRING OPERATOR

SELECT * from products;


-- Get all the categories in Uppercase

SELECT UPPER(category) AS Catergory_Capital
FROM products;

-- Get all the categories in Lowercase

SELECT LOWER(category) AS Catergory_Capital
FROM products;



-- Join Product_name adn category text with hypen.
SELECT CONCAT(product_name,'-',category) As product_details
FROM products;

-- Extract the first 5 characters from product_name
SELECT SUBSTRING(product_name, 1,5) AS short_name
FROM products;

-- Count length
SELECT product_name, LENGTH(product_name) AS COUNT_OF_CHAR
FROM products;


--Remove leading and trailing spaces from string
 SELECT LENGTH(TRIM('  Monitor    ')) AS Trimmed_Text;
 SELECT LENGTH('  Monitor    ') AS Trimmed_Text;


-- Replace the word "phone" with "device" in product names
SELECT REPLACE(product_name, 'phone','device') AS updated
FROM products;


-- Get the first 3 characters from category

SELECT RIGHT(category, 3) AS Catergory_Capital
FROM products;


-- 7.OTHER OPERATOR
-- Find employees where the email column is NULL ( if applicable).

SELECT first_name, last_name, email
FROM employee2
WHERE email IS NULL;


-- List employees sorted by salary in DESCENDING order.

SELECT first_name, last_name, salary
FROM employee2
ORDER BY salary ASC;

-- Retrieve the top 5 highest-paid employees.

SELECT first_name, last_name, salary
FROM employee2
ORDER BY salary DESC
LIMIT 5;

-- Retrieve a list of unique departments

SELECT COUNT (DISTINCT department) AS DEP_UNIQUE_COUNT
FROM employee2;


-- AGGREGATE FUNCTION
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10, 2),
    quantity INT,
    added_date DATE,
    discount_rate NUMERIC(5, 2)
);

INSERT INTO products (product_name, category, price, quantity, added_date, discount_rate) VALUES
('Laptop', 'Electronics', 75000.50, 10, '2024-01-15', 10.00),
('Smartphone', 'Electronics', 45000.99, 25, '2024-02-20', 5.00),
('Headphones', 'Accessories', 1500.75, 50, '2024-03-05', 15.00),
('Office Chair', 'Furniture', 5500.00, 20, '2023-12-01', 20.00),
('Desk', 'Furniture', 8000.00, 15, '2023-11-20', 12.00),
('Monitor', 'Electronics', 12000.00, 8, '2024-01-10', 8.00),
('Printer', 'Electronics', 9500.50, 5, '2024-02-01', 7.50),
('Mouse', 'Accessories', 750.00, 40, '2024-03-18', 10.00),
('Keyboard', 'Accessories', 1250.00, 35, '2024-03-18', 10.00),
('Tablet', 'Electronics', 30000.00, 12, '2024-02-28', 5.00);


SELECT * FROM products;

-- Total Quantity Available of all products
SELECT SUM(quantity) AS total_quantity 
FROM products;

SELECT SUM(quantity) AS quantity_of_ele
FROM products
WHERE category='Electronics' AND price > 20000 ;

-- Total number of products

SELECT COUNT(*) AS total_products
FROM products;

-- count with condition

SELECT COUNT(*) AS total_products
FROM products
WHERE product_name LIKE '%phone%';


-- Average Price of Products
SELECT AVG(price) AS average_price
FROM products;

-- Average Price of Products with condition
SELECT AVG(price) AS average_price
FROM products
WHERE category='Accessories' OR added_date > '2024-02-01';

SELECT * FROM products;


-- Maximum and Minimum price

SELECT MAX(price) AS MAX_PRICE,
		MIN(PRICE) AS MIN_PRICE
FROM products;


-- DATE AND TIME FUNCTION

SELECT * from products;


-- 1. NOW() – Get Current Date and Time

SELECT NOW() AS Current_Datetime;


-- 2. CURRENT_DATE() – Get Current Date
SELECT CURRENT_DATE AS today_date;

SELECT Added_date, Current_Date, (CURRENT_DATE- added_date) AS Days_difference
FROM products;


-- 3. EXTRACT() – Extract Parts of a Date
-- Extract the year, month, and day from the added_date column.

SELECT product_name,
		EXTRACT(YEAR FROM added_date) AS Year_Added,
		EXTRACT(MONTH FROM added_date) AS Month_Added,
		EXTRACT(DAY FROM added_date) AS Day_Added
FROM products;





-- 4. AGE() – Calculate Age Between Dates
-- Calculate the time difference between added_date and today’s date.

SELECT product_name,
	AGE(CURRENT_DATE, added_date) AS Age_since_added
FROM products;
  	

-- 5. TO_CHAR() – Format Dates as Strings
-- Format added_date in a custom format (DD-Mon-YYYY).

SELECT product_name,
	TO_CHAR(added_date, 'MM-DD-YYYY') AS FORMATED_DATE
FROM products;







-- 6. DATE_PART() – Get Specific Date Part
-- Extract the day of the week from added_date.

SELECT product_name, added_date,
		DATE_PART('month', added_date) AS day_of_week
FROM products;



-- 7. DATE_TRUNC() – Truncate Date to Precision
-- Truncate added_date to the start of the month.


SELECT product_name, added_date,
		DATE_TRUNC('week', added_date) AS week_start,
		DATE_PART('isodow', added_date) AS day_of_week
FROM products;


-- 8. INTERVAL – Add or Subtract Time Intervals
-- Add 6 months to the added_date.

SELECT product_name, added_date,
		added_date + INTERVAL '6 months' AS new_date
FROM products;





-- 9. CURRENT_TIME() – Get Current Time
--Retrieve only the current time.

SELECT CURRENT_TIME AS current_time;





-- 10. TO_DATE() – Convert String to Date
-- Convert a string to a date format.

SELECT TO_DATE('28-11-2024', 'DD-MM-YYYY') AS converted_date;


-- CONDITIONAL FUNCTION
SELECT * from products;


/* 1. CASE Function – Categorizing Based on Conditions
 We will categorize products into price ranges:

Expensive if the price is greater than or equal to 50,000.
Moderate if the price is between 10,000 and 49,999.
Affordable if the price is less than 10,000.
*/

SELECT product_name, price,
		CASE
			WHEN price>=50000 THEN 'Expensive'
			WHEN price>=10000 AND price<=49999 THEN 'Moderate'
			ELSE 'Affordable'
		END AS price_category
FROM products;
			

-- COALESCE

SELECT * FROM products;

ALTER TABLE products
DROP COLUMN discount_price;

ALTER TABLE products 
ADD COLUMN discount_price NUMERIC(10,2);



UPDATE products
SET discount_price = NULL
WHERE product_name IN('Laptop','Desk');

UPDATE products
SET discount_price = price*0.9
WHERE product_name NOT IN('Laptop','Desk');


SELECT product_name, price, discount_price 
FROM products;


SELECT product_name, 
		COALESCE(discount_price, price) AS Final_price
FROM products;

-- WINDOW
SELECT * FROM products;


-- Assign a unique row number to each product within the same category.

SELECT product_name, category, price,
		DENSE_RANK() OVER(PARTITION BY category ORDER BY price DESC) AS Ranking
FROM products;


SELECT product_name, category, price,
		sum(price) OVER(PARTITION BY category ORDER BY price ASC) AS Running_Total
FROM products;

-- JOINS
-- Create Employees Table
CREATE TABLE Employees3 (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

-- Insert Data into Employees
INSERT INTO Employees3 (first_name, last_name, department_id)
VALUES
('Rahul', 'Sharma', 101),
('Priya', 'Mehta', 102),
('Ankit', 'Verma', 103),
('Simran', 'Kaur', NULL),
('Aman', 'Singh', 101);

SELECT * FROM employees3;

-- Create Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Insert Data into Departments
INSERT INTO Departments (department_id, department_name)
VALUES
(101, 'Sales'),
(102, 'Marketing'),
(103, 'IT'),
(104, 'HR');


SELECT * FROM Departments;


SELECT e.employee_id, e.first_name, e.last_name, 
		d.department_id, d.department_name 
FROM Employees3 e 
RIGHT JOIN
Departments d
ON e.department_id=d.department_id;





-- Create Employees Table
CREATE TABLE Employees3 (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

-- Insert Data into Employees
INSERT INTO Employees3 (first_name, last_name, department_id)
VALUES
('Rahul', 'Sharma', 101),
('Priya', 'Mehta', 102),
('Ankit', 'Verma', 103),
('Simran', 'Kaur', NULL),
('Aman', 'Singh', 101);

SELECT * FROM employees3;

-- Create Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Insert Data into Departments
INSERT INTO Departments (department_id, department_name)
VALUES
(101, 'Sales'),
(102, 'Marketing'),
(103, 'IT'),
(104, 'HR');


SELECT * FROM Departments;


SELECT e.employee_id, e.first_name, e.last_name, 
		d.department_id, d.department_name 
FROM Employees3 e 
FULL OUTER JOIN    -- YOU CAN CHANGE THE JOIN NAME HERE LIKE :  RIGHT JOIN, LEFT JOIN, INNER JOIN
Departments d
ON e.department_id=d.department_id;


--CROSS JOIN

SELECT e.first_name, e.last_name, d.department_name
FROM Employees3 e 
CROSS JOIN
	Departments d;


-- SELF JOIN



SELECT e1.first_name AS Employee_name1,
	   e2.first_name AS Employee_name2,
	   d.department_name
FROM employees3 e1 JOIN employees3 e2
ON e1.department_id=e2.department_id AND e1.employee_id!=e2.employee_id
JOIN 
departments d
ON	
e1.department_id=d.department_id;






 

