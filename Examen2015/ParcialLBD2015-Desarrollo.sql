-- Punto 2
DROP PROCEDURE IF EXISTS sp_movimientos;
DELIMITER //
CREATE PROCEDURE sp_movimientos(fechaInicio DATE, fechaFin DATE, OUT mensaje VARCHAR(100))
SALIR: BEGIN
    IF (fechaInicio > fechaFin) OR (YEAR(fechaInicio)<>YEAR(fechaFin)) THEN
      SET mensaje = 'Error en los datos ingresados';
      LEAVE SALIR;
    ELSE
      SELECT T.Mes, SUM(T.totalGastos) 'Total de Gastos', SUM(T.totalExpensas) 'Total de expensas'
      FROM (SELECT MONTH(fecha) as Mes, SUM(importe) totalGastos, 0 totalExpensas
			FROM Gastos
            WHERE fecha BETWEEN fechaInicio AND fechaFin
            GROUP BY Mes
            UNION
            SELECT MONTH(periodo) as Mes, 0 totalGastos, SUM(importe) totalExpensas
			FROM Expensas
            WHERE periodo BETWEEN fechaInicio AND fechaFin
            GROUP BY Mes) T
		GROUP BY T.Mes
        ORDER BY T.Mes ASC;      
	END IF;
END //
DELIMITER ;

CALL sp_movimientos('2009-04-01','2009-01-31', @resultado);
SELECT @resultado;

-- Punto 3
DROP VIEW IF EXISTS vista_unidades;
CREATE VIEW vista_unidades AS
SELECT E.nombre, E.domicilio 'Domicilio Edificio', E.superficie, U.piso, U.numero, U.tipo, CONCAT(P.apellidos, ' ', P.nombres) Propietario, P.domicilio 'Domicilio Propietario'
FROM Edificios E
JOIN Unidades U USING(idEdificio)
JOIN Propietarios P USING(idPropietario)
ORDER BY E.nombre, U.piso, U.numero;

SELECT * FROM vista_unidades;

