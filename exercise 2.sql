CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);


CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (first_name,last_name,email) VALUES
("Richard", "Doe", "richard.doe@example.com"),
("Jane", "Smith", "jane.smith@example.com"),
("Cathy", "Rao", "cathy.rao@example.com");

INSERT INTO products (product_name, price) VALUES
('WashingMachine', 299.99),
('Smartphone', 499.99),
('Computer', 599.99);

INSERT INTO orders(customer_id,order_date) VALUES
(1,'2024-05-05'),
(2,'2023-09-22'),
(3,'2022-07-08');

INSERT INTO order_items(order_id,product_id,quantity,price) VALUES
(1,1,1,299.99),
(1,3,2,599.99),
(2,2,1,499.99);

SELECT c.customer_id,c.first_name,c.last_name, 
COUNT(o.order_id) AS total_orders
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.customer_id,c.first_name,c.last_name; 

SELECT p.product_id,product_name
From products p
LEFT JOIN order_items oi ON p.product_id=p.product_id
WHERE oi.product_id IS NULL;

SELECT c.customer_id, c.first_name, c.last_name, 
    SUM(oi.quantity * oi.price) AS total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 1;




