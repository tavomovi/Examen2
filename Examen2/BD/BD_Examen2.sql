USE [master]
GO
/****** Object:  Database [examen2]    Script Date: 20/11/2023 16:53:25 ******/
CREATE DATABASE [examen2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'examen2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\examen2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'examen2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\examen2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [examen2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [examen2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [examen2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [examen2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [examen2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [examen2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [examen2] SET ARITHABORT OFF 
GO
ALTER DATABASE [examen2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [examen2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [examen2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [examen2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [examen2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [examen2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [examen2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [examen2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [examen2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [examen2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [examen2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [examen2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [examen2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [examen2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [examen2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [examen2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [examen2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [examen2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [examen2] SET  MULTI_USER 
GO
ALTER DATABASE [examen2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [examen2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [examen2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [examen2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [examen2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [examen2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [examen2] SET QUERY_STORE = ON
GO
ALTER DATABASE [examen2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [examen2]
GO
/****** Object:  Table [dbo].[Asignaciones]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaciones](
	[AsignacionID] [int] IDENTITY(1,1) NOT NULL,
	[ReparacionID] [int] NULL,
	[TecnicoID] [int] NULL,
	[FechaAsignacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AsignacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesReparacion]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesReparacion](
	[DetalleID] [int] IDENTITY(1,1) NOT NULL,
	[ReparacionID] [int] NULL,
	[Descripcion] [varchar](50) NULL,
	[FechaInicio] [datetime] NULL,
	[FechaFin] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[EquipoID] [int] IDENTITY(1,1) NOT NULL,
	[TipoEquipo] [varchar](50) NOT NULL,
	[Modelo] [varchar](50) NULL,
	[UsuarioID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EquipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reparaciones]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reparaciones](
	[ReparacionID] [int] IDENTITY(1,1) NOT NULL,
	[EquipoID] [int] NULL,
	[FechaSolicitud] [datetime] NULL,
	[Estado] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReparacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tecnicos]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tecnicos](
	[TecnicoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Especialidad] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[TecnicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[CorreoElectronico] [varchar](50) NULL,
	[Telefono] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD  CONSTRAINT [fk_ReparacionID1] FOREIGN KEY([ReparacionID])
REFERENCES [dbo].[Reparaciones] ([ReparacionID])
GO
ALTER TABLE [dbo].[Asignaciones] CHECK CONSTRAINT [fk_ReparacionID1]
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD  CONSTRAINT [fk_TecnicoID] FOREIGN KEY([TecnicoID])
REFERENCES [dbo].[Tecnicos] ([TecnicoID])
GO
ALTER TABLE [dbo].[Asignaciones] CHECK CONSTRAINT [fk_TecnicoID]
GO
ALTER TABLE [dbo].[DetallesReparacion]  WITH CHECK ADD  CONSTRAINT [fk_ReparacionID] FOREIGN KEY([ReparacionID])
REFERENCES [dbo].[Reparaciones] ([ReparacionID])
GO
ALTER TABLE [dbo].[DetallesReparacion] CHECK CONSTRAINT [fk_ReparacionID]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [fk_UsusarioID] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [fk_UsusarioID]
GO
ALTER TABLE [dbo].[Reparaciones]  WITH CHECK ADD  CONSTRAINT [fk_EquipoID] FOREIGN KEY([EquipoID])
REFERENCES [dbo].[Equipos] ([EquipoID])
GO
ALTER TABLE [dbo].[Reparaciones] CHECK CONSTRAINT [fk_EquipoID]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEquipo]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ActualizarEquipo]
	@EquipoID int,
	@TipoEquipo varchar(50),
	@Modelo varchar(50),
	@UsuarioID int
As
Begin
update Equipos set TipoEquipo = @TipoEquipo, Modelo = @Modelo, UsuarioID=@UsuarioID where EquipoID = @EquipoID
End
GO
/****** Object:  StoredProcedure [dbo].[ActualizarTecnico]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ActualizarTecnico]
	@TecnicoID int,
	@Nombre varchar(50),
	@Especialidad varchar(20)
As
Begin
update Tecnicos set Nombre = @Nombre, Especialidad = @Especialidad where TecnicoID = @TecnicoID
End
GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ActualizarUsuario]
	@UsuarioID int,
	@Nombre varchar(50),
	@CorreoElectronico varchar(50),
	@Telefono varchar(15)
As
Begin
update Usuarios set Nombre = @Nombre, CorreoElectronico = @CorreoElectronico, Telefono=@Telefono where UsuarioID = @UsuarioID
End
GO
/****** Object:  StoredProcedure [dbo].[BorrarEquipo]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BorrarEquipo]
	@EquipoID int
As
Begin
Delete Equipos where EquipoID = @EquipoID
End
GO
/****** Object:  StoredProcedure [dbo].[BorrarTecnico]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BorrarTecnico]
	@TecnicoID int
As
Begin
Delete Tecnicos where TecnicoID = @TecnicoID
End
GO
/****** Object:  StoredProcedure [dbo].[BorrarUsuario]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[BorrarUsuario]
	@UsuarioID int
As
Begin
Delete Usuarios where UsuarioId = @UsuarioID
End
GO
/****** Object:  StoredProcedure [dbo].[ConsultarEquipo]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ConsultarEquipo]
As
Begin
Select*From Equipos
End
GO
/****** Object:  StoredProcedure [dbo].[ConsultarEquipoFiltro]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ConsultarEquipoFiltro]
	@EquipoID int
As
Begin
select * from Equipos where EquipoID = @EquipoID
End
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTecnicoFiltro]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ConsultarTecnicoFiltro]
	@TecnicoID int
As
Begin
select * from Tecnicos where TecnicoID = @TecnicoID
End
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTecnicos]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ConsultarTecnicos]
As
Begin
Select*From Tecnicos
End
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ConsultarUsuario]
As
Begin
Select*From Usuarios
End
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarioFiltro]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ConsultarUsuarioFiltro]
	@UsuarioID int
As
Begin
select * from Usuarios where UsuarioID = @UsuarioID
End
GO
/****** Object:  StoredProcedure [dbo].[IngresarEquipo]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[IngresarEquipo]
	@TipoEquipo varchar(50),
	@Modelo varchar(50),
	@UsuarioID int
AS
	Begin
	Insert into Equipos(TipoEquipo, Modelo,UsuarioID) Values (@TipoEquipo, @Modelo, @UsuarioID)
	End
GO
/****** Object:  StoredProcedure [dbo].[IngresarTecnico]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[IngresarTecnico]
	@Nombre varchar(50),
	@Especialidad varchar(20)
AS
	Begin
	Insert into Tecnicos(Nombre, Especialidad) Values (@Nombre, @Especialidad)
	End
GO
/****** Object:  StoredProcedure [dbo].[IngresarUsuario]    Script Date: 20/11/2023 16:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[IngresarUsuario]
	@Nombre varchar(50),
	@CorreoElectronico varchar(50),
	@Telefono varchar(15)
As
Begin
Insert into Usuarios(Nombre, CorreoElectronico, Telefono) Values (@Nombre, @CorreoElectronico, @Telefono)
End
GO
USE [master]
GO
ALTER DATABASE [examen2] SET  READ_WRITE 
GO
