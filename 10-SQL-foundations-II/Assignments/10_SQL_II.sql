https://courses.thinkful.com/dsbc-sql-foundations-2-v1/checkpoint/4

select column_name,data_type 
from information_schema.columns 
where table_name = 'ksprojects';



"id"	"integer"
"name"	"text"
"category"	"text"
"main_category"	"text"
"deadline"	"timestamp without time zone"
"goal"	"real"
"launched"	"timestamp without time zone"
"state"	"text"
"backers"	"integer"
"country"	"text"
"usd_pledged"	"real"
"currency"	"text"
"pledged"	"real"



1. Write a query that returns a list of all the unique values in the 'country' field.

SELECT DISTINCT country 
FROM ksprojects

22 rows


2. How many unique values are there for the main_category field? What about for the category field?

SELECT COUNT(DISTINCT main_category) 
FROM ksprojects

15


SELECT COUNT(DISTINCT category) 
FROM ksprojects

158

3. Get a list of all the unique combinations of main_category and category fields, sorted A to Z by main_category.

SELECT DISTINCT main_category, category
FROM ksprojects
GROUP BY main_category, category

165

4. How many unique categories are in each main_category?

SELECT main_category, COUNT(DISTINCT category)
FROM ksprojects
GROUP BY main_category
ORDER BY main_category;

15 rows


"Art"	"13"
"Comics"	"6"
"Crafts"	"15"
"Dance"	"5"
"Design"	"7"
"Fashion"	"9"
"Film & Video"	"20"
"Food"	"13"
"Games"	"8"
"Journalism"	"6"
"Music"	"18"
"Photography"	"7"
"Publishing"	"15"
"Technology"	"16"
"Theater"	"7"

5. Write a query that returns the average number of backers per main_category, rounded to the nearest whole number and sorted from high to low.

SELECT main_category, ROUND(AVG(backers),0) AS avg_backers
FROM ksprojects
GROUP BY main_category
ORDER BY avg_backers DESC

15 rows 

"Games"	"342"
"Design"	"254"
"Technology"	"167"
"Comics"	"138"
"Fashion"	"68"
"Film & Video"	"59"
"Food"	"56"
"Publishing"	"50"
"Music"	"48"
"Theater"	"44"
"Dance"	"43"
"Journalism"	"40"
"Art"	"40"
"Photography"	"39"
"Crafts"	"25"



6. Write a query that shows, for each category, how many campaigns were successful and the average difference per project between dollars pledged and the goal.


SELECT category, COUNT (state) as Success, ROUND(AVG(usd_pledged-goal)::numeric,2) as pledge_diff
FROM ksprojects
WHERE state = 'successful'
GROUP BY category


157 rows 

"Faith"	"65"	"852.63"
"Audio"	"18"	"-14052.02"
"Kids"	"25"	"1353.96"
"Webcomics"	"55"	"13975.82"
"Embroidery"	"1"	"117.00"
"Events"	"26"	"857.29"
"Childrenswear"	"11"	"742.21"
"Fabrication Tools"	"11"	"174421.81"
"Electronic Music"	"123"	"1824.20"
"DIY"	"38"	"1655.78"
"Festivals"	"83"	"1427.05"


ANSWER from CURRIC: (same answer)

SELECT category, avg(usd_pledged - goal) as raised_over_goal, count(*)
FROM ksprojects
WHERE state = 'successful'
GROUP BY category;


7. Write a query that shows, for each main category, how many projects had zero backers for that category and the largest goal amount for that category (also for projects with zero backers).

SELECT DISTINCT main_category, backers, goal
FROM ksprojects
where backers = 0


SELECT DISTINCT main_category, COUNT(backers)
FROM ksprojects
WHERE backers = 0
GROUP BY main_category


SELECT DISTINCT main_category, Max(goal) as Max_goal, COUNT(backers) as backer_count, 
FROM ksprojects
WHERE backers = 0
GROUP BY main_category



"Art"	        "683"	"1e+06"
"Comics"	    "88"	"200000"
"Crafts"	    "273"	"250000"
"Dance"	         "47"	"60000"
"Design"	    "317"	"1e+07"
"Fashion"	    "761"	"385000"
"Film & Video"	"1869"	"1e+08"
"Food"			"770"	"9.9e+07"
"Games"			"437"	"6.72668e+06"
"Journalism"	"219"	"1e+08"
"Music"	"1656"	"5e+07"
"Photography"	"384"	"1e+07"
"Publishing"	"1320"	"1e+06"
"Technology"	"911"	"3.925e+07"
"Theater"	    "151"	"3e+06"


****  ANSWER from CURRIC: (same answer)

SELECT main_category, MAX(goal), COUNT(*)
FROM ksprojects
WHERE backers = 0
GROUP BY main_category;


"Art"			"1e+06"	"683"
"Fashion"		"385000"	"761"
"Music"			"5e+07"	"1656"
"Crafts"		"250000"	"273"
"Photography"	"1e+07"	"384"
"Design"		"1e+07"	"317"
"Film & Video"	"1e+08"	"1869"
"Food"			"9.9e+07"	"770"
"Journalism"	"1e+08"	"219"
"Publishing"	"1e+06"	"1320"
"Dance"			"60000"	"47"
"Comics"	"200000"	"88"
"Theater"	"3e+06"	"151"
"Games"		"6.72668e+06"	"437"
"Technology"	"3.925e+07"	"911"


8. For each category, find the average USD per backer, and return only those results for which the average USD per backer is < $50, sorted high to low. Hint: Division by NULL is not possible, so use NULLIF to replace NULLs with 0 in the average calculation.

SELECT DISTINCT category, AVG(usd_pledged/ NULLIF(backers,0)) as avg_per_backer
FROM ksprojects
GROUP BY category


SELECT DISTINCT category, AVG(usd_pledged/NULLIF(backers,0)) as avg_per_backer
FROM ksprojects
GROUP BY category
Having AVG(usd_pledged/NULLIF(backers,0)) < 50
ORDER BY avg_per_backer DESC

46 rows



9. Write a query that shows, for each main_category, how many successful projects had between 5 and 10 backers.

SELECT DISTINCT main_category, COUNT(backers)
FROM ksprojects
WHERE state = 'successful' 
AND backers BETWEEN 5 AND 10 
GROUP BY main_category


15 rows 

"Art"	"109"
"Comics"	"10"
"Crafts"	"34"
"Dance"	"12"
"Design"	"26"
"Fashion"	"24"
"Film & Video"	"179"
"Food"	"31"
"Games"	"26"
"Journalism"	"11"
"Music"	"121"
"Photography"	"32"
"Publishing"	"75"
"Technology"	"23"
"Theater"	"48"

10. Get a total of the amount ‘pledged’ for each type of currency grouped by its respective currency. Sort by ‘pledged’ from high to low.

SELECT currency, SUM(pledged) as pledged_sum
FROM ksprojects
GROUP BY currency
ORDER BY pledged_sum DESC


13 rows

"USD"	"4.88021e+08"
"GBP"	"2.53959e+07"
"EUR"	"1.84007e+07"
"CAD"	"1.61769e+07"
"SEK"	"1.20611e+07"
"AUD"	"7.02466e+06"
"DKK"	"6.93123e+06"
"NOK"	"2.8271e+06"
"HKD"	"2.23249e+06"
"NZD"	"1.78806e+06"
"CHF"	"1.16314e+06"
"SGD"	"658930"
"MXN"	"514620"



11. Excluding Games and Technology records in the main_category field, return the total of all backers for successful projects by main_category where the total was more than 100,000. Sort by main_category from A to Z.

SELECT DISTINCT main_category, SUM(backers) as Total
FROM ksprojects
WHERE state = 'successful'
AND main_category NOT IN ('Games', 'Technology')
GROUP BY main_category
Having SUM(backers) > 100000
ORDER BY main_category



"Art"	"164632"
"Comics"	"229174"
"Design"	"1076918"
"Fashion"	"217830"
"Film & Video"	"575922"
"Food"	"200791"
"Music"	"411750"
"Publishing"	"291245"
