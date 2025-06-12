CREATE TABLE Jugador_Habilidad (
    id_jugador INT NOT NULL,
    id_habilidad INT NOT NULL,
    valor INT NOT NULL CHECK (valor BETWEEN 0 AND 100),
    PRIMARY KEY (id_jugador, id_habilidad),
    CONSTRAINT fk_jugador_habilidad_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador),
    CONSTRAINT fk_jugador_habilidad_habilidad FOREIGN KEY (id_habilidad) REFERENCES Habilidad(id_habilidad)
);