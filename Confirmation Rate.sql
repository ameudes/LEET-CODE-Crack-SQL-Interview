-- Problem Statement:
-- Write a solution to find the confirmation rate of each user.

-- Given Tables:
-- Table: Signups
-- +----------------+----------+
-- | Column Name    | Type     |
-- +----------------+----------+
-- | user_id        | int      |
-- | time_stamp     | datetime |
-- +----------------+----------+
-- user_id is the column of unique values for this table.
-- Each row contains information about the signup time for the user with ID user_id.

-- Table: Confirmations
-- +----------------+----------+
-- | Column Name    | Type     |
-- +----------------+----------+
-- | user_id        | int      |
-- | time_stamp     | datetime |
-- | action         | ENUM     |
-- +----------------+----------+
-- (user_id, time_stamp) is the primary key (combination of columns with unique values) for this table.
-- user_id is a foreign key (reference column) to the Signups table.
-- action is an ENUM (category) of the type ('confirmed', 'timeout').
-- Each row of this table indicates that the user with ID user_id requested a confirmation message at time_stamp and that confirmation message was either confirmed ('confirmed') or expired without confirming ('timeout').

-- Approach:
-- We LEFT JOIN the Signups table with the Confirmations table to join users who requested confirmation messages with their corresponding confirmation actions.
-- Then, we calculate the confirmation rate for each user by counting the number of 'confirmed' messages and dividing it by the total number of requested confirmation messages.
-- If a user did not request any confirmation messages, their confirmation rate is considered as 0.

-- SQL Solution:
SELECT user_id,
       CASE
           WHEN conf IS NULL THEN 0
           ELSE conf
       END AS confirmation_rate
FROM (
    SELECT S.user_id, ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END), 2) AS conf
    FROM Signups AS S
    LEFT JOIN Confirmations AS C ON S.user_id = C.user_id
    GROUP BY S.user_id
) AS F;
