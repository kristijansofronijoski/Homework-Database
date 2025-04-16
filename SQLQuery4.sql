use SEDCHome

/* 
Calculate the count of all grades per Teacher in the system
● Calculate the count of all grades per Teacher in the system for first 100
Students (ID < 100)
● Find the Maximal Grade, and the Average Grade per Student on all grades in
the system
● Calculate the count of all grades per Teacher in the system and filter only
grade count greater then 200
● Find the Grade Count, Maximal Grade, and the Average Grade per Student on
all grades in the system. Filter only records where Maximal Grade is equal to
Average Grade
● List Student First Name and Last Name next to the other details from previous
query
● Create new view (vv_StudentGrades) that will List all StudentIds and count of
Grades per student
● Change the view to show Student First and Last Names instead of StudentID
● List all rows from view ordered by biggest Grade Count

*/

SELECT TeacherID, COUNT(*) AS GradeCount
FROM Grade
GROUP BY TeacherID


SELECT TeacherID, COUNT(*) AS GradeCount
FROM Grade
WHERE StudentID < 100
GROUP BY TeacherID

SELECT StudentID, MAX(Grade) AS MaxGrade, AVG(Grade) AS AvgGrade
FROM Grade
GROUP BY StudentID;

SELECT TeacherID, COUNT(*) AS GradeCount
FROM Grade
GROUP BY TeacherID
HAVING COUNT(*) > 200;

SELECT StudentID, COUNT(*) AS GradeCount, MAX(Grade) AS MaxGrade, AVG(Grade) AS AvgGrade
FROM Grade
GROUP BY StudentID
HAVING MAX(Grade) = AVG(Grade);

SELECT s.FirstName, s.LastName, g.StudentID,
       COUNT(*) AS GradeCount,
       MAX(g.Grade) AS MaxGrade,
       AVG(g.Grade) AS AvgGrade
FROM Grade g
JOIN Student s ON g.StudentID = s.ID
GROUP BY g.StudentID, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade);
GO

CREATE VIEW vv_StudentGrades
AS
SELECT StudentID, COUNT(*) AS GradeCount
FROM Grade
GROUP BY StudentID;
GO

CREATE OR ALTER VIEW vv_StudentGrades AS
SELECT s.FirstName, s.LastName, COUNT(*) AS GradeCount
FROM Grade g
JOIN Student s ON g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName;
GO

SELECT * FROM vv_StudentGrades
ORDER BY GradeCount DESC;