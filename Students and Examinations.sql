-- Problem Statement:
-- Write a solution to find the number of times each student attended each exam.

-- Given Tables:
-- Table: Students
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | student_id    | int     |
-- | student_name  | varchar |
-- +---------------+---------+
-- student_id is the primary key (column with unique values) for this table.
-- Each row of this table contains the ID and the name of one student in the school.

-- Table: Subjects
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | subject_name | varchar |
-- +--------------+---------+
-- subject_name is the primary key (column with unique values) for this table.
-- Each row of this table contains the name of one subject in the school.

-- Table: Examinations
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | student_id   | int     |
-- | subject_name | varchar |
-- +--------------+---------+
-- There is no primary key (column with unique values) for this table. It may contain duplicates.
-- Each student from the Students table takes every course from the Subjects table.
-- Each row of this table indicates that a student with ID student_id attended the exam of subject_name.

-- Approach:
-- We use a CROSS JOIN between the Students and Subjects tables to generate all possible combinations of student_id and subject_name.
-- Then, we LEFT JOIN the Examinations table with these combinations to count the number of exams attended by each student for each subject.

-- SQL Solution:
SELECT st.student_id, st.student_name, su.subject_name, COUNT(ex.subject_name) as attended_exams
FROM Students st
CROSS JOIN Subjects as su
LEFT JOIN Examinations AS ex ON st.student_id = ex.student_id AND su.subject_name = ex.subject_name
GROUP BY st.student_id, st.student_name, su.subject_name
ORDER BY st.student_id, su.subject_name;
