-- Creación de la tabla 'productos'
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(255),
    precio DECIMAL(10, 2)
    -- Otros campos según tus necesidades
);

-- Inserción de datos en la tabla 'productos'
INSERT INTO productos (id_producto, nombre, precio)
VALUES
    (1, 'Producto A', 20.99),
    (2, 'Producto B', 15.50),
    (3, 'Producto C', 25.75),
    (4, 'Producto D', 18.50),
    (5, 'Producto E', 30.25),
    (6, 'Producto F', 12.75),
    (7, 'Producto G', 22.99),
    (8, 'Producto H', 15.00),
    (9, 'Producto I', 28.50),
    (10, 'Producto J', 19.99),
    (11, 'Producto K', 10.50),
    (12, 'Producto L', 24.75),
    (13, 'Producto M', 16.50);

-- Creación de la tabla 'pedidos_detalle'
CREATE TABLE pedidos_detalle (
    id_pedido_detalle INT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT
    -- Otros campos según tus necesidades
);

-- Inserción de datos en la tabla 'pedidos_detalle'
INSERT INTO pedidos_detalle (id_pedido_detalle, id_pedido, id_producto, cantidad)
VALUES
    (1, 101, 1, 3),
    (2, 101, 2, 2),
    (3, 102, 1, 1),
    (4, 103, 3, 4),
    (5, 104, 4, 2),
    (6, 104, 5, 1),
    (7, 105, 6, 3),
    (8, 105, 7, 2),
    (9, 106, 8, 1),
    (10, 107, 9, 4),
    (11, 107, 10, 2),
    (12, 108, 11, 3),
    (13, 109, 12, 2),
    (14, 110, 13, 1);

-- Creación de la tabla 'vendedores'
CREATE TABLE vendedores (
    vendedor_id INT PRIMARY KEY,
    nombre VARCHAR(30),
    monto DECIMAL(10, 2)  -- Agregamos la columna "monto" para registrar el monto de ventas
);

-- Inserción de datos en la tabla de vendedores
INSERT INTO vendedores (vendedor_id, nombre, monto) VALUES (1, 'Pedro', 1500.00);
INSERT INTO vendedores (vendedor_id, nombre, monto) VALUES (2, 'Luisa', 2000.50);
INSERT INTO vendedores (vendedor_id, nombre, monto) VALUES (3, 'Miguel', 1800.75);
INSERT INTO vendedores (vendedor_id, nombre, monto) VALUES (4, 'Lucía', 2500.25);

-- Creación de la tabla 'ventas'
CREATE TABLE ventas (
    venta_id INT PRIMARY KEY,
    empleado_id INT,
    monto DECIMAL(10, 2)
);

-- Inserción de datos en la tabla de ventas
INSERT INTO ventas (venta_id, empleado_id, monto) VALUES (1, 1, 1500.00);
INSERT INTO ventas (venta_id, empleado_id, monto) VALUES (2, 2, 2000.50);
INSERT INTO ventas (venta_id, empleado_id, monto) VALUES (3, 3, 1800.75);
INSERT INTO ventas (venta_id, empleado_id, monto) VALUES (4, 1, 2500.25);
INSERT INTO ventas (venta_id, empleado_id, monto) VALUES (5, 2, 3000.00);
INSERT INTO ventas (venta_id, empleado_id, monto) VALUES (6, 3, 2200.50);
INSERT INTO ventas (venta_id, empleado_id, monto) VALUES (7, 1, 2800.75);
INSERT INTO ventas (venta_id, empleado_id, monto) VALUES (8, 2, 1950.25);

-- Creación de la tabla 'pedidos'
CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    monto INT,
    cliente_id INT
);

-- Inserción de datos en la tabla 'pedidos'
INSERT INTO pedidos (id, monto, cliente_id) VALUES 
(10, 3000, 1),
(20, 800, 1),
(30, 1500, 2),
(40, 2800, 3),
(50, 3200, 3),
(60, 400, 1);

-- Creación de la tabla 'clientes'
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(30)
);

-- Inserción de datos en la tabla 'clientes'
INSERT INTO clientes (cliente_id, nombre) VALUES (1, 'Juan');
INSERT INTO clientes (cliente_id, nombre) VALUES (2, 'María');
INSERT INTO clientes (cliente_id, nombre) VALUES (3, 'Carlos');
INSERT INTO clientes (cliente_id, nombre) VALUES (4, 'Ana');

-- Consulta para unir las tablas 'clientes' y 'pedidos'
SELECT clientes.cliente_id, clientes.nombre, pedidos.id, pedidos.monto
FROM clientes
INNER JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id;

SELECT clientes.nombre, pedidos.id, pedidos.monto
from clientes
left join pedidos on clientes.cliente_id = pedidos.cliente_id;

select clientes.nombre, pedidos.id, pedidos.monto
from clientes
right join pedidos on clientes.cliente_id = pedidos.cliente_id;

select clientes.cliente_id, clientes.nombre, pedidos.id, pedidos.monto
from clientes
full outer join pedidos on clientes.cliente_id = pedidos.cliente_id;





