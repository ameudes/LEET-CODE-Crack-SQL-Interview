-- Problem Statement
-- ------------------------------------------------------------------
-- Table: Products
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |  -- product identifier
-- | new_price     | int     |  -- price after a change
-- | change_date   | date    |  -- date on which the price changed
-- +---------------+---------+
-- (product_id, change_date) is the composite primary key, so a product can have
-- at most one price-change row per day.
--
-- Requirement  
-- -----------  
-- Determine the price of **every** product on **2019-08-16**.  
-- • Before a product’s first recorded change, its price is assumed to be **10**.  
-- • If the product has one or more changes on or before 2019-08-16, use the
--   latest change *on or before* that date.  
-- Return a result set with columns:
--   – product_id  
--   – price        (price in effect on 2019-08-16)  
-- Order of the rows does not matter.

-- Approach
-- ------------------------------------------------------------------
-- 1. `temp` CTE — For every product, locate the **most recent** change_date that
--    is ≤ '2019-08-16'.  
-- 2. `list_prod` CTE — Build a list of **all** distinct product_id values that
--    appear in Products (some products may have no change before the cut-off).  
-- 3. Final SELECT  
--      • LEFT JOIN `list_prod` to `temp` to keep every product.  
--      • Join to Products again to fetch the `new_price` that matches the
--        (product_id, latest change_date) pair.  
--      • If no matching change exists (NULL), substitute 10 via `COALESCE`.  
--      • Return product_id and resolved price; optional ORDER BY for clarity.


-- ------------------------------------------------------------------
WITH temp AS (
    SELECT
        product_id,
        MAX(change_date) AS max
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
),
list_prod AS (
    SELECT DISTINCT product_id
    FROM Products
)
SELECT
    list_prod.product_id AS product_id,
    COALESCE(Products.new_price, 10) AS price
FROM   list_prod
LEFT  JOIN temp     ON list_prod.product_id = temp.product_id
LEFT  JOIN Products ON list_prod.product_id = Products.product_id
                   AND temp.max            = Products.change_date
ORDER BY product_id;
