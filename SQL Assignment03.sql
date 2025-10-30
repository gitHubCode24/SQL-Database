SELECT
    C.first_name,
    C.last_name,
    C.email,
    SUM(P.amount) AS total_amount_spent
FROM
    customer C
JOIN
    payment P ON C.customer_id = P.customer_id
GROUP BY
    C.customer_id, C.first_name, C.last_name, C.email
ORDER BY
    total_amount_spent DESC
LIMIT 10      -- Show 10 records (Page Size)
OFFSET 20;    -- Skip the first 20 records (Pages 1 and 2)