CREATE OR REPLACE PROCEDURE showAvailPropsbyCriteria(city_arg IN RentalProperty.city%type, rooms_arg IN RentalProperty.rooms%type, rent_min in Number, rent_max in Number)
AS
   CURSOR large_cur IS
   /* Get the available properties and manager*/
   SELECT *  FROM RentalProperty
   WHERE (status = 'Available') AND(city = city_arg OR rooms = rooms_arg OR (rent > rent_min AND rent <rent_max)) ;

   result_rec large_cur%rowtype;
BEGIN
     /* Open large_cur */
LOOP
    FETCH large_cur INTO result_rec;
    EXIT WHEN large_cur%NOTFOUND;
      /* Print the propNums */
    dbms_output.put_line(result_rec.propNum);
END LOOP;
close large_cur;
END;
/
show errors;

