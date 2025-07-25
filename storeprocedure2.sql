-- 2. Creating a Stored Procedure for User Login

DELIMITER //
CREATE PROCEDURE LoginUsers(p_username varchar(10),p_password varchar(20))

BEGIN

select id,username,email from users where username=p_username AND password=p_password ;

END //
DELIMITER ;

call LoginUsers('pranita','pranita25');