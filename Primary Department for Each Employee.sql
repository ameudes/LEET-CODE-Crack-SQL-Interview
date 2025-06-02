-- Problem Statement
-- ------------------------------------------------------------------
-- Table: Employee
-- +---------------+---------+
-- | Column Name   |  Type   |
-- +---------------+---------+
-- | employee_id   | int     |  -- employee’s unique identifier
-- | department_id | int     |  -- department identifier
-- | primary_flag  | varchar |  -- 'Y' if this is the employee’s primary dept
-- +---------------+---------+
-- (employee_id, department_id) is the composite primary key.
--
-- • An employee may appear in multiple departments.  
-- • If an employee is in more than one department, exactly one row for that
--   employee has primary_flag = 'Y'.  
-- • If an employee belongs to **only one** department, the primary_flag for
--   that single row is 'N'.
--
-- Task  
-- ----  
-- For every employee, return the employee’s ID together with their **primary
-- department**:  
--   • If the employee belongs to multiple departments, pick the row whose
--     primary_flag = 'Y'.  
--   • If the employee belongs to only one department, return that department
--     regardless of the flag.
-- The result may be returned in any order.

-- Approach
-- ------------------------------------------------------------------
-- 1.  Use a window count to find how many departments each employee belongs to
--     (`count(department_id) OVER (PARTITION BY employee_id)` → nbr).  
-- 2.  Keep rows that satisfy either condition:
--       a) Employee has **one** department (`nbr = 1`).  
--       b) Employee has **multiple** departments **and** `primary_flag = 'Y'`.
-- 3.  Select employee_id and department_id from the filtered set.

-- ------------------------------------------------------------------
WITH inter AS (
    SELECT *,
           COUNT(department_id) OVER (PARTITION BY employee_id) AS nbr
    FROM   Employee
)
SELECT
    inter.employee_id,
    inter.department_id
FROM   inter
WHERE (inter.nbr <> 1 AND inter.primary_flag = 'Y')
   OR (inter.nbr = 1);
