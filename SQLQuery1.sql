use master

CREATE DATABASE [SEDCACADEMYDB]

CREATE TABLE [Student](
[ID] [int] NOT NULL,
[FirstName] [nvarchar] (30) NOT NULL,
[LastName] [nvarchar] (30) NOT NULL,
[DateOfBirth] [date],
[EnrolledDate] [date],
[Gender] [nchar] (1),
[NationalIDNumber] [nvarchar] (20) NOT NULL,
[StudentCardNumber] [int]
)

SELECT * FROM Student

CREATE TABLE [Teacher](
[ID] [int] NOT NULL,
[FirstName] [nvarchar] (30) NOT NULL,
[LastName] [nvarchar] (30) NOT NULL,
[DateOfBirth] [date],
[AcademicRank] [nvarchar] (30),
[HireDate] [date]
)

SELECT * FROM Teacher

CREATE TABLE [Grade](
[ID] [int] NOT NULL,
[StudentID] [int],
[CourseID] [int],
[TeacherID] [int],
[Grade] [int],
[Comment] [nvarchar] (200),
[CreatedDate] [date]
)

SELECT * FROM Grade

CREATE TABLE [Course](
[ID] [int] NOT NULL,
[Name] [nvarchar] (30) NOT NULL,
[Credit] [int],
[AcademicYear] [date],
[Semester] [int]
)

SELECT * FROM Course

CREATE TABLE [GradeDetails](
[ID] [int] NOT NULL,
[GradeID] [int],
[AchievementTypeID] [int],
[AchievementPoints] [int],
[AchievementMaxPoints] [int],
[AchievementDate] [date]
)

SELECT * FROM GradeDetails

CREATE TABLE [AchievementType](
[ID] [int] NOT NULL,
[Name] [nvarchar] (30) NOT NULL,
[Comment] [nvarchar] (200),
[ParticipationRate] [int],
)

SELECT * FROM AchievementType