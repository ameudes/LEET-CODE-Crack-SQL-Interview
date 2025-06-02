-- Problem Statement
-- ------------------------------------------------------------------
-- Table: Employees
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | employee_id | int      |  -- primary key
-- | name        | varchar  |
-- | manager_id  | int      |  -- ID of this employee’s manager (nullable)
-- | salary      | int      |
-- +-------------+----------+
-- • Each row stores an employee’s name, salary, and the ID of their manager.  
-- • When a manager leaves the company, their own row is deleted, but the
--   employees who reported to that manager still retain the now-orphaned
--   manager_id.  
--
-- Task  
-- ----  
-- List the IDs of employees who satisfy **both** conditions:  
--   1. Their salary is strictly **less** than 30 000.  
--   2. The manager referenced by their manager_id **no longer exists** in the
--      Employees table.  
-- Return the result ordered by employee_id (ascending).

-- Approach
-- ------------------------------------------------------------------
-- • For each employee row, test `salary < 30000`.  
-- • To detect a departed manager, check whether `manager_id` is **absent** from
--   the existing set of `employee_id` values.  
--   – `manager_id NOT IN (SELECT employee_id FROM Employees)` achieves this.  
-- • Select employee_id for rows meeting both criteria and ORDER BY employee_id.

------------------------------------------------------------------
SELECT employee_id
FROM Employees
WHERE salary < 30000
  AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id;
