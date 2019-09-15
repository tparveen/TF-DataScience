### Checkpoint 5: Drills

* looking at all the columns in the vehicle table

select column_name,data_type 
from information_schema.columns 
where table_name = 'vehicles';


"id"	"integer"
"make"	"character varying"
"model"	"character varying"
"year"	"integer"
"class"	"character varying"
"trans"	"character varying"
"drive"	"character varying"
"cyl"	"smallint"
"displ"	"real"
"fuel"	"character varying"
"hwy"	"smallint"
"cty"	"smallint"

1. How many records are in the vehicles table? Provide the query you’d use to determine this as well as the answer to the question.

SELECT COUNT(*) 
FROM vehicles

"33442"

2. Write a query that returns all the records in the vehicles table.

SELECT * 
FROM vehicles

3. Write a query that returns the id, make, and model fields for all the records for 2010 vehicles.

SELECT id, make, model
FROM vehicles
WHERE year = 2010

4. Write a query that returns the count of vehicles from 2010. Also provide the answer.

SELECT id, make, model
FROM vehicles
WHERE year = 2010

-- 1109 rows 


5. Write a query that returns the count of vehicles in the vehicles table between the years 2010 and 2015, inclusive. Provide the query as well as the answer.

SELECT COUNT(*)
FROM vehicles
WHERE year BETWEEN 2010 AND 2015

"5995"

6. Write a query that returns the count of vehicles from the years 1990, 2000, and 2010. Provide the query and the result.

SELECT COUNT(*)
FROM vehicles
WHERE year IN(1990, 2000, 2010)

"3026"


7. Write a query that returns the count of all records between 1987 and 2005, exclusive of the years 1990 and 2000.

SELECT COUNT(*)
FROM vehicles
WHERE year BETWEEN 1987 AND 2005  ---- "19152"
AND year NOT IN (1990, 2000) 

"17235" rows


8. Write a query that returns the year, make, model, and a field called average_mpg that calculates the average highway/city fuel consumption. (For example, if hwy is 24 and cty is 20, then average_mpg = (24 + 20)/ 2 = 22.)

SELECT year, make, model, hwy/cty AS average_mpg
FROM vehicles

They are all 1s and 0s

33442 rows

1984	"AM General"	"DJ Po Vehicle 2WD"		17	18	0
1984	"AM General"	"DJ Po Vehicle 2WD"		17	18	0
1984	"AM General"	"FJ8c Post Office"		13	13	1
1984	"AM General"	"FJ8c Post Office"		13	13	1
1985	"AM General"	"Post Office DJ5 2WD"	17	16	1
1985	"AM General"	"Post Office DJ8 2WD"	13	13	1
1987	"ASC Incorporated"	"GNX"				21	14	1


9. Write a query that returns the year, make, model, and a text field displaying “X highway; Y city.” (For example, if hwy is 24 and cty is 20, then hwy_city is “24 highway; 20 city.”)

SELECT DISTINCT year, make, model, CONCAT(hwy, ' highway; ', cty, ' city.') AS highway_and_city
FROM vehicles


Do we use distinct or not?

33442 rows DISTINCT 30090


10. Write a query that returns the id, make, model, and year for all records that have NULL for either the cyl or displ fields.

SELECT id, make, model, year,  -- cyl, displ
FROM vehicles
WHERE cyl IS NULL OR displ IS NULL

58 rows


11. Write a query that returns all fields for records with rear-wheel drive and diesel vehicles since 2000, inclusive. Also sort by year and highway mileage, both descending. Hint: to view the distinct values in a field, you can use DISTINCT. For example, use SELECT DISTINCT(drive) FROM vehicles; to get the unique values that appear in that field, or use SELECT DISTINCT(fuel) FROM vehicles;.

SELECT DISTINCT * 
FROM vehicles
WHERE drive = 'Rear-Wheel Drive' 
AND fuel = 'Diesel'
AND year >= 2000
ORDER BY year DESC, hwy DESC


19 rows


34050	"BMW"	"328d"	2014	"Compact Cars"	"Automatic (S8)"	"Rear-Wheel Drive"	4	"2"	"Diesel"	45	32
34396	"Mercedes-Benz"	"E250 Bluetec"	2014	"Midsize Cars"	"Automatic 7-spd"	"Rear-Wheel Drive"	4	"2.1"	"Diesel"	42	28
34172	"BMW"	"535d"	2014	"Midsize Cars"	"Automatic (S8)"	"Rear-Wheel Drive"	6	"3"	"Diesel"	38	26
34568	"Jeep"	"Grand Cherokee 2WD"	2014	"Standard Sport Utility Vehicle 2WD"	"Automatic 8-spd"	"Rear-Wheel Drive"	6	"3"	"Diesel"	30	22



12. Write a query that counts the number of vehicles that are either Fords or Chevrolets and either compact cars or 2-seaters. Provide the query and the answer.


SELECT count(*) 
FROM vehicles
WHERE make IN('Ford','Chevrolet') -- 6268 
AND class IN('Compact Cars', '2-Seater')

Could not find any 2-seaters 

503 rows 


13. Write a query that returns the records for 10 vehicles with the highest highway fuel mileage.

SELECT *
FROM vehicles
ORDER BY hwy DESC
Limit 10


10 rows


33640	"Chevrolet"	"Spark EV"	2014	"Subcompact Cars"	"Automatic (A1)"	"Front-Wheel Drive"			"Electricity"	109	128
34392	"Fiat"	"500e"	2014	"Minicompact Cars"	"Automatic (A1)"	"Front-Wheel Drive"					"Electricity"	108	122
33396	"Fiat"	"500e"	2013	"Minicompact Cars"	"Automatic (A1)"	"Front-Wheel Drive"					"Electricity"	108	122
33307	"Scion"	"iQ EV"	2013	"Minicompact Cars"	"Automatic (variable gear ratios)"	"Front-Wheel Drive"	"Electricity"	105	138
33905	"Honda"	"Fit EV"	2014	"Small Station Wagons"	"Automatic (A1)"	"Front-Wheel Drive"			"Electricity"	105	132
33265	"Honda"	"Fit EV"	2013	"Small Station Wagons"	"Automatic (A1)"	"Front-Wheel Drive"			"Electricity"	105	132
33558	"Nissan"	"Leaf"	2013	"Midsize Cars"	"Automatic (A1)"	"Front-Wheel Drive"					"Electricity"	102	129
34699	"Nissan"	"Leaf"	2014	"Midsize Cars"	"Automatic (A1)"	"Front-Wheel Drive"					"Electricity"	101	126
34918	"Nissan"	"Leaf"	2015	"Midsize Cars"	"Automatic (A1)"	"Front-Wheel Drive"					"Electricity"	101	126
34130	"Ford"	"Focus Electric"	2014	"Compact Cars"	"Automatic (A1)"	"Front-Wheel Drive"			"Electricity"	99	110





14. Write a query that returns all the records of vehicles since the year 2000 whose model name starts with a capital X. Sort the list A through Z by make. What happens when you use a lowercase “x” instead?



SELECT *
FROM vehicles
WHERE year >=2000 AND model LIKE 'X%'
ORDER BY make

469 rows... 



SELECT *
FROM vehicles
WHERE year >=2000 AND model LIKE 'x%'
ORDER BY make

40 rows

SELECT *
FROM vehicles
WHERE year >=2000 AND model ILIKE 'X%'
ORDER BY make

509 rows


SELECT *
FROM vehicles
WHERE year >=2000 AND model ILIKE 'x%'
ORDER BY make

No effect since ILIKE is used... if we used LIKE would be an issue...


15. Write a query that returns the count of records where the “cyl” field is NULL. Provide the query as well as the answer.

SELECT count (*)
FROM vehicles
WHERE cyl IS NULL

"58" 




16. Write a query that returns the count of all records before the year 2000 that got more than 20 mpg hwy and had greater than 3 liters displacement (“displ” field). Provide the query as well as the answer.


SELECT count (*)
FROM vehicles
WHERE year <2000 
AND hwy > 20
AND displ > 3 

"1964" 


17. Write a query that returns all records whose model name has a (capital) X in its 3rd position. Hint: make sure your wildcard operator accommodates for any characters after the “X”!

SELECT *
FROM vehicles
WHERE model LIKE '__X%'

188 rows

