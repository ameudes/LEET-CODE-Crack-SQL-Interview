-- Given Table:
-- Table: Cinema
-- +----------------+----------+
-- | Column Name    | Type     |
-- +----------------+----------+
-- | id             | int      |
-- | movie          | varchar  |
-- | description    | varchar  |
-- | rating         | float    |
-- +----------------+----------+
-- id is the primary key (column with unique values) for this table.
-- Each row contains information about the name of a movie, its genre, and its rating.
-- rating is a 2 decimal places float in the range [0, 10]

-- Approach:
-- 1. We use a SELECT statement to query the Cinema table.
-- 2. We filter rows using a WHERE clause to select movies with odd-numbered IDs (id % 2 != 0) and descriptions that are not "boring" (description != 'boring').
-- 3. The result is then sorted in descending order based on the rating column using the ORDER BY clause.

-- SQL Solution:
SELECT *
FROM Cinema
WHERE id % 2 != 0 AND description != 'boring'
ORDER BY rating DESC;
