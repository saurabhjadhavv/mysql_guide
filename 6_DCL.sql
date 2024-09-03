-- DCL - Data Control Language 

-- ----------------------------- 1. GRANT – Give Users Access: -------------------------------------------
-- To allow a user named user1 to have read and write access to both Departments and Employees tables, you can use:

-- Grant SELECT, INSERT, UPDATE, DELETE permissions on Departments table
GRANT SELECT, INSERT, UPDATE, DELETE ON Departments TO 'user1'@'localhost';

-- Grant SELECT, INSERT, UPDATE, DELETE permissions on Employees table
GRANT SELECT, INSERT, UPDATE, DELETE ON Employees TO 'user1'@'localhost';




-- -------------------------------------------------------2.REVOKE:---------------------------------------------------------
--  Withdraw User Access, Removes previously granted access rights from users or roles.
-- Revoke INSERT and DELETE permissions on Departments table
REVOKE INSERT, DELETE ON Departments FROM 'user1'@'localhost';


-- Revoke UPDATE permission on Employees table
REVOKE UPDATE ON Employees FROM 'user1'@'localhost';


