USE [FIFA_DB]
GO
/****** Object:  Trigger [trg_update_rating]    Script Date: 07/06/2025 21:52:44 ******/
DROP TRIGGER [dbo].[trg_update_rating]
GO
/****** Object:  StoredProcedure [dbo].[sp_top5_semanal_por_posicion]    Script Date: 07/06/2025 21:52:44 ******/
DROP PROCEDURE [dbo].[sp_top5_semanal_por_posicion]
GO
/****** Object:  StoredProcedure [dbo].[sp_top_jugadores_por_habilidad]    Script Date: 07/06/2025 21:52:44 ******/
DROP PROCEDURE [dbo].[sp_top_jugadores_por_habilidad]
GO
/****** Object:  StoredProcedure [dbo].[sp_cambiar_club_jugador]    Script Date: 07/06/2025 21:52:44 ******/
DROP PROCEDURE [dbo].[sp_cambiar_club_jugador]
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_rating]    Script Date: 07/06/2025 21:52:44 ******/
DROP PROCEDURE [dbo].[sp_actualizar_rating]
GO
ALTER TABLE [dbo].[Jugador_Habilidad] DROP CONSTRAINT [CK__Jugador_H__valor__4CA06362]
GO
ALTER TABLE [dbo].[Evaluacion] DROP CONSTRAINT [CK__Evaluacio__punta__45F365D3]
GO
ALTER TABLE [dbo].[Jugador_Posicion] DROP CONSTRAINT [fk_jugador_posicion_posicion]
GO
ALTER TABLE [dbo].[Jugador_Posicion] DROP CONSTRAINT [fk_jugador_posicion_jugador]
GO
ALTER TABLE [dbo].[Jugador_Habilidad] DROP CONSTRAINT [fk_jugador_habilidad_jugador]
GO
ALTER TABLE [dbo].[Jugador_Habilidad] DROP CONSTRAINT [fk_jugador_habilidad_habilidad]
GO
ALTER TABLE [dbo].[Jugador] DROP CONSTRAINT [fk_jugador_nacionalidad]
GO
ALTER TABLE [dbo].[Jugador] DROP CONSTRAINT [fk_jugador_club]
GO
ALTER TABLE [dbo].[Historial_Clubes] DROP CONSTRAINT [fk_historial_jugador]
GO
ALTER TABLE [dbo].[Historial_Clubes] DROP CONSTRAINT [fk_historial_club]
GO
ALTER TABLE [dbo].[Evaluacion] DROP CONSTRAINT [fk_evaluacion_posicion]
GO
ALTER TABLE [dbo].[Evaluacion] DROP CONSTRAINT [fk_evaluacion_jugador]
GO
ALTER TABLE [dbo].[Jugador] DROP CONSTRAINT [DF__Jugador__retirad__3B75D760]
GO
ALTER TABLE [dbo].[auditoria_evaluacion] DROP CONSTRAINT [DF__auditoria__fecha__5629CD9C]
GO
/****** Object:  Table [dbo].[auditoria_evaluacion]    Script Date: 07/06/2025 21:52:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auditoria_evaluacion]') AND type in (N'U'))
DROP TABLE [dbo].[auditoria_evaluacion]
GO
/****** Object:  View [dbo].[vw_historial_clubes_jugador]    Script Date: 07/06/2025 21:52:44 ******/
DROP VIEW [dbo].[vw_historial_clubes_jugador]
GO
/****** Object:  View [dbo].[vw_habilidades_jugador]    Script Date: 07/06/2025 21:52:44 ******/
DROP VIEW [dbo].[vw_habilidades_jugador]
GO
/****** Object:  View [dbo].[vw_evaluaciones_jugador]    Script Date: 07/06/2025 21:52:44 ******/
DROP VIEW [dbo].[vw_evaluaciones_jugador]
GO
/****** Object:  View [dbo].[vw_info_completa_jugador]    Script Date: 07/06/2025 21:52:44 ******/
DROP VIEW [dbo].[vw_info_completa_jugador]
GO
/****** Object:  View [dbo].[vw_jugadores_libres]    Script Date: 07/06/2025 21:52:44 ******/
DROP VIEW [dbo].[vw_jugadores_libres]
GO
/****** Object:  View [dbo].[vw_top5_por_posicion]    Script Date: 07/06/2025 21:52:44 ******/
DROP VIEW [dbo].[vw_top5_por_posicion]
GO
/****** Object:  View [dbo].[vw_jugadores_posiciones]    Script Date: 07/06/2025 21:52:44 ******/
DROP VIEW [dbo].[vw_jugadores_posiciones]
GO
/****** Object:  Table [dbo].[Jugador_Posicion]    Script Date: 07/06/2025 21:52:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Jugador_Posicion]') AND type in (N'U'))
DROP TABLE [dbo].[Jugador_Posicion]
GO
/****** Object:  Table [dbo].[Posicion]    Script Date: 07/06/2025 21:52:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Posicion]') AND type in (N'U'))
DROP TABLE [dbo].[Posicion]
GO
/****** Object:  View [dbo].[vw_historial_clubes]    Script Date: 07/06/2025 21:52:44 ******/
DROP VIEW [dbo].[vw_historial_clubes]
GO
/****** Object:  Table [dbo].[Historial_Clubes]    Script Date: 07/06/2025 21:52:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Historial_Clubes]') AND type in (N'U'))
DROP TABLE [dbo].[Historial_Clubes]
GO
/****** Object:  View [dbo].[vw_evaluacion_reciente]    Script Date: 07/06/2025 21:52:44 ******/
DROP VIEW [dbo].[vw_evaluacion_reciente]
GO
/****** Object:  Table [dbo].[Evaluacion]    Script Date: 07/06/2025 21:52:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Evaluacion]') AND type in (N'U'))
DROP TABLE [dbo].[Evaluacion]
GO
/****** Object:  View [dbo].[vw_jugadores_habilidades]    Script Date: 07/06/2025 21:52:44 ******/
DROP VIEW [dbo].[vw_jugadores_habilidades]
GO
/****** Object:  Table [dbo].[Jugador_Habilidad]    Script Date: 07/06/2025 21:52:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Jugador_Habilidad]') AND type in (N'U'))
DROP TABLE [dbo].[Jugador_Habilidad]
GO
/****** Object:  Table [dbo].[Habilidad]    Script Date: 07/06/2025 21:52:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Habilidad]') AND type in (N'U'))
DROP TABLE [dbo].[Habilidad]
GO
/****** Object:  View [dbo].[vw_jugadores_detalle]    Script Date: 07/06/2025 21:52:44 ******/
DROP VIEW [dbo].[vw_jugadores_detalle]
GO
/****** Object:  Table [dbo].[Jugador]    Script Date: 07/06/2025 21:52:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Jugador]') AND type in (N'U'))
DROP TABLE [dbo].[Jugador]
GO
/****** Object:  Table [dbo].[Club]    Script Date: 07/06/2025 21:52:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Club]') AND type in (N'U'))
DROP TABLE [dbo].[Club]
GO
/****** Object:  Table [dbo].[Nacionalidad]    Script Date: 07/06/2025 21:52:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nacionalidad]') AND type in (N'U'))
DROP TABLE [dbo].[Nacionalidad]
GO
USE [master]
GO
/****** Object:  Database [FIFA_DB]    Script Date: 07/06/2025 21:52:44 ******/
DROP DATABASE [FIFA_DB]
GO
/****** Object:  Database [FIFA_DB]    Script Date: 07/06/2025 21:52:44 ******/
CREATE DATABASE [FIFA_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FIFA_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER_UNA0\MSSQL\DATA\FIFA_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FIFA_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER_UNA0\MSSQL\DATA\FIFA_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FIFA_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FIFA_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FIFA_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FIFA_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FIFA_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FIFA_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FIFA_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FIFA_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FIFA_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FIFA_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FIFA_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FIFA_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FIFA_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FIFA_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FIFA_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FIFA_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FIFA_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FIFA_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FIFA_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FIFA_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FIFA_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FIFA_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FIFA_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FIFA_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FIFA_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [FIFA_DB] SET  MULTI_USER 
GO
ALTER DATABASE [FIFA_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FIFA_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FIFA_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FIFA_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FIFA_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FIFA_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FIFA_DB', N'ON'
GO
ALTER DATABASE [FIFA_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FIFA_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FIFA_DB]
GO
/****** Object:  Table [dbo].[Nacionalidad]    Script Date: 07/06/2025 21:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nacionalidad](
	[id_nacionalidad] [int] IDENTITY(1,1) NOT NULL,
	[pais] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_nacionalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Club]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Club](
	[id_club] [int] IDENTITY(1,1) NOT NULL,
	[nombre_club] [varchar](100) NOT NULL,
	[pais] [varchar](50) NULL,
	[liga] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_club] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jugador]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugador](
	[id_jugador] [int] IDENTITY(1,1) NOT NULL,
	[primer_nombre] [varchar](50) NOT NULL,
	[segundo_nombre] [varchar](50) NULL,
	[primer_apellido] [varchar](50) NOT NULL,
	[segundo_apellido] [varchar](50) NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[altura] [decimal](5, 2) NOT NULL,
	[peso] [decimal](5, 2) NOT NULL,
	[pierna_dominante] [varchar](10) NULL,
	[retirado] [bit] NULL,
	[foto_url] [varchar](255) NULL,
	[id_nacionalidad] [int] NOT NULL,
	[id_club] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_jugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_jugadores_detalle]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_jugadores_detalle] AS
SELECT 
    j.id_jugador,
    j.primer_nombre,
    j.segundo_nombre,
    j.primer_apellido,
    j.segundo_apellido,
    j.fecha_nacimiento,
    j.altura,
    j.peso,
    j.pierna_dominante,
    j.retirado,
    j.foto_url,
    n.pais AS nacionalidad,
    c.nombre_club,
    c.liga,
    c.pais AS pais_club
FROM Jugador j
JOIN Nacionalidad n ON j.id_nacionalidad = n.id_nacionalidad
LEFT JOIN Club c ON j.id_club = c.id_club;
GO
/****** Object:  Table [dbo].[Habilidad]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habilidad](
	[id_habilidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre_habilidad] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_habilidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jugador_Habilidad]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugador_Habilidad](
	[id_jugador] [int] NOT NULL,
	[id_habilidad] [int] NOT NULL,
	[valor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_jugador] ASC,
	[id_habilidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_jugadores_habilidades]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_jugadores_habilidades] AS
SELECT 
    j.id_jugador,
    j.primer_nombre + ' ' + j.primer_apellido AS nombre_completo,
    h.nombre_habilidad,
    jh.valor
FROM Jugador j
JOIN Jugador_Habilidad jh ON j.id_jugador = jh.id_jugador
JOIN Habilidad h ON jh.id_habilidad = h.id_habilidad;
GO
/****** Object:  Table [dbo].[Evaluacion]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluacion](
	[id_evaluacion] [int] IDENTITY(1,1) NOT NULL,
	[id_jugador] [int] NOT NULL,
	[id_posicion] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[puntaje_sofascore] [decimal](4, 2) NOT NULL,
	[puntaje_equilibrador] [char](1) NOT NULL,
	[rating] [decimal](4, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_evaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_evaluacion_reciente]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_evaluacion_reciente] AS
SELECT e.*
FROM Evaluacion e
JOIN (
    SELECT id_jugador, MAX(fecha) AS fecha_max
    FROM Evaluacion
    GROUP BY id_jugador
) ult ON e.id_jugador = ult.id_jugador AND e.fecha = ult.fecha_max;
GO
/****** Object:  Table [dbo].[Historial_Clubes]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial_Clubes](
	[id_historial] [int] IDENTITY(1,1) NOT NULL,
	[id_jugador] [int] NOT NULL,
	[id_club] [int] NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_historial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_historial_clubes]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_historial_clubes] AS
SELECT 
    j.id_jugador,
    j.primer_nombre + ' ' + j.primer_apellido AS nombre_completo,
    c.nombre_club,
    hc.fecha_inicio,
    hc.fecha_fin
FROM Historial_Clubes hc
JOIN Jugador j ON hc.id_jugador = j.id_jugador
JOIN Club c ON hc.id_club = c.id_club;
GO
/****** Object:  Table [dbo].[Posicion]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posicion](
	[id_posicion] [int] IDENTITY(1,1) NOT NULL,
	[nombre_posicion] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_posicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jugador_Posicion]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugador_Posicion](
	[id_jugador] [int] NOT NULL,
	[id_posicion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_jugador] ASC,
	[id_posicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_jugadores_posiciones]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_jugadores_posiciones] AS
SELECT 
    j.id_jugador,
    j.primer_nombre + ' ' + j.primer_apellido AS nombre_completo,
    p.nombre_posicion
FROM Jugador_Posicion jp
JOIN Jugador j ON jp.id_jugador = j.id_jugador
JOIN Posicion p ON jp.id_posicion = p.id_posicion;
GO
/****** Object:  View [dbo].[vw_top5_por_posicion]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_top5_por_posicion] AS
SELECT TOP 5
    e.id_jugador,
    j.primer_nombre + ' ' + j.primer_apellido AS nombre_completo,
    p.nombre_posicion,
    e.rating
FROM Evaluacion e
JOIN Jugador j ON j.id_jugador = e.id_jugador
JOIN Posicion p ON e.id_posicion = p.id_posicion
WHERE e.fecha = (
    SELECT MAX(e2.fecha)
    FROM Evaluacion e2
    WHERE e2.id_jugador = e.id_jugador
)
ORDER BY e.rating DESC;
GO
/****** Object:  View [dbo].[vw_jugadores_libres]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_jugadores_libres] AS
SELECT 
    j.id_jugador,
    j.primer_nombre + ' ' + j.primer_apellido AS nombre_completo,
    n.pais AS nacionalidad
FROM Jugador j
JOIN Nacionalidad n ON j.id_nacionalidad = n.id_nacionalidad
WHERE j.id_club IS NULL;
GO
/****** Object:  View [dbo].[vw_info_completa_jugador]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

-- Vista que muestra información completa del jugador con club y nacionalidad
CREATE VIEW [dbo].[vw_info_completa_jugador] AS
SELECT 
    j.id_jugador,
    j.primer_nombre,
    j.segundo_nombre,
    j.primer_apellido,
    j.segundo_apellido,
    j.fecha_nacimiento,
    j.altura,
    j.peso,
    j.pierna_dominante,
    j.retirado,
    j.foto_url,
    n.pais AS nacionalidad,
    c.nombre_club,
    c.pais AS pais_club,
    c.liga
FROM Jugador j
LEFT JOIN Nacionalidad n ON j.id_nacionalidad = n.id_nacionalidad
LEFT JOIN Club c ON j.id_club = c.id_club;

GO
/****** Object:  View [dbo].[vw_evaluaciones_jugador]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

-- Vista que une evaluaciones con jugador y posición
CREATE VIEW [dbo].[vw_evaluaciones_jugador] AS
SELECT 
    e.id_evaluacion,
    j.id_jugador,
    CONCAT(j.primer_nombre, ' ', j.segundo_nombre, ' ', j.primer_apellido, ' ', j.segundo_apellido) AS nombre_completo,
    p.nombre_posicion,
    e.fecha,
    e.puntaje_sofascore,
    e.puntaje_equilibrador,
    e.rating
FROM Evaluacion e
INNER JOIN Jugador j ON e.id_jugador = j.id_jugador
INNER JOIN Posicion p ON e.id_posicion = p.id_posicion;

GO
/****** Object:  View [dbo].[vw_habilidades_jugador]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Vista para ver las habilidades de cada jugador por nombre
CREATE VIEW [dbo].[vw_habilidades_jugador] AS
SELECT 
    j.id_jugador,
    CONCAT(j.primer_nombre, ' ', j.segundo_nombre, ' ', j.primer_apellido, ' ', j.segundo_apellido) AS nombre_completo,
    h.nombre_habilidad,
    jh.valor
FROM Jugador_Habilidad jh
INNER JOIN Jugador j ON jh.id_jugador = j.id_jugador
INNER JOIN Habilidad h ON jh.id_habilidad = h.id_habilidad;

GO
/****** Object:  View [dbo].[vw_historial_clubes_jugador]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Vista del historial completo de clubes por jugador
CREATE VIEW [dbo].[vw_historial_clubes_jugador] AS
SELECT 
    hc.id_historial,
    j.id_jugador,
    CONCAT(j.primer_nombre, ' ', j.segundo_nombre, ' ', j.primer_apellido, ' ', j.segundo_apellido) AS nombre_completo,
    c.nombre_club,
    hc.fecha_inicio,
    hc.fecha_fin
FROM Historial_Clubes hc
INNER JOIN Jugador j ON hc.id_jugador = j.id_jugador
INNER JOIN Club c ON hc.id_club = c.id_club;
GO
/****** Object:  Table [dbo].[auditoria_evaluacion]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auditoria_evaluacion](
	[id_auditoria] [int] IDENTITY(1,1) NOT NULL,
	[fecha_registro] [datetime] NULL,
	[usuario] [nvarchar](128) NULL,
	[accion] [varchar](20) NULL,
	[tabla] [varchar](50) NULL,
	[id_evaluacion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_auditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[auditoria_evaluacion] ON 

INSERT [dbo].[auditoria_evaluacion] ([id_auditoria], [fecha_registro], [usuario], [accion], [tabla], [id_evaluacion]) VALUES (1, CAST(N'2025-06-06T11:13:00.610' AS DateTime), N'THIAN\crisa', N'actualizar', N'Evaluacion', 1)
SET IDENTITY_INSERT [dbo].[auditoria_evaluacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Club] ON 

INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (394, N'Real Madrid', N'España', N'La Liga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (395, N'FC Barcelona', N'España', N'La Liga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (396, N'Atlético de Madrid', N'España', N'La Liga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (397, N'Manchester City', N'Inglaterra', N'Premier League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (398, N'Arsenal', N'Inglaterra', N'Premier League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (399, N'Liverpool', N'Inglaterra', N'Premier League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (400, N'Manchester United', N'Inglaterra', N'Premier League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (401, N'Chelsea', N'Inglaterra', N'Premier League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (402, N'Bayern Munich', N'Alemania', N'Bundesliga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (403, N'Borussia Dortmund', N'Alemania', N'Bundesliga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (404, N'RB Leipzig', N'Alemania', N'Bundesliga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (405, N'Paris Saint-Germain', N'Francia', N'Ligue 1')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (406, N'Olympique de Marseille', N'Francia', N'Ligue 1')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (407, N'Inter de Milán', N'Italia', N'Serie A')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (408, N'AC Milan', N'Italia', N'Serie A')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (409, N'Juventus', N'Italia', N'Serie A')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (410, N'Napoli', N'Italia', N'Serie A')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (411, N'Benfica', N'Portugal', N'Liga Portugal')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (412, N'Porto', N'Portugal', N'Liga Portugal')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (413, N'Ajax', N'Países Bajos', N'Eredivisie')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (414, N'Sevilla', N'España', N'La Liga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (415, N'Real Sociedad', N'España', N'La Liga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (416, N'Real Betis', N'España', N'La Liga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (417, N'Villarreal', N'España', N'La Liga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (418, N'Valencia', N'España', N'La Liga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (419, N'Newcastle United', N'Inglaterra', N'Premier League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (420, N'Tottenham Hotspur', N'Inglaterra', N'Premier League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (421, N'West Ham United', N'Inglaterra', N'Premier League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (422, N'Aston Villa', N'Inglaterra', N'Premier League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (423, N'Brighton & Hove Albion', N'Inglaterra', N'Premier League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (424, N'Leeds United', N'Inglaterra', N'Championship')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (425, N'Leicester City', N'Inglaterra', N'Championship')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (426, N'Everton', N'Inglaterra', N'Premier League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (427, N'Wolverhampton Wanderers', N'Inglaterra', N'Premier League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (428, N'Nottingham Forest', N'Inglaterra', N'Premier League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (429, N'Bayer Leverkusen', N'Alemania', N'Bundesliga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (430, N'Eintracht Frankfurt', N'Alemania', N'Bundesliga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (431, N'SC Freiburg', N'Alemania', N'Bundesliga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (432, N'Union Berlin', N'Alemania', N'Bundesliga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (433, N'VfL Wolfsburg', N'Alemania', N'Bundesliga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (434, N'Olympique Lyon', N'Francia', N'Ligue 1')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (435, N'AS Monaco', N'Francia', N'Ligue 1')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (436, N'Lille OSC', N'Francia', N'Ligue 1')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (437, N'Stade Rennais', N'Francia', N'Ligue 1')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (438, N'OGC Nice', N'Francia', N'Ligue 1')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (439, N'Atalanta', N'Italia', N'Serie A')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (440, N'Lazio', N'Italia', N'Serie A')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (441, N'Roma', N'Italia', N'Serie A')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (442, N'Fiorentina', N'Italia', N'Serie A')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (443, N'Torino', N'Italia', N'Serie A')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (444, N'Sporting CP', N'Portugal', N'Liga Portugal')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (445, N'Braga', N'Portugal', N'Liga Portugal')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (446, N'Boavista', N'Portugal', N'Liga Portugal')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (447, N'Vitória SC', N'Portugal', N'Liga Portugal')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (448, N'AZ Alkmaar', N'Países Bajos', N'Eredivisie')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (449, N'Feyenoord', N'Países Bajos', N'Eredivisie')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (450, N'PSV Eindhoven', N'Países Bajos', N'Eredivisie')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (451, N'Twente', N'Países Bajos', N'Eredivisie')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (452, N'Anderlecht', N'Bélgica', N'Pro League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (453, N'Club Brugge', N'Bélgica', N'Pro League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (454, N'Genk', N'Bélgica', N'Pro League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (455, N'Standard Liège', N'Bélgica', N'Pro League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (456, N'Celtic', N'Escocia', N'Scottish Premiership')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (457, N'Rangers', N'Escocia', N'Scottish Premiership')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (458, N'Galatasaray', N'Turquía', N'Süper Lig')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (459, N'Fenerbahçe', N'Turquía', N'Süper Lig')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (460, N'Besiktas', N'Turquía', N'Süper Lig')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (461, N'Dinamo Zagreb', N'Croacia', N'Prva HNL')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (462, N'Red Bull Salzburg', N'Austria', N'Bundesliga')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (463, N'Shakhtar Donetsk', N'Ucrania', N'Premier League')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (464, N'Municipal Liberia', N'Costa Rica', N'Primera División')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (465, N'Deportivo Saprissa', N'Costa Rica', N'Primera División')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (466, N'A.D. Guanacasteca', N'Costa Rica', N'Primera División')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (467, N'Liga Deportiva Alajuelense', N'Costa Rica', N'Primera División')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (468, N'Club Sport Herediano', N'Costa Rica', N'Primera División')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (469, N'Club Sport Cartaginés', N'Costa Rica', N'Primera División')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (470, N'Pérez Zeledón', N'Costa Rica', N'Primera División')
INSERT [dbo].[Club] ([id_club], [nombre_club], [pais], [liga]) VALUES (471, N'Municipal Grecia', N'Costa Rica', N'Primera División')
SET IDENTITY_INSERT [dbo].[Club] OFF
GO
SET IDENTITY_INSERT [dbo].[Evaluacion] ON 

INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (1, 1, 8, CAST(N'2024-07-25' AS Date), CAST(8.50 AS Decimal(4, 2)), N'F', CAST(70.99 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (2, 1, 11, CAST(N'2025-05-06' AS Date), CAST(7.60 AS Decimal(4, 2)), N'A', CAST(90.86 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (3, 2, 8, CAST(N'2025-05-11' AS Date), CAST(6.35 AS Decimal(4, 2)), N'D', CAST(92.61 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (4, 2, 2, CAST(N'2025-01-06' AS Date), CAST(6.64 AS Decimal(4, 2)), N'E', CAST(86.23 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (5, 2, 7, CAST(N'2025-01-05' AS Date), CAST(6.31 AS Decimal(4, 2)), N'A', CAST(78.33 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (6, 3, 10, CAST(N'2024-06-14' AS Date), CAST(6.02 AS Decimal(4, 2)), N'B', CAST(78.04 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (7, 4, 2, CAST(N'2025-01-04' AS Date), CAST(7.67 AS Decimal(4, 2)), N'C', CAST(83.15 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (8, 4, 9, CAST(N'2025-03-12' AS Date), CAST(7.47 AS Decimal(4, 2)), N'B', CAST(82.97 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (9, 4, 3, CAST(N'2024-07-13' AS Date), CAST(6.44 AS Decimal(4, 2)), N'H', CAST(90.38 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (10, 5, 1, CAST(N'2024-11-25' AS Date), CAST(7.38 AS Decimal(4, 2)), N'H', CAST(89.07 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (11, 5, 8, CAST(N'2024-06-13' AS Date), CAST(8.47 AS Decimal(4, 2)), N'D', CAST(86.54 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (12, 5, 10, CAST(N'2024-11-24' AS Date), CAST(7.25 AS Decimal(4, 2)), N'H', CAST(90.70 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (13, 6, 5, CAST(N'2025-02-02' AS Date), CAST(6.65 AS Decimal(4, 2)), N'D', CAST(93.36 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (14, 7, 12, CAST(N'2025-01-27' AS Date), CAST(8.30 AS Decimal(4, 2)), N'E', CAST(72.45 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (15, 7, 2, CAST(N'2025-04-24' AS Date), CAST(7.97 AS Decimal(4, 2)), N'I', CAST(81.91 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (16, 7, 9, CAST(N'2024-09-04' AS Date), CAST(7.07 AS Decimal(4, 2)), N'E', CAST(87.95 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (17, 8, 6, CAST(N'2025-04-18' AS Date), CAST(7.57 AS Decimal(4, 2)), N'E', CAST(76.07 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (18, 8, 5, CAST(N'2025-05-21' AS Date), CAST(6.15 AS Decimal(4, 2)), N'D', CAST(87.34 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (19, 9, 5, CAST(N'2025-01-22' AS Date), CAST(7.01 AS Decimal(4, 2)), N'F', CAST(85.30 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (20, 9, 12, CAST(N'2024-11-29' AS Date), CAST(6.75 AS Decimal(4, 2)), N'F', CAST(76.18 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (21, 9, 11, CAST(N'2024-09-02' AS Date), CAST(7.66 AS Decimal(4, 2)), N'E', CAST(82.87 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (22, 10, 8, CAST(N'2025-04-24' AS Date), CAST(7.50 AS Decimal(4, 2)), N'B', CAST(81.01 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (23, 11, 2, CAST(N'2024-08-09' AS Date), CAST(7.14 AS Decimal(4, 2)), N'C', CAST(85.99 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (24, 12, 12, CAST(N'2025-03-05' AS Date), CAST(6.90 AS Decimal(4, 2)), N'E', CAST(85.66 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (25, 12, 11, CAST(N'2025-04-10' AS Date), CAST(6.11 AS Decimal(4, 2)), N'I', CAST(82.13 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (26, 12, 6, CAST(N'2024-06-13' AS Date), CAST(6.11 AS Decimal(4, 2)), N'B', CAST(94.34 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (27, 13, 7, CAST(N'2024-11-19' AS Date), CAST(6.06 AS Decimal(4, 2)), N'F', CAST(88.82 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (28, 13, 1, CAST(N'2025-04-03' AS Date), CAST(7.25 AS Decimal(4, 2)), N'F', CAST(94.45 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (29, 14, 9, CAST(N'2025-01-14' AS Date), CAST(7.15 AS Decimal(4, 2)), N'I', CAST(71.07 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (30, 14, 3, CAST(N'2025-05-09' AS Date), CAST(6.66 AS Decimal(4, 2)), N'H', CAST(79.24 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (31, 15, 6, CAST(N'2024-08-14' AS Date), CAST(6.47 AS Decimal(4, 2)), N'E', CAST(91.22 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (32, 16, 12, CAST(N'2024-11-16' AS Date), CAST(7.78 AS Decimal(4, 2)), N'E', CAST(74.49 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (33, 16, 8, CAST(N'2024-08-31' AS Date), CAST(7.80 AS Decimal(4, 2)), N'I', CAST(85.37 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (34, 17, 10, CAST(N'2024-09-01' AS Date), CAST(6.28 AS Decimal(4, 2)), N'A', CAST(71.17 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (35, 17, 11, CAST(N'2025-03-15' AS Date), CAST(7.86 AS Decimal(4, 2)), N'G', CAST(87.62 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (36, 18, 2, CAST(N'2025-03-31' AS Date), CAST(7.68 AS Decimal(4, 2)), N'F', CAST(71.77 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (37, 18, 11, CAST(N'2025-03-02' AS Date), CAST(7.37 AS Decimal(4, 2)), N'A', CAST(72.37 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (38, 19, 11, CAST(N'2025-01-23' AS Date), CAST(6.08 AS Decimal(4, 2)), N'B', CAST(75.17 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (39, 19, 2, CAST(N'2025-01-20' AS Date), CAST(6.98 AS Decimal(4, 2)), N'A', CAST(90.32 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (40, 19, 7, CAST(N'2024-10-06' AS Date), CAST(7.96 AS Decimal(4, 2)), N'J', CAST(73.90 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (41, 20, 6, CAST(N'2024-06-11' AS Date), CAST(7.49 AS Decimal(4, 2)), N'E', CAST(77.77 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (42, 21, 5, CAST(N'2025-03-21' AS Date), CAST(6.92 AS Decimal(4, 2)), N'C', CAST(84.41 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (43, 22, 10, CAST(N'2024-10-01' AS Date), CAST(6.65 AS Decimal(4, 2)), N'E', CAST(91.49 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (44, 22, 5, CAST(N'2025-05-13' AS Date), CAST(6.24 AS Decimal(4, 2)), N'J', CAST(71.56 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (45, 23, 6, CAST(N'2025-01-10' AS Date), CAST(7.62 AS Decimal(4, 2)), N'J', CAST(82.70 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (46, 23, 7, CAST(N'2024-09-10' AS Date), CAST(6.68 AS Decimal(4, 2)), N'F', CAST(92.55 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (47, 23, 2, CAST(N'2024-08-26' AS Date), CAST(6.65 AS Decimal(4, 2)), N'D', CAST(81.54 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (48, 24, 12, CAST(N'2025-03-17' AS Date), CAST(6.49 AS Decimal(4, 2)), N'B', CAST(88.75 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (49, 24, 7, CAST(N'2024-10-23' AS Date), CAST(8.22 AS Decimal(4, 2)), N'I', CAST(85.62 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (50, 25, 1, CAST(N'2025-02-13' AS Date), CAST(7.10 AS Decimal(4, 2)), N'C', CAST(77.82 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (51, 26, 4, CAST(N'2025-05-02' AS Date), CAST(7.12 AS Decimal(4, 2)), N'B', CAST(78.71 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (52, 27, 2, CAST(N'2024-06-20' AS Date), CAST(7.08 AS Decimal(4, 2)), N'A', CAST(70.13 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (53, 27, 9, CAST(N'2025-01-09' AS Date), CAST(6.55 AS Decimal(4, 2)), N'J', CAST(78.33 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (54, 28, 2, CAST(N'2025-05-28' AS Date), CAST(7.98 AS Decimal(4, 2)), N'H', CAST(78.33 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (55, 29, 2, CAST(N'2024-08-16' AS Date), CAST(6.82 AS Decimal(4, 2)), N'I', CAST(87.31 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (56, 29, 6, CAST(N'2025-03-16' AS Date), CAST(8.26 AS Decimal(4, 2)), N'J', CAST(83.82 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (57, 29, 9, CAST(N'2025-01-07' AS Date), CAST(6.21 AS Decimal(4, 2)), N'E', CAST(75.99 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (58, 30, 2, CAST(N'2024-06-23' AS Date), CAST(7.79 AS Decimal(4, 2)), N'E', CAST(87.96 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (59, 31, 5, CAST(N'2024-12-14' AS Date), CAST(6.91 AS Decimal(4, 2)), N'D', CAST(84.99 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (60, 31, 8, CAST(N'2024-11-04' AS Date), CAST(6.70 AS Decimal(4, 2)), N'B', CAST(81.70 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (61, 31, 11, CAST(N'2024-09-24' AS Date), CAST(7.97 AS Decimal(4, 2)), N'B', CAST(92.17 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (62, 32, 4, CAST(N'2024-12-06' AS Date), CAST(7.65 AS Decimal(4, 2)), N'G', CAST(93.25 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (63, 32, 10, CAST(N'2025-03-22' AS Date), CAST(8.35 AS Decimal(4, 2)), N'E', CAST(94.77 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (64, 32, 11, CAST(N'2024-07-16' AS Date), CAST(7.50 AS Decimal(4, 2)), N'E', CAST(75.43 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (65, 33, 7, CAST(N'2025-02-26' AS Date), CAST(7.21 AS Decimal(4, 2)), N'B', CAST(83.81 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (66, 34, 12, CAST(N'2024-06-25' AS Date), CAST(7.73 AS Decimal(4, 2)), N'G', CAST(93.27 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (67, 35, 7, CAST(N'2024-08-10' AS Date), CAST(8.35 AS Decimal(4, 2)), N'D', CAST(82.91 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (68, 36, 4, CAST(N'2025-03-11' AS Date), CAST(6.06 AS Decimal(4, 2)), N'B', CAST(82.60 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (69, 36, 7, CAST(N'2025-03-04' AS Date), CAST(6.34 AS Decimal(4, 2)), N'I', CAST(88.52 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (70, 37, 9, CAST(N'2024-12-16' AS Date), CAST(6.84 AS Decimal(4, 2)), N'A', CAST(84.81 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (71, 38, 8, CAST(N'2024-11-09' AS Date), CAST(7.06 AS Decimal(4, 2)), N'H', CAST(83.37 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (72, 38, 6, CAST(N'2024-08-24' AS Date), CAST(8.16 AS Decimal(4, 2)), N'H', CAST(73.94 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (73, 39, 8, CAST(N'2024-11-27' AS Date), CAST(7.51 AS Decimal(4, 2)), N'C', CAST(73.06 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (74, 39, 6, CAST(N'2024-06-23' AS Date), CAST(6.55 AS Decimal(4, 2)), N'J', CAST(74.25 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (75, 39, 9, CAST(N'2024-10-21' AS Date), CAST(6.46 AS Decimal(4, 2)), N'E', CAST(91.14 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (76, 40, 9, CAST(N'2025-04-09' AS Date), CAST(7.02 AS Decimal(4, 2)), N'D', CAST(80.74 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (77, 40, 12, CAST(N'2024-12-16' AS Date), CAST(6.63 AS Decimal(4, 2)), N'D', CAST(87.40 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (78, 41, 3, CAST(N'2024-12-07' AS Date), CAST(7.95 AS Decimal(4, 2)), N'F', CAST(72.05 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (79, 41, 6, CAST(N'2024-07-07' AS Date), CAST(7.55 AS Decimal(4, 2)), N'J', CAST(86.29 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (80, 42, 5, CAST(N'2025-03-18' AS Date), CAST(6.07 AS Decimal(4, 2)), N'H', CAST(93.62 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (81, 42, 9, CAST(N'2024-07-26' AS Date), CAST(6.29 AS Decimal(4, 2)), N'C', CAST(74.86 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (82, 43, 7, CAST(N'2025-03-25' AS Date), CAST(6.46 AS Decimal(4, 2)), N'I', CAST(93.75 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (83, 43, 6, CAST(N'2025-03-23' AS Date), CAST(6.73 AS Decimal(4, 2)), N'F', CAST(80.47 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (84, 43, 12, CAST(N'2024-08-07' AS Date), CAST(6.37 AS Decimal(4, 2)), N'G', CAST(74.77 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (85, 44, 9, CAST(N'2024-12-12' AS Date), CAST(6.81 AS Decimal(4, 2)), N'J', CAST(75.00 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (86, 45, 7, CAST(N'2024-07-23' AS Date), CAST(7.79 AS Decimal(4, 2)), N'F', CAST(86.81 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (87, 46, 8, CAST(N'2024-12-20' AS Date), CAST(7.25 AS Decimal(4, 2)), N'C', CAST(85.52 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (88, 46, 7, CAST(N'2024-12-31' AS Date), CAST(8.02 AS Decimal(4, 2)), N'C', CAST(74.60 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (89, 47, 1, CAST(N'2025-02-28' AS Date), CAST(8.30 AS Decimal(4, 2)), N'D', CAST(82.88 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (90, 47, 5, CAST(N'2025-01-13' AS Date), CAST(7.42 AS Decimal(4, 2)), N'B', CAST(91.19 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (91, 47, 3, CAST(N'2025-01-03' AS Date), CAST(8.43 AS Decimal(4, 2)), N'A', CAST(81.33 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (92, 48, 1, CAST(N'2025-04-06' AS Date), CAST(7.86 AS Decimal(4, 2)), N'G', CAST(89.03 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (93, 48, 4, CAST(N'2024-12-05' AS Date), CAST(7.21 AS Decimal(4, 2)), N'B', CAST(74.00 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (94, 49, 8, CAST(N'2024-11-24' AS Date), CAST(7.04 AS Decimal(4, 2)), N'J', CAST(75.36 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (95, 50, 11, CAST(N'2024-08-21' AS Date), CAST(7.04 AS Decimal(4, 2)), N'A', CAST(84.71 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (96, 51, 11, CAST(N'2025-01-05' AS Date), CAST(8.03 AS Decimal(4, 2)), N'B', CAST(81.24 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (97, 51, 9, CAST(N'2024-11-18' AS Date), CAST(6.12 AS Decimal(4, 2)), N'I', CAST(88.25 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (98, 52, 6, CAST(N'2024-12-14' AS Date), CAST(7.01 AS Decimal(4, 2)), N'A', CAST(92.01 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (99, 52, 1, CAST(N'2025-04-15' AS Date), CAST(6.28 AS Decimal(4, 2)), N'I', CAST(79.62 AS Decimal(4, 2)))
GO
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (100, 52, 11, CAST(N'2024-07-13' AS Date), CAST(7.33 AS Decimal(4, 2)), N'E', CAST(93.55 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (101, 53, 1, CAST(N'2024-06-15' AS Date), CAST(8.20 AS Decimal(4, 2)), N'F', CAST(85.47 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (102, 53, 2, CAST(N'2024-09-16' AS Date), CAST(6.28 AS Decimal(4, 2)), N'C', CAST(80.11 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (103, 54, 9, CAST(N'2024-11-27' AS Date), CAST(7.43 AS Decimal(4, 2)), N'G', CAST(94.49 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (104, 54, 8, CAST(N'2024-08-12' AS Date), CAST(6.16 AS Decimal(4, 2)), N'D', CAST(83.65 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (105, 55, 1, CAST(N'2024-09-14' AS Date), CAST(8.20 AS Decimal(4, 2)), N'J', CAST(90.91 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (106, 56, 10, CAST(N'2025-01-23' AS Date), CAST(7.42 AS Decimal(4, 2)), N'C', CAST(93.37 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (107, 57, 4, CAST(N'2025-05-12' AS Date), CAST(6.06 AS Decimal(4, 2)), N'C', CAST(80.18 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (108, 57, 8, CAST(N'2024-06-22' AS Date), CAST(8.28 AS Decimal(4, 2)), N'I', CAST(82.03 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (109, 58, 4, CAST(N'2025-04-29' AS Date), CAST(7.17 AS Decimal(4, 2)), N'C', CAST(75.57 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (110, 58, 11, CAST(N'2024-08-16' AS Date), CAST(7.08 AS Decimal(4, 2)), N'F', CAST(70.76 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (111, 59, 11, CAST(N'2025-02-25' AS Date), CAST(8.04 AS Decimal(4, 2)), N'J', CAST(75.96 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (112, 60, 4, CAST(N'2025-01-30' AS Date), CAST(6.78 AS Decimal(4, 2)), N'E', CAST(78.33 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (113, 61, 9, CAST(N'2025-04-26' AS Date), CAST(6.13 AS Decimal(4, 2)), N'E', CAST(75.94 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (114, 61, 12, CAST(N'2025-02-15' AS Date), CAST(8.24 AS Decimal(4, 2)), N'E', CAST(75.19 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (115, 61, 5, CAST(N'2025-05-21' AS Date), CAST(8.27 AS Decimal(4, 2)), N'E', CAST(89.38 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (116, 62, 4, CAST(N'2025-05-25' AS Date), CAST(6.54 AS Decimal(4, 2)), N'B', CAST(82.85 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (117, 62, 9, CAST(N'2025-02-25' AS Date), CAST(8.11 AS Decimal(4, 2)), N'D', CAST(91.27 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (118, 62, 3, CAST(N'2024-10-12' AS Date), CAST(8.00 AS Decimal(4, 2)), N'C', CAST(82.11 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (119, 63, 12, CAST(N'2025-03-14' AS Date), CAST(6.99 AS Decimal(4, 2)), N'B', CAST(73.83 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (120, 63, 1, CAST(N'2024-07-18' AS Date), CAST(8.15 AS Decimal(4, 2)), N'A', CAST(89.95 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (121, 64, 5, CAST(N'2025-05-20' AS Date), CAST(8.39 AS Decimal(4, 2)), N'J', CAST(90.15 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (122, 65, 11, CAST(N'2025-02-25' AS Date), CAST(7.60 AS Decimal(4, 2)), N'J', CAST(84.62 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (123, 66, 4, CAST(N'2025-02-11' AS Date), CAST(7.74 AS Decimal(4, 2)), N'I', CAST(83.65 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (124, 66, 5, CAST(N'2025-01-26' AS Date), CAST(6.37 AS Decimal(4, 2)), N'E', CAST(92.24 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (125, 66, 3, CAST(N'2024-06-27' AS Date), CAST(6.11 AS Decimal(4, 2)), N'J', CAST(78.17 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (126, 67, 8, CAST(N'2025-02-11' AS Date), CAST(7.82 AS Decimal(4, 2)), N'F', CAST(93.10 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (127, 67, 10, CAST(N'2025-02-05' AS Date), CAST(8.24 AS Decimal(4, 2)), N'C', CAST(87.79 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (128, 67, 9, CAST(N'2024-11-20' AS Date), CAST(6.99 AS Decimal(4, 2)), N'D', CAST(70.68 AS Decimal(4, 2)))
INSERT [dbo].[Evaluacion] ([id_evaluacion], [id_jugador], [id_posicion], [fecha], [puntaje_sofascore], [puntaje_equilibrador], [rating]) VALUES (129, 68, 10, CAST(N'2024-09-10' AS Date), CAST(8.14 AS Decimal(4, 2)), N'F', CAST(72.19 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[Evaluacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Habilidad] ON 

INSERT [dbo].[Habilidad] ([id_habilidad], [nombre_habilidad]) VALUES (1, N'PAC')
INSERT [dbo].[Habilidad] ([id_habilidad], [nombre_habilidad]) VALUES (2, N'SHO')
INSERT [dbo].[Habilidad] ([id_habilidad], [nombre_habilidad]) VALUES (3, N'PAS')
INSERT [dbo].[Habilidad] ([id_habilidad], [nombre_habilidad]) VALUES (4, N'DRI')
INSERT [dbo].[Habilidad] ([id_habilidad], [nombre_habilidad]) VALUES (5, N'DEF')
INSERT [dbo].[Habilidad] ([id_habilidad], [nombre_habilidad]) VALUES (6, N'PHY')
SET IDENTITY_INSERT [dbo].[Habilidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Historial_Clubes] ON 

INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (1, 1, 467, CAST(N'2013-06-22' AS Date), CAST(N'2022-04-25' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (2, 2, 399, CAST(N'2012-01-28' AS Date), CAST(N'2019-06-18' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (3, 3, 397, CAST(N'2013-08-15' AS Date), CAST(N'2024-07-21' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (4, 4, 394, CAST(N'2016-01-08' AS Date), CAST(N'2020-08-27' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (5, 5, 397, CAST(N'2017-11-01' AS Date), CAST(N'2024-11-14' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (6, 6, 399, CAST(N'2018-11-04' AS Date), CAST(N'2019-11-25' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (7, 7, 395, CAST(N'2018-02-18' AS Date), CAST(N'2022-12-11' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (8, 8, 399, CAST(N'2017-12-15' AS Date), CAST(N'2021-08-19' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (9, 9, 396, CAST(N'2013-06-04' AS Date), CAST(N'2016-11-07' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (10, 10, 396, CAST(N'2015-11-23' AS Date), CAST(N'2016-09-18' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (11, 11, 399, CAST(N'2018-04-24' AS Date), CAST(N'2020-07-09' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (12, 12, 396, CAST(N'2012-06-16' AS Date), CAST(N'2019-06-18' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (13, 13, 396, CAST(N'2011-03-02' AS Date), CAST(N'2017-06-04' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (14, 14, 401, CAST(N'2012-04-17' AS Date), CAST(N'2020-11-12' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (15, 15, 396, CAST(N'2016-10-12' AS Date), CAST(N'2022-10-04' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (16, 16, 399, CAST(N'2016-11-10' AS Date), CAST(N'2024-01-22' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (17, 17, 401, CAST(N'2012-07-28' AS Date), CAST(N'2021-05-27' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (18, 18, 401, CAST(N'2016-07-05' AS Date), CAST(N'2024-02-01' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (19, 19, 396, CAST(N'2010-05-10' AS Date), CAST(N'2015-05-27' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (20, 20, 397, CAST(N'2010-06-11' AS Date), CAST(N'2012-02-25' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (21, 1, 395, CAST(N'2004-10-16' AS Date), CAST(N'2021-08-05' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (22, 1, 405, CAST(N'2021-08-10' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (23, 1, 467, CAST(N'2023-07-01' AS Date), NULL)
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (27, 2, 423, CAST(N'2020-01-01' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (28, 2, 399, CAST(N'2023-07-01' AS Date), NULL)
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (29, 39, 404, CAST(N'2020-01-01' AS Date), CAST(N'2022-06-30' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (30, 39, 397, CAST(N'2022-07-01' AS Date), NULL)
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (31, 40, 403, CAST(N'2020-07-01' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (32, 40, 394, CAST(N'2023-07-01' AS Date), NULL)
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (33, 1, 397, CAST(N'2025-06-06' AS Date), NULL)
INSERT [dbo].[Historial_Clubes] ([id_historial], [id_jugador], [id_club], [fecha_inicio], [fecha_fin]) VALUES (34, 2, 405, CAST(N'2025-06-06' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Historial_Clubes] OFF
GO
SET IDENTITY_INSERT [dbo].[Jugador] ON 

INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (1, N'Lionel', N'Andrés', N'Messi', N'Cuccittini', CAST(N'1988-07-01' AS Date), CAST(1.69 AS Decimal(5, 2)), CAST(67.00 AS Decimal(5, 2)), N'Left', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings/lionel-messi/158023', 1, 397)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (2, N'Alexis', NULL, N'Mac', N'Allister', CAST(N'2000-07-01' AS Date), CAST(1.76 AS Decimal(5, 2)), CAST(72.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings/alexis-mac-allister/239837', 1, 405)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (3, N'Rúben', N'Santos Gato Alves', N'Dias', NULL, CAST(N'1998-07-01' AS Date), CAST(1.87 AS Decimal(5, 2)), CAST(82.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 7, 397)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (4, N'Federico', N'Santiago', N'Valverde', N'Dipetta', CAST(N'1998-07-01' AS Date), CAST(1.82 AS Decimal(5, 2)), CAST(78.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 394)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (5, N'Bernardo', N'Mota Veiga de Carvalho', N'Silva', NULL, CAST(N'1998-07-01' AS Date), CAST(1.73 AS Decimal(5, 2)), CAST(64.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 7, 397)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (6, N'Alexis', NULL, N'Mac', N'Allister', CAST(N'1998-07-01' AS Date), CAST(1.76 AS Decimal(5, 2)), CAST(72.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 1, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (7, N'Ronald', NULL, N'Araujo', NULL, CAST(N'1998-07-01' AS Date), CAST(1.88 AS Decimal(5, 2)), CAST(79.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 395)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (8, N'Diogo', NULL, N'Jota', NULL, CAST(N'1998-07-01' AS Date), CAST(1.78 AS Decimal(5, 2)), CAST(70.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 7, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (9, N'Julián', NULL, N'Álvarez', NULL, CAST(N'1998-07-01' AS Date), CAST(1.70 AS Decimal(5, 2)), CAST(71.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 1, 396)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (10, N'Rodrigo', NULL, N'De', N'Paul', CAST(N'1998-07-01' AS Date), CAST(1.80 AS Decimal(5, 2)), CAST(70.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 1, 396)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (11, N'Luis', NULL, N'Díaz', NULL, CAST(N'1998-07-01' AS Date), CAST(1.80 AS Decimal(5, 2)), CAST(73.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 12, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (12, N'José', N'María', N'Giménez', NULL, CAST(N'1998-07-01' AS Date), CAST(1.85 AS Decimal(5, 2)), CAST(79.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 396)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (13, N'Ángel', N'Martín', N'Correa', NULL, CAST(N'1998-07-01' AS Date), CAST(1.71 AS Decimal(5, 2)), CAST(70.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 1, 396)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (14, N'Enzo', NULL, N'Fernández', NULL, CAST(N'1998-07-01' AS Date), CAST(1.78 AS Decimal(5, 2)), CAST(78.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 1, 401)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (15, N'Nahuel', NULL, N'Molina', NULL, CAST(N'1998-07-01' AS Date), CAST(1.75 AS Decimal(5, 2)), CAST(70.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 1, 396)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (16, N'Darwin', NULL, N'Núñez', NULL, CAST(N'1998-07-01' AS Date), CAST(1.87 AS Decimal(5, 2)), CAST(81.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (17, N'João', NULL, N'Félix', NULL, CAST(N'1998-07-01' AS Date), CAST(1.81 AS Decimal(5, 2)), CAST(70.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 7, 401)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (18, N'Pedro', NULL, N'Neto', NULL, CAST(N'1998-07-01' AS Date), CAST(1.72 AS Decimal(5, 2)), CAST(62.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 7, 401)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (19, N'Juan', N'Agustín', N'Musso', NULL, CAST(N'1998-07-01' AS Date), CAST(1.91 AS Decimal(5, 2)), CAST(93.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 1, 396)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (20, N'Matheus', NULL, N'Nunes', NULL, CAST(N'1998-07-01' AS Date), CAST(1.83 AS Decimal(5, 2)), CAST(76.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 7, 397)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (21, N'Renato', NULL, N'Veiga', NULL, CAST(N'1998-07-01' AS Date), CAST(1.90 AS Decimal(5, 2)), CAST(85.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 7, 401)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (22, N'Giuliano', NULL, N'Simeone', NULL, CAST(N'1998-07-01' AS Date), CAST(1.73 AS Decimal(5, 2)), CAST(70.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 1, 396)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (23, N'Diego', NULL, N'Rodríguez', NULL, CAST(N'1998-07-01' AS Date), CAST(1.69 AS Decimal(5, 2)), CAST(67.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (24, N'Marcos', NULL, N'Paulo', NULL, CAST(N'1998-07-01' AS Date), CAST(1.86 AS Decimal(5, 2)), CAST(75.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 7, 396)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (25, N'Diego', NULL, N'García', NULL, CAST(N'1998-07-01' AS Date), CAST(1.68 AS Decimal(5, 2)), CAST(64.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (26, N'Agustín', NULL, N'Cayetano', NULL, CAST(N'1998-07-01' AS Date), CAST(1.79 AS Decimal(5, 2)), CAST(77.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (27, N'Lucas', NULL, N'Lemos', NULL, CAST(N'1998-07-01' AS Date), CAST(1.83 AS Decimal(5, 2)), CAST(70.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (28, N'Sebastián', NULL, N'Lentinelly', NULL, CAST(N'1998-07-01' AS Date), CAST(1.84 AS Decimal(5, 2)), CAST(81.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (29, N'Agustín', NULL, N'González', NULL, CAST(N'1998-07-01' AS Date), CAST(1.75 AS Decimal(5, 2)), CAST(65.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (30, N'Kevin', NULL, N'Amaro', NULL, CAST(N'1998-07-01' AS Date), CAST(1.79 AS Decimal(5, 2)), CAST(72.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (31, N'Jean', N'Pierre', N'Rosso', NULL, CAST(N'1998-07-01' AS Date), CAST(1.79 AS Decimal(5, 2)), CAST(72.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (32, N'Yordi', NULL, N'López', NULL, CAST(N'1998-07-01' AS Date), CAST(1.71 AS Decimal(5, 2)), CAST(68.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (33, N'Renzo', NULL, N'Machado', NULL, CAST(N'1998-07-01' AS Date), CAST(1.82 AS Decimal(5, 2)), CAST(77.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (34, N'Matías', NULL, N'Silva', NULL, CAST(N'1998-07-01' AS Date), CAST(1.73 AS Decimal(5, 2)), CAST(65.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (35, N'Francisco', NULL, N'Bregante', NULL, CAST(N'1998-07-01' AS Date), CAST(1.79 AS Decimal(5, 2)), CAST(72.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 11, 399)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (36, N'Mayra', NULL, N'Ramírez', NULL, CAST(N'1998-07-01' AS Date), CAST(1.78 AS Decimal(5, 2)), CAST(74.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 12, 401)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (37, N'Tatiana', NULL, N'Pinto', NULL, CAST(N'1998-07-01' AS Date), CAST(1.67 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 7, 396)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (38, N'Kika', NULL, N'Nazareth', NULL, CAST(N'1998-07-01' AS Date), CAST(1.70 AS Decimal(5, 2)), CAST(67.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings', 7, 395)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (39, N'Erling', N'Braut', N'Haaland', NULL, CAST(N'2000-07-21' AS Date), CAST(1.94 AS Decimal(5, 2)), CAST(87.00 AS Decimal(5, 2)), N'Left', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings/haaland/239085', 28, 397)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (40, N'Jude', NULL, N'Bellingham', NULL, CAST(N'2003-06-29' AS Date), CAST(1.86 AS Decimal(5, 2)), CAST(75.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings/bellingham/256389', 8, 394)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (41, N'Vinícius', N'José', N'Paixão', N'Júnior', CAST(N'2000-07-12' AS Date), CAST(1.76 AS Decimal(5, 2)), CAST(73.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings/vinicius-jr/246982', 2, 394)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (42, N'Bukayo', NULL, N'Saka', NULL, CAST(N'2001-09-05' AS Date), CAST(1.78 AS Decimal(5, 2)), CAST(72.00 AS Decimal(5, 2)), N'Left', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings/bukayo-saka/247839', 8, 398)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (43, N'Jamal', NULL, N'Musiala', NULL, CAST(N'2003-02-26' AS Date), CAST(1.84 AS Decimal(5, 2)), CAST(72.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings/jamal-musiala/256513', 3, 402)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (44, N'Pedri', NULL, N'González', N'López', CAST(N'2002-11-25' AS Date), CAST(1.74 AS Decimal(5, 2)), CAST(60.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings/pedri/255939', 5, 395)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (45, N'Khvicha', NULL, N'Kvaratskhelia', NULL, CAST(N'2001-02-12' AS Date), CAST(1.83 AS Decimal(5, 2)), CAST(70.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings/khvicha-kvaratskhelia/247747', 26, 410)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (46, N'Florian', NULL, N'Wirtz', NULL, CAST(N'2003-05-03' AS Date), CAST(1.77 AS Decimal(5, 2)), CAST(72.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings/florian-wirtz/253261', 3, 429)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (47, N'Gavi', NULL, N'Páez', N'Gavira', CAST(N'2004-08-05' AS Date), CAST(1.73 AS Decimal(5, 2)), CAST(68.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings/gavi/258404', 5, 395)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (48, N'Alejandro', NULL, N'Garnacho', NULL, CAST(N'2004-07-01' AS Date), CAST(1.80 AS Decimal(5, 2)), CAST(74.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.ea.com/games/ea-sports-fc/ratings/player-ratings/garnacho/259928', 1, 400)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (49, N'Isco', NULL, N'Alarcón', N'Suárez', CAST(N'1992-04-21' AS Date), CAST(1.76 AS Decimal(5, 2)), CAST(75.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.transfermarkt.com/isco/profil/spieler/85288', 5, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (50, N'Sergio', NULL, N'Rico', N'González', CAST(N'1993-09-01' AS Date), CAST(1.94 AS Decimal(5, 2)), CAST(90.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.transfermarkt.com/sergio-rico/profil/spieler/128959', 5, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (51, N'Jesse', NULL, N'Lingard', NULL, CAST(N'1992-12-15' AS Date), CAST(1.75 AS Decimal(5, 2)), CAST(65.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.transfermarkt.com/jesse-lingard/profil/spieler/141660', 8, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (52, N'Jean', N'Philippe', N'Gbamin', NULL, CAST(N'1995-09-25' AS Date), CAST(1.86 AS Decimal(5, 2)), CAST(80.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.transfermarkt.com/jean-philippe-gbamin/profil/spieler/183511', 24, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (53, N'Adel', NULL, N'Taarabt', NULL, CAST(N'1989-05-24' AS Date), CAST(1.80 AS Decimal(5, 2)), CAST(77.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.transfermarkt.com/adel-taarabt/profil/spieler/44629', 36, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (54, N'Santiago', NULL, N'Ascacíbar', NULL, CAST(N'1997-02-25' AS Date), CAST(1.68 AS Decimal(5, 2)), CAST(66.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.transfermarkt.com/santiago-ascacibar/profil/spieler/332024', 1, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (55, N'Juan', NULL, N'Iturbe', NULL, CAST(N'1993-06-04' AS Date), CAST(1.69 AS Decimal(5, 2)), CAST(65.00 AS Decimal(5, 2)), N'Left', 0, N'https://www.transfermarkt.com/juan-iturbe/profil/spieler/145716', 13, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (56, N'Giovani', NULL, N'dos', N'Santos', CAST(N'1989-05-11' AS Date), CAST(1.74 AS Decimal(5, 2)), CAST(71.00 AS Decimal(5, 2)), N'Left', 0, N'https://www.transfermarkt.com/giovani-dos-santos/profil/spieler/44625', 13, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (57, N'Marco', NULL, N'Fabián', N'de la Mora', CAST(N'1989-07-21' AS Date), CAST(1.70 AS Decimal(5, 2)), CAST(70.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.transfermarkt.com/marco-fabian/profil/spieler/98723', 13, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (58, N'Carlos', N'Alberto', N'Peña', N'Rodríguez', CAST(N'1990-03-29' AS Date), CAST(1.76 AS Decimal(5, 2)), CAST(72.00 AS Decimal(5, 2)), N'Right', 0, N'https://www.transfermarkt.com/carlos-pena/profil/spieler/117432', 13, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (59, N'Iker', NULL, N'Casillas', N'Fernández', CAST(N'1981-05-20' AS Date), CAST(1.82 AS Decimal(5, 2)), CAST(84.00 AS Decimal(5, 2)), N'Right', 1, N'https://www.transfermarkt.com/iker-casillas/profil/spieler/3609', 5, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (60, N'Andrés', NULL, N'Iniesta', N'Luján', CAST(N'1984-05-11' AS Date), CAST(1.71 AS Decimal(5, 2)), CAST(68.00 AS Decimal(5, 2)), N'Right', 1, N'https://www.transfermarkt.com/andres-iniesta/profil/spieler/7600', 5, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (61, N'Bastian', NULL, N'Schweinsteiger', NULL, CAST(N'1984-08-01' AS Date), CAST(1.83 AS Decimal(5, 2)), CAST(79.00 AS Decimal(5, 2)), N'Right', 1, N'https://www.transfermarkt.com/bastian-schweinsteiger/profil/spieler/2514', 3, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (62, N'Philipp', NULL, N'Lahm', NULL, CAST(N'1983-11-11' AS Date), CAST(1.70 AS Decimal(5, 2)), CAST(62.00 AS Decimal(5, 2)), N'Right', 1, N'https://www.transfermarkt.com/philipp-lahm/profil/spieler/2830', 3, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (63, N'Xavi', NULL, N'Hernández', N'Creus', CAST(N'1980-01-25' AS Date), CAST(1.70 AS Decimal(5, 2)), CAST(68.00 AS Decimal(5, 2)), N'Right', 1, N'https://www.transfermarkt.com/xavi/profil/spieler/7603', 5, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (64, N'Francesco', NULL, N'Totti', NULL, CAST(N'1976-09-27' AS Date), CAST(1.80 AS Decimal(5, 2)), CAST(82.00 AS Decimal(5, 2)), N'Right', 1, N'https://www.transfermarkt.com/francesco-totti/profil/spieler/3665', 6, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (65, N'Ronaldinho', NULL, N'de', N'Assis', CAST(N'1980-03-21' AS Date), CAST(1.82 AS Decimal(5, 2)), CAST(80.00 AS Decimal(5, 2)), N'Right', 1, N'https://www.transfermarkt.com/ronaldinho/profil/spieler/3373', 2, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (66, N'Zlatan', NULL, N'Ibrahimovic', NULL, CAST(N'1981-10-03' AS Date), CAST(1.95 AS Decimal(5, 2)), CAST(95.00 AS Decimal(5, 2)), N'Right', 1, N'https://www.transfermarkt.com/zlatan-ibrahimovic/profil/spieler/3455', 23, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (67, N'David', NULL, N'Beckham', NULL, CAST(N'1975-05-02' AS Date), CAST(1.83 AS Decimal(5, 2)), CAST(75.00 AS Decimal(5, 2)), N'Right', 1, N'https://www.transfermarkt.com/david-beckham/profil/spieler/1385', 8, NULL)
INSERT [dbo].[Jugador] ([id_jugador], [primer_nombre], [segundo_nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [altura], [peso], [pierna_dominante], [retirado], [foto_url], [id_nacionalidad], [id_club]) VALUES (68, N'Thierry', NULL, N'Henry', NULL, CAST(N'1977-08-17' AS Date), CAST(1.88 AS Decimal(5, 2)), CAST(83.00 AS Decimal(5, 2)), N'Right', 1, N'https://www.transfermarkt.com/thierry-henry/profil/spieler/320', 4, NULL)
SET IDENTITY_INSERT [dbo].[Jugador] OFF
GO
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (1, 1, 82)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (1, 2, 67)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (1, 3, 64)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (1, 4, 89)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (1, 5, 75)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (1, 6, 84)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (2, 1, 95)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (2, 2, 62)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (2, 3, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (2, 4, 88)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (2, 5, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (2, 6, 71)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (3, 1, 78)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (3, 2, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (3, 3, 61)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (3, 4, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (3, 5, 77)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (3, 6, 74)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (4, 1, 94)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (4, 2, 90)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (4, 3, 61)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (4, 4, 78)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (4, 5, 77)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (4, 6, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (5, 1, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (5, 2, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (5, 3, 72)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (5, 4, 89)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (5, 5, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (5, 6, 92)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (6, 1, 74)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (6, 2, 91)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (6, 3, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (6, 4, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (6, 5, 86)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (6, 6, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (7, 1, 72)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (7, 2, 64)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (7, 3, 94)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (7, 4, 74)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (7, 5, 62)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (7, 6, 84)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (8, 1, 64)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (8, 2, 62)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (8, 3, 83)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (8, 4, 91)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (8, 5, 71)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (8, 6, 69)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (9, 1, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (9, 2, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (9, 3, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (9, 4, 70)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (9, 5, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (9, 6, 60)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (10, 1, 61)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (10, 2, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (10, 3, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (10, 4, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (10, 5, 91)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (10, 6, 67)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (11, 1, 67)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (11, 2, 91)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (11, 3, 64)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (11, 4, 74)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (11, 5, 78)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (11, 6, 89)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (12, 1, 62)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (12, 2, 72)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (12, 3, 87)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (12, 4, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (12, 5, 89)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (12, 6, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (13, 1, 78)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (13, 2, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (13, 3, 83)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (13, 4, 95)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (13, 5, 64)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (13, 6, 74)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (14, 1, 64)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (14, 2, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (14, 3, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (14, 4, 92)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (14, 5, 87)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (14, 6, 81)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (15, 1, 91)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (15, 2, 84)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (15, 3, 84)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (15, 4, 87)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (15, 5, 74)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (15, 6, 95)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (16, 1, 76)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (16, 2, 89)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (16, 3, 75)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (16, 4, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (16, 5, 75)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (16, 6, 74)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (17, 1, 71)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (17, 2, 84)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (17, 3, 89)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (17, 4, 88)
GO
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (17, 5, 72)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (17, 6, 84)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (18, 1, 62)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (18, 2, 81)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (18, 3, 86)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (18, 4, 83)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (18, 5, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (18, 6, 71)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (19, 1, 83)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (19, 2, 69)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (19, 3, 67)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (19, 4, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (19, 5, 69)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (19, 6, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (20, 1, 82)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (20, 2, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (20, 3, 88)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (20, 4, 74)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (20, 5, 93)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (20, 6, 74)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (21, 1, 62)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (21, 2, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (21, 3, 71)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (21, 4, 75)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (21, 5, 67)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (21, 6, 92)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (22, 1, 93)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (22, 2, 60)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (22, 3, 92)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (22, 4, 82)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (22, 5, 92)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (22, 6, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (23, 1, 75)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (23, 2, 95)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (23, 3, 63)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (23, 4, 89)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (23, 5, 82)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (23, 6, 61)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (24, 1, 71)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (24, 2, 81)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (24, 3, 64)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (24, 4, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (24, 5, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (24, 6, 91)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (25, 1, 94)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (25, 2, 81)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (25, 3, 73)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (25, 4, 93)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (25, 5, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (25, 6, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (26, 1, 60)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (26, 2, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (26, 3, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (26, 4, 60)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (26, 5, 89)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (26, 6, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (27, 1, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (27, 2, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (27, 3, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (27, 4, 94)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (27, 5, 90)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (27, 6, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (28, 1, 77)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (28, 2, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (28, 3, 72)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (28, 4, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (28, 5, 92)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (28, 6, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (29, 1, 61)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (29, 2, 73)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (29, 3, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (29, 4, 69)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (29, 5, 88)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (29, 6, 93)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (30, 1, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (30, 2, 77)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (30, 3, 67)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (30, 4, 64)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (30, 5, 77)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (30, 6, 95)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (31, 1, 74)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (31, 2, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (31, 3, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (31, 4, 72)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (31, 5, 61)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (31, 6, 63)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (32, 1, 86)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (32, 2, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (32, 3, 88)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (32, 4, 95)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (32, 5, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (32, 6, 84)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (33, 1, 70)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (33, 2, 81)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (33, 3, 89)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (33, 4, 78)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (33, 5, 84)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (33, 6, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (34, 1, 77)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (34, 2, 95)
GO
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (34, 3, 95)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (34, 4, 69)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (34, 5, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (34, 6, 89)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (35, 1, 77)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (35, 2, 87)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (35, 3, 82)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (35, 4, 67)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (35, 5, 64)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (35, 6, 83)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (36, 1, 84)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (36, 2, 84)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (36, 3, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (36, 4, 81)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (36, 5, 64)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (36, 6, 69)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (37, 1, 60)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (37, 2, 72)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (37, 3, 95)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (37, 4, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (37, 5, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (37, 6, 60)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (38, 1, 78)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (38, 2, 69)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (38, 3, 73)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (38, 4, 69)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (38, 5, 93)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (38, 6, 64)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (39, 1, 87)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (39, 2, 89)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (39, 3, 72)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (39, 4, 60)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (39, 5, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (39, 6, 60)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (40, 1, 62)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (40, 2, 67)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (40, 3, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (40, 4, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (40, 5, 73)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (40, 6, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (41, 1, 74)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (41, 2, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (41, 3, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (41, 4, 94)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (41, 5, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (41, 6, 67)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (42, 1, 69)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (42, 2, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (42, 3, 89)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (42, 4, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (42, 5, 63)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (42, 6, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (43, 1, 67)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (43, 2, 75)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (43, 3, 88)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (43, 4, 60)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (43, 5, 69)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (43, 6, 76)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (44, 1, 81)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (44, 2, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (44, 3, 90)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (44, 4, 82)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (44, 5, 63)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (44, 6, 76)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (45, 1, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (45, 2, 60)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (45, 3, 94)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (45, 4, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (45, 5, 72)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (45, 6, 62)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (46, 1, 74)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (46, 2, 89)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (46, 3, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (46, 4, 64)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (46, 5, 93)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (46, 6, 88)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (47, 1, 92)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (47, 2, 71)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (47, 3, 67)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (47, 4, 81)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (47, 5, 69)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (47, 6, 91)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (48, 1, 92)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (48, 2, 75)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (48, 3, 62)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (48, 4, 83)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (48, 5, 81)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (48, 6, 91)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (49, 1, 73)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (49, 2, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (49, 3, 87)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (49, 4, 73)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (49, 5, 60)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (49, 6, 72)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (50, 1, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (50, 2, 91)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (50, 3, 67)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (50, 4, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (50, 5, 71)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (50, 6, 88)
GO
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (51, 1, 81)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (51, 2, 83)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (51, 3, 60)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (51, 4, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (51, 5, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (51, 6, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (52, 1, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (52, 2, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (52, 3, 84)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (52, 4, 82)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (52, 5, 70)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (52, 6, 94)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (53, 1, 76)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (53, 2, 83)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (53, 3, 81)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (53, 4, 77)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (53, 5, 83)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (53, 6, 71)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (54, 1, 93)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (54, 2, 76)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (54, 3, 72)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (54, 4, 86)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (54, 5, 61)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (54, 6, 76)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (55, 1, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (55, 2, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (55, 3, 90)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (55, 4, 70)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (55, 5, 75)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (55, 6, 84)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (56, 1, 61)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (56, 2, 62)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (56, 3, 70)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (56, 4, 87)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (56, 5, 93)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (56, 6, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (57, 1, 86)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (57, 2, 74)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (57, 3, 94)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (57, 4, 81)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (57, 5, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (57, 6, 60)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (58, 1, 62)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (58, 2, 75)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (58, 3, 91)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (58, 4, 75)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (58, 5, 81)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (58, 6, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (59, 1, 64)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (59, 2, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (59, 3, 62)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (59, 4, 73)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (59, 5, 70)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (59, 6, 71)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (60, 1, 61)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (60, 2, 73)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (60, 3, 72)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (60, 4, 87)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (60, 5, 87)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (60, 6, 66)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (61, 1, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (61, 2, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (61, 3, 60)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (61, 4, 72)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (61, 5, 76)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (61, 6, 91)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (62, 1, 77)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (62, 2, 87)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (62, 3, 86)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (62, 4, 61)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (62, 5, 65)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (62, 6, 90)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (63, 1, 77)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (63, 2, 89)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (63, 3, 73)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (63, 4, 63)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (63, 5, 62)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (63, 6, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (64, 1, 90)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (64, 2, 87)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (64, 3, 74)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (64, 4, 87)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (64, 5, 93)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (64, 6, 93)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (65, 1, 94)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (65, 2, 90)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (65, 3, 82)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (65, 4, 95)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (65, 5, 85)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (65, 6, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (66, 1, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (66, 2, 90)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (66, 3, 93)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (66, 4, 79)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (66, 5, 88)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (66, 6, 83)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (67, 1, 68)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (67, 2, 80)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (67, 3, 67)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (67, 4, 84)
GO
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (67, 5, 93)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (67, 6, 72)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (68, 1, 78)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (68, 2, 92)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (68, 3, 83)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (68, 4, 71)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (68, 5, 91)
INSERT [dbo].[Jugador_Habilidad] ([id_jugador], [id_habilidad], [valor]) VALUES (68, 6, 89)
GO
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (1, 8)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (2, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (3, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (4, 7)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (4, 12)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (5, 1)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (6, 1)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (7, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (8, 1)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (8, 8)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (8, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (9, 1)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (9, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (9, 12)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (10, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (11, 11)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (12, 7)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (13, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (13, 7)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (14, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (15, 12)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (16, 7)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (17, 1)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (17, 7)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (18, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (19, 3)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (20, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (21, 7)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (22, 3)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (23, 3)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (24, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (25, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (25, 12)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (26, 9)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (26, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (27, 7)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (27, 12)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (28, 6)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (28, 8)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (29, 1)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (29, 3)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (30, 3)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (31, 1)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (31, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (32, 8)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (33, 3)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (33, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (34, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (35, 6)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (36, 9)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (37, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (37, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (38, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (39, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (40, 2)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (41, 7)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (41, 11)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (42, 3)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (43, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (44, 11)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (45, 1)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (46, 3)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (47, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (48, 1)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (48, 11)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (49, 7)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (49, 11)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (50, 3)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (50, 9)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (51, 2)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (51, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (52, 8)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (53, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (54, 8)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (54, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (55, 6)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (56, 1)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (57, 8)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (57, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (57, 12)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (58, 8)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (58, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (59, 4)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (60, 3)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (61, 8)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (61, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (62, 7)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (62, 11)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (63, 7)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (64, 9)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (64, 11)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (65, 3)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (66, 7)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (67, 8)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (68, 8)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (68, 10)
INSERT [dbo].[Jugador_Posicion] ([id_jugador], [id_posicion]) VALUES (68, 12)
GO
SET IDENTITY_INSERT [dbo].[Nacionalidad] ON 

INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (1, N'Argentina')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (2, N'Brasil')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (3, N'Alemania')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (4, N'Francia')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (5, N'España')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (6, N'Italia')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (7, N'Portugal')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (8, N'Inglaterra')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (9, N'Países Bajos')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (10, N'Bélgica')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (11, N'Uruguay')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (12, N'Colombia')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (13, N'México')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (14, N'Chile')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (15, N'Perú')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (16, N'Estados Unidos')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (17, N'Canadá')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (18, N'Japón')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (19, N'Corea del Sur')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (20, N'Australia')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (21, N'Rusia')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (22, N'Polonia')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (23, N'Suecia')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (24, N'Suiza')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (25, N'Turquía')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (26, N'Grecia')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (27, N'Dinamarca')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (28, N'Noruega')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (29, N'Finlandia')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (30, N'República Checa')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (31, N'África del Sur')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (32, N'Nigeria')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (33, N'Senegal')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (34, N'Ghana')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (35, N'Argelia')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (36, N'Marruecos')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (37, N'Egipto')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (38, N'Túnez')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (39, N'Costa de Marfil')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (40, N'Camerún')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (41, N'Japón')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (42, N'China')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (43, N'India')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (44, N'Indonesia')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (45, N'Malasia')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (46, N'Filipinas')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (47, N'Tailandia')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (48, N'Vietnam')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (49, N'Singapur')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (50, N'Hong Kong')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (51, N'Costa Rica')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (52, N'Panamá')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (53, N'Honduras')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (54, N'El Salvador')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (55, N'Guatemala')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (56, N'Nicaragua')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (57, N'Cuba')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (58, N'República Dominicana')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (59, N'Puerto Rico')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (60, N'Jamaica')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (61, N'Trinidad y Tobago')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (62, N'Barbados')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (63, N'Bahamas')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (64, N'Bermudas')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (65, N'Antigua y Barbuda')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (66, N'San Cristóbal y Nieves')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (67, N'Dominica')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (68, N'San Vicente y las Granadinas')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (69, N'Santa Lucía')
INSERT [dbo].[Nacionalidad] ([id_nacionalidad], [pais]) VALUES (70, N'Granada')
SET IDENTITY_INSERT [dbo].[Nacionalidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Posicion] ON 

INSERT [dbo].[Posicion] ([id_posicion], [nombre_posicion]) VALUES (1, N'CAM')
INSERT [dbo].[Posicion] ([id_posicion], [nombre_posicion]) VALUES (2, N'CB')
INSERT [dbo].[Posicion] ([id_posicion], [nombre_posicion]) VALUES (3, N'CDM')
INSERT [dbo].[Posicion] ([id_posicion], [nombre_posicion]) VALUES (4, N'CM')
INSERT [dbo].[Posicion] ([id_posicion], [nombre_posicion]) VALUES (5, N'GK')
INSERT [dbo].[Posicion] ([id_posicion], [nombre_posicion]) VALUES (6, N'LB')
INSERT [dbo].[Posicion] ([id_posicion], [nombre_posicion]) VALUES (7, N'LM')
INSERT [dbo].[Posicion] ([id_posicion], [nombre_posicion]) VALUES (8, N'LW')
INSERT [dbo].[Posicion] ([id_posicion], [nombre_posicion]) VALUES (9, N'RB')
INSERT [dbo].[Posicion] ([id_posicion], [nombre_posicion]) VALUES (10, N'RM')
INSERT [dbo].[Posicion] ([id_posicion], [nombre_posicion]) VALUES (11, N'RW')
INSERT [dbo].[Posicion] ([id_posicion], [nombre_posicion]) VALUES (12, N'ST')
SET IDENTITY_INSERT [dbo].[Posicion] OFF
GO
ALTER TABLE [dbo].[auditoria_evaluacion] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[Jugador] ADD  DEFAULT ((0)) FOR [retirado]
GO
ALTER TABLE [dbo].[Evaluacion]  WITH CHECK ADD  CONSTRAINT [fk_evaluacion_jugador] FOREIGN KEY([id_jugador])
REFERENCES [dbo].[Jugador] ([id_jugador])
GO
ALTER TABLE [dbo].[Evaluacion] CHECK CONSTRAINT [fk_evaluacion_jugador]
GO
ALTER TABLE [dbo].[Evaluacion]  WITH CHECK ADD  CONSTRAINT [fk_evaluacion_posicion] FOREIGN KEY([id_posicion])
REFERENCES [dbo].[Posicion] ([id_posicion])
GO
ALTER TABLE [dbo].[Evaluacion] CHECK CONSTRAINT [fk_evaluacion_posicion]
GO
ALTER TABLE [dbo].[Historial_Clubes]  WITH CHECK ADD  CONSTRAINT [fk_historial_club] FOREIGN KEY([id_club])
REFERENCES [dbo].[Club] ([id_club])
GO
ALTER TABLE [dbo].[Historial_Clubes] CHECK CONSTRAINT [fk_historial_club]
GO
ALTER TABLE [dbo].[Historial_Clubes]  WITH CHECK ADD  CONSTRAINT [fk_historial_jugador] FOREIGN KEY([id_jugador])
REFERENCES [dbo].[Jugador] ([id_jugador])
GO
ALTER TABLE [dbo].[Historial_Clubes] CHECK CONSTRAINT [fk_historial_jugador]
GO
ALTER TABLE [dbo].[Jugador]  WITH CHECK ADD  CONSTRAINT [fk_jugador_club] FOREIGN KEY([id_club])
REFERENCES [dbo].[Club] ([id_club])
GO
ALTER TABLE [dbo].[Jugador] CHECK CONSTRAINT [fk_jugador_club]
GO
ALTER TABLE [dbo].[Jugador]  WITH CHECK ADD  CONSTRAINT [fk_jugador_nacionalidad] FOREIGN KEY([id_nacionalidad])
REFERENCES [dbo].[Nacionalidad] ([id_nacionalidad])
GO
ALTER TABLE [dbo].[Jugador] CHECK CONSTRAINT [fk_jugador_nacionalidad]
GO
ALTER TABLE [dbo].[Jugador_Habilidad]  WITH CHECK ADD  CONSTRAINT [fk_jugador_habilidad_habilidad] FOREIGN KEY([id_habilidad])
REFERENCES [dbo].[Habilidad] ([id_habilidad])
GO
ALTER TABLE [dbo].[Jugador_Habilidad] CHECK CONSTRAINT [fk_jugador_habilidad_habilidad]
GO
ALTER TABLE [dbo].[Jugador_Habilidad]  WITH CHECK ADD  CONSTRAINT [fk_jugador_habilidad_jugador] FOREIGN KEY([id_jugador])
REFERENCES [dbo].[Jugador] ([id_jugador])
GO
ALTER TABLE [dbo].[Jugador_Habilidad] CHECK CONSTRAINT [fk_jugador_habilidad_jugador]
GO
ALTER TABLE [dbo].[Jugador_Posicion]  WITH CHECK ADD  CONSTRAINT [fk_jugador_posicion_jugador] FOREIGN KEY([id_jugador])
REFERENCES [dbo].[Jugador] ([id_jugador])
GO
ALTER TABLE [dbo].[Jugador_Posicion] CHECK CONSTRAINT [fk_jugador_posicion_jugador]
GO
ALTER TABLE [dbo].[Jugador_Posicion]  WITH CHECK ADD  CONSTRAINT [fk_jugador_posicion_posicion] FOREIGN KEY([id_posicion])
REFERENCES [dbo].[Posicion] ([id_posicion])
GO
ALTER TABLE [dbo].[Jugador_Posicion] CHECK CONSTRAINT [fk_jugador_posicion_posicion]
GO
ALTER TABLE [dbo].[Evaluacion]  WITH CHECK ADD CHECK  (([puntaje_equilibrador]='J' OR [puntaje_equilibrador]='I' OR [puntaje_equilibrador]='H' OR [puntaje_equilibrador]='G' OR [puntaje_equilibrador]='F' OR [puntaje_equilibrador]='E' OR [puntaje_equilibrador]='D' OR [puntaje_equilibrador]='C' OR [puntaje_equilibrador]='B' OR [puntaje_equilibrador]='A'))
GO
ALTER TABLE [dbo].[Jugador_Habilidad]  WITH CHECK ADD CHECK  (([valor]>=(0) AND [valor]<=(100)))
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_rating]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

-- 3. Cambiar rating de una evaluación
CREATE PROCEDURE [dbo].[sp_actualizar_rating]
    @id_evaluacion INT,
    @nuevo_rating DECIMAL(4,2)
AS
BEGIN
    UPDATE Evaluacion
    SET rating = @nuevo_rating
    WHERE id_evaluacion = @id_evaluacion;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_cambiar_club_jugador]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

-- 4. Asignar nuevo club a un jugador (y registrar historial)
CREATE PROCEDURE [dbo].[sp_cambiar_club_jugador]
    @id_jugador INT,
    @nuevo_id_club INT,
    @fecha_inicio DATE
AS
BEGIN
    DECLARE @club_actual INT;
    SELECT @club_actual = id_club FROM Jugador WHERE id_jugador = @id_jugador;

    IF @club_actual IS NOT NULL
    BEGIN
        UPDATE Historial_Clubes
        SET fecha_fin = @fecha_inicio
        WHERE id_jugador = @id_jugador AND fecha_fin IS NULL;

        INSERT INTO Historial_Clubes (id_jugador, id_club, fecha_inicio)
        VALUES (@id_jugador, @club_actual, (SELECT ISNULL(MAX(fecha_inicio), @fecha_inicio) FROM Historial_Clubes WHERE id_jugador = @id_jugador));
    END

    UPDATE Jugador
    SET id_club = @nuevo_id_club
    WHERE id_jugador = @id_jugador;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_top_jugadores_por_habilidad]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

-- 2. Top N jugadores por habilidad específica
CREATE PROCEDURE [dbo].[sp_top_jugadores_por_habilidad]
    @nombre_habilidad VARCHAR(50),
    @N INT
AS
BEGIN
    SELECT TOP (@N) j.*, h.valor
    FROM Jugador j
    JOIN Jugador_Habilidad h ON j.id_jugador = h.id_jugador
    JOIN Habilidad ha ON h.id_habilidad = ha.id_habilidad
    WHERE ha.nombre_habilidad = @nombre_habilidad
    ORDER BY h.valor DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_top5_semanal_por_posicion]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

-- 5. Generar resumen semanal de los top 5 por posición
CREATE PROCEDURE [dbo].[sp_top5_semanal_por_posicion]
    @fecha_inicio DATE,
    @fecha_fin DATE
AS
BEGIN
    SELECT p.nombre_posicion, j.id_jugador, j.primer_nombre, j.primer_apellido, e.rating
    FROM Evaluacion e
    JOIN Jugador j ON e.id_jugador = j.id_jugador
    JOIN Posicion p ON e.id_posicion = p.id_posicion
    WHERE e.fecha BETWEEN @fecha_inicio AND @fecha_fin
    AND e.rating IS NOT NULL
    ORDER BY p.nombre_posicion, e.rating DESC;
END;
GO
/****** Object:  Trigger [dbo].[trg_update_rating]    Script Date: 07/06/2025 21:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Crear trg_update_rating Trigger que verifica o registra una acción cada vez que se inserta o actualiza una evaluación.
CREATE TRIGGER [dbo].[trg_update_rating]
ON [dbo].[Evaluacion]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Crear la tabla de auditoría si no existe
    IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auditoria_evaluacion]') AND type in (N'U'))
    BEGIN
        CREATE TABLE auditoria_evaluacion (
            id_auditoria INT IDENTITY(1,1) PRIMARY KEY,
            fecha_registro DATETIME DEFAULT GETDATE(),
            usuario NVARCHAR(128),
            accion VARCHAR(20),
            tabla VARCHAR(50),
            id_evaluacion INT
        );
    END

    -- Insertar registro de auditoría solo para UPDATE
    IF EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO auditoria_evaluacion (fecha_registro, usuario, accion, tabla, id_evaluacion)
        SELECT 
            GETDATE(),
            (SELECT login_name FROM sys.dm_exec_sessions WHERE session_id = @@SPID),
            'actualizar',
            'Evaluacion',
            d.id_evaluacion
        FROM deleted d;
    END
END;
GO
ALTER TABLE [dbo].[Evaluacion] ENABLE TRIGGER [trg_update_rating]
GO
USE [master]
GO
ALTER DATABASE [FIFA_DB] SET  READ_WRITE 
GO
