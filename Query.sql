USE papeleria;
-- primera consulta
SELECT * FROM cliente;
-- segunda consulta
SELECT cliente.id_cliente, nombre, direccion, telefono , facturas.id_factura
FROM cliente
INNER JOIN facturas
ON cliente.id_cliente = facturas.id_cliente
WHERE cliente.id_cliente = 1
ORDER BY facturas.id_factura desc;
-- tercera consulta
SELECT productos.id_producto, proveedores.id_proveedor, productos.descripcion, precio 
FROM productos
INNER JOIN proveedores
ON productos.id_proveedor = proveedores.id_proveedor;

-- cuarta consulta

SELECT * FROM productos;

SELECT categorias.id_categoria, productos.id_producto, productos.descripcion, precio 
FROM categorias
INNER JOIN productos
ON categorias.id_categoria = productos.id_categoria;

-- quinta consulta
select * from cliente;

SELECT ventas.id_venta, cliente.id_cliente, cliente.nombre, cliente.direccion, cliente.telefono 
FROM ventas
INNER JOIN facturas ON ventas.id_factura = facturas.id_factura
INNER JOIN cliente On facturas.id_cliente = cliente.id_cliente;

-- sexta consulta 

SELECT id_proveedor, nombre, telefono FROM proveedores;

-- septima consulta


SELECT * 
FROM cliente;

SELECT datos_extra_cliente.id_cliente, datos_extra_cliente.fecha_nacimiento, datos_extra_cliente.email, cliente.nombre, cliente.direccion , cliente.telefono
FROM datos_extra_cliente
INNER JOIN cliente
ON datos_extra_cliente.id_cliente = cliente.id_cliente;

-- octava consulta

SELECT * 
FROM cliente 
WHERE nombre 
LIKE 'a%'; 

-- novena consulta

select precio, descripcion from productos;

-- decima consulta

SELECT * 
FROM facturas 
ORDER BY fecha;
