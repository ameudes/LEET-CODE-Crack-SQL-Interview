-- Problem Statement: Find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.

-- Given Table: Patients
-- 
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | patient_id   | int     |
-- | patient_name | varchar |
-- | conditions   | varchar |
-- +--------------+---------+
-- patient_id is the primary key (column with unique values) for this table.
-- 'conditions' contains 0 or more code separated by spaces. 
-- This table contains information of the patients in the hospital.
-- 
-- Approach:
-- 1. Filter Patients with Type I Diabetes: We use the LIKE operator to filter patients whose conditions contain the code for Type I Diabetes, which always starts with the prefix 'DIAB1'.
--    - conditions LIKE '% DIAB1%': This condition captures cases where 'DIAB1' appears as a middle or last condition.
--    - conditions LIKE 'DIAB1%': This condition captures cases where 'DIAB1' appears as the first condition.
-- 
-- 2. Select Columns: We select the patient_id, patient_name, and conditions columns for the filtered patients.
-- 
-- 3. Return Result: We return the result table containing patient_id, patient_name, and conditions for patients with Type I Diabetes, in any order.
-- 
-- SQL Solution:
SELECT *
FROM Patients
WHERE conditions LIKE '% DIAB1%' OR conditions LIKE 'DIAB1%';
