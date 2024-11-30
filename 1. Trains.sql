CREATE TABLE Trains (
    TrainID INT PRIMARY KEY,
    TrainName VARCHAR(100) NOT NULL,
    TrainType VARCHAR(50) NOT NULL,
    Capacity INT NOT NULL,
    SourceStationID INT,
    DestinationStationID INT,
    FOREIGN KEY (SourceStationID) REFERENCES Stations(StationID),
    FOREIGN KEY (DestinationStationID) REFERENCES Stations(StationID)
);

INSERT INTO Trains (TrainID, TrainName, TrainType, Capacity, SourceStationID, DestinationStationID) VALUES
(1, 'Express 1', 'Express', 200, 1, 2),
(2, 'Local 2', 'Local', 150, 1, 3),
(3, 'Fast Track', 'Express', 250, 2, 4),
(4, 'Night Rider', 'Overnight', 100, 3, 5),
(5, 'Scenic Route', 'Scenic', 80, 4, 1),
(6, 'Coastal Express', 'Express', 300, 6, 12),
(7, 'Desert Special', 'Regional', 120, 13, 14),
(8, 'Lake Shuttle', 'Local', 90, 7, 8),
(9, 'Mountain Climber', 'Tourist', 60, 8, 9),
(10, 'City Express', 'Express', 250, 10, 11);

  SELECT * FROM Trains;
