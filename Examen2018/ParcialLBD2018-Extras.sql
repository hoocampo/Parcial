-- CONSULTAS EXTRAÑAS QUE PODRIA LLEGAR A TOMAR


SELECT *
FROM Personas P
JOIN Profesores Prof USING(dni)
JOIN RolesEnTrabajos R USING(dni);

SELECT R.dni, R.rol, count(*)
FROM RolesEnTrabajos R
GROUP BY R.dni, R.rol WITH ROLLUP;

SELECT Tabla1.dni, P.apellidos, P.nombres, Tabla1.rol, Tabla1.Total
FROM (SELECT R.dni, R.rol, COUNT(*) Total
	FROM RolesEnTrabajos R
	GROUP BY R.dni, R.rol) Tabla1
JOIN Personas P ON Tabla1.dni=P.dni
ORDER BY P.apellidos, P.nombres;