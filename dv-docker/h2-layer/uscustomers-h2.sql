DROP TABLE IF EXISTS ACCOUNT;
DROP TABLE IF EXISTS ACCOUNTHOLDINGS;
DROP TABLE IF EXISTS CUSTOMER;

CREATE TABLE account (
  AccountID decimal(18,0) NOT NULL,
  SSN varchar(12) NOT NULL,
  AccountType char(10) DEFAULT NULL,
  AccountStatus char(10) DEFAULT NULL,
  DATEOPENED timestamp NOT NULL,
  DATECLOSED timestamp DEFAULT NULL,
  PRIMARY KEY (ACCOUNTID)
);

CREATE TABLE accountholdings (
  TransactionID varchar(12) NOT NULL,
  AccountID decimal(18,0) NOT NULL,
  ProductID varchar(12) NOT NULL,
  PURCHASEDATE timestamp NOT NULL,
  ProductShares decimal(20,6) NOT NULL,
  PRIMARY KEY (TRANSACTIONID)
);


CREATE TABLE customer (
  SSN varchar(12) NOT NULL,
  FIRSTNAME varchar(25) NOT NULL,
  LASTNAME varchar(25) NOT NULL,
  MIDDLEInitial varchar(15) DEFAULT NULL,
  StreetAddress1 varchar(50) NOT NULL,
  AptNumber varchar(50) DEFAULT NULL,
  CITY varchar(25) NOT NULL,
  State varchar(25) DEFAULT NULL,
  ZipCode varchar(15) NOT NULL,
  Phone varchar(30) DEFAULT NULL,
  PRIMARY KEY (SSN)
);

ALTER TABLE accountholdings ADD FOREIGN KEY ("ACCOUNTID")
      REFERENCES account ("ACCOUNTID");

ALTER TABLE account ADD FOREIGN KEY ("SSN")
      REFERENCES customer ("SSN");


INSERT INTO customer VALUES ('CST01002','Joseph','Smith',NULL,'1234 Main Street','Apartment 56','New York','New York','10174','(646)555-1776'),('CST01003','Nicholas','Ferguson','Robert','202 Palomino Drive',NULL,'Pittsburgh','Pennsylvania','15071','(412)555-4327'),('CST01004','Jane','Aire',NULL,'15 State Street',NULL,'Philadelphia','Pennsylvania','19154','(814)555-6789'),('CST01005','Charles','Jones','Howard','1819 Maple Street','Apartment 17F','Stratford','Connecticut','06614','(203)555-3947'),('CST01006','Virginia','Jefferson','Louise','1710 South 51st Street','Apartment 3245','New York','New York','10175','(718)555-2693'),('CST01007','Ralph','Bacon','Herbert','57 Barn Swallow Avenue',NULL,'Charlotte','North Carolina','28205','(704)555-4576'),('CST01008','Bonnie','Dragon','Anne','88 Cinderella Lane',NULL,'Jacksonville','Florida','32225','(904)555-6514'),('CST01009','Herbert','Smith','Lomas','12225 Waterfall Way','Building 100, Suite 9','Portland','Oregon','97220','(971)555-7803'),('CST01015','Jack','Corby','Thomas','1 Lone Star Way',NULL,'Dallas','Texas','75231','(469)555-8023'),('CST01019','Robin','Evers','Lynn','1814 Falcon Avenue',NULL,'Atlanta','Georgia','30355','(470)555-4390'),('CST01020','Lloyd','Abercrombie','Henry','1954 Hughes Parkway',NULL,'Los Angeles','California','90099','(213)555-2312'),('CST01021','Scott','Watters','George','24 Mariner Way',NULL,'Seattle','Washington','98124','(206)555-6790'),('CST01022','Sandra','King','Rose','96 Lakefront Parkway',NULL,'Minneapolis','Minnesota','55426','(651)555-9017'),('CST01027','Maryanne','Peters',NULL,'35 Grand View Circle','Apartment 5F','Cincinnati','Ohio','45232','(513)555-9067'),('CST01034','Corey','Snyder','James','1760 Boston Commons Avenue','Suite 543','Boston','Massachusetts','02136 ','(617)555-3546'),('CST01035','Henry','Thomas','Karl','345 Hilltop Parkway',NULL,'San Francisco','California','94129','(415)555-2093'),('CST01036','James','Drew','Carey','876 Lakefront Lane',NULL,'Cleveland','Ohio','44107','(216)555-6523');

INSERT INTO account VALUES ('19980002','CST01002','Personal','Active','1998-02-01 00:00:00',NULL),('19980003','CST01003','Personal','Active','1998-03-06 00:00:00',NULL),('19980004','CST01004','Personal','Active','1998-03-07 00:00:00',NULL),('19980005','CST01005','Personal','Active','1998-06-15 00:00:00',NULL),('19980006','CST01006','Personal','Active','1998-09-15 00:00:00',NULL),('19990007','CST01007','Personal','Active','1999-01-20 00:00:00',NULL),('19990008','CST01008','Personal','Active','1999-04-16 00:00:00',NULL),('19990009','CST01009','Business','Active','1999-06-25 00:00:00',NULL),('20000015','CST01015','Personal','Closed','2000-04-20 00:00:00','2001-06-22 00:00:00'),('20000019','CST01019','Personal','Active','2000-10-08 00:00:00',NULL),('20000020','CST01020','Personal','Active','2000-10-20 00:00:00',NULL),('20000021','CST01021','Personal','Active','2000-12-05 00:00:00',NULL),('20010022','CST01022','Personal','Active','2001-01-05 00:00:00',NULL),('20010027','CST01027','Personal','Active','2001-08-22 00:00:00',NULL),('20020034','CST01034','Business','Active','2002-01-22 00:00:00',NULL),('20020035','CST01035','Personal','Active','2002-02-12 00:00:00',NULL),('20020036','CST01036','Personal','Active','2002-03-22 00:00:00',NULL);

INSERT INTO accountholdings VALUES ('TXT001002','19980002','PRD01008','1998-02-01 00:00:00','50.000000'),('TXT001003','19980002','PRD01042','1998-02-01 00:00:00','25.250000'),('TXT001004','19980003','PRD01002','1998-03-06 00:00:00','100.000000'),('TXT001005','19980003','PRD01029','1998-03-06 00:00:00','25.000000'),('TXT001006','19980003','PRD01055','1998-03-06 00:00:00','50.500000'),('TXT001007','19980004','PRD01062','1998-03-07 00:00:00','30.125000'),('TXT001008','19980005','PRD01050','1998-06-15 00:00:00','18.000000'),('TXT001009','19980006','PRD01046','1998-09-15 00:00:00','200.000000'),('TXT001010','19990007','PRD01067','1999-01-20 00:00:00','65.000000'),('TXT001011','19990008','PRD01052','1999-04-16 00:00:00','102.125000'),('TXT001012','19990007','PRD01068','1999-05-11 00:00:00','85.000000'),('TXT001013','19990008','PRD01076','1999-05-21 00:00:00','105.000000'),('TXT001014','19990009','PRD01060','1999-06-25 00:00:00','120.375000'),('TXT001015','19980003','PRD01048','1999-07-22 00:00:00','150.000000'),('TXT001021','20000015','PRD01032','2000-04-20 00:00:00','135.000000'),('TXT001023','19980006','PRD01030','2000-06-12 00:00:00','90.625000'),('TXT001028','20000019','PRD01042','2000-10-08 00:00:00','350.750000'),('TXT001029','20000020','PRD01030','2000-10-20 00:00:00','126.875000'),('TXT001030','20000020','PRD01018','2000-11-14 00:00:00','100.000000'),('TXT001031','20000019','PRD01031','2000-11-15 00:00:00','125.000000'),('TXT001032','20000021','PRD01037','2000-12-05 00:00:00','400.000000'),('TXT001033','20010022','PRD01058','2001-01-05 00:00:00','236.625000'),('TXT001034','19990008','PRD01015','2001-01-23 00:00:00','180.000000'),('TXT001037','19980005','PRD01038','2001-03-23 00:00:00','125.000000'),('TXT001043','20010027','PRD01076','2001-08-22 00:00:00','70.000000'),('TXT001052','20000020','PRD01006','2001-11-14 00:00:00','125.000000'),('TXT001053','19980003','PRD01049','2001-11-15 00:00:00','100.000000'),('TXT001057','20000021','PRD01011','2001-12-18 00:00:00','44.000000'),('TXT001058','20010027','PRD01021','2001-12-19 00:00:00','115.000000'),('TXT001060','20020034','PRD01055','2002-01-22 00:00:00','188.875000'),('TXT001061','19990009','PRD01102','2002-01-24 00:00:00','30.000000'),('TXT001063','20020035','PRD01058','2002-02-12 00:00:00','110.125000'),('TXT001064','20020035','PRD01083','2002-02-13 00:00:00','70.000000'),('TXT001065','20020034','PRD01088','2002-02-22 00:00:00','25.000000'),('TXT001066','20000019','PRD01089','2002-02-26 00:00:00','195.000000'),('TXT001067','19980004','PRD01090','2002-03-05 00:00:00','250.000000'),('TXT001069','20000021','PRD01014','2002-03-12 00:00:00','300.000000'),('TXT001070','20010027','PRD01024','2002-03-14 00:00:00','136.000000'),('TXT001071','20020036','PRD01012','2002-03-22 00:00:00','54.000000'),('TXT001072','20020036','PRD01037','2002-03-26 00:00:00','188.875000'),('TXT001075','19980005','PRD01068','2002-04-01 00:00:00','26.000000');