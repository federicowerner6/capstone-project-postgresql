-- =====================================================================
-- PROYECTO CAPSTONE: ANÁLISIS DE DATOS CON POSTGRESQL
-- Archivo: analisis.sql
-- Descripción: Limpieza con COALESCE, consultas de negocio y Window Functions
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1. TOP 5 CLIENTES POR GASTO TOTAL
-- ---------------------------------------------------------------------
-- Objetivo de negocio: Identificar al 5% de clientes más valiosos (regla de Pareto) 
-- para enfocar campañas de fidelización y beneficios exclusivos.
-- Aplicamos COALESCE para evitar sesgos por montos nulos en pedidos incompletos.
SELECT 
    c.cliente_id,
    c.nombre,
    COUNT(p.pedido_id) AS total_pedidos,
    SUM(COALESCE(p.monto_total, 0.00)) AS gasto_total
FROM clientes c
LEFT JOIN pedidos p ON c.cliente_id = p.cliente_id
GROUP BY c.cliente_id, c.nombre
ORDER BY gasto_total DESC
LIMIT 5;


-- ---------------------------------------------------------------------
-- 2. VENTAS TOTALES POR MES
-- ---------------------------------------------------------------------
-- Objetivo de negocio: Detectar estacionalidad y meses de baja facturación 
-- para planificar descuentos estratégicos o campañas de pauta publicitaria.
SELECT 
    DATE_TRUNC('month', p.fecha_pedido)::DATE AS mes,
    COUNT(p.pedido_id) AS cantidad_pedidos,
    SUM(COALESCE(p.monto_total, 0.00)) AS facturacion_mensual
FROM pedidos p
WHERE p.fecha_pedido IS NOT NULL
GROUP BY DATE_TRUNC('month', p.fecha_pedido)
ORDER BY mes ASC;


-- ---------------------------------------------------------------------
-- 3. LOS 3 PRODUCTOS MENOS VENDIDOS
-- ---------------------------------------------------------------------
-- Objetivo de negocio: Detectar inventario estancado o productos con bajo rendimiento 
-- comercial para evaluar liquidaciones de stock o reemplazo de catálogo.
SELECT 
    pr.producto_id,
    pr.nombre_producto,
    COALESCE(pr.precio, 0.00) AS precio_unitario,
    COUNT(p.pedido_id) AS unidades_vendidas
FROM productos pr
LEFT JOIN pedidos p ON pr.producto_id = p.producto_id
GROUP BY pr.producto_id, pr.nombre_producto, pr.precio
ORDER BY unidades_vendidas ASC, precio_unitario DESC
LIMIT 3;


-- ---------------------------------------------------------------------
-- 4. RANKING DE PEDIDOS POR CATEGORÍA (Window Function)
-- ---------------------------------------------------------------------
-- Objetivo de negocio: Analizar qué transacciones destacan dentro de cada categoría 
-- de producto utilizando particiones lógicas sin perder el detalle operativo.
SELECT 
    p.pedido_id,
    pr.categoria,
    pr.nombre_producto,
    COALESCE(p.monto_total, 0.00) AS monto_pedido,
    RANK() OVER (PARTITION BY pr.categoria ORDER BY COALESCE(p.monto_total, 0.00) DESC) AS ranking_en_categoria
FROM pedidos p
JOIN productos pr ON p.producto_id = pr.producto_id;
