-- Problem Statement: Find the average time each machine takes to complete a process.

-- Given Table: Activity
-- 
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | machine_id     | int     |
-- | process_id     | int     |
-- | activity_type  | enum    |
-- | timestamp      | float   |
-- +----------------+---------+
-- (machine_id, process_id, activity_type) is the primary key (combination of columns with unique values) of this table.
-- machine_id is the ID of a machine.
-- process_id is the ID of a process running on the machine with ID machine_id.
-- activity_type is an ENUM (category) of type ('start', 'end').
-- timestamp is a float representing the current time in seconds.
-- 'start' means the machine starts the process at the given timestamp and 'end' means the machine ends the process at the given timestamp.
-- The 'start' timestamp will always be before the 'end' timestamp for every (machine_id, process_id) pair.
-- 
-- Approach:
-- 1. Calculate Total Time: We calculate the total time taken by each machine to complete processes by summing up the timestamps for 'end' activities.
-- 2. Calculate Start Time: We calculate the total start time for each machine by summing up the timestamps for 'start' activities.
-- 3. Calculate Average Time: We compute the average time taken to complete a process for each machine by dividing the difference between total end time and start time by the number of processes.
-- 4. Return Result: We return the result table containing machine_id along with the average processing time rounded to 3 decimal places.

-- SQL Solution:
SELECT fin.machine_id,
       ROUND((fin.sum - debut.sum)::numeric / fin.count, 3) AS processing_time
FROM (
    SELECT machine_id, SUM(timestamp) AS sum, COUNT(machine_id)
    FROM Activity
    WHERE activity_type = 'end'
    GROUP BY machine_id
) AS fin
LEFT JOIN (
    SELECT machine_id, SUM(timestamp) AS sum
    FROM Activity
    WHERE activity_type = 'start'
    GROUP BY machine_id
) AS debut ON fin.machine_id = debut.machine_id;
