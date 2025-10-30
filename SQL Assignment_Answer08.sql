-- Query to retrieve product details along with the name of the associated category.
USE ECommerceDB;
SELECT
    P.ProductName,
    P.Price,
    P.StockQuantity,
    C.CategoryName -- Retrieve the name from the joined Categories table
FROM
    Products P
-- Use an INNER JOIN because we only want products that successfully link to an existing category.
INNER JOIN
    Categories C ON P.CategoryID = C.CategoryID
-- Order the results first by CategoryName, and then alphabetically by ProductName.
ORDER BY
    C.CategoryName ASC,
    P.ProductName ASC;
