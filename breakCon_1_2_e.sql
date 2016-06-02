--show that when we delete from rental property, we delete from supervisor list
--query that shows Employee properties he/she oversees

--show before
SELECT * FROM RentalProperty
WHERE empId = 7;

--delete property number 25 from 
DELETE FROM RentalProperty
WHERE propNum = 25;

--Show after
SELECT * FROM RentalProperty
WHERE empId = 7;
