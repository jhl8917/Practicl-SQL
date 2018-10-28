CREATE DATABASE Corporation;
CREATE TABLE Corporation.Employees
(firstname VARCHAR(20),
lastname VARCHAR(20),
department VARCHAR(20),
hiredate DATE,
supervisor INT CHECK (supervisor > 1000 AND supervisor < 2000),
id INT PRIMARY KEY CHECK (id > 1000 AND id < 3000));
INSERT INTO Corporation.Employees VALUES 
("John", "Wood", "Sales", "20120115", 1001, 1501);
INSERT INTO Corporation.Employees VALUES 
("Mary", "Green", "Sales", "20120115", 1501, 1601);
INSERT INTO Corporation.Employees VALUES 
("Daniel", "Grant", "Sales", "20120115", 1501, 1602);
INSERT INTO Corporation.Employees VALUES 
("Nancy", "Jackson", "Accounting", "20120220", 1501,1701);
INSERT INTO Corporation.Employees VALUES 
("Tom", "Smith", "Accounting", "20120315", 1701, 1801);
INSERT INTO Corporation.Employees VALUES 
("Jessica", "Smith", "Accounting", "20120315", 1701, 1901);
SELECT * FROM Corporation.Employees;
USE Corporation;
SELECT * FROM Employees;

ALTER TABLE Employees
MODIFY hiredate VARCHAR(20) NOT NULL;
SELECT * FROM Employees;

ALTER TABLE Employees
ADD (zipcode VARCHAR(10), address VARCHAR(100));
SELECT * FROM Employees;
ALTER TABLE Employees
DROP COLUMN tiltel;
SELECT * FROM Employees;
ALTER TABLE Employees
ADD title VARCHAR(50);
UPDATE Employees SET title = "Boss" WHERE id=1501;
ALTER TABLE Employees
RENAME TO Hires;
SELECT * FROM Employees;
ALTER TABLE Employees
DROP COLUMN title;
ALTER TABLE Employees DROP COLUMN zipcode;
ALTER TABLE Employees DROP COLUMN address;
USE Corporation;
SELECT * FROM Employees where (lastname = 'Smith');
USE Corporation;
SELECT * FROM Employees where (id = '1501');
USE Corporation;
SELECT firstname, lastname FROM Employees;
USE Corporation;
ALTER TABLE Employees
ADD salary VARCHAR(10);
SELECT * FROM Employees;
SELECT MAX(salary) FROM Employees;
USE Corporation;
SELECT firstname, lastname, hiredate, CURRENT_TIMESTAMP FROM Employees;
SELECT firstname, lastname, COALESCE(id, supervisor) FROM Employees;
SELECT firstname, lastname, id + 1000 FROM Employees;
SELECT firstname, lastname, id * 2 FROM Employees;
USE Corporation;
SELECT * FROM Employees ORDER BY lastname;
SELECT * FROM Employees ORDER BY id;
SELECT * FROM Employees ORDER BY hiredate;
SELECT firstname, lastname FROM Employees ORDER BY id;
SELECT * FROM Employees ORDER BY MONTH(hiredate);
SELECT * FROM Employees ORDER BY lastname, firstname;
SELECT * FROM Employees ORDER BY 2, 1;
SELECT firstname, lastname FROM Employees ORDER BY 2, 1;
SELECT * FROM Employees ORDER BY 2, 1, 3;
SELECT * FROM Employees ORDER BY hiredate DESC;
SELECT * FROM Employees ORDER BY lastname, firstname DESC;
SELECT * FROM Employees ORDER BY CASE firstname
WHEN 'Tom' THEN 0
WHEN 'Nancy' THEN 1
WHEN 'Daniel' THEN 2
WHEN 'John' THEN 3
WHEN 'Jessica' THEN 4
WHEN 'Mary' THEN 5
END;
SELECT * FROM Employees ORDER BY CASE id
WHEN id < 1600 THEN 1
WHEN id < 1700 THEN 2
WHEN id < 2000 THEN 3
END, lastname;
USE Corporation;
ALTER TABLE Employees
MODIFY hiredate DATE;
SELECT * FROM Employees WHERE lastname = 'Smith';
SELECT * FROM Employees WHERE department != 'Sales';
SELECT * FROM Employees WHERE id BETWEEN 1601 AND 1801;
SELECT * FROM Employees WHERE hiredate > "20120116";
SELECT * FROM Employees WHERE hiredate BETWEEN "20120301" AND "20120315";
SELECT * FROM Employees WHERE lastname BETWEEN "helicopter" AND "starling";
SELECT * FROM Employees WHERE  id IS  NOT NULL;
SELECT * FROM Employees WHERE lastname IN ("Green", "Grant", "Smith");
SELECT * FROM Employees WHERE  id IN (1501, 1601, 1701,1901);
SELECT * FROM Employees WHERE  id NOT IN (1501, 1601, 1701,1901);
SELECT * FROM Employees WHERE firstname LIKE '____';
SELECT * FROM Employees WHERE lastname LIKE 'J%';
SELECT * FROM Employees WHERE firstname LIKE '_a%';
SELECT * FROM Employees WHERE firstname REGEXP '^[a-x]+$';
SELECT * FROM Employees WHERE lastname REGEXP '^[a-r]+$';
SELECT id, Supervisor FROM Employees;
SELECT * FROM Employees WHERE id IN (SELECT Supervisor FROM Employees);
SELECT * FROE M Employees WHERE id > ALL (SELECT Supervisor FROM Employees);
SELECT * FROM Employees WHERE id = ANY (SELECT Supervisor FROM Employees);
SELECT * FROM Employees WHERE id = SOME (SELECT Supervisor FROM Employees);
SELECT * FROM Employees WHERE EXISTS (SELECT lastname FROM Employees WHERE lastname = "Wood");
SELECT * FROM Employees WHERE EXISTS (SELECT lastname FROM Employees WHERE firstname = "John" AND lastname = "Wood");
SELECT * FROM Employees WHERE DISTINCT (SELECT lastname FROM Employees);
WHERE UNIQUE (SELECT lastname FROM Employees); 
SELECT DISTINCT lastname FROM Employees; 
SELECT * FROM Employees WHERE ('John', 'Wood') MATCH (SELECT firstname, lastname FROM Employees);
SELECT * FROM Employees WHERE (firstname = 'John' AND lastname = 'Wood');
SELECT * FROM Employees WHERE (department = 'Accounting' AND hiredate > "20120301");
SELECT * FROM Employees WHERE (department = 'Accounting' AND hiredate > "20120301" AND id > 1900);
SELECT * FROM Employees WHERE (lastname = 'Green' OR lastname = 'Grant');
SELECT * FROM Employees WHERE (lastname = 'Green' OR lastname = 'Grant' OR lastname = 'Smith');
SELECT * FROM Employees WHERE ((lastname = 'Green' OR lastname = 'Smith') AND Department = 'Accounting');
SELECT * FROM Employees WHERE lastname = 'Smith';
SELECT * FROM Employees WHERE lastname != 'Smith';
SELECT * FROM Employees WHERE NOT lastname = 'Smith';

## Updating Your Data Chapter 7
USE Corporation;
SELECT * FROM Employees;
UPDATE Employees SET department = 'Sales' WHERE id = 1801;
UPDATE Employees SET firstname = 'Karen', lastname = 'Jones' WHERE id = 1801;
UPDATE Employees SET firstname = 'Tom', lastname = 'Smith',department = 'Sales' WHERE id = 1801;
## UPDATE Employees SET supervisor = (SELECT id FROM Employees WHERE lastname ='Green') 
## WHERE id = 1901; This doesn't  work. Error code 1093- You can't specify target table 'cancome' for update in FROM clause
UPDATE Employees SET supervisor = (SELECT id FROM (SELECT * FROM Employees) AS Sub_Employees WHERE lastname ='Green') 
WHERE id = 1901;
ALTER TABLE Employees
DROP COLUMN salary;
## INSERT INTO Employees
## (firstname, lastname, department, hiredate, supervisor,id)
## SELECT * FROM Employees WHERE lastname = 'Grant'; Error code 1062

## INSERT INTO Employees (firstname, lastname,id)
## SELECT firstname, lastname, id
## FROM Employees WHERE id =1901;

SELECT *
INTO Staff
FROM Employees;

CREATE TABLE Staff AS
SELECT * FROM Employees;
SELECT * FROM Staff;
USE Corporation;

DROP Staff_2;

## INSERT INTO Employees (firstname, lastname, department, hiredate, supervisor,id)
## SELECT * FROM Staff WHERE
SELECT * FROM Staff_2;
CREATE TABLE Staff_3 AS
SELECT firstname, lastname, id FROM Employees;
DELETE FROM StaffT_2 WHERE lastname = 'Wood';

## Chapter 8 SQL's built-in Function

SELECT CURRENT_TIME();
SELECT CURRENT_DATE();

SELECT CURRENT_TIMESTAMP();

SELECT CURRENT_USER();

SELECT SESSION_USER();
SELECT SYSTEM_USER();
SELECT BIT_LENGTH(7);
SELECT CHAR_LENGTH ('I Love You');
USE Corporation;
SELECT lastname ,CHAR_LENGTH(lastname) FROM Employees;
SELECT OCTET_LENGTH(10);
SELECT lastname, EXTRACT(DAY FROM hiredate), EXTRACT(YEAR FROM hiredate) FROM Employees;
SELECT lastname, POSITION( 'a' IN lastname) FROM Employees;
SELECT department, POSITION( 'a' IN department) FROM Employees;
SELECT CONCAT('Hello ', 'there');
SELECT CONCAT('Apollo ', '11');
SELECT LOWER('I LOVE YOU');
SELECT UPPER('What? I can\'t hear you!');
SELECT SUBSTR('I love you',8, 3);
SELECT firstname,lastname, CONCAT(SUBSTR(firstname,1,1), LOWER(SUBSTR(lastname, 1,1)), '@', id) FROM Employees;
SELECT firstname,lastname, CONCAT(SUBSTR(firstname,1,1), LOWER(SUBSTR(lastname, 1,1)), '@', id) AS password FROM Employees;
SELECT TRIM('  SQL   ');
SELECT TRIM(LEADING 'x' FROM 'xxxxxxxSQLxxxxx');
SELECT TRIM(TRAILING 'x' FROM 'xxxxxxxSQLxxxxx');
SELECT TRIM(BOTH 'x' FROM 'xxxxxxxSQLxxxxx');
SELECT POW(2,3);
SELECT POW(3,4)
USE Corporation;
SELECT * FROM Employees;
SELECT LTRIM('    SQL     ');
SELECT ASCII('J LOVE YOU');
SELECT EXP(2);
SELECT SIN(DEGREES(60));
SELECT COS(DEGREES(60));

## CHpater 9 Joining Tables
USE Corporation;
CREATE TABLE Supervisors
(firstname VARCHAR(20),
lastname VARCHAR(20),
id INT,
extension INT);
INSERT INTO Supervisors VALUES ('George', 'Edwards', 1001,231);
INSERT INTO Supervisors VALUES ('John', 'Wood', 1501,244);
INSERT INTO Supervisors VALUES ('Nancy', 'Jackson', 1701,255);
SELECT * FROM Employees;
SELECT * FROM Supervisors;

## JOINING TWO TABLES IN THE SAME DATABASE

SELECT Employees.firstname, Employees.lastname, extension
FROM Employees, Supervisors
WHERE Employees.supervisor = Supervisors.id;

## INNER JOINS

SELECT Employees.firstname, Employees.lastname, extension
FROM Employees INNER JOIN Supervisors
ON Employees.supervisor = Supervisors.id;

SELECT CONCAT(Employees.firstname, ' ', Employees.lastname) AS fullname, extension AS 'supervisor extention'
FROM Employees INNER JOIN Supervisors
ON Employees.supervisor = Supervisors.id;

## USING ALIASES FOR TABLES

SELECT CONCAT(E.firstname, ' ', E.lastname) AS fullname, extension AS 'supervisor extention'
FROM Employees AS E INNER JOIN Supervisors AS S
ON E.supervisor = S.id;

## OUTER JOINS

SELECT E.firstname, E.lastname, extension
FROM Employees AS E INNER JOIN Supervisors AS S
ON E.id = S.id;

## LEFT OUTER JOINS: ALL employees appear in the result joined, the values are NULL if the JOIN codtion was not true. 

SELECT E.firstname, E.lastname, extension
FROM Employees AS E LEFT OUTER JOIN Supervisors AS S
ON E.id = S.id;

## RIGHT OUTER JOINS: ALL supervisors appear in the result joined, the values are NULL if the JOIN codtion was not true. 

SELECT E.firstname, E.lastname, extension
FROM Employees AS E RIGHT OUTER JOIN Supervisors AS S
ON E.id = S.id;

## CHPTER 10 AGGREGATING ANF GROUPING DATA
SELECT MAX(id) FROM Employees;
SELECT MIN(id) FROM Employees;
SELECT AVG(id), MAX(id),MIN(id),count(id), SUM(id) FROM Employees;

SELECT firstname, lastname FROM Employees
WHERE id = (SELECT MAX(id) FROM Employees);

SELECT SUM(id)/COUNT(id) FROM Employees;

SELECT COUNT(DISTINCT lastname) AS 'Distinct last Name' FROM Employees;
SELECT department FROM Employees GROUP BY department;
SELECT department, COUNT(*) AS 'numner' FROM Employees GROUP BY department;
SELECT department, COUNT(*) AS 'numner', AVG(id) AS 'average number' FROM Employees GROUP BY department;
SELECT department, supervisor,COUNT(id) FROM Employees GROUP BY department,supervisor;
SELECT department, supervisor,COUNT(id) FROM Employees GROUP BY department,supervisor;
SELECT department, supervisor,COUNT(id) FROM Employees GROUP BY department,supervisor
ORDER BY department,supervisor;

## CHAPTER 11 VIEWS, UNIONS, AND VARIABLES
SELECT * FROM Employees;

UPDATE Employees SET department = 'Accounting' WHERE id = 1801;
UPDATE Employees SET supervisor = 1701 WHERE id = 1901;
SELECT * FROM Supervisors;
SELECT E.firstname, E.lastname, E.department, S.extension AS 'supervisor extension'
FROM Employees AS E INNER JOIN Supervisors AS S
ON E.supervisor = S.id;
SELECT E.firstname, E.lastname, E.department, S.extension AS 'supervisor extension'
FROM Employees AS E INNER JOIN Supervisors AS S
ON E.supervisor = S.id WHERE E.department = 'Sales';

CREATE VIEW Phonebook AS
SELECT E.firstname, E.lastname, E.department, S.extension AS 'supervisor extension'
FROM Employees AS E INNER JOIN Supervisors AS S
ON E.supervisor = S.id;
SELECT * FROM Phonebook WHERE E.department = 'Sales';

SELECT * FROM Phonebook;
SELECT * FROM Phonebook WHERE department = 'Sales';
SELECT * FROM Phonebook WHERE department = 'Accounting';
SELECT * FROM Phonebook WHERE lastname = 'Smith';
SELECT CONCAT(firstname, ' ', lastname) AS 'Full Name', id FROM Employees
ORDER BY id;
CREATE VIEW idview AS
SELECT CONCAT(firstname, ' ', lastname) AS 'Full Name', id FROM Employees
ORDER BY id;

SELECT * FROM idview;
SELECT * FROM idview WHERE id > 1601;

CREATE VIEW EmployeesShort AS
SELECT firstname, lastname, department, supervisor,id FROM Employees;

SELECT * FROM EmployeesShort;

CREATE VIEW SupervisorOKPHONE AS
SELECT * FROM Supervisors
WHERE extension IS NOT NULL;

CREATE VIEW Salary AS
SELECT firstname, lastname,
CASE WHEN id = 1501 THEN 60000 ELSE 45000 END
AS salary FROM Employees;

SELECT * FROM Salary;

CREATE VIEW AllEmployees AS
SELECT CONCAT(firstname, ' ', lastname) AS 'Full Name' FROM Employees
UNION
SELECT CONCAT(firstname, ' ', lastname) AS 'Full Name' FROM Supervisors
WHERE id NOT IN
(SELECT id FROM Employees);

SELECT * FROM ALlEmployees;
DROP VIEW employeeshort;
## Understanding variables
SET @a = 5;
SET @b = 10;
SELECT @a AS 'a', @b AS 'b', @c :=@a + @b AS 'c = a + b';

SET @id1 = 1901;
SELECT * FROM Employees WHERE id = @id1;

## CHPATER 12 STORED PROCEDURES AND CURSORS
USE Corporation;
## CREATING A PRODECURE (NOT CORRECT STEPS IN THE BOOK)
DELIMITER //
CREATE PROCEDURE updatetable()
BEGIN
  UPDATE Employees SET department = 'Sales' WHERE id = 1801;
END
;

CALL updatetable();
SELECT * FROM Employees;

DELIMITER //
CREATE PROCEDURE return6 (OUT param1 INT)
BEGIN
SET param1 = 6;
END
//

CALL return6(@b);
DELIMITER;
USE Corporation;
SELECT * FROM Employees;
DELIMITER //
CREATE PROCEDURE updater2(IN new_supervisor INT)
BEGIN
  UPDATE Employees SET supervisor = new_supervisor WHERE id = 1701;
END;

CALL updater2(1001);
SELECT * FROM Employees;

DELIMITER //
CREATE PROCEDURE updater3(IN emp_id INT, new_supervisor INT)
BEGIN
 UPDATE Employees SET supervisor = new_supervisor WHERE id =emp_id;
END;

CALL updater3(1701, 1002);
USE Corporation;
SELECT * FROM Employees;
CALL updater3(1901,1001);
SELECT * FROM Employees;
CALL updater3(1501,1001);
CALL updater3(1601,1501);
CALL updater3(1602,1501);
CALL updater3(1701,1501);
CALL updater3(1801,1701);
CALL updater3(1901,1701);


DELIMITER //
CREATE PROCEDURE adder(IN a INT, IN b INT, OUT c INT)
BEGIN SET c = a + b;
END;

USE Corporation;

DROP PROCEDURE caller;

DELIMITER //
CREATE PROCEDURE caller(IN p1 INT, IN p2 INT, OUT p3 INT)
BEGIN
CALL adder(p1,p2,p3);
END;

DELIMITER;
CALL caller(1, 2, @a);

SELECT @a;













