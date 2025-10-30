-- Report: CustomerName, Email, and TotalNumberofOrders (including zero orders)
-- Use the new database
USE ECommerceDB;

SELECT
    C.CustomerName,
    C.Email,
    -- COUNT(O.OrderID) counts the number of non-NULL OrderIDs associated with the customer.
    -- Because we use LEFT JOIN, customers with no orders will still be returned,
    -- and their corresponding COUNT will correctly be 0.
    COUNT(O.OrderID) AS TotalNumberofOrders
FROM
    Customers C
-- Use LEFT JOIN to ensure ALL records from the left table (Customers) are included,
-- even if they have no matching records in the right table (Orders).
LEFT JOIN
    Orders O ON C.CustomerID = O.CustomerID
-- Group the results by customer details so COUNT aggregates orders for each unique customer.
GROUP BY
    C.CustomerID, C.CustomerName, C.Email
-- Order the final report alphabetically by CustomerName.
ORDER BY
    C.CustomerName;