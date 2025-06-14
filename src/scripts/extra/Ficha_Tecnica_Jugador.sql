USE [FIFA_DB]
GO
/****** Object:  StoredProcedure [dbo].[VerFichaJugador]    Script Date: 08/06/2025 0:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[VerFichaJugador]
  @id_jugador INT
AS
BEGIN
  -- Datos generales
  SELECT 
    J.id_jugador,
    CONCAT(J.primer_nombre, ' ', J.primer_apellido) AS nombre_completo,
    J.fecha_nacimiento,
    DATEDIFF(YEAR, J.fecha_nacimiento, GETDATE()) AS edad,
    J.pierna_dominante,
    J.retirado,
    N.pais AS nacionalidad,
    C.nombre_club,
    C.liga,
    J.foto_url
  FROM Jugador J
  LEFT JOIN Nacionalidad N ON J.id_nacionalidad = N.id_nacionalidad
  LEFT JOIN Club C ON J.id_club = C.id_club
  WHERE J.id_jugador = @id_jugador;

  -- Posiciones
  SELECT P.nombre_posicion
  FROM Jugador_Posicion JP
  JOIN Posicion P ON JP.id_posicion = P.id_posicion
  WHERE JP.id_jugador = @id_jugador;

  -- Habilidades
  SELECT H.nombre_habilidad, JH.valor
  FROM Jugador_Habilidad JH
  JOIN Habilidad H ON JH.id_habilidad = H.id_habilidad
  WHERE JH.id_jugador = @id_jugador;

  -- Evaluaciones
  SELECT fecha, puntaje_sofascore, puntaje_equilibrador, rating
  FROM Evaluacion
  WHERE id_jugador = @id_jugador
  ORDER BY fecha DESC;

  -- Historial de clubes
  SELECT HC.fecha_inicio, HC.fecha_fin, C.nombre_club
  FROM Historial_Clubes HC
  JOIN Club C ON HC.id_club = C.id_club
  WHERE HC.id_jugador = @id_jugador
  ORDER BY HC.fecha_inicio DESC;
END
GO

EXEC VerFichaJugador @id_jugador = 1;
GO
-- Este procedimiento permite ver la ficha técnica completa de un jugador específico
-- incluyendo sus datos personales, posiciones, habilidades, evaluaciones y historial de clubes.
