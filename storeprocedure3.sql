-- 3. Creating a Stored Procedure for Updating User Information

select 
DROP PROCEDURE IF EXISTS UpdateUserInfo

DELIMITER //
CREATE PROCEDURE UpdateUserInfo( IN p_oldusername VARCHAR(255),IN p_newusername varchar(50),IN p_useraddress varchar(100))
BEGIN
UPDATE users SET username=p_newusername, address = p_useraddress where username = p_oldusername;

END //
call UpdateUserInfo('pranita','pranitamane3434','pune');

drop procedure UpdateUserInfo;
