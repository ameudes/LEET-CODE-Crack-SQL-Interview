-- Task: 
-- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

-- Given Tables:
-- Table: Project
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | project_id  | int     |
-- | employee_id | int     |
-- +-------------+---------+
-- (project_id, employee_id) is the primary key of this table.
-- employee_id is a foreign key to the Employee table.
-- Each row of this table indicates that the employee with employee_id is working on the project with project_id.

-- Table: Employee
-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | employee_id      | int     |
-- | name             | varchar |
-- | experience_years | int     |
-- +------------------+---------+
-- employee_id is the primary key of this table. It's guaranteed that experience_years is not NULL.
-- Each row of this table contains information about one employee.

-- Approach:
-- 1. We perform a LEFT JOIN between the Project table and the Employee table based on the employee_id.
-- 2. We calculate the average experience years for each project using the AVG() function.
-- 3. We round the result to 2 decimal places using the ROUND() function.
-- 4. We group the result by project_id to get the average experience for each project.

-- SQL Solution:
SELECT project_id, ROUND(AVG(experience_years)::numeric, 2) AS average_years
FROM Project
LEFT JOIN Employee ON Employee.employee_id = Project.employee_id
GROUP BY project_id;
