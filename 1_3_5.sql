SELECT branchId, COUNT(*) 
FROM Employee
JOIN RentalProperty
ON Employee.empId = RentalProperty.empId
GROUP BY branchId;
