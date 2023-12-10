--Documento para crear los procedimientos almacenados y consultas 
--que se estarán realizando a las tablas existentes de la BD para 
--mostrar dicha informacion en la aplicacion
--09/12/2023 By Alexia Valenzuela Millán

--SP_MOSTRARPROSPECTOS: Muestra el listado completo de los
--prospectos registrados hasta el momento
CREATE PROC sp_mostrarProspectos
AS
	SELECT * FROM prospectos
GO

--SP_INSERTARNUEVOPROSPECTO: Agrega a la tabla PROSPECTOS un nuevo 
--registro
CREATE PROC sp_insertarNuevoProspecto 
@ID INT,
@nombre VARCHAR(50),
@ape_paterno VARCHAR(50), 
@ape_materno VARCHAR(50),
@calle VARCHAR(50),
@numero_domicilio INT,
@colonia VARCHAR(50), 
@codigo_postal VARCHAR(50),
@telefono VARCHAR(10),
@rfc VARCHAR(13),
@estatus VARCHAR(20)
AS
	INSERT INTO prospectos(nombre, ape_paterno, ape_materno, calle, numero_domicilio, colonia, codigo_postal, telefono, rfc, estatus, observaciones) 
	VALUES (@nombre ,@ape_paterno, @ape_materno, @calle, @numero_domicilio ,@colonia, @codigo_postal, @telefono,@rfc,@estatus, 'Sin observaciones relevantes')
GO

--SP_ACTUALIZAESTATUS: Actualiza el estatus y las observaciones del 
--prospecto en caso de que tenga un estatus RECHAZADO
CREATE PROC sp_actualizaEstatus
@ID INT, 
@Estatus VARCHAR(20),
@Observaciones text
AS
	UPDATE prospectos SET estatus = @Estatus, observaciones = @Observaciones 
WHERE ID = @ID
GO

--SP_INSERTANUEVODOCUMENTO: Inserta un registro nuevo a la tabla documentos_prospectos
CREATE PROC sp_insertaNuevoDocumento
@id_prospecto INT,
@documento VARBINARY(MAX)
AS
	INSERT INTO documentos_prospectos(id_prospecto, info_documento) VALUES (@id_prospecto, @documento)
GO
