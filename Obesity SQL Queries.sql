use Nutrition_Paradox;
show tables;
select * from obesity;

-- Query 1.Top 5 Regions with Highest Average Obesity in 2022 --
SELECT Region, AVG(Mean_estimate) AS avg_obesity
FROM obesity
WHERE Year = 2022
GROUP BY Region
ORDER BY avg_obesity DESC
LIMIT 5;

-- Query 2. Top 5 Countries with Highest Obesity Estimates --
SELECT Country, MAX(Mean_estimate) AS peak_obesity
FROM obesity
GROUP BY Country
ORDER BY peak_obesity DESC
LIMIT 5;

-- Query 🇮🇳 3. Obesity Trend in India Over the Years --
SELECT Year, AVG(Mean_estimate) AS avg_obesity
FROM obesity
WHERE Country = 'India'
GROUP BY Year
ORDER BY Year;

-- Query 🚻 4. Average Obesity by Gender --
SELECT Gender, AVG(Mean_estimate) AS avg_obesity
FROM obesity
GROUP BY Gender;

-- Query 🔢 5. Country Count by Obesity Category and Age Group
SELECT Obesity_Level, Age_group, COUNT(DISTINCT Country) AS country_count
FROM obesity
GROUP BY Obesity_Level, Age_group;

describe obesity;

-- Query 📉 6. Most and Least Reliable Countries (CI_Width) --
-- Least reliable: highest average CI_Width
SELECT Country, AVG(CI_Width) AS avg_ci
FROM obesity
GROUP BY Country
ORDER BY avg_ci DESC
LIMIT 5;
  -- Most consistent: lowest average CI_Width
SELECT Country, AVG(CI_Width) AS avg_ci
FROM obesity
GROUP BY Country
ORDER BY avg_ci ASC
LIMIT 5;

-- Query 🎂 7. Average Obesity by Age Group
SELECT Age_group, AVG(Mean_estimate) AS avg_obesity
FROM obesity
GROUP BY Age_group;

-- Query 8. Top 10 Countries with Consistent Low Obesity
SELECT Country, AVG(Mean_estimate) AS avg_obesity, AVG(CI_Width) AS avg_ci
FROM obesity
GROUP BY Country
HAVING avg_obesity < 10 AND avg_ci < 2
ORDER BY avg_obesity ASC, avg_ci ASC
LIMIT 10;

-- Query 🙋‍♀️🙋 9. Countries Where Female Obesity Exceeds Male by Large Margin
SELECT f.Country, f.Year, f.Mean_estimate - m.Mean_estimate AS diff
FROM obesity f
JOIN obesity m ON f.Country = m.Country AND f.Year = m.Year
WHERE f.Gender = 'Female' AND m.Gender = 'Male'
AND f.Mean_estimate - m.Mean_estimate > 10
ORDER BY diff DESC;

-- Query 🌍 10. Global Average Obesity Percentage Per Year
SELECT Year, AVG(Mean_estimate) AS global_avg
FROM obesity
GROUP BY Year
ORDER BY Year;

