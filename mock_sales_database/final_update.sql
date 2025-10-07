DROP TABLE emps;

CREATE TABLE Emps (
    empID varchar(25),
    empName varchar(30),
    yrStarted INT,
    PRIMARY KEY (empID),
    CHECK (yrStarted > 2000)
    );
DROP TABLE projects;
 CREATE TABLE projects (
    projectID varchar(30),
    title varchar(45),
    projStart INT,
    managerID varchar(25) DEFAULT NULL,
    PRIMARY KEY (projectID),
    FOREIGN KEY (managerID) REFERENCES Emps(empID)
       ON DELETE SET NULL
    );
    
CREATE TABLE dependents (
    empRelate varchar(25),
    depNum varchar(20),
    depName varchar(30),
    relationship varchar(20),
    yrAdded varchar(4),
    PRIMARY KEY (empRelate, depNum),
    FOREIGN KEY (empRelate) REFERENCES Emps(empID)
        ON DELETE CASCADE
    );

INSERT INTO Emps VALUES ('1001', 'Cole', 2001);
INSERT INTO Emps VALUES ('1002', 'Eliza', 2016);
INSERT INTO Emps VALUES ('1003', 'Sam', 2011);

INSERT INTO projects VALUES ('101', 'Proj1', 2001, '1001');
INSERT INTO projects VALUES ('102', 'Proj2', 2004, '1001');
INSERT INTO projects VALUES ('103', 'Proj3', 2007, '1002');
INSERT INTO projects VALUES ('104', 'Proj4', 2002, '1002');
INSERT INTO projects VALUES ('105', 'Proj5', 2009, '1002');

INSERT INTO Dependents VALUES ('1001', 1, 'Wyatt', 'Brother', '2003');
INSERT INTO Dependents VALUES ('1001', 2, 'Yaga', 'Cat', '2024');
INSERT INTO Dependents VALUES ('1002', 1, 'Mario', 'Son', '2002');
INSERT INTO Dependents VALUES ('1002', 2, 'Luigi', 'Dog', '2018');

DELETE FROM Emps WHERE empID = '1001';

CREATE VIEW ProjectManager AS
    SELECT projects.projectID, projects.title, projects.managerID, Emps.empName
    FROM projects, Emps

    
DROP VIEW ProjectManager;


CREATE TABLE Boats (bID INT PRIMARY KEY, bcolor VARCHAR(10));

CREATE TABLE Sailors (sID INT PRIMARY KEY, sName VARCHAR(20), sRating INT DEFAULT -1);

CREATE TABLE Reservations (bID INT REFERENCES Boats, sID INT REFERENCES Sailors, dateRes DATE,

                 PRIMARY KEY (bID, sID, dateRes));
                 
INSERT INTO Sailors Values (201, 'n1', 9);
INSERT INTO Sailors Values (202, 'n2', 8);
INSERT INTO Sailors Values (203, 'n3', 9);

INSERT INTO Boats VALUES (101, 'Red');
INSERT INTO Boats Values (102, 'Blue');
INSERT INTO Boats Values (103, 'Red');

INSERT INTO Reservations VALUES (101, 201, DATE '2020-07-01');
INSERT INTO Reservations VALUES (101, 202, DATE '2020-07-04');
INSERT INTO Reservations VALUES (102, 201, DATE '2020-07-09');

SELECT Sailors.sID, count(Reservations.bID) FROM Sailors, Reservations WHERE Reservations.bID = 101;
    
SELECT sID, COUNT(*) AS numRes
FROM Reservations
GROUP BY sID;  

SELECT r.sID, COUNT(r.dateRes) AS numRes, s.sName
FROM Reservations r
JOIN Sailors s ON r.sID = s.sID
GROUP BY r.sID, s.sName;

SELECT s.sID, COUNT(r.dateRes) AS numRes
FROM Sailors s
LEFT JOIN Reservations r ON s.sID = r.sID
GROUP BY s.sID;

CREATE TABLE libCustomers(
    cID varchar(15),
    cName varchar (25),
    PRIMARY KEY (cID)
    );
    
CREATE TABLE libAuthors (
    aID varchar(15),
    aName varchar (25),
    PRIMARY KEY (aID)
    );

CREATE TABLE libBooks (
    ISBN varchar(30),
    bookTitle varchar(30),
    PRIMARY KEY (ISBN)
    );
    
CREATE TABLE libWrites (
    ISBN varchar(30),
    aID varchar(15),
    authorPos varchar(20),
    PRIMARY KEY (ISBN, aID),
    FOREIGN KEY (ISBN) REFERENCES libBooks(ISBN),
    FOREIGN KEY (aID) REFERENCES libAuthors(aID)
    );


CREATE TABLE libBCopies (
    cNum varchar(15),
    condition varchar(255),
    ISBN varchar(30),
    PRIMARY KEY (cNum, ISBN),
    FOREIGN KEY (ISBN) REFERENCES libBooks(ISBN)
    );

CREATE TABLE libChecksOut (
    checkOutDate DATE,
    dueDate DATE,
    cNum varchar(15),
    cID varchar(15),
    ISBN varchar(30),
    PRIMARY KEY (cID, ISBN),
    FOREIGN KEY (cID) REFERENCES libCustomers(cID),
    FOREIGN KEY (cNum, ISBN) REFERENCES libBCopies(cNum, ISBN)
);

INSERT INTO Sailors (sID) values (301);

















