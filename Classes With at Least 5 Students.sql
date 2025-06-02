-- Task:
-- Find every class that has at least five distinct students enrolled.
-- Return one row per qualifying class; order does not matter.

-- Table Layout:
-- Table: Courses
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | student     | varchar |  -- student name
-- | class       | varchar |  -- class name
-- +-------------+---------+
-- (student, class) is the composite primary key, so a given student appears at
-- most once per class.  
-- Each row therefore represents a unique (student, class) enrollment.

-- Approach:
-- 1.  GROUP BY the class column so that each group represents one class.  
-- 2.  COUNT(student) inside each group to know how many students are enrolled
--     in that class.  
-- 3.  Use HAVING COUNT(student) ≥ 5 to keep only those groups (classes) with at
--     least five students.  
-- 4.  Select the class column from the remaining groups.

-- SQL Solution:
SELECT
    class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
