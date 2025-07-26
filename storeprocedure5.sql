-- 5. Creating a Stored Procedure for Retrieving Order Details

DROP PROCEDURE IF EXISTS GetOrderDetails;
DELIMITER //
CREATE PROCEDURE GetOrderDetails(IN orderid INT)
BEGIN

SELECT o.id AS order_id, o.shipping_address,o.order_date,o.total_amount,
oi.item_id,p.name AS product_name,oi.quantity,p.price 

FROM orders o
JOIN order_items oi ON o.id=order_id
JOIN products p ON oi.item_id=p.id
WHERE o.id=orderid;

END //
DELIMITER //
-- Now call the procedure
call GetOrderDetails(3);

drop procedure GetOrderDetails;
