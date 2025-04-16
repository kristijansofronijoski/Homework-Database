/*
• Create new procedure called CreateGrade;
• Procedure should create only Grade header info (not Grade Details);
• Procedure should return the total number of grades in the system for
the Student on input (from the CreateGrade);
• Procedure should return second resultset with the MAX Grade of all
grades for the Student and Teacher on input (regardless the Course).

*/

CREATE PROCEDURE CreateGrade
    @StudentID INT,
    @TeacherID INT,
    @CourseID INT = NULL,  
    @GradeValue DECIMAL(5,2) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Grade (StudentID, TeacherID, CourseID, Grade, CreatedDate)
    VALUES (@StudentID, @TeacherID, @CourseID, @GradeValue, GETDATE());


    SELECT COUNT(*) AS TotalGrades
    FROM Grade
    WHERE StudentID = @StudentID;

    SELECT MAX(Grade) AS MaxGrade
    FROM Grade
    WHERE StudentID = @StudentID AND TeacherID = @TeacherID;
END
GO

/*
Create new procedure called CreateGradeDetail;
• Procedure should add details for specific Grade (new record for new
AchievementTypeID, Points, MaxPoints, Date for specific Grade);
• Output from this procedure should be resultset with SUM of
GradePoints calculated with formula
AchievementPoints/AchievementMaxPoints*ParticipationRate for
specific Grade
*/

CREATE PROCEDURE CreateGradeDetail
    @GradeID INT,
    @AchievementTypeID INT,
    @AchievementPoints DECIMAL(5,2),
    @AchievementMaxPoints DECIMAL(5,2),
    @AchievementDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO GradeDetails (
        GradeID,
        AchievementTypeID,
        AchievementPoints,
        AchievementMaxPoints,
        AchievementDate
    )
    VALUES (
        @GradeID,
        @AchievementTypeID,
        @AchievementPoints,
        @AchievementMaxPoints,
        @AchievementDate
    );


    SELECT 
        SUM(CAST(AchievementPoints AS FLOAT) / NULLIF(AchievementMaxPoints, 0)) AS TotalGradePoints
    FROM GradeDetails
    WHERE GradeID = @GradeID;
END;

