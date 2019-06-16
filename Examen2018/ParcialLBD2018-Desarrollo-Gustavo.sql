-- Punto 2
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
      SELECT YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres,count(*) as 'Total', count( IF(rolesentrabajos.rol='Jurado',1, NULL)) as 'Jurado', count( IF(rolesentrabajos.rol='Tutor',1, NULL)) as 'Tutor',count( IF(rolesentrabajos.rol='Cotutor',1, NULL)) as 'Cotutor'
      FROM RolesEnTrabajos
      JOIN Profesores ON RolesEnTrabajos.dni = Profesores.dni
      JOIN Personas ON Personas.dni = Profesores.dni
      WHERE YEAR(RolesEnTrabajos.desde)>=YEAR(añoInicio) AND YEAR(RolesEnTrabajos.desde)<=YEAR(añoFin)
      GROUP BY YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres
	  ORDER BY YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres desc;
	END IF;
END //
DELIMITER ;

CALL DetalleRoles('2015-01-01','2017-12-31', @resultado);
SELECT @resultado;

-- consulta de control
SELECT YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres, rolesentrabajos.rol
      FROM RolesEnTrabajos
      JOIN Profesores ON RolesEnTrabajos.dni = Profesores.dni
      JOIN Personas ON Personas.dni = Profesores.dni
      WHERE YEAR(RolesEnTrabajos.desde)>=2015 AND YEAR(RolesEnTrabajos.desde)<=2017
      -- GROUP BY YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres
	  ORDER BY YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres desc;
