-- Problem Statement: Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
--                    Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

-- Given Table: Movies
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | title         | varchar |
-- +---------------+---------+
-- movie_id is the primary key (column with unique values) for this table.
-- title is the name of the movie.
-- 
-- Given Table: Users
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- +---------------+---------+
-- user_id is the primary key (column with unique values) for this table.
-- 
-- Given Table: MovieRating
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | user_id       | int     |
-- | rating        | int     |
-- | created_at    | date    |
-- +---------------+---------+
-- (movie_id, user_id) is the primary key (column with unique values) for this table.
-- This table contains the rating of a movie by a user in their review.
-- created_at is the user's review date.
-- 
-- Approach: 
-- 1. To find the name of the user who has rated the greatest number of movies, we can count the number of movies rated by each user, order them in descending order, and select the top user. If there's a tie, we return the lexicographically smaller user name.
-- 2. To find the movie name with the highest average rating in February 2020, we can filter the reviews for February 2020, calculate the average rating for each movie, order them in descending order, and select the top movie. If there's a tie, we return the lexicographically smaller movie name.
-- 
-- SQL Solution:
WITH temp1 AS (
    SELECT MovieRating.movie_id, MovieRating.user_id, MovieRating.rating, MovieRating.created_at, Movies.title, Users.name
    FROM MovieRating
    LEFT JOIN Movies ON Movies.movie_id = MovieRating.movie_id
    LEFT JOIN Users ON Users.user_id = MovieRating.user_id
),
temp2 AS (
    SELECT name
    FROM temp1
    ORDER BY COUNT(temp1.movie_id) OVER (PARTITION BY temp1.name) DESC, name ASC
    LIMIT 1
),
temp3 AS (
    SELECT title
    FROM temp1 
    WHERE created_at <= '2020-02-29' AND created_at >= '2020-02-01'
    ORDER BY AVG(rating) OVER (PARTITION BY title) DESC, title ASC
    LIMIT 1
)
SELECT name AS results FROM temp2
UNION ALL
SELECT title AS results FROM temp3;
