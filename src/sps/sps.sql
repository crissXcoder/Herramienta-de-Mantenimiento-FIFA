-- 1. Obtener detalle completo de un jugador
CREATE OR ALTER PROCEDURE sp_detalle_jugador
    @id_jugador INT
AS
BEGIN
    BEGIN TRY
        SELECT 
            j.id_jugador, j.primer_nombre, j.segundo_nombre, j.primer_apellido, j.segundo_apellido,
            j.fecha_nacimiento, j.altura, j.peso, j.pierna_dominante, j.retirado, j.foto_url,
            j.id_nacionalidad, j.id_club,
            n.pais AS nacionalidad,
            c.nombre_club, c.liga
        FROM Jugador j
        JOIN Nacionalidad n ON j.id_nacionalidad = n.id_nacionalidad
        LEFT JOIN Club c ON j.id_club = c.id_club
        WHERE j.id_jugador = @id_jugador;
    END TRY
    BEGIN CATCH
        PRINT 'Error al obtener el detalle del jugador';
        THROW;
    END CATCH
END;
GO



-- 2. Top N jugadores por habilidad específica
CREATE OR ALTER PROCEDURE sp_top_jugadores_por_habilidad
    @nombre_habilidad VARCHAR(50),
    @N INT
AS
BEGIN
    BEGIN TRY
        SELECT TOP (@N)
            j.id_jugador, j.primer_nombre, j.segundo_nombre, j.primer_apellido, j.segundo_apellido,
            j.fecha_nacimiento, j.altura, j.peso, j.pierna_dominante, j.retirado, j.foto_url,
            j.id_nacionalidad, j.id_club,
            h.valor
        FROM Jugador j
        JOIN Jugador_Habilidad h ON j.id_jugador = h.id_jugador
        JOIN Habilidad ha ON h.id_habilidad = ha.id_habilidad
        WHERE ha.nombre_habilidad = @nombre_habilidad
        ORDER BY h.valor DESC;
    END TRY
    BEGIN CATCH
        PRINT 'Error al obtener los jugadores por habilidad';
        THROW;
    END CATCH
END;
GO



-- 3. Cambiar rating de una evaluación
CREATE OR ALTER PROCEDURE sp_actualizar_rating
    @id_evaluacion INT,
    @nuevo_rating DECIMAL(4,2)
AS
BEGIN
    BEGIN TRY
        UPDATE Evaluacion
        SET rating = @nuevo_rating
        WHERE id_evaluacion = @id_evaluacion;
    END TRY
    BEGIN CATCH
        PRINT 'Error al actualizar el rating';
        THROW;
    END CATCH
END;
GO


-- 4. Asignar nuevo club a un jugador (y registrar historial)
CREATE OR ALTER PROCEDURE sp_cambiar_club_jugador
    @id_jugador INT,
    @nuevo_id_club INT,
    @fecha_inicio DATE
AS
BEGIN
    BEGIN TRY
        DECLARE @club_actual INT;
        SELECT @club_actual = id_club FROM Jugador WHERE id_jugador = @id_jugador;

        IF @club_actual IS NOT NULL
        BEGIN
            UPDATE Historial_Clubes
            SET fecha_fin = @fecha_inicio
            WHERE id_jugador = @id_jugador AND fecha_fin IS NULL;

            INSERT INTO Historial_Clubes (id_jugador, id_club, fecha_inicio)
            VALUES (
                @id_jugador, 
                @club_actual, 
                (SELECT ISNULL(MAX(fecha_inicio), @fecha_inicio) FROM Historial_Clubes WHERE id_jugador = @id_jugador)
            );
        END

        UPDATE Jugador
        SET id_club = @nuevo_id_club
        WHERE id_jugador = @id_jugador;
    END TRY
    BEGIN CATCH
        PRINT 'Error al cambiar el club del jugador';
        THROW;
    END CATCH
END;
GO


-- 5. Generar resumen semanal de los top 5 por posición
CREATE OR ALTER PROCEDURE sp_top5_semanal_por_posicion
    @fecha_inicio DATE,
    @fecha_fin DATE
AS
BEGIN
    BEGIN TRY
        WITH Rankings AS (
            SELECT 
                p.nombre_posicion,
                j.id_jugador,
                j.primer_nombre,
                j.primer_apellido,
                e.rating,
                ROW_NUMBER() OVER (PARTITION BY p.nombre_posicion ORDER BY e.rating DESC) AS rn
            FROM Evaluacion e
            JOIN Jugador j ON e.id_jugador = j.id_jugador
            JOIN Posicion p ON e.id_posicion = p.id_posicion
            WHERE e.fecha BETWEEN @fecha_inicio AND @fecha_fin
              AND e.rating IS NOT NULL
        )
        SELECT nombre_posicion, id_jugador, primer_nombre, primer_apellido, rating
        FROM Rankings
        WHERE rn <= 5
        ORDER BY nombre_posicion, rating DESC;
    END TRY
    BEGIN CATCH
        PRINT 'Error al generar el top 5 semanal por posición';
        THROW;
    END CATCH
END;
GO
