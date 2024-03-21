USE PizzaDB

--KPI REQUIREMENTS

--TOTAL REVENUE

SELECT SUM(total_price) AS Total_Revenue from pizza_sales_excel_file

--AVERAGE ORDER VALUE

SELECT * FROM pizza_sales_excel_file

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_order_value FROM pizza_sales_excel_file

--TOTAL PIZZA SOLD

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales_excel_file

--TOTAL ORDERS

SELECT COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales_excel_file

--AVERAGE PIZZA PER ORDER

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/ 
CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2)) AS Avg_pizza_order from pizza_sales_excel_file

--Problem statement
--charts requirements

--Daily trends of total orders

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders
from pizza_sales_excel_file
GROUP BY DATENAME(DW, order_date)

--Monthly trends for total orders

SELECT DATENAME(MONTH, order_date) AS month_name, COUNT(DISTINCT order_id) AS Total_orders
from pizza_sales_excel_file
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_orders DESC

--Percentage of sales by pizza category

SELECT pizza_category, CAST(sum(total_price) AS DECIMAL(10,2)) AS total_sales, CAST(sum(total_price) * 100 / (SELECT sum(total_price) from pizza_sales_excel_file) AS DECIMAL(10,2)) AS PCT
from pizza_sales_excel_file
GROUP BY pizza_category
ORDER BY PCT

--percentage of sales by pizza size

SELECT pizza_size, CAST(sum(total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(sum(total_price) * 100 / (SELECT sum(total_price) from pizza_sales_excel_file) AS DECIMAL(10,2)) AS PCT
from pizza_sales_excel_file
GROUP BY pizza_size
ORDER BY PCT DESC

--Total pizza sold by pizza category
SELECT pizza_category, sum(quantity) as Total_Quantity_Sold
from pizza_sales_excel_file
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

--Top 5 pizza by revenue

SELECT TOP 5 pizza_name, sum(total_price) AS Total_revenue FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_revenue DESC

--Bottom 5 pizza by revenue

SELECT TOP 5 pizza_name, sum(total_price) AS Total_revenue from pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_revenue ASC

--Top 5 pizza by quantity

SELECT TOP 5 pizza_name, sum(quantity) AS Total_quantity from pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_quantity DESC

--Bottom 5 pizza by quantity

SELECT TOP 5 pizza_name, sum(quantity) AS Total_quantity from pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_quantity ASC

--Top 5 pizza by orders

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_orders from pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_orders DESC

--Bottom 5 pizza by orders

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_orders from pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_orders ASC
