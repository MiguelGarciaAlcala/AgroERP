
-- ################################
-- ## PROCEDIMIENTOS ALMACENADOS ##
-- ################################

USE AGROQUIMICA_ERP
GO

INSERT INTO RecursosHumanos.Departamentos VALUES (1, 'Finanzas', 'A')
INSERT INTO RecursosHumanos.Departamentos VALUES (2, 'Soporte Técnico', 'A')
INSERT INTO RecursosHumanos.Departamentos VALUES (3, 'Mantenimiento', 'A')

INSERT INTO RecursosHumanos.Puestos VALUES (1, 'Contador', 10000, 15000, 'A')
INSERT INTO RecursosHumanos.Puestos VALUES (2, 'Conserje', 7000, 9000, 'A')
INSERT INTO RecursosHumanos.Puestos VALUES (3, 'Técnico de Sistemas', 13000, 17000, 'A')

INSERT INTO RecursosHumanos.Estados VALUES (1, 'Michoacán', 'MICH', 'A')
INSERT INTO RecursosHumanos.Estados VALUES (2, 'Jalisco', 'JAL', 'A')
INSERT INTO RecursosHumanos.Estados VALUES (3, 'Sonora', 'SON', 'A')

INSERT INTO RecursosHumanos.Ciudades VALUES (1, 'Zamora', 1, 'A')
INSERT INTO RecursosHumanos.Ciudades VALUES (2, 'Jacona', 1, 'A')
INSERT INTO RecursosHumanos.Ciudades VALUES (3, 'Guadalajara', 2, 'A')
INSERT INTO RecursosHumanos.Ciudades VALUES (4, 'Sinaloa', 3, 'A')

INSERT INTO Compras.Sucursales VALUES (1, 'AgroZam', '3512347363', 'Juárez Ote.', 'Centro', '59720', 100000, 'A', 1)
INSERT INTO Compras.Sucursales VALUES (2, 'Suc Sinaloa', '3512347363', 'Melchor Ocampo', 'Centro', '98723', 100000, 'A', 4)


select * from RecursosHumanos.Ciudades
-- =======================
-- == TABLA DE USUARIOS ==
-- =======================

INSERT INTO Usuarios.TiposUsuario
VALUES (1, 'Administrador', 'A'),
	   (2, 'Gerente', 'A'),
	   (3, 'Trabajador', 'A')
GO

select * from RecursosHumanos.Empleados

INSERT INTO RecursosHumanos.Empleados
VALUES
(1, 'Miguel', 'García', 'Alcalá', 'H', GETDATE(), '1997-05-23', 30000, '5625652624',
'Soltero', 10, 2, NULL, 'Fco. Godinez 8', 'Ejidal', '50711', 'Primaria Trunca', 99.99, 'A', 2, 3, 1, 1)

INSERT INTO Usuarios.Usuarios
VALUES ('JuanchoPerez', '1234.Hola', 'juancho.7991@gmail.com', 'A', 4, 3)
GO

update Usuarios.Usuarios set estatus = 'A' where idEmpleado = 4

select * from Usuarios.Usuarios

-- Validar si existe un usuario
CREATE PROCEDURE Usuarios.sp_existsUser
@nombre VARCHAR(30), @password VARCHAR(20)
AS
DECLARE @existe INT
	SELECT E.nombre, E.apaterno, E.amaterno, U.estatus
	FROM Usuarios.Usuarios U JOIN RecursosHumanos.Empleados E
	ON U.idEmpleado = E.idEmpleado
	WHERE U.nombre = @nombre COLLATE Modern_Spanish_CS_AS
	AND U.contrasenia = @password COLLATE Modern_Spanish_CS_AS
GO

EXEC Usuarios.sp_existsUser 'MiguelSama', 'p4$$w0rd'

-- ======================
-- == TABLA DE ESTADOS ==
-- ======================

-- Consulta general
CREATE PROCEDURE RecursosHumanos.sp_getStates
AS
	SELECT * FROM RecursosHumanos.Estados
	WHERE estatus = 'A'
GO

-- Inserción de un Estado
CREATE PROCEDURE RecursosHumanos.sp_addState
@nombre VARCHAR(60), @siglas VARCHAR(10)
AS
DECLARE @idEstado INT
BEGIN TRY
	SELECT @idEstado = MAX(idEstado) + 1 FROM RecursosHumanos.Estados
	IF @idEstado IS NULL
		SET @idEstado = 1
	INSERT INTO RecursosHumanos.Estados VALUES (@idEstado, @nombre, @siglas, 'A')
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Actualización de un Estado
CREATE PROCEDURE RecursosHumanos.sp_updateState
@idEstado INT, @nombre VARCHAR(60), @siglas VARCHAR(10), @estatus CHAR
AS
BEGIN TRY
	UPDATE RecursosHumanos.Estados
	SET nombre = @nombre, siglas = @siglas, estatus = @estatus
	WHERE idEstado = @idEstado
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Dar de baja un Estado
CREATE PROCEDURE RecursosHumanos.sp_killState
@idEstado INT
AS
BEGIN TRY
	BEGIN TRANSACTION T_killState
		UPDATE RecursosHumanos.Estados
		SET estatus = 'B'
		WHERE idEstado = @idEstado
		UPDATE RecursosHumanos.Ciudades
		SET estatus = 'B'
		WHERE idEstado = @idEstado
	COMMIT TRANSACTION T_killState
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION T_killState
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Consultar el siguiente Estado
CREATE PROCEDURE RecursosHumanos.sp_nextState
AS
DECLARE @idEstado INT
BEGIN TRY
	SELECT @idEstado = MAX(idEstado) + 1 FROM RecursosHumanos.Estados
	IF @idEstado IS NULL
		SET @idEstado = 1
	SELECT @idEstado AS siguienteEstado
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Listar estados
CREATE PROCEDURE RecursosHumanos.sp_listStates
AS
	SELECT idEstado, nombre FROM RecursosHumanos.Estados
	WHERE estatus = 'A'
	ORDER BY nombre
GO


-- ======================
-- == TABLA DE CIUDADES ==
-- ======================

-- Consulta general
CREATE PROCEDURE RecursosHumanos.sp_getCities
AS
	SELECT C.idCiudad, C.nombre, C.idEstado, E.nombre AS edo, C.estatus
	FROM RecursosHumanos.Ciudades C JOIN RecursosHumanos.Estados E
	ON C.idEstado = E.idEstado
	WHERE C.estatus = 'A'
GO

-- Listar ciudades
CREATE PROCEDURE RecursosHumanos.sp_listCities
AS
	SELECT idCiudad, nombre FROM RecursosHumanos.Ciudades
	WHERE estatus = 'A'
	ORDER BY nombre
GO

-- Inserción de una Ciudad
CREATE PROCEDURE RecursosHumanos.sp_addCity
@nombre VARCHAR(80), @idEstado INT
AS
DECLARE @idCiudad INT
BEGIN TRY
	SELECT @idCiudad = MAX(idCiudad) + 1 FROM RecursosHumanos.Ciudades
	IF @idCiudad IS NULL
		SET @idCiudad = 1
	INSERT INTO RecursosHumanos.Ciudades VALUES (@idCiudad, @nombre, @idEstado, 'A')
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Actualización de una Ciudad
CREATE PROCEDURE RecursosHumanos.sp_updateCity
@idCiudad INT, @nombre VARCHAR(80), @idEstado INT, @estatus CHAR
AS
BEGIN TRY
	UPDATE RecursosHumanos.Ciudades
	SET nombre = @nombre, idEstado = @idEstado, estatus = @estatus
	WHERE idCiudad = @idCiudad
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Dar de baja un Estado
CREATE PROCEDURE RecursosHumanos.sp_killCity
@idCiudad INT
AS
BEGIN TRY
	BEGIN TRANSACTION T_killCity
		UPDATE RecursosHumanos.Ciudades
		SET estatus = 'B'
		WHERE idCiudad = @idCiudad
		UPDATE Compras.Sucursales
		SET estatus = 'B'
		WHERE idCiudad = @idCiudad
	COMMIT TRANSACTION T_killCity
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION T_killCity
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Consultar la siguiente Ciudad
CREATE PROCEDURE RecursosHumanos.sp_nextCity
AS
DECLARE @idCiudad INT
BEGIN TRY
	SELECT @idCiudad = MAX(idCiudad) + 1 FROM RecursosHumanos.Ciudades
	IF @idCiudad IS NULL
		SET @idCiudad = 1
	SELECT @idCiudad AS siguienteCiudad
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO



-- ==========================
-- == TABLA DE DEDUCCIONES ==
-- ==========================

-- Consulta general
CREATE PROCEDURE RecursosHumanos.sp_getDeductions
AS
	SELECT * FROM RecursosHumanos.Deducciones
	WHERE estatus = 'A'
GO

-- Inserción de una Deducción
CREATE PROCEDURE RecursosHumanos.sp_addDeduction
@nombre VARCHAR(30), @descripcion VARCHAR(80), @porcentaje FLOAT
AS
DECLARE @idDeduccion INT
BEGIN TRY
	SELECT @idDeduccion = MAX(idDeduccion) + 1 FROM RecursosHumanos.Deducciones
	IF @idDeduccion IS NULL
		SET @idDeduccion = 1
	INSERT INTO RecursosHumanos.Deducciones VALUES (@idDeduccion, @nombre, @descripcion, @porcentaje, 'A')
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Consultar la siguiente deducción
CREATE PROCEDURE RecursosHumanos.sp_nextDeduction
AS
DECLARE @idDeduccion INT
BEGIN TRY
	SELECT @idDeduccion = MAX(idDeduccion) + 1 FROM RecursosHumanos.Deducciones
	IF @idDeduccion IS NULL
		SET @idDeduccion = 1
	SELECT @idDeduccion AS siguienteDeduccion
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Actualización de una Deducción
CREATE PROCEDURE RecursosHumanos.sp_updateDeduction
@idDeduccion INT, @nombre VARCHAR(30), @desc VARCHAR(80), @porc FLOAT, @estatus CHAR
AS
BEGIN TRY
	UPDATE RecursosHumanos.Deducciones
	SET nombre = @nombre, descripcion = @desc, porcentaje = @porc, estatus = @estatus
	WHERE idDeduccion = @idDeduccion
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Dar de baja una Deducción
CREATE PROCEDURE RecursosHumanos.sp_killDeduction
@idDeduccion INT
AS
BEGIN TRY
	UPDATE RecursosHumanos.Deducciones
	SET estatus = 'B'
	WHERE idDeduccion = @idDeduccion
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO


INSERT INTO RecursosHumanos.Deducciones VALUES (1, 'Prueba', 'Deducción de prueba', 35.6, 'A')
INSERT INTO RecursosHumanos.Deducciones VALUES (2, 'Prueba2', 'Deducción de prueba2', 17.0, 'B')
INSERT INTO RecursosHumanos.Deducciones VALUES (3, 'Otra prueba', 'Deducción de prueba3', 13.0, 'A')
INSERT INTO RecursosHumanos.Deducciones VALUES (4, 'La otra prueba', 'Deducción de prueba4', 32.0, 'A')
GO


-- ===========================
-- == TABLA DE PERCEPCIONES ==
-- ===========================

-- Consulta general
CREATE PROCEDURE RecursosHumanos.sp_getPerceptions
AS
	SELECT * FROM RecursosHumanos.Percepciones
	WHERE estatus = 'A'
GO

-- Inserción de una Percepción
CREATE PROCEDURE RecursosHumanos.sp_addPerception
@nombre VARCHAR(30), @descripcion VARCHAR(80), @diasPagar INT
AS
DECLARE @idPercepcion INT
BEGIN TRY
	SELECT @idPercepcion = MAX(idPercepcion) + 1 FROM RecursosHumanos.Percepciones
	IF @idPercepcion IS NULL
		SET @idPercepcion = 1
	INSERT INTO RecursosHumanos.Percepciones VALUES (@idPercepcion, @nombre, @descripcion, @diasPagar, 'A')
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Consultar la siguiente percepción
CREATE PROCEDURE RecursosHumanos.sp_nextPerception
AS
DECLARE @idPercepcion INT
BEGIN TRY
	SELECT @idPercepcion = MAX(idPercepcion) + 1 FROM RecursosHumanos.Percepciones
	IF @idPercepcion IS NULL
		SET @idPercepcion = 1
	SELECT @idPercepcion AS siguientePercepcion
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Actualización de una Deducción
CREATE PROCEDURE RecursosHumanos.sp_updatePerception
@idPercepcion INT, @nombre VARCHAR(30), @desc VARCHAR(80), @diasPagar INT, @estatus CHAR
AS
BEGIN TRY
	UPDATE RecursosHumanos.Percepciones
	SET nombre = @nombre, descripcion = @desc, diasPagar = @diasPagar, estatus = @estatus
	WHERE idPercepcion = @idPercepcion
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Dar de baja una Deducción
CREATE PROCEDURE RecursosHumanos.sp_killPerception
@idPercepcion INT
AS
BEGIN TRY
	UPDATE RecursosHumanos.Percepciones
	SET estatus = 'B'
	WHERE idPercepcion = @idPercepcion
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

SELECT * FROM RecursosHumanos.Deducciones

EXEC RecursosHumanos.sp_getCities

-- TABLA DE EMPLEADOS

-- Consulta general
CREATE PROCEDURE RecursosHumanos.sp_getEmployees
AS
BEGIN TRY
	SELECT E.idEmpleado, D.nombre AS nombreD, P.nombre AS nombreP, S.nombre AS nombreS,
	(E.nombre + ' ' + E.apaterno + ' ' + E.amaterno) AS nombreComp, (E.direccion + ', ' + E.colonia + ', ' + C.nombre) AS dir
	FROM RecursosHumanos.Empleados AS E, RecursosHumanos.Departamentos AS D,
	RecursosHumanos.Puestos AS P, RecursosHumanos.Ciudades AS C, Compras.Sucursales AS S
	WHERE E.idDepartamento = D.idDepartamento AND E.idPuesto = P.idPuesto AND
		  E.idCiudad = C.idCiudad AND E.idSucursal = S.idSucursal AND E.estatus = 'A'
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Consulta individual
CREATE PROCEDURE RecursosHumanos.sp_getEmployee
@idEmpleado INT
AS
BEGIN TRY
	SELECT E.nombre, E.apaterno, E.amaterno, E.sexo, E.fechaContratacion, E.fechaNacimiento, E.salario, E.nss,
	E.estadoCivil, E.diasVacacionales, E.diasPermiso, E.fotografia, E.direccion, E.colonia, E.codigoPostal,
	E.escolaridad, E.porcentajeComision, D.nombre AS nombreD, P.nombre AS nombreP, S.nombre AS nombreS, C.nombre AS nombreC
	FROM RecursosHumanos.Empleados AS E, RecursosHumanos.Departamentos AS D,
	RecursosHumanos.Puestos AS P, RecursosHumanos.Ciudades AS C, Compras.Sucursales AS S
	WHERE E.idDepartamento = D.idDepartamento AND E.idPuesto = P.idPuesto AND
		  E.idCiudad = C.idCiudad AND E.idSucursal = S.idSucursal AND E.estatus = 'A' AND E.idEmpleado = @idEmpleado
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

exec RecursosHumanos.sp_getEmployee 3

select * from RecursosHumanos.Empleados

-- Consultar el siguiente empleado
CREATE PROCEDURE RecursosHumanos.sp_nextEmployee
AS
DECLARE @idEmpleado INT
BEGIN TRY
	SELECT @idEmpleado = MAX(idEmpleado) + 1 FROM RecursosHumanos.Empleados
	IF @idEmpleado IS NULL
		SET @idEmpleado = 1
	SELECT @idEmpleado AS siguienteEmp
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Insertar un empleado
CREATE PROCEDURE RecursosHumanos.sp_addEmployee
@nombre VARCHAR(30), @apat VARCHAR(30), @amat VARCHAR(30), @sexo CHAR,
@fc DATE, @fn DATE, @salario FLOAT, @nss VARCHAR(10), @edoCivil VARCHAR(20),
@diasV INT, @diasP INT, @foto VARBINARY(MAX), @dir VARCHAR(80), @col VARCHAR(50),
@cp VARCHAR(5), @escolaridad VARCHAR(80), @porc FLOAT, @depto INT, @puesto INT, @ciudad INT, @suc INT 
AS
DECLARE @idEmpleado INT
BEGIN TRY
	BEGIN TRANSACTION T_addEmp
		SELECT @idEmpleado = MAX(idEmpleado) + 1 FROM RecursosHumanos.Empleados
		IF @idEmpleado IS NULL
			SET @idEmpleado = 1

		INSERT INTO RecursosHumanos.Empleados VALUES (
			@idEmpleado, @nombre, @apat, @amat, @sexo, @fc, @fn, @salario, @nss, @edoCivil, @diasV,
			@diasP, @foto, @dir, @col, @cp, @escolaridad, @porc, 'A', @depto, @puesto, @ciudad, @suc
		)
	COMMIT TRANSACTION T_addEmp
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION T_addEmp
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Insertar un empleado
CREATE PROCEDURE RecursosHumanos.sp_updateEmployee
@idEmpleado INT, @nombre VARCHAR(30), @apat VARCHAR(30), @amat VARCHAR(30), @sexo CHAR,
@fc DATE, @fn DATE, @salario FLOAT, @nss VARCHAR(10), @edoCivil VARCHAR(20),
@diasV INT, @diasP INT, @foto VARBINARY(MAX), @dir VARCHAR(80), @col VARCHAR(50),
@cp VARCHAR(5), @escolaridad VARCHAR(80), @porc FLOAT, @depto INT, @puesto INT, @ciudad INT, @suc INT 
AS
BEGIN TRY
	UPDATE RecursosHumanos.Empleados SET nombre = @nombre, apaterno = @apat, amaterno = @amat, sexo = @sexo, fechaNacimiento = @fn, fechaContratacion = @fc,
		salario = @salario, nss = @nss, estadoCivil = @edoCivil, diasVacacionales = @diasV, diasPermiso = @diasP,
		fotografia = @foto, direccion = @dir, colonia = @col, codigoPostal = @cp, escolaridad = @escolaridad,
		porcentajeComision = @porc, idDepartamento = @depto, idPuesto = @puesto, idCiudad = @ciudad, idSucursal = @suc
	WHERE idEmpleado = @idEmpleado
END TRY
BEGIN CATCH
	IF @@ERROR > 0
		PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Eliminar un empleado
CREATE PROCEDURE RecursosHumanos.sp_killEmployee
@idEmpleado INT 
AS
BEGIN TRY
	UPDATE RecursosHumanos.Empleados SET estatus = 'B'
	WHERE idEmpleado = @idEmpleado
END TRY
BEGIN CATCH
	IF @@ERROR > 0
		PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Listar emplear
CREATE PROCEDURE RecursosHumanos.sp_listEmployees
AS
BEGIN TRY
	SELECT idEmpleado,
	('E' + CONVERT(VARCHAR(100), idEmpleado) + ' - ' + apaterno + ' ' + amaterno + ' ' + nombre) AS nombreComp
	FROM RecursosHumanos.Empleados
	WHERE estatus = 'A'
	ORDER BY nombreComp
END TRY
BEGIN CATCH
	IF @@ERROR > 0
		PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO


-- DEPARTAMENTOS
CREATE PROCEDURE RecursosHumanos.sp_listDep
AS
	SELECT idDepartamento, nombre FROM RecursosHumanos.Departamentos
	WHERE estatus = 'A'
	ORDER BY nombre
GO

-- PUESTOS
CREATE PROCEDURE RecursosHumanos.sp_listPos
AS
	SELECT idPuesto, nombre FROM RecursosHumanos.Puestos
	WHERE estatus = 'A'
	ORDER BY nombre
GO

-- SUCURSALES
CREATE PROCEDURE RecursosHumanos.sp_listSuc
AS
	SELECT idSucursal, nombre FROM Compras.Sucursales
	WHERE estatus = 'A'
	ORDER BY nombre
GO

-- HORARIOS

-- Insertar un horario
CREATE PROCEDURE RecursosHumanos.sp_addSchedule
@horaInicio VARCHAR(5), @horaFin VARCHAR(5), @dias VARCHAR(30), @emp INT
AS
BEGIN TRY
DECLARE @idHorario INT
	SELECT @idHorario = MAX(idHorario) + 1 FROM RecursosHumanos.Horarios
		IF @idHorario IS NULL
			SET @idHorario = 1

	INSERT INTO RecursosHumanos.Horarios
	VALUES (@idHorario, @horaInicio, @horaFin, @dias, @emp)
END TRY
BEGIN CATCH
	IF @@ERROR > 0
		PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Actualizar un horario
CREATE PROCEDURE RecursosHumanos.sp_updateSchedule
@idHr INT, @horaInicio VARCHAR(5), @horaFin VARCHAR(5), @dias VARCHAR(30), @emp INT
AS
BEGIN TRY
	UPDATE RecursosHumanos.Horarios
	SET horaInicio = @horaInicio, horaFin = @horaFin, dias = @dias, idEmpleado = @emp
	WHERE idHorario = @idHr
END TRY
BEGIN CATCH
	IF @@ERROR > 0
		PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

select * from RecursosHumanos.Horarios

-- Consulta general
CREATE PROCEDURE RecursosHumanos.sp_getSchedules
AS
BEGIN TRY
	SELECT H.idHorario, (E.nombre + ' ' + E.apaterno + ' ' + E.amaterno) AS nombreComp,
	CONVERT(VARCHAR(5), H.horaInicio, 108) AS hi, CONVERT(VARCHAR(5), H.horaFin, 108) AS hf, H.dias
	FROM RecursosHumanos.Empleados AS E, RecursosHumanos.Horarios as H
	WHERE E.idEmpleado = H.idEmpleado AND E.estatus = 'A'
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Consulta por empleado
CREATE PROCEDURE RecursosHumanos.sp_getSchedulesEmp
@idEmp INT, @idH INT
AS
BEGIN TRY
	SELECT idHorario, CONVERT(VARCHAR(5), horaInicio, 108) AS hi, CONVERT(VARCHAR(5), horaFin, 108) AS hf, dias
	FROM RecursosHumanos.Horarios
	WHERE idEmpleado = @idEmp AND idHorario <> @idH
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

EXEC RecursosHumanos.sp_getSchedulesEmp 1

select * from RecursosHumanos.Empleados

-- Consulta individual
CREATE PROCEDURE RecursosHumanos.sp_getSchedule
@idSch INT
AS
BEGIN TRY
	SELECT CONVERT(VARCHAR(5), H.horaInicio, 108) AS hi, CONVERT(VARCHAR(5), H.horaFin, 108) AS hf,
	H.dias, ('E' + CONVERT(VARCHAR(100), E.idEmpleado) + ' - ' + E.apaterno + ' ' + E.amaterno + ' ' + E.nombre) AS nombreComp,
	E.idEmpleado as idEm
	FROM RecursosHumanos.Empleados AS E, RecursosHumanos.Horarios as H
	WHERE E.idEmpleado = H.idEmpleado AND H.idHorario = @idSch
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

exec RecursosHumanos.sp_getSchedule 1

-- Consultar el siguiente horarios
CREATE PROCEDURE RecursosHumanos.sp_nextSchedule
AS
DECLARE @idSch INT
BEGIN TRY
	SELECT @idSch = MAX(idHorario) + 1 FROM RecursosHumanos.Horarios
	IF @idSch IS NULL
		SET @idSch = 1
	SELECT @idSch AS sigHorario
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Consultar los horarios de un empleado
CREATE PROCEDURE RecursosHumanos.sp_empSchedules
@emp INT
AS
BEGIN TRY
	SELECT dias FROM RecursosHumanos.Horarios
	WHERE idEmpleado = @emp
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Eliminar un horario de un empleado
CREATE PROCEDURE RecursosHumanos.sp_killSchedule
@hr INT
AS
BEGIN TRY
	DELETE FROM RecursosHumanos.Horarios
	WHERE idHorario = @hr
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Consultar puestos
CREATE PROCEDURE RecursosHumanos.sp_getPuestos
AS
BEGIN TRY
	SELECT idPuesto, nombre, salarioMinimo, salarioMaximo
	from RecursosHumanos.Puestos
	where estatus = 'A'
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Consultar puesto
CREATE PROCEDURE RecursosHumanos.sp_getPuesto
@idPuesto INT
AS
BEGIN TRY
	SELECT nombre, salarioMinimo, salarioMaximo from RecursosHumanos.Puestos
	where idPuesto = @idPuesto
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Actualizar puesto
CREATE PROCEDURE RecursosHumanos.sp_updatePuesto
@idPuesto INT, @nombre VARCHAR(60), @min FLOAT, @max FLOAT
AS
BEGIN TRY
	UPDATE RecursosHumanos.Puestos SET nombre = @nombre, salarioMinimo = @min, salarioMaximo = @max
	where idPuesto = @idPuesto
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Eliminar puesto
CREATE PROCEDURE RecursosHumanos.sp_deletePuestos
@idP INT
AS
BEGIN TRY
	UPDATE RecursosHumanos.Puestos SET estatus = 'B'
	WHERE idPuesto = @idP
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- COnsultar puesto por nombre
CREATE PROCEDURE RecursosHumanos.sp_getPuestoN
@nombre VARCHAR(60)
AS
BEGIN TRY
	SELECT * FROM RecursosHumanos.Puestos
	WHERE nombre LIKE '%' + CONVERT(VARCHAR(60), @nombre) +'%'
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO


-- COnsultar deptos.
CREATE PROCEDURE RecursosHumanos.sp_getDeptos
AS
BEGIN TRY
	SELECT idDepartamento, nombre FROM RecursosHumanos.Departamentos
	WHERE estatus = 'A'
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

CREATE PROCEDURE RecursosHumanos.sp_existsDepto
@nombre VARCHAR(50)
AS
BEGIN TRY
	SELECT * FROM RecursosHumanos.Departamentos
	WHERE nombre = @nombre
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- siguiente depto
create proc RecursosHumanos.sp_nextDepto
as
declare @idD int
begin try
	SELECT @idD = MAX(idDepartamento) + 1 FROM RecursosHumanos.Departamentos
	IF @idD IS NULL
		SET @idD = 1
	SELECT @idD AS sigDepto
end try
begin catch
	if @@ERROR > 0
		print 'Error:'+error_message()
end catch
go

-- Agregar depto
create proc RecursosHumanos.sp_addDep
@nombre VARCHAR(50)
as
declare @idD int
begin try
	SELECT @idD = MAX(idDepartamento) + 1 FROM RecursosHumanos.Departamentos
	IF @idD IS NULL
		SET @idD = 1
	
	INSERT INTO RecursosHumanos.Departamentos VALUES (@idD, @nombre, 'A')
end try
begin catch
	if @@ERROR > 0
		print 'Error:'+error_message()
end catch
go


-- Consultar depto
create proc RecursosHumanos.sp_getDep
@idD INT
as
begin try
	SELECT nombre from RecursosHumanos.Departamentos
	where idDepartamento = @idD
end try
begin catch
	if @@ERROR > 0
		print 'Error:'+error_message()
end catch
go

-- Actualizar depto
create proc RecursosHumanos.sp_updateDep
@idD INT, @nombre VARCHAR(50)
as
begin try
	UPDATE RecursosHumanos.Departamentos SET nombre = @nombre
	where idDepartamento = @idD
end try
begin catch
	if @@ERROR > 0
		print 'Error:'+error_message()
end catch
go

-- Eliminar depto
CREATE PROCEDURE RecursosHumanos.sp_killDep
@idD INT
AS
BEGIN TRY
	UPDATE RecursosHumanos.Departamentos
	SET estatus = 'B'
	WHERE idDepartamento = @idD
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

-- Consultar depto por nombre
CREATE PROCEDURE RecursosHumanos.sp_getDeptN
@nombre VARCHAR(50)
AS
BEGIN TRY
	SELECT * FROM RecursosHumanos.Departamentos
	WHERE nombre LIKE '%' + @nombre + '%'
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO

exec RecursosHumanos.sp_getDeptN ''