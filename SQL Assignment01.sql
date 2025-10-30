select * from pw_courses;
# Answer01
CREATE TABLE Students (
    StudentID INT,
    Name VARCHAR(50),
    Age INT
);

INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Alice', 20);
INSERT INTO Students (StudentID, Name, Age) VALUES (2, 'Bob', 21);
INSERT INTO Students (StudentID, Name, Age) VALUES (3, 'Charlie', 22);
INSERT INTO Students (StudentID, Name, Age) VALUES (4, 'David', 20);
INSERT INTO Students (StudentID, Name, Age) VALUES (5, 'Eve', 23);
INSERT INTO Students (StudentID, Name, Age) VALUES (6, 'Fiona', 21);
INSERT INTO Students (StudentID, Name, Age) VALUES (7, 'George', 24);
INSERT INTO Students (StudentID, Name, Age) VALUES (8, 'Hannah', 22);
INSERT INTO Students (StudentID, Name, Age) VALUES (9, 'Ivy', 20);
INSERT INTO Students (StudentID, Name, Age) VALUES (10, 'Jack', 25);

select * from students;

SELECT Name, Age FROM Students;