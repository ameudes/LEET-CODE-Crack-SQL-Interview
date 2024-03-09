-- Problem Statement: Find the names of the customers who are not referred by the customer with id = 2.

-- Given Table: Customer
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | referee_id  | int     |
-- +-------------+---------+
-- In SQL, id is the primary key column for this table.
-- Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
-- 
-- Approach: To find the names of the customers not referred by the customer with id = 2, we can query the names from the Customer table where referee_id is not equal to 2 or is NULL.
-- 
-- SQL Solution:
SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;
