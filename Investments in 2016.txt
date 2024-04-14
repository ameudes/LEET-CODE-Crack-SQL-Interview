-- Problem Statement: Report the sum of all total investment values in 2016 (tiv_2016) for policyholders who:
-- 1. Have the same total investment value in 2015 (tiv_2015) as one or more other policyholders, and
-- 2. Are not located in the same city as any other policyholder (unique (lat, lon) attribute pairs).
-- Round tiv_2016 to two decimal places.

-- Given Table: Insurance
-- 
-- +-------------+-------+
-- | Column Name | Type  |
-- +-------------+-------+
-- | pid         | int   |
-- | tiv_2015    | float |
-- | tiv_2016    | float |
-- | lat         | float |
-- | lon         | float |
-- +-------------+-------+
-- pid is the primary key (column with unique values) for this table.
-- Each row of this table contains information about one policy where:
-- pid is the policyholder's policy ID.
-- tiv_2015 is the total investment value in 2015, and tiv_2016 is the total investment value in 2016.
-- lat is the latitude of the policyholder's city. It's guaranteed that lat is not NULL.
-- lon is the longitude of the policyholder's city. It's guaranteed that lon is not NULL.
-- 
-- Approach:
-- 1. Filter Policies with Same Total Investment Value in 2015:
--    - We first identify policies where the total investment value (tiv_2015) matches that of one or more other policyholders.
--    - This is done by grouping the policies by tiv_2015 and filtering out groups with a count greater than 1.
-- 
-- 2. Filter Policies with Unique Location:
--    - We then filter out policies where the policyholder's location (lat, lon) is not unique.
--    - This ensures that each policyholder is in a unique city, as determined by their latitude and longitude coordinates.
-- 
-- 3. Calculate Sum of Total Investment Values in 2016:
--    - After filtering, we sum up the total investment values in 2016 (tiv_2016) for the remaining policies.
-- 
-- 4. Round Total Investment Values in 2016:
--    - Finally, we round the sum of tiv_2016 to two decimal places.
-- 
-- SQL Solution:
SELECT ROUND(SUM(tiv_2016::numeric), 2) AS tiv_2016 
FROM Insurance
WHERE pid NOT IN (
    SELECT a.pid 
    FROM Insurance a 
    LEFT JOIN Insurance b ON a.lat = b.lat AND a.lon = b.lon
    WHERE a.pid != b.pid
) 
AND tiv_2015 IN (
    SELECT tiv_2015 
    FROM insurance 
    GROUP BY tiv_2015 
    HAVING COUNT(tiv_2015) != 1
);
