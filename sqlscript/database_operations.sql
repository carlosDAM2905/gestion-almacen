use gestion_almacen;

# dar de alta un nuevo empleado:

DELIMITER $$
DROP PROCEDURE IF EXISTS alta_empleado;
CREATE PROCEDURE alta_empleado(IN id INT, IN categoria VARCHAR(50), IN puesto VARCHAR(50), IN id_almacen INT UNSIGNED)
BEGIN
    INSERT INTO empleados (id, categoria, puesto, id_almacen) VALUES (id, categoria, puesto, id_almacen);
end $$;

DELIMITER ;
CALL alta_empleado(1001004, 'mozo', 'apiladora', 1);

-- ======================================================================================================================

# dar de baja a un empleado:

DELIMITER $$
DROP PROCEDURE IF EXISTS baja_empleado;
CREATE PROCEDURE baja_empleado(IN emp_id INT)
BEGIN
    DELETE FROM empleados WHERE id = emp_id;
END $$;

DELIMITER ;
CALL baja_empleado(1001004);

-- ======================================================================================================================

# ACTUALIZAR DATOS DEL EMPLEADO:

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizar_empleado;
CREATE PROCEDURE actualizar_empleado(IN emp_id INT, IN nueva_categoria VARCHAR(50), IN nuevo_puesto VARCHAR(50), IN nuevo_id_almacen INT UNSIGNED
)
BEGIN
    UPDATE empleados
    SET categoria = nueva_categoria, puesto = nuevo_puesto, id_almacen = nuevo_id_almacen
    WHERE id = emp_id;
END $$;

DELIMITER ;

DELIMITER ;

SELECT * from empleados where id = 1001003;
CALL actualizar_empleado(1001003, 'oficial 2', 'retractil', 2);


-- ======================================================================================================================

# CONSULTAR EMPLEADOS POR CATEGORÍA:

DELIMITER $$
DROP PROCEDURE IF EXISTS consultar_por_puesto;
CREATE PROCEDURE consultar_por_puesto(puesto_empleado VARCHAR(50))
BEGIN
    SELECT * FROM empleados
    WHERE puesto = puesto_empleado;
end $$

DELIMITER ;
CALL consultar_por_puesto('retráctil');

-- ======================================================================================================================

# CONSULTAR EMPLEADOS POR ALMACEN

DROP PROCEDURE IF EXISTS empleados_por_almacen;
CREATE PROCEDURE empleados_por_almacen(IN id_almacen INT UNSIGNED)
BEGIN
    SELECT empleados.id, empleados.categoria, empleados.puesto
    FROM empleados
    WHERE empleados.id_almacen = id_almacen;
end;

DELIMITER ;
CALL empleados_por_almacen(1);

-- ======================================================================================================================

# VER EL RESPONSABLE QUE TIENE ASIGNADO UN EMPLEADO

DELIMITER $$
DROP PROCEDURE IF EXISTS ver_responsable_empleado;
CREATE PROCEDURE ver_responsable_empleado(IN emp_id INT)
BEGIN
    SELECT empleados.id AS id_empleado, categoria, puesto, almacenes.responsable AS jefe
    FROM empleados
    JOIN almacenes ON empleados.id_almacen = almacenes.id
    WHERE empleados.id = emp_id;
END $$
DELIMITER ;

CALL ver_responsable_empleado(6001001);



-- ======================================================================================================================


# ver el responsable de un almacén en concreto:

DELIMITER &&
DROP PROCEDURE IF EXISTS ver_responsable_almacen;
CREATE PROCEDURE ver_responsable_almacen(IN id_almacen INT UNSIGNED)
BEGIN
    SELECT responsable
    FROM almacenes
    WHERE id = id_almacen;
end &&

DELIMITER ;
CALL ver_responsable_almacen(1);

-- ======================================================================================================================

# ver la capacidad actual de un almacén:

DELIMITER &&

DROP PROCEDURE IF EXISTS huecos_ocupados_almacen;
CREATE PROCEDURE huecos_ocupados_almacen(IN p_id_almacen INT,
                                         OUT ubicaciones_ocupadas INT)
BEGIN
    SELECT COUNT(*)
    INTO ubicaciones_ocupadas
    FROM ubicaciones
    WHERE id_almacen = p_id_almacen;
END &&

DELIMITER ;


CALL huecos_ocupados_almacen(1, @ubicaciones_ocupadas);
SELECT @ubicaciones_ocupadas;

-- ======================================================================================================================

#Añadir producto a la tabla productos:

DELIMITER $$

CREATE PROCEDURE agregar_producto(IN producto_id INT,IN fabricante VARCHAR(50), IN cantidad INT, IN empleado_id INT)
BEGIN
    INSERT INTO productos (id, fabricante, cantidad, id_empleado)
    VALUES (producto_id, fabricante, cantidad, empleado_id);
END$$

DELIMITER ;

CALL agregar_producto(6006, 'prueba', 50, 1001001);
CALL agregar_producto(6007, 'prueba2', 10, 2001001);

-- ======================================================================================================================

# insertar un producto en la tabla de ubicaciones:

DELIMITER $$
DROP PROCEDURE IF EXISTS insertar_producto_en_ubicacion;
CREATE PROCEDURE insertar_producto_en_ubicacion(IN producto_id INT, IN almacen_id INT, IN fecha DATE)
BEGIN
    INSERT INTO ubicaciones (id_producto, id_almacen, fecha)
    VALUES (producto_id, almacen_id, fecha);
END$$

DELIMITER ;

-- al insertar productos aún no salta el trigger que he creado más adelante que automaticamente ubica correctamente en el almacén correspondiente dependiendo del número de inicio del id del producto

CALL insertar_producto_en_ubicacion(6006,5,'2024-05-21');


-- ======================================================================================================================


-- buscar la ubicacion de un producto por el id del producto:

DELIMITER $$
CREATE PROCEDURE ubicacion_por_producto(IN producto_id INT)
BEGIN
    SELECT * FROM ubicaciones WHERE id_producto = producto_id;
END$$
DELIMITER ;

CALL ubicacion_por_producto(2001);

-- ======================================================================================================================

# ELIMINAR UN PRODUCTO A PARTIR DEL ID

DELIMITER $$
DROP PROCEDURE IF EXISTS eliminar_producto;
CREATE PROCEDURE eliminar_producto(IN producto_id INT)
BEGIN
DELETE FROM ubicaciones WHERE id_producto = producto_id;
DELETE FROM productos WHERE id = producto_id;
END$$
DELIMITER ;

# PARA PROBAR EL PROCEDIMIENTO A PARTIR DE UN EJEMPLO PRIMERO HACEMOS LA CONSULTAS EN LA TABLA PRODUCTOS Y UBCICACIONES Y DESPUÉS LLAMAMOS AL PROCEDIMIENTO Y VOLVEMOS A EJECUTAR LAS CONSULTAS PARA COMPROBAR QUE SE HAN ELIMINADO LOS PRODUCTOS:

SELECT * FROM productos WHERE id = 6006;
SELECT * FROM ubicaciones WHERE id_producto = 6006;

CALL eliminar_producto(6006);

-- ======================================================================================================================

# ACTUALIZAR LA CANTIDAD DE UN PRODUCTO POR SU ID

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizar_cantidad_producto;
CREATE PROCEDURE actualizar_cantidad_producto(IN id_producto INT, IN nueva_cantidad INT)
BEGIN
    UPDATE productos
    SET cantidad = nueva_cantidad
    WHERE id = id_producto;
END$$
DELIMITER ;

select cantidad
FROM productos
WHERE id = 1003;

CALL actualizar_cantidad_producto(1003, 220);

-- ======================================================================================================================

                                                     -- TRIGGERS

#trigger para que ubique el producto en el almacén correspondiente dependiendo de como empiece el codigo del producto por si se equivoca el empleado al ubicar el producto como pasaba antes de crear este trigger

DELIMITER $$
DROP TRIGGER IF EXISTS asignar_ubicacion_producto;
CREATE TRIGGER asignar_ubicacion_producto
BEFORE INSERT ON ubicaciones
FOR EACH ROW
BEGIN
    DECLARE almacen_id INT;

    SET almacen_id = SUBSTRING(NEW.id_producto, 1, 1);

    IF almacen_id != NEW.id_almacen THEN
        SET NEW.id_almacen = almacen_id;
    END IF;
END $$;


DELIMITER ;
-- primero comprobamos que el producto no existe haciendo consultas en las tablas productos y ubicaciones
SELECT *
FROM productos
WHERE id = 6006;

SELECT *
FROM ubicaciones
WHERE id_producto = 6006;

-- ahora agregamos el producto usando el procedimiento apropiado:
CALL agregar_producto(6006, 'prueba', 50, 6001002);
-- por último insertamos el producto en un almacen erroneo (5) cuando debería ubicarse en el (6) y depues podemos comprobar usando las consultas anteriores como automaticamente lo ha agregado al almacén que corresponde (6):
CALL insertar_producto_en_ubicacion(6006, 1 , NOW());


-- ======================================================================================================================

#TRIGGER PARA QU LA FECHA EN QUE SE UBICA EL MATERIAL SIEMPRE SEA LA ACTUAL Y NO PUEDA SER MODIFICADA AL INGRESAR UN PRODUCTO

DELIMITER $$
CREATE TRIGGER fecha_ubicacion
BEFORE INSERT ON ubicaciones
FOR EACH ROW
BEGIN
    SET NEW.fecha = NOW();
END$$;

DELIMITER ;

-- agregamos un producto nuevo y lo insertamos en una ubicación con una fecha anterior a la actual, si ejecutamos la consulta siguiente para comprobar la ubicación del producto, la fecha cambia a la actual:

CALL agregar_producto(6009, 'prueba2', 25, 6001002);
CALL insertar_producto_en_ubicacion(6009, 6, '2020-05-10');

SELECT *
FROM ubicaciones
WHERE id_producto = 6009;


-- ======================================================================================================================


                                        -- VISTAS INTERESANTES:



-- vista para saber el número de productos que tiene cada almacen

CREATE VIEW numero_productos_por_almacen AS
SELECT almacenes.id AS id_almacen, almacenes.ubicacion, SUM(productos.cantidad) AS total_productos
FROM almacenes
JOIN empleados
ON almacenes.id = empleados.id_almacen
JOIN productos
ON empleados.id = productos.id_empleado
GROUP BY almacenes.id, almacenes.ubicacion
ORDER BY total_productos DESC;

-- vista productos ordenados por fecha de antiguedad

CREATE VIEW productos_por_antiguedad AS
SELECT productos.fabricante, productos.cantidad, ubicaciones.fecha
FROM almacenes
JOIN empleados ON almacenes.id = empleados.id_almacen
JOIN productos ON empleados.id = productos.id_empleado
JOIN ubicaciones ON productos.id = ubicaciones.id_producto
GROUP BY productos.fabricante, productos.cantidad, ubicaciones.fecha
ORDER BY ubicaciones.fecha;

-- vista empleados que más productos han movido:

CREATE VIEW empleados_mas_movimientos AS
SELECT empleados.id, empleados.categoria, empleados.puesto, SUM(productos.cantidad) AS total_productos
FROM empleados
JOIN productos ON empleados.id = productos.id_empleado
GROUP BY empleados.id
ORDER BY total_productos DESC;

-- inventario por fabricante

CREATE VIEW inventario_por_fabricante AS
SELECT fabricante, SUM(cantidad) AS total_cantidad
FROM productos
GROUP BY fabricante
ORDER BY total_cantidad DESC;



-- prodcutos que tienen menos de 100 unidades:

CREATE VIEW menos_100_unidades AS
SELECT id, fabricante, cantidad
FROM productos
WHERE cantidad < 100
ORDER BY cantidad ASC;






























