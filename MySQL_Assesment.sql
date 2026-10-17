-- MySQL Assignment

CREATE DATABASE IF NOT EXISTS mysql_assignment;
USE mysql_assignment;
-- ==================== BANKING SCENARIO ====================
CREATE TABLE bank_customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50)
);
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES bank_customers(customer_id)
);
INSERT INTO bank_customers (name, city) VALUES
('Janani','Chennai'), ('Arun','Coimbatore'), ('Priya','Madurai'), ('Karthik','Salem');
INSERT INTO accounts (customer_id, account_type, balance) VALUES
(1,'Savings',50000), (1,'Current',20000), (2,'Savings',30000),
(3,'Savings',15000), (4,'Current',40000);

-- ==================== RAILWAY SCENARIO ====================
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
('Express1','Chennai','Madurai'), ('Express2','Coimbatore','Salem'), ('Express3','Madurai','Chennai');
INSERT INTO bookings (train_id, passenger_name, fare, status) VALUES
(1,'Janani',500,'Confirmed'), (1,'Arun',500,'Waiting'), (2,'Priya',300,'Confirmed'),
(3,'Karthik',450,'Cancelled'), (2,'Meena',300,'Confirmed');

-- ==================== EMPLOYEE MANAGEMENT ====================
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    joining_date DATE
);
INSERT INTO Employee VALUES
(101,'John','IT',60000,'Chennai','2022-01-15'),
(102,'David','HR',45000,'Bangalore','2021-03-10'),
(103,'Smith','IT',70000,'Chennai','2020-07-12'),
(104,'Mary','Finance',55000,'Mumbai','2023-01-20'),
(105,'James','HR',48000,'Delhi','2022-05-05'),
(106,'Linda','Finance',65000,'Mumbai','2021-08-18');

-- ==================== CUSTOMERS & ORDERS ====================

CREATE TABLE order_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES order_customers(customer_id)
);

INSERT INTO order_customers VALUES
(1,'Ananya','Chennai'), (2,'Bharath','Bangalore'), (3,'Charan','Mysore'),
(4,'Divya','Chennai'), (5,'Esha','Hyderabad'), (6,'Farhan','Pune');
INSERT INTO Orders VALUES
(1001,1,2500,'2025-01-10'), (1002,1,3200,'2025-02-11'), (1003,1,1800,'2025-03-12'), (1004,1,4000,'2025-04-13'),
(1005,2,1500,'2025-01-15'), (1006,2,2800,'2025-02-16'), (1007,2,3100,'2025-03-17'),
(1008,3,6000,'2025-01-20'), (1009,3,4500,'2025-02-21'), (1010,3,1200,'2025-03-22'),
(1011,4,7500,'2025-01-25'), (1012,4,2200,'2025-02-26'),
(1013,5,900,'2025-02-01'), (1014,5,2100,'2025-03-02'), (1015,5,3400,'2025-04-03'),
(1016,6,5200,'2025-04-05');

-- ==================== STUDENTS ====================
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);

INSERT INTO Students VALUES
(1,'Asha','IT',88), (2,'Bala','IT',76), (3,'Chitra','IT',95), (4,'Deepak','IT',67), (5,'Evan','IT',82), (6,'Farah','IT',91),
(7,'Gita','HR',72), (8,'Hari','HR',81), (9,'Isha','HR',78), (10,'Jay','HR',69), (11,'Kiran','HR',85), (12,'Leela','HR',93),
(13,'Manoj','Finance',90), (14,'Nisha','Finance',74), (15,'Om','Finance',88), (16,'Pooja','Finance',79),
(17,'Rahul','Marketing',65), (18,'Sara','Marketing',73), (19,'Tarun','Marketing',84), (20,'Uma','Marketing',92), (21,'Vijay','Marketing',77), (22,'Zoya','Marketing',86);

-- ============================================================
-- BANKING QUESTIONS 1-40
-- ============================================================
USE mysql_assignment;

-- 1. Accounts with balance > 20000
SELECT * FROM accounts WHERE balance > 20000;

-- 2. Customers who live in Chennai
SELECT * FROM bank_customers WHERE city = 'Chennai';

-- 3. Accounts with balance between 20000 and 50000
SELECT * FROM accounts WHERE balance BETWEEN 20000 AND 50000;

-- 4. Customers whose names start with J
SELECT * FROM bank_customers WHERE name LIKE 'J%';

-- 5. Accounts of type Savings or Current
SELECT * FROM accounts WHERE account_type IN ('Savings','Current');

-- 6. Accounts that are not Savings
SELECT * FROM accounts WHERE account_type <> 'Savings';

-- 7. Customers whose names contain the letter a
SELECT * FROM bank_customers WHERE name LIKE '%a%';

-- 8. Accounts with balance <= 30000
SELECT * FROM accounts WHERE balance <= 30000;

-- 9. Customers not from Madurai
SELECT * FROM bank_customers WHERE city <> 'Madurai';

-- 10. Accounts whose balance is not between 10000 and 40000
SELECT * FROM accounts WHERE balance NOT BETWEEN 10000 AND 40000;

-- 11. Customers whose names end with i
SELECT * FROM bank_customers WHERE name LIKE '%i';

-- 12. Accounts with balance = 50000
SELECT * FROM accounts WHERE balance = 50000;

-- 13. Customers from Chennai or Salem
SELECT * FROM bank_customers WHERE city IN ('Chennai','Salem');

-- 14. Accounts with balance > 10000 and < 40000
SELECT * FROM accounts WHERE balance > 10000 AND balance < 40000;

-- 15. Accounts whose type is not Current
SELECT * FROM accounts WHERE account_type NOT IN ('Current');

-- 16. Accounts sorted by balance descending
SELECT * FROM accounts ORDER BY balance DESC;

-- 17. Customers sorted alphabetically by name
SELECT * FROM bank_customers ORDER BY name ASC;

-- 18. Sort by account type, then balance descending
SELECT * FROM accounts ORDER BY account_type ASC, balance DESC;

-- 19. Total balance of all accounts
SELECT SUM(balance) AS total_balance FROM accounts;

-- 20. Average account balance
SELECT AVG(balance) AS average_balance FROM accounts;

-- 21. Maximum account balance
SELECT MAX(balance) AS maximum_balance FROM accounts;

-- 22. Minimum account balance
SELECT MIN(balance) AS minimum_balance FROM accounts;

-- 23. Total number of customers
SELECT COUNT(*) AS total_customers FROM bank_customers;

-- 24. Total balance grouped by account type
SELECT account_type, SUM(balance) AS total_balance FROM accounts GROUP BY account_type;

-- 25. Average balance for each account type
SELECT account_type, AVG(balance) AS average_balance FROM accounts GROUP BY account_type;

-- 26. Account types with average balance > 20000
SELECT account_type, AVG(balance) AS average_balance
FROM accounts GROUP BY account_type HAVING AVG(balance) > 20000;

-- 27. Number of accounts for each customer
SELECT customer_id, COUNT(*) AS account_count FROM accounts GROUP BY customer_id;

-- 28. Customers having more than one account
SELECT c.customer_id, c.name, COUNT(a.account_id) AS account_count
FROM bank_customers c JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name HAVING COUNT(a.account_id) > 1;

-- 29. Customer names with account balances
SELECT c.name, a.balance FROM bank_customers c JOIN accounts a ON c.customer_id = a.customer_id;

-- 30. All customers and their accounts, including customers without accounts
SELECT c.name, a.account_id, a.account_type, a.balance
FROM bank_customers c LEFT JOIN accounts a ON c.customer_id = a.customer_id;

-- 31. All accounts and corresponding customer details
SELECT a.*, c.name, c.city
FROM accounts a LEFT JOIN bank_customers c ON a.customer_id = c.customer_id;

-- 32. Customer names and account types where balance > 20000
SELECT c.name, a.account_type, a.balance
FROM bank_customers c JOIN accounts a ON c.customer_id = a.customer_id
WHERE a.balance > 20000;

-- 33. Customers with their total balance
SELECT c.customer_id, c.name, COALESCE(SUM(a.balance),0) AS total_balance
FROM bank_customers c LEFT JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name;

-- 34. Customer names and balances sorted by balance
SELECT c.name, a.balance
FROM bank_customers c JOIN accounts a ON c.customer_id = a.customer_id
ORDER BY a.balance ASC;

-- 35. Number of accounts for each city
SELECT c.city, COUNT(a.account_id) AS account_count
FROM bank_customers c LEFT JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.city;

-- 36. Accounts with balance greater than average balance
SELECT * FROM accounts WHERE balance > (SELECT AVG(balance) FROM accounts);

-- 37. Customers who have accounts
SELECT * FROM bank_customers c
WHERE EXISTS (SELECT 1 FROM accounts a WHERE a.customer_id = c.customer_id);

-- 38. Customers who do not have accounts
SELECT * FROM bank_customers c
WHERE NOT EXISTS (SELECT 1 FROM accounts a WHERE a.customer_id = c.customer_id);

-- 39. Account(s) with maximum balance
SELECT * FROM accounts WHERE balance = (SELECT MAX(balance) FROM accounts);

-- 40. Customers whose total balance > 40000
SELECT c.customer_id, c.name, SUM(a.balance) AS total_balance
FROM bank_customers c JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name HAVING SUM(a.balance) > 40000;

-- ============================================================
-- RAILWAY QUESTIONS 41-50
-- ============================================================

-- 41. Bookings with fare > 400
SELECT * FROM bookings WHERE fare > 400;

-- 42. Bookings whose status is not Confirmed
SELECT * FROM bookings WHERE status <> 'Confirmed';

-- 43. Trains starting from Chennai
SELECT * FROM trains WHERE source = 'Chennai';

-- 44. Bookings with fare between 300 and 500
SELECT * FROM bookings WHERE fare BETWEEN 300 AND 500;

-- 45. Passengers whose names start with A
SELECT * FROM bookings WHERE passenger_name LIKE 'A%';

-- 46. Train names with passenger names
SELECT t.train_name, b.passenger_name
FROM trains t JOIN bookings b ON t.train_id = b.train_id;

-- 47. Number of bookings for each train
SELECT t.train_name, COUNT(b.booking_id) AS booking_count
FROM trains t LEFT JOIN bookings b ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name;

-- 48. Train names and total fare collected for each train (confirmed bookings only)
SELECT t.train_name,
       COALESCE(SUM(CASE WHEN b.status = 'Confirmed' THEN b.fare ELSE 0 END),0) AS total_fare_collected
FROM trains t LEFT JOIN bookings b ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name;

-- 49. Booking(s) with the highest fare
SELECT * FROM bookings WHERE fare = (SELECT MAX(fare) FROM bookings);

-- 50. Trains with more than one booking
SELECT t.train_id, t.train_name, COUNT(b.booking_id) AS booking_count
FROM trains t JOIN bookings b ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name HAVING COUNT(b.booking_id) > 1;

-- ============================================================
-- EMPLOYEE QUESTIONS 51-65
-- ============================================================

-- 51. Total employees in each department
SELECT department, COUNT(*) AS employee_count FROM Employee GROUP BY department;

-- 52. Average salary in each department
SELECT department, AVG(salary) AS average_salary FROM Employee GROUP BY department;

-- 53. Departments having more than one employee
SELECT department, COUNT(*) AS employee_count
FROM Employee GROUP BY department HAVING COUNT(*) > 1;

-- 54. Highest salary in each department
SELECT department, MAX(salary) AS highest_salary FROM Employee GROUP BY department;

-- 55. Lowest salary in each department
SELECT department, MIN(salary) AS lowest_salary FROM Employee GROUP BY department;

-- 56. Departments whose average salary > 50000
SELECT department, AVG(salary) AS average_salary
FROM Employee GROUP BY department HAVING AVG(salary) > 50000;

-- 57. Total salary expenditure for each department
SELECT department, SUM(salary) AS total_salary FROM Employee GROUP BY department;

-- 58. Employees sorted by salary descending
SELECT * FROM Employee ORDER BY salary DESC;

-- 59. Employees sorted by department and salary descending
SELECT * FROM Employee ORDER BY department ASC, salary DESC;

-- 60. Cities with more than one employee
SELECT city, COUNT(*) AS employee_count
FROM Employee GROUP BY city HAVING COUNT(*) > 1;

-- 61. Total salary paid in each city
SELECT city, SUM(salary) AS total_salary FROM Employee GROUP BY city;

-- 62. Departments ordered by total salary expenditure descending
SELECT department, SUM(salary) AS total_salary
FROM Employee GROUP BY department ORDER BY total_salary DESC;

-- 63. Number of employees in each department whose salary > 50000
SELECT department, COUNT(*) AS employee_count
FROM Employee WHERE salary > 50000 GROUP BY department;

-- 64. Difference between highest and lowest salary in each department
SELECT department, MAX(salary) - MIN(salary) AS salary_difference
FROM Employee GROUP BY department;

-- 65. Top 3 highest-paid employees
SELECT * FROM Employee ORDER BY salary DESC LIMIT 3;

-- ============================================================
-- CUSTOMERS & ORDERS QUESTIONS 66-80
-- ============================================================

-- 66. Total order amount for each customer
SELECT c.customer_id, c.customer_name, COALESCE(SUM(o.amount),0) AS total_amount
FROM order_customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 67. Customers who placed more than 3 orders
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS order_count
FROM order_customers c JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name HAVING COUNT(o.order_id) > 3;

-- 68. Average order amount for each customer
SELECT c.customer_id, c.customer_name, AVG(o.amount) AS average_order_amount
FROM order_customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 69. Highest order amount for each customer
SELECT c.customer_id, c.customer_name, MAX(o.amount) AS highest_order_amount
FROM order_customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 70. Customers sorted by total purchase amount descending
SELECT c.customer_id, c.customer_name, COALESCE(SUM(o.amount),0) AS total_purchase
FROM order_customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name ORDER BY total_purchase DESC;

-- 71. Customers whose total purchase amount > 10000
SELECT c.customer_id, c.customer_name, SUM(o.amount) AS total_purchase
FROM order_customers c JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name HAVING SUM(o.amount) > 10000;

-- 72. Customer names and total number of orders
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM order_customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 73. Customer(s) who spent the highest total amount
SELECT totals.customer_id, totals.customer_name, totals.total_purchase
FROM (
    SELECT c.customer_id, c.customer_name, SUM(o.amount) AS total_purchase
    FROM order_customers c JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
) AS totals
WHERE totals.total_purchase = (
    SELECT MAX(customer_total) FROM (
        SELECT SUM(amount) AS customer_total FROM Orders GROUP BY customer_id
    ) AS all_totals
);

-- 74. Customer(s) who placed the maximum number of orders
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS order_count
FROM order_customers c JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) = (
    SELECT MAX(order_count) FROM (
        SELECT COUNT(*) AS order_count FROM Orders GROUP BY customer_id
    ) AS counts_by_customer
);

-- 75. Customers whose average order amount > 2000
SELECT c.customer_id, c.customer_name, AVG(o.amount) AS average_order_amount
FROM order_customers c JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name HAVING AVG(o.amount) > 2000;

-- 76. Top 5 customers by total purchase amount
SELECT c.customer_id, c.customer_name, SUM(o.amount) AS total_purchase
FROM order_customers c JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name ORDER BY total_purchase DESC LIMIT 5;

-- 77. Minimum order amount for each customer
SELECT c.customer_id, c.customer_name, MIN(o.amount) AS minimum_order_amount
FROM order_customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 78. Customers whose total orders amount > 5000
SELECT c.customer_id, c.customer_name, SUM(o.amount) AS total_purchase
FROM order_customers c JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name HAVING SUM(o.amount) > 5000;

-- 79. Customer-wise total orders and total purchase amount
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders,
       COALESCE(SUM(o.amount),0) AS total_purchase
FROM order_customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 80. Customers with > 2 orders and total spending > 8000
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders, SUM(o.amount) AS total_purchase
FROM order_customers c JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 2 AND SUM(o.amount) > 8000;

-- ============================================================
-- STUDENTS QUESTIONS 81-95
-- ============================================================

-- 81. Average marks in each department
SELECT department, AVG(marks) AS average_marks FROM Students GROUP BY department;

-- 82. Departments whose average marks > 75
SELECT department, AVG(marks) AS average_marks
FROM Students GROUP BY department HAVING AVG(marks) > 75;

-- 83. Highest mark in each department
SELECT department, MAX(marks) AS highest_mark FROM Students GROUP BY department;

-- 84. Total number of students in each department
SELECT department, COUNT(*) AS student_count FROM Students GROUP BY department;

-- 85. Departments with more than 5 students
SELECT department, COUNT(*) AS student_count
FROM Students GROUP BY department HAVING COUNT(*) > 5;

-- 86. Departments sorted by average marks descending
SELECT department, AVG(marks) AS average_marks
FROM Students GROUP BY department ORDER BY average_marks DESC;

-- 87. Top 3 departments based on average marks
SELECT department, AVG(marks) AS average_marks
FROM Students GROUP BY department ORDER BY average_marks DESC LIMIT 3;

-- 88. Departments whose average marks are between 70 and 90
SELECT department, AVG(marks) AS average_marks
FROM Students GROUP BY department HAVING AVG(marks) BETWEEN 70 AND 90;

-- 89. Total marks in each department
SELECT department, SUM(marks) AS total_marks FROM Students GROUP BY department;

-- 90. Departments sorted by total number of students
SELECT department, COUNT(*) AS student_count
FROM Students GROUP BY department ORDER BY student_count DESC;

-- 91. Lowest mark in each department
SELECT department, MIN(marks) AS lowest_mark FROM Students GROUP BY department;

-- 92. Departments where the highest mark > 90
SELECT department, MAX(marks) AS highest_mark
FROM Students GROUP BY department HAVING MAX(marks) > 90;

-- 93. Number of students scoring above 80 in each department
SELECT department, COUNT(*) AS students_above_80
FROM Students WHERE marks > 80 GROUP BY department;

-- 94. Departments where more than 3 students scored above 75
SELECT department, COUNT(*) AS students_above_75
FROM Students WHERE marks > 75 GROUP BY department HAVING COUNT(*) > 3;

-- 95. Departments ordered by highest mark descending
SELECT department, MAX(marks) AS highest_mark
FROM Students GROUP BY department ORDER BY highest_mark DESC;
