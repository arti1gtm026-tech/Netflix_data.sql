CREATE DATABASE netflix_data
USE netflix_data

SELECT * FROM netflix_titles

--1. Count the number of Movies vs TV Shows.

SELECT  type, COUNT(*)
FROM netflix_titles
GROUP BY type;

--2. Find the most common rating for movies and TV shows.

WITH rating_count AS (
SELECT type,rating,COUNT(*) AS Total_rating,
RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) AS rating_rank
FROM netflix_titles
GROUP BY type, rating
)

SELECT type, rating, Total_rating, rating_rank
FROM rating_count
WHERE rating_rank = 1

--3. List all movies released in a specific year (e.g., 2020).

SELECT type, title , release_year
FROM netflix_titles
WHERE release_year = 2020 AND type = 'Movie'

--4. Find the top 5 countries with the most content on Netflix.

SELECT TOP 5 

--5. Identify the longest movie.

--6. Find content added in the last 5 years.

--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

SELECT type,director
FROM netflix_titles
WHERE director = 'Rajiv Chilaka'

--8. List all TV shows with more than 5 seasons.
SELECT type , duration
FROM netflix_titles 
WHERE duration > '5 seasons' AND type= 'TV show'

--9. Count the number of content items in each genre.

SELECT 

--10. Find each year and the average number of content releases in India on Netflix.
   -- Return the top 5 years with the highest average content releases!

--11. List all movies that are documentaries.

--12. Find all content without a director.

--13. Find how many movies actor 'Salman Khan' appeared in the last 10 years!

--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

--15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. Label content 
--containing these keywords as 'Bad' and all other content as 'Good'. Count how many items fall into each category.