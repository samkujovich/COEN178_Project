Create Or Replace Trigger Fee_trig
AFTER INSERT OR DELETE OR UPDATE ON RentalProperty
DECLARE
    /* Declare a cursor to
    Get the ownerID and the number of properties
    by OwnerId from RentalProperty table
    */
    CURSOR S_stats IS
    SELECT ownerId, COUNT(*) as properties 
    FROM RentalProperty
    GROUP BY ownerId;
BEGIN
    FOR v_rec in S_stats LOOP
        Update PropertyOwner
        /* Update the fee */
        SET fee = (v_rec.properties*400)
        WHERE v_rec.ownerId = ownerId;
    
    END Loop;
END Fee_trig;
/
Show Errors;

