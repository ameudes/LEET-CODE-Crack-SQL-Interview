-- Problem Statement: Fix the names so that only the first character is uppercase and the rest are lowercase.

-- Given Table: Users
-- 
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | user_id        | int     |
-- | name           | varchar |
-- +----------------+---------+
-- user_id is the primary key (column with unique values) for this table.
-- This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.
-- 
-- Approach:
-- 1. Modify Name Format: We use the CONCAT, UPPER, and LOWER functions to transform the name column.
--    - UPPER(SUBSTRING(name, 1, 1)): This converts the first character of the name to uppercase.
--    - LOWER(SUBSTRING(name FROM 2)): This converts the rest of the characters to lowercase.
--    - CONCAT function is used to concatenate the modified first character with the modified rest of the name.
-- 
-- 2. Order by user_id: We order the result table by user_id.
-- 
-- SQL Solution:
SELECT user_id, CONCAT(UPPER(SUBSTRING(name, 1, 1)), LOWER(SUBSTRING(name FROM 2))) AS name
FROM Users
ORDER BY user_id;
