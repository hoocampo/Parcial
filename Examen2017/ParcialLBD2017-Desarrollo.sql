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