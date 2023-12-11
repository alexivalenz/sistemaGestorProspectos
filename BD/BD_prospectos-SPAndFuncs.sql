--Documento para crear los procedimientos almacenados y consultas 
--que se estarán realizando a las tablas existentes de la BD para 
--mostrar dicha informacion en la aplicacion
--09/12/2023 By Alexia Valenzuela Millán

USE prospectos;
GO
--SP_OBTENERINFOTODOSPROSPECTOS: Muestra el listado completo de los
--prospectos registrados hasta el momento
CREATE PROC sp_obtenerInfoTodosProspectos
AS
	SELECT * --nombre, ape_paterno, ape_materno, estatus, observaciones
	FROM prospectos
GO

--SP_OBTENERINFOPROSPECTO: Muestra la información de un solo prospecto (sin documentos)
CREATE PROC sp_obtenerInfoProspecto
@ID INT 
AS 
	SELECT *--nombre, ape_paterno, ape_materno, estatus, observaciones 
	FROM prospectos WHERE ID = @ID
GO

--SP_INSERTARPROSPECTO: Agrega a la tabla PROSPECTOS un nuevo 
--registro
CREATE PROC sp_insertarProspecto
@ID INT,
@nombre VARCHAR(50),
@ape_paterno VARCHAR(50), 
@ape_materno VARCHAR(50),
@calle VARCHAR(50),
@numero_domicilio INT,
@colonia VARCHAR(50), 
@codigo_postal INT,
@telefono VARCHAR(10),
@rfc VARCHAR(13),
@estatus VARCHAR(20)
AS
	INSERT INTO prospectos VALUES (@ID, @nombre ,@ape_paterno, @ape_materno, @calle, @numero_domicilio ,@colonia, @codigo_postal, @telefono,@rfc,@estatus, 'Sin observaciones relevantes')
GO

--SP_ACTUALIZARESTATUSPROSPECTO: Actualiza el estatus y las observaciones del 
--prospecto en caso de que tenga un estatus RECHAZADO
CREATE PROC sp_actualizarEstatusProspecto
@ID INT, 
@Estatus VARCHAR(20),
@Observaciones text
AS
	UPDATE prospectos 
	SET estatus = @Estatus, observaciones = @Observaciones 
	WHERE ID = @ID
GO

--SP_OBTENERNEXTIDPROSPECTO: Obtiene el maximo id en la tabla prospectos
CREATE PROC sp_obtenerNextIdProspecto 
AS 
	select MAX(ID) as max_id from prospectos;
GO

--SP_INSERTADOCUMENTO: Inserta un registro nuevo a la tabla documentos_prospectos
CREATE PROC sp_insertarDocumento
@idDocumento INT,
@idProspecto INT,
@nombreDocumento VARCHAR(50),
@documento VARBINARY(MAX)
AS
	INSERT INTO documentos_prospectos  
	VALUES (@idDocumento, @idProspecto, @nombreDocumento, @documento)
GO

--SP_OBTENERDOCSPROSPECTO: Obtiene todos los documentos de un determinado prospecto
CREATE PROC sp_obtenerDocsProspecto 
@ID INT 
AS
	SELECT d.id_documento as idDocumento, d.id_prospecto as idProspecto, d.nombre_documento as nombreDocumento, d.documento as Documento 
	FROM documentos_prospectos d
	INNER JOIN prospectos p on d.id_prospecto = p.ID
	WHERE p.ID = @ID
GO

--SP_OBTENERNEXTIDDOCUMENT: Obtiene el maximo id en la tabla documentos_prospectos
CREATE PROC sp_obtenerNextIdDocumento 
AS 
	select MAX(id_documento) as max_id from documentos_prospectos;
GO

--Ejecuciones de los SPs
EXEC sp_obtenerInfoTodosProspectos

EXEC sp_insertarProspecto 3,'Juan', 'Valenzuela', 'Reyes', 'Monte Alban', 1234, 'Recursos', 80105, '6673047306', 'VAMA9980124MS', 'Enviado'