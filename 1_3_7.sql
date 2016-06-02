CREATE OR REPLACE PROCEDURE showAgreementbyRenter(name_arg IN LeaseAgreement.name%type)
AS
   CURSOR large_cur IS
   SELECT *
   FROM LeaseAgreement
   WHERE name = name_arg; 

   result_rec large_cur%rowtype;
BEGIN
     /* Open large_cur */
	OPEN large_cur;
LOOP
    FETCH large_cur INTO result_rec;
    EXIT WHEN large_cur%NOTFOUND;
    dbms_output.put_line(result_rec.propNum || ' ' || result_rec.deposit||' '|| result_rec.name || ' ' || result_rec.rent||' ' || result_rec.startDate || ' ' || result_rec.endDate);
END LOOP;
close large_cur;
END;
/
show errors;

