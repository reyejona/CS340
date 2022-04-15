/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CS 340 Databases
Project Step 4 Draft Version: Data Definition Queries & Sample Data
GROUP 15 | Frank's Fantastic Furniture |
Jonathan Paul Reyes & Armon Tavakoulnia
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS transaction_employee;



-- ---------------------------Customers----------------------------------

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT UNIQUE,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR (255) NOT NULL,
    address VARCHAR (255) NOT NULL,
    phone_number VARCHAR (20) UNIQUE,
    PRIMARY KEY (customer_id)
);

INSERT INTO customers (first_name, last_name, address, phone_number)
VALUES
  ('Bruce', 'Wayne', '324 Wave St.','111-111-1111'),
  ('Clark', 'Kent', '999 54th ave.', '222-222-2222'),
  ('Harold', 'Jordan', '444 Wall St.','333-333-3333'),
  ('Steve', 'Rogers', '888 Neverville st.','444-444-4444'),
  ('Carol', 'Danvers', '222 Harvard way','555-555-5555');

-- ---------------------------Orders----------------------------------

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT UNIQUE,
    customer_id INT NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO orders (customer_id)
VALUES
-- Bruce Wayne --
    (1),
-- Clark Kent --
    (2),
-- Harold Jordan --
    (3),
-- Steve Rogers --
    (4),
-- Carol Danvers --
    (5);

-- ---------------------------Products----------------------------------

CREATE TABLE products (
    product_id INT AUTO_INCREMENT UNIQUE,
    product_name VARCHAR(255) NOT NULL,
    unit_price DECIMAL (10,2) NOT NULL,
    PRIMARY KEY (product_id)
);

INSERT INTO products(product_name, unit_price)
VALUES
    ('Brown Luxurious Sofa', '500.00'),
    ('California King Memory Foam Mattress', '800.00'),
    ('Power Recliner Chair in Black leather', '600.00'),
    ('Starfield Loveseat', '450.00'),
    ('Regal Dining Table and 6 Chairs Set', '1500.00');

-- ---------------------------Transactions----------------------------------

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT UNIQUE,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (order_id) REFERENCES orders (order_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products (product_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO transactions (order_id, product_id, quantity)
VALUES
    -- Order #1: Brown Luxiurious Sofa, 1 --
    (1, 1, 1),
    -- Order #2: California King Memory Foam Mattress, 2 --
    (2, 2, 2),
    -- Order #3: Power Recliner Chair in Black leather, 1 --
    (3, 3, 1),
    -- Order #4: Regal Dining Table and 6 Chairs Set, 1 --
    (4, 5, 1),
    -- Order #5: Starfield Loveseat, 1 --
    (3, 4, 1);

-- ---------------------------Employees----------------------------------

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT UNIQUE,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR (255) NOT NULL,
    PRIMARY KEY (employee_id)
);

INSERT INTO employees (first_name, last_name)
VALUES
  ('Steve', 'Nash'),
  ('Michael', 'Jordan'),
  ('Stephen', 'Curry'),
  ('Kevin', 'Durant'),
  ('Klay', 'Thompson');

-- ---------------------------Transaction Employee----------------------------------

CREATE TABLE transaction_employee (
    transaction_id INT UNIQUE,
    employee_id INT UNIQUE,
    PRIMARY KEY (transaction_id, employee_id),
    FOREIGN KEY(transaction_id) REFERENCES transactions(transaction_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(employee_id) REFERENCES employees(employee_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO transaction_employee (transaction_id, employee_id)
VALUES
-- Add Steve Nash to Brown Luxiurious Sofa --
(1,1),
-- Add Michael Jordan to California King Memory Foam Mattress --
(2,2),
-- Add Stephen Curry to Power Recliner Chair in Black leather --
(3,3),
-- Add Kevin Durant to Regal Dining Table and 6 Chairs Set --
(4,4),
-- Add Klay Thompson to Starfield Loveseat --
(5,5);
