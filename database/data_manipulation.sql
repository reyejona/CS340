/* Variables prefixed with ":" */

/* Basic queries that select all columns from one of the tables:
Select all from customers, orders, products, transactions, and employees.  */
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM transactions;
SELECT * FROM employees;
SELECT * FROM transaction_employee;

/*  Queries that INSERT values to one of the tables:
Insert all needed values to customers, orders, products, transactions, and employees.  */
INSERT INTO customers (first_name, last_name, address, phone_number)
    VALUES (:first_name, :last_name, :address, :phone_number);
INSERT INTO orders (customer_id)
    VALUES (:customer_id);
INSERT INTO products (product_name, unit_price)
    VALUES (:product_name, :unit_price);
INSERT INTO transactions (order_id, product_id, quantity)
    VALUES (:order_id, :product_id, :quantity);
INSERT INTO employees (first_name, last_name)
    VALUES (:first_name, :last_name);
INSERT INTO transaction_employee (transaction_id, employee_id)
    VALUES (:transaction_id, :employee_id);

/*  Queries that DELETE from the tables:
Delete ID from customers, orders, products, transactions, and employees.  */
DELETE FROM customers WHERE customer_id = :customer_id;
DELETE FROM orders WHERE order_id = :order_id;
DELETE FROM products WHERE product_id = :product_id;
DELETE FROM transactions WHERE transaction_id = :transaction_id;
DELETE FROM employees WHERE employee_id = :employee_id;
-- Remove all employees, or just one employee, from a transaction
DELETE FROM transaction_employee WHERE transaction_id = :transaction_id;
DELETE FROM transaction_employee WHERE transaction_id = :transaction_id AND employee_id = :employee_id;

/* Queries which UPDATE values from the tables:
Update values from customers, orders, products, transactions, and employees.  */
UPDATE customers SET first_name = :first_name, last_name = :last_name, phone_number = :phone_number WHERE customer_id = :customer_id;
UPDATE orders SET customer_id = :customer_id WHERE order_id = order_id;
UPDATE products SET product_name = :product_name, unit_price = :unit_price WHERE product_id = :product_id;
UPDATE transactions SET quantity = :quantity WHERE transaction_id = :transaction_id;
UPDATE employees SET emp_first_name = :emp_first_name, emp_last_name = emp_last_name WHERE employee_id = :employee_id;
