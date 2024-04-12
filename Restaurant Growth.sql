-- Problem Statement: Compute the moving average of how much the customers paid in a seven-day window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places. Return the result table ordered by visited_on in ascending order.

-- Given Table: Customer
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | customer_id   | int     |
-- | name          | varchar |
-- | visited_on    | date    |
-- | amount        | int     |
-- +---------------+---------+
-- In SQL, (customer_id, visited_on) is the primary key for this table.
-- This table contains data about customer transactions in a restaurant.
-- visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
-- amount is the total paid by a customer.
-- 
-- Approach: 
-- 1. Calculate Total Amount Paid per Visit Date: We first calculate the total amount paid by all customers on each visited date, regardless of the customer. This is done by summing up the "amount" column for each unique "visited_on" date in the "Customer" table. We store this result in a temporary table named "table1".
-- 
-- 2. Compute Moving Average in a Seven-Day Window:
--    - We join the "table1" with itself to create a sliding window of seven days for each visited date.
--    - For each visited date "a.visited_on" in the "table1", we join it with the dates in the range of "a.visited_on" to "a.visited_on + 6" days.
--    - We calculate the sum of amounts for these seven days, and then compute the average amount by dividing the total sum by 7.0.
--    - We round this average amount to two decimal places.
--    - We ensure that we only include windows where all seven days have at least one visit date (regardless of the customer) by filtering out cases where the count of distinct visited dates in the window is 7.
--    - Finally, we order the result table by visited_on in ascending order.
-- 
-- SQL Solution:
WITH table1 AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)
SELECT a.visited_on + 6 AS visited_on, SUM(b.amount) AS amount, ROUND((SUM(b.amount) / 7.0), 2) AS average_amount
FROM table1 a 
JOIN table1 b ON (b.visited_on - a.visited_on)::int BETWEEN 0 AND 6
GROUP BY a.visited_on
HAVING COUNT(DISTINCT b.visited_on) = 7
ORDER BY a.visited_on;
