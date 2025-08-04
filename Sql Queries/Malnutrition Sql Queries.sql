use Nutrition_Paradox;
show tables;
select * from malnutrition;

-- Query 1: Avg. malnutrition by age group
SELECT Age_Group, AVG(Mean_Estimate) AS Avg_Malnutrition
FROM Malnutrition
GROUP BY Age_Group;

-- Query 2: Top 5 countries with highest malnutrition (mean_estimate)
SELECT Country, AVG(Mean_Estimate) AS Avg_Malnutrition
FROM Malnutrition
GROUP BY Country
ORDER BY Avg_Malnutrition DESC
LIMIT 5;

-- Query 3: Malnutrition trend in African region over the years
SELECT Year, AVG(Mean_Estimate) AS African_Trend
FROM Malnutrition
WHERE Region = 'Africa'
GROUP BY Year
ORDER BY Year;

-- Query 4: Gender-based average malnutrition
SELECT Gender, AVG(Mean_Estimate) AS Avg_Malnutrition
FROM Malnutrition
GROUP BY Gender;

-- Query 5: Malnutrition level-wise (average CI_Width by age group)
SELECT Age_Group, AVG(CI_Width) AS Avg_CI_Width
FROM Malnutrition
GROUP BY Age_Group;

-- Query 6: Yearly malnutrition change in specific countries (India, Nigeria, Brazil)
SELECT Country, Year, AVG(Mean_Estimate) AS Avg_Malnutrition
FROM Malnutrition
WHERE Country IN ('India', 'Nigeria', 'Brazil')
GROUP BY Country, Year
ORDER BY Country, Year;

-- Query 7: Regions with lowest malnutrition averages
SELECT Region, AVG(Mean_Estimate) AS Avg_Malnutrition
FROM Malnutrition
GROUP BY Region
ORDER BY Avg_Malnutrition ASC
LIMIT 5;

-- Query 8: Countries with increasing malnutrition
SELECT Country, MAX(Mean_Estimate) - MIN(Mean_Estimate) AS Increase
FROM Malnutrition
GROUP BY Country
HAVING Increase > 0
ORDER BY Increase DESC;

-- Query 9: Min/Max malnutrition levels year-wise comparison
SELECT Year,
       MIN(Mean_Estimate) AS Min_Malnutrition,
       MAX(Mean_Estimate) AS Max_Malnutrition
FROM Malnutrition
GROUP BY Year
ORDER BY Year;

-- Query 10: High CI_Width flags for monitoring (CI_Width > 5)
SELECT Country, Year, Age_Group, Gender, CI_Width
FROM Malnutrition
WHERE CI_Width > 5
ORDER BY CI_Width DESC;
