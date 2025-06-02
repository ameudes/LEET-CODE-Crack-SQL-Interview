-- Problem Statement
-- ------------------------------------------------------------------
-- Tables
-- 1) Employees
--    +-------------+----------+
--    | Column Name | Type     |
--    +-------------+----------+
--    | employee_id | int      |  -- unique identifier
--    | name        | varchar  |
--    | reports_to  | int      |  -- manager’s employee_id (nullable)
--    | age         | int      |
--    +-------------+----------+
--    Each row gives an employee’s basic data and the ID of their manager.
--    An employee whose employee_id appears in another row’s reports_to field
--    has at least one direct report and is therefore considered a *manager*.
--
-- Requirement
-- For every manager, return:
--   • employee_id      – the manager’s ID  
--   • name             – the manager’s name  
--   • reports_count    – count of employees who report **directly** to the manager  
--   • average_age      – average age of those direct reports, rounded to the
--                        nearest integer
-- The result should be ordered by employee_id (ascending).

-- Approach
-- ------------------------------------------------------------------
-- 1.  Start with a self-join on Employees:
--       • “mgr” alias: potential manager
--       • “emp” alias: direct report (emp.reports_to = mgr.employee_id)
-- 2.  GROUP BY the manager’s id and name.
-- 3.  Within each group:
--       • COUNT(emp.employee_id)  → number of direct reports
--       • AVG(emp.age)            → average age of those reports (rounded)
-- 4.  ORDER BY employee_id.
--
-- ------------------------------------------------------------------
WITH intere AS (
    SELECT *
    FROM Employees
    JOIN (
        SELECT employee_id AS manager_id,
               name        AS manager_name
        FROM   Employees
    ) AS inter
      ON inter.manager_id = Employees.reports_to
)
SELECT
      intere.manager_id         AS employee_id,
      intere.manager_name       AS name,
      COUNT(intere.employee_id) AS reports_count,
      ROUND(AVG(intere.age))    AS average_age
FROM  intere
GROUP BY intere.manager_id, intere.manager_name
ORDER BY intere.manager_id;
