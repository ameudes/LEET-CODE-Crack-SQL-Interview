-- Problem Statement: Get the names of products that have at least 100 units ordered in February 2020 and their total amount.

-- Given Tables: Products, Orders
-- 
-- Products Table:
-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | product_id       | int     |
-- | product_name     | varchar |
-- | product_category | varchar |
-- +------------------+---------+
-- product_id is the primary key (column with unique values) for this table.
-- This table contains data about the company's products.
-- 
-- Orders Table:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | order_date    | date    |
-- | unit          | int     |
-- +---------------+---------+
-- This table may have duplicate rows.
-- product_id is a foreign key (reference column) to the Products table.
-- unit is the number of products ordered on order_date.
-- 
-- Approach:
-- 1. Join Tables: We join the Orders table with the Products table using the product_id column.
-- 2. Filter Orders: We filter the orders to include only those made in February 2020.
-- 3. Group by Product: We group the results by product_name.
-- 4. Aggregate Units: We sum the units ordered for each product.
-- 5. Filter Products: We include only those products with at least 100 units ordered.
-- 6. Return Result: We return the product names and their total units ordered.

-- SQL Solution:
SELECT P.product_name, sum(unit) as unit
FROM Orders O LEFT JOIN Products P ON O.product_id = P.product_id
WHERE order_date >= '2020-02-01' AND order_date <= '2020-02-29'
GROUP BY P.product_name
HAVING sum(unit) >= 100;
