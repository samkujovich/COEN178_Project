start drop_tables.sql;
start create.sql;
start insert.sql;
@fee
@manager
@supervisor
@status_change

set serveroutput on;

@1_3_1
execute showAvailPropsbyBranch(12);

@1_3_2

@1_3_3
execute showAvailPropsbyOwner('Johan', 12);

@1_3_4
execute showAvailPropsbyCriteria('SJ', 5, 1000, 3000);
execute showAvailPropsbyCriteria('SJ', 5, 0,10000);   

@1_3_5

@1_3_6
SELECT * FROM RentalProperty;
execute create_lease(21,'Jim','111-222-3333','111-222-3334','Jim Friend','111-222-3335',1800,TO_DATE('20161011','YYYYMMDD'),TO_DATE('20170411','YYYYMMDD'));
execute create_lease(21,'Tim','800-800-8000','800-800-8001','Tim Friend','800-800-8002',1200,TO_DATE('20151213','YYYYMMDD'), TO_DATE('20160713','YYYYMMDD'));
execute create_lease(22,'Tim','800-800-8000','800-800-8001','Tim Friend','800-800-8002',1200,TO_DATE('20151213','YYYYMMDD'), TO_DATE('20160713','YYYYMMDD'));
SELECT * FROM RentalProperty;

@1_3_7
execute showAgreementbyRenter('Tim');

@1_3_8

@1_3_9
execute showAverageByCity('SJ');

@1_3_10
execute expiringLeases

start breakCon_1_2_a.sql;

start breakCon_1_2_b.sql;

execute create_lease(21,'Jim','111-222-3333','111-222-3334','Jim Friend','111-222-3335',1800,TO_DATE('20170211','YYYYMMDD'),TO_DATE('20170411','YYYYMMDD'));

SELECT * FROM RentalProperty;

start breakCon_1_2_e.sql;


