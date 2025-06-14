USE [FIFA_DB]
GO
/****** Object:  StoredProcedure [dbo].[BuscarJugadores]    Script Date: 08/06/2025 0:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[BuscarJugadores]
  @nombre NVARCHAR(100) = NULL,
  @nacionalidad NVARCHAR(100) = NULL,
  @pierna NVARCHAR(10) = NULL,
  @posicion NVARCHAR(10) = NULL,
  @club NVARCHAR(100) = NULL
AS
BEGIN
  SELECT 
    J.id_jugador,
    CONCAT(J.primer_nombre, ' ', J.primer_apellido) AS nombre_completo,
    N.pais AS nacionalidad,
    J.pierna_dominante,
    C.nombre_club,
    P.nombre_posicion,
    AVG(E.rating) AS rating_promedio
  FROM Jugador J
  LEFT JOIN Nacionalidad N ON J.id_nacionalidad = N.id_nacionalidad
  LEFT JOIN Club C ON J.id_club = C.id_club
  LEFT JOIN Jugador_Posicion JP ON J.id_jugador = JP.id_jugador
  LEFT JOIN Posicion P ON JP.id_posicion = P.id_posicion
  LEFT JOIN Evaluacion E ON J.id_jugador = E.id_jugador
  WHERE
    (@nombre IS NULL OR J.primer_nombre LIKE '%' + @nombre + '%' OR J.primer_apellido LIKE '%' + @nombre + '%')
    AND (@nacionalidad IS NULL OR N.pais = @nacionalidad)
    AND (@pierna IS NULL OR J.pierna_dominante = @pierna)
    AND (@posicion IS NULL OR P.nombre_posicion = @posicion)
    AND (@club IS NULL OR C.nombre_club = @club)
  GROUP BY J.id_jugador, J.primer_nombre, J.primer_apellido, N.pais, J.pierna_dominante, C.nombre_club, P.nombre_posicion
  ORDER BY rating_promedio DESC;
END
GO



EXEC BuscarJugadores @nacionalidad = 'Argentina', @posicion = 'ST';
GO
-- Esta consulta permite buscar jugadores filtrando por nombre, nacionalidad, pierna dominante, posición y club
-- y devuelve un listado con el nombre completo, nacionalidad, pierna dominante, club y posición,