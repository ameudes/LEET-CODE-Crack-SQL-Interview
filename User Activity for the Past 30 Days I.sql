-- Problem Statement:
-- Find the daily active-user count for each of the 30 days ending on (and
-- including) 2019-07-27.  
-- A user is considered active on a given day if they performed **at least one**
-- activity of any type on that day.

-- Approach:
-- 1. Filter rows whose `activity_date` falls within the 30-day window
--    **2019-06-28 through 2019-07-27**, inclusive.  
-- 2. For each remaining date, count the **distinct** `user_id` values; this gives
--    the number of unique users who were active that day.  
-- 3. Return `activity_date` (aliased as `day`) alongside the computed count.  
-- 4. The problem statement allows the result in any order, but grouping by the
--    date naturally produces one row per day.

-- SQL Solution:
SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'    -- inclusive 30-day window
GROUP BY activity_date;
