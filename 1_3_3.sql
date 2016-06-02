CREATE OR REPLACE PROCEDURE showAvailPropsbyOwner(owner_arg IN PropertyOwner.name%type, branch_arg IN Employee.branchId%type)
AS
   CURSOR large_cur IS
   /* Get the available properties and manager from
      RentalProperty table */
   SELECT propNum
   FROM RentalProperty
   WHERE empId IN(SELECT empId  
                   FROM Employee
                   WHERE branchId = branch_arg) AND status = 'Available' AND ownerId IN (SELECT ownerId FROM PropertyOwner WHERE name = owner_arg);


   result_rec large_cur%rowtype;
BEGIN
     /* Open large_cur */
	OPEN large_cur;
LOOP
    FETCH large_cur INTO result_rec;
    EXIT WHEN large_cur%NOTFOUND;
    dbms_output.put_line(result_rec.propNum);
END LOOP;
	close large_cur;
END;
/
show errors;

