CREATE TABLE Jugador (
    id_jugador INT IDENTITY(1,1) PRIMARY KEY,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    fecha_nacimiento DATE NOT NULL CHECK (fecha_nacimiento BETWEEN '1950-01-01' AND GETDATE()),
    altura DECIMAL(5,2) NOT NULL CHECK (altura BETWEEN 1.00 AND 2.50),
    peso DECIMAL(5,2) NOT NULL CHECK (peso BETWEEN 40.00 AND 150.00),
    pierna_dominante VARCHAR(10),
    retirado BIT DEFAULT 0,
    foto_url VARCHAR(255),
    id_nacionalidad INT NOT NULL,
    id_club INT NULL,
    CONSTRAINT fk_jugador_nacionalidad FOREIGN KEY (id_nacionalidad) REFERENCES Nacionalidad(id_nacionalidad),
    CONSTRAINT fk_jugador_club FOREIGN KEY (id_club) REFERENCES Club(id_club)
);