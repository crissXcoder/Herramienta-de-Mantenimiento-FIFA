CREATE TABLE Historial_Clubes (
    id_historial INT IDENTITY(1,1) PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_club INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NULL,
    CONSTRAINT fk_historial_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador),
    CONSTRAINT fk_historial_club FOREIGN KEY (id_club) REFERENCES Club(id_club),
    CONSTRAINT chk_fechas_validas CHECK (fecha_fin IS NULL OR fecha_inicio < fecha_fin)
);