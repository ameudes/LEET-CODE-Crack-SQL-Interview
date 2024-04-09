-- Problem Statement: Write a solution to show the unique ID of each user. If a user does not have a unique ID, replace it with null.

-- Given Table: Employees
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | name          | varchar |
-- +---------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains the id and the name of an employee in a company.
-- 
-- Given Table: EmployeeUNI
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | unique_id     | int     |
-- +---------------+---------+
-- (id, unique_id) is the primary key (combination of columns with unique values) for this table.
-- Each row of this table contains the id and the corresponding unique id of an employee in the company.
-- 
-- Approach: To show the unique ID of each user, we can perform a LEFT JOIN between the Employees table and the EmployeeUNI table on the id column. This will include all employees from the Employees table and match them with their corresponding unique IDs from the EmployeeUNI table. If an employee does not have a unique ID, it will show null.
-- 
-- SQL Solution:
SELECT unique_id, name 
FROM Employees 
LEFT JOIN EmployeeUNI ON EmployeeUNI.id = Employees.id;
