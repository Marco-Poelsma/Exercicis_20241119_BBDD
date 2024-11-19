CREATE DATABASE IF NOT EXISTS s3_c1_ej1
CHARACTER SET latin1 COLLATE latin1_bin

CREATE TABLE IF NOT EXISTS Temporada(
    id_temporada INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    CONSTRAINT PK_Temporada PRIMARY KEY (id_temporada)
);

CREATE TABLE IF NOT EXISTS Competicion(
	nombre_competicion VARCHAR(20) NOT NULL,
    nombre_TV VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Competicion PRIMARY KEY (nombre_competicion)
);

CREATE TABLE IF NOT EXISTS Federacion(
	nombre_federacion VARCHAR(20) NOT NULL,
    fecha_creacion DATE NOT NULL,
    nombre_responsable VARCHAR(20),
    apellido1_responsable VARCHAR(20),
    apellido2_responsable VARCHAR(20),
    CONSTRAINT PK_Federacion PRIMARY KEY (nombre_federacion)
);

CREATE TABLE IF NOT EXISTS Equipo(
	nombre_equipo VARCHAR(20) NOT NULL,
    ciudad VARCHAR(20),
    nombre_presidente VARCHAR(20),
    apellido1_presidente VARCHAR(20),
    apellido2_presidente VARCHAR(20),
    nombre_federacion VARCHAR(20),
    CONSTRAINT PK_equipo PRIMARY KEY (nombre_equipo),
    CONSTRAINT FK_1_equipo FOREIGN KEY (nombre_federacion) REFERENCES Federacion (nombre_federacion) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Clasificacion(
    id_temporada INTEGER UNSIGNED NOT NULL,
    nombre_competicion VARCHAR(20) NOT NULL,
    nombre_equipo VARCHAR(20) NOT NULL,
    posicion TINYINT UNSIGNED NOT NULL,
    CONSTRAINT PK_Clasificacion PRIMARY KEY (id_temporada, nombre_competicion, nombre_equipo),
    CONSTRAINT FK_1_Clasificacion FOREIGN KEY (id_temporada) REFERENCES Temporada (id_temporada) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_2_Clasificacion FOREIGN KEY (nombre_competicion) REFERENCES Competicion (nombre_competicion) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_3 Clasificacion FOREIGN KEY (nombre_equipo) REFERENCES Equipo (nombre_equipo) ON DELETE CASCADE ON UPDATE CASCADE
);