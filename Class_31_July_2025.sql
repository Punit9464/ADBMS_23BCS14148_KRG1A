-- We are given two tables Person and MovieRating


CREATE TABLE Person (
    PersonID INT IDENTITY(1,1) PRIMARY KEY, -- Auto-increment primary key
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Email VARCHAR(100)
);

INSERT INTO Person (FirstName, LastName, Age, Email)
VALUES 
('John', 'Doe', 30, 'john.doe@example.com'),
('Jane', 'Smith', 25, 'jane.smith@example.com'),
('Ravi', 'Kumar', 28, 'ravi.kumar@example.in');


CREATE TABLE MovieRating (
    RatingID INT IDENTITY(1,1) PRIMARY KEY,
    PersonID INT,         -- FK to Person table
    MovieName VARCHAR(100),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    RatingDate DATE,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);


-- Suppose PersonID 1 and 2 rated movies
INSERT INTO MovieRating (PersonID, MovieName, Rating, RatingDate)
VALUES
(1, 'Inception', 5, '2023-01-01'),
(1, 'Interstellar', 4, '2023-01-03'),
(2, 'Titanic', 3, '2023-02-10');

-- Use these two tables to get the number of rated movies by a person, exclude who didn't rate the movies
/*SELECT A.PersonID, COUNT(B.Rating) AS [NUMBER OF RATED MOVIES]
FROM Person as A LEFT OUTER JOIN MovieRating as B
ON A.PersonID = B.PersonID
GROUP BY A.PersonID
HAVING COUNT(B.Rating) >= 1; */


-- Better Approach
SELECT PersonID, COUNT(Rating) as [Number of Rated Movies]
FROM MovieRating
GROUP BY PersonID
HAVING Count(Rating) >= 1;


--Q2 - Find the User whose name start and ends with same Character for example: Anna having 'a' in start and end of name.

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100)
);


INSERT INTO Users (user_id, name) VALUES
(1, 'Anna'),
(2, 'Bob'),
(3, 'Alice'),
(4, 'Eve'),
(5, 'David')


-- Way 1
SELECT name
FROM Users
WHERE SUBSTRING(name, 1, 1) = SUBSTRING(name, LEN(name), 1)

-- Way 2
SELECT Name
FROM Users
WHERE LEFT(name, 1) = RIGHT(name, 1);