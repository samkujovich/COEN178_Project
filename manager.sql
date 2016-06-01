CREATE OR REPLACE TRIGGER ManagerMax
FOR INSERT OR UPDATE
ON Employee
COMPOUND TRIGGER

 /* Declaration Section*/
	 v_MAX_Manager CONSTANT INTEGER := 1;
     v_CurNum INTEGER := 1;	
	 v_branch Number;
	

 --ROW level
BEFORE EACH ROW IS
BEGIN
	v_branchId := :NEW.branchId;
END BEFORE EACH ROW;

 --Statement level
AFTER STATEMENT IS
BEGIN
SELECT COUNT(*) INTO v_CurNum FROM  
		WHERE branchId = v_sup AND job = 'Manager' Group by branchId;
		
		IF v_CurNum  > v_MAX_Manager THEN
			RAISE_APPLICATION_ERROR(-20000,'Only 1 manager for branch');
		END IF;
END AFTER STATEMENT;

 END ;
/

SHOW ERRORS;

