/*Meher Oke*/

USE PizzaDB;

CREATE VIEW ToppingPopularity AS
SELECT
	t.topping_TopName AS Topping,
	COALESCE(SUM(
		CASE
			WHEN pt.pizza_topping_IsDouble = 1 THEN 2
			WHEN pt.pizza_topping_IsDouble = 0 THEN 1
			ELSE 0
		END
	), 0) AS ToppingCount
FROM topping AS t
LEFT JOIN pizza_topping AS pt ON t.topping_TopID = pt.topping_TopID
GROUP BY t.topping_TopName
ORDER BY ToppingCount DESC, Topping ASC;

CREATE VIEW ProfitByPizza AS
SELECT
	pizza_Size AS Size,
	pizza_CrustType AS Crust,
	ROUND(SUM(pizza_CustPrice - pizza_BusPrice), 2) AS Profit,
	CONCAT(MONTH(pizza_PizzaDate), '/', YEAR(pizza_PizzaDate)) AS OrderMonth
FROM pizza
GROUP BY OrderMonth, pizza_Size, pizza_CrustType
ORDER BY Profit ASC;


CREATE VIEW ProfitByOrderType AS
SELECT
	ordertable_OrderType AS CustomerType,
	CONCAT(MONTH(ordertable_OrderDateTime), '/', YEAR(ordertable_OrderDateTime)) AS OrderMonth,
	ROUND(SUM(ordertable_CustPrice), 2) AS TotalOrderPrice,
	ROUND(SUM(ordertable_BusPrice), 2) AS TotalOrderCost,
	ROUND(SUM(ordertable_CustPrice - ordertable_BusPrice), 2) AS Profit
FROM ordertable
GROUP BY OrderMonth, ordertable_OrderType

UNION ALL

-- Grand Total row
SELECT
    '' AS CustomerType,
    'Grand Total' AS OrderMonth,
    ROUND(SUM(ordertable_CustPrice), 2) AS TotalOrderPrice,
    ROUND(SUM(ordertable_BusPrice), 2) AS TotalOrderCost,
    ROUND(SUM(ordertable_CustPrice - ordertable_BusPrice), 2) AS Profit
FROM ordertable

ORDER BY Profit ASC;