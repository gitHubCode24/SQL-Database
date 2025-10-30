# Answer 02
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Credits INT
);
INSERT INTO Courses (CourseID, Title, Credits) VALUES
(101, 'Introduction to SQL', 3),
(102, 'Database Design', 4),
(103, 'Advanced Python', 3);

select * from Courses;

ALTER TABLE Students
ADD PRIMARY KEY (StudentID);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE,

    -- Foreign Key: Links StudentID to the Students table
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    
    -- Foreign Key: Links CourseID to the Courses table
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    
    -- Constraint: Ensures a student is not enrolled in the same course twice
    UNIQUE (StudentID, CourseID)
);

INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1001, 1, 101, '2025-09-01'), -- Alice (1) in SQL (101)
(1002, 2, 101, '2025-09-01'), -- Bob (2) in SQL (101)
(1003, 3, 102, '2025-09-02'), -- Charlie (3) in Design (102)
(1004, 4, 103, '2025-09-02'), -- David (4) in Python (103)
(1005, 1, 102, '2025-09-03'), -- Alice (1) in Design (102) -> Demonstrates one student in multiple courses
(1006, 5, 101, '2025-09-03'), -- Eve (5) in SQL (101)
(1007, 6, 102, '2025-09-04'), -- Fiona (6) in Design (102)
(1008, 7, 103, '2025-09-04'), -- George (7) in Python (103)
(1009, 8, 101, '2025-09-05'), -- Hannah (8) in SQL (101)
(1010, 9, 102, '2025-09-05'); -- Ivy (9) in Design (102)

SELECT * FROM Enrollment;