/*
Declare scalar variable for storing FirstName values
Assign value ‘Antonio’ to the FirstName variable
Find all Students having FirstName same as the variable
Declare table variable that will contain StudentId, StudentName and DateOfBirth
Fill the table variable with all Female students
Declare temp table that will contain LastName and EnrolledDate columns
Fill the temp table with all Male students having First Name starting with ‘A’
Retrieve the students from the table which last name is with 7 characters
Find all teachers whose FirstName length is less than 5 and
the first 3 characters of their FirstName and LastName are the same

*/

DECLARE @FirstName varchar(100)
SET @FirstName = 'Antonio'

SELECT * 
FROM Student
WHERE FirstName = @FirstName
GO

DECLARE @StudentList TABLE
(StudentId int, StudentName nvarchar(100), DateOfBirth date)

INSERT INTO @StudentList
SELECT Id, FirstName, DateOfBirth
FROM dbo.Student
WHERE GENDER = 'F'

SELECT * FROM @StudentList
GO

CREATE TABLE #StudentList
(LastName NVARCHAR(100), EnrolledDate date)

INSERT INTO  #StudentList
SELECT LastName, EnrolledDate
FROM dbo.Student
WHERE Gender = 'M' and FirstName like 'A%'


SELECT * 
FROM #StudentList
WHERE Len(LastName) = 7

drop table #StudentList
GO

SELECT * FROM Teacher
WHERE Len(FirstName) < 5 
GO