DROP DATABASE IF EXISTS gestion_almacen;
CREATE DATABASE IF NOT EXISTS gestion_almacen;

USE gestion_almacen;


CREATE TABLE almacenes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    responsable VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(50) NOT NULL,
    capacidad DOUBLE NOT NULL
);


CREATE TABLE empleados (
    id INT UNSIGNED PRIMARY KEY,
    categoria VARCHAR(50) NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    id_almacen INT UNSIGNED,
    FOREIGN KEY (id_almacen) REFERENCES almacenes(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE productos (
    id INT UNSIGNED PRIMARY KEY,
    fabricante VARCHAR(50) NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    id_empleado INT UNSIGNED,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE ubicaciones (
    id_producto INT UNSIGNED,
    id_almacen INT UNSIGNED,
    fecha DATE NOT NULL,
    PRIMARY KEY (id_producto, id_almacen),
    FOREIGN KEY (id_producto) REFERENCES productos(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_almacen) REFERENCES almacenes(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- datos de los almacenes
INSERT INTO almacenes (id, responsable, ubicacion, capacidad) VALUES (1, 'Pedro García', 'PLAST', 50);
INSERT INTO almacenes (id, responsable, ubicacion, capacidad) VALUES (2, 'Juan Alonso', 'TORN', 120);
INSERT INTO almacenes (id, responsable, ubicacion, capacidad) VALUES (3, 'Laura Córdoba', 'ELECT', 30);
INSERT INTO almacenes (id, responsable, ubicacion, capacidad) VALUES (4, 'Rosa Martínez', 'LIQUID', 15);
INSERT INTO almacenes (id, responsable, ubicacion, capacidad) VALUES (5, 'Miguel Ramos', 'DISC', 50);
INSERT INTO almacenes (id, responsable, ubicacion, capacidad) VALUES (6, 'Andrea Ruiz', 'FRAGIL', 50);


-- Empleados de el Almacén PLAST

INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (1001001, 'capataz', 'retractil', 1);
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (1001002, 'mozo', 'carretilla frontal', 1);
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (1001003, 'oficial 3', 'apiladora', 1);

-- Empleados del almacén TORN
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (2001001, 'oficial 2', 'carretilla frontal', 2);
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (2001002, 'mozo', 'retractil', 2);
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (2001003, 'oficial 1', 'trilateral', 2);

-- Empleados de el almacén ELECT
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (3001001, 'oficial 3', 'carretilla frontal', 3);
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (3001002, 'mozo', 'apiladora', 3);
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (3001003, 'capataz', 'trilateral', 3);
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (3001004, 'oficial 2', 'retractil', 3);

-- Empleados del almacén LIQUID
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (4001001, 'oficial 3', 'carretilla frontal', 4);
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (4001002, 'mozo', 'retractil', 4);
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (4001003, 'oficial 1', 'trilateral', 4);
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (4001004, 'oficial 2', 'apiladora', 4);

-- Empleados del almacén DISC
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (5001001, 'mozo', 'carretilla frontal', 5);
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (5001002, 'oficial 2', 'retractil', 5);
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (5001003, 'capataz', 'trilateral', 5);

-- Empleados del almacen FRAGIL
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (6001001, 'mozo', 'retractil', 6);
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (6001002, 'capataz', 'carretilla frontal', 6);
INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (6001003, 'oficial 3', 'apiladora', 6);


-- productos para almacen de discos y pastillas
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (5001, 'Brembo', 100, 5001001);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (5002, 'Ferodo', 150, 5001002);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (5003, 'TVR', 200, 5001003);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (5004, 'MAPCO', 250, 5001001);

-- productos para almacen de plasticos
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (1001, 'Autofren Seinsa', 120, 1001001);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (1002, 'Metalcaucho', 130, 1001002);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (1003, 'Fare', 140, 1001003);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (1004, 'Frenkit', 110, 1001001);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (1005, 'Doga', 160, 1001002);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (1006, 'Cautex', 170, 1001003);

-- productos para liquido
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (4001, 'Castrol', 90, 4001001);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (4002, 'Mobil', 80, 4001002);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (4003, 'Valvoline', 85, 4001003);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (4004, 'MOTUL', 95, 4001004);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (4005, 'SELENIA', 100, 4001001);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (4006, 'TOTAL', 110, 4001002);

-- productos para electrico
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (3001, 'BOSCH', 60, 3001001);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (3002, 'Continental', 70, 3001002);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (3003, 'Ridex', 65, 3001003);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (3004, 'Hella', 75, 3001004);

-- productos para tornilleróia
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (2001, 'Helicoil', 50, 2001001);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (2002, 'Tucker', 55, 2001002);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (2003, 'Lenox', 60, 2001003);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (2004, '3M', 70, 2001001);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (2005, 'Stanley', 80, 2001002);


-- productos para fragil
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (6001, 'Philips', 40, 6001001);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (6002, 'VARTA', 45, 6001002);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (6003, 'Tudor', 50, 6001003);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (6004, 'Kat', 55, 6001001);
INSERT INTO productos (id, fabricante, cantidad, id_empleado) VALUES (6005, 'Fonos', 60, 6001002);

-- datos de la tabla ubicaciones

INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (5001, 5, '2024-03-01');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (5002, 5, '2024-03-01');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (5003, 5, '2024-03-02');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (5004, 5, '2024-03-05');


INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (1001, 1, '2024-03-07');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (1002, 1, '2024-03-07');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (1003, 1, '2024-03-10');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (1004, 1, '2024-03-12');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (1005, 1, '2024-03-15');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (1006, 1, '2024-03-17');


INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (4001, 4, '2024-04-01');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (4002, 4, '2024-04-03');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (4003, 4, '2024-04-05');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (4004, 4, '2024-04-07');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (4005, 4, '2024-04-07');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (4006, 4, '2024-04-10');


INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (3001, 3, '2024-04-12');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (3002, 3, '2024-04-12');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (3003, 3, '2024-04-15');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (3004, 3, '2024-04-17');


INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (2001, 2, '2024-04-20');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (2002, 2, '2024-04-22');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (2003, 2, '2024-04-25');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (2004, 2, '2024-04-27');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (2005, 2, '2024-04-30');


INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (6001, 6, '2024-05-02');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (6002, 6, '2024-05-03');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (6003, 6, '2024-05-05');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (6004, 6, '2024-05-05');
INSERT INTO ubicaciones (id_producto, id_almacen, fecha) VALUES (6005, 6, '2024-05-07');