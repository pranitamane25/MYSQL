
-- 4. Creating a Stored Procedure for Applying a Discount Code

DELIMITER //
CREATE PROCEDURE SP_ApplyDiscount( IN p_order_id varchar(100),IN p_discount_code varchar(500))

BEGIN

DECLARE discount decimal(5,2);
DECLARE total decimal(10,2);

-- Retrieve discount percentage from the discount_codes table

select discount_percentage INTO discount FROM discount_codes WHERE code=p_discount_code and NOW() BETWEEN start_date and end_date;
	
 -- If discount exists, apply it
 IF discount IS NOT NULL then
select total_amount INTO total FROM orders WHERE id=p_order_id;

-- Apply discount to total
SET total=total-(total*discount/100);

 -- Update order total
UPDATE orders SET total_amount=total WHERE id=p_order_id;
ELSE

 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT "INVALID or expired discount code" ;
 
END IF ;
END ;
DELIMITER ;


-- Call the stored procedure with test parameters
SELECT * FROM discount_codes WHERE code = 'INDEPENDENCE23';
CALL ApplyDiscount(2, 'INDEPENDENCE23');
