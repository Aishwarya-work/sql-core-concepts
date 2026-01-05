SELECT * FROM restaurant.restaurantorders;

/* 1. Single-Row Subquery */
-- ONE TABLE
-- Orders with TotalPrice less than average TotalPrice
SELECT * FROM restaurant.restaurantorders
WHERE TotalPrice < (SELECT AVG(TotalPrice) as AVG_TP FROM restaurant.restaurantorders);
/* First, the subquery calculates the average total price of all orders. 
Then, the main query fetches orders whose total price is less than that average. */

-- Find the highest TotalPrice
SELECT MAX(TotalPrice) FROM restaurant.restaurantorders
WHERE TotalPrice = (SELECT MAX(TotalPrice) FROM restaurant.restaurantorders);

-- -- Find the 2ND highest TotalPrice
SELECT MAX(TotalPrice) FROM restaurant.restaurantorders 
WHERE TotalPrice < (SELECT MAX(TotalPrice) FROM restaurant.restaurantorders);

-- Orders placed on the latest OrderDate
SELECT * FROM restaurant.restaurantorders
WHERE OrderDate = (SELECT MAX(OrderDate) AS latest_OrderDate FROM restaurant.restaurantorders);

/* 2 TABLE */

-- 1.Find customers whose total order value is greater than the average order value of ALL customers
SELECT c.customer_name
FROM customers c
WHERE c.customer_id IN
(
  SELECT o.customer_id
  FROM orders o
  GROUP BY o.customer_id
  HAVING SUM(o.totalprice) >
        (SELECT AVG(totalprice) FROM orders)
);

-- -------------------------------------------------------------------------------------------------------------------

/* Multi-row subquery */

-- 1 TABLE
-- Customers who placed more than one order
SELECT *
FROM restaurant.restaurantorders
WHERE CustomerName IN
      (SELECT CustomerName
       FROM restaurant.restaurantorders
       GROUP BY CustomerName
       HAVING COUNT(*) > 1);
       
select * from restaurant.restaurantorders;

-- 2.TABLE

-- 2.Customers who ordered on the LATEST order date(Subquery returns multiple customer names)e

SELECT *
FROM restaurantorders
WHERE CustomerName IN
(
  SELECT CustomerName
  FROM restaurantorders
  WHERE OrderDate =
        (SELECT MAX(OrderDate) FROM restaurantorders)
);

-- 3.Orders belonging to Top-spending customers (Subquery returns a list of customers)

SELECT *
FROM restaurantorders
WHERE CustomerName IN
(
  SELECT CustomerName
  FROM restaurantorders
  GROUP BY CustomerName
  HAVING SUM(TotalPrice) > 1000
);


-- ---------------------------------------------------------------------------------------------------------------
-- -- Orders where TotalPrice is greater than that customer’s average order value
SELECT *
FROM restaurantorders r1
WHERE TotalPrice >
      (SELECT AVG(TotalPrice)
       FROM restaurantorders r2
       WHERE r2.CustomerName = r1.CustomerName);

-- 2.Orders with rating higher than the average rating for that waiter
SELECT *
FROM restaurantorders r1
WHERE Rating >
      (
        SELECT AVG(Rating)
        FROM restaurantorders r2
        WHERE r2.WaiterName = r1.WaiterName
      );

-- 3.Orders whose TotalPrice is higher than average price of that ItemCategory
SELECT *
FROM restaurantorders r1
WHERE TotalPrice >
      (
        SELECT AVG(TotalPrice)
        FROM restaurantorders r2
        WHERE r2.ItemCategory = r1.ItemCategory
      );

