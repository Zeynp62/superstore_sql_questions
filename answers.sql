-- 1. What are the product ids and sales for orders shipped using the Same Day ship mode?
-- Prompt: WHERE and SELECT
SELECT
	PRODUCT_ID,
	SALES
FROM
	ORDERS
WHERE
	SHIP_MODE = 'Same Day';
-- 2. Which customers have postal codes that start with '56' and have a sales value greater than or equal to $10?
-- Prompt: WHERE and SELECT
SELECT DISTINCT
	C.CUSTOMER_ID,
	C.CUSTOMER_NAME,
	O.POSTAL_CODE,
	O.SALES
FROM
	CUSTOMERS C
	JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE
	O.POSTAL_CODE LIKE '56%'
	AND O.SALES >= 10;
--or without joind beased on orders table only:
SELECT DISTINCT
	CUSTOMER_ID,
	SALES
FROM
	ORDERS
WHERE
	POSTAL_CODE LIKE '56%'
	AND SALES >= 10
ORDER BY
	CUSTOMER_ID;
-- 3. Which product ids have the word 'chair' in their name and
-- are shipped using the Second Class ship mode? Order the result by sales in descending order.
-- Prompt: WHERE, ILIKE, and ORDER BY
SELECT
	O.PRODUCT_ID
FROM
	ORDERS O
	JOIN PRODUCTS P ON O.PRODUCT_ID = P.PRODUCT_ID
WHERE
	P.PRODUCT_NAME ILIKE '%chair%'
	AND O.SHIP_MODE = 'Second Class'
ORDER BY
	O.SALES DESC;
-- 4. What are the product ids and sales for orders with a ship mode of 'Same Day' or 'First Class'?
-- Prompt: WHERE and SELECT with IN
SELECT product_id,
       sales
FROM orders
WHERE ship_mode IN ('Same Day', 'First Class');

--with OR
SELECT
	PRODUCT_ID,
	SALES
FROM
	ORDERS
WHERE
	SHIP_MODE = 'Same Day'
	OR SHIP_MODE = 'First Class';
-- 5. What is the total sales for orders with a quantity greater than 1 and a ship mode not equal to 'Standard Class'?
-- Prompt: WHERE and SELECT with != or <>
SELECT
	SUM(SALES)
FROM
	ORDERS
WHERE
	QUANTITY > 1
	AND SHIP_MODE != 'Standard Class';
-- 6. What are the product ids and sales for orders shipped using a ship mode that contains the word "Class"?
-- Prompt: WHERE and SELECT with ILIKE
SELECT
	PRODUCT_ID,
	SALES
FROM
	ORDERS
WHERE
	SHIP_MODE ILIKE '%Class%';
-- 7. What are the product ids, sales, and quantity for orders with a sales value
-- greater than or equal to $20 and a quantity between 2 and 5?
-- Prompt: WHERE, SELECT, and BETWEEN
SELECT
	PRODUCT_ID,
	SALES,
	QUANTITY
FROM
	ORDERS
WHERE
	SALES >= 20
	AND QUANTITY BETWEEN 2 AND 5;
-- 8. What are the product ids and sales for orders where the product id
-- starts with 'OFF' and the ship mode is not 'Standard Class' or 'Second Class'?
-- Prompt: WHERE, SELECT, and NOT IN
SELECT
	PRODUCT_ID,
	SALES
FROM
	ORDERS
WHERE
	PRODUCT_ID LIKE 'OFF%'
	AND SHIP_MODE NOT IN ('Standard Class', 'Second Class');a
-- 9. What is the average sales value for products with a discount greater than 20%?
-- Prompt: WHERE and AVG
SELECT
	ROUND(AVG(SALES),2) AS average_sales
FROM
	ORDERS
WHERE
	DISCOUNT > 0.2;
-- 10. What is the highest and lowest sales values for orders shipped using the 'Same Day' ship mode?
-- Prompt: WHERE, SELECT, MAX, and MIN
SELECT
	MAX(SALES) AS max_sales,
	MIN(SALES) AS min_sales
FROM
	ORDERS
WHERE
	SHIP_MODE = 'Same Day';
-- 11. How many unique postal codes are associated with orders in the region 3?
-- Prompt: WHERE and COUNT DISTINCT
SELECT
	COUNT(DISTINCT POSTAL_CODE)
FROM
	ORDERS
WHERE
	REGION_ID = 3;
-- 12.write a querey that shows all the columns from the products table
-- then sorts the results by category and only show the 1st 5 rows
SELECT
	*
FROM
	PRODUCTS
ORDER BY
	CATEGORY
LIMIT 5;

-- 13.write a querey that returns the product id and product name for each item
SELECT
	PRODUCT_ID,
	PRODUCT_NAME
FROM
	PRODUCTS;
-- 14.write a querey that shows the product name with the highest product cost to consumer
SELECT
	PRODUCT_NAME,
	PRODUCT_COST_TO_CONSUMER
FROM
	PRODUCTS
ORDER BY
	PRODUCT_COST_TO_CONSUMER DESC
LIMIT 1;
-- 15.write a querey that shows the ship mode with the lowest discount
SELECT
	SHIP_MODE,
	DISCOUNT
FROM
	ORDERS
WHERE DISCOUNT>0
ORDER BY
	DISCOUNT ASC
LIMIT 1;
-- 16.write a querey that shows the return quantity for each product id, order by the highest return quantity
SELECT 
    product_id,
    SUM(return_quantity) AS total_return_quantity
FROM returns
GROUP BY product_id
ORDER BY total_return_quantity DESC;