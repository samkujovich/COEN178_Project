CREATE OR REPLACE TRIGGER SupervisorMax
FOR INSERT OR UPDATE
ON RentalProperty
COMPOUND TRIGGER

 /* Declaration Section*/
	v_MAX_Rental CONSTANT INTEGER := 3;
     v_CurNum INTEGER := 1;	
	 v_sup Number;

 --ROW level
BEFORE EACH ROW IS
BEGIN
	v_sup := :NEW.empId;
END BEFORE EACH ROW;

 --Statement level
AFTER STATEMENT IS
BEGIN
SELECT COUNT(*) INTO v_CurNum FROM RentalProperty 
		WHERE empId = v_sup Group by empId;
		
		IF v_CurNum  > v_MAX_Rental THEN
			RAISE_APPLICATION_ERROR(-20000,'Only 3 rentals for supervisor');
		END IF;
END AFTER STATEMENT;

 END ;
/

SHOW ERRORS;

