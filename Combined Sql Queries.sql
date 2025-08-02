show databases;
use Nutrition_paradox;
show tables;

-- Query 1: Obesity vs malnutrition comparison by country (any 5 countries)
SELECT o.Country,
       AVG(o.Mean_Estimate) AS Avg_Obesity,
       AVG(m.Mean_Estimate) AS Avg_Malnutrition
FROM Obesity o
JOIN Malnutrition m ON o.Country = m.Country AND o.Year = m.Year
WHERE o.Country IN ('India', 'USA', 'Brazil', 'Nigeria', 'Japan')
GROUP BY o.Country;

-- Query 2: Gender-based disparity in both obesity and malnutrition
SELECT o.Gender,
       AVG(o.Mean_Estimate) AS Avg_Obesity,
       AVG(m.Mean_Estimate) AS Avg_Malnutrition
FROM Obesity o
JOIN Malnutrition m ON o.Gender = m.Gender AND o.Year = m.Year AND o.Country = m.Country
GROUP BY o.Gender;

-- Query 3: Region-wise avg estimates side-by-side (Africa and America)
SELECT o.Region,
       AVG(o.Mean_Estimate) AS Avg_Obesity,
       AVG(m.Mean_Estimate) AS Avg_Malnutrition
FROM Obesity o
JOIN Malnutrition m ON o.Region = m.Region AND o.Year = m.Year
WHERE o.Region IN ('Africa', 'America')
GROUP BY o.Region;

-- Query 4: Countries with obesity up & malnutrition down
SELECT o.Country,
       MAX(o.Mean_Estimate) - MIN(o.Mean_Estimate) AS Obesity_Change,
       MIN(m.Mean_Estimate) - MAX(m.Mean_Estimate) AS Malnutrition_Change
FROM Obesity o
JOIN Malnutrition m ON o.Country = m.Country AND o.Year = m.Year
GROUP BY o.Country
HAVING Obesity_Change > 0 AND Malnutrition_Change > 0;

-- Query 5: Age-wise trend analysis
SELECT o.Age_Group, o.Year,
       AVG(o.Mean_Estimate) AS Avg_Obesity,
       AVG(m.Mean_Estimate) AS Avg_Malnutrition
FROM Obesity o
JOIN Malnutrition m ON o.Age_Group = m.Age_Group AND o.Year = m.Year
GROUP BY o.Age_Group, o.Year
ORDER BY o.Age_Group, o.Year;

