-- Given Tables:
-- Table: Users
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | user_id     | int     |
-- | user_name   | varchar |
-- +-------------+---------+
-- user_id is the primary key for this table.
-- Each row contains the name and the id of a user.

-- Table: Register
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | contest_id  | int     |
-- | user_id     | int     |
-- +-------------+---------+
-- (contest_id, user_id) is the primary key for this table.
-- Each row contains the id of a user and the contest they registered into.

-- Approach:
-- 1. We use a common table expression (CTE) to calculate the total number of users registered in each contest.
-- 2. We count the number of distinct user_ids for each contest_id in the Register table.
-- 3. We also calculate the total number of users in the Users table.
-- 4. Then, we calculate the percentage of users registered in each contest by dividing the count of users registered in the contest by the total number of users, multiplied by 100.
-- 5. We round the percentage to two decimal places.
-- 6. Finally, we order the result table by percentage in descending order. In case of a tie, we order it by contest_id in ascending order.

-- SQL Solution:
WITH CTE AS (
    SELECT 
        r.contest_id,
        COUNT(DISTINCT r.user_id) AS registered_users,
        COUNT(DISTINCT u.user_id) AS total_users
    FROM Register r
    CROSS JOIN Users u
    GROUP BY r.contest_id
)
SELECT 
    c.contest_id,
    ROUND((CAST(c.registered_users AS DECIMAL) / NULLIF(c.total_users, 0)) * 100, 2) AS percentage_registered
FROM CTE c
ORDER BY percentage_registered DESC, c.contest_id ASC;
