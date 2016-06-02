CREATE OR REPLACE PROCEDURE showAvailCountbyBranch
AS
   CURSOR large_cur IS
   /* Get the available properties and manager from
      RentalProperty table */
   	SELECT branchId, COUNT(*) as count
	FROM Employee
	WHERE empId IN	
	(SELECT empId
   		FROM RentalProperty
   		WHERE status = 'Available')
	GROUP BY branchId;
	
   result_rec large_cur%rowtype;
BEGIN
     /* Open large_cur */
LOOP
    FETCH large_cur INTO result_rec;
    EXIT WHEN large_cur%NOTFOUND;
    dbms_output.put_line(result_rec.branchId || ' ' || result_rec.count);
END LOOP;
close large_cur;
END;
/
show errors;

