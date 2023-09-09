SELECT *
FROM Divvy_Trips_2020_Q1
ORDER BY started_at


-- Select Data I`m going to be using

SELECT ride_id, started_at, ended_at, start_station_name, end_station_name, member_casual
FROM Divvy_Trips_2020_Q1


-- Calculatate the duration of each trip [minutes] and max, min and mean trip duration [minutes] and narrow analysis to max 7 day rent

SELECT ride_id, DATEDIFF(minute, started_at, ended_at) AS TripDuration, member_casual
FROM Divvy_Trips_2020_Q1
WHERE DATEDIFF(minute, started_at, ended_at) >= 0 AND DATEDIFF(DAY, started_at, ended_at) <= 7
ORDER BY TripDuration DESC

SELECT member_casual, MIN(DATEDIFF(minute, started_at, ended_at)) AS MinTripDuration, 
MAX(DATEDIFF(minute, started_at, ended_at)) AS MaxTripDuration,
AVG(DATEDIFF(minute, started_at, ended_at)) AS MeanTripDuration
FROM Divvy_Trips_2020_Q1
WHERE DATEDIFF(minute, started_at, ended_at) >= 0 AND DATEDIFF(DAY, started_at, ended_at) <= 7
GROUP BY member_casual


-- Count number of casual and annual members

SELECT COUNT(*) AS NumberOfUsers, member_casual
FROM Divvy_Trips_2020_Q1
WHERE DATEDIFF(minute, started_at, ended_at) >= 0 AND DATEDIFF(DAY, started_at, ended_at) <= 7
GROUP BY member_casual


-- What day of week do most people start using bike sharing?

SELECT ride_id, DATEDIFF(minute, started_at, ended_at) AS TripDuration, DATENAME(WEEKDAY, started_at) AS StartDayOfWeek, member_casual
FROM Divvy_Trips_2020_Q1
WHERE DATEDIFF(minute, started_at, ended_at) >= 0 AND DATEDIFF(DAY, started_at, ended_at) <= 7
ORDER BY TripDuration DESC


-- What day of week do most people end using bike sharing?

SELECT ride_id, DATEDIFF(minute, started_at, ended_at) AS TripDuration, DATENAME(WEEKDAY, ended_at) AS EndDayOfWeek, member_casual
FROM Divvy_Trips_2020_Q1
WHERE DATEDIFF(minute, started_at, ended_at) >= 0 AND DATEDIFF(DAY, started_at, ended_at) <= 7
ORDER BY TripDuration DESC