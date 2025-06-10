-- Tabla Nacionalidad
CREATE TABLE Nacionalidad (
    id_nacionalidad INT IDENTITY(1,1) PRIMARY KEY,
    pais VARCHAR(50) NOT NULL
);

-- Tabla Club
CREATE TABLE Club (
    id_club INT IDENTITY(1,1) PRIMARY KEY,
    nombre_club VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    liga VARCHAR(100) NOT NULL
);

-- Tabla Jugador
CREATE TABLE Jugador (
    id_jugador INT IDENTITY(1,1) PRIMARY KEY,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    fecha_nacimiento DATE NOT NULL,
    altura DECIMAL(5,2) NOT NULL,
    peso DECIMAL(5,2) NOT NULL,
    pierna_dominante VARCHAR(10),
    retirado BIT DEFAULT 0,
    foto_url VARCHAR(255),
    id_nacionalidad INT NOT NULL,
    id_club INT NULL,
    CONSTRAINT fk_jugador_nacionalidad FOREIGN KEY (id_nacionalidad) REFERENCES Nacionalidad(id_nacionalidad),
    CONSTRAINT fk_jugador_club FOREIGN KEY (id_club) REFERENCES Club(id_club)
);

-- Tabla Posición
CREATE TABLE Posicion (
    id_posicion INT IDENTITY(1,1) PRIMARY KEY,
    nombre_posicion VARCHAR(10) NOT NULL
);

-- Tabla intermedia Jugador_Posicion
CREATE TABLE Jugador_Posicion (
    id_jugador INT NOT NULL,
    id_posicion INT NOT NULL,
    PRIMARY KEY (id_jugador, id_posicion),
    CONSTRAINT fk_jugador_posicion_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador),
    CONSTRAINT fk_jugador_posicion_posicion FOREIGN KEY (id_posicion) REFERENCES Posicion(id_posicion)
);

-- Tabla Evaluación (por jugador y posición)
CREATE TABLE Evaluacion (
    id_evaluacion INT IDENTITY(1,1) PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_posicion INT NOT NULL,
    fecha DATE NOT NULL,
    puntaje_sofascore DECIMAL(4,2) NOT NULL,
    puntaje_equilibrador CHAR(1) NOT NULL CHECK (puntaje_equilibrador IN ('A','B','C','D','E','F','G','H','I','J')),
    rating DECIMAL(4,2) NOT NULL,
    CONSTRAINT fk_evaluacion_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador),
    CONSTRAINT fk_evaluacion_posicion FOREIGN KEY (id_posicion) REFERENCES Posicion(id_posicion)
);

-- Tabla Habilidad
CREATE TABLE Habilidad (
    id_habilidad INT IDENTITY(1,1) PRIMARY KEY,
    nombre_habilidad VARCHAR(50) NOT NULL
);

-- Tabla intermedia Jugador_Habilidad
CREATE TABLE Jugador_Habilidad (
    id_jugador INT NOT NULL,
    id_habilidad INT NOT NULL,
    valor INT NOT NULL CHECK (valor BETWEEN 0 AND 100),
    PRIMARY KEY (id_jugador, id_habilidad),
    CONSTRAINT fk_jugador_habilidad_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador),
    CONSTRAINT fk_jugador_habilidad_habilidad FOREIGN KEY (id_habilidad) REFERENCES Habilidad(id_habilidad)
);

-- Tabla Historial_Clubes (opcional)
CREATE TABLE Historial_Clubes (
    id_historial INT IDENTITY(1,1) PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_club INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NULL,
    CONSTRAINT fk_historial_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador),
    CONSTRAINT fk_historial_club FOREIGN KEY (id_club) REFERENCES Club(id_club)
);