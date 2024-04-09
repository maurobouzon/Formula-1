SELECT * FROM drivers_f1;
SELECT * FROM driverstandings;

# cuales son los 10 pilotos con mas puntos?
SELECT dr_names.driverRef, SUM(dr_stan.points) AS points
FROM driverstandings dr_stan
LEFT JOIN drivers_f1 dr_names ON dr_stan.driverId = dr_names.driverId
GROUP BY dr_stan.driverId, dr_names.driverRef
ORDER BY points DESC
LIMIT 10;

# pilotos que mas veces llegaron primeros
SELECT dr_names.driverRef, COUNT(CASE WHEN dr_stan.position = 1 THEN 1 ELSE NULL END) AS pos_1
FROM driverstandings dr_stan
LEFT JOIN drivers_f1 dr_names ON dr_stan.driverId = dr_names.driverId
GROUP BY dr_stan.driverId, dr_names.driverRef
HAVING pos_1 > 0
ORDER BY pos_1 DESC
LIMIT 10;

# 10 pilotos con mas poles
SELECT dr_names.driverRef, 
	   SUM(CASE WHEN dr_stan.position IN (1, 2, 3) THEN 1 ELSE 0 END) AS podiums
FROM driverstandings dr_stan
LEFT JOIN drivers_f1 dr_names ON dr_stan.driverId = dr_names.driverId
GROUP BY dr_stan.driverId, dr_names.driverRef
ORDER BY podiums DESC
LIMIT 10;

# Cuantas veces Hamilton termino tercero o quinto?
SELECT dr_names.driverRef, 
	   SUM(CASE WHEN dr_stan.position IN (3,5) THEN 1 ELSE 0 END) AS hamilton_3_5
FROM driverstandings dr_stan
LEFT JOIN drivers_f1 dr_names ON dr_stan.driverId = dr_names.driverId
GROUP BY dr_stan.driverId, dr_names.driverRef
HAVING dr_names.driverRef = "hamilton";


