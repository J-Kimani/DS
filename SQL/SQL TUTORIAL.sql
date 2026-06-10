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

-- ORDER BY
SELECT COUNT(StudentID), city
FROM Student
GROUP BY City
ORDER BY City DESC;

-- NULL VALUES
SELECT FName, LName
FROM Student
WHERE Marks IS NULL;

-- IS NOT NULL
SELECT FName, LName
FROM Student
WHERE Marks IS NOT NULL;

SELECT * FROM Student;

-- UPDATE
UPDATE Student
SET Fname = 'John',
Lname = 'Doe'
WHERE StudentID = 11;

SELECT * FROM Student;

-- DELETE
DELETE FROM Student
WHERE City= 'Juja';


USE sql_learn;

SELECT * FROM Student;

-- IN OPERATOR
SELECT StudentID, FName, LName
FROM Student
WHERE City IN ('Nairobi', 'Kisumu', 'Karatina', 'Machakos');

-- BETWEEN
SELECT StudentID, FName, LName, Marks FROM Student
WHERE Marks BETWEEN 70 AND 100;

-- ALLIASES IN SQL
-- COLUMN ALIAS
SELECT StudentID as Id
from Student;

-- TABLE ALIAS
SELECT S.Fname, S.Lname
FROM Student as S;

-- SQL OPERATORS
-- NOT IN
SELECT * FROM Student;
SELECT FName, City
FROM Student
WHERE CITY NOT IN ('Nairobi', 'Kisumu');

-- IN
SELECT FName, LName, City
FROM Student
WHERE City IN ('Thika', 'Busia', 'Juja');

-- COMPARISON >, =, <, >=
SELECT * FROM Student;
SELECT * FROM Student WHERE Marks = 78;

-- LIKE CONDITION
-- Cities starting with N
SELECT * FROM Student
WHERE City LIKE 'N%';

-- Cities ending with i
SELECT * FROM Student
WHERE City LIKE '%i';

-- Cities starting with N and ending with i
SELECT * FROM Student
WHERE City LIKE 'N%i';

-- Cities containing 'su'
SELECT * FROM Student
WHERE City LIKE '%su%';

-- Cities with exactly 4 characters
SELECT * FROM Student
WHERE City LIKE '____'; 

-- CASE EXPRESSION
SELECT * FROM Student WHERE Marks IS NULL;
SELECT * FROM Student WHERE Marks IS NOT NULL;

-- EXAMPLE
SELECT CASE City
WHEN "Nairobi" THEN "Capital City"
WHEN "Thika" THEN "Industrial Town"
WHEN "Kisumu" THEN "Lake-side Town"
ELSE City
END AS CityCategory
FROM Student;

-- NORMALIZATION IN SQL
-- TRIGGERS
SELECT * FROM Student;

SELECT * FROM Student WHERE StudentID = 13;

-- OPERATIONS USING TRIGGER
-- DROP (Removes trigger form database
DROP TRIGGER add_marks;

-- DISPLAY (Show triggers in the database)
SHOW TRIGGERS in sql_learn;

-- INSERT 
-- BEFORE INSERT TRIGGERS
SELECT * FROM Student;
CREATE TRIGGER add_marks
BEFORE INSERT
ON Student
FOR EACH ROW
SET new.marks = new.marks + 6;

INSERT INTO Student (StudentID, FName, LName, Address, City, Marks)
VALUES (12, 'Alice', 'Wambui', 'Moi Avenue', 'Nakuru', 75);

INSERT INTO Student (StudentID, FName, LName, Address, City, Marks)
VALUES (13, 'David', 'Kiplagat', 'Stadium Road', 'Eldoret', 68);
DROP TRIGGER add_marks;

-- AFTER INSERT TRIGGERS
-- Create Final_mark table
CREATE TABLE final_mark (
marks int
);

-- Create the trigger
CREATE TRIGGER total_mark
AFTER INSERT
ON student
FOR EACH ROW
INSERT INTO final_mark VALUES(new.marks);

-- Insert a new student
INSERT INTO Student VALUES 
(14, 'Alice', 'Mwai', 'Avenue', 'Thika', 85);

-- Check the Student table
SELECT * FROM Student WHERE StudentID = 14;


-- Check the Final_mark table
SELECT * FROM final_mark;

USE sql_learn;
SELECT * FROM Student;

-- JOINS
-- INNER JOIN
/*
This type of join returns those records which have matching values in both
tables. So. if you perform an INNER JOIN operation between the Employee table
and the Projects table, all the tuples which have matching values in both the
tables will be given as output.

Syntax:

SELECT Table1.Column1,Table1.Column2,Table2.Column1, ....
FROM Table1
INNER JOIN Table2
ON Table1.MatchingColumnName = Table2.MatchingColumnName;
*/
-- CREATE A COURSES TABLE
CREATE TABLE Courses (
	CourseID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(50),
    Grade VARCHAR(2)
    );

-- INSERT COURSES
INSERT INTO Courses VALUES
(101, 1, 'Mathematics', 'B+'),
(102, 1, 'English', 'A-'),
(103, 2, 'Biology', 'A'),
(104, 3, 'Chemistry', 'C+'),
(105, 4, 'Physics', 'A+'),
(106, 5, 'Mathematics', 'B'),
(107, 6, 'English', 'A'),
(108, 7, 'Biology', 'C'),
(109, 11, 'Physics', 'A+'),
(110, 11, 'Mathematics', 'A+');

SELECT * FROM Courses;

-- GET STUDENT NAMES WITH THEIR COURSES
SELECT Student.StudentID, Student.Fname, Student.LName, Courses.CourseName, Courses.Grade
FROM Student
INNER JOIN Courses
ON Student.StudentID = Courses.StudentID;

-- GET STUDENTS FROM NAIROBI WITH THEIR COURSES
SELECT Student.Fname, Student.LName, Student.City, Courses.CourseName, Courses.Grade
FROM Student
INNER JOIN Courses
ON Student.StudentID = Courses.StudentID
WHERE Student.CIty = 'Nairobi';

-- GET STUDENTS WITH GRADES A OR A+
SELECT Student.Fname, Student.Lname, Student.Marks, Courses.CourseName, Courses.Grade
FROM Student
INNER JOIN Courses
ON Student.StudentID = Courses.StudentID
WHERE Courses.Grade IN ('A', 'A+');

-- COUNT HOW MANY COURSES EACH STUDENT TAKES
SELECT Student.FName, Student.LName, COUNT(Courses.CourseID) AS TotalCourses
FROM Student
INNER JOIN Courses
ON Student.StudentID = Courses.StudentID
GROUP BY Student.StudentID, Student.Fname, Student.LName;

/*
LEFT JOIN

The LEFT JOIN or the LEFT OUTER JOIN returns all the records from the left table
and also those records which satisfy a condition from the right table. Also, for
the records having no matching values in the right table, the output or the
result-set will contain the NULL values.

Syntax:

SELECT Table1.Column1,Table1.Column2,Table2.Column1, ....
FROM Table1
LEFT JOIN Table2
ON Table1.MatchingColumnName = Table2.MatchingColumnName;
*/
USE sql_learn;
SELECT Student.StudentID, Student.Fname, Student.Lname, Student.City, Courses.CourseName,
Courses.Grade
FROM Student
LEFT JOIN Courses ON Student.StudentID = Courses.StudentID;

-- Example 2: Show All Students with Their Total Courses (Including Those Without Courses)
SELECT Student.StudentID, Student.Fname, Student.Lname, Student.Marks, COUNT(Courses.CourseID)
AS TotalCourses
FROM Student
LEFT JOIN Courses ON Student.StudentID = Courses.StudentID
GROUP BY Student.StudentID, Student.Fname, Student.Lname, Student.Marks
ORDER BY TotalCourses DESC;

-- Example 3: Find Students Without Any Courses
SELECT Student.StudentID, STudent.Fname, Student.Lname, Student.City
FROM Student
LEFT JOIN Courses ON Student.StudentID = Courses.StudentID
WHERE Courses.CourseID IS NULL;

-- Example 4: Find Students Without Any Courses
SELECT Student.Fname, Student.Lname, Student.Marks,
COALESCE(Courses.CourseName, "No Course") AS CourseName,
COALESCE(Courses.Grade, "-") AS Grade
FROM Student
LEFT JOIN Courses ON Student.StudentID = Courses.StudentID
ORDER BY Student.StudentID;

/*
RIGHT JOIN

The RIGHT JOIN or the RIGHT OUTER JOIN returns all the records from the right
table and also those records which satisfy a condition from the left table. Also,
for the records having no matching values in the left table, the output or the
result-set will contain the NULL values.

Syntax:

SELECT Table1.Column1,Table1.Column2,Table2.Column1, ....
FROM Table1
RIGHT JOIN Table2
ON Table1.MatchingColumnName = Table2.MatchingColumnName;
*/
SELECT Student.StudentID, Student.Fname, Student.Lname, Courses.CourseID, 
Courses.CourseName, Courses.Grade
FROM Student
RIGHT JOIN Courses ON Student.StudentID = Courses.StudentID;

/*
To See the Real Difference, Let's Add Courses WITHOUT Students
First, add a course with no StudentID:
*/
INSERT INTO Courses VALUES
(111, NULL, "History", "A"),
(112, NULL, "Geography", "B+");

SELECT * FROM Courses;
SELECT Student.StudentID, Student.Fname, Student.Lname, Courses.CourseID, 
Courses.CourseName, Courses.Grade
FROM Student
RIGHT JOIN Courses ON Student.StudentID = Courses.StudentID;

-- Example 1: Find All Courses (Even Those Without Students)
SELECT COALESCE(Student.Fname, "Unassigned") AS StudentName, Courses.CourseID,
Courses.CourseName, Courses.Grade
FROM Student
RIGHT JOIN Courses ON Student.StudentID = Courses.StudentID
ORDER BY Courses.CourseID;

 -- Example 2: Count Students Per Course
 SELECT Courses.CourseID, Courses.CourseName, COUNT(Student.StudentID) AS StudentCount
 FROM Student
 RIGHT JOIN Courses ON Student.StudentID = Courses.StudentID
 GROUP BY Courses.CourseID, Courses.CourseName;
 
-- Example 3: Find Courses with No Students Assigned
SELECT Courses.CourseID, Courses.CourseName, Courses.Grade
FROM Student
RIGHT JOIN Courses ON Student.StudentID = Courses.StudentID
WHERE Student.StudentID is NULL;

 
