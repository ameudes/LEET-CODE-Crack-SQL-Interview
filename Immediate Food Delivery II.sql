-- Task: 
-- Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

-- Given Table: Delivery
-- +-----------------------------+---------+
-- | Column Name                 s| Type    |
-- +-----------------------------+---------+
-- | delivery_id                 | int     |
-- | customer_id                 | int     |
-- | order_date                  | date    |
-- | customer_pref_delivery_date | date    |
-- +-----------------------------+---------+
-- delivery_id is the column of unique values of this table.
-- The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).

-- If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.
-- The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.

-- Approach:
-- 1. We use a common table expression (CTE) to identify the first orders of all customers.
-- 2. We count the number of immediate orders in the first orders of all customers.
-- 3. We calculate the percentage of immediate orders in the first orders of all customers.

-- SQL Solution:
WITH first_orders AS (
    SELECT *
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_num
        FROM Delivery
    ) AS sub
    WHERE row_num = 1
)
SELECT ROUND(
           (COUNT(*) FILTER (WHERE order_date = customer_pref_delivery_date) * 100.0) / NULLIF(COUNT(*), 0),
           2
       ) AS immediate_percentage
FROM first_orders;
