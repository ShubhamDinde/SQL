CREATE TABLE Schedules (
    ScheduleID INT PRIMARY KEY,
    TrainID INT,
    DepartureTime DATETIME NOT NULL,
    ArrivalTime DATETIME NOT NULL,
    SourceStationID INT,
    DestinationStationID INT,
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (SourceStationID) REFERENCES Stations(StationID),
    FOREIGN KEY (DestinationStationID) REFERENCES Stations(StationID)
);

INSERT INTO Schedules (ScheduleID, TrainID, DepartureTime, ArrivalTime, SourceStationID, DestinationStationID) VALUES
(1, 1, '2024-09-20 08:00:00', '2024-09-20 09:00:00', 1, 2),
(2, 2, '2024-09-20 09:30:00', '2024-09-20 10:15:00', 1, 3),
(3, 3, '2024-09-20 11:00:00', '2024-09-20 12:00:00', 2, 4),
(4, 4, '2024-09-20 13:00:00', '2024-09-20 15:00:00', 3, 5),
(5, 5, '2024-09-20 16:00:00', '2024-09-20 17:30:00', 4, 1),
(6, 6, '2024-09-20 18:00:00', '2024-09-20 20:00:00', 6, 12),
(7, 7, '2024-09-20 21:00:00', '2024-09-20 22:30:00', 13, 14),
(8, 8, '2024-09-20 07:00:00', '2024-09-20 08:30:00', 7, 8),
(9, 9, '2024-09-20 08:45:00', '2024-09-20 10:00:00', 8, 9),
(10, 10, '2024-09-20 09:00:00', '2024-09-20 09:45:00', 10, 11);

Select * from Schedules;

