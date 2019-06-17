DROP DATABASE IF EXISTS ParcialLBD2018;
CREATE DATABASE IF NOT EXISTS ParcialLBD2018;
USE ParcialLBD2018;

DROP TABLE IF EXISTS Trabajos;
CREATE TABLE IF NOT EXISTS Trabajos (
	idTrabajo INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    duracion INT NOT NULL DEFAULT 6,
    area ENUM('Hardware','Redes','Software') NOT NULL,
    fechaPresentacion DATE NOT NULL,
    fechaAprobacion DATE NOT NULL,
    fechaFinalizacion DATE,
    PRIMARY KEY(idTrabajo),
    UNIQUE INDEX idx_titulo(titulo)
) ENGINE=INNODB;


DROP TABLE IF EXISTS Personas;
CREATE TABLE IF NOT EXISTS Personas (
	dni INT NOT NULL,
    apellidos VARCHAR(40) NOT NULL,
    nombres VARCHAR(40) NOT NULL,
    PRIMARY KEY(dni)
) ENGINE=INNODB;

DROP TABLE IF EXISTS Cargos;
CREATE TABLE IF NOT EXISTS Cargos (
	idCargo INT NOT NULL,
    cargo VARCHAR(20) NOT NULL,
    PRIMARY KEY(idCargo),
    UNIQUE INDEX idx_cargo(cargo)
) ENGINE=INNODB;

DROP TABLE IF EXISTS Profesores;
CREATE TABLE IF NOT EXISTS Profesores (
	dni INT NOT NULL,
    idCargo INT NOT NULL,
    PRIMARY KEY(dni),
    INDEX idx_idCargo(idCargo),
    FOREIGN KEY(dni) REFERENCES Personas(dni) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(idCargo) REFERENCES Cargos(idCargo) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB;

DROP TABLE IF EXISTS Alumnos;
CREATE TABLE IF NOT EXISTS Alumnos (
	dni INT NOT NULL,
    cx CHAR(7) NOT NULL,
    PRIMARY KEY(dni),
    UNIQUE INDEX idx_cx(cx),
    FOREIGN KEY(dni) REFERENCES Personas(dni) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB;

DROP TABLE IF EXISTS RolesEnTrabajos;
CREATE TABLE IF NOT EXISTS RolesEnTrabajos (
	idTrabajo INT NOT NULL,
    dni INT NOT NULL,
    rol ENUM('Tutor','Cotutor','Jurado') NOT NULL,
    desde DATE NOT NULL,
    hasta DATE,
    razon VARCHAR(100),    
    PRIMARY KEY(idTrabajo, dni),
    INDEX idx_trabajo(idTrabajo),
    INDEX idx_dni(dni),
    FOREIGN KEY(idTrabajo) REFERENCES Trabajos(idTrabajo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(dni) REFERENCES Profesores(dni) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB;

DROP TABLE IF EXISTS AlumnosEnTrabajos;
CREATE TABLE IF NOT EXISTS AlumnosEnTrabajos (
	idTrabajo INT NOT NULL,
    dni INT NOT NULL,
    desde DATE NOT NULL,
    hasta DATE,
    razon VARCHAR(100),    
    PRIMARY KEY(idTrabajo, dni),
    INDEX idx_trabajo(idTrabajo),
    INDEX idx_dni(dni),
    FOREIGN KEY(idTrabajo) REFERENCES Trabajos(idTrabajo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(dni) REFERENCES Alumnos(dni) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB;