DROP DATABASE IF EXISTS ParcialLBD2015;
CREATE DATABASE IF NOT EXISTS ParcialLBD2015;
USE ParcialLBD2015;

DROP TABLE IF EXISTS Edifcios;
CREATE TABLE IF NOT EXISTS Edificios (
	idEdificio INT NOT NULL,
	nombre VARCHAR(20) NOT NULL,
    domicilio VARCHAR(20) NOT NULL,
    superficie INT NOT NULL,
    PRIMARY KEY(idEdificio),
    UNIQUE INDEX idx_nombre(nombre)
) ENGINE=INNODB;


DROP TABLE IF EXISTS Propietarios;
CREATE TABLE IF NOT EXISTS Propietarios (
	idPropietario INT NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    nombres VARCHAR(20) NOT NULL,
    domicilio VARCHAR(50) NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(50),
    PRIMARY KEY(idPropietario),
    INDEX idx_apellidos(apellidos)
) ENGINE=INNODB;

DROP TABLE IF EXISTS Rubros;
CREATE TABLE IF NOT EXISTS Rubros (
	idRubro INT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY(idRubro),
    UNIQUE INDEX idx_nombre(nombre)
) ENGINE=INNODB;

DROP TABLE IF EXISTS Gastos;
CREATE TABLE IF NOT EXISTS Gastos (
	idGasto INT NOT NULL,
    fecha DATE NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    idRubro INT NOT NULL,
    idEdificio INT NOT NULL,
    PRIMARY KEY(idGasto),
    INDEX(idRubro),
    INDEX(idEdificio),
    INDEX idx_fecha(fecha),
    FOREIGN KEY(idRubro) REFERENCES Rubros(idRubro) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(idEdificio) REFERENCES Edificios(idEdificio) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB;

DROP TABLE IF EXISTS Unidades;
CREATE TABLE IF NOT EXISTS Unidades (
	idEdificio INT NOT NULL,
    piso CHAR(2) NOT NULL,
    numero CHAR(2) NOT NULL,
    tipo ENUM('Departamento', 'Cochera', 'Local') NOT NULL DEFAULT 'Departamento',
    superficie INT NOT NULL,
    idPropietario INT NOT NULL,
    PRIMARY KEY(idEdificio, piso, numero),
    INDEX(idEdificio),
    INDEX(idPropietario),
    INDEX idx_tipo(tipo),
    FOREIGN KEY(idEdificio) REFERENCES Edificios(idEdificio) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(idPropietario) REFERENCES Propietarios(idPropietario) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB;

DROP TABLE IF EXISTS Expensas;
CREATE TABLE IF NOT EXISTS Expensas (
	idEdificio INT NOT NULL,
    piso CHAR(2) NOT NULL,
    numero CHAR(2) NOT NULL,
    periodo DATE NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    vencimiento DATE NOT NULL,
    PRIMARY KEY(idEdificio, piso, numero, periodo),
    INDEX(idEdificio, piso, numero),
    FOREIGN KEY(idEdificio, piso, numero) REFERENCES Unidades(idEdificio, piso, numero) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB;
