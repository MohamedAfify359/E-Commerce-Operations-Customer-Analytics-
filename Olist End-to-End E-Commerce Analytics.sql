Create Database E_Commerce
use E_Commerce


SELECT TOP 10 *
FROM FactSales;

SELECT TOP 10 *
FROM DimCustomers;

SELECT TOP 10 *
FROM DimProducts;

SELECT TOP 10 *
FROM DimSellers;

SELECT TOP 10 *
FROM DimDate;



SELECT COUNT(*)
FROM FactSales
WHERE order_id IS NULL


SELECT
COUNT(*) AS TotalRows,
COUNT(DISTINCT customer_id) AS DistinctCustomers
FROM DimCustomers

SELECT
COUNT(*) ,
COUNT(DISTINCT product_id)
FROM DimProducts

SELECT COUNT(*)
FROM FactSales f
LEFT JOIN DimCustomers c
ON f.customer_id = c.customer_id
WHERE c.customer_id IS NULL


SELECT
    ROUND(SUM(total_revenue), 2) AS Total_Revenue,
    ROUND(SUM(price), 2) AS Product_Revenue,
    ROUND(SUM(freight_value), 2) AS Freight_Revenue,
    COUNT(DISTINCT order_id) AS Total_Orders,
    COUNT(DISTINCT customer_id) AS Total_Customers,
    COUNT(DISTINCT product_id) AS Total_Products,
    COUNT(DISTINCT seller_id) AS Total_Sellers
FROM FactSales;


SELECT
    order_status,
    COUNT(DISTINCT order_id) AS Total_Orders,
    ROUND(SUM(total_revenue), 2) AS Total_Revenue
FROM FactSales
GROUP BY order_status
ORDER BY Total_Revenue DESC;

SELECT
    d.year,
    d.month,
    d.month_name,
    ROUND(SUM(f.total_revenue), 2) AS Total_Revenue,
    COUNT(DISTINCT f.order_id) AS Total_Orders
FROM FactSales f
JOIN DimDate d
    ON CAST(f.order_date AS date) = CAST(d.date AS date)
GROUP BY
    d.year,
    d.month,
    d.month_name
ORDER BY
    d.year,
    d.month;



    SELECT TOP 10
    p.product_category_name_english,
    ROUND(SUM(f.total_revenue), 2) AS Total_Revenue,
    COUNT(DISTINCT f.order_id) AS Total_Orders
FROM FactSales f
JOIN DimProducts p
    ON f.product_id = p.product_id
GROUP BY p.product_category_name_english
ORDER BY Total_Revenue DESC;


SELECT TOP 10
    c.customer_state,
    COUNT(DISTINCT c.customer_unique_id) AS Total_Customers
FROM DimCustomers c
GROUP BY c.customer_state
ORDER BY Total_Customers DESC;


SELECT TOP 10
    c.customer_state,
    ROUND(SUM(f.total_revenue), 2) AS Total_Revenue,
    COUNT(DISTINCT f.order_id) AS Total_Orders
FROM FactSales f
JOIN DimCustomers c
    ON f.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY Total_Revenue DESC;


SELECT
    payment_type,
    COUNT(DISTINCT order_id) AS Total_Orders,
    ROUND(SUM(payment_value), 2) AS Total_Payment_Value
FROM FactSales
GROUP BY payment_type
ORDER BY Total_Payment_Value DESC;


SELECT TOP 10
    order_id,
    order_date,
    delivered_date,
    estimated_delivery_date,
    delivery_days,
    delay_days
FROM FactSales;

SELECT
    ROUND(AVG(CAST(delay_days AS FLOAT)),2) AS Avg_Delay_Days
FROM FactSales
WHERE delay_days IS NOT NULL;


SELECT
    ROUND(
        COUNT(
            DISTINCT CASE
                WHEN delay_days > 0 THEN order_id
            END
        ) * 100.0
        /
        COUNT(DISTINCT order_id),
        2
    ) AS Delayed_Orders_Percentage
FROM FactSales;

SELECT
    CASE
        WHEN delay_days <= 0 THEN 'On Time'
        WHEN delay_days > 0 THEN 'Delayed'
        ELSE 'Not Delivered'
    END AS Delivery_Status,

    COUNT(DISTINCT order_id) AS Total_Orders

FROM FactSales

GROUP BY
    CASE
        WHEN delay_days <= 0 THEN 'On Time'
        WHEN delay_days > 0 THEN 'Delayed'
        ELSE 'Not Delivered'
    END;


    SELECT TOP 10
    c.customer_state,

    ROUND(
        AVG(
            CAST(f.delivery_days AS FLOAT)
        ),
        2
    ) AS Avg_Delivery_Days

FROM FactSales f

JOIN DimCustomers c
ON f.customer_id = c.customer_id

WHERE f.delivery_days IS NOT NULL

GROUP BY c.customer_state

ORDER BY Avg_Delivery_Days DESC;



SELECT
    review_score,
    COUNT(DISTINCT order_id) AS Total_Orders,
    ROUND(SUM(total_revenue), 2) AS Total_Revenue
FROM FactSales
GROUP BY review_score
ORDER BY review_score;


WITH CategoryRevenue AS
(
    SELECT
        p.product_category_name_english AS Category,
        ROUND(SUM(f.total_revenue), 2) AS Total_Revenue
    FROM FactSales f
    JOIN DimProducts p
        ON f.product_id = p.product_id
    GROUP BY p.product_category_name_english
)
SELECT *
FROM CategoryRevenue
ORDER BY Total_Revenue DESC;



WITH MonthlyRevenue AS
(
    SELECT
        d.year,
        d.month,
        d.month_name,
        SUM(f.total_revenue) AS Total_Revenue
    FROM FactSales f
    JOIN DimDate d
        ON CAST(f.order_date AS date) = CAST(d.date AS date)
    GROUP BY
        d.year,
        d.month,
        d.month_name
)
SELECT
    year,
    month,
    month_name,
    ROUND(Total_Revenue, 2) AS Total_Revenue,
    ROUND(
        LAG(Total_Revenue) OVER (ORDER BY year, month),
        2
    ) AS Previous_Month_Revenue,
    ROUND(
        Total_Revenue - LAG(Total_Revenue) OVER (ORDER BY year, month),
        2
    ) AS Revenue_Difference
FROM MonthlyRevenue
ORDER BY year, month;



SELECT
    p.product_category_name_english AS Category,
    ROUND(SUM(f.total_revenue), 2) AS Category_Revenue
FROM FactSales f
JOIN DimProducts p
    ON f.product_id = p.product_id
GROUP BY p.product_category_name_english
HAVING SUM(f.total_revenue) >
(
    SELECT AVG(Category_Total_Revenue)
    FROM
    (
        SELECT
            p2.product_category_name_english,
            SUM(f2.total_revenue) AS Category_Total_Revenue
        FROM FactSales f2
        JOIN DimProducts p2
            ON f2.product_id = p2.product_id
        GROUP BY p2.product_category_name_english
    ) AS x
)
ORDER BY Category_Revenue DESC;



SELECT TOP 10
    s.seller_id,
    s.seller_state,
    ROUND(SUM(f.total_revenue), 2) AS Total_Revenue,
    COUNT(DISTINCT f.order_id) AS Total_Orders
FROM FactSales f
JOIN DimSellers s
    ON f.seller_id = s.seller_id
GROUP BY
    s.seller_id,
    s.seller_state
ORDER BY Total_Revenue DESC;