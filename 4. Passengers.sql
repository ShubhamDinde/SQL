CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

INSERT INTO Passengers (PassengerID, FirstName, LastName, Age, Gender, Email) VALUES
(1, 'John', 'Doe', 30, 'Male', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 25, 'Female', 'jane.smith@example.com'),
(3, 'Mike', 'Johnson', 35, 'Male', 'mike.j@example.com'),
(4, 'Emily', 'Davis', 28, 'Female', 'emily.d@example.com'),
(5, 'Chris', 'Brown', 40, 'Male', 'chris.brown@example.com'),
(6, 'Katie', 'Wilson', 22, 'Female', 'katie.w@example.com'),
(7, 'David', 'Lee', 33, 'Male', 'david.lee@example.com'),
(8, 'Sarah', 'Garcia', 29, 'Female', 'sarah.g@example.com'),
(9, 'Daniel', 'Martinez', 31, 'Male', 'daniel.m@example.com'),
(10, 'Jessica', 'Hernandez', 27, 'Female', 'jessica.h@example.com');


SELECT * FROM Passengers;
