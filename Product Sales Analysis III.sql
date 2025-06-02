-- Task:
-- For each product in the Sales table, identify the earliest year it was sold
-- (its first_year) and return **all** sale rows for that product in that same
-- year.
-- The result must contain the columns:
--   • product_id  
--   • first_year  (the earliest year that product appears)  
--   • quantity  
--   • price  
-- The output may be returned in any order.

-- Table Layout:
-- Table: Sales
-- +-------------+-------+
-- | Column Name | Type  |
-- +-------------+-------+
-- | sale_id     | int   |  -- together with year, forms the composite PK
-- | product_id  | int   |  -- FK to Product table
-- | year        | int   |  -- sale year
-- | quantity    | int   |  -- units sold in this sale
-- | price       | int   |  -- per-unit price
-- +-------------+-------+
-- Notes:
-- • (sale_id, year) is the primary key (rows are unique per sale per year).  
-- • A product can have multiple sales rows in the same year.  
-- • The price column stores the per-unit price.

-- Approach:
-- 1. For every row in Sales we determine that product’s earliest year by using a
--    correlated sub-query:  MIN(year) WHERE sub.product_id = Sales.product_id.
-- 2. We keep only the rows whose year equals that earliest year, i.e. the sales
--    that happened in the product’s first year on record.
-- 3. We select the requested columns, aliasing year as first_year.
--    Because the filter already isolates the correct rows, no GROUP BY is
--    required.

-- SQL Solution:
SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM Sales
WHERE year = (
        SELECT MIN(year)
        FROM Sales AS sub
        WHERE sub.product_id = Sales.product_id
);
