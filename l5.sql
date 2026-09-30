Create TABLE IF NOT EXISTS salesman (
    salesman_id INTEGER PRIMARY KEY,
    name TEXT ,
    city TEXT ,
    comission TEXT 
);
INSERT INTO salesman(salesman_id,name,city,comission) 
VALUES
    ('5001', 'James Hoog', 'New York', '0.15'),
    ('5002', 'Nail Kite', 'Paris', '0.13'),
    ('5005', 'Pit Alex', 'London', '0.11'),
    ('5006', 'Mc Lyon', 'Paris', '0.14'),
    ('5007', 'Paul Adam', 'Rome', '0.13'),
    ('5003', 'Laetitia Paul', 'San Jose', '0.12');

Create TABLE IF NOT EXISTS customer (
    customer_id TEXT,
    cust_name TEXT PRIMARY KEY, 
    city TEXT, 
    grade TEXT,
    salesman_id TEXT
);
INSERT INTO customer(customer_id, cust_name, city, grade, salesman_id) 
VALUES
    ('3002', 'nick rimando', 'new york', '100', '5001'),
    ('3007', 'brad davis', 'new york', '200', '5001'),
    ('3005', 'graham suzi', 'calafornia', '200', '5001'),
    ('3008', 'julian green', 'london', '300', '5002'), 
    ('3004', 'fabian johnson', 'paris', '300', '5002'), 
    ('3009', 'geoff cameron', 'berlin', '100', '5006'),
    ('3006', 'tim howard', 'london', '200', '5005'),
    ('3003', 'clint dempsey', 'paris', '100', '5007'),
    ('3001', 'michael bradley', 'new york', '200', '5003');

Create TABLE IF NOT EXISTS orders (
    order_no TEXT PRIMARY KEY,
    purch_amt TEXT,
    order_date TEXT,
    customer_id TEXT,
    salesman_id TEXT
);
INSERT INTO orders(order_no, purch_amt, order_date, customer_id, salesman_id)
VALUES
    ('70001', '150.5', '2012-10-05', '3002', '5001'),
    ('70009', '270.65', '2012-09-10', '3005', '5001'),
    ('70002', '65.26', '2012-10-05', '3001', '5003'),
    ('70004', '110.5', '2012-08-17', '3009', '5007'),
    ('70007', '948.5', '2012-09-10', '3004', '5005'),
    ('70005', '2400.6', '2012-07-27', '3007', '5003');

SELECT customer.cust_name, salesman.name, salesman.city
FROM customer
JOIN salesman ON customer.city = salesman.city;

SELECT customer.cust_name, salesman.name
FROM customer
JOIN salesman ON customer.salesman_id = salesman.salesman_id;

SELECT orders.order_no, customer.cust_name, orders.customer_id, orders.salesman_id
FROM orders
JOIN customer ON orders.customer_id = customer.customer_id
JOIN salesman ON orders.salesman_id = salesman.salesman_id;
WHERE customer.city != salesman.city;

SELECT orders.order_no, customer.cust_name
FROM orders
JOIN customer ON orders.customer_id = customer.customer_id

SELECT customer.cust_name AS "Customer", customer.grade AS "Grade"
FROM orders
JOIN salesman ON orders.salesman_id = salesman.salesman_id
JOIN customer ON orders.customer_id = customer.customer_id
WHERE customer.grade IS NOT NULL

SELECT customer.cust_name AS "Customer",
customer.city AS "City",
salesman.name AS "Salesman",
salesman.commission 
FROM customer
JOIN salesman ON customer.salesman_id = salesman.salesman_id
WHERE salesman.commission BETWEEN 0.12 AND 0.14;
    
SELECT orders.order_no, customer.cust_name, salesman.commission AS 'Commission', orders.purch_amt AS 'Commission'  
FROM orders
JOIN salesman ON orders.salesman_id = salesman.salesman_id
JOIN customer ON orders.customer_id = customer.customer_id
WHERE customer.grade >= 200

SELECT *
FROM customer
JOIN orders ON customer.customer_id = orders.customer_id
WHERE orders.order_date = '2012-10-05';

DROP TABLE salesman
DROP TABLE customer
DROP TABLE orders