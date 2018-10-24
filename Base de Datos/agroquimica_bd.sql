-- #################################
-- ##  BASE DE DATOS AGROQUÍMICA  ##
-- #################################

CREATE DATABASE AGROQUIMICA_ERP
GO

USE AGROQUIMICA_ERP
GO

--=====================
-- ESQUEMAS DE LA BD --
--=====================

CREATE SCHEMA Compras AUTHORIZATION dbo
GO

CREATE SCHEMA RecursosHumanos AUTHORIZATION dbo
GO

CREATE SCHEMA Ventas AUTHORIZATION dbo
GO

CREATE SCHEMA Usuarios AUTHORIZATION dbo
GO


--======================
-- ESQUEMA DE COMPRAS --
--======================

CREATE TABLE Compras.Laboratorios
(
	idLaboratorio	INT 		NOT NULL,
	nombre			VARCHAR(50) NOT NULL,
	origen			VARCHAR(30) NOT NULL,
	estatus			CHAR 		NOT NULL,

	CONSTRAINT Marcas_PK PRIMARY KEY (idLaboratorio)
)
GO

CREATE TABLE Compras.Categorias
(
	idCategoria		INT 		NOT NULL,
	nombre			VARCHAR(30) NOT NULL,
	estatus			CHAR 		NOT NULL,

	CONSTRAINT Categorias_PK PRIMARY KEY (idCategoria)
)
GO

CREATE TABLE Compras.Productos
(
	idProducto			INT 			NOT NULL,
	nombre				VARCHAR(50) 	NOT NULL,
	descripcion			VARCHAR(100) 	NOT NULL,
	puntoReorden		INT 			NOT NULL,
	precioCompra		FLOAT			NOT NULL,
	precioVenta			FLOAT			NOT NULL,
	ingredienteActivo	VARCHAR(100) 	NOT NULL,
	bandaToxicologica	VARCHAR(80) 	NOT NULL,
	aplicacion			VARCHAR(200) 	NOT NULL,
	uso					VARCHAR(200) 	NOT NULL,
	estatus				CHAR 			NOT NULL,
	idLaboratorio		INT 			NOT NULL,
	idCategoria			INT 			NOT NULL,

	CONSTRAINT Productos_PK PRIMARY KEY (idProducto)
)
GO

CREATE TABLE Compras.UnidadMedida
(
	idUnidad	INT 		NOT NULL,
	nombre		VARCHAR(80) NOT NULL,
	siglas		VARCHAR(20) NOT NULL,
	estatus		CHAR 		NOT NULL,

	CONSTRAINT UnidadMedida_PK PRIMARY KEY (idUnidad)
)
GO

CREATE TABLE Compras.Empaques
(
	idEmpaque	INT 		NOT NULL,
	nombre		VARCHAR(80) NOT NULL,
	capacidad	FLOAT		NOT NULL,
	estatus		CHAR 		NOT NULL,
	idUnidad	INT 		NOT NULL,

	CONSTRAINT Presentaciones_PK PRIMARY KEY (idEmpaque)
)
GO

CREATE TABLE Compras.PresentacionesProducto
(
	idPresentacion	INT 	NOT NULL,
	precioCompra	FLOAT	NOT NULL,
	precioVenta		FLOAT	NOT NULL,
	puntoReorden	FLOAT 	NOT NULL,
	idProducto		INT 	NOT NULL,
	idEmpaque		INT 	NOT NULL,

	CONSTRAINT PresentacionesProducto_PK PRIMARY KEY (idPresentacion)
)
GO

CREATE TABLE Compras.Sucursales
(
	idSucursal		INT 		NOT NULL,
	nombre			VARCHAR(50) NOT NULL,
	telefono		VARCHAR(15) NOT NULL,
	direccion		VARCHAR(80) NOT NULL,
	colonia			VARCHAR(50) NOT NULL,
	codigoPostal	VARCHAR(5)	NOT NULL,
	presupuesto		FLOAT		NOT NULL,
	estatus			CHAR 		NOT NULL,
	idCiudad		INT 		NOT NULL,

	CONSTRAINT Sucursales_PK PRIMARY KEY (idSucursal)
)
GO

CREATE TABLE Compras.ExistenciasSucursal
(
	idPresentacion		INT 	NOT NULL,
	idSucursal			INT 	NOT NULL,
	cantidad			FLOAT	NOT NULL,

	CONSTRAINT ExistenciasSucursal_PK PRIMARY KEY (idPresentacion, idSucursal)
)
GO

CREATE TABLE Compras.ImagenesProducto
(
	idImagen		INT 				NOT NULL,
	nombreImagen	VARCHAR(100)		NOT NULL,
	imagen			VARBINARY(MAX)		NOT NULL,
	principal		CHAR 				NOT NULL,
	idProducto		INT 				NOT NULL,

	CONSTRAINT ImagenesProducto_PK PRIMARY KEY (idImagen)
)
GO

CREATE TABLE Compras.ProductosProveedor
(
	idProveedor			INT 	NOT NULL,
	idPresentacion		INT 	NOT NULL,
	diasRetardo			INT 	NOT NULL,
	precioEstandar		FLOAT	NOT NULL,
	precioUltimaCompra	FLOAT	NOT NULL,
	cantMinPedir		INT 	NOT NULL,
	cantMaxPedir		INT 	NOT NULL,

	CONSTRAINT ProductosProveedor_PK PRIMARY KEY (idProveedor, idPresentacion)
)
GO

CREATE TABLE Compras.PedidoDetalle
(
	idPedidoDetalle		INT 	NOT NULL,
	cantPedida			INT 	NOT NULL,
	precioCompra		FLOAT	NOT NULL,
	subtotal			FLOAT	NOT NULL,
	cantRecibida		INT 	NOT NULL,
	cantRechazada		INT 	NOT NULL,
	cantAceptada		FLOAT	NOT NULL,
	idPedido			INT 	NOT NULL,
	idPresentacion		INT 	NOT NULL,

	CONSTRAINT PedidoDetalle_PK PRIMARY KEY (idPedidoDetalle)
)
GO

CREATE TABLE Compras.Proveedores
(
	idProveedor		INT 		 NOT NULL,
	nombre			VARCHAR(80)  NOT NULL,
	telefono		CHAR(12) 	 NOT NULL,
	email			VARCHAR(100) NOT NULL,
	direccion		VARCHAR(80)  NOT NULL,
	colonia			VARCHAR(50)  NOT NULL,
	codigoPostal	VARCHAR(5)	 NOT NULL,
	idCiudad		INT 		 NOT NULL,

	CONSTRAINT Proveedores_PK PRIMARY KEY (idProveedor)
)
GO

CREATE TABLE Compras.ContactosProveedor
(
	idContacto		INT 		 NOT NULL,
	nombre			VARCHAR(80)	 NOT NULL,
	telefono		CHAR(12)	 NOT NULL,
	email			VARCHAR(100) NOT NULL,
	idProveedor		INT 		 NOT NULL,

	CONSTRAINT ContactosProveedor_PK PRIMARY KEY (idContacto)
)
GO

CREATE TABLE Compras.CuentasProveedor
(
	idCuentaProveedor	INT 		NOT NULL,
	idProveedor			INT 		NOT NULL,
	noCuenta			VARCHAR(10) NOT NULL,
	banco				VARCHAR(30) NOT NULL,

	CONSTRAINT CuentasProveedor_PK PRIMARY KEY (idCuentaProveedor)
)
GO

CREATE TABLE Compras.Pedidos
(
	idPedido		INT 	NOT NULL,
	fechaRegistro	DATE 	NOT NULL,
	fechaRecepcion	DATE 	NOT NULL,
	totalPagar		FLOAT	NOT NULL,
	cantidadPagada	FLOAT	NOT NULL,
	estatus			CHAR 	NOT NULL,
	idProveedor		INT 	NOT NULL,
	idSucursal		INT 	NOT NULL,
	idEmpleado		INT 	NOT NULL,

	CONSTRAINT Pedidos_PK PRIMARY KEY (idPedido)
)
GO

CREATE TABLE Compras.Pagos
(
	idPago				INT 	NOT NULL,
	fecha				DATE 	NOT NULL,
	importe				FLOAT	NOT NULL,
	idPedido			INT 	NOT NULL,
	idFormaPago			INT 	NOT NULL,
	idCuentaProveedor	INT 	NOT NULL,

	CONSTRAINT Pagos_PK PRIMARY KEY (idPago)
)
GO





--===============================
-- ESQUEMA DE RECURSOS_HUMANOS --
--===============================

CREATE TABLE RecursosHumanos.Estados
(
	idEstado	INT 		NOT NULL,
	nombre		VARCHAR(60) NOT NULL,
	siglas		VARCHAR(10) NOT NULL,
	estatus		CHAR 		NOT NULL,

	CONSTRAINT Estado_PK PRIMARY KEY (idEstado)
)
GO

CREATE TABLE RecursosHumanos.Ciudades
(
	idCiudad	INT 		NOT NULL,
	nombre		VARCHAR(80) NOT NULL,
	idEstado	INT 		NOT NULL,
	estatus		CHAR 		NOT NULL,

	CONSTRAINT Ciudades_PK PRIMARY KEY (idCiudad)
)
GO

CREATE TABLE RecursosHumanos.Departamentos
(
	idDepartamento		INT 		NOT NULL,
	nombre				VARCHAR(50) NOT NULL,
	estatus				CHAR		NOT NULL,

	CONSTRAINT Departamentos_PK PRIMARY KEY (idDepartamento)
)
GO

CREATE TABLE RecursosHumanos.FormasPago
(
	idFormaPago	INT 		NOT NULL,
	nombre		VARCHAR(50) NOT NULL,
	estatus		CHAR 		NOT NULL,

	CONSTRAINT FormasPago_PK PRIMARY KEY (idFormaPago)
)
GO

CREATE TABLE RecursosHumanos.Puestos
(
	idPuesto		INT 		NOT NULL,
	nombre			VARCHAR(60) NOT NULL,
	salarioMinimo	FLOAT 		NOT NULL,
	salarioMaximo	FLOAT 		NOT NULL,
	estatus			CHAR 		NOT NULL,

	CONSTRAINT Puestos_PK PRIMARY KEY (idPuesto)
)
GO

CREATE TABLE RecursosHumanos.Empleados
(
	idEmpleado			INT 				NOT NULL,
	nombre				VARCHAR(30)			NOT NULL,
	apaterno			VARCHAR(30)			NOT NULL,
	amaterno			VARCHAR(30)			NOT NULL,
	sexo				CHAR 				NOT NULL,
	fechaContratacion	DATE 				NOT NULL,
	fechaNacimiento		DATE 				NOT NULL,
	salario				FLOAT				NOT NULL,
	nss					VARCHAR(10)			NOT NULL,
	estadoCivil			VARCHAR(20)			NOT NULL,
	diasVacacionales	INT 				NOT NULL,
	diasPermiso			INT 				NOT NULL,
	fotografia			VARBINARY(MAX)		NULL,
	direccion			VARCHAR(80)			NOT NULL,
	colonia				VARCHAR(50)			NOT NULL,
	codigoPostal		VARCHAR(5)			NOT NULL,
	escolaridad			VARCHAR(80)			NOT NULL,
	porcentajeComision	FLOAT				NOT NULL,
	estatus				CHAR				NOT NULL,
	idDepartamento		INT 				NOT NULL,
	idPuesto			INT 				NOT NULL,
	idCiudad			INT 				NOT NULL,
	idSucursal			INT 				NOT NULL,

	CONSTRAINT Empleados_PK PRIMARY KEY (idEmpleado)
)
GO

CREATE TABLE RecursosHumanos.Incapacidades
(
	idIncapacidad	INT 				NOT NULL,
	fechaInicio		DATE 				NOT NULL,
	fechaFin		DATE 				NOT NULL,
	enfermedad		VARCHAR(150)		NOT NULL,
	evidencia		VARBINARY(MAX)		NOT NULL,
	idEmpleado		INT 				NOT NULL,

	CONSTRAINT Incapacidades_PK PRIMARY KEY (idIncapacidad)
)
GO

CREATE TABLE RecursosHumanos.AusenciasJustificadas
(
	idAusencia		INT 	NOT NULL,
	fechaSolicitud	DATE 	NOT NULL,
	fechaInicio		DATE 	NOT NULL,
	fechaFin		DATE 	NOT NULL,
	tipo			CHAR	NOT NULL,
	idEmpleadoS		INT 	NOT NULL,
	idEmpleadoA		INT 	NOT NULL,

	CONSTRAINT AusenciasJustificadas_PK PRIMARY KEY (idAusencia)
)
GO

CREATE TABLE RecursosHumanos.Horarios
(
	idHorario	INT 		NOT NULL,
	horaInicio	TIME 		NOT NULL,
	horaFin		TIME 		NOT NULL,
	dias		VARCHAR(30) NOT NULL,
	idEmpleado	INT 		NOT NULL,

	CONSTRAINT Horarios_PK PRIMARY KEY (idHorario)
)
GO

CREATE TABLE RecursosHumanos.DocumentacionEmpleado
(
	idDocumento		INT 				NOT NULL,
	nombreDocumento	VARCHAR(80)			NOT NULL,
	fechaEntrega	DATE 				NOT NULL,
	documento		VARBINARY(MAX)		NOT NULL,
	idEmpleado		INT 				NOT NULL,

	CONSTRAINT DocumentacionEmpleado_PK PRIMARY KEY (idDocumento)
)
GO

CREATE TABLE RecursosHumanos.HistorialPuestos
(
	idEmpleado		INT 	NOT NULL,
	idPuesto		INT 	NOT NULL,
	idDepartamento	INT 	NOT NULL,
	fechaInicio		DATE 	NOT NULL,
	fechaFin		DATE 	NOT NULL,
	salario			FLOAT	NOT NULL,

	CONSTRAINT HistorialPuestos_PK
	PRIMARY KEY (idEmpleado, idPuesto, idDepartamento, fechaInicio)
)
GO

CREATE TABLE RecursosHumanos.Percepciones
(
	idPercepcion	INT 		NOT NULL,
	nombre			VARCHAR(30) NOT NULL,
	descripcion		VARCHAR(80) NOT NULL,
	diasPagar		INT 		NOT NULL,
	estatus			CHAR		NOT NULL

	CONSTRAINT Percepciones_PK PRIMARY KEY (idPercepcion)
)
GO

CREATE TABLE RecursosHumanos.Deducciones
(
	idDeduccion		INT 		NOT NULL,
	nombre			VARCHAR(30) NOT NULL,
	descripcion		VARCHAR(80) NOT NULL,
	porcentaje		FLOAT 		NOT NULL,
	estatus			CHAR		NOT NULL

	CONSTRAINT Deducciones_PK PRIMARY KEY (idDeduccion)
)
GO

CREATE TABLE RecursosHumanos.Nominas
(
	idNomina		INT 	NOT NULL,
	fechaPago		DATE 	NOT NULL,
	totalIP			FLOAT	NOT NULL,
	totalID			FLOAT	NOT NULL,
	cantidadNeta	FLOAT	NOT NULL,
	diasTrabajados	INT 	NOT NULL,
	faltas			INT 	NOT NULL,
	fechaInicio		DATE 	NOT NULL,
	fechaFin		DATE 	NOT NULL,
	idEmpleado		INT 	NOT NULL,
	idFormaPago		INT 	NOT NULL,

	CONSTRAINT Nominas_PK PRIMARY KEY (idNomina)
)
GO

CREATE TABLE RecursosHumanos.NominasPercepciones
(
	idNomina		INT 	NOT NULL,
	idPercepcion	INT 	NOT NULL,
	importe			FLOAT	NOT NULL,

	CONSTRAINT NominasPercepciones_PK PRIMARY KEY (idNomina, idPercepcion)
)
GO

CREATE TABLE RecursosHumanos.NominasDeducciones
(
	idNomina		INT 	NOT NULL,
	idDeduccion		INT 	NOT NULL,
	importe			FLOAT	NOT NULL,

	CONSTRAINT NominasDeducciones_PK PRIMARY KEY (idNomina, idDeduccion)
)
GO





--======================
-- ESQUEMA DE USUARIO --
--======================

CREATE TABLE Usuarios.TiposUsuario
(
	idTipoUsuario	INT 		NOT NULL,
	nombre			VARCHAR(80) NOT NULL,
	estatus			CHAR		NOT NULL,

	CONSTRAINT TiposUsuario_PK PRIMARY KEY (idTipoUsuario)
)
GO

-- ************************************
-- ** NOTA: SE AGREGÓ EL CAMPO email **
-- ************************************

CREATE TABLE Usuarios.Usuarios
(
	nombre			VARCHAR(30) NOT NULL,
	contrasenia		VARCHAR(20) NOT NULL,
	email			VARCHAR(80) NOT NULL,
	estatus			CHAR		NOT NULL,
	idEmpleado		INT 		NOT NULL,
	idTipoUsuario	INT 		NOT NULL,

	CONSTRAINT Usuarios_PK PRIMARY KEY (nombre)
)
GO





--=====================
-- ESQUEMA DE VENTAS --
--=====================

CREATE TABLE Ventas.Ofertas
(
	idOferta		INT 		 NOT NULL,
	nombre			VARCHAR(50)  NOT NULL,
	descripcion		VARCHAR(100) NOT NULL,
	porDescuento	FLOAT		 NOT NULL,
	fechaInicio		DATE 		 NOT NULL,
	fechaFin		DATE 		 NOT NULL,
	cantMinProducto	INT 		 NOT NULL,
	estatus			CHAR 		 NOT NULL,
	idProducto		INT 		 NOT NULL,

	CONSTRAINT Ofertas_PK PRIMARY KEY (idOferta)
)
GO

CREATE TABLE Ventas.Asociaciones
(
	idAsociacion	INT  		 NOT NULL,
	nombre			VARCHAR(100) NOT NULL,
	estatus			CHAR 		 NOT NULL,

	CONSTRAINT Asociaciones_PK PRIMARY KEY (idAsociacion)
)
GO

CREATE TABLE Ventas.OfertasAsociacion
(
	idAsociacion	INT  NOT NULL,
	idOferta		INT  NOT NULL,
	estatus			CHAR NOT NULL,

	CONSTRAINT OfertasAsociacion_PK PRIMARY KEY (idAsociacion, idOferta)
)
GO

CREATE TABLE Ventas.Cultivos
(
	idCultivo		INT  		 NOT NULL,
	nombre			VARCHAR(100) NOT NULL,
	costoAsesoria	FLOAT  		 NOT NULL,
	estatus			CHAR 		 NOT NULL,

	CONSTRAINT Cultivos_PK PRIMARY KEY (idCultivo)
)
GO

CREATE TABLE Ventas.VentasDetalle
(
	idVentaDetalle	INT  	NOT NULL,
	precioVenta		FLOAT  	NOT NULL,
	cantidad		FLOAT  	NOT NULL,
	subtotal		FLOAT  	NOT NULL,
	idVenta			INT 	NOT NULL,
	idPresentacion	INT 	NOT NULL,

	CONSTRAINT VentasDetalle_PK PRIMARY KEY (idVentaDetalle)
)
GO

CREATE TABLE Ventas.Clientes
(
	idCliente		INT 			NOT NULL,
	nombre			VARCHAR(100) 	NOT NULL,
	razonSocial		VARCHAR(100) 	NOT NULL,
	limiteCredito	FLOAT			NOT NULL,
	direccion		VARCHAR(80) 	NOT NULL,
	codigoPostal	CHAR(5)			NOT NULL,
	rfc				CHAR(13)		NOT NULL,
	telefono		CHAR(12)		NOT NULL,
	email			VARCHAR(100)	NOT NULL,
	tipo			CHAR 			NOT NULL,
	idCiudad		INT 			NOT NULL,

	CONSTRAINT Clientes_PK PRIMARY KEY (idCliente)
)
GO

CREATE TABLE Ventas.Miembros
(
	idCliente			INT  	NOT NULL,
	idAsociacion		INT  	NOT NULL,
	estatus				CHAR	NOT NULL,
	fechaIncorporacion	DATE 	NOT NULL,

	CONSTRAINT Miembros_PK PRIMARY KEY (idAsociacion, idCliente)
)
GO

CREATE TABLE Ventas.ClientesCultivos
(
	idClienteCultivo	INT 		 NOT NULL,
	extension			FLOAT 		 NOT NULL,
	ubicacion			VARCHAR(100) NOT NULL,
	idCliente			INT			 NOT NULL,
	idCultivo			INT 		 NOT NULL,
	idCiudad			INT 		 NOT NULL,

	CONSTRAINT ClientesCultivos_PK PRIMARY KEY (idClienteCultivo)
)
GO

CREATE TABLE Ventas.Ventas
(
	idVenta			INT 			NOT NULL,
	fecha			DATE 			NOT NULL,
	totalPagar		FLOAT		 	NOT NULL,
	cantPagada		FLOAT			NOT NULL,
	comentarios		VARCHAR(100) 	NOT NULL,
	estatus			CHAR			NOT NULL,
	tipo			CHAR			NOT NULL,
	idCliente		INT				NOT NULL,
	idSucursal		INT				NOT NULL,
	idEmpleado		INT 			NOT NULL,

	CONSTRAINT Ventas_PK PRIMARY KEY (idVenta)
)
GO

CREATE TABLE Ventas.Facturas
(
	Folio			INT 			NOT NULL,
	subtotal		FLOAT 			NOT NULL,
	iva				FLOAT		 	NOT NULL,
	total			FLOAT			NOT NULL,
	nombreDocXML	VARCHAR(100) 	NOT NULL,
	documentoXML	VARBINARY(MAX)	NOT NULL,
	nombreDocPDF	VARCHAR(100)	NOT NULL,
	documentoPDF	VARBINARY(MAX)	NOT NULL,
	idVenta			INT				NOT NULL,

	CONSTRAINT Facturas_PK PRIMARY KEY (Folio)
)
GO

CREATE TABLE Ventas.Cobros
(
	idCobro		INT  	NOT NULL,
	fecha		DATE  	NOT NULL,
	importe		FLOAT  	NOT NULL,
	idVenta		INT  	NOT NULL,
	idFormaPago	INT 	NOT NULL,

	CONSTRAINT Pagos_PK PRIMARY KEY (idCobro)
)
GO

CREATE TABLE Ventas.UnidadesTransporte
(
	idUnidadTransporte	INT  		NOT NULL,
	placas				VARCHAR(10) NOT NULL,
	marca				VARCHAR(80) NOT NULL,
	modelo				VARCHAR(80) NOT NULL,
	anio				INT  		NOT NULL,
	capacidad			INT  		NOT NULL,

	CONSTRAINT UnidadesTransporte_PK PRIMARY KEY (idUnidadTransporte)
)
GO

CREATE TABLE Ventas.Visitas
(
	idVisita			INT 			NOT NULL,
	fechaPlaneada		DATE 			NOT NULL,
	fechaReal			DATE		 	NOT NULL,
	comentarios			VARCHAR(200) 	NOT NULL,
	estatus				CHAR			NOT NULL,
	costo				FLOAT			NOT NULL,
	idClienteCultivo	INT				NOT NULL,
	idEmpleado			INT				NOT NULL,
	idUnidadTransporte	INT				NOT NULL,

	CONSTRAINT Visitas_PK PRIMARY KEY (idVisita)
)
GO

CREATE TABLE Ventas.Matenimientos
(
	idMantenimiento		INT  		 NOT NULL,
	fecha				DATE 		 NOT NULL,
	taller				VARCHAR(100) NOT NULL,
	costo				FLOAT 		 NOT NULL,
	comentarios			VARCHAR(200) NOT NULL,
	tipo				VARCHAR(30)	 NOT NULL,
	idUnidadTransporte	INT  		 NOT NULL,

	CONSTRAINT Matenimientos_PK PRIMARY KEY (idMantenimiento)
)
GO

CREATE TABLE Ventas.Envios
(
	idEnvio					INT  		 NOT NULL,
	fechaEntregaPlaneada	DATE 		 NOT NULL,
	fechaEntregaReal		DATE 		 NOT NULL,
	direccion				VARCHAR(100) NOT NULL,
	codigoPostal			VARCHAR(5) 	 NOT NULL,
	idVenta					INT  		 NOT NULL,
	idUnidadTransporte		INT  		 NOT NULL,
	idCiudad				INT  		 NOT NULL,

	CONSTRAINT EnviosVentas_PK PRIMARY KEY (idEnvio)
)
GO

CREATE TABLE Ventas.Tripulacion
(
	idEmpleado	INT  		NOT NULL,
	idEnvio		INT  		NOT NULL,
	rol			VARCHAR(50) NOT NULL,

	CONSTRAINT Tripulacion_PK PRIMARY KEY (rol, idEmpleado, idEnvio)
)
GO





--#####################
--## CLAVES FORÁNEAS ##
--#####################


--======================
-- ESQUEMA DE COMPRAS --
--======================

-- PRODUCTOS
ALTER TABLE Compras.Productos ADD CONSTRAINT Productos_Laboratorio_FK
FOREIGN KEY (idLaboratorio)
REFERENCES Compras.Laboratorios(idLaboratorio)
GO

ALTER TABLE Compras.Productos ADD CONSTRAINT Productos_Categoria_FK
FOREIGN KEY (idCategoria)
REFERENCES Compras.Categorias(idCategoria)
GO

-- EMPAQUES
ALTER TABLE Compras.Empaques ADD CONSTRAINT Presentaciones_UnidadMedida_FK
FOREIGN KEY (idUnidad)
REFERENCES Compras.UnidadMedida(idUnidad)
GO

-- PRESENTACIONES
ALTER TABLE Compras.PresentacionesProducto ADD CONSTRAINT Producto_PresentacionProducto_FK
FOREIGN KEY (idProducto)
REFERENCES Compras.Productos(idProducto)
GO

ALTER TABLE Compras.PresentacionesProducto ADD CONSTRAINT Empaques_PresentacionProducto_FK
FOREIGN KEY (idEmpaque)
REFERENCES Compras.Empaques(idEmpaque)
GO

-- SUCURSALES
ALTER TABLE Compras.Sucursales ADD CONSTRAINT Ciudades_Sucursales_FK
FOREIGN KEY (idCiudad)
REFERENCES RecursosHumanos.Ciudades(idCiudad)
GO

-- EXISTENCIAS_SUCURSAL
ALTER TABLE Compras.ExistenciasSucursal ADD CONSTRAINT PresentacionesProductos_ExistenciaSucursal_FK
FOREIGN KEY (idPresentacion)
REFERENCES Compras.PresentacionesProducto(idPresentacion)
GO

ALTER TABLE Compras.ExistenciasSucursal ADD CONSTRAINT Sucursales_ExistenciasSucursal_FK
FOREIGN KEY (idSucursal)
REFERENCES Compras.Sucursales(idSucursal)
GO

-- IMAGENES_PRODUCTO
ALTER TABLE Compras.ImagenesProducto ADD CONSTRAINT Productos_ImagenesProducto_FK
FOREIGN KEY (idProducto)
REFERENCES Compras.Productos(idProducto)
GO

-- PRODUCTOS_PROVEEDOR
ALTER TABLE Compras.ProductosProveedor ADD CONSTRAINT ProductosProveedor_Proveedores_FK
FOREIGN KEY (idProveedor)
REFERENCES Compras.Proveedores(idProveedor)
GO

ALTER TABLE Compras.ProductosProveedor ADD CONSTRAINT PresentacionesProducto_ProductosProveedor
FOREIGN KEY (idPresentacion)
REFERENCES Compras.PresentacionesProducto(idPresentacion)
GO

-- PEDIDO_DETALLE
ALTER TABLE Compras.PedidoDetalle ADD CONSTRAINT Pedidos_PedidoDetalle_FK
FOREIGN KEY (idPedido)
REFERENCES Compras.Pedidos(idPedido)
GO

ALTER TABLE Compras.PedidoDetalle ADD CONSTRAINT PresentacionesProducto_PedidoDetalle
FOREIGN KEY (idPresentacion)
REFERENCES Compras.PresentacionesProducto(idPresentacion)
GO

-- PROVEEDORES
ALTER TABLE Compras.Proveedores ADD CONSTRAINT Ciudades_Proveedores_FK
FOREIGN KEY (idCiudad)
REFERENCES RecursosHumanos.Ciudades(idCiudad)
GO

-- CONTACTOS_PROVEEDOR
ALTER TABLE Compras.ContactosProveedor ADD CONSTRAINT Proveedor_contactoProveedor_FK
FOREIGN KEY (idProveedor)
REFERENCES Compras.Proveedores(idProveedor)
GO

-- CUENTAS_PROVEEDOR
ALTER TABLE Compras.CuentasProveedor ADD CONSTRAINT CuentasProveedor_Proveedores_FK
FOREIGN KEY (idProveedor)
REFERENCES Compras.Proveedores(idProveedor)
GO

-- PEDIDOS
ALTER TABLE Compras.Pedidos ADD CONSTRAINT Proveedor_Pedidos_FK
FOREIGN KEY (idProveedor)
REFERENCES Compras.Proveedores(idProveedor)
GO

ALTER TABLE Compras.Pedidos ADD CONSTRAINT Sucursales_Pedidos_FK
FOREIGN KEY (idSucursal)
REFERENCES Compras.Sucursales(idSucursal)
GO

ALTER TABLE Compras.Pedidos ADD CONSTRAINT Empleado_Pedidos_FK
FOREIGN KEY (idEmpleado)
REFERENCES RecursosHumanos.Empleados(idEmpleado)
GO

-- PAGOS
ALTER TABLE Compras.Pagos ADD CONSTRAINT Pedido_FormasPagos_FK
FOREIGN KEY (idPedido)
REFERENCES Compras.Pedidos(idPedido)
GO

ALTER TABLE Compras.Pagos ADD CONSTRAINT FormaPagos_Pagos_FK
FOREIGN KEY (idFormaPago)
REFERENCES RecursosHumanos.FormasPago(idFormaPago)
GO

ALTER TABLE Compras.Pagos ADD CONSTRAINT CuentasProveedor_Pagos_FK
FOREIGN KEY (idCuentaProveedor)
REFERENCES Compras.CuentasProveedor(idCuentaProveedor)
GO





--===============================
-- ESQUEMA DE RECURSOS_HUMANOS --
--===============================

-- CIUDADES
ALTER TABLE RecursosHumanos.Ciudades ADD CONSTRAINT Estados_Ciudades_FK
FOREIGN KEY (idEstado)
REFERENCES RecursosHumanos.Estados(idEstado)
GO

-- EMPLEADOS
ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT Departamentos_Empleados_FK
FOREIGN KEY (idDepartamento)
REFERENCES RecursosHumanos.Departamentos(idDepartamento)
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT Puestos_Empleados_FK
FOREIGN KEY (idPuesto)
REFERENCES RecursosHumanos.Puestos(idPuesto)
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT Ciudades_Empleados_FK
FOREIGN KEY (idCiudad)
REFERENCES RecursosHumanos.Ciudades(idCiudad)
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT Sucursales_Empleados_FK
FOREIGN KEY (idSucursal)
REFERENCES Compras.Sucursales(idSucursal)
GO

-- INCAPACIDADES
ALTER TABLE RecursosHumanos.Incapacidades ADD CONSTRAINT Empleados_Incapacidades_FK
FOREIGN KEY (idEmpleado)
REFERENCES RecursosHumanos.Empleados(idEmpleado)
GO

-- AUSENCIAS_JUSTIFICADAS
ALTER TABLE RecursosHumanos.AusenciasJustificadas ADD CONSTRAINT Empleado_AusenciasJustificadasS_FK
FOREIGN KEY (idEmpleadoS)
REFERENCES RecursosHumanos.Empleados(idEmpleado)
GO

ALTER TABLE RecursosHumanos.AusenciasJustificadas ADD CONSTRAINT Empleado_AusenciasJustificadasA_FK
FOREIGN KEY (idEmpleadoA)
REFERENCES RecursosHumanos.Empleados(idEmpleado)
GO

-- HORARIOS
ALTER TABLE RecursosHumanos.Horarios ADD CONSTRAINT Empleados_Horarios_FK
FOREIGN KEY (idEmpleado)
REFERENCES RecursosHumanos.Empleados(idEmpleado)
GO

-- DOCUMENTACIÓN_EMPLEADO
ALTER TABLE RecursosHumanos.DocumentacionEmpleado ADD CONSTRAINT Empleado_DocumentacionEmpleado_FK
FOREIGN KEY (idEmpleado)
REFERENCES RecursosHumanos.Empleados(idEmpleado)
GO

-- HISTORIAL_PUESTOS
ALTER TABLE RecursosHumanos.HistorialPuestos ADD CONSTRAINT Empleado_HistorialPuestos_FK
FOREIGN KEY (idEmpleado)
REFERENCES RecursosHumanos.Empleados(idEmpleado)
GO

ALTER TABLE RecursosHumanos.HistorialPuestos ADD CONSTRAINT Puestos_HistorialPuestos_FK
FOREIGN KEY (idPuesto)
REFERENCES RecursosHumanos.Puestos(idPuesto)
GO

ALTER TABLE RecursosHumanos.HistorialPuestos ADD CONSTRAINT Departamentos_HistorialPuestos
FOREIGN KEY (idDepartamento)
REFERENCES RecursosHumanos.Departamentos(idDepartamento)
GO

-- NOMINAS
ALTER TABLE RecursosHumanos.Nominas ADD CONSTRAINT Empleado_Nominas_FK
FOREIGN KEY (idEmpleado)
REFERENCES RecursosHumanos.Empleados(idEmpleado)
GO

ALTER TABLE RecursosHumanos.Nominas ADD CONSTRAINT FormaPago_Nominas_FK
FOREIGN KEY (idFormaPago)
REFERENCES RecursosHumanos.FormasPago(idFormaPago)
GO

-- NOMINAS_PERCEPCIONES
ALTER TABLE RecursosHumanos.NominasPercepciones ADD CONSTRAINT Percepciones_NominasPercepciones_FK
FOREIGN KEY (idPercepcion)
REFERENCES RecursosHumanos.Percepciones(idPercepcion)
GO

ALTER TABLE RecursosHumanos.NominasPercepciones ADD CONSTRAINT Nominas_NominasPercepciones_FK
FOREIGN KEY (idNomina)
REFERENCES RecursosHumanos.Nominas(idNomina)
GO

-- NOMINAS_DEDUCCIONES
ALTER TABLE RecursosHumanos.NominasDeducciones ADD CONSTRAINT Nomina_NominasDeducciones_FK
FOREIGN KEY (idNomina)
REFERENCES RecursosHumanos.Nominas(idNomina)
GO

ALTER TABLE RecursosHumanos.NominasDeducciones ADD CONSTRAINT Deducciones_NominasDeducciones_FK
FOREIGN KEY (idDeduccion)
REFERENCES RecursosHumanos.Deducciones(idDeduccion)
GO





--=======================
-- ESQUEMA DE USUARIOS --
--=======================

-- USUARIOS
ALTER TABLE Usuarios.Usuarios ADD CONSTRAINT Empleado_Usuarios_FK
FOREIGN KEY (idEmpleado)
REFERENCES RecursosHumanos.Empleados(idEmpleado)
GO

ALTER TABLE Usuarios.Usuarios ADD CONSTRAINT TiposUsuario_Usuario_FK
FOREIGN KEY (idTipoUsuario)
REFERENCES Usuarios.TiposUsuario(idTipoUsuario)
GO





--=====================
-- ESQUEMA DE VENTAS --
--=====================

-- OFERTAS
ALTER TABLE Ventas.Ofertas ADD CONSTRAINT Productos_Ofertas_FK
FOREIGN KEY (idProducto)
REFERENCES Compras.Productos(idProducto)
GO

-- OFERTAS_ASOCIACION
ALTER TABLE Ventas.OfertasAsociacion ADD CONSTRAINT Ofertas_OfertasAsociacion_FK
FOREIGN KEY (idOferta)
REFERENCES Ventas.Ofertas(idOferta)
GO

ALTER TABLE Ventas.OfertasAsociacion ADD CONSTRAINT Asociaciones_OfertasAsociacion_FK
FOREIGN KEY (idAsociacion)
REFERENCES Ventas.Asociaciones(idAsociacion)
GO

-- VENTAS_DETALLE
ALTER TABLE Ventas.VentasDetalle ADD CONSTRAINT Venta_VentasDetalle_FK
FOREIGN KEY (idVenta)
REFERENCES Ventas.Ventas(idVenta)
GO

ALTER TABLE Ventas.VentasDetalle ADD CONSTRAINT PresentacionProductos_VentasDetalle
FOREIGN KEY (idpresentacion)
REFERENCES Compras.PresentacionesProducto(idPresentacion)
GO

-- CLIENTES
ALTER TABLE Ventas.Clientes ADD CONSTRAINT Ciudad_Clientes_FK
FOREIGN KEY (idCiudad)
REFERENCES RecursosHumanos.Ciudades(idCiudad)
GO

-- MIEMBROS
ALTER TABLE Ventas.Miembros ADD CONSTRAINT Clientes_Miembros_FK
FOREIGN KEY (idCliente)
REFERENCES Ventas.Clientes(idCliente)
GO

ALTER TABLE Ventas.Miembros ADD CONSTRAINT Asociaciones_Miembros_FK
FOREIGN KEY (idAsociacion)
REFERENCES Ventas.Asociaciones(idAsociacion)
GO

-- CLIENTES_CULTIVOS
ALTER TABLE Ventas.ClientesCultivos ADD CONSTRAINT Cliente_ClientesCultivos_FK
FOREIGN KEY (idCliente)
REFERENCES Ventas.Clientes(idCliente)
GO

ALTER TABLE Ventas.ClientesCultivos ADD CONSTRAINT Cultivos_ClientesCultivos_FK
FOREIGN KEY (idCultivo)
REFERENCES Ventas.Cultivos(idCultivo)
GO

ALTER TABLE Ventas.ClientesCultivos ADD CONSTRAINT Ciudades_ClientesCultivos_FK
FOREIGN KEY (idCiudad)
REFERENCES RecursosHumanos.Ciudades(idCiudad)
GO

-- VENTAS
ALTER TABLE Ventas.Ventas ADD CONSTRAINT Cliente_Ventas_FK
FOREIGN KEY (idCliente)
REFERENCES Ventas.Clientes(idCliente)
GO

ALTER TABLE Ventas.Ventas ADD CONSTRAINT Sucursal_Ventas_FK
FOREIGN KEY (idSucursal)
REFERENCES Compras.Sucursales(idSucursal)
GO

ALTER TABLE Ventas.Ventas ADD CONSTRAINT Empleados_Ventas_FK
FOREIGN KEY (idEmpleado)
REFERENCES RecursosHumanos.Empleados(idEmpleado)
GO

-- FACTURAS
ALTER TABLE Ventas.Facturas ADD CONSTRAINT Ventas_Facturas_FK
FOREIGN KEY (idVenta)
REFERENCES Ventas.Ventas(idVenta)
GO

-- COBROS
ALTER TABLE Ventas.Cobros ADD CONSTRAINT Venta_Cobros_FK
FOREIGN KEY (idVenta)
REFERENCES Ventas.Ventas(idVenta)
GO

ALTER TABLE Ventas.Cobros ADD CONSTRAINT FormasPago_Cobros_FK
FOREIGN KEY (idFormaPago)
REFERENCES RecursosHumanos.FormasPago(idFormaPago)
GO

-- VISITAS
ALTER TABLE Ventas.Visitas ADD CONSTRAINT ClienteCultivo_Visitas_FK
FOREIGN KEY (idClienteCultivo)
REFERENCES Ventas.ClientesCultivos(idClienteCultivo)
GO

ALTER TABLE Ventas.Visitas ADD CONSTRAINT Empleado_Visitas_FK
FOREIGN KEY (idEmpleado)
REFERENCES RecursosHumanos.Empleados(idEmpleado)
GO

ALTER TABLE Ventas.Visitas ADD CONSTRAINT UnidadesTransporte_Visitas_FK
FOREIGN KEY (idUnidadTransporte)
REFERENCES Ventas.UnidadesTransporte(idUnidadTransporte)
GO

-- MANTENIMIENTOS
ALTER TABLE Ventas.Matenimientos ADD CONSTRAINT UnidadTransporte_Mantenimiento
FOREIGN KEY (idUnidadTransporte)
REFERENCES Ventas.UnidadesTransporte(idUnidadTransporte)
GO

-- ENVIOS
ALTER TABLE Ventas.Envios ADD CONSTRAINT Ventas_Envios_FK
FOREIGN KEY (idVenta)
REFERENCES Ventas.Ventas(idVenta)
GO

ALTER TABLE Ventas.Envios ADD CONSTRAINT UnidadesTransporte_Envios_FK
FOREIGN KEY (idUnidadTransporte)
REFERENCES Ventas.UnidadesTransporte(idUnidadTransporte)
GO

ALTER TABLE Ventas.Envios ADD CONSTRAINT Ciudades_Envios_FK
FOREIGN KEY (idCiudad)
REFERENCES RecursosHumanos.Ciudades(idCiudad)
GO

-- TRIPULACIÓN
ALTER TABLE Ventas.Tripulacion ADD CONSTRAINT Empleados_Tripulacion_FK
FOREIGN KEY (idEmpleado)
REFERENCES RecursosHumanos.Empleados(idEmpleado)
GO

ALTER TABLE Ventas.Tripulacion ADD CONSTRAINT Envios_Tripulacion_FK
FOREIGN KEY (idEnvio)
REFERENCES Ventas.Envios(idEnvio)
GO






-- #################################
-- ## RESTRICCIONES DE TIPO CHECK ##
-- #################################


--============
-- USUARIOS --
--============

-- TIPOS_USUARIOS
ALTER TABLE Usuarios.TiposUsuario ADD CONSTRAINT
USR_TiposUsuario_idTipoUsuario_CHK CHECK (idTipoUsuario > 0)
GO

ALTER TABLE Usuarios.TiposUsuario ADD CONSTRAINT
USR_TiposUsuario_nombre_UNIK UNIQUE (nombre)
GO

ALTER TABLE Usuarios.TiposUsuario ADD CONSTRAINT
USR_TiposUsuario_estatus_CHK CHECK (estatus IN ('A', 'B'))
GO

-- USUARIOS
ALTER TABLE Usuarios.Usuarios ADD CONSTRAINT
USR_Usuarios_estatus_CHK CHECK (estatus IN ('A', 'B'))
GO

ALTER TABLE Usuarios.Usuarios ADD CONSTRAINT
USR_Usuarios_email_CHK CHECK (email LIKE '%@%.%')
GO

ALTER TABLE Usuarios.Usuarios ADD CONSTRAINT
USR_Usuarios_idEmpleado_CHK CHECK (idEmpleado > 0)
GO

ALTER TABLE Usuarios.Usuarios ADD CONSTRAINT
USR_Usuarios_idTipoUsuario_CHK CHECK (idTipoUsuario > 0)
GO


--===========
-- ESTADOS --
--===========

ALTER TABLE RecursosHumanos.Estados ADD CONSTRAINT
RH_Estados_idEstado_CHK CHECK (idEstado > 0)
GO

ALTER TABLE RecursosHumanos.Estados ADD CONSTRAINT
RH_Estados_nombre_UNIK UNIQUE (nombre)
GO

ALTER TABLE RecursosHumanos.Estados ADD CONSTRAINT
RH_Estados_estatus_CHK CHECK (estatus IN ('A', 'B'))
GO


--============
-- CIUDADES --
--============

ALTER TABLE RecursosHumanos.Ciudades ADD CONSTRAINT
RH_Ciudades_idCiudad_CHK CHECK (idCiudad > 0)
GO

ALTER TABLE RecursosHumanos.Ciudades ADD CONSTRAINT
RH_Ciudades_nombre_UNIK UNIQUE (nombre)
GO

ALTER TABLE RecursosHumanos.Ciudades ADD CONSTRAINT
RH_Ciudades_estatus_CHK CHECK (estatus IN ('A', 'B'))
GO

ALTER TABLE RecursosHumanos.Ciudades ADD CONSTRAINT
RH_Ciudades_idEstado_CHK CHECK (idEstado > 0)
GO


--=================
-- DEPARTAMENTOS --
--=================

ALTER TABLE RecursosHumanos.Departamentos ADD CONSTRAINT
RH_Departamentos_idDepartamento_CHK CHECK (idDepartamento > 0)
GO

ALTER TABLE RecursosHumanos.Departamentos ADD CONSTRAINT
RH_Departamentos_nombre_UNIK UNIQUE (nombre)
GO

ALTER TABLE RecursosHumanos.Departamentos ADD CONSTRAINT
RH_Departamentos_estatus_CHK CHECK (estatus IN ('A', 'B'))
GO


--===============
-- FORMAS_PAGO --
--===============

ALTER TABLE RecursosHumanos.FormasPago ADD CONSTRAINT
RH_FormasPago_idFormasPago_CHK CHECK (idFormaPago > 0)
GO

ALTER TABLE RecursosHumanos.FormasPago ADD CONSTRAINT
RH_FormasPago_nombre_UNIK UNIQUE (nombre)
GO

ALTER TABLE RecursosHumanos.FormasPago ADD CONSTRAINT
RH_FormasPago_estatus_CHK CHECK (estatus IN ('A', 'B'))
GO


--===========
-- PUESTOS --
--===========

ALTER TABLE RecursosHumanos.Puestos ADD CONSTRAINT
RH_Puestos_idPuesto_CHK CHECK (idPuesto > 0)
GO

ALTER TABLE RecursosHumanos.Puestos ADD CONSTRAINT
RH_Puestos_nombre_UNIK UNIQUE (nombre)
GO

ALTER TABLE RecursosHumanos.Puestos ADD CONSTRAINT
RH_Puestos_salarioMin_CHK CHECK (salarioMinimo > 0)
GO

ALTER TABLE RecursosHumanos.Puestos ADD CONSTRAINT
RH_Puestos_salarioMax_CHK CHECK (salarioMaximo > 0)
GO

ALTER TABLE RecursosHumanos.Puestos ADD CONSTRAINT
RH_Puestos_salarioMinMax_CHK CHECK (salarioMaximo >= salarioMinimo)
GO

ALTER TABLE RecursosHumanos.Puestos ADD CONSTRAINT
RH_Puestos_estatus_CHK CHECK (estatus in ('A', 'B'))
GO


--=============
-- EMPLEADOS --
--=============

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_idEmpleado_CHK CHECK (idEmpleado > 0)
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_sexo_CHK CHECK (sexo in ('H', 'M'))
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_fechaContratacion_CHK CHECK (fechaContratacion > fechaNacimiento AND GETDATE() >= fechaContratacion)
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_fechaNacimiento_CHK CHECK (GETDATE() > fechaNacimiento)
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_salario_CHK CHECK (salario > 0)
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_estadoCivil_CHK CHECK (estadoCivil IN ('Soltero', 'Casado', 'Comprometido'))
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_diasVacacionales_CHK CHECK (diasVacacionales >= 0)
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_diasPermiso_CHK CHECK (diasPermiso >= 0)
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_codigoPostal_CHK CHECK (codigoPostal LIKE '[0-9][0-9][0-9][0-9][0-9]')
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_porcentajeComision_CHK CHECK (porcentajeComision BETWEEN 0.0 AND 100.0)
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_estatus_CHK CHECK (estatus in ('A', 'B'))
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_idDepartamento_CHK CHECK (idDepartamento > 0)
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_idPuesto_CHK CHECK (idPuesto > 0)
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_idCiudad_CHK CHECK (idCiudad > 0)
GO

ALTER TABLE RecursosHumanos.Empleados ADD CONSTRAINT
RH_Empleados_idSucursal_CHK CHECK (idSucursal > 0)
GO


--=================
-- INCAPACIDADES --
--=================

ALTER TABLE RecursosHumanos.Incapacidades ADD CONSTRAINT
RH_Incapacidades_idIncapacidad_CHK CHECK (idIncapacidad > 0)
GO

ALTER TABLE RecursosHumanos.Incapacidades ADD CONSTRAINT
RH_Incapacidades_fechaInicioFin_CHK CHECK (fechaInicio < fechaFin)
GO

ALTER TABLE RecursosHumanos.Incapacidades ADD CONSTRAINT
RH_Incapacidades_idEmpleado_CHK CHECK (idEmpleado > 0)
GO


--==========================
-- AUSENCIAS_JUSTIFICADAS --
--==========================

ALTER TABLE RecursosHumanos.AusenciasJustificadas ADD CONSTRAINT
RH_AusenciasJustificadas_idAusencia_CHK CHECK (idAusencia > 0)
GO

ALTER TABLE RecursosHumanos.AusenciasJustificadas ADD CONSTRAINT
RH_AusenciasJustificadas_fechaSolicitud_CHK
CHECK (fechaSolicitud <= fechaInicio)
GO

ALTER TABLE RecursosHumanos.AusenciasJustificadas ADD CONSTRAINT
RH_AusenciasJustificadas_fechaInicioFin_CHK
CHECK (fechaFin > fechaInicio)
GO

ALTER TABLE RecursosHumanos.AusenciasJustificadas ADD CONSTRAINT
RH_AusenciasJustificadas_idEmpleadoS_CHK CHECK (idEmpleadoS > 0)
GO

ALTER TABLE RecursosHumanos.AusenciasJustificadas ADD CONSTRAINT
RH_AusenciasJustificadas_idEmpleadoA_CHK CHECK (idEmpleadoA > 0)
GO


--============
-- HORARIOS --
--============

ALTER TABLE RecursosHumanos.Horarios ADD CONSTRAINT
RH_Horarios_idHorario_CHK CHECK (idHorario > 0)
GO

ALTER TABLE RecursosHumanos.Horarios ADD CONSTRAINT
RH_Horarios_horaInicioFin_CHK CHECK (horaInicio < horaFin)
GO

ALTER TABLE RecursosHumanos.Horarios ADD CONSTRAINT
RH_Horarios_idEmpleado_CHK CHECK (idEmpleado > 0)
GO


--==========================
-- DOCUMENTACIÓN_EMPLEADO --
--==========================

ALTER TABLE RecursosHumanos.DocumentacionEmpleado ADD CONSTRAINT
RH_DocumentacionEmpleado_idDocumento_CHK CHECK (idDocumento > 0)
GO

ALTER TABLE RecursosHumanos.DocumentacionEmpleado ADD CONSTRAINT
RH_DocumentacionEmpleado_idEmpleado_CHK CHECK (idEmpleado > 0)
GO


--=====================
-- HISTORIAL_PUESTOS --
--=====================

ALTER TABLE RecursosHumanos.HistorialPuestos ADD CONSTRAINT
RH_HistorialPuestos_idPuesto_CHK CHECK (idPuesto > 0)
GO

ALTER TABLE RecursosHumanos.HistorialPuestos ADD CONSTRAINT
RH_HistorialPuestos_idEmpleado_CHK CHECK (idEmpleado > 0)
GO

ALTER TABLE RecursosHumanos.HistorialPuestos ADD CONSTRAINT
RH_HistorialPuestos_idDepartamento_CHK CHECK (idDepartamento > 0)
GO

ALTER TABLE RecursosHumanos.HistorialPuestos ADD CONSTRAINT
RH_HistorialPuestos_fechaInicioFin_CHK CHECK (fechaInicio < fechaFin)
GO

ALTER TABLE RecursosHumanos.HistorialPuestos ADD CONSTRAINT
RH_HistorialPuestos_salario_CHK CHECK (salario > 0.0)
GO


--================
-- PERCEPCIONES --
--================

ALTER TABLE RecursosHumanos.Percepciones ADD CONSTRAINT
RH_Percepciones_idPercepcion_CHK CHECK (idPercepcion > 0)
GO

ALTER TABLE RecursosHumanos.Percepciones ADD CONSTRAINT
RH_Percepciones_nombre_UNIK UNIQUE (nombre)
GO

ALTER TABLE RecursosHumanos.Percepciones ADD CONSTRAINT
RH_Percepciones_diasPagar_CHK CHECK (diasPagar > 0)
GO


--===============
-- DEDUCCIONES --
--===============

ALTER TABLE RecursosHumanos.Deducciones ADD CONSTRAINT
RH_Deducciones_idDeduccion_CHK CHECK (idDeduccion > 0)
GO

ALTER TABLE RecursosHumanos.Deducciones ADD CONSTRAINT
RH_Deducciones_nombre_UNIK UNIQUE (nombre)
GO

ALTER TABLE RecursosHumanos.Deducciones ADD CONSTRAINT
RH_Deducciones_porcentaje_CHK CHECK (porcentaje BETWEEN 0.0 AND 100.0)
GO


--===========
-- NOMINAS --
--===========

ALTER TABLE RecursosHumanos.Nominas ADD CONSTRAINT
RH_Nominas_idNomina_CHK CHECK (idNomina > 0)
GO

ALTER TABLE RecursosHumanos.Nominas ADD CONSTRAINT
RH_Nominas_totalIP_CHK CHECK (totalIP > 0)
GO

ALTER TABLE RecursosHumanos.Nominas ADD CONSTRAINT
RH_Nominas_totalID_CHK CHECK (totalID > 0)
GO

ALTER TABLE RecursosHumanos.Nominas ADD CONSTRAINT
RH_Nominas_cantidadNeta_CHK CHECK (cantidadNeta > 0)
GO

ALTER TABLE RecursosHumanos.Nominas ADD CONSTRAINT
RH_Nominas_diasTrabajados_CHK CHECK (diasTrabajados > 0)
GO

ALTER TABLE RecursosHumanos.Nominas ADD CONSTRAINT
RH_Nominas_faltas_CHK CHECK (faltas > 0)
GO

ALTER TABLE RecursosHumanos.Nominas ADD CONSTRAINT
RH_Nominas_fechaInicioFin_CHK CHECK (fechaInicio < fechaFin)
GO

ALTER TABLE RecursosHumanos.Nominas ADD CONSTRAINT
RH_Nominas_idEmpleado_CHK CHECK (idEmpleado > 0)
GO

ALTER TABLE RecursosHumanos.Nominas ADD CONSTRAINT
RH_Nominas_idFormaPago_CHK CHECK (idFormaPago > 0)
GO


--========================
-- NOMINAS_PERCEPCIONES --
--========================

ALTER TABLE RecursosHumanos.NominasPercepciones ADD CONSTRAINT
RH_NominasPercepciones_idNomina_CHK CHECK (idNomina > 0)
GO

ALTER TABLE RecursosHumanos.NominasPercepciones ADD CONSTRAINT
RH_NominasPercepciones_idPercepcion_CHK CHECK (idPercepcion > 0)
GO

ALTER TABLE RecursosHumanos.NominasPercepciones ADD CONSTRAINT
RH_NominasPercepciones_importe_CHK CHECK (importe > 0)
GO


--=======================
-- NOMINAS_DEDUCCIONES --
--=======================

ALTER TABLE RecursosHumanos.NominasDeducciones ADD CONSTRAINT
RH_NominasDeducciones_idNomina_CHK CHECK (idNomina > 0)
GO

ALTER TABLE RecursosHumanos.NominasDeducciones ADD CONSTRAINT
RH_NominasDeducciones_idDeduccion_CHK CHECK (idDeduccion > 0)
GO

ALTER TABLE RecursosHumanos.NominasDeducciones ADD CONSTRAINT
RH_NominasDeducciones_importe_CHK CHECK (importe > 0)
GO