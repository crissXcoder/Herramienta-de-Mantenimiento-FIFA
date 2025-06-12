CREATE TABLE Evaluacion (
    id_evaluacion INT IDENTITY(1,1) PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_posicion INT NOT NULL,
    fecha DATE NOT NULL,
    puntaje_sofascore DECIMAL(4,2) NOT NULL,
    puntaje_equilibrador CHAR(1) NOT NULL CHECK (puntaje_equilibrador IN ('A','B','C','D','E','F','G','H','I','J')),
    rating DECIMAL(4,2) NOT NULL CHECK (rating BETWEEN 0 AND 100),
    CONSTRAINT fk_evaluacion_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador),
    CONSTRAINT fk_evaluacion_posicion FOREIGN KEY (id_posicion) REFERENCES Posicion(id_posicion)
);
