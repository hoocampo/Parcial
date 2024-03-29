USE ParcialLBD2015;

INSERT INTO Rubros VALUES (1, 'Varios');
INSERT INTO Rubros VALUES (2, 'Electricidad');
INSERT INTO Rubros VALUES (3, 'Mantenimiento');
INSERT INTO Rubros VALUES (4, 'Sueldo portero');
INSERT INTO Rubros VALUES (5, 'Limpieza');
INSERT INTO Rubros VALUES (6, 'Otros');

INSERT INTO Propietarios VALUES (1, 'Flores', 'David', 'San Juan 932', '4200555', 'sinemail@sinemail.com');
INSERT INTO Propietarios VALUES (3, 'Gonzalez', 'Martin', '25 de Mayo 49', '000-000000000  ', 'sinemail@sinemail.com');
INSERT INTO Propietarios VALUES (6, 'Gomez', 'Gabriel', 'Gral. Paz 1456', '000-000000000', 'sinemail@sinemail.com');
INSERT INTO Propietarios VALUES (7, 'Perez', 'Horacio A.', 'Mitre 340', '000-000000000', 'sinemail@sinemail.com');
INSERT INTO Propietarios VALUES (8, 'Hamster', 'Marcelo', 'S/N', '000-000000000', 'sinemail@sinemail.com');
INSERT INTO Propietarios VALUES (9, 'Serra', 'Nicolas', 'Moreno 910', '000-000000000', 'sinemail@sinemail.com');
INSERT INTO Propietarios VALUES (10, 'Pichot', 'Agustin', '54 y 20', '000-000000000', 'sinemail@sinemail.com');
INSERT INTO Propietarios VALUES (11, 'Hernandez', 'Juani', 'bulk insert 345', '000-000000000', 'sinemail@sinemail.com');

INSERT INTO Edificios VALUES (1, 'Torre Muñecas', 'Muñecas 765', 850);
INSERT INTO Edificios VALUES (2, 'Edificio2', 'San Martin 2453', 1);
INSERT INTO Edificios VALUES (3, 'Edificio 3', 'Aconquija 234', 923);
INSERT INTO Edificios VALUES (4, 'Edificio 4', 'Larrea 879', 760);
INSERT INTO Edificios VALUES (5, 'Edificio 5', 'Magallanes 987', 785);
INSERT INTO Edificios VALUES (6, 'edificio20', 'domicilio 1', 120);

INSERT INTO Gastos VALUES (1, '2009-08-12 00:00:00.000', 17.5, 1, 1);
INSERT INTO Gastos VALUES (2, '2009-08-13 00:00:00.000', 53.5, 1, 3);
INSERT INTO Gastos VALUES (3, '2009-07-11 00:00:00.000', 1200, 1, 4);
INSERT INTO Gastos VALUES (4, '2009-08-11 00:00:00.000', 43, 1, 2);
INSERT INTO Gastos VALUES (5, '2009-07-05 00:00:00.000', 65.25, 1, 1);
INSERT INTO Gastos VALUES (6, '2009-07-28 00:00:00.000', 31.75, 1, 3);
INSERT INTO Gastos VALUES (7, '2009-07-17 00:00:00.000', 1150, 2, 4);
INSERT INTO Gastos VALUES (8, '2009-07-05 00:00:00.000', 54, 2, 1);
INSERT INTO Gastos VALUES (9, '2009-07-08 00:00:00.000', 129.5, 2, 3);
INSERT INTO Gastos VALUES (12292, '2009-08-13 00:00:00.000', 34.5, 2, 1);
INSERT INTO Gastos VALUES (12293, '2009-08-14 00:00:00.000', 70.5, 2, 3);
INSERT INTO Gastos VALUES (12294, '2009-07-12 00:00:00.000', 1217, 2, 4);
INSERT INTO Gastos VALUES (12295, '2009-08-12 00:00:00.000', 60, 2, 2);
INSERT INTO Gastos VALUES (12296, '2009-07-06 00:00:00.000', 82.25, 2, 1);
INSERT INTO Gastos VALUES (12297, '2009-07-29 00:00:00.000', 48.75, 2, 3);
INSERT INTO Gastos VALUES (12298, '2009-08-13 00:00:00.000', 34.5, 2, 1);
INSERT INTO Gastos VALUES (12299, '2009-08-14 00:00:00.000', 70.5, 2, 3);
INSERT INTO Gastos VALUES (12300, '2009-07-12 00:00:00.000', 1217, 2, 4);
INSERT INTO Gastos VALUES (12301, '2009-08-12 00:00:00.000', 60, 2, 2);
INSERT INTO Gastos VALUES (12302, '2009-07-06 00:00:00.000', 82.25, 2, 1);
INSERT INTO Gastos VALUES (12303, '2009-07-29 00:00:00.000', 48.75, 2, 3);
INSERT INTO Gastos VALUES (12304, '2009-07-18 00:00:00.000', 1167, 3, 4);
INSERT INTO Gastos VALUES (12305, '2009-07-06 00:00:00.000', 71, 3, 1);
INSERT INTO Gastos VALUES (12306, '2009-07-09 00:00:00.000', 146.5, 3, 3);
INSERT INTO Gastos VALUES (12307, '2009-08-14 00:00:00.000', 51.5, 3, 1);
INSERT INTO Gastos VALUES (12308, '2009-08-15 00:00:00.000', 87.5, 3, 3);
INSERT INTO Gastos VALUES (12309, '2009-07-13 00:00:00.000', 1234, 3, 4);
INSERT INTO Gastos VALUES (12310, '2009-08-13 00:00:00.000', 77, 3, 2);
INSERT INTO Gastos VALUES (12311, '2009-07-07 00:00:00.000', 99.25, 3, 1);
INSERT INTO Gastos VALUES (12312, '2009-07-30 00:00:00.000', 65.75, 3, 3);
INSERT INTO Gastos VALUES (12313, '2009-08-14 00:00:00.000', 51.5, 3, 1);
INSERT INTO Gastos VALUES (12314, '2009-08-15 00:00:00.000', 87.5, 3, 3);
INSERT INTO Gastos VALUES (12315, '2009-07-13 00:00:00.000', 1234, 3, 4);
INSERT INTO Gastos VALUES (12316, '2009-08-13 00:00:00.000', 77, 3, 2);
INSERT INTO Gastos VALUES (12317, '2009-07-07 00:00:00.000', 99.25, 3, 1);
INSERT INTO Gastos VALUES (12318, '2009-07-30 00:00:00.000', 65.75, 3, 3);
INSERT INTO Gastos VALUES (12319, '2009-07-19 00:00:00.000', 1184, 4, 4);
INSERT INTO Gastos VALUES (12320, '2009-07-07 00:00:00.000', 88, 4, 1);
INSERT INTO Gastos VALUES (12321, '2009-07-10 00:00:00.000', 163.5, 4, 3);
INSERT INTO Gastos VALUES (12322, '2009-08-15 00:00:00.000', 68.5, 4, 1);
INSERT INTO Gastos VALUES (12323, '2009-08-16 00:00:00.000', 104.5, 4, 3);
INSERT INTO Gastos VALUES (12324, '2009-07-14 00:00:00.000', 1251, 4, 4);
INSERT INTO Gastos VALUES (12325, '2009-08-14 00:00:00.000', 94, 4, 2);
INSERT INTO Gastos VALUES (12326, '2009-07-08 00:00:00.000', 116.25, 4, 1);
INSERT INTO Gastos VALUES (12327, '2009-07-31 00:00:00.000', 82.75, 4, 3);
INSERT INTO Gastos VALUES (12328, '2009-08-15 00:00:00.000', 68.5, 4, 1);
INSERT INTO Gastos VALUES (12329, '2009-08-16 00:00:00.000', 104.5, 4, 3);
INSERT INTO Gastos VALUES (12330, '2009-07-14 00:00:00.000', 1251, 4, 4);
INSERT INTO Gastos VALUES (12331, '2009-08-14 00:00:00.000', 94, 4, 2);
INSERT INTO Gastos VALUES (12332, '2009-07-08 00:00:00.000', 116.25, 4, 1);
INSERT INTO Gastos VALUES (12333, '2009-07-31 00:00:00.000', 82.75, 4, 3);
INSERT INTO Gastos VALUES (12334, '2009-07-20 00:00:00.000', 1201, 5, 4);
INSERT INTO Gastos VALUES (12335, '2009-07-08 00:00:00.000', 105, 5, 1);
INSERT INTO Gastos VALUES (12336, '2009-07-11 00:00:00.000', 180.5, 5, 3);
INSERT INTO Gastos VALUES (12337, '2009-08-16 00:00:00.000', 85.5, 5, 1);
INSERT INTO Gastos VALUES (12338, '2009-08-17 00:00:00.000', 121.5, 5, 3);
INSERT INTO Gastos VALUES (12339, '2009-07-15 00:00:00.000', 1268, 5, 4);
INSERT INTO Gastos VALUES (12340, '2009-08-15 00:00:00.000', 111, 5, 2);
INSERT INTO Gastos VALUES (12341, '2009-07-09 00:00:00.000', 133.25, 5, 1);
INSERT INTO Gastos VALUES (12342, '2009-08-01 00:00:00.000', 99.75, 5, 3);
INSERT INTO Gastos VALUES (12343, '2009-08-16 00:00:00.000', 85.5, 5, 1);
INSERT INTO Gastos VALUES (12344, '2009-08-17 00:00:00.000', 121.5, 5, 3);
INSERT INTO Gastos VALUES (12345, '2009-07-15 00:00:00.000', 1268, 5, 4);
INSERT INTO Gastos VALUES (12346, '2009-08-15 00:00:00.000', 111, 5, 2);
INSERT INTO Gastos VALUES (12347, '2009-07-09 00:00:00.000', 133.25, 5, 1);
INSERT INTO Gastos VALUES (12348, '2009-08-01 00:00:00.000', 99.75, 5, 3);

INSERT INTO Unidades VALUES (1, '0', '1', 'Departamento', 1, 1);
INSERT INTO Unidades VALUES (1, '0', '2', 'Departamento', 1, 3);
INSERT INTO Unidades VALUES (1, '1', '1', 'Departamento', 1, 1);
INSERT INTO Unidades VALUES (1, '1', '2', 'Departamento', 1, 6);
INSERT INTO Unidades VALUES (1, '1', '3', 'Departamento', 1, 7);
INSERT INTO Unidades VALUES (1, '1', '40', 'Cochera', 1, 1);
INSERT INTO Unidades VALUES (1, '2', '1', 'Departamento', 1, 1);
INSERT INTO Unidades VALUES (2, '0', '1', 'Departamento', 1, 8);
INSERT INTO Unidades VALUES (2, '0', '2', 'Departamento', 1, 9);
INSERT INTO Unidades VALUES (2, '1', '1', 'Departamento', 1, 10);
INSERT INTO Unidades VALUES (2, '1', '2', 'Departamento', 1, 10);
INSERT INTO Unidades VALUES (2, '1', '3', 'Departamento', 1, 11);

INSERT INTO Expensas VALUES (1, '0', '1', '2009-05-01 00:00:00.000', 251, '2009-06-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '0', '1', '2009-06-01 00:00:00.000', 251, '2009-07-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '0', '1', '2009-07-01 00:00:00.000', 251, '2009-08-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '0', '1', '2009-08-01 00:00:00.000', 251, '2009-09-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '0', '2', '2009-05-01 00:00:00.000', 160, '2009-06-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '0', '2', '2009-06-01 00:00:00.000', 160, '2009-07-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '0', '2', '2009-07-01 00:00:00.000', 160, '2009-08-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '0', '2', '2009-08-01 00:00:00.000', 160, '2009-09-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '1', '1', '2009-05-01 00:00:00.000', 220, '2009-06-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '1', '1', '2009-06-01 00:00:00.000', 220, '2009-07-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '1', '1', '2009-07-01 00:00:00.000', 220, '2009-08-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '1', '1', '2009-08-01 00:00:00.000', 220, '2009-09-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '1', '2', '2009-05-01 00:00:00.000', 160, '2009-06-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '1', '2', '2009-06-01 00:00:00.000', 160, '2009-07-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '1', '2', '2009-07-01 00:00:00.000', 160, '2009-08-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '1', '2', '2009-08-01 00:00:00.000', 160, '2009-09-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '1', '3', '2009-05-01 00:00:00.000', 200, '2009-06-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '1', '3', '2009-06-01 00:00:00.000', 200, '2009-07-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '1', '3', '2009-07-01 00:00:00.000', 200, '2009-08-12 00:00:00.000');
INSERT INTO Expensas VALUES (1, '1', '3', '2009-08-01 00:00:00.000', 200, '2009-09-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '0', '1', '2009-05-01 00:00:00.000', 216, '2009-06-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '0', '1', '2009-06-01 00:00:00.000', 216, '2009-07-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '0', '1', '2009-07-01 00:00:00.000', 216, '2009-08-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '0', '1', '2009-08-01 00:00:00.000', 216, '2009-09-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '0', '2', '2009-05-01 00:00:00.000', 125, '2009-06-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '0', '2', '2009-06-01 00:00:00.000', 125, '2009-07-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '0', '2', '2009-07-01 00:00:00.000', 125, '2009-08-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '0', '2', '2009-08-01 00:00:00.000', 125, '2009-09-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '1', '1', '2009-05-01 00:00:00.000', 185, '2009-06-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '1', '1', '2009-06-01 00:00:00.000', 185, '2009-07-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '1', '1', '2009-07-01 00:00:00.000', 185, '2009-08-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '1', '1', '2009-08-01 00:00:00.000', 185, '2009-09-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '1', '2', '2009-05-01 00:00:00.000', 125, '2009-06-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '1', '2', '2009-06-01 00:00:00.000', 125, '2009-07-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '1', '2', '2009-07-01 00:00:00.000', 125, '2009-08-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '1', '2', '2009-08-01 00:00:00.000', 125, '2009-09-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '1', '3', '2009-05-01 00:00:00.000', 165, '2009-06-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '1', '3', '2009-06-01 00:00:00.000', 165, '2009-07-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '1', '3', '2009-07-01 00:00:00.000', 165, '2009-08-12 00:00:00.000');
INSERT INTO Expensas VALUES (2, '1', '3', '2009-08-01 00:00:00.000', 165, '2009-09-12 00:00:00.000');
