-- Problem Statement
-- ------------------------------------------------------------------
-- Table: Triangle
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | x           | int  |  -- length of the first side
-- | y           | int  |  -- length of the second side
-- | z           | int  |  -- length of the third side
-- +-------------+------+
-- (x, y, z) is the composite primary key.
--
-- Each row stores three segment lengths.  For every row, we must decide
-- whether those three lengths can form a *triangle*.
--
-- A triangle is possible **iff** all three of these strict inequalities hold:
--       x < y + z
--       y < x + z
--       z < x + y
-- If any one side is **greater than or equal to** the sum of the other two,
-- the segments cannot form a triangle.
--
-- For each row, output the three original columns plus a fourth column
-- named `triangle` whose value is:
--     'Yes'  → segments can form a triangle
--     'No'   → segments cannot form a triangle
-- The result may be returned in any order.

-- Approach
-- ------------------------------------------------------------------
-- 1. Evaluate the triangle-inequality conditions in a CASE expression:
--      • If x ≥ y + z   OR
--        y ≥ x + z   OR
--        z ≥ x + y         ⇒  output 'No'.
--      • Otherwise                              ⇒  output 'Yes'.
-- 2. Select all original columns along with this computed flag.

-- ------------------------------------------------------------------
SELECT
    *,
    CASE
        WHEN (x >= y + z) OR (y >= x + z) OR (z >= x + y)
             THEN 'No'
        ELSE 'Yes'
    END AS triangle
FROM Triangle;
