-- Problem Statement: Find all dates' Id with higher temperatures compared to their previous dates (yesterday).

-- Given Table: Weather
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+
-- id is the column with unique values for this table.
-- There are no different rows with the same recordDate.
-- This table contains information about the temperature on a certain day.
-- 
-- Approach: 
-- 1. Self-Join with Previous Date: We perform a self-join on the Weather table to create a copy of the table with the previous date's temperature for each recordDate.
-- 2. Compare Temperatures: We compare the temperature for each date with its previous date's temperature.
-- 3. Filter Higher Temperatures: We filter out rows where the temperature for the current date is higher than the temperature for the previous date.
-- 
-- SQL Solution:
SELECT id 
FROM Weather 
LEFT JOIN (
    SELECT recordDate AS previous_date, temperature AS previous_temp 
    FROM Weather
) AS Copie ON recordDate - 1 = previous_date 
WHERE temperature > previous_temp;
