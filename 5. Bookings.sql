CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    PassengerID INT,
    ScheduleID INT,
    BookingDate DATETIME NOT NULL,
    SeatNumber INT NOT NULL,
    Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (ScheduleID) REFERENCES Schedules(ScheduleID)
);

INSERT INTO Bookings (BookingID, PassengerID, ScheduleID, BookingDate, SeatNumber, Status) VALUES
(1, 3, 1, '2024-09-19 14:00:00', 1, 'Confirmed'),
(2, 1, 2, '2024-09-19 14:30:00', 5, 'Confirmed'),
(3, 4, 3, '2024-09-19 15:00:00', 3, 'Cancelled'),
(4, 6, 4, '2024-09-19 15:30:00', 1, 'Confirmed'),
(5, 2, 5, '2024-09-19 16:00:00', 2, 'Confirmed'),
(6, 7, 6, '2024-09-19 16:30:00', 6, 'Pending'),
(7, 8, 7, '2024-09-19 17:00:00', 7, 'Confirmed'),
(8, 5, 8, '2024-09-19 17:30:00', 8, 'Confirmed'),
(9, 9, 9, '2024-09-19 18:00:00', 2, 'Cancelled'),
(10, 10, 10, '2024-09-19 18:30:00', 4, 'Confirmed');


SELECT * FROM Bookings;
