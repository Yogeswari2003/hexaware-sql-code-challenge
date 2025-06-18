create database ecommerce

use ecommerce

-- 1. Create customers table
CREATE TABLE customers (
    customer_id int  primary key,
    name varchar(50) not null, 
    email varchar(50) UNIQUE NOT NULL,
    password varchar(50) 
    
);
ALTER TABLE customers
ADD  address VARCHAR(50);

ALTER TABLE customers
ADD  lastname VARCHAR(50);




-- 2. Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description varchar(50),
    stockQuantity INT 
);

-- 3. Create cart table
CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT ,
    quantity INT ,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 4. Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE ,
    total_price DECIMAL(10, 2) ,
    shipping_address VARCHAR(255) ,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 5. Create order_items table 
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT ,
    product_id INT,
    quantity INT ,
    itemAmount DECIMAL(10, 2),--this data is in table so i addedd here 
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into customers table
INSERT INTO customers (customer_id, name, lastname, email, address,password) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '123 Main St, City',1),
(2, 'Jane', 'Smith', 'janesmith@example.com', '456 Elm St, Town',2),
(3, 'Robert', 'Johnson', 'robert@example.com', '789 Oak St, Village',3),
(4, 'Sarah', 'Brown', 'sarah@example.com', '101 Pine St, Suburb',4),
(5, 'David', 'Lee', 'david@example.com', '234 Cedar St, District',5),
(6, 'Laura', 'Hall', 'laura@example.com', '567 Birch St, County',6),
(7, 'Michael', 'Davis', 'michael@example.com', '890 Maple St, State',7),
(8, 'Emma', 'Wilson', 'emma@example.com', '321 Redwood St, Country',8),
(9, 'William', 'Taylor', 'william@example.com', '432 Spruce St, Province',9),
(10, 'Olivia', 'Adams', 'olivia@example.com', '765 Fir St, Territory',10);

-- Insert data into products table
INSERT INTO products (product_id, name, description, price, stockQuantity) VALUES
(1, 'Laptop', 'High-performance laptop', 800.00, 10),
(2, 'Smartphone', 'Latest smartphone', 600.00, 15),
(3, 'Tablet', 'Portable tablet', 300.00, 20),
(4, 'Headphones', 'Noise-canceling', 150.00, 30),
(5, 'TV', '4K Smart TV', 900.00, 5),
(6, 'Coffee Maker', 'Automatic coffee maker', 50.00, 25),
(7, 'Refrigerator', 'Energy-efficient', 700.00, 10),
(8, 'Microwave Oven', 'Countertop microwave', 80.00, 15),
(9, 'Blender', 'High-speed blender', 70.00, 20),
(10, 'Vacuum Cleaner', 'Bagless vacuum cleaner', 120.00, 10);

-- Insert data into orders table

INSERT INTO orders (order_id, customer_id, order_date, total_price, shipping_address) VALUES
(1, 1, '2023-01-05', 1200.00, '123 Main St, City'), 
(2, 2, '2023-02-10', 900.00, '456 Elm St, Town'),  
(3, 3, '2023-03-15', 300.00, '789 Oak St, Village'), 
(4, 4, '2023-04-20', 150.00, '101 Pine St, Suburb'), 
(5, 5, '2023-05-25', 1800.00, '234 Cedar St, District'),
(6, 6, '2023-06-30', 400.00, '567 Birch St, County'),  
(7, 7, '2023-07-05', 700.00, '890 Maple St, State'),  
(8, 8, '2023-08-10', 160.00, '321 Redwood St, Country'),
(9, 9, '2023-09-15', 140.00, '432 Spruce St, Province'), 
(10, 10, '2023-10-20', 1400.00, '765 Fir St, Territory'); 



-- Insert data into order_items table


INSERT INTO order_items (order_item_id, order_id, product_id, quantity, itemAmount) VALUES
(1, 1, 1, 2, 1600.00),
(2, 1, 3, 1, 300.00),
(3, 2, 2, 3, 1800.00),
(4, 3, 5, 2, 1800.00),
(5, 4, 4, 4, 600.00),
(6, 4, 6, 1, 50.00),
(7, 5, 1, 1, 800.00),
(8, 5, 2, 2, 1200.00),
(9, 6, 10, 2, 240.00),
(10, 6, 9, 3, 210.00);


-- Insert data into cart table
INSERT INTO cart (cart_id, customer_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 4, 4),
(5, 3, 5, 2),
(6, 4, 6, 1),
(7, 5, 1, 1),
(8, 6, 10, 2),
(9, 6, 9, 3),
(10, 7, 7, 2);

select* from products
select* from customers
select* from orders
select* from order_items
select* from cart


--1. update refrigirator

update products set price = 800.00
where name = 'Refrigerator';

select* from products

--2. remove cart from specific 

delete from cart where customer_id = 5;
select * from cart

--3. price below
select * from products
where price < 100.00;

--4.stock qantoty greater than 5

SELECT * FROM products WHERE stockQuantity > 5;

--5.toal amt bet 
SELECT * FROM orders WHERE total_price BETWEEN 500.00 AND 1000.00;

--6. name end with r

SELECT * FROM products WHERE name LIKE '%r';

--7. cart item for 5

SELECT c.cart_id, c.customer_id, c.product_id, c.quantity, p.name AS product_name, p.price
FROM cart c
JOIN products p ON c.product_id = p.product_id
WHERE c.customer_id = 5;

--8. orders in 2023

SELECT  customers.customer_id, customers.name, customers.email,orders.order_date
FROM customers JOIN orders ON customers.customer_id = orders.customer_id
WHERE YEAR(orders.order_date) = 2023;

--9.min stock quantity

SELECT name AS product_name, MIN(stockQuantity) AS minimumstockquantity FROM products GROUP BY name;

--10.total amt cust
SELECT c.customer_id, c.name, SUM(o.total_price) AS totalamountspent
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name


--11. avg  order amt

SELECT c.customer_id, c.name, AVG(o.total_price) AS average_order_amount
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name

--12. no of orders 

SELECT c.customer_id, c.name, COUNT(o.order_id) AS number_of_orders
FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name

--13.max order amt

SELECT c.customer_id, c.name, MAX(o.total_price) AS maximum_order_amount
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name

--14 order over 1000

select c.customer_id, c.name, sum(o.total_price) AS total_spent
from customers c JOIN orders o on c.customer_id = o.customer_id
group by c.customer_id, c.name
having  SUM(o.total_price) > 1000.00

--15. not in cart orders 

select p.product_id, p.name, p.price, p.stockQuantity
from products p where p.product_id NOT IN (select  product_id from cart);

--16.not placed order

select c.customer_id,c.name,c.email
from customers c where c.customer_id NOT IN (select  customer_id from orders);

--17 percent of totalrevenue for a product

select products.name AS product_name,
(SUM(oi.itemAmount) * 100.0 / (SELECT SUM(itemAmount) FROM order_items)) AS percentofrevenue
from products JOIN order_items oi ON products.product_id = oi.product_id
group by products.name

--18. prds with low stock
select p.product_id,p.name,p.stockQuantity
from products p where p.stockQuantity < (select avg(stockQuantity) from products) 
   
   SELECT AVG(stockQuantity) FROM products --16

select p.product_id, p.name, p.stockQuantity
from products p where p.stockQuantity = (select min(stockQuantity) from products);


--19 . customers with high value orders

select customers.name ,orders.order_id,orders.total_price
from customers JOIN orders  on customers.customer_id = orders.customer_id
where  orders.total_price = (select max(total_price) from orders);

   

