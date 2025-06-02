-- Problem Statement
-- ------------------------------------------------------------------
-- Table: Queue
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | person_id   | int     |  -- unique identifier (1..n)
-- | person_name | varchar |  -- name of the person
-- | weight      | int     |  -- person’s weight (kg)
-- | turn        | int     |  -- boarding order (1..n)
-- +-------------+---------+
-- • `turn = 1` is the first to board, `turn = n` is the last.  
-- • The bus can carry people in turn order until the **cumulative** weight
--   would exceed **1000 kg**.  
-- • We must output the `person_name` of the **last** person who can board
--   without surpassing that limit.  (Test data guarantee the first person fits.)

-- Approach
-- ------------------------------------------------------------------
-- 1.  Use a window function `SUM(weight) OVER (ORDER BY turn)` to compute the
--     running total weight as people board in turn order.
-- 2.  Filter to rows where the cumulative sum (`sum`) is ≤ 1000 kg; these are
--     the people who actually get on the bus.
-- 3.  Among those, pick the row with the **largest** cumulative sum; that row
--     corresponds to the final person who can still fit.
-- 4.  Return that person’s `person_name`.

-----------------------------------------------------------------
WITH temp AS (
    SELECT *, SUM(weight) OVER (ORDER BY turn) 
    FROM   Queue
),
temp2 AS (
    SELECT * 
    FROM   temp 
    WHERE  sum <= 1000
)
SELECT person_name 
FROM   temp2 
WHERE  sum = (SELECT MAX(sum) FROM temp2);
