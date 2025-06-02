-- Task:
-- Calculate the number of unique subjects each teacher teaches in the university
-- and return the teacher_id together with that count.

-- Given Table: Teacher
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | teacher_id  | int  |
-- | subject_id  | int  |
-- | dept_id     | int  |
-- +-------------+------+
-- (subject_id, dept_id) is the primary key (combination of columns with unique values).
-- Each row indicates the teacher with teacher_id teaches subject_id in department dept_id.

-- Approach:
-- 1. For each teacher, we need to count how many distinct subjects they teach, regardless of department.
-- 2. We GROUP BY teacher_id so that each group represents one teacher.
-- 3. We apply COUNT(DISTINCT subject_id) to each group to count unique subjects taught by that teacher.
-- 4. The problem allows the results to be returned in any order.

-- SQL Solution:
SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
