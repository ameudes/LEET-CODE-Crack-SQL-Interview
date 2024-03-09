-- Problem Statement: Write a solution to find the name, population, and area of the big countries.

-- Given Table: World
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | name        | varchar |
-- | continent   | varchar |
-- | area        | int     |
-- | population  | int     |
-- | gdp         | bigint  |
-- +-------------+---------+
-- name is the primary key (column with unique values) for this table.
-- Each row of this table gives information about the name of a country, the continent to which it belongs, its area, the population, and its GDP value.
-- 
-- Approach: To find the name, population, and area of the big countries, we can query the name, population, and area from the World table where either the area is at least 3 million (i.e., 3,000,000 km2) or the population is at least 25 million (i.e., 25,000,000).
-- 
-- SQL Solution:
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;
