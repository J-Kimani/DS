DROP DATABASE sql_learn;

CREATE DATABASE sql_learn;

USE sql_learn;

CREATE TABLE emp(
id INT NOT NULL AUTO_INCREMENT,
ename VARCHAR(20),
address VARCHAR(30),
PRIMARY KEY(id)
);

DROP TABLE emp;

CREATE TABLE Student(
StudentID INT NOT NULL AUTO_INCREMENT,
FName VARCHAR(20),
LName VARCHAR(20),
Address VARCHAR(30),
City VARCHAR(15),
Marks INT,
PRIMARY KEY(StudentId)
);

-- populate the table
INSERT INTO Student (FName, LName, Address, City, Marks) VALUES
('John',    'Kamau',   'Ngong Road',        'Nairobi', 78),
('Mary',    'Achieng', 'Kisumu Central',    'Kisumu',  85),
('Peter',   'Mwangi',  'Thika Road',        'Thika',   67),
('Jane',    'Wanjiku', 'Westlands',         'Nairobi', 92),
('Daniel',  'Otieno',  'Milimani',          'Kisumu',  74),
('Faith',   'Njeri',   'Karatina Town',     'Karatina',88),
('Brian',   'Mutua',   'Machakos Junction', 'Machakos',61),
('Lucy',    'Atieno',  'Busia Road',        'Busia',   70),
('Samuel',  'Kiptoo',  'Kipchoge Street',   'Eldoret', 81),
('Grace',   'Chebet',  'Nandi Hills',       'Nandi',   90);



 -- Select statement
SELECT * FROM Student;

SELECT Fname, LName FROM Student;

-- Select student from city Nandi
SELECT FNAME
FROM Student
WHERE City = 'Nandi';

-- AND OPERATOR
SELECT * FROM student
WHERE Fname = 'Faith' AND Lname= 'Njeri';

-- OR OPERATOR
SELECT * FROM student
WHERE Fname = 'Faith' OR Lname= 'Mutua';

-- NOT OPERATOR
SELECT * FROM Student
WHERE not Fname = "John";

-- INSERT INTO
INSERT INTO Student(Fname, Lname, Address, City, Marks)
VALUES('Joshua', 'Karanja', 'Thika Road', 'Juja', 99);

SELECT * FROM Student;

-- AGGREGATE FUNCTIONS
-- COUNT
SELECT COUNT(StudentID)
FROM Student
WHERE Address = "Thika Road";

-- AVERAGE
SELECT AVG(Marks)
From Student;

SELECT * FROM Student;

-- SUM
SELECT SUM(Marks)
From Student;

-- MINIMUM
SELECT FName, LName, Marks
FROM Student
WHERE Marks = (SELECT MIN(Marks) FROM Student);

-- MAXIMUM
SELECT FName, LName, Marks
FROM Student
WHERE Marks = (SELECT MAX(Marks) FROM Student);

-- GROUP BY
SELECT COUNT(StudentID), City
FROM Student
Group By City;

USE sql_learn;

SELECT * FROM Student;

-- HAVING
SELECT FName, SUM(Marks)
FROM Student
GROUP BY FName
HAVING SUM(Marks) > 80;

















