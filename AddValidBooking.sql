/*Create a new procedure called AddValidBooking. This procedure must use a transaction statement to perform a rollback if a customer reserves a table that’s already booked under another name.  

Use the following guidelines to complete this task:

The procedure should include two input parameters in the form of booking date and table number.

It also requires at least one variable and should begin with a START TRANSACTION statement.

Your INSERT statement must add a new booking record using the input parameter's values.

Use an IF ELSE statement to check if a table is already booked on the given date. 

If the table is already booked, then rollback the transaction. If the table is available, then commit the transaction. 
*/

DELIMITER //
CREATE PROCEDURE AddValidBooking (
IN d DATE, 
IN t INT, 
OUT s VARCHAR(30))
BEGIN
START TRANSACTION;
DECLARE EXIT HANDLER FOR SQLEXCEPTION
IF call CheckBooking(d,t) = 'TABLE # IS AVAILABLE'
THEN INSERT
COMMIT;
ELSE ROLLBACK;
END //
DELIMITER ;
