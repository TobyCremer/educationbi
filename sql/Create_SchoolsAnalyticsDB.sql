-- =========================================
-- CREATE DATABASE
-- =========================================

CREATE DATABASE SchoolAnalyticsDB;
GO

USE SchoolAnalyticsDB;
GO


-- =========================================
-- STUDENTS TABLE
-- =========================================

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(20),
    DateOfBirth DATE,
    YearLevel INT,
    House VARCHAR(50),
    EnrolmentStatus VARCHAR(30)
);


-- =========================================
-- ATTENDANCE TABLE
-- =========================================

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    StudentID INT,
    AttendanceDate DATE,
    Status VARCHAR(20), -- Present, Absent, Late
    PeriodsMissed INT,

    FOREIGN KEY (StudentID)
    REFERENCES Students(StudentID)
);


-- =========================================
-- COURSES TABLE
-- =========================================

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    SubjectArea VARCHAR(50),
    YearLevel INT,
    TeacherName VARCHAR(100)
);


-- =========================================
-- ENROLMENTS TABLE
-- =========================================

CREATE TABLE Enrolments (
    EnrolmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrolmentDate DATE,

    FOREIGN KEY (StudentID)
    REFERENCES Students(StudentID),

    FOREIGN KEY (CourseID)
    REFERENCES Courses(CourseID)
);


-- =========================================
-- ASSIGNMENTS TABLE
-- =========================================

CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY,
    CourseID INT,
    AssignmentName VARCHAR(100),
    DueDate DATE,
    MaxScore INT,

    FOREIGN KEY (CourseID)
    REFERENCES Courses(CourseID)
);


-- =========================================
-- SUBMISSIONS TABLE
-- =========================================

CREATE TABLE Submissions (
    SubmissionID INT PRIMARY KEY,
    AssignmentID INT,
    StudentID INT,
    SubmissionDate DATE,
    Score DECIMAL(5,2),
    SubmittedStatus VARCHAR(30), -- Submitted, Late, Missing

    FOREIGN KEY (AssignmentID)
    REFERENCES Assignments(AssignmentID),

    FOREIGN KEY (StudentID)
    REFERENCES Students(StudentID)
);


-- =========================================
-- CANVAS ACTIVITY TABLE
-- =========================================

CREATE TABLE CanvasActivity (
    ActivityID INT PRIMARY KEY,
    StudentID INT,
    ActivityDate DATE,
    LoginCount INT,
    PageViews INT,
    ParticipationCount INT,

    FOREIGN KEY (StudentID)
    REFERENCES Students(StudentID)
);


-- =========================================
-- FEES TABLE
-- =========================================

CREATE TABLE Fees (
    FeeID INT PRIMARY KEY,
    StudentID INT,
    Term VARCHAR(20),
    AmountDue DECIMAL(10,2),
    AmountPaid DECIMAL(10,2),
    PaymentStatus VARCHAR(30),

    FOREIGN KEY (StudentID)
    REFERENCES Students(StudentID)
);