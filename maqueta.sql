DROP TABLE IF EXISTS Tabla;
CREATE TABLE IF NOT EXISTS Tabla (
	id1 INT NOT NULL AUTO_INCREMENT,
    id2 INT NOT NULL, -- relacion fuerte
    id3 INT NOT NULL, -- relacion debil mandatoria
    entero INT NOT NULL,
    unico VARCHAR(50) NOT NULL,
    enumeracion ENUM('','',''),
    deci DECIMAL(10,4) NOT NULL, -- 10 es la cantidad de digitos total, 4 es cuantos de esos digitos son decimales despues de la coma
    flotante FLOAT NOT NULL DEFAULT 0, -- columna convalor por default
    id4 INT NOT NULL, -- relacion debil mandatoria
    PRIMARY KEY(id1, id2), -- clave primaria compuesta
    INDEX idx_tabla_id1(id1), -- indice por id1
    INDEX idx_tabla_id2(idVenta), -- indice por propagacion de una clave simple
    INDEX idx_tabla_id3d4(id3, id4), -- indice por propagacion de clave compuesta
    UNIQUE INDEX idx_tabla_unico(unico), -- paraque ese varchar no se pueda repetir
    CONSTRAINT `fk_tabla_tablaReferencia1` -- propagacion de clave simple
		FOREIGN KEY(id2)
        REFERENCES tablaReferencia1(id2),
    CONSTRAINT `fk_tabla_tablaReferencia2` -- propagacion de clave compuesta
		FOREIGN KEY(id3, id4)
        REFERENCES tablaReferencia2(id3, id4)
) ENGINE=INNODB;