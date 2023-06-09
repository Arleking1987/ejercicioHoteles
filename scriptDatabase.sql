USE [master]
GO
/****** Object:  Database [ejercicioHoteles]    Script Date: 21/03/2023 8:24:42 a. m. ******/
CREATE DATABASE [ejercicioHoteles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ejercicioHoteles', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ejercicioHoteles.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ejercicioHoteles_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ejercicioHoteles_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ejercicioHoteles] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ejercicioHoteles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ejercicioHoteles] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET ARITHABORT OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ejercicioHoteles] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ejercicioHoteles] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ejercicioHoteles] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ejercicioHoteles] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET RECOVERY FULL 
GO
ALTER DATABASE [ejercicioHoteles] SET  MULTI_USER 
GO
ALTER DATABASE [ejercicioHoteles] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ejercicioHoteles] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ejercicioHoteles] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ejercicioHoteles] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ejercicioHoteles] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ejercicioHoteles] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ejercicioHoteles', N'ON'
GO
ALTER DATABASE [ejercicioHoteles] SET QUERY_STORE = OFF
GO
USE [ejercicioHoteles]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 21/03/2023 8:24:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[cedula] [nvarchar](50) NULL,
	[telefono] [nvarchar](50) NULL,
	[direccion] [nvarchar](50) NULL,
	[ciudad] [nvarchar](50) NULL,
	[pais] [nvarchar](50) NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[habitaciones]    Script Date: 21/03/2023 8:24:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[habitaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[tipo] [nvarchar](50) NULL,
	[id_hotel] [int] NULL,
	[costo] [float] NULL,
	[habilitado] [nchar](1) NULL,
	[impuesto] [float] NULL,
 CONSTRAINT [PK_habitaciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoteles]    Script Date: 21/03/2023 8:24:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoteles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[direccion] [nvarchar](50) NULL,
	[region] [nvarchar](50) NULL,
	[pais] [nvarchar](50) NULL,
	[habitacionesTotales] [int] NULL,
	[habitacionesDisponibles] [int] NULL,
	[habilitado] [nchar](1) NULL,
 CONSTRAINT [PK_hoteles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservas]    Script Date: 21/03/2023 8:24:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fechaReserva] [date] NULL,
	[fechaEntrada] [date] NULL,
	[fechaSalida] [date] NULL,
	[costoReserva] [float] NULL,
	[valorImpuestos] [float] NULL,
	[id_habitacion] [int] NULL,
	[id_cliente] [int] NULL,
 CONSTRAINT [PK_reservas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[clientes] ([id], [nombre], [cedula], [telefono], [direccion], [ciudad], [pais]) VALUES (1, N'Yonhatan Ramirez Castillo', N'1036610203', N'3215613753', N'calle 33 #38-28', N'Itagui', N'Colombia')
INSERT [dbo].[clientes] ([id], [nombre], [cedula], [telefono], [direccion], [ciudad], [pais]) VALUES (5, N'Adriana Castillo', N'42770954', N'3015245859', N'calle 33 #38-28', N'itagui', N'Colombia')
INSERT [dbo].[clientes] ([id], [nombre], [cedula], [telefono], [direccion], [ciudad], [pais]) VALUES (1033652456, N'julieta ramirez', N'1033652456', N'3015242356', N'calle 33 #38-28', N'itagui', N'Colombia')
INSERT [dbo].[clientes] ([id], [nombre], [cedula], [telefono], [direccion], [ciudad], [pais]) VALUES (1033652556, N'Noah Ramirez', N'1033652556', N'3015242356', N'calle 33 #38-28', N'itagui', N'Colombia')
INSERT [dbo].[clientes] ([id], [nombre], [cedula], [telefono], [direccion], [ciudad], [pais]) VALUES (1037608244, N'Laura Gomez', N'1037608244', N'3015248586', N'calle 33 #38-28', N'itagui', N'Colombia')
GO
SET IDENTITY_INSERT [dbo].[habitaciones] ON 

INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (1, N'Castela', N'estandar king', 1, 700000, N'1', 50000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (2, N'lumbra', N'estandar twin', 1, 400000, N'1', 40000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (3, N'alambra', N'superior king', 1, 300000, N'1', 30000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (4, N'musa', N'junior suite', 1, 200000, N'1', 20000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (5, N'Castela2', N'estandar king', 2, 600000, N'1', 50000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (6, N'lumbra2', N'estandar twin', 2, 400000, N'1', 40000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (7, N'alambra2', N'superior king', 2, 300000, N'1', 30000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (8, N'musa2', N'junior suite', 2, 200000, N'1', 20000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (9, N'Castela3', N'estandar king', 3, 600000, N'1', 50000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (10, N'lumbra3', N'estandar twin', 3, 400000, N'1', 40000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (11, N'alambra3', N'superior king', 3, 300000, N'1', 30000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (12, N'musa', N'junior suite', 3, 200000, N'1', 20000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (13, N'Castela4', N'estandar king', 4, 600000, N'1', 50000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (14, N'lumbra4', N'estandar twin', 4, 400000, N'1', 40000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (15, N'alambra4', N'superior king', 4, 300000, N'1', 30000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (16, N'musa4', N'junior suite', 4, 200000, N'1', 20000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (17, N'Castela5', N'estandar king', 5, 600000, N'1', 50000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (18, N'lumbra5', N'estandar twin', 5, 400000, N'1', 40000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (19, N'alambra5', N'superior king', 5, 300000, N'1', 30000)
INSERT [dbo].[habitaciones] ([id], [nombre], [tipo], [id_hotel], [costo], [habilitado], [impuesto]) VALUES (20, N'musa5', N'junior suite', 5, 200000, N'1', 20000)
SET IDENTITY_INSERT [dbo].[habitaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[hoteles] ON 

INSERT [dbo].[hoteles] ([id], [nombre], [direccion], [region], [pais], [habitacionesTotales], [habitacionesDisponibles], [habilitado]) VALUES (1, N'Castellanos', N'calle falsa 123', N'Antioquia', N'Colombia', 5, 5, N'0')
INSERT [dbo].[hoteles] ([id], [nombre], [direccion], [region], [pais], [habitacionesTotales], [habitacionesDisponibles], [habilitado]) VALUES (2, N'Merlot', N'calle verdadera 456', N'Bogota', N'Colombia', 5, 5, N'1')
INSERT [dbo].[hoteles] ([id], [nombre], [direccion], [region], [pais], [habitacionesTotales], [habitacionesDisponibles], [habilitado]) VALUES (3, N'Almendros', N'calle 34 #37-36', N'Cartagena', N'Colombia', 5, 5, N'1')
INSERT [dbo].[hoteles] ([id], [nombre], [direccion], [region], [pais], [habitacionesTotales], [habitacionesDisponibles], [habilitado]) VALUES (4, N'Samaniego', N'calle 34 #37-36', N'Samaniego', N'Colombia', 5, 5, N'1')
INSERT [dbo].[hoteles] ([id], [nombre], [direccion], [region], [pais], [habitacionesTotales], [habitacionesDisponibles], [habilitado]) VALUES (5, N'Turin', N'calle 34 #37-36', N'San Andres', N'Colombia', 5, 5, N'1')
INSERT [dbo].[hoteles] ([id], [nombre], [direccion], [region], [pais], [habitacionesTotales], [habitacionesDisponibles], [habilitado]) VALUES (6, N'Escandinavo', N'Calle 45 #89-89', N'Cundinamarca', N'Colombia', 5, 5, N'0')
SET IDENTITY_INSERT [dbo].[hoteles] OFF
GO
SET IDENTITY_INSERT [dbo].[reservas] ON 

INSERT [dbo].[reservas] ([id], [fechaReserva], [fechaEntrada], [fechaSalida], [costoReserva], [valorImpuestos], [id_habitacion], [id_cliente]) VALUES (1, CAST(N'2023-03-13' AS Date), CAST(N'2023-03-24' AS Date), CAST(N'2023-03-30' AS Date), 1200000, 200000, 4, 1)
SET IDENTITY_INSERT [dbo].[reservas] OFF
GO
ALTER TABLE [dbo].[habitaciones]  WITH CHECK ADD  CONSTRAINT [FK_habitaciones_hoteles] FOREIGN KEY([id_hotel])
REFERENCES [dbo].[hoteles] ([id])
GO
ALTER TABLE [dbo].[habitaciones] CHECK CONSTRAINT [FK_habitaciones_hoteles]
GO
ALTER TABLE [dbo].[reservas]  WITH CHECK ADD  CONSTRAINT [FK_reservas_clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([id])
GO
ALTER TABLE [dbo].[reservas] CHECK CONSTRAINT [FK_reservas_clientes]
GO
ALTER TABLE [dbo].[reservas]  WITH CHECK ADD  CONSTRAINT [FK_reservas_habitaciones] FOREIGN KEY([id_habitacion])
REFERENCES [dbo].[habitaciones] ([id])
GO
ALTER TABLE [dbo].[reservas] CHECK CONSTRAINT [FK_reservas_habitaciones]
GO
USE [master]
GO
ALTER DATABASE [ejercicioHoteles] SET  READ_WRITE 
GO
