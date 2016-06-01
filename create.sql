CREATE TABLE Branch (
branchId Number,
phone varchar(15),
street varchar(20),
city varchar(20),
zip varchar(20),
PRIMARY KEY(branchId)
);

CREATE TABLE Employee (
empId Number,
branchId Number,
phone varchar(15),
startDate date,
job varchar(10),
PRIMARY KEY(empId),
FOREIGN KEY (branchId) REFERENCES Branch(branchId),
CONSTRAINT Employee CHECK(job IN ('Manager','Supervisor','Staff'))
);

CREATE TABLE RentalProperty (
propNum Number,
ownerId Number,
street  varchar(20),
city varchar(20),
zip varchar(20),
rooms Number,
rent  Number,
status varchar(15),
availDate date,
empId Number,
PRIMARY KEY(propNum),
FOREIGN KEY (empId) REFERENCES Employee(empId),
FOREIGN KEY (ownerId) REFERENCES PropertyOwner(ownerId),
CONSTRAINT RentalProperty CHECK(status IN ('Available','Not-Available'))
);

CREATE TABLE PropertyOwner (
ownerId Number,
name varchar(15),
phone varchar(15),
street varchar(20),
city varchar(20),
zip varchar(20),
Fee Number,
PRIMARY KEY(ownerId)
);

CREATE TABLE LeaseAgreement (
propNum Number,
deposit Number, 
name varchar(15),
homePhone varchar(15),
workPhone varchar(15),
conName varchar(15),
conNum varchar(15),
rent Number,
startDate date,
endDate date,
FOREIGN KEY (propNum) REFERENCES RentalProperty (propNum),
CONSTRAINT LeaseAgreement CHECK(MONTHS_BETWEEN(endDate,startDate) >= 6 AND MONTHS_BETWEEN(endDate,startDate)<=12)
);
