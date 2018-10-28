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