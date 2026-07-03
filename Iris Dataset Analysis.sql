/* 1) How many records are there? */
SELECT count(*) as Total_Records
FROM Iris;

/* 2) How many types of species are there in 
dataset? */
SELECT DISTINCT Species
FROM Iris;

/* 3) How many flowers are there 
in each species */
SELECT Species, count(*) as Total
from Iris
Group By Species;

/* 4) Avg sepal length of all flowers */
SELECT AVG(SepalLengthCm) 
as Avg_Sepal_Length
FROM Iris;

/* 5) What is the biggest petal length? */
SELECT MAX(PetalLengthCm)
as Max_Petal_Length
FROM Iris;

/* 6) Demonstrate all flowers with Sepal length
more than 6? */
SELECT * from Iris 

where SepalLengthCm > 6;

/* 7) Avg petal width 
according to Species */
SELECT Species, AVG(PetalWidthCm)
as Avg_Petal_Width
FROM Iris
group by Species;

/* 8) Max sepal length from each species? */
SELECT Species, MAX(SepalLengthCm)
as Max_Sepal_Length
from Iris
group by Species;

/* 9) Show the flowers whose 
Petal Length is greater than 
the average of the entire dataset. */
SELECT * FROM Iris 
where PetalLengthCm > 
(SELECT AVG(PetalLengthCm) 
 from Iris);

/* 10) Rank the species based on average 
sepal length (from highest to lowest). */
SELECT Species, AVG(SepalLengthCm)
as Avg_Sepal_Length,
RANK() OVER(ORDER BY AVG(SepalLengthCm)
            DESC) AS Ranking
FROM Iris
Group BY Species;
