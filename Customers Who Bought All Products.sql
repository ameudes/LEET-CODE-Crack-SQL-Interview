-- Problem Statement:
-- Return the IDs of customers who have purchased every product listed in the
-- Product table.  A customer qualifies if the set of product_key values they
-- bought matches the complete set of product_key values present in Product.

-- Table Layouts
-- -------------------------------------------------------------------
-- Table: Customer
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | customer_id | int     |  -- NOT NULL
-- | product_key | int     |  -- FK → Product.product_key
-- +-------------+---------+
-- (The table may contain duplicate rows.)

-- Table: Product
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_key | int     |  -- Primary key
-- +-------------+---------+

-- Approach:
-- 1. Count how many distinct products exist overall:
--      SELECT COUNT(DISTINCT product_key) FROM Product
-- 2. For each customer, count how many distinct product_key values they have
--    purchased (GROUP BY customer_id).
-- 3. Keep only those customers whose distinct-product count equals the total
--    number of products.  Those customers bought everything.

-- SQL Solution:
SELECT
    customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
          SELECT COUNT(DISTINCT product_key) FROM Product
       );
