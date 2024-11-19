CREATE DATABASE IF NOT EXISTS s3_c1_ej3
DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE s3_c1_ej3;

DROP TABLE IF EXISTS Usuario
CREATE TABLE IF NOT EXISTS Usuario (
    id_usuario INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
    DNI VARCHAR(9) NOT NULL,
    email VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    num_targeta INTEGER UNSIGNED NOT NULL,
    CONSTRAINT PK_Usuario PRIMARY KEY (id_usuario)
);

DROP TABLE IF EXISTS Cliente
CREATE TABLE IF NOT EXISTS Cliente(
    id_cliente INTEGER UNSIGNED NOT NULL,
    gusta_electronico BIT (1) NOT NULL DEFAULT 1,
    CONSTRAINT PK_Cliente PRIMARY KEY (id_cliente),
);

DROP TABLE IF EXISTS Subscritor
CREATE TABLE IF NOT EXISTS Subscritor (
    id_subscritor INTEGER UNSIGNED NOT NULL,
    es_asociado BIT (1) NOT NULL DEFAULT 1,
    CONSTRAINT PK_Subscritor PRIMARY KEY (id_subscritor),
);

DROP TABLE IF EXISTS Coleccion
CREATE TABLE IF NOT EXISTS Coleccion (
    nombre_coleccion VARCHAR(100) NOT NULL,
    ano_inicio YEAR NOT NULL,
    ano_final YEAR NOT NULL,
    CONSTRAINT PK_nombre_coleccion PRIMARY KEY (nombre_coleccion)
);

DROP TABLE IF EXISTS Subscritor_Coleccion
CREATE TABLE IF NOT EXISTS Subscritor_Coleccion (
    id_subscritor INTEGER UNSIGNED NOT NULL,
    nombre_coleccion VARCHAR(100) NOT NULL,
    num_inicio INTEGER UNSIGNED NOT NULL,
    CONSTRAINT PK_Subscritor_Coleccion PRIMARY KEY (id_subscritor, nombre_coleccion)
);

DROP TABLE IF EXISTS Entrega
CREATE TABLE IF NOT EXISTS Entrega (
    fecha_entrega DATE NOT NULL,
    nombre_coleccion VARCHAR(100) NOT NULL,
    num_paginas SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT PK_Entrega PRIMARY KEY (fecha_entrega, nombre_coleccion)
);

DROP TABLE IF EXISTS Regalo
CREATE TABLE IF NOT EXISTS Regalo (
    id_regalo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    fecha_entrega DATE NOT NULL,
    nombre_coleccion VARCHAR(100) NOT NULL,
    peso REAL UNSIGNED NOT NULL,
    CONSTRAINT PK_Regalo PRIMARY KEY (id_regalo, fecha_entrega, nombre_coleccion)
);

DROP TABLE IF EXISTS Cliente_Entrega
CREATE TABLE IF NOT EXISTS Cliente_Entrega (
    id_cliente INTEGER UNSIGNED NOT NULL,
    fecha_entrega DATE NOT NULL,
    nombre_coleccion VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Cliente_Entrega PRIMARY KEY (id_cliente, fecha_entrega, nombre_coleccion)
);

ALTER TABLE Subscritor
ADD CONSTRAINT FK_Subscritor FOREIGN KEY (id_subscritor) REFERENCES Usuario (id_usuario) ON UPDATE CASCADE ON DELETE CASCADE

ALTER TABLE Subscritor_Coleccion
ADD CONSTRAINT FK_1_Subscritor_Coleccion FOREIGN KEY (id_subscritor) REFERENCES Subscritor (id_subscritor) ON UPDATE CASCADE ON DELETE CASCADE

ALTER TABLE Subscritor_Coleccion
ADD CONSTRAINT FK_2_Subscritor_Coleccion FOREIGN KEY (nombre_coleccion) REFERENCES Coleccion (nombre_coleccion) ON UPDATE CASCADE ON DELETE CASCADE

ALTER TABLE Entrega
ADD CONSTRAINT FK_Entrega FOREIGN KEY (nombre_coleccion) REFERENCES Coleccion (nombre_coleccion) ON UPDATE CASCADE ON DELETE CASCADE

ALTER TABLE Regalo
ADD CONSTRAINT FK_Regalo FOREIGN KEY (fecha_entrega, nombre_coleccion) REFERENCES Entrega (fecha_entrega, nombre_coleccion) ON UPDATE CASCADE ON DELETE CASCADE

ALTER TABLE Cliente_Entrega
ADD CONSTRAINT FK_1_Cliente_Entrega FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente) ON UPDATE CASCADE ON DELETE CASCADE

ALTER TABLE Cliente_Entrega
ADD CONSTRAINT FK_2_Cliente_Entrega FOREIGN KEY (fecha_entrega, nombre_coleccion) REFERENCES Entrega (fecha_entrega, nombre_coleccion) ON UPDATE CASCADE ON DELETE CASCADE

ALTER TABLE Cliente
ADD CONSTRAINT FK_Cliente FOREIGN KEY (id_cliente) REFERENCES Usuario (id_usuario) ON UPDATE CASCADE ON DELETE CASCADE