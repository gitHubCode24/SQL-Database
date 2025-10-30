-- =================================================================================
-- SAKILA VIDEO RENTALS ANALYSIS REPORTS
-- =================================================================================

-- Use the new database
USE Sakila;

-- Task 1: Identify the top 5 customers based on the total amount they've spent.
---------------------------------------------------------------------------------
SELECT
    C.First_Name,
    C.Last_Name,
    C.Email,
    SUM(P.amount) AS Total_Amount_Spent
FROM
    customer C
JOIN
    payment P ON C.customer_id = P.customer_id
GROUP BY
    C.customer_id, C.first_name, C.last_name, C.email
ORDER BY
    total_amount_spent DESC
LIMIT 5;


-- Task 2: Which 3 movie categories have the highest rental counts?
---------------------------------------------------------------------------------
SELECT
    CAT.name AS Category_Name,
    COUNT(R.rental_id) AS Rental_Count
FROM
    category CAT
JOIN
    film_category FC ON CAT.category_id = FC.category_id
JOIN
    inventory I ON FC.film_id = I.film_id
JOIN
    rental R ON I.inventory_id = R.inventory_id
GROUP BY
    CAT.name
ORDER BY
    rental_count DESC
LIMIT 3;


-- Task 3: Calculate how many films are available at each store and how many of those have never been rented.
---------------------------------------------------------------------------------
SELECT
    S.store_id,
    COUNT(I.inventory_id) AS Total_Inventory_Items,
    -- Count inventory items that have NO corresponding rental record.
    SUM(CASE WHEN R.rental_id IS NULL THEN 1 ELSE 0 END) AS Never_Rented_Count
FROM
    store S
JOIN
    inventory I ON S.store_id = I.store_id
LEFT JOIN
    -- LEFT JOIN to rental table to identify items that do NOT have a rental history.
    rental R ON I.inventory_id = R.inventory_id
GROUP BY
    S.store_id
ORDER BY
    S.store_id;


-- Task 4: Show the total revenue per month for the year 2005 (Standard Sakila Data Year) to analyze business seasonality.
-- NOTE: Sakila data typically covers the year 2005. Adjust the YEAR() condition if your data set is different.
---------------------------------------------------------------------------------
SELECT
    -- Format the date to show the month number and name
    DATE_FORMAT(payment_date, '%Y-%m') AS Payment_Month,
    SUM(amount) AS Total_Monthly_Revenue
FROM
    payment
WHERE
    YEAR(payment_date) = 2005 -- Filtering for the year 2005
GROUP BY
    payment_month
ORDER BY
    payment_month;


-- Task 5: Identify customers who have rented more than 10 times in the last 6 months.
-- The calculation below uses a fixed reference date for demonstration.
---------------------------------------------------------------------------------
SELECT
    C.first_name,
    C.last_name,
    C.email,
    COUNT(R.rental_id) AS Rentals_in_last_6_Months
FROM
    customer C
JOIN
    rental R ON C.customer_id = R.customer_id
WHERE
    -- Assuming the latest data in the Sakila DB is around '2006-02-14', we look back 6 months.
    R.rental_date >= DATE_SUB('2006-02-14', INTERVAL 6 MONTH)
GROUP BY
    C.customer_id, C.first_name, C.last_name, C.email
HAVING
    COUNT(R.rental_id) > 10
ORDER BY
    rentals_in_last_6_months DESC;
