--Copyright (C) 2021 Kritik Agarwal <https://github.com/Kritik007>

--USING THE EXISTING DATABASE
USE [KritikDB];

--CREATING TABLES
--T1
CREATE TABLE [PUBLISHER] (
  [NAME] VARCHAR(50) NOT NULL PRIMARY KEY,
  [ADDRESS] VARCHAR(50) NOT NULL,
  [PHONE] VARCHAR(50),
);

--T2
CREATE TABLE [BOOK] (
  [BOOK_ID] INT NOT NULL PRIMARY KEY,
  [TITLE] VARCHAR(100) NOT NULL,
  [PUBLISHER_NAME] VARCHAR(50) REFERENCES PUBLISHER([NAME])  ON DELETE CASCADE,
  [PUB_YEAR] VARCHAR(10) NOT NULL,
);

--T3
CREATE TABLE [BOOK_AUTHORS] (
  [BOOK_ID] INT REFERENCES BOOK([BOOK_ID])  ON DELETE CASCADE,
  [AUTHOR_NAME] VARCHAR(50) NOT NULL,
  PRIMARY KEY ([BOOK_ID], [AUTHOR_NAME])
);

--T4
CREATE TABLE [LIBRARY_BRANCH] (
  [BRANCH_ID] INT NOT NULL PRIMARY KEY,
  [BRANCH_NAME] VARCHAR(20) NOT NULL,
  [ADDRESS] VARCHAR(50) NOT NULL,
);

--T5
CREATE TABLE [BOOK_COPIES] (
    [BOOK_ID] INT REFERENCES BOOK([BOOK_ID])  ON DELETE CASCADE,
    [BRANCH_ID] INT REFERENCES LIBRARY_BRANCH([BRANCH_ID])  ON DELETE CASCADE,
    [NO_OF_COPIES] INT,
    PRIMARY KEY ([BOOK_ID], [BRANCH_ID])
);

--T6
CREATE TABLE [BOOK_LENDING] (
  [BOOK_ID] INT REFERENCES BOOK([BOOK_ID])  ON DELETE CASCADE,
  [BRANCH_ID] INT REFERENCES LIBRARY_BRANCH([BRANCH_ID])  ON DELETE CASCADE,
  [CARD_NO] INT NOT NULL,
  [DATE_OUT] DATE NOT NULL,
  [DUE_DATE] DATE NOT NULL,
  PRIMARY KEY ([BOOK_ID], [BRANCH_ID], [CARD_NO])
);


--INSERTING SOME VALUES INTO THE DATABASE
--1
INSERT INTO PUBLISHER VALUES('MCGRAW-HILL','BENGALURU', 9191919191);
INSERT INTO PUBLISHER VALUES('PEARSON','CHENNAI', 8181818181);
INSERT INTO PUBLISHER VALUES('PRENTICE HALL','DELHI', 7171717171);
INSERT INTO PUBLISHER VALUES('PRINCETON UNIVERSITY PRESS','GUJARAT', 6161616161);
INSERT INTO PUBLISHER VALUES('PLANETA','KOLKATA', 5151515151);
INSERT INTO PUBLISHER VALUES('RANDOM HOUSE','HYDERABAD', 4141414141);
INSERT INTO PUBLISHER VALUES('LIVRE','ORRISA', 3131313131);

SELECT * FROM PUBLISHER;

--2
INSERT INTO BOOK VALUES (101, 'JAVA: THE COMPLETE REFERENCE', 'MCGRAW-HILL', 2019);
INSERT INTO BOOK VALUES (102,'DATA VISUALIZATION: A PRACTICAL INTRODUCTION', 'PRINCETON UNIVERSITY PRESS', 2019);
INSERT INTO BOOK VALUES (103, 'MICROPROCESSOR ARCHITECTURE, PROGRAMMING & APPLICATIONS WITH THE 8085', 'PRENTICE HALL', 2002);
INSERT INTO BOOK VALUES (104, 'FORMAL LANGUAGES & AUTOMATA THEORY', 'PEARSON', 2016);
INSERT INTO BOOK VALUES(105, 'DATABASE MANAGEMENT SYSTEM', 'RANDOM HOUSE', 2017);
INSERT INTO BOOK VALUES(106, 'ADVANCED DATABASE MANAGEMENT SYSTEM', 'MCGRAW-HILL', 2016);
INSERT INTO BOOK VALUES(107, 'CYBERSECURITY', 'PLANETA', 2015);
INSERT INTO BOOK VALUES(108, 'OPERATING SYSTEM: A PRACTICAL APPROACH', 'PEARSON', 2018);

SELECT * FROM BOOK;

--3
INSERT INTO BOOK_AUTHORS VALUES (101, 'Herbert Schildt');
INSERT INTO BOOK_AUTHORS VALUES (102, 'Kieran Healy');
INSERT INTO BOOK_AUTHORS VALUES (103, 'Ramesh S. Gaonkar');
INSERT INTO BOOK_AUTHORS VALUES (104, 'K.V.N. Sunitha');
INSERT INTO BOOK_AUTHORS VALUES(105, 'NAVATHE');
INSERT INTO BOOK_AUTHORS VALUES(106, 'NAVATHE');
INSERT INTO BOOK_AUTHORS VALUES(107, 'MD FARHAN');
INSERT INTO BOOK_AUTHORS VALUES(108, 'GALVIN');

SELECT * FROM BOOK_AUTHORS;

--4
INSERT INTO LIBRARY_BRANCH VALUES (09,'CSE', 'SOET, CMRU, BENGALURU');
INSERT INTO LIBRARY_BRANCH VALUES(10,'RR NAGAR','BENGALURU');
INSERT INTO LIBRARY_BRANCH VALUES(11,'RNSIT','BENGALURU');
INSERT INTO LIBRARY_BRANCH VALUES(12,'RAJAJI NAGAR','BENGALURU');
INSERT INTO LIBRARY_BRANCH VALUES(13,'NITTE','MANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES(14,'MANIPAL','UDUPI');

SELECT * FROM LIBRARY_BRANCH;

--5
INSERT INTO BOOK_COPIES VALUES (101, 09, 10);
INSERT INTO BOOK_COPIES VALUES (102, 09, 12);
INSERT INTO BOOK_COPIES VALUES (103, 10, 15);
INSERT INTO BOOK_COPIES VALUES (104, 11, 30);
INSERT INTO BOOK_COPIES VALUES (105, 12, 50);
INSERT INTO BOOK_COPIES VALUES (106, 13, 8);
INSERT INTO BOOK_COPIES VALUES (107, 14, 11);
INSERT INTO BOOK_COPIES VALUES (108, 10, 16);

SELECT * FROM BOOK_COPIES;

--6
INSERT INTO BOOK_LENDING VALUES (101, 13, 2294, '2021-08-21', '2021-09-03');
INSERT INTO BOOK_LENDING VALUES (102, 10, 2351, '2021-08-28', '2021-09-10');
INSERT INTO BOOK_LENDING VALUES (103, 09, 2486, '2021-08-30', '2021-09-12');
INSERT INTO BOOK_LENDING VALUES (104, 09, 2698, '2021-08-29', '2021-09-11');

SELECT * FROM BOOK_LENDING;