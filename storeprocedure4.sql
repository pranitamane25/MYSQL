-- 4. Creating a Stored Procedure for Applying a Discount Code

DELIMITER //

CREATE PROCEDURE sp_ApplyDiscount (IN p_orderid int,IN p_discountcode varchar(100))

BEGIN

DECLARE discount decimal(5,2);
DECLARE total decimal(10,2);

-- Retrieve discount percentage from the discount_codes table

select discount_percentage INTO discount FROM discount_codes where code=p_discountcode AND NOW() between start_date AND end_date;
select total_amount INTO total FROM orders where id=p_orderid;

set total=total-(total*discount/100);
update orders set total_amount=total where id=p_orderid;

END//
DELIMITER ;
-- drop procedure sp_ApplyDiscount;
call sp_ApplyDiscount(20,"SUMMER23");

select * from orders;