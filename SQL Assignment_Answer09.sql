-- Query using a CTE and a Window Function to find the top 2 most expensive products per category.
USE ECommerceDB;
WITH RankedProducts AS (
    -- 1. Join Products and Categories to get all necessary data in one set.
    SELECT
        C.CategoryName,
        P.ProductName,
        P.Price,
        -- Use RANK() to assign a rank based on Price within each Category.
        -- RANK() handles ties by giving them the same rank and skipping the next number.
        RANK() OVER (
            PARTITION BY C.CategoryName  -- Start a new ranking set for each CategoryName
            ORDER BY P.Price DESC       -- Rank based on Price, highest price is rank 1
        ) AS PriceRank
    FROM
        Products P
    INNER JOIN
        Categories C ON P.CategoryID = C.CategoryID
)
-- 2. Select final results from the CTE, filtering for the top 2 ranks.
SELECT
    CategoryName,
    ProductName,
    Price
FROM
    RankedProducts
WHERE
    PriceRank <= 2
ORDER BY
    CategoryName ASC,
    Price DESC; -- Order by Price Descending within the category for readability
