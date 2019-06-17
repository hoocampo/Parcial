DROP DATABASE IF EXISTS ParcialLBD2017;
CREATE DATABASE IF NOT EXISTS ParcialLBD2017;
USE ParcialLBD2017;

DROP TABLE IF EXISTS Clientes;
CREATE TABLE IF NOT EXISTS Clientes (
	idCliente INT NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    telefono VARCHAR(25) NOT NULL,
    PRIMARY KEY(idCliente),
    UNIQUE INDEX idx_telefono(telefono)
) ENGINE=INNODB;

DROP TABLE IF EXISTS Categorias;
CREATE TABLE IF NOT EXISTS Categorias (
	idCategoria INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY(idCategoria),
    UNIQUE INDEX idx_nombre(nombre)
) ENGINE=INNODB;

DROP TABLE IF EXISTS Productos;
CREATE TABLE IF NOT EXISTS Productos (
	idProducto INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    color VARCHAR(15),
    precio DECIMAL(10,4) NOT NULL,
    idCategoria INT,
    PRIMARY KEY(idProducto),
    INDEX idx_idCategoria(idCategoria),
    UNIQUE INDEX idx_nombre(nombre),
    CONSTRAINT `fk_Productos_Categorias`
		FOREIGN KEY(idCategoria)
		REFERENCES Categorias(idCategoria)
) ENGINE=INNODB;

DROP TABLE IF EXISTS Ventas;
CREATE TABLE IF NOT EXISTS Ventas (
	idVenta INT NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idCliente INT NOT NULL,
    PRIMARY KEY(idVenta),
    INDEX idx_idCliente(idCliente),
    INDEX idx_fecha(fecha),
    CONSTRAINT `fk_Ventas_Clientes`
		FOREIGN KEY(idCliente)
		REFERENCES Clientes(idCliente)
) ENGINE=INNODB;

DROP TABLE IF EXISTS Ofertas;
CREATE TABLE IF NOT EXISTS Ofertas (
	idOferta INT NOT NULL,
	descuento FLOAT NOT NULL DEFAULT 0.05,
    fechaInicio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fechaFin DATETIME NOT NULL,
    cantidadMinima INT NOT NULL DEFAULT 1,
    cantidadMaxima INT,
    PRIMARY KEY(idOferta),
    INDEX idx_fechaInicio(fechaInicio),
    INDEX idx_fechaFin(fechaFin)
) ENGINE=INNODB;

DROP TABLE IF EXISTS OfertasDelProducto;
CREATE TABLE IF NOT EXISTS OfertasDelProducto (
	idProducto INT NOT NULL,
    idOferta INT NOT NULL,
    PRIMARY KEY(idProducto, idOferta),
    INDEX idx_idProducto(idProducto),
    INDEX idx_idOferta(idOferta),
    CONSTRAINT `fk_OfertasDelProducto_Productos`
		FOREIGN KEY(idProducto)
        REFERENCES Productos(idProducto),
	CONSTRAINT `fk_OfertasDelProducto_Ofertas`
		FOREIGN KEY(idOferta)
        REFERENCES Ofertas(idOferta)
) ENGINE=INNODB;

DROP TABLE IF EXISTS Detalles;
CREATE TABLE IF NOT EXISTS Detalles (
	idDetalle INT NOT NULL,
    idVenta INT NOT NULL,
    idProducto INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10,4) NOT NULL,
    descuento FLOAT NOT NULL DEFAULT 0,
    idOferta INT NOT NULL,
    PRIMARY KEY(idDetalle, idVenta),
    INDEX idx_idVenta(idVenta),
    INDEX idx_OfertaProducto(idProducto, idOferta),
    CONSTRAINT `fk_Detalles_Ventas`
		FOREIGN KEY(idVenta)
        REFERENCES Ventas(idVenta),
    CONSTRAINT `fk_Detalles_OfertasDelProducto`
		FOREIGN KEY(idProducto, idOferta)
        REFERENCES OfertasDelProducto(idProducto, idOferta)
) ENGINE=INNODB;