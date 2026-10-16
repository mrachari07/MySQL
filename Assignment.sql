create database Assignment;
use Assignment;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50)
);
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers (name, city) VALUES
('Mohan', 'Hyderabad'),
('Priya', 'Chennai'),
('Rahul', 'Vizag'),
('Sneha', 'Bengaluru'),
('Vikram', 'Kadapa');

INSERT INTO accounts (customer_id, account_type, balance) VALUES
(1, 'Savings', 25000.00),
(1, 'Current', 85000.00),
(2, 'Savings', 15400.50),
(3, 'Savings', 42000.00),
(3, 'Fixed Deposit', 150000.00),
(4, 'Savings', 9875.25),
(5, 'Current', 63000.00);
CREATE TABLE trains (
    train_id INT PRIMARY KEY AUTO_INCREMENT,
    train_name VARCHAR(50),
    source VARCHAR(50),
    destination VARCHAR(50)
);
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    train_id INT,
    passenger_name VARCHAR(50),
    fare DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (train_id) REFERENCES trains(train_id)
);
INSERT INTO trains (train_name, source, destination) VALUES
('Rajdhani Express', 'Delhi', 'Mumbai'),
('Shatabdi Express', 'Bengaluru', 'Chennai'),
('Duronto Express', 'Kolkata', 'Delhi'),
('Vande Bharat Express', 'Mumbai', 'Ahmedabad'),
('Garib Rath Express', 'Patna', 'Delhi');

INSERT INTO bookings (train_id, passenger_name, fare, status) VALUES
(1, 'Mohan', 2450.00, 'Confirmed'),
(1, 'Priya', 2450.00, 'Waiting'),
(2, 'SaiKiran', 1200.00, 'Confirmed'),
(3, 'Bachi', 1850.50, 'Cancelled'),
(4, 'Vikram', 950.00, 'Confirmed'),
(5, 'Esa', 780.00, 'Waiting');

select*from customers;
select*from accounts;

SELECT * FROM accounts
WHERE balance > 20000;

SELECT * FROM customers
WHERE city = 'Chennai';

SELECT * FROM accounts
WHERE balance BETWEEN 20000 AND 50000;

SELECT * FROM customers
WHERE name LIKE 'J%';

SELECT * FROM accounts
WHERE account_type IN ('Savings', 'Current');

SELECT * FROM accounts
WHERE account_type <> 'Savings';

SELECT * FROM customers
WHERE name LIKE '%a%';

SELECT * FROM accounts
WHERE balance <= 30000;

SELECT * FROM customers
WHERE city <> 'Madurai';

SELECT * FROM accounts
WHERE balance NOT BETWEEN 10000 AND 40000;

SELECT * FROM customers
WHERE name LIKE '%i';

SELECT * FROM accounts
WHERE balance = 50000;

SELECT * FROM customers
WHERE city IN ('Chennai', 'Salem');

SELECT * FROM accounts
WHERE balance > 10000
  AND balance < 40000;

SELECT * FROM accounts
WHERE account_type NOT IN ('Current');

SELECT * FROM accounts
ORDER BY balance DESC;

SELECT SUM(balance) AS total_balance
FROM accounts;

SELECT AVG(balance) AS average_balance
FROM accounts;

SELECT MAX(balance) AS maximum_balance
FROM accounts;

SELECT MIN(balance) AS minimum_balance
FROM accounts;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT account_type, SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type;

SELECT account_type, AVG(balance) AS average_balance
FROM accounts
GROUP BY account_type;

SELECT account_type, AVG(balance) AS average_balance
FROM accounts
GROUP BY account_type
HAVING AVG(balance) > 20000;

SELECT customer_id, COUNT(*) AS number_of_accounts
FROM accounts
GROUP BY customer_id;

SELECT c.customer_id, c.name, COUNT(a.account_id) AS number_of_accounts
FROM customers AS c
JOIN accounts AS a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(a.account_id) > 1;

SELECT c.name, a.balance
FROM customers AS c
JOIN accounts AS a
    ON c.customer_id = a.customer_id;

SELECT c.customer_id, c.name, c.city, a.account_id, a.account_type, a.balance
FROM customers AS c
LEFT JOIN accounts AS a
    ON c.customer_id = a.customer_id;

SELECT * FROM customers
ORDER BY name ASC;

SELECT * FROM accounts
ORDER BY account_type ASC, balance DESC;

SELECT a.account_id, a.account_type, a.balance, c.customer_id, c.name, c.city
FROM accounts AS a
JOIN customers AS c
    ON a.customer_id = c.customer_id;

SELECT c.name, a.account_type
FROM customers AS c
JOIN accounts AS a
    ON c.customer_id = a.customer_id
WHERE a.balance > 20000;

SELECT c.customer_id, c.name, SUM(a.balance) AS total_balance
FROM customers AS c
JOIN accounts AS a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name;

SELECT c.name, a.balance
FROM customers AS c
JOIN accounts AS a
    ON c.customer_id = a.customer_id
ORDER BY a.balance ASC;

SELECT c.city, COUNT(a.account_id) AS number_of_accounts
FROM customers AS c
JOIN accounts AS a
    ON c.customer_id = a.customer_id
GROUP BY c.city;

SELECT *
FROM accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM accounts
);

SELECT DISTINCT c.customer_id, c.name, c.city
FROM customers AS c
JOIN accounts AS a
    ON c.customer_id = a.customer_id;

SELECT c.customer_id, c.name, c.city
FROM customers AS c
LEFT JOIN accounts AS a
    ON c.customer_id = a.customer_id
WHERE a.account_id IS NULL;

SELECT *
FROM accounts
WHERE balance = (
    SELECT MAX(balance)
    FROM accounts
);

SELECT c.customer_id, c.name, SUM(a.balance) AS total_balance
FROM customers AS c
JOIN accounts AS a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
HAVING SUM(a.balance) > 40000;

SELECT *
FROM accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM accounts
);

SELECT DISTINCT c.customer_id, c.name, c.city
FROM customers AS c
JOIN accounts AS a
    ON c.customer_id = a.customer_id;

SELECT c.customer_id, c.name, c.city
FROM customers AS c
LEFT JOIN accounts AS a
    ON c.customer_id = a.customer_id
WHERE a.account_id IS NULL;

SELECT *
FROM accounts
WHERE balance = (
    SELECT MAX(balance)
    FROM accounts
);

SELECT c.customer_id, c.name, SUM(a.balance) AS total_balance
FROM customers AS c
JOIN accounts AS a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
HAVING SUM(a.balance) > 40000;

SELECT *
FROM bookings
WHERE fare > 400;

SELECT *
FROM bookings
WHERE status <> 'Confirmed';

SELECT *
FROM trains
WHERE source = 'Chennai';

SELECT *
FROM bookings
WHERE fare BETWEEN 300 AND 500;

SELECT *
FROM bookings
WHERE passenger_name LIKE 'A%';

SELECT t.train_name, b.passenger_name
FROM trains AS t
JOIN bookings AS b
    ON t.train_id = b.train_id;

SELECT train_id, COUNT(*) AS number_of_bookings
FROM bookings
GROUP BY train_id;

SELECT t.train_name, SUM(b.fare) AS total_fare_collected
FROM trains AS t
JOIN bookings AS b
    ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name;

SELECT *
FROM bookings
WHERE fare = (
    SELECT MAX(fare)
    FROM bookings
);

SELECT t.train_id, t.train_name, COUNT(b.booking_id) AS number_of_bookings
FROM trains AS t
JOIN bookings AS b
    ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name
HAVING COUNT(b.booking_id) > 1;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    joining_date DATE
);
CREATE TABLE Customers1 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);

INSERT INTO Employee
(emp_id, emp_name, department, salary, city, joining_date)
VALUES
(101, 'Arun Kumar', 'HR', 35000.00, 'Chennai', '2022-06-15'),
(102, 'Priya Sharma', 'Finance', 48000.00, 'Bengaluru', '2021-03-10'),
(103, 'Rahul Verma', 'IT', 60000.00, 'Hyderabad', '2020-11-05'),
(104, 'Sneha Reddy', 'IT', 55000.00, 'Chennai', '2023-01-20'),
(105, 'Vikram Singh', 'Sales', 42000.00, 'Mumbai', '2022-09-12');

INSERT INTO Customers1
(customer_id, customer_name, city)
VALUES
(1, 'Mohan', 'Hyderabad'),
(2, 'Priya', 'Chennai'),
(3, 'Rahul', 'Vizag'),
(4, 'Sneha', 'Bengaluru'),
(5, 'Vikram', 'Kadapa');

INSERT INTO orders
(order_id, customer_id, amount, order_date)
VALUES
(1001, 1, 1250.00, '2026-01-10'),
(1002, 2, 2500.50, '2026-01-15'),
(1003, 3, 800.00, '2026-02-02'),
(1004, 1, 1750.25, '2026-02-10'),
(1005, 4, 3200.00, '2026-03-05'),
(1006, 5, 950.00, '2026-03-12');

INSERT INTO students
(student_id, student_name, department, marks)
VALUES
(1, 'Ananya', 'Computer Science', 92),
(2, 'Bharath', 'Mechanical', 78),
(3, 'Charan', 'Computer Science', 85),
(4, 'Divya', 'Electronics', 88),
(5, 'Esha', 'Mechanical', 70);

SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department;

SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department;

SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department
HAVING COUNT(*) > 1;

SELECT department, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department;

SELECT department, MIN(salary) AS lowest_salary
FROM Employee
GROUP BY department;

SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department
HAVING AVG(salary) > 50000;

SELECT department, SUM(salary) AS total_salary_expenditure
FROM Employee
GROUP BY department;

SELECT *
FROM Employee
ORDER BY salary DESC;

SELECT *
FROM Employee
ORDER BY department ASC, salary DESC;

SELECT city, COUNT(*) AS total_employees
FROM Employee
GROUP BY city
HAVING COUNT(*) > 1;

SELECT city, SUM(salary) AS total_salary
FROM Employee
GROUP BY city;

SELECT department, SUM(salary) AS total_salary_expenditure
FROM Employee
GROUP BY department
ORDER BY total_salary_expenditure DESC;

SELECT department, COUNT(*) AS total_employees
FROM Employee
WHERE salary > 50000
GROUP BY department;

SELECT department, MAX(salary) - MIN(salary) AS salary_difference
FROM Employee
GROUP BY department;

SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 3;

SELECT department, AVG(marks) AS average_marks
FROM students
GROUP BY department;

SELECT department, AVG(marks) AS average_marks
FROM students
GROUP BY department
HAVING AVG(marks) > 75;

SELECT department, MAX(marks) AS highest_mark
FROM students
GROUP BY department;

SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department;

SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department
HAVING COUNT(*) > 5;

SELECT department, AVG(marks) AS average_marks
FROM students
GROUP BY department
ORDER BY average_marks DESC;

SELECT department, AVG(marks) AS average_marks
FROM students
GROUP BY department
ORDER BY average_marks DESC
LIMIT 3;

SELECT department, AVG(marks) AS average_marks
FROM students
GROUP BY department
HAVING AVG(marks) BETWEEN 70 AND 90;

SELECT department, SUM(marks) AS total_marks
FROM students
GROUP BY department;

SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department
ORDER BY total_students DESC;

SELECT department, MIN(marks) AS lowest_mark
FROM students
GROUP BY department;

SELECT department, MAX(marks) AS highest_mark
FROM students
GROUP BY department
HAVING MAX(marks) > 90;

SELECT department, COUNT(*) AS students_above_80
FROM students
WHERE marks > 80
GROUP BY department;

SELECT department, COUNT(*) AS students_above_75
FROM students
WHERE marks > 75
GROUP BY department
HAVING COUNT(*) > 3;

SELECT department, MAX(marks) AS highest_mark
FROM students
GROUP BY department
ORDER BY highest_mark DESC;

