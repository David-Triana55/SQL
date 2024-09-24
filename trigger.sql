USE banoverde;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    seccion VARCHAR(50) NOT NULL
);

CREATE TABLE historial_eliminacion (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    accion VARCHAR(50) NOT NULL,
    usuario_id VARCHAR(255) 
);

DELIMITER $$

CREATE TRIGGER trigger_db_clientes
AFTER DELETE ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO historial_eliminacion (fecha, accion, usuario_id)
    VALUES (NOW(), "se elimino un registro", USER());
END$$

DELIMITER ;

INSERT INTO clientes (nombre, seccion) VALUES 
('Juan Pérez', 'Ventas'),
('María Gómez', 'Marketing'),
('Carlos López', 'Recursos Humanos'),
('Ana Rodríguez', 'Finanzas'),
('Pedro Sánchez', 'Tecnología');

-- Eliminar un registro de la tabla clientes
DELETE FROM clientes WHERE id_cliente = 1;

-- Verificar los datos en la tabla historial_eliminacion
SELECT * FROM historial_eliminacion;

