-- 1: Orders with TotalPrice above average

WITH avg_price AS (
    SELECT AVG(TotalPrice) AS avg_tp
    FROM restaurant.restaurantorders
)
SELECT *
FROM restaurant.restaurantorders
WHERE TotalPrice > (SELECT avg_tp FROM avg_price);

/*I used a CTE to calculate the average TotalPrice once and reused it in the main query for better readability.*/

-- 2. Customers whose total spending > average spending

WITH customer_total AS (
    SELECT CustomerName,
           SUM(TotalPrice) AS total_spent
    FROM restaurant.restaurantorders
    GROUP BY CustomerName
)
SELECT *
FROM customer_total
WHERE total_spent >
      (SELECT AVG(total_spent) FROM customer_total);
      
/* GROUP BY,Aggregate,CTE reuse ,Nested logic */

-- 3.CTE vs CORRELATED SUBQUERY
WITH customer_avg AS (
    SELECT CustomerName,
           AVG(TotalPrice) AS avg_tp
    FROM restaurant.restaurantorders
    GROUP BY CustomerName
)
SELECT r.*
FROM restaurant.restaurantorders r
JOIN customer_avg c
ON r.CustomerName = c.CustomerName
WHERE r.TotalPrice > c.avg_tp;

-- 4.MULTIPLE CTEs (ADVANCED BUT EASY)
-- Top spending customers per category
WITH category_total AS (
    SELECT ItemCategory,
           CustomerName,
           SUM(TotalPrice) AS total_spent
    FROM restaurant.restaurantorders
    GROUP BY ItemCategory, CustomerName
),
category_avg AS (
    SELECT ItemCategory,
           AVG(total_spent) AS avg_spent
    FROM category_total
    GROUP BY ItemCategory
)
SELECT c.*
FROM category_total c
JOIN category_avg a
ON c.ItemCategory = a.ItemCategory
WHERE c.total_spent > a.avg_spent;