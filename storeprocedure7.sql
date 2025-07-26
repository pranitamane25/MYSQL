
-- 7. Creating a Stored Procedure for Product Reviews
DROP PROCEDURE IF EXISTS AddProductReview ;

DELIMITER //

CREATE PROCEDURE ProductReview(IN p_productid INT, IN p_userid INT,IN p_rating INT,IN p_review text)
BEGIN

INSERT INTO reviews(product_id,user_id,rating,review_text)values(p_productid,p_userid,p_rating,p_review);

END //
DELIMITER ;

desc reviews;

CALL ProductReview(1, 2, 5, 'Great product!');

select * from reviews;
drop procedure ProductReview;