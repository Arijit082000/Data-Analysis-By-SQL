-- Apple Product Analysis SQL Queries
-- Run these after creating/loading the 'iphones' table.

SELECT * FROM iphones LIMIT 5;


/*1. Extract all the information only for
iPhones with a "Star Rating" higher than 4.6.*/
SELECT *
FROM iphones
WHERE "Star Rating" > 4.6;


/*2. Show the "Product Name" and
"Sale Price" of the top 5 most
expensive phones (according to Sale Price).*/

SELECT "Product Name", "Sale Price"
FROM iphones
ORDER BY "Sale Price" DESC
LIMIT 5;


/*3. Find out how many different sizes
of "Ram" the iPhones have in this dataset.*/

SELECT DISTINCT Ram
FROM iphones;


/*4. List the phones that have no
discount (i.e. "Discount Percentage" 0).*/
SELECT "Product Name", "Sale Price", "Discount Percentage"
FROM iphones
WHERE "Discount Percentage" = 0;


/*5. Show the "Product Name" and "Number Of
Reviews" of iPhones with "Number Of Ratings"
greater than 50,000.*/
SELECT "Product Name", "Number Of Reviews", "Number Of Ratings"
FROM iphones
WHERE "Number Of Ratings" > 50000;


/*6. Find the average sale price of
phones of each "Ram" size (e.g. 2 GB, 4 GB).*/
SELECT Ram, AVG("Sale Price") AS Average_Sale_Price
FROM iphones
GROUP BY Ram;


/*7. Find the names of the top 3 phones with the highest "Discount Percentage".
If multiple phones have the same discount, show the ones with the lowest "Sale Price"
first in the list.*/
SELECT "Product Name", "Discount Percentage", "Sale Price"
FROM iphones
ORDER BY "Discount Percentage" DESC, "Sale Price" ASC
LIMIT 3;


/*8. Determine the total "Number Of Reviews" (SUM)
of phones that only have a 4.6 "Star Rating".*/
SELECT SUM("Number Of Reviews") AS Total_Reviews
FROM iphones
WHERE "Star Rating" = 4.6;


/*9. Find the "Product Name" and "Sale Price"
of phones whose price is higher than the average
"Sale Price" of the entire dataset.*/
SELECT "Product Name", "Sale Price"
FROM iphones
WHERE "Sale Price" > (SELECT AVG("Sale Price") FROM iphones);


/*10. Divide the phones into three categories
(Premium, Mid-range, Budget) according to their
"Sale Price" and count (COUNT) exactly how many
phones are in each category.*/
SELECT
    CASE
        WHEN "Sale Price" > 80000 THEN 'Premium'
        WHEN "Sale Price" BETWEEN 50000 AND 80000 THEN 'Mid-range'
        ELSE 'Budget'
    END AS Price_Category,
    COUNT(*) AS Total_Phones
FROM iphones
GROUP BY Price_Category;

