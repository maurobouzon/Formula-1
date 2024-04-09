SELECT * FROM constructor_results;
SELECT * FROM constructors_f1;
SELECT * FROM constructorstandings_f1;

# cuantos constructores hay ?
SELECT COUNT(DISTINCT(constructorId)) AS num_constructors
FROM constructor_results;

# TOP 10 constructores con más puntos y porcentaje de puntos por carrera
SELECT cons_f1.name , SUM(cons_res.points), AVG(cons_res.points) 
FROM constructor_results cons_res 
LEFT JOIN constructors_f1 cons_f1 ON cons_f1.constructorId = cons_res.constructorId 
GROUP BY cons_res.constructorId, cons_f1.name 
ORDER BY SUM(cons_res.points) DESC, AVG(cons_res.points) 
LIMIT 10;







