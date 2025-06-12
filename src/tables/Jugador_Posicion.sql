CREATE TABLE Jugador_Posicion (
    id_jugador INT NOT NULL,
    id_posicion INT NOT NULL,
    PRIMARY KEY (id_jugador, id_posicion),
    CONSTRAINT fk_jugador_posicion_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador),
    CONSTRAINT fk_jugador_posicion_posicion FOREIGN KEY (id_posicion) REFERENCES Posicion(id_posicion)
);