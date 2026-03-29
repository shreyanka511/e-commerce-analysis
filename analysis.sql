SELECT * FROM amazon_sales;
-- 1. Total Revenue
SELECT SUM(amount) 
AS Revenue 
FROM amazon_sales;

-- 2. Total No. of unique orders
SELECT COUNT(DISTINCT orderid) FROM amazon_sales;

-- 3. Orders by status - Which order occurs the most
SELECT MAX(status) 
FROM amazon_sales
GROUP BY status;

-- 4. Which categories generate most revenue
SELECT SUM(amount)
AS Revenue, category
FROM amazon_sales
GROUP BY category
ORDER BY SUM(amount) DESC
LIMIT 3; 

-- 5. Top 5 states by orders
SELECT COUNT(shipstate)
AS States, shipstate
FROM amazon_sales
GROUP BY shipstate
ORDER BY States DESC
LIMIT 5;

-- 6. Average revenue per order
SELECT ROUND(SUM(amount) / COUNT(DISTINCT orderid), 2)
FROM amazon_sales;

