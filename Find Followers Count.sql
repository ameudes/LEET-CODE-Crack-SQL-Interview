-- Task:
-- For every user in the Followers table, return the total number of distinct
-- followers they have.  
-- The output must contain the columns:
--   • user_id  
--   • followers_count  
-- and be ordered by user_id in ascending order.

-- Table Layout:
-- Table: Followers
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | user_id     | int  |  -- the user being followed
-- | follower_id | int  |  -- the follower
-- +-------------+------+
-- (user_id, follower_id) is the composite primary key, so each follower can
-- follow a given user at most once.  Duplicate (user_id, follower_id) pairs do
-- not exist.

-- Approach:
-- 1. GROUP BY user_id so that each group represents one user.  
-- 2. Within each group, COUNT(DISTINCT follower_id) to obtain how many unique
--    followers that user has.  
-- 3. Select user_id and this count (aliased followers_count).  
-- 4. ORDER BY user_id ASC to satisfy the required ordering.

-- SQL Solution:
SELECT
    user_id,
    COUNT(DISTINCT follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;
