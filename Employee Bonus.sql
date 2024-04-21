-- Problem Statement: Report the name and bonus amount of each employee with a bonus less than 1000.

-- Given Table: Employee
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | empId       | int     |
-- | name        | varchar |
-- | supervisor  | int     |
-- | salary      | int     |
-- +-------------+---------+
-- empId is the column with unique values for this table.
-- Each row of this table indicates the name and the ID of an employee in addition to their salary and the id of their manager.
-- 
-- Given Table: Bonus
-- 
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | empId       | int  |
-- | bonus       | int  |
-- +-------------+------+
-- empId is the column of unique values for this table.
-- empId is a foreign key (reference column) to empId from the Employee table.
-- Each row of this table contains the id of an employee and their respective bonus.
-- 
-- Approach: We use a LEFT JOIN between the Employee and Bonus tables on the empId column. 
--Then, we filter the rows where the bonus amount is less than 1000 or NULL.
-- 
-- SQL Solution:
SELECT name, bonus
FROM Employee
LEFT JOIN Bonus ON Employee.empID = Bonus.empID
WHERE bonus < 1000 OR bonus IS NULL;
