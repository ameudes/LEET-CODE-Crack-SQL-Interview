-- Problem Statement: Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

-- Given Table: Visits
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | visit_id    | int     |
-- | customer_id | int     |
-- +-------------+---------+
-- visit_id is the column with unique values for this table.
-- This table contains information about the customers who visited the mall.
-- 
-- Given Table: Transactions
-- 
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | transaction_id | int     |
-- | visit_id       | int     |
-- | amount         | int     |
-- +----------------+---------+
-- transaction_id is the column with unique values for this table.
-- This table contains information about the transactions made during the visit_id.
-- 
-- Approach: To find the IDs of the users who visited without making any transactions and the number of times they made these types of visits, we can perform a LEFT JOIN between the Visits and Transactions tables on the visit_id column. Then, we filter out the rows where transaction_id is NULL, indicating no transactions were made during the visit. Finally, we group the results by customer_id and count the occurrences.
-- 
-- SQL Solution:
SELECT customer_id, COUNT(customer_id) AS count_no_trans
FROM Visits 
LEFT JOIN Transactions ON Transactions.visit_id = Visits.visit_id
WHERE transaction_id IS NULL
GROUP BY customer_id;
