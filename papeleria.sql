CREATE DATABASE papeleria;
USE papeleria;



CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono INT NOT NULL,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE facturas (
    id_factura INT NOT NULL AUTO_INCREMENT,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id_factura),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT,
    id_factura INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_venta),
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura)
);

CREATE TABLE categorias (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(60) NOT NULL,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE proveedores (
    id_proveedor INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono INT NOT NULL,
    PRIMARY KEY (id_proveedor)
);

CREATE TABLE productos (
    id_producto INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(60) NOT NULL,
    precio INT NOT NULL,
    id_categoria INT NOT NULL,
    id_proveedor INT NOT NULL,
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE ventas_productos (
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    PRIMARY KEY (id_venta, id_producto),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE datos_extra_cliente (
    id_cliente INT PRIMARY KEY,
    fecha_nacimiento DATE,
    email VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

INSERT INTO cliente (nombre, direccion, telefono) VALUES
('David', 'Dirección 1', 123456789),
('Juan', 'Dirección 2', 987654321),
('Sofia', 'Dirección 3', 456789123),
('Carlos', 'Dirección 4', 789123456),
('Ana', 'Dirección 5', 321654987);

INSERT INTO categorias (descripcion) VALUES
('Lapices'),
('Papel'),
('Carpetas'),
('Colores'),
('cuaderno');

INSERT INTO proveedores (nombre, direccion, telefono) VALUES
('Proveedor 1', 'Dirección 1', 123456789),
('Proveedor 2', 'Dirección 2', 987654321),
('Proveedor 3', 'Dirección 3', 456789123),
('Proveedor 4', 'Dirección 4', 789123456),
('Proveedor 5', 'Dirección 5', 321654987);

INSERT INTO productos (descripcion, precio, id_categoria, id_proveedor) VALUES
('Lapiz', 5, 1, 1),
('cuaderno', 20, 5, 2),
('color', 8, 4, 3),
('carpete', 12, 3, 4),
('hoja carta', 30, 2, 5);

INSERT INTO facturas (id_cliente) VALUES
(1),
(2),
(3),
(1),
(2);

INSERT INTO ventas (id_factura, cantidad) VALUES
(1, 5),
(2, 2),
(1, 3),
(3, 1),
(2, 4);


INSERT INTO ventas_productos (id_venta, id_producto) VALUES
(1, 1),
(2, 3),
(1, 2),
(3, 1),
(2, 2);

INSERT INTO datos_extra_cliente (id_cliente, fecha_nacimiento, email) VALUES
(1, '1990-05-15', 'maria@example.com'),
(2, '1985-09-20', 'jose@example.com'),
(3, '1992-03-10', 'sara@example.com'),
(4, '1988-11-25', 'juan@example.com'),
(5, '1995-07-02', 'santiago@example.com');


SELECT * FROM cliente;
SELECT * FROM categorias;
SELECT * FROM productos;
SELECT * FROM proveedores;
SELECT * FROM facturas;
SELECT * FROM ventas;
SELECT * FROM ventas_productos;

SELECT * FROM datos_extra_cliente;
