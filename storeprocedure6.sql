
-- 6. Creating a Stored Procedure for Low Stock Alerts

DELIMITER //
CREATE PROCEDURE LowStockAlert(IN p_threashold INT)

begin

SELECT id,name,stock from products WHERE Stock < p_threashold;

End //

DELIMITER ;

call LowStockAlert(50);