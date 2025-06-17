CREATE DATABASE Siro;
USE Siro;

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

CREATE TABLE Carrito (
    id_carrito INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT FOREIGN KEY REFERENCES Cliente(id_cliente) Not Null
);


CREATE TABLE Categoria (
    id_categoria INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(30) Not Null,
    descripcion TEXT Not Null,
	color VARCHAR(20) Not Null
);


CREATE TABLE Promocion (
    id_promocion INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(30) Not Null,
    descripcion TEXT Not Null,
    tipo VARCHAR(25) Not Null,
    valor DECIMAL(5,2) Not Null,
    fecha_inicio DATE Not Null,
    fecha_fin DATE Not Null
);


CREATE TABLE Producto (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    descripcion TEXT Not Null,
    fecha_de_adicion DATE Not Null,
    nombre VARCHAR(30) Not Null,
    estado VARCHAR(20) Not Null,
    imagen VARBINARY(MAX) Not Null,
    stock INT Not Null,
    precio DECIMAL(5,5) Not Null,
    id_promocion INT FOREIGN KEY REFERENCES Promocion(id_promocion) Not Null,
    id_categoria INT FOREIGN KEY REFERENCES Categoria(id_categoria) Not Null
);


CREATE TABLE Detalle_Carrito (
    id_detalle_carrito INT IDENTITY(1,1) PRIMARY KEY,
    cantidad INT Not Null,
    id_producto INT FOREIGN KEY REFERENCES Producto(id_producto) Not Null,
    id_carrito INT FOREIGN KEY REFERENCES Carrito(id_carrito) Not Null,
    historial_compras TEXT Not Null,
    total DECIMAL(5,5) Not Null
);


CREATE TABLE Pedido (
    id_pedido INT IDENTITY(1,1) PRIMARY KEY,
    monto_total DECIMAL(5,5) Not Null,
    fecha DATE Not Null,
    comentario TEXT Not Null,
    estado_pedido VARCHAR(30) Not Null,
    detalle_carrito INT FOREIGN KEY REFERENCES Detalle_Carrito(id_detalle_carrito) Not Null
);


CREATE TABLE Vendedor (
    id_vendedor INT IDENTITY(1,1) PRIMARY KEY,
	nombre VARCHAR(50) Mot Null,
	apellido VARCHAR(50) Not Null,
    correo VARCHAR(100) Not Null,
    contrasena VARCHAR(10) Not Null,
    telefono VARCHAR(12) Not Null
);


CREATE TABLE Registro_Producto (
    id_regitro_producto INT IDENTITY(1,1) PRIMARY KEY,
    fecha_de_entrada DATE Not Null,
    descripcion TEXT Not Null,
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


