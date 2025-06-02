-- Problem Statement
-- ------------------------------------------------------------------
-- Tables & Layout
-- 1) Employee
--    +--------------+---------+
--    | Column Name  | Type    |
--    +--------------+---------+
--    | id           | int     |  -- primary key
--    | name         | varchar |  -- employee name
--    | salary       | int     |  -- employee salary
--    | departmentId | int     |  -- FK → Department.id
--    +--------------+---------+
--    Each row represents one employee, their salary, and the department they
--    belong to.

-- 2) Department
--    +-------------+---------+
--    | Column Name | Type    |
--    +-------------+---------+
--    | id          | int     |  -- primary key
--    | name        | varchar |  -- department name
--    +-------------+---------+
--    Each row stores a department’s ID and its name.

-- Requirement
-- ------------------------------------------------------------------
-- A *high earner* in a department is any employee whose salary is within the
-- **top three unique salaries** for that department.  
-- For every department, list all employees who meet this criterion, along with:
--   • Department name  
--   • Employee name  
--   • Salary  
-- Return the result set in any order.

-- Approach
-- ------------------------------------------------------------------
-- 1.  Use `DENSE_RANK()` partitioned by `departmentId` and ordered by salary
--     (descending) to rank each employee’s salary within their department.  
-- 2.  Keep rows whose rank ≤ 3 (top-three unique salaries).  
-- 3.  Join to the Department table to obtain the department’s name.  
-- 4.  Select the requested columns; the ORDER BY in the code simply groups by
--     department then by rank but the final ordering requirement is flexible.

------------------------------------------------------------------
WITH temp AS (
    SELECT
        e.*,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS ranking
    FROM Employee e
)
SELECT
    d.name        AS Department,
    temp.name     AS Employee,
    temp.salary   AS Salary
FROM   temp
LEFT  JOIN Department d
       ON temp.departmentId = d.id
WHERE  temp.ranking <= 3
ORDER BY temp.departmentId, temp.ranking;
