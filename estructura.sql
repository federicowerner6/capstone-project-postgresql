-- =========================================================================
-- PROYECTO CAPSTONE: ESTRUCTURA DE LA BASE DE DATOS Y CARGA DE DATOS
-- Motor: PostgreSQL
-- =========================================================================

-- Paso 1: Crear la base de datos (Ejecutar esta línea de manera independiente si es necesario)
-- CREATE DATABASE capstone_project;

-- Conectarse a la base de datos 'capstone_project' antes de ejecutar el siguiente bloque.

-- Paso 2: Eliminación de tablas previas (en orden inverso por las FK) si existen
DROP TABLE IF EXISTS pedidos CASCADE;
DROP TABLE IF EXISTS productos CASCADE;
DROP TABLE IF EXISTS clientes CASCADE;

-- Paso 3: Creación de la tabla de Clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL
);

-- Paso 4: Creación de la tabla de Productos
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(150) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio NUMERIC(10, 2) -- Permite valores NULL para evaluar la limpieza de datos
);

-- Paso 5: Creación de la tabla de Pedidos (Transacciones)
CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    monto_total NUMERIC(10, 2), -- Permite valores NULL para la validación de nulos
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    CONSTRAINT fk_producto FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Paso 6: Inserción de Datos de Ejemplo (Semilla)
INSERT INTO clientes (nombre, email, ciudad, fecha_registro) VALUES
('Ana Gómez', 'ana.gomez@email.com', 'Buenos Aires', '2025-01-15'),
('Carlos Ruiz', 'carlos.ruiz@email.com', 'Córdoba', '2025-02-10'),
('Lucía Fernández', 'lucia.f@email.com', 'Rosario', '2025-03-05'),
('Martín Gómez', 'martin.g@email.com', 'Mendoza', '2025-03-20'),
('Sofía Benítez', 'sofia.b@email.com', 'Mar del Plata', '2025-04-12'),
('Javier Morales', 'javier.m@email.com', 'La Plata', '2025-05-01');

INSERT INTO productos (nombre_producto, categoria, precio) VALUES
('Notebook Gamer X', 'Tecnología', 1200.00),
('Auriculares Bluetooth Pro', 'Tecnología', 150.00),
('Mouse Ergonómico RGB', 'Tecnología', 45.00),
('Silla de Oficina Ejecutiva', 'Muebles', 250.00),
('Escritorio Minimalista', 'Muebles', 180.00),
('Cafetera Automática', 'Hogar', NULL), -- Producto con precio nulo para limpiar
('Lámpara de Escritorio LED', 'Hogar', 35.00);

INSERT INTO pedidos (cliente_id, producto_id, cantidad, fecha_pedido, monto_total) VALUES
(1, 1, 1, '2025-06-10', 1200.00),
(1, 3, 2, '2025-06-12', 90.00),
(2, 2, 1, '2025-06-15', 150.00),
(3, 4, 1, '2025-07-02', 250.00),
(3, 5, 1, '2025-07-10', 180.00),
(4, 2, 3, '2025-08-05', 450.00),
(5, 6, 1, '2025-08-20', NULL), -- Pedido con monto nulo para validar limpieza
(5, 7, 2, '2025-09-01', 70.00),
(2, 3, 4, '2025-09-15', 180.00),
(6, 7, 1, '2025-10-01', 35.00);