-- Problem Statement: Write a solution to find all the authors that viewed at least one of their own articles.

-- Given Table: Views
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | article_id    | int     |
-- | author_id     | int     |
-- | viewer_id     | int     |
-- | view_date     | date    |
-- +---------------+---------+
-- There is no primary key (column with unique values) for this table, the table may have duplicate rows.
-- Each row of this table indicates that some viewer viewed an article (written by some author) on some date. 
-- Note that equal author_id and viewer_id indicate the same person.
-- 
-- Approach: To find all the authors that viewed at least one of their own articles, we can query the distinct author_id from the Views table where author_id is equal to viewer_id.
-- 
-- SQL Solution:
SELECT DISTINCT author_id as id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id;
