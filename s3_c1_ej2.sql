CREATE DATABASE IF NOT EXISTS s3_c1_ej2
CHARACTER SET utf8 COLLATE utf8_spanish_ci

CREATE TABLE IF NOT EXISTS Persona (
    num_SS INTEGER UNSIGNED NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Persona PRIMARY KEY (num_SS) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Equipo (
    nombre VARCHAR(20) NOT NULL,
    ano_fundacion SMALLINT USNIGNED NOT NULL,
    presupuesto DECIMAL(10,2) NOT NULL,
    nombre_presidente VARCHAR(20) NOT NULL,
    apellido1_presidente VARCHAR(20) NOT NULL,
    apellido2_presidente VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Equipo PRIMARY KEY (nombre) ON UPDATE CASCADE ON DELETE CASCADE
);