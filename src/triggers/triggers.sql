-- Crear trg_update_rating Trigger que verifica o registra una acción cada vez que se inserta o actualiza una evaluación.
CREATE TRIGGER trg_update_rating
ON Evaluacion
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

-- Trigger para registrar cambio de club en Historial_Clubes
CREATE TRIGGER trg_actualizar_club
ON Jugador
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(id_club)
    BEGIN
        INSERT INTO Historial_Clubes (id_jugador, id_club, fecha_inicio, fecha_fin)
        SELECT 
            i.id_jugador,
            i.id_club,
            GETDATE(), -- Fecha actual como fecha de inicio
            NULL
        FROM inserted i
        JOIN deleted d ON i.id_jugador = d.id_jugador
        WHERE i.id_club IS NOT NULL AND i.id_club != d.id_club;

        -- Cierra el ciclo del club anterior (fecha_fin)
        UPDATE hc
        SET hc.fecha_fin = GETDATE()
        FROM Historial_Clubes hc
        JOIN deleted d ON hc.id_jugador = d.id_jugador
        WHERE hc.fecha_fin IS NULL AND hc.id_club = d.id_club;
    END
END;
GO

-- Trigger para evitar que se elimine un jugador con historial
CREATE TRIGGER trg_prevent_delete_jugador
ON Jugador
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM deleted d
        JOIN Historial_Clubes hc ON d.id_jugador = hc.id_jugador
    )
    BEGIN
        RAISERROR('No se puede eliminar un jugador con historial de clubes.', 16, 1);
        ROLLBACK;
    END
    ELSE
    BEGIN
        DELETE FROM Jugador
        WHERE id_jugador IN (SELECT id_jugador FROM deleted);
    END
END;
GO
