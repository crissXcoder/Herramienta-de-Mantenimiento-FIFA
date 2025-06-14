USE [master]
GO
/****** Object:  Database [FIFA_DB]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  Table [dbo].[Nacionalidad]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  Table [dbo].[Club]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  Table [dbo].[Jugador]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  View [dbo].[vw_jugadores_detalle]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  Table [dbo].[Habilidad]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  Table [dbo].[Jugador_Habilidad]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  View [dbo].[vw_jugadores_habilidades]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  Table [dbo].[Evaluacion]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  View [dbo].[vw_evaluacion_reciente]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  Table [dbo].[Historial_Clubes]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  View [dbo].[vw_historial_clubes]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  Table [dbo].[Posicion]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  Table [dbo].[Jugador_Posicion]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  View [dbo].[vw_jugadores_posiciones]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  View [dbo].[vw_top5_por_posicion]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  View [dbo].[vw_jugadores_libres]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  View [dbo].[vw_info_completa_jugador]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  View [dbo].[vw_evaluaciones_jugador]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  View [dbo].[vw_habilidades_jugador]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  View [dbo].[vw_historial_clubes_jugador]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  Table [dbo].[auditoria_evaluacion]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_actualizar_rating]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cambiar_club_jugador]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_top_jugadores_por_habilidad]    Script Date: 07/06/2025 22:08:26 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_top5_semanal_por_posicion]    Script Date: 07/06/2025 22:08:26 ******/
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
USE [master]
GO
ALTER DATABASE [FIFA_DB] SET  READ_WRITE 
GO
