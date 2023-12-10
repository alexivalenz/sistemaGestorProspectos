--Documento que crea la BD correspondiente para el ejercicio de GESTION DE PROSPECTOS
--además de las tablas que se utilizaran para almacenar la informacion que se estara
--manejando
--09/12/2023 By Alexia Valenzuela Millán

--Creacion y uso de la bd
CREATE DATABASE db_prospectos;
USE db_prospectos;
GO

--Creacion de la tabla que almacenara la info 
--de cada persona (prospecto a cliente)
CREATE TABLE prospectos(
ID INT PRIMARY KEY NOT NULL,
nombre VARCHAR(50) NOT NULL,
ape_paterno VARCHAR(50) NOT NULL, 
ape_materno VARCHAR(50),
calle VARCHAR(50) NOT NULL,
numero_domicilio INT NOT NULL,
colonia VARCHAR(50) NOT NULL, 
codigo_postal VARCHAR(50) NOT NULL,
telefono VARCHAR(10) NOT NULL,
rfc VARCHAR(13) NOT NULL,
estatus VARCHAR(20) NOT NULL,
observaciones text
); 
GO

--Creacion de la tabla que almacenara la info de 
--cada documento en base al prospecto al que 
--corresponde.
CREATE TABLE documentos_prospectos(
id_documento INT NOT NULL,
id_prospecto INT NOT NULL,
nombre_documento VARCHAR(50) NOT NULL,
documento VARBINARY(MAX) NOT NULL,
PRIMARY KEY (id_documento, id_prospecto),
FOREIGN KEY (id_prospecto) REFERENCES prospectos(ID)
);
GO

--Borrado de las tablas en caso de ser necesario
--DELETE documentos_prospectos;
GO
--DELETE prospectos
GO

--Consulta de la info de cada una de las tablas de la BD
SELECT * FROM documentos_prospectos;
SELECT * FROM prospectos;