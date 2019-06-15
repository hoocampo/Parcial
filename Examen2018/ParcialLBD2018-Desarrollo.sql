-- <------------FORMA 1--------------->
DROP VIEW IF EXISTS VISTA1;
CREATE VIEW VISTA1 AS
SELECT T1.dni, SUM(T1.Tutor) Tutor, SUM(T1.Cotutor) Cotutor, SUM(T1.Jurado) Jurado
FROM (SELECT T.dni,
		CASE
			WHEN T.rol='Tutor' THEN T.totalRoles
			ELSE 0
		END Tutor,
		CASE
			WHEN T.rol='Cotutor' THEN T.totalRoles
			ELSE 0
		END Cotutor,
		CASE
			WHEN T.rol='Jurado' THEN T.totalRoles
			ELSE 0
		END Jurado
	FROM (SELECT R.dni, R.rol, COUNT(*) totalRoles
			FROM RolesEnTrabajos R
			GROUP BY R.dni, R.rol) T) T1
GROUP BY T1.dni;
    
SELECT P.dni, P.apellidos, P.nombres, V1.Tutor, V1.Cotutor, V1.Jurado
FROM Vista1 V1
JOIN Personas P USING(dni)
ORDER BY P.apellidos, P.nombres;
-- <----------------------------------->

-- <------------FORMA 2--------------->
DROP VIEW IF EXISTS Vista2;
CREATE VIEW Vista2 AS
SELECT T.dni DNI, SUM(T.Tutor) Tutor, SUM(T.Cotutor) Cotutor, SUM(T.Jurado) Jurado
FROM (SELECT R.dni, COUNT(*) Tutor, 0 Cotutor, 0 Jurado
FROM RolesEnTrabajos R
WHERE R.rol='Tutor'
GROUP BY R.dni, R.rol
UNION
SELECT R.dni dni, 0 Tutor, COUNT(*) Cotutor, 0 Jurado
FROM RolesEnTrabajos R
WHERE R.rol='Cotutor'
GROUP BY R.dni, R.rol
UNION
SELECT R.dni, 0 Tutor, 0 Cotutor, COUNT(*) Jurado
FROM RolesEnTrabajos R
WHERE R.rol='Jurado'
GROUP BY R.dni, R.rol) T
GROUP BY T.dni;

SELECT V2.dni, P.apellidos, P.nombres, V2.Tutor, V2.Cotutor, V2.Jurado
FROM Vista2 V2
JOIN Personas P USING(dni)
ORDER BY P.apellidos, P.nombres;
-- <----------------------------------->
