Create Or Replace Trigger Status_trig
AFTER INSERT ON LeaseAgreement
BEGIN
    Update LeaseAgreement
    SET status = 'Not-Available'
	WHERE propNum = :OLD.propNum;
END Status_trig;
/
Show Errors;

