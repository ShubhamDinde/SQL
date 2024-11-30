--Find all trains operating from Central Station.
SELECT Trains.* 
FROM Trains 
WHERE SourceStationID = (SELECT StationID FROM Stations WHERE StationName = 'Central Station');


--Get a list of all schedules for a specific train type.
SELECT Schedules.* 
FROM Schedules 
JOIN Trains ON Schedules.TrainID = Trains.TrainID 
WHERE Trains.TrainType = 'Express';

--Find the number of bookings for each train.
SELECT Schedules.TrainID, COUNT(Bookings.BookingID) AS BookingCount 
FROM Schedules 
LEFT JOIN Bookings ON Schedules.ScheduleID = Bookings.ScheduleID 
GROUP BY Schedules.TrainID;

--Get the total number of seats booked for each train type.
SELECT Trains.TrainType, SUM(Trains.Capacity) AS TotalSeatsBooked 
FROM Trains 
JOIN Schedules ON Trains.TrainID = Schedules.TrainID 
JOIN Bookings ON Schedules.ScheduleID = Bookings.ScheduleID 
GROUP BY Trains.TrainType;

--Find the oldest passenger in the database.
SELECT * FROM Passengers 
WHERE Age = (SELECT MAX(Age) FROM Passengers);

--Find passengers who booked a train that departs from a specific station.
SELECT DISTINCT Passengers.* 
FROM Passengers 
JOIN Bookings ON Passengers.PassengerID = Bookings.PassengerID 
JOIN Schedules ON Bookings.ScheduleID = Schedules.ScheduleID 
WHERE Schedules.SourceStationID = (SELECT StationID FROM Stations WHERE StationName = 'Central Station');


--Find all passengers who are adults and have booked a train.
SELECT DISTINCT Passengers.* 
FROM Passengers 
JOIN Bookings ON Passengers.PassengerID = Bookings.PassengerID 
WHERE Age >= 18;
\
--Get the average capacity of trains by train type.
SELECT TrainType, AVG(Capacity) AS AverageCapacity 
FROM Trains 
GROUP BY TrainType;

--Find the total number of passengers for each train.
SELECT Schedules.TrainID, COUNT(DISTINCT Bookings.PassengerID) AS PassengerCount 
FROM Schedules 
LEFT JOIN Bookings ON Schedules.ScheduleID = Bookings.ScheduleID 
GROUP BY Schedules.TrainID;

--Get the average booking count for each train type.
SELECT Trains.TrainType, AVG(BookingCount) AS AvgBookingCount 
FROM (SELECT Schedules.TrainID, COUNT(Bookings.BookingID) AS BookingCount 
      FROM Schedules 
      LEFT JOIN Bookings ON Schedules.ScheduleID = Bookings.ScheduleID 
      GROUP BY Schedules.TrainID) AS BookingCounts 
JOIN Trains ON BookingCounts.TrainID = Trains.TrainID 
GROUP BY Trains.TrainType;

--Get the maximum and minimum ages of passengers who have booked a train.
SELECT MAX(Age) AS MaxAge, MIN(Age) AS MinAge 
FROM Passengers 
WHERE PassengerID IN (SELECT PassengerID FROM Bookings);

--Get the top 5 busiest stations based on bookings.
SELECT TOP(5) 
Stations.StationName,
COUNT(Bookings.BookingID) AS BookingCount 
FROM Stations 
LEFT JOIN Trains
ON Stations.StationID = Trains.SourceStationID 
LEFT JOIN Schedules
ON Trains.TrainID = Schedules.TrainID 
LEFT JOIN Bookings
ON Schedules.ScheduleID = Bookings.ScheduleID 
GROUP BY Stations.StationName 
ORDER BY BookingCount DESC; 

--Get the top 3 most popular trains based on the number of bookings.
SELECT TOP(3)
Schedules.TrainID, COUNT(Bookings.BookingID) AS BookingCount 
FROM Schedules 
LEFT JOIN Bookings ON Schedules.ScheduleID = Bookings.ScheduleID 
GROUP BY Schedules.TrainID 
ORDER BY BookingCount DESC;

--Find the percentage of confirmed vs. cancelled bookings.
SELECT 
    (COUNT(CASE WHEN Status = 'Confirmed' THEN 1 END) * 100 / COUNT(*)) AS ConfirmedPercentage, 
    (COUNT(CASE WHEN Status = 'Cancelled' THEN 1 END) * 100 / COUNT(*)) AS CancelledPercentage 
FROM Bookings;

--Get all trains that contain "Express" in their name.
SELECT * FROM Trains WHERE TrainName LIKE '%Express%';

--Get a summary of bookings per train including the number of confirmed and cancelled.
SELECT Schedules.TrainID, 
       COUNT(CASE WHEN Bookings.Status = 'Confirmed' THEN 1 END) AS Confirmed, 
       COUNT(CASE WHEN Bookings.Status = 'Cancelled' THEN 1 END) AS Cancelled 
FROM Schedules 
LEFT JOIN Bookings ON Schedules.ScheduleID = Bookings.ScheduleID 
GROUP BY Schedules.TrainID;

--Identify the most frequently booked train.
SELECT TOP(1)
Schedules.TrainID,
COUNT(Bookings.BookingID) AS BookingCount 
FROM Schedules 
JOIN Bookings ON Schedules.ScheduleID = Bookings.ScheduleID 
GROUP BY Schedules.TrainID 
ORDER BY BookingCount DESC;

--Find the station with the highest number of departing trains.
SELECT TOP(1)
Stations.StationName, COUNT(Trains.TrainID) AS TrainCount 
FROM Stations 
JOIN Trains ON Stations.StationID = Trains.SourceStationID 
GROUP BY Stations.StationName 
ORDER BY TrainCount DESC;

--Get a summary of the average age of passengers by train type.
SELECT Trains.TrainType, AVG(Passengers.Age) AS AverageAge 
FROM Passengers 
JOIN Bookings ON Passengers.PassengerID = Bookings.PassengerID 
JOIN Schedules ON Bookings.ScheduleID = Schedules.ScheduleID 
JOIN Trains ON Schedules.TrainID = Trains.TrainID 
GROUP BY Trains.TrainType;

--Count the total number of unique trains used for bookings.
SELECT COUNT(DISTINCT TrainID) AS UniqueTrains 
FROM Schedules 
JOIN Bookings ON Schedules.ScheduleID = Bookings.ScheduleID;

--Find the most popular train based on the percentage of total bookings.
SELECT TOP(1)
Schedules.TrainID, 
(COUNT(Bookings.BookingID) * 100 / (SELECT COUNT(*) FROM Bookings)) AS BookingPercentage 
FROM Schedules 
LEFT JOIN Bookings ON Schedules.ScheduleID = Bookings.ScheduleID 
GROUP BY Schedules.TrainID 
ORDER BY BookingPercentage DESC;

--Get a summary of the status of bookings, displaying a message based on the status.
SELECT 
    Status, 
    COUNT(*) AS TotalBookings, 
    CASE 
        WHEN Status = 'Confirmed' THEN 'Confirmed bookings' 
        WHEN Status = 'Cancelled' THEN 'Bookings cancelled' 
        ELSE 'Other' 
    END AS StatusMessage 
FROM Bookings 
GROUP BY Status;

--Get the average age of passengers who booked an express train.
SELECT AVG(Passengers.Age) AS AvgAge 
FROM Passengers 
JOIN Bookings ON Passengers.PassengerID = Bookings.PassengerID 
JOIN Schedules ON Bookings.ScheduleID = Schedules.ScheduleID 
JOIN Trains ON Schedules.TrainID = Trains.TrainID 
WHERE Trains.TrainType = 'Express';

--List all trains sorted by their capacity, then by name.
SELECT * FROM Trains 
ORDER BY Capacity DESC, TrainName ASC;

--Find the top 10 stations with the most bookings.
SELECT TOP(10)
Stations.StationName, COUNT(Bookings.BookingID) AS BookingCount 
FROM Stations 
JOIN Trains ON Stations.StationID = Trains.SourceStationID 
JOIN Schedules ON Trains.TrainID = Schedules.TrainID 
LEFT JOIN Bookings ON Schedules.ScheduleID = Bookings.ScheduleID 
GROUP BY Stations.StationName 
ORDER BY BookingCount DESC;

--Get bookings for each train type and their total revenue.
SELECT Trains.TrainType,
COUNT(Bookings.BookingID) AS TotalBookings, 
COUNT(Bookings.BookingID) * 50 AS TotalRevenue 
FROM Trains 
JOIN Schedules ON Trains.TrainID = Schedules.TrainID 
JOIN Bookings ON Schedules.ScheduleID = Bookings.ScheduleID 
GROUP BY Trains.TrainType;

--Determine the correlation between train capacity and booking counts.
SELECT Trains.Capacity, COUNT(Bookings.BookingID) AS BookingCount 
FROM Trains 
LEFT JOIN Schedules ON Trains.TrainID = Schedules.TrainID 
LEFT JOIN Bookings ON Schedules.ScheduleID = Bookings.ScheduleID 
GROUP BY Trains.Capacity;

--Find the average age of passengers for each train type.
SELECT Trains.TrainType, AVG(Passengers.Age) AS AvgAge 
FROM Passengers 
JOIN Bookings ON Passengers.PassengerID = Bookings.PassengerID 
JOIN Schedules ON Bookings.ScheduleID = Schedules.ScheduleID 
JOIN Trains ON Schedules.TrainID = Trains.TrainID 
GROUP BY Trains.TrainType;

--Identify trains that have a higher cancellation rate than the average.
WITH CancellationRates AS (
    SELECT 
        Trains.TrainID, 
        COUNT(CASE WHEN Bookings.Status = 'Cancelled' THEN 1 END) * 100.0 / COUNT(Bookings.BookingID) AS CancellationRate
    FROM 
        Trains 
    JOIN 
        Schedules ON Trains.TrainID = Schedules.TrainID 
    LEFT JOIN 
        Bookings ON Schedules.ScheduleID = Bookings.ScheduleID 
    GROUP BY 
        Trains.TrainID
)

SELECT 
    TrainID, 
    CancellationRate
FROM 
    CancellationRates
WHERE 
    CancellationRate > (
        SELECT AVG(CancellationRate) 
        FROM (
            SELECT 
                COUNT(CASE WHEN Status = 'Cancelled' THEN 1 END) * 100.0 / COUNT(*) AS CancellationRate 
            FROM 
                Bookings 
            GROUP BY 
                ScheduleID
        ) AS Rates
    );














