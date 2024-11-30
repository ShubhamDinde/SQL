CREATE TABLE Stations (
    StationID INT PRIMARY KEY,
    StationName VARCHAR(100) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    State VARCHAR(50) NOT NULL
);

INSERT INTO Stations (StationID, StationName, Location, State) VALUES
(1, 'Central Station', 'Downtown', 'NY'),
(2, 'East Station', 'East Side', 'NY'),
(3, 'West Station', 'West Side', 'NY'),
(4, 'North Station', 'North End', 'NY'),
(5, 'South Station', 'South End', 'NY'),
(6, 'River Station', 'Riverside', 'CA'),
(7, 'Lake Station', 'Lakeside', 'CA'),
(8, 'Mountain Station', 'Mountainview', 'CA'),
(9, 'Valley Station', 'Valley View', 'CA'),
(10, 'City Station', 'City Center', 'IL'),
(11, 'Suburb Station', 'Suburb Area', 'IL'),
(12, 'Coastal Station', 'Coastal Region', 'FL'),
(13, 'Desert Station', 'Desert View', 'AZ'),
(14, 'Forest Station', 'Forest Area', 'OR'),
(15, 'Island Station', 'Island Region', 'HI');

 SELECT * FROM Stations;
