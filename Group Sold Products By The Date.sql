-- Problem Statement: Find for each date the number of different products sold and their names.

-- Given Table: Activities
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | sell_date   | date    |
-- | product     | varchar |
-- +-------------+---------+
-- There is no primary key (column with unique values) for this table. It may contain duplicates.
-- Each row of this table contains the product name and the date it was sold in a market.
-- 
-- Approach:
-- 1. Group by Date: We group the records in the Activities table by the sell_date.
-- 2. Count Unique Products: For each sell_date, we count the number of different products sold using the COUNT and DISTINCT functions.
-- 3. Aggregate Product Names: We aggregate the names of the sold products for each date using the STRING_AGG function.
--    - The DISTINCT keyword ensures that each product name appears only once in the aggregated list.
--    - The result is sorted lexicographically.
-- 4. Return Result: We return the result table containing sell_date, the number of different products sold (num_sold), and the aggregated product names (products), ordered by sell_date.

-- SQL Solution:
SELECT sell_date, 
       count(DISTINCT product) as num_sold, 
       STRING_AGG(DISTINCT product, ',') as products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;
