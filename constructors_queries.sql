SELECT * FROM constructor_results;
SELECT * FROM constructors_f1;
SELECT * FROM constructorstandings_f1;

# cuantos constructores hay ?
SELECT COUNT(DISTINCT(constructorId)) AS num_constructors
FROM constructor_results;

# TOP 10 constructores con más puntos
SELECT cons_f1.name , SUM(cons_res.points), AVG(cons_res.points) 
FROM constructor_results cons_res 
LEFT JOIN conconstructors_f1structors_f1 cons_f1 ON cons_f1.constructorId = cons_res.constructorId 
GROUP BY cons_res.constructorId, cons_f1.name 
ORDER BY SUM(cons_res.points) DESC, AVG(cons_res.points) 
LIMIT 10;

# Que equipo con mas puntos 
SELECT 
    c_f1.name, 
    (SELECT SUM(points) 
     FROM constructorstandings_f1 
     WHERE constructorId = c_f1.constructorId) AS points_by_race
FROM constructors_f1 c_f1
ORDER BY points_by_race DESC
LIMIT 10;





