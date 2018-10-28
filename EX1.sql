CREATE DATABASE test;
USE test;
CREATE TABLE fruit (name VARCHAR(20), number INT, id INT PRIMARY KEY);
INSERT INTO fruit VALUES ("apples", 1020,109);
INSERT INTO fruit VALUES ("oranges", 3329,103);
INSERT INTO fruit VALUES ("bananas", 8582,107);
INSERT INTO fruit VALUES ("pears", 234,101);
SELECT * FROM FRUIT;
SELECT name FROM FRUIT;
SELECT name, number FROM FRUIT;
SELECT * FROM fruit WHERE name="pears";
SELECT * FROM fruit WHERE name IN("pears","apples");
SELECT * FROM fruit WHERE name NOT IN("pears","apples");