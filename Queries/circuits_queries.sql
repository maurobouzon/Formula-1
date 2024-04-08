SELECT * FROM circuits;

# top 5 paises con mas circuitos:
SELECT country, COUNT(circuitId) AS circuits_by_country
FROM circuits
GROUP BY country
ORDER BY circuits_by_country DESC;

# ciruitos de USA:
SELECT *
FROM circuits
WHERE country = "USA";

# substring from url
SELECT SUBSTRING_INDEX(url, 'wiki/', -1) AS circuit_name_url
FROM circuits;

# pasar de latitud y longitud a grados, min y segundos
SELECT name, lat,lng,
    CONCAT(
        CONCAT(FLOOR(lat), '°'),
        CONCAT(FLOOR((lat - FLOOR(lat)) * 60), '\''),
        CONCAT(((lat - FLOOR(lat)) * 60 - FLOOR((lat - FLOOR(lat)) * 60)) * 60, '"'),
        'N'
    ) AS latitud_gps,
    CONCAT(
        CONCAT(FLOOR(lng), '°'),
        CONCAT(FLOOR((lng - FLOOR(lng)) * 60), '\''),
        CONCAT(((lng - FLOOR(lng)) * 60 - FLOOR((lng - FLOOR(lng)) * 60)) * 60, '"'),
        'W'
    ) AS longitud_gps
FROM
    circuits;
    

    
    
