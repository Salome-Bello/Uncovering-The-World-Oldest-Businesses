--CREATING THE DATABASE
CREATE DATABASE oldest_businesses;

--SWITCHING TO THE DATABASE
USE oldest_businesses;

-- QUESTIONS & SOLUTIONS
-- 1. What is the oldest business on each continent?
SELECT
	CT.continent,
	CT.country,
	AB.business,
	AB.year_founded
FROM 
	all_businesses AS AB
JOIN 
	countries AS CT
ON 
	AB.country_code = CT.country_code
JOIN (
	SELECT
		CT.continent,
		MIN(AB.year_founded) AS Earliest_Business_Year
	FROM 
		all_businesses AS AB
	JOIN 
		countries AS CT
	ON 
		AB.country_code = CT.country_code
	GROUP BY 
		CT.continent
	  ) AS SubQ
ON 
	CT.continent = SubQ.continent AND AB.year_founded = SubQ.Earliest_Business_Year;




-- 2. How many countries per continent lack data on the oldest businesses?
SELECT
	CT.continent,
	COUNT(CT.country_code) AS countries_without_businesses
FROM 
	countries AS CT
LEFT JOIN 
	all_businesses AS AB
ON 
	CT.country_code = AB.country_code
WHERE 
	AB.country_code IS NULL
GROUP BY 
	CT.continent




-- 3. Which business categories are best suited to last many years, and on what continent are they?
SELECT
	c.continent,
	cat.category,
	MIN(b.year_founded) AS year_founded
FROM 
	businesses b
INNER JOIN 
	categories cat
ON 
	b.category_code = cat.category_code
INNER JOIN 
	countries c
ON 
	b.country_code = c.country_code
GROUP BY
	c.continent, cat.category
ORDER BY
	c.continent, cat.category; 


-----------------------------------------------------------------------------------------------------------------