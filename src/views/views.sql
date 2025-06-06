-- Vista 1: vw_jugadores_detalle
CREATE VIEW vw_jugadores_detalle AS
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

-- Vista 2: vw_jugadores_habilidades
CREATE VIEW vw_jugadores_habilidades AS
SELECT 
    j.id_jugador,
    j.primer_nombre + ' ' + j.primer_apellido AS nombre_completo,
    h.nombre_habilidad,
    jh.valor
FROM Jugador j
JOIN Jugador_Habilidad jh ON j.id_jugador = jh.id_jugador
JOIN Habilidad h ON jh.id_habilidad = h.id_habilidad;

-- Vista 3: vw_evaluacion_reciente
CREATE VIEW vw_evaluacion_reciente AS
SELECT e.*
FROM Evaluacion e
JOIN (
    SELECT id_jugador, MAX(fecha) AS fecha_max
    FROM Evaluacion
    GROUP BY id_jugador
) ult ON e.id_jugador = ult.id_jugador AND e.fecha = ult.fecha_max;

-- Vista 4: vw_historial_clubes
CREATE VIEW vw_historial_clubes AS
SELECT 
    j.id_jugador,
    j.primer_nombre + ' ' + j.primer_apellido AS nombre_completo,
    c.nombre_club,
    hc.fecha_inicio,
    hc.fecha_fin
FROM Historial_Clubes hc
JOIN Jugador j ON hc.id_jugador = j.id_jugador
JOIN Club c ON hc.id_club = c.id_club;

-- Vista 5: vw_jugadores_posiciones
CREATE VIEW vw_jugadores_posiciones AS
SELECT 
    j.id_jugador,
    j.primer_nombre + ' ' + j.primer_apellido AS nombre_completo,
    p.nombre_posicion
FROM Jugador_Posicion jp
JOIN Jugador j ON jp.id_jugador = j.id_jugador
JOIN Posicion p ON jp.id_posicion = p.id_posicion;

-- Vista 6: vw_top5_por_posicion
CREATE VIEW vw_top5_por_posicion AS
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

-- Vista 7: vw_jugadores_libres
CREATE VIEW vw_jugadores_libres AS
SELECT 
    j.id_jugador,
    j.primer_nombre + ' ' + j.primer_apellido AS nombre_completo,
    n.pais AS nacionalidad
FROM Jugador j
JOIN Nacionalidad n ON j.id_nacionalidad = n.id_nacionalidad
WHERE j.id_club IS NULL;


-- Vista que muestra información completa del jugador con club y nacionalidad
CREATE VIEW vw_info_completa_jugador AS
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

go

-- Vista que une evaluaciones con jugador y posición
CREATE VIEW vw_evaluaciones_jugador AS
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

go
-- Vista para ver las habilidades de cada jugador por nombre
CREATE VIEW vw_habilidades_jugador AS
SELECT 
    j.id_jugador,
    CONCAT(j.primer_nombre, ' ', j.segundo_nombre, ' ', j.primer_apellido, ' ', j.segundo_apellido) AS nombre_completo,
    h.nombre_habilidad,
    jh.valor
FROM Jugador_Habilidad jh
INNER JOIN Jugador j ON jh.id_jugador = j.id_jugador
INNER JOIN Habilidad h ON jh.id_habilidad = h.id_habilidad;

go
-- Vista del historial completo de clubes por jugador
CREATE VIEW vw_historial_clubes_jugador AS
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
go