CREATE TABLE peliculas (
    id SERIAL PRIMARY KEY,
    título VARCHAR(255),
    año_estreno INT,
    director VARCHAR(255)
);

CREATE TABLE reparto (
    id SERIAL PRIMARY KEY,
    id_pelicula INT REFERENCES peliculas(id),
    actor TEXT
);

COPY peliculas
FROM 'C:\Users\Faedo\Desktop\des ev 3\peliculas.csv' 
DELIMITER ',' CSV HEADER;

COPY reparto(id_pelicula, actor) 
FROM 'C:\Users\Faedo\Desktop\des ev 3\reparto.csv' 
DELIMITER ',' CSV HEADER;


SELECT id
FROM peliculas
WHERE título = 'Titanic';

SELECT actor
FROM reparto
WHERE id_pelicula = (
    SELECT id
    FROM peliculas
    WHERE título = 'Titanic'
);

SELECT COUNT(*) AS peliculas_con_Harrison_Ford
FROM reparto
WHERE actor = 'Harrison Ford';

SELECT título, año_estreno
FROM peliculas
WHERE año_estreno BETWEEN 1990 AND 1999
ORDER BY título ASC;

SELECT título, LENGTH(título) AS longitud_titulo
FROM peliculas;

SELECT MAX(LENGTH(título)) AS longitud_máxima
FROM peliculas;