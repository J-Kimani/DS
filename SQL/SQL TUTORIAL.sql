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

/* FULL JOIN

Full Join or the Full Outer Join returns all those records which either have a
match in the left(Table1) or the right(Table2) table.

Syntax:

SELECT Table1.Column1,Table1.Column2,Table2.Column1, ....
FROM Table1
FULL JOIN Table2
ON Table1.MatchingColumnName = Table2.MatchingColumnName;
*/
use sql_learn;
SELECT Student.StudentID, Student.Fname, Student.Lname, Courses.CourseID, Courses.CourseName,
Courses.Grade
FROM Student
LEFT JOIN Courses ON Student.StudentID = Courses.StudentID

UNION

SELECT Student.StudentID, Student.Fname, Student.Lname, Courses.CourseID, Courses.CourseName,
Courses.Grade
From Student
RIGHT JOIN Courses ON Student.StudentID = Courses.StudentID;

-- Example 1: Show All with Better Formatting
SELECT COALESCE(Student.StudentID, 'No Student') AS StudentID,
       COALESCE(Student.Fname, 'Unassigned') AS StudentName,
       COALESCE(Courses.CourseID, 'No Course') AS CourseID,
       COALESCE(Courses.CourseName, 'Unassigned') AS CourseName,
       COALESCE(Courses.Grade, '-') AS Grade
FROM Student
LEFT JOIN Courses ON Student.StudentID = Courses.StudentID

UNION

SELECT COALESCE(Student.StudentID, 'No Student') AS StudentID,
       COALESCE(Student.Fname, 'Unassigned') AS StudentName,
       COALESCE(Courses.CourseID, 'No Course') AS CourseID,
       COALESCE(Courses.CourseName, 'Unassigned') AS CourseName,
       COALESCE(Courses.Grade, '-') AS Grade
FROM Student
RIGHT JOIN Courses ON Student.StudentID = Courses.StudentID;

-- Example 2: Count Statistics
SELECT 
    COUNT(CASE WHEN Student.StudentID IS NOT NULL AND Courses.CourseID IS NOT NULL THEN 1 END) AS MatchingPairs,
    COUNT(CASE WHEN Student.StudentID IS NOT NULL AND Courses.CourseID IS NULL THEN 1 END) AS StudentsNoCoursess,
    COUNT(CASE WHEN Student.StudentID IS NULL AND Courses.CourseID IS NOT NULL THEN 1 END) AS CoursesNoStudents
FROM Student
LEFT JOIN Courses ON Student.StudentID = Courses.StudentID

UNION ALL

SELECT 
    COUNT(CASE WHEN Student.StudentID IS NOT NULL AND Courses.CourseID IS NOT NULL THEN 1 END),
    COUNT(CASE WHEN Student.StudentID IS NOT NULL AND Courses.CourseID IS NULL THEN 1 END),
    COUNT(CASE WHEN Student.StudentID IS NULL AND Courses.CourseID IS NOT NULL THEN 1 END)
FROM Student
RIGHT JOIN Courses ON Student.StudentID = Courses.StudentID;

-- Example 3: Find All Unmatched Records
SELECT Student.StudentID, Student.Fname, Student.LName,
       Courses.CourseID, Courses.CourseName
FROM Student
LEFT JOIN Courses ON Student.StudentID = Courses.StudentID
WHERE Courses.CourseID IS NULL

UNION

SELECT Student.StudentID, Student.Fname, Student.LName,
       Courses.CourseID, Courses.CourseName
FROM Student
RIGHT JOIN Courses ON Student.StudentID = Courses.StudentID
WHERE Student.StudentID IS NULL;


USE sql_learn;
-- FUNCTIONS
-- CONVERSION FUNCTIONS
/* The conversion built-in functions are used to convert a expr from one data type to another

Function		Syntax						Description
CAST		CAST(expr AS datatype)
CONVERT		CONVERT(datatype,expr)			Returns value of specfied datatype on success
PARSE		PARSE(value AS datatype)		Throws error on failre
TRY_CAST	TRY_CAST(expr AS datatype)
TRY_CONVERT	TRY_CONVERT(datatype,expr)		Returns value of specified datatype on success
TRY PARSE	TRY_PARSE(value AS datatype)	NULL on falure
*/

-- Example 1: CAST - Convert String to Number
SELECT StudentID, Fname, LName, Marks,
       CAST(Marks AS CHAR(5)) AS MarksAsText,
       CAST('100' AS SIGNED INT) * 2 AS StringToNumber
FROM Student
LIMIT 5;

-- Example 2: Convert to Decimal (with precision) 
SELECT StudentID, Fname, Marks,
		CAST(Marks AS DECIMAL(5, 2)) AS MarksDecimal
FROM Student
LIMIT 5;

-- Example 3: String to Signed Integer
SELECT 
       CAST('50' AS SIGNED) + 20 AS AddNumbers,
       CAST('100' AS SIGNED) * 2 AS MultiplyNumbers;

-- Example 4: Using COALESCE with CAST

SELECT StudentID, Fname, LName,
       CAST(StudentID AS CHAR) AS IDText,
       CAST(Marks AS DECIMAL(5,1)) AS MarksPrecision,
       CONCAT(CAST(Marks AS CHAR), ' out of 100') AS MarksDescription
FROM Student
LIMIT 5;

-- Example 5: Try Without Error Handling
SELECT StudentID , Fname,
	CAST(Marks AS SIGNED) AS SafeConversion,
    COALESCE(CAST(Marks AS DECIMAL(5,2)), 0) AS SafeWithDefault
FROM Student
LIMIT 5;

-- Get All Students with Text Conversions
SELECT StudentID,
	CONCAT(Fname, ' ', LName) AS FullName,
    CAST(Marks AS CHAR) AS MarksText,
    CAST(CAST(Marks AS DECIMAL(5,1)) / 100 AS CHAR) AS PercentageText
FROM Student
WHERE Marks > 75
LIMIT 10;

-- Convert and Calculate
SELECT StudentID, Fname,
	Marks AS OriginalMarks,
    CAST(Marks AS SIGNED) + 10 AS MarksPlus10,
    CAST(Marks AS DECIMAL(5,2)) / 100 AS PercentageOfHundered
FROM Student
LIMIT 5;

use sql_learn;

/** Logical Functions

Logical functions can be used to display one of several values based on a logical conditions

Function

CHOOSE

IIF

Syntax
CHOOSE ( index, val_1, val_2 [, val_n ])

IIF ( boolean_expr, true_value, false_value )

Description
Return a specified index from a list of values. Return
NULL, if index is 0 or greater than number of items
Return one of two values, based on whether the
Boolean expr evaluates to true or false
**/
-- IF FUNCTION
SELECT IF(1>10, 'True', 'False');

use sql_learn;

-- Example 1: Basic IF - Pass or Fail
SELECT StudentID, Fname, LName, Marks,
	IF(Marks >= 70, 'PASS', 'FAIL') AS Status
FROM Student;

SELECT * FROM Student;

-- Example 2: Grade Classification
SELECT StudentID, Fname, LName, Marks, 
	IF(Marks >= 90, "A",
		IF(Marks >= 80, "B",
			IF(Marks >= 70, "C", "F"))) AS Grade
FROM Student
ORDER BY Marks DESC;

-- Example 3: Performance Category
SELECT StudentID, Fname, LName, Marks,
	IF (Marks > 80, "Excellent", "Good") AS Performance
FROM Student
WHERE Marks > 60;

-- Example 4: Calculate Bonus Based on Performance
SELECT StudentID, FName, LName, Marks,
	IF(Marks >= 80, Marks * 0.10,
		IF(Marks >= 70, Marks * 0.05, 0)) AS Bonus
FROM Student
ORDER BY Bonus DESC;

-- Example 5: Scholarship Eligibility
SELECT StudentID, Fname, LName, City, Marks,
	IF(Marks >= 85, "Eligible", "Not Eligible") AS ScholarshipStatus
FROM Student;

-- Example 6: Mark Range Classification
SELECT StudentID, Fname, Marks,
	IF(Marks >= 90, "Outstanding",
		IF(Marks >= 75, "Above Average",
			IF(Marks >= 60, "Average", "Below Average"))) AS Classification
FROM Student
ORDER BY Marks DESC;


use sql_learn;

-- Example 7: Conditional Concatenation
SELECT StudentID,
	CONCAT(Fname, " ", LName) AS FullName,
    Marks,
    CONCAT("Student: ", Fname, " - Status: ",
			IF(Marks >= 75, "PASS", "FAIL")) AS DetailedStatus
	FROM Student
    LIMIT 5;
    
SELECT * FROM Courses;

-- Example 8: IF with JOINs
SELECT Student.StudentID, Student.Fname, Student.Marks,
	IF(Courses.CourseID IS NOT NULL, "Has Course", "No Course") AS CourseStatus
FROM Student
LEFT JOIN Courses ON Student.StudentID = Courses.StudentID
LIMIT 10;

-- Example 9: Multiple Conditions with AND/OR
SELECT StudentID, Fname, Marks,
	IF(Marks >= 80 AND FName LIKE "J%", "Excellence Starting with J",
		IF(Marks >= 75, "Good Student", "Needs Improvement")) AS Comment
FROM Student;

-- Example 10: Comparison - IF vs CASE
-- Using IF (Nested)
SELECT Fname, Marks,
       IF(Marks >= 90, 'A', 
          IF(Marks >= 80, 'B', 
             IF(Marks >= 70, 'C', 'F'))) AS Grade
FROM Student;
-- Using CASE (Cleaner for Multiple Conditions)
SELECT Fname, Marks,
       CASE 
           WHEN Marks >= 90 THEN 'A'
           WHEN Marks >= 80 THEN 'B'
           WHEN Marks >= 70 THEN 'C'
           ELSE 'F'
       END AS Grade
FROM Student;

-- MATH FUNCTIONS
SELECT ABS(SQRT(16) - POW(4, 2)) AS RESULTSET;    

SELECT POWER(2, 9);

-- AGGREGATE FUNCTIONS
USE sql_learn;
-- AVERAGE
SELECT * FROM student;
SELECT AVG(Marks) AS AverageMarks
FROM Student;

-- Average Marks by City
SELECT City,
	ROUND(AVG(Marks), 2) AS AverageMarks,
    COUNT(*) AS TotalStudents
FROM Student
GROUP BY City
ORDER BY AverageMarks DESC;

-- Students Above Average
SELECT StudentID, Fname, Lname, Marks,
	ROUND(AVG(Marks) OVER (), 2) AS ClassAverage,
    IF (Marks > (SELECT AVG(Marks) FROM STUDENT), 'Above Average', 'Below Average') AS Perfomance
FROM Student
ORDER BY Marks DESC;

-- Average Marks with Grade Comparison
SELECT City,
	ROUND(AVG(Marks), 2) AS CityAVerageMarks,
		IF(AVG(Marks)  >= 80, "Excellent City",
			IF(AVG(Marks) >= 70, "Good City", "Needs Improvement")) AS CityPerformance
FROM Student
GROUP BY City
ORDER BY CityAverageMarks DESC;

-- Average Marks with Student COUNT
SELECT
	ROUND(AVG(Marks), 2) AS OverallAverage,
    COUNT(*) AS TotalStudents,
    MIN(Marks) AS LowestMark,
    Max(Marks) AS HighestMark
FROM Student;

-- Average with JOIN - Average Marks per Course
SELECT Courses.CourseName,
	ROUND(AVG(Student.Marks), 2) AS AvgMarksForCourse,
    COUNT(Student.StudentID) AS StudentCount
FROM Student
INNER JOIN Courses ON Student.StudentID = Courses.StudentID
GROUP BY Courses.CourseName
ORDER BY AvgMarksForCourse DESC;

-- Compare Individual to Average
SELECT StudentID, FName, LName, Marks,
	ROUND(AVG(Marks) OVER (), 2) AS ClassAverge,
    ROUND(Marks - AVG(Marks) OVER (), 2) AS DifferenceFromAverage
FROM Student
ORDER BY DifferenceFromAverage DESC;

-- HAVING - Cities with Average Above 80
SELECT City,
       ROUND(AVG(Marks), 2) AS CityAverage,
       COUNT(*) AS StudentCount
FROM Student
GROUP BY City
HAVING AVG(Marks) > 80
ORDER BY CityAverage DESC;

use sql_learn;

-- Example 1: Get AVG, MIN, MAX, SUM of Marks from Student Table
SELECT AVG(Marks) AS AVGMARKS,
MIN(Marks) AS MINMARKS,
MAX(Marks) AS MAXMARKS,
SUM(Marks) AS SUMMARKS
FROM Student;

-- Example 2: Get Student Count for Each City
SELECT City,
	COUNT(*) AS StudentCount
FROM Student
GROUP BY City
ORDER BY STudentCount DESC;

-- STRING FUNCTIONS
