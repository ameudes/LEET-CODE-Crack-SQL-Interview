-- Problem Statement:
-- Write a solution to find managers with at least five direct reports.

-- Given Table:
-- Table: Employee
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | department  | varchar |
-- | managerId   | int     |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the name of an employee, their department, and the id of their manager.
-- If managerId is null, then the employee does not have a manager.
-- No employee will be the manager of themselves.

-- Approach:
-- We use a subquery to calculate the count of direct reports for each manager.
-- Then, we join the Employee table with this subquery on the managerId to filter out managers with at least five direct reports.

-- SQL Solution:
SELECT name
FROM Employee AS A
JOIN (
    SELECT managerId, COUNT(managerId) AS no_of_reports
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5
) AS B ON A.id = B.managerId;
