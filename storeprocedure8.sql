
-- 8. Creating a Stored Procedure for Monthly Sales Aggregation

DELIMITER //
CREATE PROCEDURE MonthlySalesReport(IN year INT,IN month INT)
BEGIN

SELECT p.id AS product_id ,p.name AS product_name,
SUM(oi.quantity)AS total_quantity_sold,
SUM(oi.quantity*p.price)AS total_sale FROM orders o
JOIN order_items oi ON o.id=oi. order_id
JOIN products p ON oi. item_id=p.id
 WHERE YEAR(o.order_date) = year AND MONTH(o.order_date) = month
    GROUP BY p.id, p.name;
END //
 -- drop procedure MonthlySalesReport;
DELIMITER ;
drop procedure MonthlySalesReport;
CALL MonthlySalesReport(2024, 8);
