DELIMITER //
CREATE PROCEDURE userregistrations( IN p_username varchar(50), IN p_password varchar(255),IN p_email varchar(100),IN p_address varchar(255))
BEGIN
INSERT INTO users (username,password,email,address)values(p_username,p_password,p_email,p_address);

END
//
call userregistrations('pranita','pranita25','pranita@25gmail.com','pune');
drop procedure userregistrations;