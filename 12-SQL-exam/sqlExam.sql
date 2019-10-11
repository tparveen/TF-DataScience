--1- Write a query that allows you to inspect the schema of the naep table

SELECT column_name,data_type 
FROM information_schema.columns 
WHERE table_name = 'naep'; 


-- 2. Write a query that returns the first 50 records of the naep table.
SELECT *
FROM  naep
<<<<<<< Local Changes
LIMIT 50


--50 rows


"232.171"	"268.312"	"216.42"	"257.687"	"2017_ALABAMA"	    "ALABAMA"	2017
"230.456"	"277.016"	"207.038"	"257.668"	"2017_ALASKA"	    "ALASKA"	2017
"234.436"	"282.248"	"215.466"	"262.957"	"2017_ARIZONA"  	"ARIZONA"	2017
"233.848"	"273.76"	"216.108"	"259.956"	"2017_ARKANSAS"	    "ARKANSAS"	2017
"232.263"	"276.638"	"215.422"	"262.521"	"2017_CALIFORNIA"	"CALIFORNIA"	2017


--3. Write a query that returns summary statistics for avg_math_4_score by state. Make sure to sort the results alphabetically by state name.
=======
LIMIT 50;
>>>>>>> External Changes

<<<<<<< Local Changes
--summary statistics include count, average, min, and max values.
=======
--3. Write a query that returns summary statistics for avg_math_4_score by state. Make sure to sort the results alphabetically by state name.
--summary statistics include count, average, min, and max values.
>>>>>>> External Changes

SELECT state, avg(avg_math_4_score)
FROM  naep
GROUP BY state
ORDER BY state


<<<<<<< Local Changes
"ALABAMA"	"224.5554545454545455"
"ALASKA"	"234.0097777777777778"
"ARIZONA"	"229.0680000000000000"
"ARKANSAS"	"229.9675454545454545"



-- 4. Write a query that alters the previous query so that it returns only the summary statistics for avg_math_4_score by state with differences in max and min values that are greater than 30.
=======
-- 4. Write a query that alters the previous query so that it returns only the summary statistics for avg_math_4_score by state with differences in max and min values that are greater than 30.
>>>>>>> External Changes

SELECT state, (MAX(avg_math_4_score) - MIN(avg_math_4_score)) as avg_math_4_score_diff
FROM  naep
GROUP BY state
HAVING (MAX(avg_math_4_score) - MIN(avg_math_4_score)) > 30

-- OR --- this will work too

WITH avg_math_4_score_diff AS
(SELECT state, (MAX(avg_math_4_score) - MIN(avg_math_4_score)) as max_min_diff
FROM  naep
GROUP BY state)
SELECT * from avg_math_4_score_diff

-- 5. Write a query that returns a field called bottom_10_states that lists the states in the bottom 10 for avg_math_4_score in the year 2000.

WITH bottom_10_states AS
(SELECT state, avg_math_4_score
FROM naep
WHERE year = 2000
AND avg_math_4_score IS NOT NULL
ORDER BY avg_math_4_score 
LIMIT 10)
SELECT state as bottom_10_states
FROM bottom_10_states

-- 10 rows

-- 6. Write a query that calculates the average avg_math_4_score rounded to the nearest 2 decimal places over all states in the year 2000.

SELECT state, ROUND(avg(avg_math_4_score),2)
FROM  naep
WHERE year = 2000
GROUP BY state

-- 51 rows

-- 7. Write a query that returns a field called below_average_states_y2000 that lists all states with an avg_math_4_score 
-- less than the average over all states in the year 2000.

<<<<<<< Local Changes
-- 5. Write a query that returns a field called bottom_10_states that lists the states in the bottom 10 for avg_math_4_score in the year 2000.

WITH bottom_10_states AS
(SELECT state, avg_math_4_score
FROM naep
WHERE year = 2000
AND avg_math_4_score IS NOT NULL
ORDER BY avg_math_4_score 
LIMIT 10)
SELECT state as bottom_10_states
FROM bottom_10_states



"DISTRICT_OF_COLUMBIA"	"193.29"
"MISSISSIPPI"	"210.97"
"CALIFORNIA"	"213.565"
"NEW_MEXICO"	"213.868"
"HAWAII"	"215.847"
"ARKANSAS"	"217.063"
"ALABAMA"	"217.941"
"LOUISIANA"	"217.964"
"ARIZONA"	"218.767"
"GEORGIA"	"219.557"
=======
>>>>>>> External Changes

<<<<<<< Local Changes
=======
SELECT DISTINCT state as below_average_states_y2000
FROM  naep
WHERE avg_math_4_score <
-- Average of all states for avg_math_4_score in the year 2000
(SELECT  AVG(avg_math_4_score)
FROM  naep
WHERE year = 2000)
>>>>>>> External Changes

-- 35 rows

-- 8. Write a query that returns a field called scores_missing_y2000 that lists any states with missing values 
-- in the avg_math_4_score column of the naep data table for the year 2000.

<<<<<<< Local Changes
SELECT state, ROUND(avg(avg_math_4_score),2)
FROM  naep
WHERE year = 2000
GROUP BY state

=======
SELECT state as scores_missing_y2000
FROM naep
WHERE avg_math_4_score is NULL
AND year = 2000
>>>>>>> External Changes

-- 10 rows

-- 9. Write a query that returns for the year 2000 the state, avg_math_4_score, and total_expenditure from the naep table left outer 
-- joined with the finance table, using id as the key and ordered by total_expenditure greatest to least. 

-- Be sure to round avg_math_4_score to the nearest 2 decimal places, and then filter out NULL avg_math_4_scores 
-- in order to see any correlation more clearly.

SELECT naep.state, ROUND(avg_math_4_score,2) as Ave_Math_Rounded, finance.total_expenditure
FROM naep LEFT OUTER JOIN finance
ON naep.id = finance.id
WHERE naep.year = 2000
ORDER BY finance.total_expenditure DESC

-- 51 rows

-- Be sure to round avg_math_4_score to the nearest 2 decimal places, and then filter out NULL avg_math_4_scores 
-- in order to see any correlation more clearly.

SELECT naep.state, ROUND(avg_math_4_score,2) as Ave_Math_Rounded, finance.total_expenditure
FROM naep LEFT OUTER JOIN finance
ON naep.id = finance.id
WHERE naep.year = 2000
AND avg_math_4_score IS NOT NULL
ORDER BY finance.total_expenditure DESC

-- 41 rows

