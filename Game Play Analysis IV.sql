-- Task:
-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places.
-- In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date,
-- then divide that number by the total number of players.

-- Given Table: Activity
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key (combination of columns with unique values) of this table.
-- This table shows the activity of players of some games.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.

-- Approach:
-- 1. We first create a temporary table (CTE) that identifies the first login date for each player using the MIN() function with the PARTITION BY clause.
-- 2. We then check if there are players who logged in on the day after their first login date. This is done by checking if the difference between the current `event_date` and the player's first login date (`min`) is 1.
-- 3. We count the distinct number of players who logged in for at least two consecutive days.
-- 4. Finally, we calculate the fraction by dividing the count of players with at least two consecutive logins by the total number of distinct players.

-- SQL Solution:
WITH temp AS (
    SELECT *, MIN(event_date) OVER(PARTITION BY player_id) AS min
    FROM Activity
)
SELECT ROUND(
    (SELECT COUNT(DISTINCT player_id) FROM temp WHERE event_date - min = 1)::numeric / 
    (SELECT COUNT(DISTINCT player_id) FROM Activity)::numeric,
    2
) AS fraction;
