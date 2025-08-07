-- Q1 -Author-Book Relationship Using Joins and Basic SQL Operations
CREATE DATABASE EXP1;
USE EXP1;

CREATE TABLE Author_Tbl(AuthId INT PRIMARY KEY, AuthName VARCHAR(30), AuthCountry VARCHAR(20));

CREATE TABLE Books_Tbl(BookId INT PRIMARY KEY, BookName VARCHAR(30), AuthID int, PublishYear int);

ALTER TABLE Books_Tbl ADD CONSTRAINT Fk_Books_Author FOREIGN KEY (AuthID) references Author_Tbl(AuthId);

INSERT INTO Author_Tbl (AuthId, AuthName, AuthCountry) values (101, 'Mansi', 'India'), (102, 'Mishika', 'India'), (103, 'Itika', 'America');

SELECT * FROM Author_Tbl;

INSERT INTO Books_Tbl(BookId, BookName, AuthID, PublishYear) 
values
(1, 'Too Good To Be True', 101, 2024), 
(2, 'Atomic Habits', 102, 2022),
(3, 'RS Aggarwal Aptitude', 101, 2019);


SELECT * FROM Books_Tbl;


SELECT B.BookName, A.AuthName, A.AuthCountry
FROM Author_Tbl A
INNER JOIN
Books_Tbl B
ON (A.AuthId = B.AuthID);



--Q2 Department-Course Subquery and Access Control

CREATE TABLE Department_Tbl(DeptId int PRIMARY KEY, DeptName varchar(30));

CREATE TABLE Courses(CourseId int Primary key, CourseName varchar(30), DeptId int, FOREIGN KEY(DeptId) REFERENCES Department_Tbl(DeptId));

INSERT INTO Department_Tbl(DeptId, DeptName) VALUES
(1, 'COMPUTER SCIENCE'),
(2, 'MECHANICAL ENGINEERING'),
(3, 'PHYSICS'),
(4, 'MATHEMATICS');

INSERT INTO Courses (CourseId, CourseName, DeptId) VALUES
(101, 'DATA STRUCTURES', 1),
(102, 'OPERATING SYSTEMS', 1),
(103, 'DATABASE SYSTEMS', 1),
(201, 'THERMODYNAMICS', 2),
(202, 'FLUID MECHANICS', 2),
(203, 'MACHINE DESIGN', 2),
(301, 'CLASSICAL MECHANICS', 3),
(401, 'CIRCUIT THEORY', 4),
(402, 'DIGITAL LOGIC DESIGN', 4);


SELECT D.DeptName, COUNT(C.DeptId) AS [NO OF COURSES]
FROM Department_Tbl D
INNER JOIN
Courses C
ON D.DeptId = C.DeptId
GROUP BY D.DeptName;


SELECT D.DeptName, COUNT(C.DeptId) AS [NO OF COURSES]
FROM Department_Tbl D
INNER JOIN
Courses C
ON D.DeptId = C.DeptId
GROUP BY D.DeptName
HAVING COUNT(C.DeptId) > 2;

create login mansi with password = 'mansi';

CREATE USER Mansi;

GRANT SELECT ON COURSES TO MANSI; 