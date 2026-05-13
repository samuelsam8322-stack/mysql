-- 1. Create a table Employees with constraints:
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) CHECK (salary > 15000),
    dept VARCHAR(50) DEFAULT 'IT'
);


-- 2. Create a table Students where:
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    age INT CHECK (age BETWEEN 18 AND 30),
    course VARCHAR(100) NOT NULL
);


-- 3. Create a table Orders with:
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


-- 4. Add a CHECK constraint to Products table so price must be greater than 0.
ALTER TABLE Products
ADD CONSTRAINT chk_price
CHECK (price > 0);


-- 5. Add UNIQUE constraint on phone column in Users table.
ALTER TABLE Users
ADD CONSTRAINT uq_phone
UNIQUE (phone);


-- 6. Insert a record violating UNIQUE constraint and observe the error.
INSERT INTO Users (phone) VALUES ('9876543210');
INSERT INTO Users (phone) VALUES ('9876543210');     # Duplicate



-- 7. Create a table Enrollments using composite PRIMARY KEY
-- (student_id, course_id)
CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id)
);


-- 8. Create a table Payments with:
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_mode VARCHAR(10) CHECK (payment_mode IN ('UPI', 'Card', 'Cash')),
    amount DECIMAL(10,2) CHECK (amount > 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


-- 9. Drop a CHECK constraint from Products table.
ALTER TABLE Products 
DROP CHECK chk_price;

-- 10. Create a table Accounts with:
-- account_id PRIMARY KEY
-- balance default 5000
-- balance should never be negative
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    balance DECIMAL(10,2) DEFAULT 5000 CHECK (balance >= 0)
);
