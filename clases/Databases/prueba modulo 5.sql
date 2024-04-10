--crear tablas--

CREATE TABLE Peliculas(
id int primary key,
nombre varchar(255),
anno int);

CREATE TABLE Tags(
id int primary key,
tag varchar(32));

-- crear link entre tablas--

CREATE TABLE tags_peliculas(
pelicula_id int,
tag_id int,
foreign key (pelicula_id) references peliculas(id),
foreign key (tag_id) references tags(id),
primary key (pelicula_id, tag_id));

--insertar datos--

INSERT INTO peliculas (id, nombre, anno)
VALUES
(1, '50/50', 2011),
(2, 'Ying Xion', 2002),
(3, 'Hot Tub Time Machine', 2010),
(4, 'Bang Bang You''re Dead', 2002),
(5, 'Red Cliff', 2008);

select * from peliculas

INSERT INTO Tags
values
(1,'Accion'),
(2,'Comedia'),
(3,'Historico'),
(4,'Independiente'),
(5,'Belico'),
(6,'Fantasia'),
(7,'Drama'),
(8,'Documental');

select * from tags

--asociar peliculas con tags--

INSERT INTO tags_peliculas(pelicula_id, tag_id) 
VALUES
(1, 7),
(1, 4),
(1, 2);

INSERT INTO tags_peliculas(pelicula_id, tag_id) 
VALUES
(2, 5),
(2, 3);

--mostrar cantidad de tags--

SELECT 
p.nombre AS pelicula_nombre,
COUNT(tp.tag_id) AS cantidad_tags
FROM 
peliculas p
LEFT JOIN 
tags_peliculas tp ON p.id = tp.pelicula_id
LEFT JOIN 
tags t ON tp.tag_id = t.id
GROUP BY 
p.id, p.nombre
ORDER BY 
p.id;

	
-------------------------------------------------------- segunda parte de la prueba -----------------------------------------------------------------

--tablas iniciales--

CREATE TABLE preguntas(
id INT PRIMARY KEY,
pregunta VARCHAR(255),
respuesta_correcta VARCHAR(255)
);

CREATE TABLE usuarios(
id INT PRIMARY KEY,
nombre VARCHAR(255),
edad INT
);

CREATE TABLE respuestas(
id INT PRIMARY KEY,
respuesta VARCHAR(255),
usuario_id INT,
pregunta_id INT,
FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
FOREIGN KEY (pregunta_id) REFERENCES preguntas(id)
);

-- crear usuarios--
INSERT INTO usuarios (id, nombre, edad) 
VALUES
(1, 'Patricio', 25),
(2, 'Alejandra', 30),
(3, 'Carlos', 28),
(4, 'Isabelle', 69),
(5, 'Luis', 35);

-- Insertar preguntas con respuestas correctas--
INSERT INTO preguntas (id, pregunta, respuesta_correcta) VALUES
(1, '¿Cuál es el actor principal de 50/50?', 'Joseph Gordon-Levitt'),
(2, '¿Cuál es el genero de Ying Xion?', 'Historico'),
(3, '¿Cuál es el rol de John Cusack en Hot Tub Time Machine?', 'Actor Principal'),
(4, '¿Considerarías Bang Bang You''re dead un drama?', 'si'),
(5, '¿Alguna de las películas previamente listadas es una comedia?', 'si');

-- Insertar dos y una respuesta correcta--
INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) 
VALUES
--pregunta 1--
(1, 'Joseph Gordon-Levitt', 1, 1),
(2, 'Joseph Gordon-Levitt', 2, 1),
--pregunta 2--
(3, 'Historico', 3, 2);

-- Insertar respuestas incorrectas a pregunta 1--
INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) 
VALUES
(4, 'Seth Rogen', 4, 1),
(5, 'Anna Kendrick', 5, 1);

--contar respuestas correctas--

SELECT u.nombre, COUNT(r.id) as respuestas_correctas_totales
FROM usuarios u
LEFT JOIN respuestas r ON u.id = r.usuario_id
INNER JOIN preguntas p ON r.pregunta_id = p.id AND r.respuesta = p.respuesta_correcta
GROUP BY u.id, u.nombre
ORDER BY u.id;

--en tabla preguntas contar usuarios resp correcta--

SELECT p.pregunta, p.respuesta_correcta, COUNT(r.usuario_id) AS usuarios_con_respuesta_correcta
FROM preguntas p
LEFT JOIN respuestas r ON p.id = r.pregunta_id AND r.respuesta = p.respuesta_correcta
GROUP BY p.id, p.pregunta, p.respuesta_correcta
ORDER BY p.id;

--borrado en cascada respuestas al eliminar usuario--

ALTER TABLE respuestas
DROP CONSTRAINT IF EXISTS respuestas_usuario_id_fkey;

--restricción de clave--
ALTER TABLE respuestas
ADD CONSTRAINT respuestas_usuario_id_fkey
FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
ON DELETE CASCADE;

--kill usuario--

DELETE FROM usuarios WHERE id = 1;

--check usuario eliminado--
select * from usuarios

--check edad usuario--

ALTER TABLE usuarios
ADD CONSTRAINT check_edad
CHECK (edad >= 18);

--agregar correo--

ALTER TABLE usuarios
ADD COLUMN correo VARCHAR(255) UNIQUE;

--check correo--
select * from usuarios














