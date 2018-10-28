## Chapter 13 Usippng Transaction

USE Corporation;
SELECT * FROM Employees;
START TRANSACTION;
UPDATE Employees SET department = 'Sales' WHERE id = 1701;
SELECT * FROM Employees;
COMMIT;
SELECT * FROM Employees;

START TRANSACTION;
SAVEPOINT update1;
UPDATE Employees SET department = 'Sales' WHERE id = 1701;
ROLLBACK TO SAVEPOINT update1;

## Chpater 14 Understanding constraints and triggers

ALTER TABLE Supervisors
ADD CONSTRAINT
FOREIGN KEY(id) REFERENCES Employees(id);
UPDATE Supervisors SET id = 1601 WHERE id = 1001;

## CREATING TRIGERS
DELIMITER //
CREATE TRIGGER upper BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
SET NEW.lastname = UPPER(NEW.lastname);
END;

INSERT INTO Employees VALUES
('Tony', 'Liu', 'Sales', '20181007',2004,1909);

SELECT * FROM Employees;

## Chapterc 15 ADVANCED SQL TOPICS
USE Corporation;
DELIMITER //
CREATE PROCEDURE checktemp1()
BEGIN
SET @temperature = 90;
IF @temperature > 72 THEN
SET @temperature = 72;
END IF;
END;
DELIMITER;
CALL checktem1();

SELECT @temperature;

DROP PROCEDURE checktemp;

DELIMITER //
CREATE PROCEDURE geticecream( IN person VARCHAR(20))
BEGIN
IF person = 'Dave' THEN
SET @icecream = 'Strawberry';
ELSE SET @icecream = 'Chocolate';
END IF;
END;
USE Corporation;
DELIMITER ;
CALL geticecream('May');
SELECT @icecream;

DELIMITER //
CREATE PROCEDURE getday1(IN day VARCHAR(20))
BEGIN
CASE day
WHEN "Sunday" THEN SET @day = "Day off";
WHEN "Monday" THEN SET @day = "very busy";
WHEN "Tuesday" THEN SET @day = "Oh well";
WHEN "Wednesday" THEN SET @day = "Working, Working, working";
WHEN "Thursday" THEN SET @day = "Nearly there";
WHEN "Friday" THEN SET @day = "TGIF!";
WHEN "Satday" THEN SET @day = "Day off";
ELSE SET @day = "Not a valid argumant";
END CASE;
END;

DELIMITER ;

CALL getday1('Friday');
SELECT @day;

DROP PROCEDURE getday;

DELIMITER //
CREATE PROCEDURE looptest1()
BEGIN
SET @a= 0;
Looper: LOOP
SET @a = @a + 1;
IF @a > 9 THEN 
LEAVE Looper;
END IF;
END LOOP;
END;
DELIMITER ;

CALL looptest1();

DROP PROCEDURE looptest;
SELECT @a;


DELIMITER //
CREATE PROCEDURE dowhile()
BEGIN
SET @a= 0;
WHILE @a < 20 DO
SET @a = @a + 1;
END WHILE;
END;
DELIMITER ;
CALL dowhile();
SELECT @a;

DELIMITER //
CREATE PROCEDURE dorepeat()
BEGIN
SET @a= 0;
REPEAT
SET @a = @a + 1;
UNTIL @a > 29 END REPEAT;
END;

DELIMITER ;
CALL dorepeat();
SELECT @a;

DELIMITER //
CREATE PROCEDURE doiterate()
BEGIN
SET @a= 0;
lable1: LOOP
SET @a = @a + 1;
IF @a <100
THEN ITERATE lable1;
END IF;
LEAVE lable1;
END LOOP;
END;

DELIMITER ;
CALL doiterate();
SELECT @a;
## Chapter 16  CREATING AND ADMINISTRATING USER ACCOUNT IN SQL.
CREATE USER 'john'@'localhost' IDENTIFIED BY 'Home8917';

SELECT * FROM mysql.user;

GRANT ALL PRIVILEGES ON *.* TO 'john'@'localhost';
SHOW GRANTS FOR 'john'@'localhost';

##  FINISHED learning this book. Great Job!!


