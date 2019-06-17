-- Punto 3

DROP VIEW IF EXISTS VTotalVentas;
CREATE VIEW VTotalVentas AS
SELECT V.idVenta 'Numero de venta', DATE_FORMAT(V.fecha, '%d/%m/%Y' ) Fecha, CONCAT(C.apellidos, ' ' , C.nombres) Cliente,
	P.nombre Producto, IFNULL(CA.nombre, 'S/C') Categoria, D.cantidad, P.precio 'Precio Unitario', (D.precio*D.cantidad) Total
FROM Ventas V
JOIN Detalles D USING(idVenta)
JOIN Clientes C USING(idCliente)
JOIN Productos P USING(idProducto)
JOIN Categorias CA USING(idCategoria)
UNION
SELECT NULL, NULL, NULL, NULL, NULL, NULL, NULL, SUM(D.precio*D.cantidad)
FROM Detalles D;

SELECT * FROM VTotalVentas;

-- Punto 4

DROP TABLE IF EXISTS AuditoriaOfertas;
CREATE TABLE IF NOT EXISTS AuditoriaOfertas (
	idAuditoria INT NOT NULL AUTO_INCREMENT,
	idOferta INT NOT NULL,
	descuento FLOAT NOT NULL,
    fechaInicio DATETIME NOT NULL,
    fechaFin DATETIME NOT NULL,
    cantidadMinima INT NOT NULL,
    cantidadMaxima INT,
    usuario VARCHAR(45) NOT NULL,
    maquina VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY(idAuditoria)
) ENGINE=INNODB;

DELIMITER //
CREATE TRIGGER `Trigger_Insert_Ofertas`
AFTER INSERT ON Ofertas FOR EACH ROW
BEGIN
	IF(NEW.descuento>=0.1) THEN
		INSERT INTO AuditoriaOfertas
        VALUES(DEFAULT,NEW.idOferta,NEW.descuento, NEW.fechaInicio, NEW.fechaFin, NEW.cantidadMinima, NEW.cantidadMaxima,
        SUBSTRING_INDEX(USER(), '@', 1),SUBSTRING_INDEX(USER(), '@', -1), NOW());
	END IF;
END //
DELIMITER ;