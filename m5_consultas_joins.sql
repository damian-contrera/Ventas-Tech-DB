USE Ventas_TECH_DB;
GO

-- ============================================================================
-- CONSULTA 1 — VISTA BASE DEL PROYECTO (INNER JOIN)
-- ============================================================================

SELECT 
    v.Fecha_venta,
    v.id_cliente,
    c.Nombre_cliente,
    v.id_producto,
    p.Descripción AS Producto,
    v.Total_venta
FROM Ventas AS v
INNER JOIN Clientes AS c 
    ON v.id_cliente = c.id_cliente
INNER JOIN Productos AS p 
    ON v.id_producto = p.id_producto;
GO

-- ============================================================================
-- CONSULTA 2 — CLIENTES SIN VENTAS (LEFT JOIN)
-- ============================================================================
-- Identifica clientes registrados que no figuran en la tabla de ventas.
-- ============================================================================
SELECT 
    c.id_cliente,
    c.Nombre_cliente
FROM Clientes AS c
LEFT JOIN Ventas AS v 
    ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL;
GO

-- ============================================================================
-- CONSULTA 3 — PRODUCTOS SIN VENTAS (LEFT JOIN)
-- ============================================================================
-- Identifica productos del catálogo que no tienen registros en ventas.
-- ============================================================================
SELECT 
    p.id_producto,
    p.Descripción AS Producto
FROM Productos AS p
LEFT JOIN Ventas AS v 
    ON p.id_producto = v.id_producto
WHERE v.id_producto IS NULL;
GO

-- ============================================================================
-- CONSULTA 4 — CONSOLIDADO POR CANAL (UNION ALL)
-- ============================================================================

SELECT 
    Fecha_venta,
    Total_venta,
    'Online' AS Canal
FROM Ventas
WHERE Total_venta > 1000 -- Criterio de ejemplo adaptado a tus datos

UNION ALL

SELECT 
    Fecha_venta,
    Total_venta,
    'Presencial' AS Canal
FROM Ventas
WHERE Total_venta <= 1000; -- Criterio de ejemplo adaptado a tus datos
GO