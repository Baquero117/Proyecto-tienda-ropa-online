CREATE DATABASE Siro1;
USE Siro1;

CREATE TABLE Cliente (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(30) Not Null,
    apellido VARCHAR(50) Not Null,
    fecha_registro DATE Not Null,
    contrasena VARCHAR(10) Not Null,
    direccion VARCHAR(100) Not Null,
    telefono VARCHAR(10) Not Null,
    correo_electronico VARCHAR(100) Not Null
	);


CREATE TABLE Detalle_Carrito (
    id_detalle_carrito INT IDENTITY(1,1) PRIMARY KEY,
    cantidad INT Not Null,
    id_cliente INT Not Null,
    fecha_creacion DATE Not Null,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) 
);


CREATE TABLE Categoria (
    id_categoria INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(30) Not Null,
    descripcion TEXT Not Null
);


CREATE TABLE Promocion (
    id_promocion INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(30) Not Null,
    descripcion TEXT Not Null,
    tipo VARCHAR(25) Not Null,
    valor DECIMAL(5,2) Not Null,
    fecha_inicio DATE Not Null,
    fecha_fin DATE Not Null,
    estado VARCHAR(20) Not Null
);


CREATE TABLE Producto (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    descripcion TEXT Not Null,
    fecha_de_creacion DATE Not Null,
    nombre VARCHAR(30) Not Null,
    estado VARCHAR(20) Not Null,
    imagen VARBINARY(MAX) Not Null,
    stock INT Not Null,
    precio DECIMAL(5,5) Not Null,
    id_promocion INT FOREIGN KEY REFERENCES Promocion(id_promocion) Not Null,
    id_categoria INT FOREIGN KEY REFERENCES Categoria(id_categoria) Not Null
);


CREATE TABLE Pedido (
    id_pedido INT IDENTITY(1,1) PRIMARY KEY,
    monto_total DECIMAL(5,5) Not Null,
    fecha DATE Not Null,
    comentario TEXT Not Null,
    estado_pedido VARCHAR(30) Not Null,
    detalle_carrito INT FOREIGN KEY REFERENCES Detalle_Carrito(id_detalle_carrito) Not Null
);


CREATE TABLE Carrito (
    id_carrito INT IDENTITY(1,1) PRIMARY KEY,
    id_detalle_carrito INT,
    id_producto INT,
    id_pedido INT,
    FOREIGN KEY (id_detalle_carrito) REFERENCES Detalle_Carrito(id_detalle_carrito),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);


CREATE TABLE Vendedor (
    id_vendedor INT IDENTITY(1,1) PRIMARY KEY,
    correo VARCHAR(100) Not Null,
    contrasena VARCHAR(10) Not Null,
    telefono VARCHAR(12) Not Null
);


CREATE TABLE Entrada_Producto (
    id_entrada INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE Not Null,
    descripcion TEXT Not Null,
    entrada INT Not Null,
    cantidad INT Not Null,
    id_producto INT FOREIGN KEY REFERENCES Producto(id_producto) Not Null,
    id_vendedor INT FOREIGN KEY REFERENCES Vendedor(id_vendedor) Not Null
);


CREATE TABLE Valoracion (
    id_valoracion INT IDENTITY(1,1) PRIMARY KEY,
    comentarios TEXT Not Null,
    calificacion INT CHECK (calificacion BETWEEN 1 AND 5) Not Null,
    id_cliente INT FOREIGN KEY REFERENCES Cliente(id_cliente) Not Null,
    id_producto INT FOREIGN KEY REFERENCES Producto(id_producto) Not Null
);


INSERT INTO Cliente (nombre, apellido, fecha_registro, contrasena, direccion, telefono, correo_electronico) VALUES
  ('Nombre1', 'Apellido1', '2025-01-05', 'Stiven123', 'calle 11 sur #11b 11 Este', '3240000001', 'cliente1@gmail.com'),
  ('Nombre2', 'Apellido2', '2025-01-06', 'Baquero123', 'calle 22 sur #22b 22 Este', '3240000002', 'cliente2@gmail.com'),
  ('Nombre3', 'Apellido3', '2025-01-07', 'William123', 'calle 33 sur #33b 33 Este', '3240000003', 'cliente3@gmail.com');

INSERT INTO Vendedor (correo, contrasena, telefono) VALUES
  ('vendedor1@gmail.com', 'pass1', '1000000001'),
  ('vendedor2@gmail.com', 'pass2', '2000000002'),
  ('vendedor3@gmail.com', 'pass3', '3000000003');

INSERT INTO Detalle_Carrito (cantidad, id_cliente, fecha_creacion) VALUES
  (2, 1, '2025-02-10'),
  (1, 2, '2025-02-11'),
  (3, 3, '2025-02-12');

INSERT INTO Categoria (nombre, descripcion) VALUES
  ('Categoria1', 'Descripcion1'),
  ('Categoria2', 'Descripcion2'),
  ('Categoria3', 'Descripcion3');

INSERT INTO Promocion (nombre, descripcion, tipo, valor, fecha_inicio, fecha_fin, estado) VALUES
  ('Promocion1', 'DescripcionPromo1', 'Tipo1', 10.00, '2025-01-01', '2025-12-31', 'Activo'),
  ('Promocion2', 'DescripcionPromo2', 'Tipo2', 15.50, '2025-02-01', '2025-12-31', 'Activo'),
  ('Promocion3', 'DescripcionPromo3', 'Tipo3', 20.00, '2025-03-01', '2025-12-31', 'Activo');

INSERT INTO Producto (descripcion, fecha_de_creacion, nombre, estado, imagen, stock, precio, id_promocion, id_categoria) VALUES
  ('DescripcionProd1', '2025-02-01', 'Producto1', 'Activo', 0x, 100, 0.10000, 1, 1),
  ('DescripcionProd2', '2025-02-02', 'Producto2', 'Activo', 0x, 200, 0.20000, 2, 2),
  ('DescripcionProd3', '2025-02-03', 'Producto3', 'Activo', 0x, 300, 0.30000, 3, 3);

INSERT INTO Pedido (monto_total, fecha, comentario, estado_pedido, detalle_carrito) VALUES
  (0.50000, '2025-02-15', 'Comentario1', 'Procesando', 1),
  (0.70000, '2025-02-16', 'Comentario2', 'Procesando', 2),
  (0.90000, '2025-02-17', 'Comentario3', 'Procesando', 3);

INSERT INTO Carrito (id_detalle_carrito, id_producto, id_pedido) VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3);

INSERT INTO Entrada_Producto (fecha, descripcion, entrada, cantidad, id_producto, id_vendedor) VALUES
  ('2025-02-20', 'EntradaProd1', 1, 50, 1, 1),
  ('2025-02-21', 'EntradaProd2', 1, 60, 2, 2),
  ('2025-02-22', 'EntradaProd3', 1, 70, 3, 3);

INSERT INTO Valoracion (comentarios, calificacion, id_cliente, id_producto) VALUES
  ('ComentarioVal1', 5, 1, 1),
  ('ComentarioVal2', 4, 2, 2),
  ('ComentarioVal3', 3, 3, 3);


  -- Cambiar registros de tablas

  -- Categoria
UPDATE Categoria
SET nombre = 'Busos', descripcion = 'Algodon perchado 100%, Tallas S, M y L'
WHERE id_categoria = 1;

UPDATE Categoria
SET nombre = 'camisetas', descripcion = 'Algodon perchado 100%, Tallas S, M y L'
WHERE id_categoria = 2;

UPDATE Categoria
SET nombre = 'medias', descripcion = 'Algodon perchado 100%, Tallas S, M y L'
WHERE id_categoria = 3;


UPDATE Categoria
SET nombre = 'medias', descripcion = 'Algodon perchado 100%, Tallas S, M y L'
WHERE id_categoria = 3;


  -- Alterar tabla

ALTER TABLE Promocion
ALTER COLUMN valor DECIMAL(8,2) NOT NULL;


  -- Promocion
UPDATE Promocion
SET tipo = '2x1', valor = 105000.00
WHERE id_promocion = 1;

UPDATE Promocion
SET tipo = '50% de descuento', valor = 52500.00
WHERE id_promocion = 2;

UPDATE Promocion
SET tipo = '25% de descuento', valor = 26250.00
WHERE id_promocion = 3;


  -- Consultas
  -- Mostrar los productos con su categoría y promoción activa

SELECT 
    p.nombre AS NombreProducto,
    c.nombre AS Categoria,
    pr.nombre AS Promocion,
    pr.valor AS Descuento,
    pr.estado
FROM Producto p
JOIN Categoria c ON p.id_categoria = c.id_categoria
JOIN Promocion pr ON p.id_promocion = pr.id_promocion
WHERE pr.estado = 'Activa';




--Historial de pedidos de un cliente (detalle + estado del pedido) 


SELECT 
    cl.nombre + ' ' + cl.apellido AS Cliente,
    pe.id_pedido AS CodigoPedido,
    pe.fecha AS FechaPedido,
    pe.estado_pedido AS Estado,
    pe.monto_total AS Total,
    pr.nombre AS Producto,
    ca.id_carrito AS Detalle
FROM Cliente cl
JOIN Detalle_Carrito dc ON cl.id_cliente = dc.id_cliente
JOIN Pedido pe ON dc.id_detalle_carrito = pe.detalle_carrito
JOIN Carrito ca ON pe.id_pedido = ca.id_pedido
JOIN Producto pr ON ca.id_producto = pr.id_producto
WHERE cl.id_cliente = 1;


--Resumen del carrito actual (detalle del pedido antes de pagar)

SELECT 
    cl.nombre + ' ' + cl.apellido AS Cliente,
    p.nombre AS Producto,
    p.precio AS PrecioUnitario,
    dc.cantidad AS Cantidad,
    (p.precio * dc.cantidad) AS Subtotal
FROM Carrito c
JOIN Detalle_Carrito dc ON c.id_detalle_carrito = dc.id_detalle_carrito
JOIN Cliente cl ON dc.id_cliente = cl.id_cliente
JOIN Producto p ON c.id_producto = p.id_producto
WHERE cl.id_cliente = 1;


--Valoraciones de productos (comentarios y calificaciones)


SELECT 
    p.nombre AS Producto,
    v.calificacion AS Calificacion,
    v.comentarios AS Comentario,
    cl.nombre + ' ' + cl.apellido AS Cliente
FROM Valoracion v
JOIN Cliente cl ON v.id_cliente = cl.id_cliente
JOIN Producto p ON v.id_producto = p.id_producto
ORDER BY p.nombre, v.calificacion DESC;


--Stock bajo (alerta de productos por reabastecer)

SELECT 
    p.nombre AS Producto,
    p.stock AS StockActual,
    c.nombre AS Categoria,
    v.id_vendedor AS VendedorResponsable
FROM Producto p
JOIN Categoria c ON p.id_categoria = c.id_categoria
JOIN Entrada_Producto ep ON p.id_producto = ep.id_producto
JOIN Vendedor v ON ep.id_vendedor = v.id_vendedor
WHERE p.stock < 50
GROUP BY p.nombre, p.stock, c.nombre, v.id_vendedor;