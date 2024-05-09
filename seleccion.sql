CREATE DATABASE triana;
USE triana;

CREATE TABLE triana.ciudad(
	id_ciudad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL
);

CREATE TABLE triana.estadio (
    id_estadio INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    aforo INT,
    id_ciudad INT,       -- Clave foránea que relaciona el estadio con la ciudad
	ticket_mas_costoso DECIMAL(10, 2),
    ano_fundacion DATE,
    FOREIGN KEY (id_ciudad) REFERENCES triana.Ciudad(id_ciudad)
);

CREATE TABLE triana.tecnicos (
    identificacion INT PRIMARY KEY,
    nombres VARCHAR(200),
    fecha_nacimiento DATE,
    pais_nacimiento VARCHAR(50),
    ciudad_nacimiento VARCHAR(50)
);

CREATE TABLE triana.jugadores(
	id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nacionalidad VARCHAR(50) NOT NULL,
    cedula INT(11) NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    posicion VARCHAR(50) NOT NULL,
    equipo VARCHAR(50) NOT NULL,
    valor_jugador DECIMAL(10,2) NOT NULL,
    fecha_nacimiento DATE,
    id_seleccion INT,
	FOREIGN KEY (id_seleccion) REFERENCES triana.selecciones(id_seleccion)
);


CREATE TABLE triana.selecciones (
    id_seleccion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),	
    veces_campeon INT,
    id_estadio INT,  -- Clave foránea hacia la tabla de estadios
    id_ciudad INT,   -- Clave foránea hacia la tabla de ciudades
    id_tecnico INT,      -- Clave foránea hacia la tabla de técnicos
    presidente_federacion VARCHAR(100),
    Grupo CHAR(1),
    FOREIGN KEY (id_estadio) REFERENCES triana.estadio(id_estadio),
    FOREIGN KEY (id_ciudad) REFERENCES triana.ciudad(id_ciudad),
    FOREIGN KEY (id_tecnico) REFERENCES triana.tecnicos(identificacion)
);

CREATE TABLE triana.anosCampeonatos (
	id_campeon INT AUTO_INCREMENT PRIMARY KEY,
    year_campeon INT NOT NULL 
);

CREATE TABLE triana.seleccion_campeon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_seleccion INT,  -- Clave foránea hacia la tabla 'selecciones'
    id_ano_campeon INT,  -- Clave foránea hacia la tabla 'ano_campeon'
    FOREIGN KEY (id_seleccion) REFERENCES triana.selecciones(id_seleccion),
    FOREIGN KEY (id_ano_campeon) REFERENCES triana.anoscampeonatos(id_campeon)
);


CREATE TABLE triana.partidos (
	id_partido INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    goles_local INT NOT NULL,
    goles_visitante INT NOT NULL,
    id_seleccion_local INT NOT NULL,
    id_seleccion_visitante INT NOT NULL,
    FOREIGN KEY (id_seleccion_local) REFERENCES triana.selecciones(id_seleccion),
    FOREIGN KEY (id_seleccion_visitante) REFERENCES triana.selecciones(id_seleccion) 
);


CREATE TABLE triana.goles (
    id_gol INT PRIMARY KEY,
    id_partido INT,
    id_jugador INT,
    descripcion VARCHAR(100),
    minuto INT,
    FOREIGN KEY (id_partido) REFERENCES triana.partidos(id_partido),
    FOREIGN KEY (id_jugador) REFERENCES triana.jugadores(id_jugador)
);


-- Inserta las ciudades en la tabla
INSERT INTO triana.ciudad (nombre) VALUES
('Arlington, TX'),
('Atlanta, GA'),
('Austin, TX'),
('Charlotte, NC'),
('East Rutherford, NJ'),
('Glendale, AZ'),
('Houston, TX'),
('Inglewood, CA'),
('Kansas City, KS'),
('Kansas City, MO'),
('Las Vegas, NV'),
('Miami, FL'),
('Orlando, FL'),
('Santa Clara, CA');



INSERT INTO triana.estadio (id_estadio, nombre, aforo, id_ciudad, ticket_mas_costoso, ano_fundacion)
VALUES
(1, 'Mercedez Benz Stadium', 71000, 2, 5000.00, '2017-01-01'),  -- Atlanta, GA
(2, 'Hard Rock Stadium', 65300, 12, 700.00, '1987-01-01'),     -- Miami, FL
(3, 'GEHA Field at Arrowhead Stadium', 76400, 10, 1299.00, '1972-01-01'),  -- Kansas City, MO
(4, 'Q2 Stadium', 20700, 3, 5079.00, '2021-01-01'),           -- Austin, TX
(5, 'AT&T Stadium', 80000, 1, 777.00, '2009-01-01'),           -- Arlington, TX
(6, 'Bank of America Stadium', 74500, 4, 4000.00, '1996-01-01'),  -- Charlotte, NC
(7, 'MetLife Stadium', 82500, 5, 10869.00, '2010-01-01'),     -- East Rutherford, NJ
(8, 'State Farm Stadium', 63400, 6, 949.00, '2006-01-01'),     -- Glendale, AZ
(9, 'NRG Stadium', 72220, 7, 850.00, '2002-01-01'),           -- Houston, TX
(10, 'SoFi Stadium', 70000, 8, 1180.00, '2020-01-01'),         -- Inglewood, CA
(11, 'Children’s Mercy Park', 18500, 9, 1729.00, '2011-01-01'), -- Kansas City, KS
(12, 'Allegiant Stadium', 65000, 11, 325.00, '2020-01-01'),    -- Las Vegas, NV
(13, 'Inter&Co Stadium', 25500, 13, 706.00, '2017-01-01'),    -- Orlando, FL
(14, 'Levi’s® Stadium', 68500, 14, 850.00, '2014-01-01');    

-- Insertar datos para los técnicos de cada selección
INSERT INTO triana.tecnicos (identificacion, nombres, fecha_nacimiento, pais_nacimiento, ciudad_nacimiento)
VALUES
(1, 'Lionel Scaloni', '1978-05-16', 'Argentina', 'Rosario'),  -- Argentina
(2, 'Tite', '1961-05-25', 'Brasil', 'Caxias do Sul'),         -- Brasil
(3, 'Diego Alonso', '1975-04-16', 'Uruguay', 'Montevideo'),   -- Uruguay
(4, 'Eduardo Berizzo', '1969-11-13', 'Argentina', 'Cruz Alta'), -- Chile
(5, 'Néstor Lorenzo', '1966-02-26', 'Argentina', 'Buenos Aires'), -- Colombia
(6, 'Guillermo Barros Schelotto', '1973-05-04', 'Argentina', 'La Plata'), -- paraguay
(7, 'Juan Reynoso', '1969-12-28', 'Perú', 'Lima'),     -- Perú
(8, 'David Triana', '2005-03-26', 'Colombia', 'Bogota');


INSERT INTO triana.anoscampeonatos (year_campeon) VALUES
(1916),  -- Uruguay
(1917),  -- Uruguay
(1919),  -- Brasil
(1920),  -- Uruguay
(1921),  -- Argentina
(1922),  -- Brasil
(1923),  -- Uruguay
(1924),  -- Uruguay
(1926),  -- Uruguay
(1927),  -- Argentina
(1929),  -- Argentina
(1937),  -- Argentina
(1939),  -- Perú
(1941),  -- Argentina
(1945),  -- Argentina
(1946),  -- Argentina
(1947),  -- Argentina
(1949),  -- Brasil
(1953),  -- Paraguay
(1955),  -- Argentina
(1956),  -- Uruguay
(1957),  -- Argentina
(1959),  -- Argentina y Uruguay
(1963),  -- Bolivia
(1967),  -- Uruguay
(1975),  -- Perú
(1979),  -- Paraguay
(1983),  -- Uruguay
(1987),  -- Uruguay
(1989),  -- Brasil
(1991),  -- Argentina
(1993),  -- Argentina
(1995),  -- Uruguay
(1997),  -- Brasil
(1999),  -- Brasil
(2001),  -- Colombia
(2004),  -- Brasil
(2007),  -- Brasil
(2011),  -- Uruguay
(2015),  -- Chile
(2016),  -- Chile
(2019),  -- Brasil
(2021);  -- Argentina


select * from anoscampeonatos;
-- Relacionar Uruguay con los años en los que ganó la Copa América
-- Crear la tabla pivote para conectar selecciones con años campeones

-- Relacionar Argentina con sus años campeones
INSERT INTO triana.seleccion_campeon (id_seleccion, id_ano_campeon) VALUES
(1, 5),  -- 1921
(1, 8),  -- 1927
(1, 11),  -- 1929
(1, 13),  -- 1937
(1, 14),  -- 1941
(1, 15),  -- 1945
(1, 16),  -- 1946
(1, 17),  -- 1947
(1, 19),  -- 1955
(1, 21),  -- 1957
(1, 25),  -- 1991
(1, 26),  -- 1993
(1, 43); -- 2021

-- Relacionar Brasil con sus años campeones
INSERT INTO triana.seleccion_campeon (id_seleccion, id_ano_campeon) VALUES
(2, 3),  -- 1919
(2, 10),  -- 1922
(2, 18),  -- 1949
(2, 36),  -- 1997
(2, 37),  -- 1999
(2, 39),  -- 2004
(2, 40),  -- 2007
(2, 41); -- 2019

-- Relacionar Uruguay con sus años campeones
INSERT INTO triana.seleccion_campeon (id_seleccion, id_ano_campeon) VALUES
(3, 1),  -- 1916
(3, 2),  -- 1917
(3, 4),  -- 1920
(3, 6),  -- 1923
(3, 7),  -- 1924
(3, 9),  -- 1926
(3, 22),  -- 1956
(3, 29),  -- 1967
(3, 31),  -- 1983
(3, 32),  -- 1987
(3, 33),  -- 1995
(3, 42); -- 2011

-- Relacionar Chile con sus años campeones
INSERT INTO triana.seleccion_campeon (id_seleccion, id_ano_campeon) VALUES
(4, 45),  -- 2015
(4, 46); -- 2016

-- Relacionar Colombia con el año en que fue campeón
INSERT INTO triana.seleccion_campeon (id_seleccion, id_ano_campeon) VALUES
(5, 38); -- 2001

-- Relacionar Paraguay con sus años campeones
INSERT INTO triana.seleccion_campeon (id_seleccion, id_ano_campeon) VALUES
(6, 20),  -- 1953
(6, 28);  -- 1979

-- Relacionar Perú con sus años campeones
INSERT INTO triana.seleccion_campeon (id_seleccion, id_ano_campeon) VALUES
(7, 12),  -- 1939
(7, 27);  -- 1975

-- Insertar nuevos datos en la tabla 'selecciones'
INSERT INTO triana.selecciones (nombre, veces_campeon, id_estadio, id_ciudad, id_tecnico, presidente_federacion, Grupo) VALUES
('Argentina', 15, 2, 2, 1, 'Claudio Tapia', 'A'),   -- Argentina con Mercedes Benz Stadium, ciudad Atlanta
('Brasil', 9, 7, 7, 2, 'Ednaldo Rodrigues', 'B'),  -- Brasil con NRG Stadium, ciudad Houston
('Uruguay', 15, 3, 10, 3, 'Ignacio Alonso', 'A'),  -- Uruguay con GEHA Field, ciudad Kansas City
('Chile', 2, 11, 6, 4, 'Pablo Milad', 'B'),   -- Chile con Allegiant Stadium, ciudad Las Vegas
('Colombia', 1, 2, 12, 5, 'Ramón Jesurún', 'A'),  -- Colombia con Hard Rock Stadium, ciudad Miami
('Paraguay', 2, 6, 5, 6, 'Robert Harrison', 'B'), -- Paraguay con Bank of America Stadium, ciudad Charlotte
('Perú', 2, 14, 14, 7, 'Agustín Lozano', 'A'),    -- Perú con Levi’s Stadium, ciudad Santa Clara
('david_triana', 0, 2,2,8, 'David triana', 'B');

-- Argentina
INSERT INTO triana.jugadores (nacionalidad, cedula, nombre, posicion, equipo, valor_jugador, fecha_nacimiento, id_seleccion)
VALUES
('Argentina', 111111100, 'Emiliano Martínez', 'Portero', 'Aston Villa', 35.00, '1992-09-02',1),
('Argentina', 111111101, 'Nahuel Molina', 'Defensa', 'Atlético de Madrid', 30.00, '1998-04-06',1),
('Argentina', 111111102, 'Cristian Romero', 'Defensa', 'Tottenham Hotspur', 60.00, '1998-04-27',1),
('Argentina', 111111103, 'Nicolás Otamendi', 'Defensa', 'SL Benfica', 3.00, '1988-02-12',1),
('Argentina', 111111104, 'Marcos Acuña', 'Defensa', 'Sevilla FC', 12.00, '1991-10-28',1),
('Argentina', 111111105, 'Rodrigo De Paul', 'Centrocampista', 'Atlético de Madrid', 40.00, '1994-05-24',1),
('Argentina', 111111106, 'Leandro Paredes', 'Centrocampista', 'AS Roma', 20.00, '1994-06-29',1),
('Argentina', 111111107, 'Giovani Lo Celso', 'Centrocampista', 'Tottenham Hotspur (cedido a Villarreal)', 18.00, '1996-04-09',1),
('Argentina', 111111108, 'Lionel Messi', 'Delantero', 'Inter Miami CF', 50.00, '1987-06-24',1),
('Argentina', 111111109, 'Lautaro Martínez', 'Delantero', 'Inter de Milán', 100.00, '1997-08-22',1),
('Argentina', 111111110, 'Ángel Di María', 'Delantero', 'SL Benfica', 4.00, '1988-02-14',1);

-- Brasil
INSERT INTO triana.jugadores (nacionalidad, cedula, nombre, posicion, equipo, valor_jugador, fecha_nacimiento, id_seleccion)
VALUES
('Brasil', 222222200, 'Alisson Becker', 'Portero', 'Liverpool FC', 50.00, '1992-10-02',2),
('Brasil', 222222201, 'Danilo Luiz da Silva', 'Defensa', 'Juventus FC', 15.00, '1991-07-15',2),
('Brasil', 222222202, 'Marquinhos', 'Defensa', 'Paris Saint-Germain', 65.00, '1994-05-14',2),
('Brasil', 222222203, 'Thiago Silva', 'Defensa', 'Chelsea FC', 3.00, '1984-09-22',2),
('Brasil', 222222204, 'Alex Sandro', 'Defensa', 'Juventus FC', 10.00, '1991-01-26', 2),
('Brasil', 222222205, 'Casemiro', 'Centrocampista', 'Manchester United FC', 50.00, '1992-02-23', 2),
('Brasil', 222222206, 'Fred', 'Centrocampista', 'Fenerbahçe SK', 25.00, '1993-03-05',2),
('Brasil', 222222207, 'Lucas Paquetá', 'Centrocampista', 'West Ham United FC', 60.00, '1997-08-27',2),
('Brasil', 222222208, 'Neymar Jr.', 'Delantero', 'Al-Hilal SFC', 75.00, '1992-02-05',2),
('Brasil', 222222209, 'Raphinha', 'Delantero', 'FC Barcelona', 60.00, '1996-12-14',2),
('Brasil', 222222210, 'Richarlison', 'Delantero', 'Tottenham Hotspur', 35.00, '1997-05-10',2);

-- Uruguay
INSERT INTO triana.jugadores (nacionalidad, cedula, nombre, posicion, equipo, valor_jugador, fecha_nacimiento, id_seleccion)
VALUES
('Uruguay', 333333300, 'Fernando Muslera', 'Portero', 'Galatasaray SK', 1.00, '1986-06-16',3),
('Uruguay', 333333301, 'José María Giménez', 'Defensa', 'Atlético de Madrid', 40.00, '1995-01-20',3),
('Uruguay', 333333302, 'Diego Godín', 'Defensa', 'Vélez Sarsfield', 1.00, '1986-02-16',3),
('Uruguay', 333333303, 'Sebastián Coates', 'Defensa', 'Sporting CP', 6.00, '1990-10-07',3),
('Uruguay', 333333304, 'Matías Viña', 'Defensa', 'AFC Bournemouth', 12.00, '1997-11-09',3),
('Uruguay', 333333305, 'Rodrigo Bentancur', 'Centrocampista', 'Tottenham Hotspur', 40.00, '1997-06-25',3),
('Uruguay', 333333306, 'Federico Valverde', 'Centrocampista', 'Real Madrid CF', 100.00, '1998-07-22',3),
('Uruguay', 333333307, 'Lucas Torreira', 'Centrocampista', 'Galatasaray SK', 15.00, '1996-02-11',3),
('Uruguay', 333333308, 'Luis Suárez', 'Delantero', 'Gremio', 4.00, '1987-01-24',3),
('Uruguay', 333333309, 'Edinson Cavani', 'Delantero', 'Boca Juniors', 3.00, '1987-02-14',3),
('Uruguay', 333333310, 'Darwin Núñez', 'Delantero', 'Liverpool FC', 70.00, '1999-06-24',3);

-- Chile
INSERT INTO triana.jugadores (nacionalidad, cedula, nombre, posicion, equipo, valor_jugador, fecha_nacimiento, id_seleccion)
VALUES
('Chile', 444444400, 'Claudio Bravo', 'Portero', 'Real Betis Balompié', 1.00, '1983-04-13',4),
('Chile', 444444401, 'Gary Medel', 'Defensa', 'Vasco da Gama', 1.00, '1987-08-03',4),
('Chile', 444444402, 'Guillermo Maripán', 'Defensa', 'AS Mónaco', 15.00, '1994-05-06',4),
('Chile', 444444403, 'Mauricio Isla', 'Defensa', 'Fluminense FC', 1.00, '1988-06-12',4),
('Chile', 444444404, 'Eugenio Mena', 'Defensa', 'Racing Club', 1.00, '1988-07-18',4),
('Chile', 444444405, 'Arturo Vidal', 'Centrocampista', 'Atlético Paranaense', 3.00, '1987-05-22',4),
('Chile', 444444406, 'Charles Aránguiz', 'Centrocampista', 'Bayer 04 Leverkusen', 3.00, '1989-04-17',4),
('Chile', 444444407, 'Erick Pulgar', 'Centrocampista', 'Flamengo', 5.00, '1994-01-15',4),
('Chile', 444444408, 'Alexis Sánchez', 'Delantero', 'Inter de Milán', 8.00, '1988-12-19',4),
('Chile', 444444409, 'Eduardo Vargas', 'Delantero', 'Atlético Mineiro', 1.00, '1989-11-20',4),
('Chile', 444444410, 'Ben Brereton', 'Delantero', 'Villarreal CF', 20.00, '1999-04-18',4);

-- Colombia
INSERT INTO triana.jugadores (nacionalidad, cedula, nombre, posicion, equipo, valor_jugador, fecha_nacimiento, id_seleccion)
VALUES
('Colombia', 555555500, 'David Ospina', 'Portero', 'Al-Nassr FC', 3.00, '1988-08-31',5),
('Colombia', 555555501, 'Stefan Medina', 'Defensa', 'CF Monterrey', 5.00, '1992-06-14',5),
('Colombia', 555555502, 'Yerry Mina', 'Defensa', 'AC Fiorentina', 5.00, '1994-09-23',5),
('Colombia', 555555503, 'Davinson Sánchez', 'Defensa', 'Galatasaray SK', 15.00, '1996-06-12',5),
('Colombia', 555555504, 'William Tesillo', 'Defensa', 'CF Monterrey', 2.00, '1990-02-02',5),
('Colombia', 555555505, 'Wilmar Barrios', 'Centrocampista', 'Zenit de San Petersburgo', 12.00, '1993-10-16',5),
('Colombia', 555555506, 'Mateus Uribe', 'Centrocampista', 'Al-Sadd SC', 7.00, '1991-03-21',5),
('Colombia', 555555507, 'Juan Guillermo Cuadrado', 'Centrocampista', 'Inter de Milán', 2.00, '1988-05-26',5),
('Colombia', 555555508, 'James Rodríguez', 'Centrocampista', 'Sao Paulo FC', 3.00, '1991-07-12',5),
('Colombia', 555555509, 'Luis Díaz', 'Delantero', 'Liverpool FC', 85.00, '1997-01-13',5),
('Colombia', 555555510, 'Rafael Santos Borré', 'Delantero', 'Werder Bremen', 12.00, '1995-09-15',5);

INSERT INTO triana.jugadores (nacionalidad, cedula, nombre, posicion, equipo, valor_jugador, fecha_nacimiento, id_seleccion)
VALUES
('Paraguay', 666666600, 'Antony Silva', 'Portero', 'Puebla FC', 1.00, '1983-02-27',6),
('Paraguay', 666666601, 'Gustavo Gómez', 'Defensa', 'SE Palmeiras', 8.00, '1993-05-06',6),
('Paraguay', 666666602, 'Fabian Balbuena', 'Defensa', 'Corinthians', 2.00, '1991-08-23',6),
('Paraguay', 666666603, 'Robert Rojas', 'Defensa', 'River Plate', 6.00, '1996-04-30',6),
('Paraguay', 666666604, 'Junior Alonso', 'Defensa', 'Krasnodar', 6.00, '1993-02-09',6),
('Paraguay', 666666605, 'Mathias Villasanti', 'Centrocampista', 'Grêmio', 4.00, '1997-01-24',6),
('Paraguay', 666666606, 'Richard Ortiz', 'Centrocampista', 'Club Olimpia', 1.00, '1990-05-22',6),
('Paraguay', 666666607, 'Oscar Romero', 'Centrocampista', 'Boca Juniors', 2.00, '1992-07-04',6),
('Paraguay', 666666608, 'Ángel Romero', 'Delantero', 'Corinthians', 2.00, '1992-07-04',6),
('Paraguay', 666666609, 'Derlis González', 'Delantero', 'Club Olimpia', 3.00, '1994-03-20',6),
('Paraguay', 666666610, 'Miguel Almirón', 'Delantero', 'Newcastle United', 25.00, '1994-02-10',6);

-- Perú
INSERT INTO triana.jugadores (nacionalidad, cedula, nombre, posicion, equipo, valor_jugador, fecha_nacimiento, id_seleccion)
VALUES
('Perú', 777777700, 'Pedro Gallese', 'Portero', 'Orlando City SC', 1.00, '1990-01-23',7),
('Perú', 777777701, 'Luis Advíncula', 'Defensa', 'Boca Juniors', 2.00, '1990-03-02',7),
('Perú', 777777702, 'Carlos Zambrano', 'Defensa', 'LDU Quito', 1.00, '1989-07-10',7),
('Perú', 777777703, 'Alexander Callens', 'Defensa', 'Girona FC', 3.00, '1992-05-04',7),
('Perú', 777777704, 'Miguel Trauco', 'Defensa', 'San José Earthquakes', 1.00, '1992-08-25',7),
('Perú', 777777705, 'Renato Tapia', 'Centrocampista', 'Celta de Vigo', 5.00, '1995-07-28',7),
('Perú', 777777706, 'Yoshimar Yotún', 'Centrocampista', 'Sporting Cristal', 1.00, '1990-04-07',7),
('Perú', 777777707, 'Christian Cueva', 'Centrocampista', 'Alianza Lima', 2.00, '1991-11-23',7),
('Perú', 777777708, 'André Carrillo', 'Delantero', 'Al-Hilal SFC', 3.00, '1991-06-14',7),
('Perú', 777777709, 'Gianluca Lapadula', 'Delantero', 'Cagliari Calcio', 6.00, '1990-02-07',7),
('Perú', 777777710, 'Edison Flores', 'Delantero', 'Atlas FC', 2.00, '1994-05-14',7);


-- Inserciones para jugadores colombianos
INSERT INTO triana.jugadores (nacionalidad, cedula, nombre, posicion, equipo, valor_jugador, fecha_nacimiento, id_seleccion)
 VALUES
('Colombia', 888888800, 'Juan Pérez', 'Portero', 'Deportivo Cali', 0.00, '2003-01-15', 8),
('Colombia', 888888801, 'Pedro Gómez', 'Defensa', 'Independiente Medellín', 0.00, '2005-10', 8),
('Colombia', 888888802, 'Andrés López', 'Defensa', 'Once Caldas', 0.00, '2002-05-20', 8),
('Colombia', 888888803, 'Carlos Rojas', 'Defensa', 'Atlético Nacional', 0.00, '2004-07-30', 8),
('Colombia', 888888804, 'Miguel Hernández', 'Centrocampista', 'Millonarios FC', 0.00, '2003-09-25', 8),
('Colombia', 888888805, 'Santiago Ruiz', 'Centrocampista', 'Deportivo Pereira', 0.00, '2002-11-15', 8),
('Colombia', 888888806, 'Luis García', 'Centrocampista', 'Junior de Barranquilla', 0.00, '2001-02-28', 8),
('Colombia', 888888807, 'Jorge Martínez', 'Delantero', 'Deportivo Pasto', 0.00, '2003-06-18', 8),
('Colombia', 888888808, 'Felipe Sánchez', 'Delantero', 'América de Cali', 0.00, '2006-08-10', 8),
('Colombia', 888888809, 'Gabriel Hernández', 'Delantero', 'Envigado FC', 0.00, '2004-10-05', 8),
('Colombia', 888888810, 'Ricardo López', 'Delantero', 'Atlético Huila', 0.00, '2002-12-30', 8);


INSERT INTO triana.partidos(fecha ,  goles_local , goles_visitante , id_seleccion_local , id_seleccion_visitante) VALUES
('2024-06-20',2,2,1,2),
('2024-06-20',2,1,3,4),
('2024-06-21',3,2,5,6),
('2024-06-21',1,2,7,8),
('2024-06-22',1,1,2,3),
('2024-06-22',3,1,1,4),
('2024-06-23',3,2,6,8),
('2024-06-23',2,1,5,7),
('2024-06-24',1,1,2,4),
('2024-06-24',1,1,1,3),
('2024-06-25',1,1,5,8),
('2024-06-25',2,1,6,7);

INSERT INTO triana.goles( id_gol, id_partido , id_jugador , descripcion , minuto) values
(1,1,9,'Penalti',16),
(2,1,11,'Chilena',50),
(3,1,20,'Tiro libre',7),
(4,1,22,'Cabeza',70),
(5,2,33,'Cabeza',10),
(6,2,33,'Tiro al angulo',44),
(7,2,42,'Fuera del area',75),
(8,3,45,'Cabeza',20),
(9,3,55,'Cabeza',50),
(10,3,54,'Bolea',60),
(11,3,63,'Tiro libre',25),
(12,3,63,'Jugada individual',40),
(13,4,77,'Fuera del area',40),
(14,4,87,'Cabeza',5),
(15,4,88,'Jugada individual',20),
(16,5,20,'Jugada individual',62),
(17,5,33,'Tiro libre',37),
(18,6,9,'Jugada individual',22),
(19,6,11,'Bolea',30),
(20,6,11,'Chilena',32),
(21,6,39,'Cabeza',41),
(22,7,65,'Juagda individual',33),
(23,7,65,'Bolea',42),
(24,7,66,'Cabeza',46),
(25,7,88,'Fuera del area',40),
(26,7,87,'Tiro al angulo',82),
(27,8,54,'Juagda individual',33),
(28,8,54,'Bolea',42),
(29,8,73,'Fuera del area',47),
(30,9,20,'Tiro libre',38),
(31,9,42,'Tiro al angulo',77),
(32,10,9,'Tiro libre',44),
(33,10,33,'Bolea',85),
(34,11,54,'Chilena',22),
(35,11,88,'Jugada individual',54),
(36,12,66,'Bolea',23),
(37,12,65,'Jugada individual',43),
(38,12,76,'Fuera del area',88);
-- Eliminar datos basados en el rango de identificadores





select * from triana.jugadores;

-- primera consulta

-- TIMESTAMPDIFF Calcula la diferencia entre dos fechas y devuelve el resultado en la unidad especificada.
-- Parámetros: YEAR: Indica que deseas la diferencia en años. fecha_nacimiento: Es la fecha de nacimiento del jugador.
-- CURDATE(): Devuelve la fecha actual. Por lo tanto, este parámetro se usa para comparar con la fecha de nacimiento.
-- Resultado: La diferencia en años entre dos fechas
SELECT nombre,fecha_nacimiento,TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS Edad
FROM jugadores
WHERE TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) > 20;

-- segunda consulta 

select nombre,posicion,nacionalidad,equipo 
from triana.jugadores;


select * from triana.jugadores where triana.jugadores.id_jugador = 20;
-- tercera consulta
SELECT triana.jugadores.id_jugador,triana.jugadores.nombre, triana.goles.id_gol, triana.partidos.id_partido, triana.partidos.fecha
FROM triana.goles
INNER JOIN triana.jugadores
ON triana.goles.id_jugador = triana.jugadores.id_jugador
INNER JOIN triana.partidos
ON triana.goles.id_partido = triana.partidos.id_partido;
-- cuarta consulta

select * from triana.jugadores;

SELECT * 
FROM triana.jugadores 
WHERE posicion = 'Delantero' 
ORDER BY valor_jugador DESC;

-- quinta consulta

SELECT * 
FROM triana.selecciones 
WHERE Grupo = 'A';

-- sexta consulta
SELECT  triana.selecciones.nombre, triana.estadio.nombre AS nombre_estadio, triana.estadio.aforo, triana.estadio.ticket_mas_costoso, triana.estadio.ano_fundacion
FROM triana.selecciones 
inner join triana.estadio
ON triana.selecciones.id_estadio = triana.estadio.id_estadio
WHERE triana.selecciones.id_estadio = 2;

-- septima consulta

SELECT  nombre AS nombre_seleccion, presidente_federacion
FROM triana.selecciones;

-- octava consulta 
SET SQL_SAFE_UPDATES = 0;

UPDATE triana.partidos
SET fecha = CURDATE()  -- Cambia la fecha al día de hoy
WHERE fecha = '2024-06-20'  ;  -- Condición para partidos aplazados

SELECT * FROM triana.partidos;

-- novena consulta

SELECT  triana.tecnicos.nombres AS nombre_entrenador, triana.selecciones.nombre AS nombre_seleccion, triana.tecnicos.ciudad_nacimiento 
FROM triana.selecciones
INNER JOIN triana.tecnicos
ON triana.selecciones.id_tecnico = triana.tecnicos.identificacion;
 
-- decima consulta

SELECT triana.jugadores.nombre, triana.selecciones.nombre AS nombre_seleccion, triana.jugadores.posicion, triana.jugadores.valor_jugador  
FROM triana.jugadores
INNER JOIN triana.selecciones
ON triana.jugadores.id_seleccion = triana.selecciones.id_seleccion
WHERE triana.selecciones.id_seleccion = 1
ORDER BY triana.jugadores.valor_jugador DESC; 


