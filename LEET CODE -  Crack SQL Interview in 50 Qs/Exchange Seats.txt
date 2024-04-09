-- Problem Statement: Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

-- Given Table: Seat
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | student     | varchar |
-- +-------------+---------+
-- id is the primary key (unique value) column for this table.
-- Each row of this table indicates the name and the ID of a student.
-- id is a continuous increment.
-- 
-- Approach: To swap the seat id of every two consecutive students, we can create a common table expression (CTE) to generate the new position for each student's id based on whether it's even or odd. Then, we can join this CTE with itself to pair up consecutive students and swap their ids accordingly. Finally, we select the id and the updated student name from the CTE.
-- 
-- SQL Solution:
WITH temp1 AS (
    SELECT *, 
           CASE
               WHEN id % 2 = 0 THEN id - 1
               WHEN id % 2 != 0 THEN id + 1 
           END AS pos
    FROM Seat
),
temp2 AS (
    SELECT t.id, t.student AS old, u.student AS new 
    FROM temp1 AS t
    LEFT JOIN temp1 AS u ON t.id = u.pos
)
SELECT id, COALESCE(new, old) AS student
FROM temp2
ORDER BY id;
