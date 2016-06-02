Create Or Replace Trigger Status_trig
AFTER INSERT ON LeaseAgreement
FOR EACH ROW
BEGIN
    Update RentalProperty
    SET status = 'Not-Available'
	WHERE propNum = :NEW.propNum;
END Status_trig;
/
Show Errors;

