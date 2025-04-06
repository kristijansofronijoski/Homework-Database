/*
Find all Students with FirstName = Antonio
Find all Students with DateOfBirth greater than ‘01.01.1999’
Find all Male students
Find all Students with LastName starting With ‘T’
Find all Students Enrolled in January/1998
Find all Students with LastName starting With ‘J’ enrolled in January/1998
*/

use SEDCHome

SELECT * FROM Student
WHERE FirstName = 'Antonio'

SELECT * FROM Student
WHERE DateOfBirth > '1999.01.01'

SELECT * FROM Student
WHERE Gender = 'M'

SELECT * FROM Student
WHERE LastName like 'T%'

SELECT * FROM Student
WHERE EnrolledDate BETWEEN '1998.01.01' and '1998.01.31'

SELECT * FROM Student
WHERE LastName like 'J%' and EnrolledDate BETWEEN '1998.01.01' and '1998.01.31'

/*
Find all Students with FirstName = Antonio ordered by Last Name
List all Students ordered by FirstName
Find all Male students ordered by EnrolledDate, starting from the last enrolled
*/

SELECT * FROM Student
WHERE FirstName = 'Antonio'
ORDER BY LastName 

SELECT * FROM Student
ORDER BY FirstName

SELECT * FROM Student
WHERE Gender = 'M'
ORDER BY EnrolledDate DESC

/*
List all Teacher First Names and Student First Names in single result set with duplicates
List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
List all common First Names for Teachers and Students
*/

SELECT FirstName FROM Teacher 
UNION ALL
SELECT FirstName FROM Student

SELECT LastName FROM Teacher 
UNION 
SELECT LastName FROM Student

SELECT FirstName FROM Teacher
INTERSECT
SELECT FirstName FROM Student

/*
Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert
Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints
Change AchievementType table to guarantee unique names across the Achievement types
*/

ALTER TABLE GradeDetails
ADD CONSTRAINT default_AchievementMaxPoints
DEFAULT 100 FOR AchievementMaxPoints

ALTER TABLE GradeDetails 
ADD CONSTRAINT CHECK_Points CHECK (AchievementPoints <= 100)

ALTER TABLE AchievementType
ADD UNIQUE (Name);

/*
Create Foreign key constraints from diagram or with script
*/

CREATE TABLE Groups (
    GroupId int NOT NULL PRIMARY KEY,
    Name nvarchar(255) NOT NULL,
    Academy nvarchar(255)
);


ALTER TABLE Teacher
ADD GroupId int 
FOREIGN KEY (GroupId) REFERENCES Groups(GroupId)

/*
List all possible combinations of Courses names and AchievementType names that can be passed by student
List all Teachers that has any exam Grade
List all Teachers without exam Grade
List all Students without exam Grade (using Right Join)
*/

SELECT c.Name as CourseName, a.Name as AchievementTypeName
FROM dbo.Course c
cross join dbo.AchievementType a
GO

select DISTINCT t.FirstName
FROM dbo.Grade g
inner join dbo.Teacher t on t.Id = g.TeacherID
GO

SELECT DISTINCT t.FirstName
FROM dbo.Teacher t
left join dbo.Grade g on t.ID = g.TeacherID
WHERE g.TeacherID is null
GO

SELECT s.*
FROM dbo.Grade g
right join dbo.Student s on g.StudentID = s.ID
WHERE g.StudentID is null
