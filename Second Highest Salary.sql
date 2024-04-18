-- Problem Statement: Find the second highest salary from the Employee table. If there is no second highest salary, return null.

-- Given Table: Employee
-- 
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains information about the salary of an employee.
-- 
-- Approach:
-- 1. Count Salaries Except for Maximum: We first count the number of salaries in the Employee table that are not equal to the maximum salary.
--    - If this count is zero, it means there is no second highest salary, so we return NULL.
-- 2. Find Second Highest Salary: If the count is not zero, we proceed to find the second highest salary.
--    - We select the salary that is not equal to the maximum salary, order them in descending order, and limit the result to one row.
-- 3. Use CASE Statement: We use a CASE statement to conditionally return either the second highest salary or NULL based on the count from step 1.

-- SQL Solution:
SELECT CASE
           WHEN (SELECT COUNT(*) FROM EMPLOYEE WHERE Salary != (SELECT MAX(Salary) FROM Employee)) = 0
               THEN NULL
           ELSE (SELECT Salary 
                 FROM EMPLOYEE 
                 WHERE Salary != (SELECT MAX(Salary) FROM Employee) 
                 ORDER BY Salary DESC 
                 LIMIT 1)
       END as SecondHighestSalary;
