-- Problem Statement: Calculate the number of bank accounts for each salary category.

-- Given Table: Accounts
-- 
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | account_id  | int  |
-- | income      | int  |
-- +-------------+------+
-- account_id is the primary key (column with unique values) for this table.
-- Each row contains information about the monthly income for one bank account.
-- 
-- Approach:
-- 1. Categorize Salaries: We use a common table expression (CTE) to categorize salaries into three categories:
--    - "Low Salary": Salaries strictly less than $20000.
--    - "Average Salary": Salaries in the inclusive range [$20000, $50000].
--    - "High Salary": Salaries strictly greater than $50000.
-- 2. Count Accounts: We count the number of accounts in each salary category.
--    - If there are no accounts in a category, return 0.
-- 3. Return Result: We return the result table containing all three categories.

-- SQL Solution:
WITH cte AS (
    SELECT *,
           CASE 
               WHEN income < 20000 THEN 'Low Salary' 
               WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary' 
               ELSE 'High Salary'
           END AS category
    FROM Accounts
)
SELECT c.category,
       COALESCE(COUNT(account_id), 0) AS accounts_count
FROM (
    SELECT 'Low Salary' AS category
    UNION
    SELECT 'Average Salary'
    UNION 
    SELECT 'High Salary' 
) AS c
LEFT JOIN cte ON cte.category = c.category
GROUP BY c.category;
