-- Problem Statement: Find the users who have valid emails.

-- Given Table: Users
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- | mail          | varchar |
-- +---------------+---------+
-- user_id is the primary key (column with unique values) for this table.
-- This table contains information of the users signed up in a website. Some e-mails are invalid.
-- 
-- Approach:
-- 1. Regular Expression: We use a regular expression to match the format of valid email addresses.
--    - The regular expression pattern ensures that the email prefix name starts with a letter and may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'.
--    - The domain must be '@leetcode.com'.
-- 2. Filter Users: We filter the Users table based on the regular expression pattern.
-- 3. Return Result: We return the rows corresponding to users with valid emails.

-- SQL Solution:
SELECT *
FROM Users
WHERE mail ~ '^[a-zA-Z]+[a-zA-Z0-9_\.-]*@leetcode\.com$';
