-- Problem Statement: Query the NAME field for all American cities in the CITY table with populations larger than 120,000. The CountryCode for America is USA.

-- SQL Solution:
SELECT NAME
FROM CITY
WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA';
