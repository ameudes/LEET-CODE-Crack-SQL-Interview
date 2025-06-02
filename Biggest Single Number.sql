-- Problem Statement:
-- A *single number* is an integer that appears **exactly once** in the
-- `MyNumbers` table.  
-- Return the **largest** single number; if no single numbers exist, return
-- `NULL`.

-- Table Layout
-- Table: MyNumbers
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | num         | int  |
-- +-------------+------+
-- The table may contain duplicates; there is no primary key.

-- Approach
-- 1.  GROUP BY `num` to count how many times each value appears.
-- 2.  Use HAVING COUNT(*) = 1 to retain only the numbers that occur
--     exactly once (“single numbers”).
-- 3.  Apply MAX(num) to that filtered set to obtain the largest single
--     number.  
--     • If no rows satisfy the HAVING clause, MAX() returns NULL, which
--       meets the requirement.

-- SQL Solution
SELECT
    MAX(num) AS num
FROM (
    SELECT
        num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1          -- keep only numbers appearing once
) AS singles;
