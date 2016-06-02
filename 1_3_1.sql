CREATE OR REPLACE PROCEDURE showAvailPropsbyBranch(branchId_in IN Branch.branchId%type)
AS
   CURSOR large_cur IS
   /* Get the available properties and manager from
      RentalProperty table */
   SELECT propNum
   FROM RentalProperty
   WHERE empId IN(SELECT empId  
                   FROM Employee
                   WHERE branchId = branchId_in) AND status = 'Available';

   CURSOR small_cur IS
   SELECT name, empId FROM Employee
   WHERE branchId = branchId_in AND job = 'Manager';

   res_rec small_cur%rowtype;
   result_rec large_cur%rowtype;
BEGIN
     /* Open large_cur */
	OPEN large_cur;
	OPEN small_cur;
LOOP
    FETCH large_cur INTO result_rec;
	FETCH small_cur INTO res_rec;
    EXIT WHEN large_cur%NOTFOUND;
	EXIT WHEN small_cur%NOTFOUND;
    dbms_output.put_line(result_rec.propNum || ' ' || res_rec.name || ' ' || res_rec.empId);
END LOOP;
	close large_cur;
	close small_cur;
END;
/
show errors;

