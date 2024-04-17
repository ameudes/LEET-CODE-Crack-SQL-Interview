-- Problem Statement: Delete all duplicate emails from the Person table, keeping only one unique email with the smallest id.

-- Given Table: Person
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | email       | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains an email. The emails will not contain uppercase letters.
-- 
-- Approach:
-- 1. Identify Duplicate Emails: We use a subquery to select the minimum id for each unique email using GROUP BY.
--    - This subquery helps us to identify the emails to keep (those with the smallest id) and delete the duplicates.
-- 
-- 2. Delete Duplicate Emails: We use a DELETE statement to remove rows from the Person table where the id is not in the list of minimum ids for each email.
-- 
-- SQL Solution:
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);
