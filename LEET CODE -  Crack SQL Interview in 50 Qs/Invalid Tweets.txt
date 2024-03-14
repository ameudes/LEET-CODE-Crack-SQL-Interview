-- Problem Statement: Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

-- Given Table: Tweets
-- 
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | tweet_id       | int     |
-- | content        | varchar |
-- +----------------+---------+
-- tweet_id is the primary key (column with unique values) for this table.
-- This table contains all the tweets in a social media app.
-- 
-- Approach: To find the IDs of the invalid tweets, we can query the tweet_id from the Tweets table where the length of the content is strictly greater than 15.
-- 
-- SQL Solution:
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
