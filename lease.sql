CREATE OR REPLACE TRIGGER Lease_trig
FOR INSERT OR UPDATE
ON LeaseAgreement
COMPOUND TRIGGER

 /* Declaration Section*/
v_old_lease  DATE;
v_new_lease DATE;	
v_prop NUMBER;

 --ROW level
BEFORE EACH ROW IS
BEGIN
	v_prop := :NEW.propNum;
END BEFORE EACH ROW;

 --Statement level
AFTER STATEMENT IS
BEGIN
		SELECT COUNT(*) INTO v_CurNum FROM SUPERVISOR 
		WHERE EmpNo = v_sup Group by EmpNo;
		
		
		IF v_CurNum  > v_MAX_Rental THEN
			RAISE_APPLICATION_ERROR(-20000,'Only 3 rentals for supervisor');
		END IF;
END AFTER STATEMENT;

 END ;
/

SHOW ERRORS;

