--try to create lease agreement with a time for less than 6 and greater than 12 months
INSERT INTO RentalProperty VALUES(24,900,'Mike','010-010-0101','010-010-0102','Mike Friend','010-010-0103',TO_DATE('20160101','YYYYMMDD'),TO_DATE('20160201','YYYYMMDD')); --1 month lease
INSERT INTO RentalProperty VALUES(25,200,'James','222-444-6666','222-444-6667','James Friend','222-444-6668',TO_DATE('20160101','YYYYMMDD'),TO_DATE('20200201','YYYYMMDD')); --4 year lease

