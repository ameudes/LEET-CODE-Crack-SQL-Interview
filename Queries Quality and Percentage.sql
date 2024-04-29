-- Given Table: Queries
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | query_name  | varchar |
-- | result      | varchar |
-- | position    | int     |
-- | rating      | int     |
-- +-------------+---------+
-- This table contains information collected from some queries on a database.
-- The position column has a value from 1 to 500.
-- The rating column has a value from 1 to 5. Query with rating less than 3 is a poor query.

-- Approach:
-- 1. We calculate the quality of each query by dividing its rating by its position.
-- 2. We also identify poor queries by checking if their rating is less than 3.
-- 3. Then, we calculate the average quality and the percentage of poor queries for each query_name.
-- 4. Finally, we round the quality and poor_query_percentage to two decimal places.

-- SQL Solution:
SELECT 
    query_name,
    ROUND(AVG(ROUND(CAST(rating AS NUMERIC) / NULLIF(position, 0), 10)), 2) AS quality,
    ROUND(AVG(CASE WHEN rating < 3 THEN 100.0 ELSE 0.0 END), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
