--Documento para crear los procedimientos almacenados y consultas 
--que se estar�n realizando a las tablas existentes de la BD para 
--mostrar dicha informacion en la aplicacion

--SP_MOSTRARPROSPECTOS: Muestra el listado completo de los
--prospectos registrados hasta el momento
CREATE PROC sp_mostrarProspectos
AS
SELECT * FROM prospectos

