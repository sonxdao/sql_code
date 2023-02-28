--Which countries and cities are the best cocoa beans grown?
SELECT BroadBeanOrigin, SpecificBeanOrigin, Rating
FROM flavors_of_cacao
ORDER BY Rating DESC;

--Which countries produce the highest-rated bars, with a rating of 3.25 or higher?
SELECT Rating, CompanyLocation AS "Countries That Produce Bars with a 3.25 rating or higher" 
FROM flavors_of_cacao
WHERE Rating BETWEEN > 3.25;


--How many makers of chocolate bars originated in Belgium and Switzerland?
SELECT COUNT (DISTINCT Company_Maker_if_known) AS "Chocolate Bar Makers from Belgium and Switzerland"
FROM flavors_of_cacao
WHERE CompanyLocation IN ('Belgium', 'Switzerland');


--What’s the relationship between cocoa solids percentage and rating?
SELECT CORR(CocoaPercent, Rating) AS correlation_coefficient
FROM flavors_of_cacao;


--How many reviews were done on Criollo, Trinitario, and a combination of the two bean types, where the review date were in 2013?
SELECT COUNT(*) as ReviewDate
FROM (SELECT CAST(ReviewDate AS VARCHAR) AS ReviewDate, BeanType
             FROM flavors_of_cacao
             WHERE ReviewDate = 2013) AS subquery
WHERE BeanType LIKE '%Criollo%' 
	OR Beantype LIKE '%Trinitario%';


--How many first-time chocolate bars makers were rated in 2015?
SELECT COUNT (DISTINCT Company_Maker_if_known)
FROM flavors_of_cacao
WHERE ReviewDate BETWEEN '2015-01-01' AND '2015-12-31 23:59:59.999'
AND ReviewDate NOT IN
        (SELECT Company_Maker_if_known FROM flavors_of_cacao
        WHERE ReviewDate < '2015-01-01');