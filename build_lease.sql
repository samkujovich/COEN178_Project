CREATE OR REPLACE PROCEDURE create_lease (
	   propNum_arg IN LeaseAgreement.propNum%TYPE,
	   deposit_arg IN LeaseAgreement.deposit%TYPE,
	   name_arg IN LeaseAgreement.name%TYPE,
	   homePhone_arg IN LeaseAgreement.homePhone%TYPE,
	   workPhone_arg IN LeaseAgreement.workPhone%TYPE,
	   conName_arg IN LeaseAgreement.conName%TYPE,
	   conNum_arg IN LeaseAgreement.conNum%TYPE,
	   rent_arg IN LeaseAgreement.rent%TYPE,
	   startDate_arg IN LeaseAgreement.startDate%TYPE,
	   endDate_arg IN LeaseAgreement.endDate%TYPE
)
IS
BEGIN
  IF (MONTHS_BETWEEN(endDate_arg,startDate_arg)= 6) THEN
	INSERT INTO LeaseAgreement
  	VALUES (propNum_arg, deposit_arg, name_arg, homePhone_arg, workPhone_arg, conName_arg, conNum_arg, (rent_arg*1.1), startDate_arg, endDate_arg);  	
  ELSE THEN
  	INSERT INTO LeaseAgreement
  	VALUES (propNum_arg, deposit_arg, name_arg, homePhone_arg, workPhone_arg, conName_arg, conNum_arg, rent_arg, startDate_arg, endDate_arg);
  END IF;
  COMMIT;

END;
/

show errors;
