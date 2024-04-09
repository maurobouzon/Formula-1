SELECT * FROM laptimes;

# Piloto y vuelta más rapida de cada carrera
SELECT lt.raceId, df.driverRef, lt.lap, lt.milliseconds AS faster
FROM laptimes lt
INNER JOIN (
    SELECT raceId, MIN(milliseconds) AS min_milliseconds
    FROM laptimes
    GROUP BY raceId
) min_times ON lt.raceId = min_times.raceId AND lt.milliseconds = min_times.min_milliseconds
INNER JOIN drivers_f1 df ON lt.driverId = df.driverId
ORDER BY lt.raceId;


