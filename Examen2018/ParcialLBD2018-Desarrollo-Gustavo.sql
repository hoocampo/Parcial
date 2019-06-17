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

    -- consulta de control
    SELECT YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres, RolesEnTrabajos.rol
          FROM RolesEnTrabajos
          JOIN Profesores ON RolesEnTrabajos.dni = Profesores.dni
          JOIN Personas ON Personas.dni = Profesores.dni
          WHERE YEAR(RolesEnTrabajos.desde)>=2015 AND YEAR(RolesEnTrabajos.desde)<=2017
          -- GROUP BY YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres
    	  ORDER BY YEAR(RolesEnTrabajos.desde), Personas.apellidos, Personas.nombres desc;

    -- Punto 3
    -- Crear un procedimiento almacenado llamado NuevoTrabajo, para que agregue un trabajo
    -- nuevo. El procedimiento deberá efectuar las comprobaciones necesarias (incluyendo que la
    -- fecha de aprobación sea igual o mayor a la de presentación) y devolver los mensajes
    -- correspondientes (uno por cada condición de error, y otro por el éxito).

    DROP PROCEDURE IF EXISTS NuevoTrabajo;

    DELIMITER //
    CREATE PROCEDURE NuevoTrabajo(pTitulo VARCHAR(100), pDuracion INT, pArea VARCHAR(10), pFechaPresentacion DATE, pFechaAprobacion DATE, pFechaFinalizacion DATE, OUT mensaje VARCHAR(100))
    SALIR: BEGIN
      -- control de errores
      IF (pTitulo IS NULL) OR (pDuracion IS NULL) OR (pArea IS NULL) OR (pFechaPresentacion IS NULL) OR (pFechaAprobacion IS NULL) THEN
        SET mensaje = 'Error en los datos de entrada: VALOR NULL';
        LEAVE SALIR;
      ELSEIF (pFechaAprobacion < pFechaPresentacion) THEN
        SET mensaje = 'Error en los datos de entrada: FECHA INCORRECTA';
        LEAVE SALIR;
      ELSE
        START TRANSACTION;
        INSERT INTO `ParcialLBD2018`.`Trabajos` (`idTrabajo`, `titulo`, `duracion`, `area`, `fechaPresentacion`, `fechaAprobacion`, `fechaFinalizacion`) VALUES (DEFAULT, pTitulo, pDuracion, pArea, pFechaPresentacion, pFechaAprobacion, pFechaFinalizacion);
        SET mensaje = 'Trabajo agregado con éxito';
    		COMMIT;
    	END IF;
    END //
    DELIMITER ;

    CALL NuevoTrabajo('TITULO02',2,'Hardware','2019-01-01','2019-02-01',NULL, @resultado);
    SELECT @resultado;

    -- consulta de verificacion
    SELECT * FROM Trabajos;

    -- Punto 4
    -- Realizar un trigger, llamado AuditarTrabajos, para que cuando se agregue un trabajo con una
    -- duración superior a los 12 meses, o inferior a 3 meses, registre en una tabla de auditoría los
    -- detalles del trabajo (todos los campos de la tabla Trabajos), el usuario que lo agregó y la fecha
    -- en la que lo hizo.

    -- -----------------------------------------------------
    -- Table `ParcialLBD2018`.`AuditoriaTrabajos`
    -- -----------------------------------------------------
    DROP TABLE IF EXISTS `ParcialLBD2018`.`AuditoriaTrabajos` ;

    CREATE TABLE IF NOT EXISTS `ParcialLBD2018`.`AuditoriaTrabajos` (
      `idAuditoriaTrabajo` INT  NOT NULL AUTO_INCREMENT,
      `idTrabajo` INT           NOT NULL,
      `titulo`    VARCHAR(100)  NOT NULL,
      `duracion`  INT           NOT NULL DEFAULT 6,
      `area`      ENUM('Hardware', 'Redes', 'Software')   NOT NULL,
      `fechaPresentacion`  DATE NOT NULL,
      `fechaAprobacion`    DATE NOT NULL,
      `fechaFinalizacion`  DATE NULL,
      `usuario`            VARCHAR(40) NOT NULL,
      `fecha`              DATE NOT NULL,
      PRIMARY KEY (`idAuditoriaTrabajo`))
    ENGINE = InnoDB;

    -- -----------------------------------------------------
    -- Trigger `Trig_Trabajo_Alta`
    -- -----------------------------------------------------
    DROP TRIGGER `Trig_Trabajo_Alta`

    DELIMITER //
    CREATE TRIGGER `Trig_Trabajo_Alta`
    AFTER INSERT ON `Trabajos` FOR EACH ROW
    BEGIN
      IF (NEW.duracion<3 OR NEW.duracion>12) THEN
        INSERT INTO AuditoriaTrabajos VALUES (
      	  DEFAULT,
          NEW.idTrabajo,
          NEW.titulo,
          NEW.duracion,
          NEW.area,
          NEW.fechaPresentacion,
          NEW.fechaAprobacion,
          NEW.fechaFinalizacion,
          SUBSTRING_INDEX(USER(), '@', 1), -- autor
          NOW() -- date time
        );
      END IF;
    END //
    DELIMITER ;

    -- consulta de verificacion
    SELECT * FROM Trabajos;
    SELECT * FROM AuditoriaTrabajos;
