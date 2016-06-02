SELECT name, COUNT(*) 
FROM LeaseAgreement
GROUP BY name
HAVING COUNT(*) >= 2;
