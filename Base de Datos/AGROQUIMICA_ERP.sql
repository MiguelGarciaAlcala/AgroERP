USE [master]
GO
/****** Object:  Database [AGROQUIMICA_ERP]    Script Date: 22/10/2018 08:04:49 p. m. ******/
CREATE DATABASE [AGROQUIMICA_ERP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AGROQUIMICA_ERP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AGROQUIMICA_ERP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AGROQUIMICA_ERP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AGROQUIMICA_ERP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AGROQUIMICA_ERP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET ARITHABORT OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET RECOVERY FULL 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET  MULTI_USER 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AGROQUIMICA_ERP', N'ON'
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET QUERY_STORE = OFF
GO
USE [AGROQUIMICA_ERP]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [AGROQUIMICA_ERP]
GO
/****** Object:  Schema [Compras]    Script Date: 22/10/2018 08:04:50 p. m. ******/
CREATE SCHEMA [Compras]
GO
/****** Object:  Schema [RecursosHumanos]    Script Date: 22/10/2018 08:04:50 p. m. ******/
CREATE SCHEMA [RecursosHumanos]
GO
/****** Object:  Schema [Usuarios]    Script Date: 22/10/2018 08:04:50 p. m. ******/
CREATE SCHEMA [Usuarios]
GO
/****** Object:  Schema [Ventas]    Script Date: 22/10/2018 08:04:50 p. m. ******/
CREATE SCHEMA [Ventas]
GO
/****** Object:  Table [Compras].[Categorias]    Script Date: 22/10/2018 08:04:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[Categorias](
	[idCategoria] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[estatus] [char](1) NOT NULL,
 CONSTRAINT [Categorias_PK] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compras].[ContactosProveedor]    Script Date: 22/10/2018 08:04:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[ContactosProveedor](
	[idContacto] [int] NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[telefono] [char](12) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[idProveedor] [int] NOT NULL,
 CONSTRAINT [ContactosProveedor_PK] PRIMARY KEY CLUSTERED 
(
	[idContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compras].[CuentasProveedor]    Script Date: 22/10/2018 08:04:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[CuentasProveedor](
	[idCuentaProveedor] [int] NOT NULL,
	[idProveedor] [int] NOT NULL,
	[noCuenta] [varchar](10) NOT NULL,
	[banco] [varchar](30) NOT NULL,
 CONSTRAINT [CuentasProveedor_PK] PRIMARY KEY CLUSTERED 
(
	[idCuentaProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compras].[Empaques]    Script Date: 22/10/2018 08:04:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[Empaques](
	[idEmpaque] [int] NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[capacidad] [float] NOT NULL,
	[estatus] [char](1) NOT NULL,
	[idUnidad] [int] NOT NULL,
 CONSTRAINT [Presentaciones_PK] PRIMARY KEY CLUSTERED 
(
	[idEmpaque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compras].[ExistenciasSucursal]    Script Date: 22/10/2018 08:04:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[ExistenciasSucursal](
	[idPresentacion] [int] NOT NULL,
	[idSucursal] [int] NOT NULL,
	[cantidad] [float] NOT NULL,
 CONSTRAINT [ExistenciasSucursal_PK] PRIMARY KEY CLUSTERED 
(
	[idPresentacion] ASC,
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compras].[ImagenesProducto]    Script Date: 22/10/2018 08:04:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[ImagenesProducto](
	[idImagen] [int] NOT NULL,
	[nombreImagen] [varchar](100) NOT NULL,
	[imagen] [varbinary](max) NOT NULL,
	[principal] [char](1) NOT NULL,
	[idProducto] [int] NOT NULL,
 CONSTRAINT [ImagenesProducto_PK] PRIMARY KEY CLUSTERED 
(
	[idImagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Compras].[Laboratorios]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[Laboratorios](
	[idLaboratorio] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[origen] [varchar](30) NOT NULL,
	[estatus] [char](1) NOT NULL,
 CONSTRAINT [Marcas_PK] PRIMARY KEY CLUSTERED 
(
	[idLaboratorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compras].[Pagos]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[Pagos](
	[idPago] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[importe] [float] NOT NULL,
	[idPedido] [int] NOT NULL,
	[idFormaPago] [int] NOT NULL,
	[idCuentaProveedor] [int] NOT NULL,
 CONSTRAINT [Pagos_PK] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compras].[PedidoDetalle]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[PedidoDetalle](
	[idPedidoDetalle] [int] NOT NULL,
	[cantPedida] [int] NOT NULL,
	[precioCompra] [float] NOT NULL,
	[subtotal] [float] NOT NULL,
	[cantRecibida] [int] NOT NULL,
	[cantRechazada] [int] NOT NULL,
	[cantAceptada] [float] NOT NULL,
	[idPedido] [int] NOT NULL,
	[idPresentacion] [int] NOT NULL,
 CONSTRAINT [PedidoDetalle_PK] PRIMARY KEY CLUSTERED 
(
	[idPedidoDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compras].[Pedidos]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[Pedidos](
	[idPedido] [int] NOT NULL,
	[fechaRegistro] [date] NOT NULL,
	[fechaRecepcion] [date] NOT NULL,
	[totalPagar] [float] NOT NULL,
	[cantidadPagada] [float] NOT NULL,
	[estatus] [char](1) NOT NULL,
	[idProveedor] [int] NOT NULL,
	[idSucursal] [int] NOT NULL,
	[idEmpleado] [int] NOT NULL,
 CONSTRAINT [Pedidos_PK] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compras].[PresentacionesProducto]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[PresentacionesProducto](
	[idPresentacion] [int] NOT NULL,
	[precioCompra] [float] NOT NULL,
	[precioVenta] [float] NOT NULL,
	[puntoReorden] [float] NOT NULL,
	[idProducto] [int] NOT NULL,
	[idEmpaque] [int] NOT NULL,
 CONSTRAINT [PresentacionesProducto_PK] PRIMARY KEY CLUSTERED 
(
	[idPresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compras].[Productos]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[Productos](
	[idProducto] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[puntoReorden] [int] NOT NULL,
	[precioCompra] [float] NOT NULL,
	[precioVenta] [float] NOT NULL,
	[ingredienteActivo] [varchar](100) NOT NULL,
	[bandaToxicologica] [varchar](80) NOT NULL,
	[aplicacion] [varchar](200) NOT NULL,
	[uso] [varchar](200) NOT NULL,
	[estatus] [char](1) NOT NULL,
	[idLaboratorio] [int] NOT NULL,
	[idCategoria] [int] NOT NULL,
 CONSTRAINT [Productos_PK] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compras].[ProductosProveedor]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[ProductosProveedor](
	[idProveedor] [int] NOT NULL,
	[idPresentacion] [int] NOT NULL,
	[diasRetardo] [int] NOT NULL,
	[precioEstandar] [float] NOT NULL,
	[precioUltimaCompra] [float] NOT NULL,
	[cantMinPedir] [int] NOT NULL,
	[cantMaxPedir] [int] NOT NULL,
 CONSTRAINT [ProductosProveedor_PK] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC,
	[idPresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compras].[Proveedores]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[Proveedores](
	[idProveedor] [int] NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[telefono] [char](12) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[direccion] [varchar](80) NOT NULL,
	[colonia] [varchar](50) NOT NULL,
	[codigoPostal] [varchar](5) NOT NULL,
	[idCiudad] [int] NOT NULL,
 CONSTRAINT [Proveedores_PK] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compras].[Sucursales]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[Sucursales](
	[idSucursal] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[telefono] [varchar](15) NOT NULL,
	[direccion] [varchar](80) NOT NULL,
	[colonia] [varchar](50) NOT NULL,
	[codigoPostal] [varchar](5) NOT NULL,
	[presupuesto] [float] NOT NULL,
	[estatus] [char](1) NOT NULL,
	[idCiudad] [int] NOT NULL,
 CONSTRAINT [Sucursales_PK] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compras].[UnidadMedida]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[UnidadMedida](
	[idUnidad] [int] NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[siglas] [varchar](20) NOT NULL,
	[estatus] [char](1) NOT NULL,
 CONSTRAINT [UnidadMedida_PK] PRIMARY KEY CLUSTERED 
(
	[idUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[AusenciasJustificadas]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[AusenciasJustificadas](
	[idAusencia] [int] NOT NULL,
	[fechaSolicitud] [date] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFin] [date] NOT NULL,
	[tipo] [char](1) NOT NULL,
	[idEmpleadoS] [int] NOT NULL,
	[idEmpleadoA] [int] NOT NULL,
 CONSTRAINT [AusenciasJustificadas_PK] PRIMARY KEY CLUSTERED 
(
	[idAusencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[Ciudades]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[Ciudades](
	[idCiudad] [int] NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[idEstado] [int] NOT NULL,
	[estatus] [char](1) NOT NULL,
 CONSTRAINT [Ciudades_PK] PRIMARY KEY CLUSTERED 
(
	[idCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [RH_Ciudades_nombre_UNIK] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[Deducciones]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[Deducciones](
	[idDeduccion] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[descripcion] [varchar](80) NOT NULL,
	[porcentaje] [float] NOT NULL,
	[estatus] [char](1) NOT NULL,
 CONSTRAINT [Deducciones_PK] PRIMARY KEY CLUSTERED 
(
	[idDeduccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [RH_Deducciones_nombre_UNIK] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[Departamentos]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[Departamentos](
	[idDepartamento] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estatus] [char](1) NOT NULL,
 CONSTRAINT [Departamentos_PK] PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [RH_Departamentos_nombre_UNIK] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[DocumentacionEmpleado]    Script Date: 22/10/2018 08:04:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[DocumentacionEmpleado](
	[idDocumento] [int] NOT NULL,
	[nombreDocumento] [varchar](80) NOT NULL,
	[fechaEntrega] [date] NOT NULL,
	[documento] [varbinary](max) NOT NULL,
	[idEmpleado] [int] NOT NULL,
 CONSTRAINT [DocumentacionEmpleado_PK] PRIMARY KEY CLUSTERED 
(
	[idDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[Empleados]    Script Date: 22/10/2018 08:04:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[Empleados](
	[idEmpleado] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apaterno] [varchar](30) NOT NULL,
	[amaterno] [varchar](30) NOT NULL,
	[sexo] [char](1) NOT NULL,
	[fechaContratacion] [date] NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[salario] [float] NOT NULL,
	[nss] [varchar](10) NOT NULL,
	[estadoCivil] [varchar](20) NOT NULL,
	[diasVacacionales] [int] NOT NULL,
	[diasPermiso] [int] NOT NULL,
	[fotografia] [varbinary](max) NULL,
	[direccion] [varchar](80) NOT NULL,
	[colonia] [varchar](50) NOT NULL,
	[codigoPostal] [varchar](5) NOT NULL,
	[escolaridad] [varchar](80) NOT NULL,
	[porcentajeComision] [float] NOT NULL,
	[estatus] [char](1) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[idPuesto] [int] NOT NULL,
	[idCiudad] [int] NOT NULL,
	[idSucursal] [int] NOT NULL,
 CONSTRAINT [Empleados_PK] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[Estados]    Script Date: 22/10/2018 08:04:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[Estados](
	[idEstado] [int] NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[siglas] [varchar](10) NOT NULL,
	[estatus] [char](1) NOT NULL,
 CONSTRAINT [Estado_PK] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [RH_Estados_nombre_UNIK] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[FormasPago]    Script Date: 22/10/2018 08:04:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[FormasPago](
	[idFormaPago] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estatus] [char](1) NOT NULL,
 CONSTRAINT [FormasPago_PK] PRIMARY KEY CLUSTERED 
(
	[idFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [RH_FormasPago_nombre_UNIK] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[HistorialPuestos]    Script Date: 22/10/2018 08:04:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[HistorialPuestos](
	[idEmpleado] [int] NOT NULL,
	[idPuesto] [int] NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFin] [date] NOT NULL,
	[salario] [float] NOT NULL,
 CONSTRAINT [HistorialPuestos_PK] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC,
	[idPuesto] ASC,
	[idDepartamento] ASC,
	[fechaInicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[Horarios]    Script Date: 22/10/2018 08:04:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[Horarios](
	[idHorario] [int] NOT NULL,
	[horaInicio] [time](7) NOT NULL,
	[horaFin] [time](7) NOT NULL,
	[dias] [varchar](30) NOT NULL,
	[idEmpleado] [int] NOT NULL,
 CONSTRAINT [Horarios_PK] PRIMARY KEY CLUSTERED 
(
	[idHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[Incapacidades]    Script Date: 22/10/2018 08:04:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[Incapacidades](
	[idIncapacidad] [int] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFin] [date] NOT NULL,
	[enfermedad] [varchar](150) NOT NULL,
	[evidencia] [varbinary](max) NOT NULL,
	[idEmpleado] [int] NOT NULL,
 CONSTRAINT [Incapacidades_PK] PRIMARY KEY CLUSTERED 
(
	[idIncapacidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[Nominas]    Script Date: 22/10/2018 08:04:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[Nominas](
	[idNomina] [int] NOT NULL,
	[fechaPago] [date] NOT NULL,
	[totalIP] [float] NOT NULL,
	[totalID] [float] NOT NULL,
	[cantidadNeta] [float] NOT NULL,
	[diasTrabajados] [int] NOT NULL,
	[faltas] [int] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFin] [date] NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[idFormaPago] [int] NOT NULL,
 CONSTRAINT [Nominas_PK] PRIMARY KEY CLUSTERED 
(
	[idNomina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[NominasDeducciones]    Script Date: 22/10/2018 08:04:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[NominasDeducciones](
	[idNomina] [int] NOT NULL,
	[idDeduccion] [int] NOT NULL,
	[importe] [float] NOT NULL,
 CONSTRAINT [NominasDeducciones_PK] PRIMARY KEY CLUSTERED 
(
	[idNomina] ASC,
	[idDeduccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[NominasPercepciones]    Script Date: 22/10/2018 08:04:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[NominasPercepciones](
	[idNomina] [int] NOT NULL,
	[idPercepcion] [int] NOT NULL,
	[importe] [float] NOT NULL,
 CONSTRAINT [NominasPercepciones_PK] PRIMARY KEY CLUSTERED 
(
	[idNomina] ASC,
	[idPercepcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[Percepciones]    Script Date: 22/10/2018 08:04:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[Percepciones](
	[idPercepcion] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[descripcion] [varchar](80) NOT NULL,
	[diasPagar] [int] NOT NULL,
	[estatus] [char](1) NOT NULL,
 CONSTRAINT [Percepciones_PK] PRIMARY KEY CLUSTERED 
(
	[idPercepcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [RH_Percepciones_nombre_UNIK] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RecursosHumanos].[Puestos]    Script Date: 22/10/2018 08:04:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RecursosHumanos].[Puestos](
	[idPuesto] [int] NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[salarioMinimo] [float] NOT NULL,
	[salarioMaximo] [float] NOT NULL,
	[estatus] [char](1) NOT NULL,
 CONSTRAINT [Puestos_PK] PRIMARY KEY CLUSTERED 
(
	[idPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [RH_Puestos_nombre_UNIK] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Usuarios].[TiposUsuario]    Script Date: 22/10/2018 08:04:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Usuarios].[TiposUsuario](
	[idTipoUsuario] [int] NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[estatus] [char](1) NOT NULL,
 CONSTRAINT [TiposUsuario_PK] PRIMARY KEY CLUSTERED 
(
	[idTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [USR_TiposUsuario_nombre_UNIK] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Usuarios].[Usuarios]    Script Date: 22/10/2018 08:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Usuarios].[Usuarios](
	[nombre] [varchar](30) NOT NULL,
	[contrasenia] [varchar](20) NOT NULL,
	[email] [varchar](80) NOT NULL,
	[estatus] [char](1) NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[idTipoUsuario] [int] NOT NULL,
 CONSTRAINT [Usuarios_PK] PRIMARY KEY CLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Asociaciones]    Script Date: 22/10/2018 08:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Asociaciones](
	[idAsociacion] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[estatus] [char](1) NOT NULL,
 CONSTRAINT [Asociaciones_PK] PRIMARY KEY CLUSTERED 
(
	[idAsociacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Clientes]    Script Date: 22/10/2018 08:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Clientes](
	[idCliente] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[razonSocial] [varchar](100) NOT NULL,
	[limiteCredito] [float] NOT NULL,
	[direccion] [varchar](80) NOT NULL,
	[codigoPostal] [char](5) NOT NULL,
	[rfc] [char](13) NOT NULL,
	[telefono] [char](12) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[tipo] [char](1) NOT NULL,
	[idCiudad] [int] NOT NULL,
 CONSTRAINT [Clientes_PK] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[ClientesCultivos]    Script Date: 22/10/2018 08:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[ClientesCultivos](
	[idClienteCultivo] [int] NOT NULL,
	[extension] [float] NOT NULL,
	[ubicacion] [varchar](100) NOT NULL,
	[idCliente] [int] NOT NULL,
	[idCultivo] [int] NOT NULL,
	[idCiudad] [int] NOT NULL,
 CONSTRAINT [ClientesCultivos_PK] PRIMARY KEY CLUSTERED 
(
	[idClienteCultivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Cobros]    Script Date: 22/10/2018 08:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Cobros](
	[idCobro] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[importe] [float] NOT NULL,
	[idVenta] [int] NOT NULL,
	[idFormaPago] [int] NOT NULL,
 CONSTRAINT [Pagos_PK] PRIMARY KEY CLUSTERED 
(
	[idCobro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Cultivos]    Script Date: 22/10/2018 08:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Cultivos](
	[idCultivo] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[costoAsesoria] [float] NOT NULL,
	[estatus] [char](1) NOT NULL,
 CONSTRAINT [Cultivos_PK] PRIMARY KEY CLUSTERED 
(
	[idCultivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Envios]    Script Date: 22/10/2018 08:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Envios](
	[idEnvio] [int] NOT NULL,
	[fechaEntregaPlaneada] [date] NOT NULL,
	[fechaEntregaReal] [date] NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[codigoPostal] [varchar](5) NOT NULL,
	[idVenta] [int] NOT NULL,
	[idUnidadTransporte] [int] NOT NULL,
	[idCiudad] [int] NOT NULL,
 CONSTRAINT [EnviosVentas_PK] PRIMARY KEY CLUSTERED 
(
	[idEnvio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Facturas]    Script Date: 22/10/2018 08:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Facturas](
	[Folio] [int] NOT NULL,
	[subtotal] [float] NOT NULL,
	[iva] [float] NOT NULL,
	[total] [float] NOT NULL,
	[nombreDocXML] [varchar](100) NOT NULL,
	[documentoXML] [varbinary](max) NOT NULL,
	[nombreDocPDF] [varchar](100) NOT NULL,
	[documentoPDF] [varbinary](max) NOT NULL,
	[idVenta] [int] NOT NULL,
 CONSTRAINT [Facturas_PK] PRIMARY KEY CLUSTERED 
(
	[Folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Matenimientos]    Script Date: 22/10/2018 08:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Matenimientos](
	[idMantenimiento] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[taller] [varchar](100) NOT NULL,
	[costo] [float] NOT NULL,
	[comentarios] [varchar](200) NOT NULL,
	[tipo] [varchar](30) NOT NULL,
	[idUnidadTransporte] [int] NOT NULL,
 CONSTRAINT [Matenimientos_PK] PRIMARY KEY CLUSTERED 
(
	[idMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Miembros]    Script Date: 22/10/2018 08:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Miembros](
	[idCliente] [int] NOT NULL,
	[idAsociacion] [int] NOT NULL,
	[estatus] [char](1) NOT NULL,
	[fechaIncorporacion] [date] NOT NULL,
 CONSTRAINT [Miembros_PK] PRIMARY KEY CLUSTERED 
(
	[idAsociacion] ASC,
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Ofertas]    Script Date: 22/10/2018 08:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Ofertas](
	[idOferta] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[porDescuento] [float] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFin] [date] NOT NULL,
	[cantMinProducto] [int] NOT NULL,
	[estatus] [char](1) NOT NULL,
	[idProducto] [int] NOT NULL,
 CONSTRAINT [Ofertas_PK] PRIMARY KEY CLUSTERED 
(
	[idOferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[OfertasAsociacion]    Script Date: 22/10/2018 08:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[OfertasAsociacion](
	[idAsociacion] [int] NOT NULL,
	[idOferta] [int] NOT NULL,
	[estatus] [char](1) NOT NULL,
 CONSTRAINT [OfertasAsociacion_PK] PRIMARY KEY CLUSTERED 
(
	[idAsociacion] ASC,
	[idOferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Tripulacion]    Script Date: 22/10/2018 08:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Tripulacion](
	[idEmpleado] [int] NOT NULL,
	[idEnvio] [int] NOT NULL,
	[rol] [varchar](50) NOT NULL,
 CONSTRAINT [Tripulacion_PK] PRIMARY KEY CLUSTERED 
(
	[rol] ASC,
	[idEmpleado] ASC,
	[idEnvio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[UnidadesTransporte]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[UnidadesTransporte](
	[idUnidadTransporte] [int] NOT NULL,
	[placas] [varchar](10) NOT NULL,
	[marca] [varchar](80) NOT NULL,
	[modelo] [varchar](80) NOT NULL,
	[anio] [int] NOT NULL,
	[capacidad] [int] NOT NULL,
 CONSTRAINT [UnidadesTransporte_PK] PRIMARY KEY CLUSTERED 
(
	[idUnidadTransporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Ventas]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Ventas](
	[idVenta] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[totalPagar] [float] NOT NULL,
	[cantPagada] [float] NOT NULL,
	[comentarios] [varchar](100) NOT NULL,
	[estatus] [char](1) NOT NULL,
	[tipo] [char](1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[idSucursal] [int] NOT NULL,
	[idEmpleado] [int] NOT NULL,
 CONSTRAINT [Ventas_PK] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[VentasDetalle]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[VentasDetalle](
	[idVentaDetalle] [int] NOT NULL,
	[precioVenta] [float] NOT NULL,
	[cantidad] [float] NOT NULL,
	[subtotal] [float] NOT NULL,
	[idVenta] [int] NOT NULL,
	[idPresentacion] [int] NOT NULL,
 CONSTRAINT [VentasDetalle_PK] PRIMARY KEY CLUSTERED 
(
	[idVentaDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Visitas]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Visitas](
	[idVisita] [int] NOT NULL,
	[fechaPlaneada] [date] NOT NULL,
	[fechaReal] [date] NOT NULL,
	[comentarios] [varchar](200) NOT NULL,
	[estatus] [char](1) NOT NULL,
	[costo] [float] NOT NULL,
	[idClienteCultivo] [int] NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[idUnidadTransporte] [int] NOT NULL,
 CONSTRAINT [Visitas_PK] PRIMARY KEY CLUSTERED 
(
	[idVisita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Compras].[ContactosProveedor]  WITH CHECK ADD  CONSTRAINT [Proveedor_contactoProveedor_FK] FOREIGN KEY([idProveedor])
REFERENCES [Compras].[Proveedores] ([idProveedor])
GO
ALTER TABLE [Compras].[ContactosProveedor] CHECK CONSTRAINT [Proveedor_contactoProveedor_FK]
GO
ALTER TABLE [Compras].[CuentasProveedor]  WITH CHECK ADD  CONSTRAINT [CuentasProveedor_Proveedores_FK] FOREIGN KEY([idProveedor])
REFERENCES [Compras].[Proveedores] ([idProveedor])
GO
ALTER TABLE [Compras].[CuentasProveedor] CHECK CONSTRAINT [CuentasProveedor_Proveedores_FK]
GO
ALTER TABLE [Compras].[Empaques]  WITH CHECK ADD  CONSTRAINT [Presentaciones_UnidadMedida_FK] FOREIGN KEY([idUnidad])
REFERENCES [Compras].[UnidadMedida] ([idUnidad])
GO
ALTER TABLE [Compras].[Empaques] CHECK CONSTRAINT [Presentaciones_UnidadMedida_FK]
GO
ALTER TABLE [Compras].[ExistenciasSucursal]  WITH CHECK ADD  CONSTRAINT [PresentacionesProductos_ExistenciaSucursal_FK] FOREIGN KEY([idPresentacion])
REFERENCES [Compras].[PresentacionesProducto] ([idPresentacion])
GO
ALTER TABLE [Compras].[ExistenciasSucursal] CHECK CONSTRAINT [PresentacionesProductos_ExistenciaSucursal_FK]
GO
ALTER TABLE [Compras].[ExistenciasSucursal]  WITH CHECK ADD  CONSTRAINT [Sucursales_ExistenciasSucursal_FK] FOREIGN KEY([idSucursal])
REFERENCES [Compras].[Sucursales] ([idSucursal])
GO
ALTER TABLE [Compras].[ExistenciasSucursal] CHECK CONSTRAINT [Sucursales_ExistenciasSucursal_FK]
GO
ALTER TABLE [Compras].[ImagenesProducto]  WITH CHECK ADD  CONSTRAINT [Productos_ImagenesProducto_FK] FOREIGN KEY([idProducto])
REFERENCES [Compras].[Productos] ([idProducto])
GO
ALTER TABLE [Compras].[ImagenesProducto] CHECK CONSTRAINT [Productos_ImagenesProducto_FK]
GO
ALTER TABLE [Compras].[Pagos]  WITH CHECK ADD  CONSTRAINT [CuentasProveedor_Pagos_FK] FOREIGN KEY([idCuentaProveedor])
REFERENCES [Compras].[CuentasProveedor] ([idCuentaProveedor])
GO
ALTER TABLE [Compras].[Pagos] CHECK CONSTRAINT [CuentasProveedor_Pagos_FK]
GO
ALTER TABLE [Compras].[Pagos]  WITH CHECK ADD  CONSTRAINT [FormaPagos_Pagos_FK] FOREIGN KEY([idFormaPago])
REFERENCES [RecursosHumanos].[FormasPago] ([idFormaPago])
GO
ALTER TABLE [Compras].[Pagos] CHECK CONSTRAINT [FormaPagos_Pagos_FK]
GO
ALTER TABLE [Compras].[Pagos]  WITH CHECK ADD  CONSTRAINT [Pedido_FormasPagos_FK] FOREIGN KEY([idPedido])
REFERENCES [Compras].[Pedidos] ([idPedido])
GO
ALTER TABLE [Compras].[Pagos] CHECK CONSTRAINT [Pedido_FormasPagos_FK]
GO
ALTER TABLE [Compras].[PedidoDetalle]  WITH CHECK ADD  CONSTRAINT [Pedidos_PedidoDetalle_FK] FOREIGN KEY([idPedido])
REFERENCES [Compras].[Pedidos] ([idPedido])
GO
ALTER TABLE [Compras].[PedidoDetalle] CHECK CONSTRAINT [Pedidos_PedidoDetalle_FK]
GO
ALTER TABLE [Compras].[PedidoDetalle]  WITH CHECK ADD  CONSTRAINT [PresentacionesProducto_PedidoDetalle] FOREIGN KEY([idPresentacion])
REFERENCES [Compras].[PresentacionesProducto] ([idPresentacion])
GO
ALTER TABLE [Compras].[PedidoDetalle] CHECK CONSTRAINT [PresentacionesProducto_PedidoDetalle]
GO
ALTER TABLE [Compras].[Pedidos]  WITH CHECK ADD  CONSTRAINT [Empleado_Pedidos_FK] FOREIGN KEY([idEmpleado])
REFERENCES [RecursosHumanos].[Empleados] ([idEmpleado])
GO
ALTER TABLE [Compras].[Pedidos] CHECK CONSTRAINT [Empleado_Pedidos_FK]
GO
ALTER TABLE [Compras].[Pedidos]  WITH CHECK ADD  CONSTRAINT [Proveedor_Pedidos_FK] FOREIGN KEY([idProveedor])
REFERENCES [Compras].[Proveedores] ([idProveedor])
GO
ALTER TABLE [Compras].[Pedidos] CHECK CONSTRAINT [Proveedor_Pedidos_FK]
GO
ALTER TABLE [Compras].[Pedidos]  WITH CHECK ADD  CONSTRAINT [Sucursales_Pedidos_FK] FOREIGN KEY([idSucursal])
REFERENCES [Compras].[Sucursales] ([idSucursal])
GO
ALTER TABLE [Compras].[Pedidos] CHECK CONSTRAINT [Sucursales_Pedidos_FK]
GO
ALTER TABLE [Compras].[PresentacionesProducto]  WITH CHECK ADD  CONSTRAINT [Empaques_PresentacionProducto_FK] FOREIGN KEY([idEmpaque])
REFERENCES [Compras].[Empaques] ([idEmpaque])
GO
ALTER TABLE [Compras].[PresentacionesProducto] CHECK CONSTRAINT [Empaques_PresentacionProducto_FK]
GO
ALTER TABLE [Compras].[PresentacionesProducto]  WITH CHECK ADD  CONSTRAINT [Producto_PresentacionProducto_FK] FOREIGN KEY([idProducto])
REFERENCES [Compras].[Productos] ([idProducto])
GO
ALTER TABLE [Compras].[PresentacionesProducto] CHECK CONSTRAINT [Producto_PresentacionProducto_FK]
GO
ALTER TABLE [Compras].[Productos]  WITH CHECK ADD  CONSTRAINT [Productos_Categoria_FK] FOREIGN KEY([idCategoria])
REFERENCES [Compras].[Categorias] ([idCategoria])
GO
ALTER TABLE [Compras].[Productos] CHECK CONSTRAINT [Productos_Categoria_FK]
GO
ALTER TABLE [Compras].[Productos]  WITH CHECK ADD  CONSTRAINT [Productos_Laboratorio_FK] FOREIGN KEY([idLaboratorio])
REFERENCES [Compras].[Laboratorios] ([idLaboratorio])
GO
ALTER TABLE [Compras].[Productos] CHECK CONSTRAINT [Productos_Laboratorio_FK]
GO
ALTER TABLE [Compras].[ProductosProveedor]  WITH CHECK ADD  CONSTRAINT [PresentacionesProducto_ProductosProveedor] FOREIGN KEY([idPresentacion])
REFERENCES [Compras].[PresentacionesProducto] ([idPresentacion])
GO
ALTER TABLE [Compras].[ProductosProveedor] CHECK CONSTRAINT [PresentacionesProducto_ProductosProveedor]
GO
ALTER TABLE [Compras].[ProductosProveedor]  WITH CHECK ADD  CONSTRAINT [ProductosProveedor_Proveedores_FK] FOREIGN KEY([idProveedor])
REFERENCES [Compras].[Proveedores] ([idProveedor])
GO
ALTER TABLE [Compras].[ProductosProveedor] CHECK CONSTRAINT [ProductosProveedor_Proveedores_FK]
GO
ALTER TABLE [Compras].[Proveedores]  WITH CHECK ADD  CONSTRAINT [Ciudades_Proveedores_FK] FOREIGN KEY([idCiudad])
REFERENCES [RecursosHumanos].[Ciudades] ([idCiudad])
GO
ALTER TABLE [Compras].[Proveedores] CHECK CONSTRAINT [Ciudades_Proveedores_FK]
GO
ALTER TABLE [Compras].[Sucursales]  WITH CHECK ADD  CONSTRAINT [Ciudades_Sucursales_FK] FOREIGN KEY([idCiudad])
REFERENCES [RecursosHumanos].[Ciudades] ([idCiudad])
GO
ALTER TABLE [Compras].[Sucursales] CHECK CONSTRAINT [Ciudades_Sucursales_FK]
GO
ALTER TABLE [RecursosHumanos].[AusenciasJustificadas]  WITH CHECK ADD  CONSTRAINT [Empleado_AusenciasJustificadasA_FK] FOREIGN KEY([idEmpleadoA])
REFERENCES [RecursosHumanos].[Empleados] ([idEmpleado])
GO
ALTER TABLE [RecursosHumanos].[AusenciasJustificadas] CHECK CONSTRAINT [Empleado_AusenciasJustificadasA_FK]
GO
ALTER TABLE [RecursosHumanos].[AusenciasJustificadas]  WITH CHECK ADD  CONSTRAINT [Empleado_AusenciasJustificadasS_FK] FOREIGN KEY([idEmpleadoS])
REFERENCES [RecursosHumanos].[Empleados] ([idEmpleado])
GO
ALTER TABLE [RecursosHumanos].[AusenciasJustificadas] CHECK CONSTRAINT [Empleado_AusenciasJustificadasS_FK]
GO
ALTER TABLE [RecursosHumanos].[Ciudades]  WITH CHECK ADD  CONSTRAINT [Estados_Ciudades_FK] FOREIGN KEY([idEstado])
REFERENCES [RecursosHumanos].[Estados] ([idEstado])
GO
ALTER TABLE [RecursosHumanos].[Ciudades] CHECK CONSTRAINT [Estados_Ciudades_FK]
GO
ALTER TABLE [RecursosHumanos].[DocumentacionEmpleado]  WITH CHECK ADD  CONSTRAINT [Empleado_DocumentacionEmpleado_FK] FOREIGN KEY([idEmpleado])
REFERENCES [RecursosHumanos].[Empleados] ([idEmpleado])
GO
ALTER TABLE [RecursosHumanos].[DocumentacionEmpleado] CHECK CONSTRAINT [Empleado_DocumentacionEmpleado_FK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [Ciudades_Empleados_FK] FOREIGN KEY([idCiudad])
REFERENCES [RecursosHumanos].[Ciudades] ([idCiudad])
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [Ciudades_Empleados_FK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [Departamentos_Empleados_FK] FOREIGN KEY([idDepartamento])
REFERENCES [RecursosHumanos].[Departamentos] ([idDepartamento])
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [Departamentos_Empleados_FK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [Puestos_Empleados_FK] FOREIGN KEY([idPuesto])
REFERENCES [RecursosHumanos].[Puestos] ([idPuesto])
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [Puestos_Empleados_FK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [Sucursales_Empleados_FK] FOREIGN KEY([idSucursal])
REFERENCES [Compras].[Sucursales] ([idSucursal])
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [Sucursales_Empleados_FK]
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos]  WITH CHECK ADD  CONSTRAINT [Departamentos_HistorialPuestos] FOREIGN KEY([idDepartamento])
REFERENCES [RecursosHumanos].[Departamentos] ([idDepartamento])
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos] CHECK CONSTRAINT [Departamentos_HistorialPuestos]
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos]  WITH CHECK ADD  CONSTRAINT [Empleado_HistorialPuestos_FK] FOREIGN KEY([idEmpleado])
REFERENCES [RecursosHumanos].[Empleados] ([idEmpleado])
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos] CHECK CONSTRAINT [Empleado_HistorialPuestos_FK]
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos]  WITH CHECK ADD  CONSTRAINT [Puestos_HistorialPuestos_FK] FOREIGN KEY([idPuesto])
REFERENCES [RecursosHumanos].[Puestos] ([idPuesto])
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos] CHECK CONSTRAINT [Puestos_HistorialPuestos_FK]
GO
ALTER TABLE [RecursosHumanos].[Horarios]  WITH CHECK ADD  CONSTRAINT [Empleados_Horarios_FK] FOREIGN KEY([idEmpleado])
REFERENCES [RecursosHumanos].[Empleados] ([idEmpleado])
GO
ALTER TABLE [RecursosHumanos].[Horarios] CHECK CONSTRAINT [Empleados_Horarios_FK]
GO
ALTER TABLE [RecursosHumanos].[Incapacidades]  WITH CHECK ADD  CONSTRAINT [Empleados_Incapacidades_FK] FOREIGN KEY([idEmpleado])
REFERENCES [RecursosHumanos].[Empleados] ([idEmpleado])
GO
ALTER TABLE [RecursosHumanos].[Incapacidades] CHECK CONSTRAINT [Empleados_Incapacidades_FK]
GO
ALTER TABLE [RecursosHumanos].[Nominas]  WITH CHECK ADD  CONSTRAINT [Empleado_Nominas_FK] FOREIGN KEY([idEmpleado])
REFERENCES [RecursosHumanos].[Empleados] ([idEmpleado])
GO
ALTER TABLE [RecursosHumanos].[Nominas] CHECK CONSTRAINT [Empleado_Nominas_FK]
GO
ALTER TABLE [RecursosHumanos].[Nominas]  WITH CHECK ADD  CONSTRAINT [FormaPago_Nominas_FK] FOREIGN KEY([idFormaPago])
REFERENCES [RecursosHumanos].[FormasPago] ([idFormaPago])
GO
ALTER TABLE [RecursosHumanos].[Nominas] CHECK CONSTRAINT [FormaPago_Nominas_FK]
GO
ALTER TABLE [RecursosHumanos].[NominasDeducciones]  WITH CHECK ADD  CONSTRAINT [Deducciones_NominasDeducciones_FK] FOREIGN KEY([idDeduccion])
REFERENCES [RecursosHumanos].[Deducciones] ([idDeduccion])
GO
ALTER TABLE [RecursosHumanos].[NominasDeducciones] CHECK CONSTRAINT [Deducciones_NominasDeducciones_FK]
GO
ALTER TABLE [RecursosHumanos].[NominasDeducciones]  WITH CHECK ADD  CONSTRAINT [Nomina_NominasDeducciones_FK] FOREIGN KEY([idNomina])
REFERENCES [RecursosHumanos].[Nominas] ([idNomina])
GO
ALTER TABLE [RecursosHumanos].[NominasDeducciones] CHECK CONSTRAINT [Nomina_NominasDeducciones_FK]
GO
ALTER TABLE [RecursosHumanos].[NominasPercepciones]  WITH CHECK ADD  CONSTRAINT [Nominas_NominasPercepciones_FK] FOREIGN KEY([idNomina])
REFERENCES [RecursosHumanos].[Nominas] ([idNomina])
GO
ALTER TABLE [RecursosHumanos].[NominasPercepciones] CHECK CONSTRAINT [Nominas_NominasPercepciones_FK]
GO
ALTER TABLE [RecursosHumanos].[NominasPercepciones]  WITH CHECK ADD  CONSTRAINT [Percepciones_NominasPercepciones_FK] FOREIGN KEY([idPercepcion])
REFERENCES [RecursosHumanos].[Percepciones] ([idPercepcion])
GO
ALTER TABLE [RecursosHumanos].[NominasPercepciones] CHECK CONSTRAINT [Percepciones_NominasPercepciones_FK]
GO
ALTER TABLE [Usuarios].[Usuarios]  WITH CHECK ADD  CONSTRAINT [Empleado_Usuarios_FK] FOREIGN KEY([idEmpleado])
REFERENCES [RecursosHumanos].[Empleados] ([idEmpleado])
GO
ALTER TABLE [Usuarios].[Usuarios] CHECK CONSTRAINT [Empleado_Usuarios_FK]
GO
ALTER TABLE [Usuarios].[Usuarios]  WITH CHECK ADD  CONSTRAINT [TiposUsuario_Usuario_FK] FOREIGN KEY([idTipoUsuario])
REFERENCES [Usuarios].[TiposUsuario] ([idTipoUsuario])
GO
ALTER TABLE [Usuarios].[Usuarios] CHECK CONSTRAINT [TiposUsuario_Usuario_FK]
GO
ALTER TABLE [Ventas].[Clientes]  WITH CHECK ADD  CONSTRAINT [Ciudad_Clientes_FK] FOREIGN KEY([idCiudad])
REFERENCES [RecursosHumanos].[Ciudades] ([idCiudad])
GO
ALTER TABLE [Ventas].[Clientes] CHECK CONSTRAINT [Ciudad_Clientes_FK]
GO
ALTER TABLE [Ventas].[ClientesCultivos]  WITH CHECK ADD  CONSTRAINT [Ciudades_ClientesCultivos_FK] FOREIGN KEY([idCiudad])
REFERENCES [RecursosHumanos].[Ciudades] ([idCiudad])
GO
ALTER TABLE [Ventas].[ClientesCultivos] CHECK CONSTRAINT [Ciudades_ClientesCultivos_FK]
GO
ALTER TABLE [Ventas].[ClientesCultivos]  WITH CHECK ADD  CONSTRAINT [Cliente_ClientesCultivos_FK] FOREIGN KEY([idCliente])
REFERENCES [Ventas].[Clientes] ([idCliente])
GO
ALTER TABLE [Ventas].[ClientesCultivos] CHECK CONSTRAINT [Cliente_ClientesCultivos_FK]
GO
ALTER TABLE [Ventas].[ClientesCultivos]  WITH CHECK ADD  CONSTRAINT [Cultivos_ClientesCultivos_FK] FOREIGN KEY([idCultivo])
REFERENCES [Ventas].[Cultivos] ([idCultivo])
GO
ALTER TABLE [Ventas].[ClientesCultivos] CHECK CONSTRAINT [Cultivos_ClientesCultivos_FK]
GO
ALTER TABLE [Ventas].[Cobros]  WITH CHECK ADD  CONSTRAINT [FormasPago_Cobros_FK] FOREIGN KEY([idFormaPago])
REFERENCES [RecursosHumanos].[FormasPago] ([idFormaPago])
GO
ALTER TABLE [Ventas].[Cobros] CHECK CONSTRAINT [FormasPago_Cobros_FK]
GO
ALTER TABLE [Ventas].[Cobros]  WITH CHECK ADD  CONSTRAINT [Venta_Cobros_FK] FOREIGN KEY([idVenta])
REFERENCES [Ventas].[Ventas] ([idVenta])
GO
ALTER TABLE [Ventas].[Cobros] CHECK CONSTRAINT [Venta_Cobros_FK]
GO
ALTER TABLE [Ventas].[Envios]  WITH CHECK ADD  CONSTRAINT [Ciudades_Envios_FK] FOREIGN KEY([idCiudad])
REFERENCES [RecursosHumanos].[Ciudades] ([idCiudad])
GO
ALTER TABLE [Ventas].[Envios] CHECK CONSTRAINT [Ciudades_Envios_FK]
GO
ALTER TABLE [Ventas].[Envios]  WITH CHECK ADD  CONSTRAINT [UnidadesTransporte_Envios_FK] FOREIGN KEY([idUnidadTransporte])
REFERENCES [Ventas].[UnidadesTransporte] ([idUnidadTransporte])
GO
ALTER TABLE [Ventas].[Envios] CHECK CONSTRAINT [UnidadesTransporte_Envios_FK]
GO
ALTER TABLE [Ventas].[Envios]  WITH CHECK ADD  CONSTRAINT [Ventas_Envios_FK] FOREIGN KEY([idVenta])
REFERENCES [Ventas].[Ventas] ([idVenta])
GO
ALTER TABLE [Ventas].[Envios] CHECK CONSTRAINT [Ventas_Envios_FK]
GO
ALTER TABLE [Ventas].[Facturas]  WITH CHECK ADD  CONSTRAINT [Ventas_Facturas_FK] FOREIGN KEY([idVenta])
REFERENCES [Ventas].[Ventas] ([idVenta])
GO
ALTER TABLE [Ventas].[Facturas] CHECK CONSTRAINT [Ventas_Facturas_FK]
GO
ALTER TABLE [Ventas].[Matenimientos]  WITH CHECK ADD  CONSTRAINT [UnidadTransporte_Mantenimiento] FOREIGN KEY([idUnidadTransporte])
REFERENCES [Ventas].[UnidadesTransporte] ([idUnidadTransporte])
GO
ALTER TABLE [Ventas].[Matenimientos] CHECK CONSTRAINT [UnidadTransporte_Mantenimiento]
GO
ALTER TABLE [Ventas].[Miembros]  WITH CHECK ADD  CONSTRAINT [Asociaciones_Miembros_FK] FOREIGN KEY([idAsociacion])
REFERENCES [Ventas].[Asociaciones] ([idAsociacion])
GO
ALTER TABLE [Ventas].[Miembros] CHECK CONSTRAINT [Asociaciones_Miembros_FK]
GO
ALTER TABLE [Ventas].[Miembros]  WITH CHECK ADD  CONSTRAINT [Clientes_Miembros_FK] FOREIGN KEY([idCliente])
REFERENCES [Ventas].[Clientes] ([idCliente])
GO
ALTER TABLE [Ventas].[Miembros] CHECK CONSTRAINT [Clientes_Miembros_FK]
GO
ALTER TABLE [Ventas].[Ofertas]  WITH CHECK ADD  CONSTRAINT [Productos_Ofertas_FK] FOREIGN KEY([idProducto])
REFERENCES [Compras].[Productos] ([idProducto])
GO
ALTER TABLE [Ventas].[Ofertas] CHECK CONSTRAINT [Productos_Ofertas_FK]
GO
ALTER TABLE [Ventas].[OfertasAsociacion]  WITH CHECK ADD  CONSTRAINT [Asociaciones_OfertasAsociacion_FK] FOREIGN KEY([idAsociacion])
REFERENCES [Ventas].[Asociaciones] ([idAsociacion])
GO
ALTER TABLE [Ventas].[OfertasAsociacion] CHECK CONSTRAINT [Asociaciones_OfertasAsociacion_FK]
GO
ALTER TABLE [Ventas].[OfertasAsociacion]  WITH CHECK ADD  CONSTRAINT [Ofertas_OfertasAsociacion_FK] FOREIGN KEY([idOferta])
REFERENCES [Ventas].[Ofertas] ([idOferta])
GO
ALTER TABLE [Ventas].[OfertasAsociacion] CHECK CONSTRAINT [Ofertas_OfertasAsociacion_FK]
GO
ALTER TABLE [Ventas].[Tripulacion]  WITH CHECK ADD  CONSTRAINT [Empleados_Tripulacion_FK] FOREIGN KEY([idEmpleado])
REFERENCES [RecursosHumanos].[Empleados] ([idEmpleado])
GO
ALTER TABLE [Ventas].[Tripulacion] CHECK CONSTRAINT [Empleados_Tripulacion_FK]
GO
ALTER TABLE [Ventas].[Tripulacion]  WITH CHECK ADD  CONSTRAINT [Envios_Tripulacion_FK] FOREIGN KEY([idEnvio])
REFERENCES [Ventas].[Envios] ([idEnvio])
GO
ALTER TABLE [Ventas].[Tripulacion] CHECK CONSTRAINT [Envios_Tripulacion_FK]
GO
ALTER TABLE [Ventas].[Ventas]  WITH CHECK ADD  CONSTRAINT [Cliente_Ventas_FK] FOREIGN KEY([idCliente])
REFERENCES [Ventas].[Clientes] ([idCliente])
GO
ALTER TABLE [Ventas].[Ventas] CHECK CONSTRAINT [Cliente_Ventas_FK]
GO
ALTER TABLE [Ventas].[Ventas]  WITH CHECK ADD  CONSTRAINT [Empleados_Ventas_FK] FOREIGN KEY([idEmpleado])
REFERENCES [RecursosHumanos].[Empleados] ([idEmpleado])
GO
ALTER TABLE [Ventas].[Ventas] CHECK CONSTRAINT [Empleados_Ventas_FK]
GO
ALTER TABLE [Ventas].[Ventas]  WITH CHECK ADD  CONSTRAINT [Sucursal_Ventas_FK] FOREIGN KEY([idSucursal])
REFERENCES [Compras].[Sucursales] ([idSucursal])
GO
ALTER TABLE [Ventas].[Ventas] CHECK CONSTRAINT [Sucursal_Ventas_FK]
GO
ALTER TABLE [Ventas].[VentasDetalle]  WITH CHECK ADD  CONSTRAINT [PresentacionProductos_VentasDetalle] FOREIGN KEY([idPresentacion])
REFERENCES [Compras].[PresentacionesProducto] ([idPresentacion])
GO
ALTER TABLE [Ventas].[VentasDetalle] CHECK CONSTRAINT [PresentacionProductos_VentasDetalle]
GO
ALTER TABLE [Ventas].[VentasDetalle]  WITH CHECK ADD  CONSTRAINT [Venta_VentasDetalle_FK] FOREIGN KEY([idVenta])
REFERENCES [Ventas].[Ventas] ([idVenta])
GO
ALTER TABLE [Ventas].[VentasDetalle] CHECK CONSTRAINT [Venta_VentasDetalle_FK]
GO
ALTER TABLE [Ventas].[Visitas]  WITH CHECK ADD  CONSTRAINT [ClienteCultivo_Visitas_FK] FOREIGN KEY([idClienteCultivo])
REFERENCES [Ventas].[ClientesCultivos] ([idClienteCultivo])
GO
ALTER TABLE [Ventas].[Visitas] CHECK CONSTRAINT [ClienteCultivo_Visitas_FK]
GO
ALTER TABLE [Ventas].[Visitas]  WITH CHECK ADD  CONSTRAINT [Empleado_Visitas_FK] FOREIGN KEY([idEmpleado])
REFERENCES [RecursosHumanos].[Empleados] ([idEmpleado])
GO
ALTER TABLE [Ventas].[Visitas] CHECK CONSTRAINT [Empleado_Visitas_FK]
GO
ALTER TABLE [Ventas].[Visitas]  WITH CHECK ADD  CONSTRAINT [UnidadesTransporte_Visitas_FK] FOREIGN KEY([idUnidadTransporte])
REFERENCES [Ventas].[UnidadesTransporte] ([idUnidadTransporte])
GO
ALTER TABLE [Ventas].[Visitas] CHECK CONSTRAINT [UnidadesTransporte_Visitas_FK]
GO
ALTER TABLE [RecursosHumanos].[AusenciasJustificadas]  WITH CHECK ADD  CONSTRAINT [RH_AusenciasJustificadas_fechaInicioFin_CHK] CHECK  (([fechaFin]>[fechaInicio]))
GO
ALTER TABLE [RecursosHumanos].[AusenciasJustificadas] CHECK CONSTRAINT [RH_AusenciasJustificadas_fechaInicioFin_CHK]
GO
ALTER TABLE [RecursosHumanos].[AusenciasJustificadas]  WITH CHECK ADD  CONSTRAINT [RH_AusenciasJustificadas_fechaSolicitud_CHK] CHECK  (([fechaSolicitud]<=[fechaInicio]))
GO
ALTER TABLE [RecursosHumanos].[AusenciasJustificadas] CHECK CONSTRAINT [RH_AusenciasJustificadas_fechaSolicitud_CHK]
GO
ALTER TABLE [RecursosHumanos].[AusenciasJustificadas]  WITH CHECK ADD  CONSTRAINT [RH_AusenciasJustificadas_idAusencia_CHK] CHECK  (([idAusencia]>(0)))
GO
ALTER TABLE [RecursosHumanos].[AusenciasJustificadas] CHECK CONSTRAINT [RH_AusenciasJustificadas_idAusencia_CHK]
GO
ALTER TABLE [RecursosHumanos].[AusenciasJustificadas]  WITH CHECK ADD  CONSTRAINT [RH_AusenciasJustificadas_idEmpleadoA_CHK] CHECK  (([idEmpleadoA]>(0)))
GO
ALTER TABLE [RecursosHumanos].[AusenciasJustificadas] CHECK CONSTRAINT [RH_AusenciasJustificadas_idEmpleadoA_CHK]
GO
ALTER TABLE [RecursosHumanos].[AusenciasJustificadas]  WITH CHECK ADD  CONSTRAINT [RH_AusenciasJustificadas_idEmpleadoS_CHK] CHECK  (([idEmpleadoS]>(0)))
GO
ALTER TABLE [RecursosHumanos].[AusenciasJustificadas] CHECK CONSTRAINT [RH_AusenciasJustificadas_idEmpleadoS_CHK]
GO
ALTER TABLE [RecursosHumanos].[Ciudades]  WITH CHECK ADD  CONSTRAINT [RH_Ciudades_estatus_CHK] CHECK  (([estatus]='B' OR [estatus]='A'))
GO
ALTER TABLE [RecursosHumanos].[Ciudades] CHECK CONSTRAINT [RH_Ciudades_estatus_CHK]
GO
ALTER TABLE [RecursosHumanos].[Ciudades]  WITH CHECK ADD  CONSTRAINT [RH_Ciudades_idCiudad_CHK] CHECK  (([idCiudad]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Ciudades] CHECK CONSTRAINT [RH_Ciudades_idCiudad_CHK]
GO
ALTER TABLE [RecursosHumanos].[Ciudades]  WITH CHECK ADD  CONSTRAINT [RH_Ciudades_idEstado_CHK] CHECK  (([idEstado]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Ciudades] CHECK CONSTRAINT [RH_Ciudades_idEstado_CHK]
GO
ALTER TABLE [RecursosHumanos].[Deducciones]  WITH CHECK ADD  CONSTRAINT [RH_Deducciones_idDeduccion_CHK] CHECK  (([idDeduccion]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Deducciones] CHECK CONSTRAINT [RH_Deducciones_idDeduccion_CHK]
GO
ALTER TABLE [RecursosHumanos].[Deducciones]  WITH CHECK ADD  CONSTRAINT [RH_Deducciones_porcentaje_CHK] CHECK  (([porcentaje]>=(0.0) AND [porcentaje]<=(100.0)))
GO
ALTER TABLE [RecursosHumanos].[Deducciones] CHECK CONSTRAINT [RH_Deducciones_porcentaje_CHK]
GO
ALTER TABLE [RecursosHumanos].[Departamentos]  WITH CHECK ADD  CONSTRAINT [RH_Departamentos_estatus_CHK] CHECK  (([estatus]='B' OR [estatus]='A'))
GO
ALTER TABLE [RecursosHumanos].[Departamentos] CHECK CONSTRAINT [RH_Departamentos_estatus_CHK]
GO
ALTER TABLE [RecursosHumanos].[Departamentos]  WITH CHECK ADD  CONSTRAINT [RH_Departamentos_idDepartamento_CHK] CHECK  (([idDepartamento]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Departamentos] CHECK CONSTRAINT [RH_Departamentos_idDepartamento_CHK]
GO
ALTER TABLE [RecursosHumanos].[DocumentacionEmpleado]  WITH CHECK ADD  CONSTRAINT [RH_DocumentacionEmpleado_idDocumento_CHK] CHECK  (([idDocumento]>(0)))
GO
ALTER TABLE [RecursosHumanos].[DocumentacionEmpleado] CHECK CONSTRAINT [RH_DocumentacionEmpleado_idDocumento_CHK]
GO
ALTER TABLE [RecursosHumanos].[DocumentacionEmpleado]  WITH CHECK ADD  CONSTRAINT [RH_DocumentacionEmpleado_idEmpleado_CHK] CHECK  (([idEmpleado]>(0)))
GO
ALTER TABLE [RecursosHumanos].[DocumentacionEmpleado] CHECK CONSTRAINT [RH_DocumentacionEmpleado_idEmpleado_CHK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [RH_Empleados_codigoPostal_CHK] CHECK  (([codigoPostal] like '[0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [RH_Empleados_codigoPostal_CHK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [RH_Empleados_diasPermiso_CHK] CHECK  (([diasPermiso]>=(0)))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [RH_Empleados_diasPermiso_CHK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [RH_Empleados_diasVacacionales_CHK] CHECK  (([diasVacacionales]>=(0)))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [RH_Empleados_diasVacacionales_CHK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [RH_Empleados_estatus_CHK] CHECK  (([estatus]='B' OR [estatus]='A'))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [RH_Empleados_estatus_CHK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [RH_Empleados_fechaContratacion_CHK] CHECK  (([fechaContratacion]>[fechaNacimiento] AND getdate()>=[fechaContratacion]))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [RH_Empleados_fechaContratacion_CHK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [RH_Empleados_fechaNacimiento_CHK] CHECK  ((getdate()>[fechaNacimiento]))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [RH_Empleados_fechaNacimiento_CHK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [RH_Empleados_idCiudad_CHK] CHECK  (([idCiudad]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [RH_Empleados_idCiudad_CHK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [RH_Empleados_idDepartamento_CHK] CHECK  (([idDepartamento]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [RH_Empleados_idDepartamento_CHK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [RH_Empleados_idEmpleado_CHK] CHECK  (([idEmpleado]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [RH_Empleados_idEmpleado_CHK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [RH_Empleados_idPuesto_CHK] CHECK  (([idPuesto]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [RH_Empleados_idPuesto_CHK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [RH_Empleados_idSucursal_CHK] CHECK  (([idSucursal]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [RH_Empleados_idSucursal_CHK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [RH_Empleados_porcentajeComision_CHK] CHECK  (([porcentajeComision]>=(0.0) AND [porcentajeComision]<=(100.0)))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [RH_Empleados_porcentajeComision_CHK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [RH_Empleados_salario_CHK] CHECK  (([salario]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [RH_Empleados_salario_CHK]
GO
ALTER TABLE [RecursosHumanos].[Empleados]  WITH CHECK ADD  CONSTRAINT [RH_Empleados_sexo_CHK] CHECK  (([sexo]='M' OR [sexo]='H'))
GO
ALTER TABLE [RecursosHumanos].[Empleados] CHECK CONSTRAINT [RH_Empleados_sexo_CHK]
GO
ALTER TABLE [RecursosHumanos].[Estados]  WITH CHECK ADD  CONSTRAINT [RH_Estados_estatus_CHK] CHECK  (([estatus]='B' OR [estatus]='A'))
GO
ALTER TABLE [RecursosHumanos].[Estados] CHECK CONSTRAINT [RH_Estados_estatus_CHK]
GO
ALTER TABLE [RecursosHumanos].[Estados]  WITH CHECK ADD  CONSTRAINT [RH_Estados_idEstado_CHK] CHECK  (([idEstado]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Estados] CHECK CONSTRAINT [RH_Estados_idEstado_CHK]
GO
ALTER TABLE [RecursosHumanos].[FormasPago]  WITH CHECK ADD  CONSTRAINT [RH_FormasPago_estatus_CHK] CHECK  (([estatus]='B' OR [estatus]='A'))
GO
ALTER TABLE [RecursosHumanos].[FormasPago] CHECK CONSTRAINT [RH_FormasPago_estatus_CHK]
GO
ALTER TABLE [RecursosHumanos].[FormasPago]  WITH CHECK ADD  CONSTRAINT [RH_FormasPago_idFormasPago_CHK] CHECK  (([idFormaPago]>(0)))
GO
ALTER TABLE [RecursosHumanos].[FormasPago] CHECK CONSTRAINT [RH_FormasPago_idFormasPago_CHK]
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos]  WITH CHECK ADD  CONSTRAINT [RH_HistorialPuestos_fechaInicioFin_CHK] CHECK  (([fechaInicio]<[fechaFin]))
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos] CHECK CONSTRAINT [RH_HistorialPuestos_fechaInicioFin_CHK]
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos]  WITH CHECK ADD  CONSTRAINT [RH_HistorialPuestos_idDepartamento_CHK] CHECK  (([idDepartamento]>(0)))
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos] CHECK CONSTRAINT [RH_HistorialPuestos_idDepartamento_CHK]
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos]  WITH CHECK ADD  CONSTRAINT [RH_HistorialPuestos_idEmpleado_CHK] CHECK  (([idEmpleado]>(0)))
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos] CHECK CONSTRAINT [RH_HistorialPuestos_idEmpleado_CHK]
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos]  WITH CHECK ADD  CONSTRAINT [RH_HistorialPuestos_idPuesto_CHK] CHECK  (([idPuesto]>(0)))
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos] CHECK CONSTRAINT [RH_HistorialPuestos_idPuesto_CHK]
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos]  WITH CHECK ADD  CONSTRAINT [RH_HistorialPuestos_salario_CHK] CHECK  (([salario]>(0.0)))
GO
ALTER TABLE [RecursosHumanos].[HistorialPuestos] CHECK CONSTRAINT [RH_HistorialPuestos_salario_CHK]
GO
ALTER TABLE [RecursosHumanos].[Horarios]  WITH CHECK ADD  CONSTRAINT [RH_Horarios_horaInicioFin_CHK] CHECK  (([horaInicio]<[horaFin]))
GO
ALTER TABLE [RecursosHumanos].[Horarios] CHECK CONSTRAINT [RH_Horarios_horaInicioFin_CHK]
GO
ALTER TABLE [RecursosHumanos].[Horarios]  WITH CHECK ADD  CONSTRAINT [RH_Horarios_idEmpleado_CHK] CHECK  (([idEmpleado]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Horarios] CHECK CONSTRAINT [RH_Horarios_idEmpleado_CHK]
GO
ALTER TABLE [RecursosHumanos].[Horarios]  WITH CHECK ADD  CONSTRAINT [RH_Horarios_idHorario_CHK] CHECK  (([idHorario]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Horarios] CHECK CONSTRAINT [RH_Horarios_idHorario_CHK]
GO
ALTER TABLE [RecursosHumanos].[Incapacidades]  WITH CHECK ADD  CONSTRAINT [RH_Incapacidades_fechaInicioFin_CHK] CHECK  (([fechaInicio]<[fechaFin]))
GO
ALTER TABLE [RecursosHumanos].[Incapacidades] CHECK CONSTRAINT [RH_Incapacidades_fechaInicioFin_CHK]
GO
ALTER TABLE [RecursosHumanos].[Incapacidades]  WITH CHECK ADD  CONSTRAINT [RH_Incapacidades_idEmpleado_CHK] CHECK  (([idEmpleado]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Incapacidades] CHECK CONSTRAINT [RH_Incapacidades_idEmpleado_CHK]
GO
ALTER TABLE [RecursosHumanos].[Incapacidades]  WITH CHECK ADD  CONSTRAINT [RH_Incapacidades_idIncapacidad_CHK] CHECK  (([idIncapacidad]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Incapacidades] CHECK CONSTRAINT [RH_Incapacidades_idIncapacidad_CHK]
GO
ALTER TABLE [RecursosHumanos].[Nominas]  WITH CHECK ADD  CONSTRAINT [RH_Nominas_cantidadNeta_CHK] CHECK  (([cantidadNeta]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Nominas] CHECK CONSTRAINT [RH_Nominas_cantidadNeta_CHK]
GO
ALTER TABLE [RecursosHumanos].[Nominas]  WITH CHECK ADD  CONSTRAINT [RH_Nominas_diasTrabajados_CHK] CHECK  (([diasTrabajados]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Nominas] CHECK CONSTRAINT [RH_Nominas_diasTrabajados_CHK]
GO
ALTER TABLE [RecursosHumanos].[Nominas]  WITH CHECK ADD  CONSTRAINT [RH_Nominas_faltas_CHK] CHECK  (([faltas]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Nominas] CHECK CONSTRAINT [RH_Nominas_faltas_CHK]
GO
ALTER TABLE [RecursosHumanos].[Nominas]  WITH CHECK ADD  CONSTRAINT [RH_Nominas_fechaInicioFin_CHK] CHECK  (([fechaInicio]<[fechaFin]))
GO
ALTER TABLE [RecursosHumanos].[Nominas] CHECK CONSTRAINT [RH_Nominas_fechaInicioFin_CHK]
GO
ALTER TABLE [RecursosHumanos].[Nominas]  WITH CHECK ADD  CONSTRAINT [RH_Nominas_idEmpleado_CHK] CHECK  (([idEmpleado]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Nominas] CHECK CONSTRAINT [RH_Nominas_idEmpleado_CHK]
GO
ALTER TABLE [RecursosHumanos].[Nominas]  WITH CHECK ADD  CONSTRAINT [RH_Nominas_idFormaPago_CHK] CHECK  (([idFormaPago]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Nominas] CHECK CONSTRAINT [RH_Nominas_idFormaPago_CHK]
GO
ALTER TABLE [RecursosHumanos].[Nominas]  WITH CHECK ADD  CONSTRAINT [RH_Nominas_idNomina_CHK] CHECK  (([idNomina]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Nominas] CHECK CONSTRAINT [RH_Nominas_idNomina_CHK]
GO
ALTER TABLE [RecursosHumanos].[Nominas]  WITH CHECK ADD  CONSTRAINT [RH_Nominas_totalID_CHK] CHECK  (([totalID]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Nominas] CHECK CONSTRAINT [RH_Nominas_totalID_CHK]
GO
ALTER TABLE [RecursosHumanos].[Nominas]  WITH CHECK ADD  CONSTRAINT [RH_Nominas_totalIP_CHK] CHECK  (([totalIP]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Nominas] CHECK CONSTRAINT [RH_Nominas_totalIP_CHK]
GO
ALTER TABLE [RecursosHumanos].[NominasDeducciones]  WITH CHECK ADD  CONSTRAINT [RH_NominasDeducciones_idDeduccion_CHK] CHECK  (([idDeduccion]>(0)))
GO
ALTER TABLE [RecursosHumanos].[NominasDeducciones] CHECK CONSTRAINT [RH_NominasDeducciones_idDeduccion_CHK]
GO
ALTER TABLE [RecursosHumanos].[NominasDeducciones]  WITH CHECK ADD  CONSTRAINT [RH_NominasDeducciones_idNomina_CHK] CHECK  (([idNomina]>(0)))
GO
ALTER TABLE [RecursosHumanos].[NominasDeducciones] CHECK CONSTRAINT [RH_NominasDeducciones_idNomina_CHK]
GO
ALTER TABLE [RecursosHumanos].[NominasDeducciones]  WITH CHECK ADD  CONSTRAINT [RH_NominasDeducciones_importe_CHK] CHECK  (([importe]>(0)))
GO
ALTER TABLE [RecursosHumanos].[NominasDeducciones] CHECK CONSTRAINT [RH_NominasDeducciones_importe_CHK]
GO
ALTER TABLE [RecursosHumanos].[NominasPercepciones]  WITH CHECK ADD  CONSTRAINT [RH_NominasPercepciones_idNomina_CHK] CHECK  (([idNomina]>(0)))
GO
ALTER TABLE [RecursosHumanos].[NominasPercepciones] CHECK CONSTRAINT [RH_NominasPercepciones_idNomina_CHK]
GO
ALTER TABLE [RecursosHumanos].[NominasPercepciones]  WITH CHECK ADD  CONSTRAINT [RH_NominasPercepciones_idPercepcion_CHK] CHECK  (([idPercepcion]>(0)))
GO
ALTER TABLE [RecursosHumanos].[NominasPercepciones] CHECK CONSTRAINT [RH_NominasPercepciones_idPercepcion_CHK]
GO
ALTER TABLE [RecursosHumanos].[NominasPercepciones]  WITH CHECK ADD  CONSTRAINT [RH_NominasPercepciones_importe_CHK] CHECK  (([importe]>(0)))
GO
ALTER TABLE [RecursosHumanos].[NominasPercepciones] CHECK CONSTRAINT [RH_NominasPercepciones_importe_CHK]
GO
ALTER TABLE [RecursosHumanos].[Percepciones]  WITH CHECK ADD  CONSTRAINT [RH_Percepciones_diasPagar_CHK] CHECK  (([diasPagar]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Percepciones] CHECK CONSTRAINT [RH_Percepciones_diasPagar_CHK]
GO
ALTER TABLE [RecursosHumanos].[Percepciones]  WITH CHECK ADD  CONSTRAINT [RH_Percepciones_idPercepcion_CHK] CHECK  (([idPercepcion]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Percepciones] CHECK CONSTRAINT [RH_Percepciones_idPercepcion_CHK]
GO
ALTER TABLE [RecursosHumanos].[Puestos]  WITH CHECK ADD  CONSTRAINT [RH_Puestos_estatus_CHK] CHECK  (([estatus]='B' OR [estatus]='A'))
GO
ALTER TABLE [RecursosHumanos].[Puestos] CHECK CONSTRAINT [RH_Puestos_estatus_CHK]
GO
ALTER TABLE [RecursosHumanos].[Puestos]  WITH CHECK ADD  CONSTRAINT [RH_Puestos_idPuesto_CHK] CHECK  (([idPuesto]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Puestos] CHECK CONSTRAINT [RH_Puestos_idPuesto_CHK]
GO
ALTER TABLE [RecursosHumanos].[Puestos]  WITH CHECK ADD  CONSTRAINT [RH_Puestos_salarioMax_CHK] CHECK  (([salarioMaximo]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Puestos] CHECK CONSTRAINT [RH_Puestos_salarioMax_CHK]
GO
ALTER TABLE [RecursosHumanos].[Puestos]  WITH CHECK ADD  CONSTRAINT [RH_Puestos_salarioMin_CHK] CHECK  (([salarioMinimo]>(0)))
GO
ALTER TABLE [RecursosHumanos].[Puestos] CHECK CONSTRAINT [RH_Puestos_salarioMin_CHK]
GO
ALTER TABLE [RecursosHumanos].[Puestos]  WITH CHECK ADD  CONSTRAINT [RH_Puestos_salarioMinMax_CHK] CHECK  (([salarioMaximo]>=[salarioMinimo]))
GO
ALTER TABLE [RecursosHumanos].[Puestos] CHECK CONSTRAINT [RH_Puestos_salarioMinMax_CHK]
GO
ALTER TABLE [Usuarios].[TiposUsuario]  WITH CHECK ADD  CONSTRAINT [USR_TiposUsuario_estatus_CHK] CHECK  (([estatus]='B' OR [estatus]='A'))
GO
ALTER TABLE [Usuarios].[TiposUsuario] CHECK CONSTRAINT [USR_TiposUsuario_estatus_CHK]
GO
ALTER TABLE [Usuarios].[TiposUsuario]  WITH CHECK ADD  CONSTRAINT [USR_TiposUsuario_idTipoUsuario_CHK] CHECK  (([idTipoUsuario]>(0)))
GO
ALTER TABLE [Usuarios].[TiposUsuario] CHECK CONSTRAINT [USR_TiposUsuario_idTipoUsuario_CHK]
GO
ALTER TABLE [Usuarios].[Usuarios]  WITH CHECK ADD  CONSTRAINT [USR_Usuarios_email_CHK] CHECK  (([email] like '%@%.%'))
GO
ALTER TABLE [Usuarios].[Usuarios] CHECK CONSTRAINT [USR_Usuarios_email_CHK]
GO
ALTER TABLE [Usuarios].[Usuarios]  WITH CHECK ADD  CONSTRAINT [USR_Usuarios_estatus_CHK] CHECK  (([estatus]='B' OR [estatus]='A'))
GO
ALTER TABLE [Usuarios].[Usuarios] CHECK CONSTRAINT [USR_Usuarios_estatus_CHK]
GO
ALTER TABLE [Usuarios].[Usuarios]  WITH CHECK ADD  CONSTRAINT [USR_Usuarios_idEmpleado_CHK] CHECK  (([idEmpleado]>(0)))
GO
ALTER TABLE [Usuarios].[Usuarios] CHECK CONSTRAINT [USR_Usuarios_idEmpleado_CHK]
GO
ALTER TABLE [Usuarios].[Usuarios]  WITH CHECK ADD  CONSTRAINT [USR_Usuarios_idTipoUsuario_CHK] CHECK  (([idTipoUsuario]>(0)))
GO
ALTER TABLE [Usuarios].[Usuarios] CHECK CONSTRAINT [USR_Usuarios_idTipoUsuario_CHK]
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_addCity]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_addCity]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_addDeduction]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_addDeduction]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_addDep]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [RecursosHumanos].[sp_addDep]
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
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_addEmployee]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_addEmployee]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_addPerception]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_addPerception]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_addPuesto]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [RecursosHumanos].[sp_addPuesto]
@nombre varchar (60), @salarioMin float, @salarioMax float
as
declare @idpuesto int
begin try
	select @idpuesto= MAX(idPuesto)+1 from RecursosHumanos.Puestos
	if @idpuesto IS NULL
		set @idpuesto=1
	insert into RecursosHumanos.Puestos
	values (@idpuesto, @nombre, @salarioMin, @salarioMax, 'A')
end try
begin catch
	if @@ERROR > 0
		print 'Error:'+error_message()
end catch
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_addSchedule]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_addSchedule]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_addState]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_addState]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_deletePuestos]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_deletePuestos]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_empSchedules]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_empSchedules]
@emp INT, @exclude CHAR, @idHorario INT
AS
BEGIN TRY
	IF @exclude = 'N'
	BEGIN
		SELECT dias FROM RecursosHumanos.Horarios
		WHERE idEmpleado = @emp
	END
	ELSE
	BEGIN
		SELECT dias FROM RecursosHumanos.Horarios
		WHERE idEmpleado = @emp AND idHorario <> @idHorario
	END
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_existsDepto]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_existsDepto]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_existsPuesto]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [RecursosHumanos].[sp_existsPuesto]
@nombre varchar(60)
as
begin try
	select * from RecursosHumanos.Puestos where nombre = @nombre
end try
begin catch
	if @@ERROR > 0
		print 'Error:'+error_message()
end catch
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getCities]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_getCities]
AS
	SELECT C.idCiudad, C.nombre, C.idEstado, E.nombre AS edo, C.estatus
	FROM RecursosHumanos.Ciudades C JOIN RecursosHumanos.Estados E
	ON C.idEstado = E.idEstado
	WHERE C.estatus = 'A'
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getDeductions]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_getDeductions]
AS
	SELECT * FROM RecursosHumanos.Deducciones
	WHERE estatus = 'A'
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getDep]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [RecursosHumanos].[sp_getDep]
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
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getDeptN]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_getDeptN]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getDeptos]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_getDeptos]
AS
BEGIN TRY
	SELECT idDepartamento, nombre FROM RecursosHumanos.Departamentos
	WHERE estatus = 'A'
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getEmployee]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_getEmployee]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getEmployees]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_getEmployees]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getPerceptions]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_getPerceptions]
AS
	SELECT * FROM RecursosHumanos.Percepciones
	WHERE estatus = 'A'
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getPuesto]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_getPuesto]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getPuestoN]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_getPuestoN]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getPuestos]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_getPuestos]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getSchedule]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_getSchedule]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getSchedules]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_getSchedules]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getSchedulesEmp]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_getSchedulesEmp]
@idEmp INT
AS
BEGIN TRY
	SELECT idHorario, CONVERT(VARCHAR(5), horaInicio, 108) AS hi, CONVERT(VARCHAR(5), horaFin, 108) AS hf, dias
	FROM RecursosHumanos.Horarios
	WHERE idEmpleado = @idEmp
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_getStates]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_getStates]
AS
	SELECT * FROM RecursosHumanos.Estados
	WHERE estatus = 'A'
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_killCity]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_killCity]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_killDeduction]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_killDeduction]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_killDep]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_killDep]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_killEmployee]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_killEmployee]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_killPerception]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_killPerception]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_killSchedule]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_killSchedule]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_killState]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_killState]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_listCities]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_listCities]
AS
	SELECT idCiudad, nombre FROM RecursosHumanos.Ciudades
	WHERE estatus = 'A'
	ORDER BY nombre
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_listDep]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_listDep]
AS
	SELECT idDepartamento, nombre FROM RecursosHumanos.Departamentos
	WHERE estatus = 'A'
	ORDER BY nombre
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_listEmployees]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_listEmployees]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_listPos]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_listPos]
AS
	SELECT idPuesto, nombre FROM RecursosHumanos.Puestos
	WHERE estatus = 'A'
	ORDER BY nombre
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_listStates]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_listStates]
AS
	SELECT idEstado, nombre FROM RecursosHumanos.Estados
	WHERE estatus = 'A'
	ORDER BY nombre
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_listSuc]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_listSuc]
AS
	SELECT idSucursal, nombre FROM Compras.Sucursales
	WHERE estatus = 'A'
	ORDER BY nombre
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_nextCity]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_nextCity]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_nextDeduction]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_nextDeduction]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_nextDepto]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [RecursosHumanos].[sp_nextDepto]
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
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_nextEmployee]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_nextEmployee]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_nextPerception]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_nextPerception]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_nextPuesto]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [RecursosHumanos].[sp_nextPuesto]
as
declare @idpuesto int
begin try
	SELECT @idpuesto = MAX(idPuesto) + 1 FROM RecursosHumanos.Puestos
	IF @idpuesto IS NULL
		SET @idpuesto = 1
	SELECT @idpuesto AS sigPuesto
end try
begin catch
	if @@ERROR > 0
		print 'Error:'+error_message()
end catch
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_nextSchedule]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_nextSchedule]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_nextState]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_nextState]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_salaryRank]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_salaryRank]
@idPuesto INT
AS
BEGIN TRY
	SELECT salarioMinimo, salarioMaximo FROM RecursosHumanos.Puestos
	WHERE idPuesto = @idPuesto
END TRY
BEGIN CATCH
	PRINT 'SE PRODUJO UN ERROR: ' + ERROR_MESSAGE()
END CATCH
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_updateCity]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_updateCity]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_updateDeduction]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_updateDeduction]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_updateDep]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [RecursosHumanos].[sp_updateDep]
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
GO
/****** Object:  StoredProcedure [RecursosHumanos].[sp_updateEmployee]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_updateEmployee]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_updatePerception]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_updatePerception]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_updatePuesto]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_updatePuesto]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_updateSchedule]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Actualizar un horario
CREATE PROCEDURE [RecursosHumanos].[sp_updateSchedule]
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
/****** Object:  StoredProcedure [RecursosHumanos].[sp_updateState]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RecursosHumanos].[sp_updateState]
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
/****** Object:  StoredProcedure [Usuarios].[sp_existsUser]    Script Date: 22/10/2018 08:04:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Usuarios].[sp_existsUser]
@nombre VARCHAR(30), @password VARCHAR(20)
AS
DECLARE @existe INT
	SELECT E.nombre, E.apaterno, E.amaterno, U.estatus
	FROM Usuarios.Usuarios U JOIN RecursosHumanos.Empleados E
	ON U.idEmpleado = E.idEmpleado
	WHERE U.nombre = @nombre COLLATE Modern_Spanish_CS_AS
	AND U.contrasenia = @password COLLATE Modern_Spanish_CS_AS
GO
USE [master]
GO
ALTER DATABASE [AGROQUIMICA_ERP] SET  READ_WRITE 
GO
