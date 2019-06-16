-- Punto 2 Completo by Gus
DROP PROCEDURE IF EXISTS DetalleRoles;

DELIMITER //
CREATE PROCEDURE DetalleRoles(añoInicio DATE, añoFin DATE, OUT mensaje VARCHAR(100))
SALIR: BEGIN
	-- control de errores
    IF (añoInicio > añoFin) THEN
      SET mensaje = 'Error en los datos ingresados';
      LEAVE SALIR;
    ELSE
		  -- Año,DNI, Apellidos, Nombres, Tutor, Cotutor y Jurado
      SELECT YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres,count(*) as 'Total',
		count( IF(RolesEnTrabajos.rol='Jurado',1, NULL)) as 'Jurado',
        count( IF(RolesEnTrabajos.rol='Tutor',1, NULL)) as 'Tutor',
        count( IF(RolesEnTrabajos.rol='Cotutor',1, NULL)) as 'Cotutor'
      FROM RolesEnTrabajos
      JOIN Profesores ON RolesEnTrabajos.dni = Profesores.dni
      JOIN Personas ON Personas.dni = Profesores.dni
      WHERE YEAR(RolesEnTrabajos.desde)>=YEAR(añoInicio) AND YEAR(RolesEnTrabajos.desde)<=YEAR(añoFin)
      GROUP BY YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres
	  ORDER BY YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres desc;
	END IF;
END //
DELIMITER ;

CALL DetalleRoles('1995-01-01','2019-12-31', @resultado);
SELECT @resultado;

-- consulta de control
SELECT YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres, RolesEnTrabajos.rol
      FROM RolesEnTrabajos
      JOIN Profesores ON RolesEnTrabajos.dni = Profesores.dni
      JOIN Personas ON Personas.dni = Profesores.dni
      WHERE YEAR(RolesEnTrabajos.desde)>=2015 AND YEAR(RolesEnTrabajos.desde)<=2017
      -- GROUP BY YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres
	  ORDER BY YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres desc;
