CREATE OR REPLACE PROCEDURE showAverageByCity (city_param IN RentalProperty.city%type) 
AS
/* Cursor is declared */
   CURSOR amt_cur IS 
   SELECT AVG(rent) as averagerent FROM RentalProperty
   WHERE city = city_param; 
   amt_rec amt_cur%rowtype; -- local variable
BEGIN
 IF NOT amt_cur%ISOPEN THEN 
	OPEN amt_cur; 	-- Open the cursor
 END IF; 
LOOP 
	FETCH amt_cur INTO amt_rec; 
	EXIT WHEN amt_cur%NOTFOUND; 
	dbms_output.put_line(city_param || ' ' ||amt_rec.averagerent);
END LOOP; 
close amt_cur; -- close the cursor
END;
/
show errors;

