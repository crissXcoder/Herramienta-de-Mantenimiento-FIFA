-- Consulta para buscar jugadores por nombre o apellido, útil para encontrar un jugador específico de manera flexible
-- Cumple: "Encontrar fácilmente los jugadores"
SELECT * 
FROM Jugador
WHERE primer_nombre LIKE '%Lionel%' OR primer_apellido LIKE '%Messi%';
go

-- Actualiza manualmente el rating de un jugador específico en una fecha y posición concretas
-- Cumple: "Poder cambiar el 'rating' del jugador dependiendo del desempeño semanal en su liga actual"
UPDATE Evaluacion
SET rating = 91.5
WHERE id_jugador = 1 AND id_posicion = 8;
go

-- Cálculo automatizado de un nuevo rating promedio tomando en cuenta:
-- - Puntaje de sofascore
-- - Puntaje de equilibrio (con valor por letra A–J)
-- - Un valor constante por defecto (5)
-- Cumple: "Poder determinar el rating de un jugador a partir de su evaluación anterior, el puntaje de sofascore y un puntaje dado por el que da el equilibrio al juego que por defecto le da 5"
SELECT 
  E.id_jugador,
  E.id_posicion,
  E.fecha,
  E.puntaje_sofascore,
  5 AS puntaje_equilibrador_default,
  CASE puntaje_equilibrador
    WHEN 'A' THEN 10 WHEN 'B' THEN 9 WHEN 'C' THEN 8 WHEN 'D' THEN 7
    WHEN 'E' THEN 6 WHEN 'F' THEN 5 WHEN 'G' THEN 4 WHEN 'H' THEN 3
    WHEN 'I' THEN 2 WHEN 'J' THEN 1
  END AS puntaje_eq_num,
  ROUND((E.puntaje_sofascore + 5 + 
         CASE puntaje_equilibrador
           WHEN 'A' THEN 10 WHEN 'B' THEN 9 WHEN 'C' THEN 8 WHEN 'D' THEN 7
           WHEN 'E' THEN 6 WHEN 'F' THEN 5 WHEN 'G' THEN 4 WHEN 'H' THEN 3
           WHEN 'I' THEN 2 WHEN 'J' THEN 1
         END) / 3, 2) AS nuevo_rating
FROM Evaluacion E;
go

-- Muestra los 5 mejores jugadores evaluados en la posición "ST" (delantero)
-- Útil para construir equipos semanalmente según desempeño
-- Cumple: "Una consulta que permita ver el top N de todas las posiciones o una posición específica"
-- También: "Dar herramientas al jugador para armar sus equipos, hacer ajustes"
SELECT TOP 5 E.*, J.primer_nombre, J.primer_apellido, P.nombre_posicion
FROM Evaluacion E
JOIN Jugador J ON J.id_jugador = E.id_jugador
JOIN Posicion P ON P.id_posicion = E.id_posicion
WHERE P.nombre_posicion = 'ST'
ORDER BY E.rating DESC;
go

-- Muestra los 5 mejores jugadores en la habilidad 'PAC' (pace/velocidad)
-- Cumple: "Una consulta que permita ver el top N con una habilidad específica"
SELECT TOP 5 JH.*, J.primer_nombre, J.primer_apellido, H.nombre_habilidad
FROM Jugador_Habilidad JH
JOIN Jugador J ON J.id_jugador = JH.id_jugador
JOIN Habilidad H ON H.id_habilidad = JH.id_habilidad
WHERE H.nombre_habilidad = 'PAC'
ORDER BY JH.valor DESC;
go

-- Lista los primeros 5 jugadores con pierna dominante izquierda
-- Cumple: "Una consulta que permita ver el top N con una pierna fuerte específica"
SELECT TOP 5 *
FROM Jugador
WHERE pierna_dominante = 'Left'
ORDER BY id_jugador;
go

-- Muestra 5 jugadores sin club actual (agentes libres)
-- Cumple: "Una consulta que permita ver el top N de jugadores sin equipo actualmente"
SELECT TOP 5 *
FROM Jugador
WHERE id_club IS NULL
ORDER BY id_jugador;
go

-- Muestra todos los datos de un jugador específico incluyendo nombre del club y país
-- Útil para mostrar la ficha completa del jugador
-- Cumple: "Una consulta que permita ver los detalles de un jugador para poder cargar sus datos"
SELECT J.*, N.pais AS nacionalidad, C.nombre_club
FROM Jugador J
LEFT JOIN Nacionalidad N ON J.id_nacionalidad = N.id_nacionalidad
LEFT JOIN Club C ON J.id_club = C.id_club
WHERE J.id_jugador = 1;
go

-- Actualiza el rating de todos los registros de evaluación aplicando la fórmula general de rating
-- Cumple: "Una consulta que permita actualizar el rating de los jugadores"
UPDATE E
SET rating = ROUND((puntaje_sofascore + 5 +
  CASE puntaje_equilibrador
    WHEN 'A' THEN 10 WHEN 'B' THEN 9 WHEN 'C' THEN 8 WHEN 'D' THEN 7
    WHEN 'E' THEN 6 WHEN 'F' THEN 5 WHEN 'G' THEN 4 WHEN 'H' THEN 3
    WHEN 'I' THEN 2 WHEN 'J' THEN 1
  END) / 3, 2)
FROM Evaluacion E;
go

-- Crea una vista para mostrar jugadores junto con su país (nacionalidad)
-- Cumple: "Una vista que permita ver los jugadores por equipos nacionales"
CREATE VIEW Vista_Jugadores_Nacionales AS
SELECT J.*, N.pais AS nacionalidad
FROM Jugador J
JOIN Nacionalidad N ON J.id_nacionalidad = N.id_nacionalidad;
go

-- Consulta sobre la vista anterior para ver los jugadores por nacionalidad
select * from Vista_Jugadores_Nacionales;
go

-- Crea una vista que muestra jugadores junto con nombre del club y liga
-- Cumple: "Una vista que permita ver los jugadores por clubes"
CREATE VIEW Vista_Jugadores_Clubes AS
SELECT J.*, C.nombre_club, C.liga
FROM Jugador J
JOIN Club C ON J.id_club = C.id_club;
go

-- Consulta sobre la vista anterior para ver los jugadores por club
select * from Vista_Jugadores_Clubes;
go

-- Consulta para identificar jugadores con más de una posición registrada
-- Cumple: "Una consulta con todos los jugadores con más de una posición"
SELECT id_jugador
FROM Jugador_Posicion
GROUP BY id_jugador
HAVING COUNT(*) > 1;
go

-- Consulta para listar todos los jugadores que están marcados como retirados
-- Cumple: "Una consulta con los jugadores que ya se han retirado (leyendas)"
SELECT *
FROM Jugador
WHERE retirado = 1;
go
