USE PizzaDB;

INSERT INTO topping (
	topping_TopName,
	topping_CustPrice,
	topping_BusPrice,
	topping_CurINVT,
	topping_MinINVT,
	topping_SmallAMT,
	topping_MedAMT,
	topping_LgAMT,
	topping_XLAMT
) VALUES
('Pepperoni', 1.25, 0.2, 97, 50, 2, 2.75, 3.5, 4.5),
('Sausage', 1.25, 0.15, 100, 50, 2.5, 3, 3.5, 4.25),
('Ham', 1.5, 0.15, 75, 25, 2, 2.5, 3.25, 4),
('Chicken', 1.75, 0.25, 56, 25, 1.5, 2, 2.25, 3),
('Green Pepper', 0.5, 0.02, 79, 25, 1, 1.5, 2, 2.5),
('Onion', 0.5, 0.02, 85, 25, 1, 1.5, 2, 2.75),
('Roma Tomato', 0.75, 0.03, 86, 10, 2, 3, 3.5, 4.5),
('Mushrooms', 0.75, 0.1, 52, 50, 1.5, 2, 2.5, 3),
('Black Olives', 0.6, 0.1, 39, 25, 0.75, 1, 1.5, 2),
('Pineapple', 1, 0.25, 15, 0, 1, 1.25, 1.75, 2),
('Jalapenos', 0.5, 0.05, 64, 0, 0.5, 0.75, 1.25, 1.75),
('Banana Peppers', 0.5, 0.05, 36, 0, 0.6, 1, 1.3, 1.75),
('Regular Cheese', 0.5, 0.12, 250, 50, 2, 3.5, 5, 7),
('Four Cheese Blend', 1, 0.15, 150, 25, 2, 3.5, 5, 7),
('Feta Cheese', 1.5, 0.18, 75, 0, 1.75, 3, 4, 5.5),
('Goat Cheese', 1.5, 0.2, 54, 0, 1.6, 2.75, 4, 5.5),
('Bacon', 1.5, 0.25, 89, 0, 1, 1.5, 2, 3);


INSERT INTO baseprice (
	baseprice_Size,
	baseprice_CrustType,
	baseprice_CustPrice,
	baseprice_BusPrice
) VALUES
('Small','Thin', 3, 0.5),
('Small','Original', 3, 0.75),
('Small','Pan', 3.5, 1),
('Small','Gluten-Free', 4, 2),
('Medium','Thin', 5, 1),
('Medium','Original', 5, 1.5),
('Medium','Pan', 6, 2.25),
('Medium','Gluten-Free', 6.25, 3),
('Large','Thin', 8, 1.25),
('Large','Original', 8, 2),
('Large','Pan', 9, 3),
('Large','Gluten-Free', 9.5, 4),
('XLarge','Thin', 10, 2),
('XLarge','Original', 10, 3),
('XLarge','Pan', 11.5, 4.5),
('XLarge','Gluten-Free', 12.5, 6);

INSERT INTO discount (
	discount_DiscountName,
	discount_Amount,
	discount_IsPercent
) VALUES
('Employee', 15, 1),
('Lunch Special Medium', 1, 0),
('Lunch Special Large', 2, 0),
('Specialty Pizza', 1.5, 0),
('Happy Hour', 10, 1),
('Gameday Special', 20, 1);

INSERT INTO customer (
	customer_FName,
	customer_LName,
	customer_PhoneNum
) VALUES
('Andrew', 'Wilkes-Krier', 8642545861),
('Matt', 'Engers', 8644749953),
('Frank', 'Turner', 8642328944),
('Milo', 'Auckerman', 8648785679);

INSERT INTO ordertable (
	customer_CustID,
	ordertable_OrderType,
	ordertable_OrderDateTime,
	ordertable_CustPrice,
	ordertable_BusPrice,
	ordertable_IsComplete
)	
VALUES
(NULL, 'dinein',  '2025-01-05 12:03:00', 19.75, 3.68, 1),
(NULL, 'dinein',  '2025-02-03 12:05:00', 19.78, 4.63, 1),
(1, 'pickup',  '2025-01-03 21:30:00', 89.28, 19.80, 1),
(1, 'delivery','2025-02-20 19:11:00', 68.95, 17.39, 1),
(2, 'pickup',  '2025-01-02 17:30:00', 28.70, 7.84, 1),
(3, 'delivery','2025-01-02 18:17:00', 25.81, 3.64, 1),
(4, 'delivery','2025-02-13 20:32:00', 31.66, 6.00, 1);

INSERT INTO pizza (
	ordertable_OrderID,
	pizza_Size,
	pizza_CrustType,
	pizza_PizzaState,
	pizza_PizzaDate,
	pizza_CustPrice,
	pizza_BusPrice
) VALUES
-- Order 1: 1 Large Thin pizza
(1, 'Large', 'Thin', 'completed', '2025-01-05 12:03:00', 19.75, 3.68),
-- Order 2: 1 Small Original, 1 Medium Pan
(2, 'Small', 'Original', 'completed', '2025-02-03 12:05:00', 6.93, 1.40),
(2, 'Medium', 'Pan', 'completed', '2025-02-03 12:05:00', 13.85, 3.23),
-- Order 3: 6 Large Original pizzas
(3, 'Large', 'Original', 'completed', '2025-01-03 21:30:00', 14.88, 3.30),
(3, 'Large', 'Original', 'completed', '2025-01-03 21:30:00', 14.88, 3.30),
(3, 'Large', 'Original', 'completed', '2025-01-03 21:30:00', 14.88, 3.30),
(3, 'Large', 'Original', 'completed', '2025-01-03 21:30:00', 14.88, 3.30),
(3, 'Large', 'Original', 'completed', '2025-01-03 21:30:00', 14.88, 3.30),
(3, 'Large', 'Original', 'completed', '2025-01-03 21:30:00', 14.88, 3.30),
-- Order 4: 3 XLarge Original pizzas
(4, 'XLarge', 'Original', 'completed', '2025-02-20 19:11:00', 26.75, 5.55),
(4, 'XLarge', 'Original', 'completed', '2025-02-20 19:11:00', 27.94, 5.59),
(4, 'XLarge', 'Original', 'completed', '2025-02-20 19:11:00', 31.50, 6.25),
-- Order 5: 1 XLarge Gluten-Free pizza
(5, 'XLarge', 'Gluten-Free', 'completed', '2025-01-02 17:30:00', 28.70, 7.84),
-- Order 6: 1 Large Thin pizza
(6, 'Large', 'Thin', 'completed', '2025-01-02 18:17:00', 25.81, 3.64),
-- Order 7: 2 Large Thin pizzas
(7, 'Large', 'Thin', 'completed', '2025-02-13 20:32:00', 18.00, 2.75),
(7, 'Large', 'Thin', 'completed', '2025-02-13 20:32:00', 19.25, 3.25);

INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(1, 13, 1),
(1, 1, 0),
(1, 2, 0),
(2, 13, 0),
(2, 4, 0),
(2, 12, 0),
(3, 15, 0),
(3, 9, 0),
(3, 7, 0),
(3, 8, 0),
(3, 12, 0),
(4, 13, 0),
(4, 1, 0),
(5, 13, 0),
(5, 1, 0),
(6, 13, 0),
(6, 1, 0),
(7, 13, 0),
(7, 1, 0),
(8, 13, 0),
(8, 1, 0),
(9, 13, 0),
(9, 1, 0),
(10, 14, 0),
(10, 1, 0),
(10, 2, 0),
(11, 14, 0),
(11, 3, 1),
(11, 10, 1),
(12, 14, 0),
(12, 4, 0),
(12, 17, 0),
(13, 16, 0),
(13, 5, 0),
(13, 6, 0),
(13, 7, 0),
(13, 8, 0),
(13, 9, 0),
(14, 14, 1),
(14, 4, 0),
(14, 5, 0),
(14, 6, 0),
(14, 8, 0),
(15, 14, 1),
(16, 13, 0),
(16, 1, 1);


INSERT INTO order_discount (ordertable_OrderID, discount_DiscountID)
SELECT o.ordertable_OrderID, d.discount_DiscountID
FROM ordertable o
JOIN discount d ON (
	(o.ordertable_OrderID = 2 AND d.discount_DiscountName = 'Lunch Special Medium') OR
	(o.ordertable_OrderID = 4 AND d.discount_DiscountName = 'Gameday Special') OR
	(o.ordertable_OrderID = 7 AND d.discount_DiscountName = 'Employee')
);

-- Pizza discounts: Need to target specific pizzas
-- Order 1 pizza (PizzaID 1) gets Lunch Special Large
-- Order 2 Medium Pan pizza (PizzaID 3) gets Specialty Pizza
-- Order 4 third pizza (PizzaID 12) gets Specialty Pizza
-- Order 5 pizza (PizzaID 13) gets Specialty Pizza
INSERT INTO pizza_discount (pizza_PizzaID, discount_DiscountID)
SELECT p.pizza_PizzaID, d.discount_DiscountID
FROM pizza p
JOIN discount d ON (
	(p.pizza_PizzaID = 1 AND d.discount_DiscountName = 'Lunch Special Large') OR
	(p.pizza_PizzaID = 3 AND d.discount_DiscountName = 'Specialty Pizza') OR
	(p.pizza_PizzaID = 12 AND d.discount_DiscountName = 'Specialty Pizza') OR
	(p.pizza_PizzaID = 13 AND d.discount_DiscountName = 'Specialty Pizza')
);

INSERT INTO pickup (ordertable_OrderID, pickup_IsPickedUp)
VALUES
(3, 1),
(5, 1);

INSERT INTO dinein (ordertable_OrderID, dinein_TableNum)
VALUES
(1, 21),
(2, 4);

INSERT INTO delivery (
	ordertable_OrderID,
	delivery_HouseNum,
	delivery_Street,
	delivery_City,
	delivery_State,
	delivery_Zip,
	delivery_IsDelivered
)
VALUES
(4, 115, 'Party Blvd', 'Anderson', 'SC', 29621, 1),
(6, 6745, 'Wessex St', 'Anderson', 'SC', 29621, 1),
(7, 8879, 'Suburban Lane', 'Anderson', 'SC', 29621, 1);