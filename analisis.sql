-- =========================================================================
-- PROYECTO CAPSTONE: ANÁLISIS EXPLORATORIO DE DATOS (EDA)
-- Motor: PostgreSQL
-- =========================================================================

-- 1. Inspeccionar las tablas principales
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM pedidos;

-- 2. Auditoría de Valores Nulos (Limpieza de datos)
SELECT producto_id, nombre_producto, categoria, precio
FROM productos
WHERE precio IS NULL;

SELECT pedido_id, cliente_id, producto_id, cantidad, fecha_pedido, monto_total
FROM pedidos
WHERE monto_total IS NULL;

-- 3. Análisis con JOINs (Detalle de transacciones)
SELECT 
    p.pedido_id,
    c.nombre AS cliente,
    c.ciudad,
    pr.nombre_producto,
    pr.categoria,
    p.cantidad,
    p.monto_total,
    p.fecha_pedido
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
JOIN productos pr ON p.producto_id = pr.producto_id;

-- 4. Métricas y Agregaciones de Negocio
-- Ventas totales por categoría
SELECT 
    pr.categoria,
    SUM(p.monto_total) AS ventas_totales,
    COUNT(p.pedido_id) AS cantidad_pedidos
FROM pedidos p
JOIN productos pr ON p.producto_id = pr.producto_id
GROUP BY pr.categoria
ORDER BY ventas_totales DESC;

-- Gasto total por cliente
SELECT 
    c.nombre AS cliente,
    c.ciudad,
    COUNT(p.pedido_id) AS total_pedidos,
    SUM(p.monto_total) AS gasto_total
FROM clientes c
LEFT JOIN pedidos p ON c.cliente_id = p.cliente_id
GROUP BY c.cliente_id, c.nombre, c.ciudad
ORDER BY gasto_total DESC NULLS LAST;