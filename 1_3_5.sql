CREATE OR REPLACE PROCEDURE showAvailPropsbyBranch(branchName IN Branch.amount%type)
AS
   CURSOR large_cur IS
   /* Get the available properties and manager from
      RentalProperty table */
   SELECT propNum
   FROM RentalProperty
   WHERE empId IN(SELECT *  
                   FROM empId
                   WHERE branchId = branchName) AND status = 'Available';

   CURSOR small_cur IS
   SELECT empId FROM Employee
   WHERE branchId = branchName AND job = 'Manager';

   res_rec small_cur%rowtype;
   result_rec large_cur%rowtype;
BEGIN
     /* Open large_cur */
LOOP
    FETCH large_cur INTO result_rec;
	FETCH small_cur INTO res_rec;
    EXIT WHEN large_cur%NOTFOUND;
	EXIT WHEN small_cur%NOTFOUND;
    dbms_output.put_line(result_rec.propNum || ' ' || small_cur.empId);
END LOOP;
close large_cur;
END;
/
show errors;

