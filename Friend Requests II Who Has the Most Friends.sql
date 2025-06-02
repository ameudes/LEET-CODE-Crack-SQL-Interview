-- Problem Statement
-- ------------------------------------------------------------------
-- Table: RequestAccepted
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | requester_id   | int     |  -- user who sent the friend request
-- | accepter_id    | int     |  -- user who accepted the request
-- | accept_date    | date    |  -- date the request was accepted
-- +----------------+---------+
-- (requester_id, accepter_id) is the composite primary key.
--
-- Two users become “friends” when a request is accepted (regardless of who
-- initiated it).  We need to identify:
--   • The single person who has the greatest total number of friends.
--   • That maximum friend-count.
-- The test data guarantee that exactly one user has the highest count.

-- Approach
-- ------------------------------------------------------------------
-- 1.  Build two subtotals:
--       a. For each requester_id, count distinct accepter_id values.
--       b. For each accepter_id,  count distinct requester_id values.
-- 2.  UNION ALL those two result sets so each friendship contributes to both
--     participants’ counts.
-- 3.  In the outer query, GROUP BY the user id and SUM the two partial counts
--     to obtain each person’s total friends.
-- 4.  ORDER BY the summed count descending and LIMIT 1 to return the single
--     user with the most friends (and the friend-count).

------------------------------------------------------------------
SELECT id,
       SUM(num) AS num
FROM (
        SELECT requester_id AS id,
               COUNT(DISTINCT accepter_id) AS num
        FROM   RequestAccepted
        WHERE  accept_date IS NOT NULL
        GROUP  BY requester_id

        UNION ALL

        SELECT accepter_id AS id,
               COUNT(DISTINCT requester_id) AS num
        FROM   RequestAccepted
        WHERE  accept_date IS NOT NULL
        GROUP  BY accepter_id
     ) AS t
GROUP BY id
ORDER BY num DESC
LIMIT 1;
