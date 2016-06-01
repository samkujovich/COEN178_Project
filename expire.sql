CREATE OR REPLACE PROCEDURE expiringLeases
AS
   CURSOR large_cur IS
   SELECT *
   FROM RentalProperty
   WHERE propNum IN (SELECT *
                   FROM LeaseAgreement
                   WHERE MONTHS_BETWEEN(endDate,SYSDATE) <= 2);

   result_rec large_cur%rowtype;
BEGIN
     /* Open large_cur */
LOOP
    FETCH large_cur INTO result_rec;
    EXIT WHEN large_cur%NOTFOUND;
      /* Print the custname and city */
    dbms_output.put_line(result_rec.propNum || ' ' || result_rec.street || ' ' ||result_rec.city || ' ' || result_rec.zip );
END LOOP;
close large_cur;
END;
/
show errors;

