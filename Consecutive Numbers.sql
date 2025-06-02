-- Problem Statement
-- ------------------------------------------------------------------
-- Table: Logs
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |  -- auto-increment PK, starting at 1
-- | num         | varchar |
-- +-------------+---------+
-- Each row records a value `num` in natural order of insertion
-- (ascending `id`).
--
-- Goal  
-- ----  
-- Find every value of `num` that appears **at least three times in a row**
-- (i.e., in three consecutive `id` positions).  
-- Return each qualifying value once, in a column named `ConsecutiveNums`.
-- Output order is not important.

-- Approach
-- ------------------------------------------------------------------
-- • For each row in `Logs`, look one row back (`id - 1`) and two rows back
--   (`id - 2`).  
-- • If the `num` value in the current row is equal to the `num` in both of
--   those earlier rows, then the current row is part of a run of at least
--   three identical consecutive numbers.  
-- • Collect such `num` values in a CTE, then select DISTINCT from that CTE to
--   ensure each qualifying number appears only once in the final output.

-- ------------------------------------------------------------------
WITH cte AS (
    SELECT Logs.num AS num
    FROM   Logs
    LEFT JOIN Logs AS L1 ON L1.id = Logs.id - 1
    LEFT JOIN Logs AS L2 ON L2.id = Logs.id - 2
    WHERE  Logs.num = L1.num
      AND  L2.num   = L1.num
)
SELECT DISTINCT num AS ConsecutiveNums
FROM   cte;
