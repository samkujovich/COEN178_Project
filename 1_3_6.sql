CREATE OR REPLACE PROCEDURE create_lease (
	   propNum_arg IN LeaseAgreement.propNum%TYPE,
	   name_arg IN LeaseAgreement.name%TYPE,
	   homePhone_arg IN LeaseAgreement.homePhone%TYPE,
	   workPhone_arg IN LeaseAgreement.workPhone%TYPE,
	   conName_arg IN LeaseAgreement.conName%TYPE,
	   conNum_arg IN LeaseAgreement.conNum%TYPE,
	   rent_arg IN LeaseAgreement.rent%TYPE,
	   startDate_arg IN LeaseAgreement.startDate%TYPE,
	   endDate_arg IN LeaseAgreement.endDate%TYPE
)
AS
	CURSOR large_cur IS
   	SELECT * FROM LeaseAgreement
   	WHERE propNum_arg = propNum;	
	
   result_rec large_cur%rowtype;
	x NUMBER := rent_arg*1.1;
	y number := x*1.1;
   
BEGIN
	OPEN large_cur;
	--DECLARE
	--	x NUMBER := rent_arg*1.1;
	--	y NUMBER := x*1.1;
    LOOP
	FETCH large_cur INTO result_rec;
	IF MONTHS_BETWEEN(endDate_arg,startDate_arg)= 6 AND large_cur%NOTFOUND THEN
		INSERT INTO LeaseAgreement
  		VALUES (propNum_arg, x, name_arg, homePhone_arg, workPhone_arg, conName_arg, conNum_arg, x, startDate_arg, endDate_arg);  	
  		
		EXIT;
	ELSIF MONTHS_BETWEEN(endDate_arg,startDate_arg)!= 6 AND large_cur%NOTFOUND THEN
		INSERT INTO LeaseAgreement
  		VALUES (propNum_arg, rent_arg, name_arg, homePhone_arg, workPhone_arg, conName_arg, conNum_arg, (rent_arg), startDate_arg, endDate_arg);  	
  		EXIT;
	ELSIF MONTHS_BETWEEN(endDate_arg,startDate_arg)= 6 AND large_cur%FOUND THEN 
  		INSERT INTO LeaseAgreement
  		VALUES (propNum_arg, y, name_arg, homePhone_arg, workPhone_arg, conName_arg, conNum_arg, y, startDate_arg, endDate_arg);
		EXIT;
	ELSIF MONTHS_BETWEEN(endDate_arg,startDate_arg)!= 6 AND large_cur%FOUND THEN
		INSERT INTO LeaseAgreement
  		VALUES (propNum_arg, x, name_arg, homePhone_arg, workPhone_arg, conName_arg, conNum_arg, x, startDate_arg, endDate_arg);  	
  		EXIT;
	END IF;
	END LOOP;
  	COMMIT;
	CLOSE large_cur;
END;
/

show errors;

